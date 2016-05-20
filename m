Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1666AE00D6E; Fri, 20 May 2016 07:55:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9FC6E00CD9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 May 2016 07:55:13 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4KEtCPs021441
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 May 2016 07:55:12 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 20 May 2016 07:55:11 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Fri, 20 May 2016 10:55:11 -0400
Message-ID: <1463756111-12340-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] go-native: don't use host /var/tmp for temp build artifacts
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 20 May 2016 14:55:17 -0000
Content-Type: text/plain

Similar to a recent change for go-cross we can potentially run in to a
build failure:

  go tool dist: mkdtemp(/var/tmp/go-cbuild-A0rrP5): No such file or directory

when the host doesn't have a /var/tmp or when the permissions don't
allow for the creation of the temporary directory. Instead of relying
on /var/tmp we create and use a temporary directory in the $WORKDIR to
work around this issue. This is passed to the build via the TMPDIR
environment variable.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-devtools/go-cross/go-native.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-devtools/go-cross/go-native.inc b/recipes-devtools/go-cross/go-native.inc
index ae3dc83..e431b48 100644
--- a/recipes-devtools/go-cross/go-native.inc
+++ b/recipes-devtools/go-cross/go-native.inc
@@ -11,6 +11,10 @@ do_compile() {
     export GOBIN="${B}/bin"
     rm -rf ${GOBIN}
     mkdir ${GOBIN}
+
+    export TMPDIR=${WORKDIR}/build-tmp
+    mkdir ${WORKDIR}/build-tmp
+
     cd src
     ./make.bash --host-only
 }
-- 
2.1.4


