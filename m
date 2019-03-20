Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ACE91E00D21; Tue, 19 Mar 2019 23:34:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42A3AE00CE5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Mar 2019 23:34:28 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2K6YPVo024073
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Mar 2019 23:34:25 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 19 Mar 2019 23:34:24 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@yoctoproject.org>
Date: Tue, 19 Mar 2019 23:34:26 -0700
Message-ID: <20190320063426.82963-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] irqbalance: uprev to v1.5.0
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
X-List-Received-Date: Wed, 20 Mar 2019 06:34:29 -0000
Content-Type: text/plain

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 .../irqbalance/fix-configure-libcap-ng.patch  | 29 -------------------
 ...rqbalance_1.4.0.bb => irqbalance_1.5.0.bb} |  5 ++--
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch
 rename recipes-extended/irqbalance/{irqbalance_1.4.0.bb => irqbalance_1.5.0.bb} (64%)

diff --git a/recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch b/recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch
deleted file mode 100644
index fb22d7a..0000000
--- a/recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 20a1b2ff2e6d80924824983c363c80f66e05c0d0 Mon Sep 17 00:00:00 2001
-From: Ming Liu <ming.liu@windriver.com>
-Date: Sun, 6 Sep 2015 14:43:24 +0800
-Subject: [PATCH] grasp withval for libcap-ng
-
-Upstream-Status: Pending
-
-Signed-off-by: Ming Liu <ming.liu@windriver.com>
-
----
- configure.ac | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 38a1bee..95f1488 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -62,7 +62,10 @@ AS_IF(
- ])
- 
- AC_ARG_WITH([libcap-ng],
--  AS_HELP_STRING([libcap-ng], [Add libcap-ng-support @<:@default=auto@:>@]))
-+  [AS_HELP_STRING([libcap-ng], [Add libcap-ng-support @<:@default=auto@:>@])],
-+  [libcap_ng=$withval],
-+  [libcap_ng=$withval]
-+)
- 
- AS_IF(
-   [test "x$libcap_ng" != "xno"],
diff --git a/recipes-extended/irqbalance/irqbalance_1.4.0.bb b/recipes-extended/irqbalance/irqbalance_1.5.0.bb
similarity index 64%
rename from recipes-extended/irqbalance/irqbalance_1.4.0.bb
rename to recipes-extended/irqbalance/irqbalance_1.5.0.bb
index 1aee7ca..f73b106 100644
--- a/recipes-extended/irqbalance/irqbalance_1.4.0.bb
+++ b/recipes-extended/irqbalance/irqbalance_1.5.0.bb
@@ -4,12 +4,11 @@
 
 require irqbalance.inc
 
-SRC_URI[md5sum] = "26ee6db57c4509737e541e98773a39f5"
-SRC_URI[sha256sum] = "62de71510a2496fcf027efb0b288dd48e53e9efc931fa573c95580cad6264d07"
+SRC_URI[md5sum] = "3daa34066d28e2ff44fdac9c39952822"
+SRC_URI[sha256sum] = "3318eddc03782cfdad22b20eff18eaf378c498c5de286e8cbaa5521ddf4f810b"
 
 SRC_URI = "https://github.com/Irqbalance/irqbalance/archive/v${PV}.tar.gz;downloadfilename=irqbalance-${PV}.tar.gz \
            file://add-initscript.patch \
            file://irqbalance-Add-status-and-reload-commands.patch \
-           file://fix-configure-libcap-ng.patch \
            file://irqbalanced.service \
           "
-- 
2.17.1


