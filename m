Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68743E00B48; Fri, 13 May 2016 12:07:52 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 928C1E00AD2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 May 2016 12:07:48 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4DJ7lY0000757
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 May 2016 12:07:47 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 13 May 2016 12:07:46 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Fri, 13 May 2016 15:07:46 -0400
Message-ID: <1463166466-26378-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] go-cross: don't use host /var/tmp for temporary build artifacts
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
X-List-Received-Date: Fri, 13 May 2016 19:07:52 -0000
Content-Type: text/plain

The default behavior for go-cross build is to use the path specified
in TMPDIR for some temporary build artifacts and if no TMPDIR is set
in the environment to fallback to use /var/tmp. This causes a build
failure on hosts that do not have a /var/tmp or that have restrictive
permissions on /var/tmp. The failure is seen as:

  go tool dist: mkdtemp(/var/tmp/go-cbuild-yhmNbi): No such file or directory

By setting TMPDIR and ensuring we create this
directory we can avoid the associated issue with using the default.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-devtools/go-cross/go-cross.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-devtools/go-cross/go-cross.inc b/recipes-devtools/go-cross/go-cross.inc
index eea1b2c..cd75b40 100644
--- a/recipes-devtools/go-cross/go-cross.inc
+++ b/recipes-devtools/go-cross/go-cross.inc
@@ -17,9 +17,13 @@ CC = "${@d.getVar('BUILD_CC', True).strip()}"
 do_configure[noexec] = "1"
 
 do_compile() {
-    export GOBIN="${B}/bin"
+    export GOBIN="${B}/bin"    
     rm -rf ${GOBIN} ${B}/pkg
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


