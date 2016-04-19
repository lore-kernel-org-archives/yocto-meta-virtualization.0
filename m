Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C66B6E00D26; Mon, 18 Apr 2016 21:35:30 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9DA36E00C64
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Apr 2016 21:35:27 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3J4ZQjP006672
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Apr 2016 21:35:26 -0700 (PDT)
Received: from PEK-ZHE-D1.wrs.com (128.224.162.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Apr 2016 21:35:25 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 19 Apr 2016 12:34:59 +0800
Message-ID: <1461040499-31037-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] openvswitch: ptest: Fix python path
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
X-List-Received-Date: Tue, 19 Apr 2016 04:35:30 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Set PYTHON to TARGET_PYTHON for running on target

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 .../openvswitch-ptest-Fix-python-path.patch        | 30 ++++++++++++++++++++++
 recipes-networking/openvswitch/openvswitch_git.bb  |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/openvswitch-ptest-Fix-python-path.patch

diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-ptest-Fix-python-path.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-ptest-Fix-python-path.patch
new file mode 100644
index 0000000..c75ebc5
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/openvswitch-ptest-Fix-python-path.patch
@@ -0,0 +1,30 @@
+From 2a78bddb865e0d3377f437428ed6825195af0a14 Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Wed, 13 Apr 2016 03:13:01 -0400
+Subject: [PATCH] openvswitch: ptest: Fix python path
+
+For now PYTHON just happens to be the same as TARGET_PYTHON so we get the right
+python binary. This patch sets PYTHON to TARGET_PYTHON since ptest is going to
+be run on target.
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ tests/atlocal.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/atlocal.in b/tests/atlocal.in
+index 5815c6c..db2d2c9 100644
+--- a/tests/atlocal.in
++++ b/tests/atlocal.in
+@@ -5,7 +5,7 @@ EGREP='@EGREP@'
+ PERL='@PERL@'
+ 
+ if test x"$PYTHON" = x; then
+-    PYTHON='@PYTHON@'
++    PYTHON='@TARGET_PYTHON@'
+ fi
+ 
+ PYTHONPATH=$abs_top_srcdir/python:$abs_top_builddir/tests:$PYTHONPATH
+-- 
+1.9.1
+
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 2f7fe3e..b46d5af 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -24,6 +24,7 @@ SRC_URI += "\
 	file://run-ptest \
 	file://disable_m4_check.patch \
 	file://kernel_module.patch \
+	file://openvswitch-ptest-Fix-python-path.patch \
 	"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=247d8817aece26b21a8cd6791b3ea994"
-- 
2.8.1


