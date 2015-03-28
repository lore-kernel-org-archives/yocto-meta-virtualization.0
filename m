Return-Path: <jason.wessel@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C387EE0096D; Sat, 28 Mar 2015 13:07:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3DC5E00858
	for <meta-virtualization@yoctoproject.org>;
	Sat, 28 Mar 2015 13:07:20 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t2SK7KU3015094
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 28 Mar 2015 13:07:20 -0700 (PDT)
Received: from ord-jrw-virt2.wrs.com (172.25.59.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Sat, 28 Mar 2015 13:07:19 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Sat, 28 Mar 2015 15:07:18 -0500
Message-ID: <1427573238-1021-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] golang-cross: disable CCACHE support for golang-cross
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
X-List-Received-Date: Sat, 28 Mar 2015 20:07:26 -0000
Content-Type: text/plain

The ccache on some hosts will cause the golang-cross package to fail
with the error:

| cmd/fix
| cmd/yacc
| runtime/cgo
| go build runtime/cgo: no buildable Go source files in /proj/bitbake_build/tmp/work/x86_64-wrs-linux/golang-cross/1.3-r0/go/src/pkg/runtime/cgo
| WARNING: /proj/bitbake_build/tmp/work/x86_64-wrs-linux/golang-cross/1.3-r0/temp/do_compile/run.do_compile.14152:1 exit 1 from
|   sh -x ./make.bash
| ERROR: Function failed: do_compile

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 recipes-devtools/go/golang-cross_1.3.bb |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-devtools/go/golang-cross_1.3.bb b/recipes-devtools/go/golang-cross_1.3.bb
index 8813298..6d538f9 100644
--- a/recipes-devtools/go/golang-cross_1.3.bb
+++ b/recipes-devtools/go/golang-cross_1.3.bb
@@ -1,3 +1,7 @@
 inherit cross
+
+# CCACHE does not work properly with GO
+CCACHE = ""
+
 require golang-cross.inc
 require golang-${PV}.inc
-- 
1.7.9.5


