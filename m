Return-Path: <Yi.Zhao@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 175F4E00BAA; Tue, 10 Apr 2018 19:29:15 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A069FE00944
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Apr 2018 19:29:13 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w3B2TBut006159
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Apr 2018 19:29:11 -0700 (PDT)
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 10 Apr 2018 19:29:10 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Wed, 11 Apr 2018 10:29:08 +0800
Message-ID: <1523413748-2138-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [PATCH] irqbalance: refresh patches to fix QA warning
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
X-List-Received-Date: Wed, 11 Apr 2018 02:29:15 -0000
Content-Type: text/plain

The patches are refreshed with devtool command:
devtool modify irqbalance
devtool finish --force-patch-refresh irqbalance meta-virtualization

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../irqbalance/irqbalance/add-initscript.patch          | 17 +++++++++++++----
 .../irqbalance/irqbalance/fix-configure-libcap-ng.patch | 13 +++++++++----
 .../irqbalance-Add-status-and-reload-commands.patch     | 10 ++++------
 3 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/recipes-extended/irqbalance/irqbalance/add-initscript.patch b/recipes-extended/irqbalance/irqbalance/add-initscript.patch
index 46a75a8..b0e608e 100644
--- a/recipes-extended/irqbalance/irqbalance/add-initscript.patch
+++ b/recipes-extended/irqbalance/irqbalance/add-initscript.patch
@@ -1,14 +1,23 @@
-irqbalance: add basic init script
+From 80c45eecc193c6c13430ddeb40b9b0fd1841ceee Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Thu, 14 Mar 2013 23:31:38 -0700
+Subject: [PATCH] irqbalance: add basic init script
 
 The upstream irqbalance release package does not contain an
 init script so we create a basic one here.
 
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+
 ---
-Index: irqbalance-0.56/irqbalance.init
-===================================================================
+ irqbalance.init | 35 +++++++++++++++++++++++++++++++++++
+ 1 file changed, 35 insertions(+)
+ create mode 100644 irqbalance.init
+
+diff --git a/irqbalance.init b/irqbalance.init
+new file mode 100644
+index 0000000..d12d62c
 --- /dev/null
-+++ irqbalance-0.56/irqbalance.init
++++ b/irqbalance.init
 @@ -0,0 +1,35 @@
 +#!/bin/sh
 +#
diff --git a/recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch b/recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch
index 5be5243..fb22d7a 100644
--- a/recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch
+++ b/recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch
@@ -1,17 +1,22 @@
+From 20a1b2ff2e6d80924824983c363c80f66e05c0d0 Mon Sep 17 00:00:00 2001
+From: Ming Liu <ming.liu@windriver.com>
+Date: Sun, 6 Sep 2015 14:43:24 +0800
 Subject: [PATCH] grasp withval for libcap-ng
 
 Upstream-Status: Pending
 
 Signed-off-by: Ming Liu <ming.liu@windriver.com>
+
 ---
- configure.ac |    5 ++++-
+ configure.ac | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
 
-diff -urpN a/configure.ac b/configure.ac
+diff --git a/configure.ac b/configure.ac
+index 38a1bee..95f1488 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -61,7 +61,10 @@ AS_IF(
- AM_CONDITIONAL([LOCAL_GLIB], [test "x$local_glib2" = "xyes"])
+@@ -62,7 +62,10 @@ AS_IF(
+ ])
  
  AC_ARG_WITH([libcap-ng],
 -  AS_HELP_STRING([libcap-ng], [Add libcap-ng-support @<:@default=auto@:>@]))
diff --git a/recipes-extended/irqbalance/irqbalance/irqbalance-Add-status-and-reload-commands.patch b/recipes-extended/irqbalance/irqbalance/irqbalance-Add-status-and-reload-commands.patch
index d853d0b..ec01448 100644
--- a/recipes-extended/irqbalance/irqbalance/irqbalance-Add-status-and-reload-commands.patch
+++ b/recipes-extended/irqbalance/irqbalance/irqbalance-Add-status-and-reload-commands.patch
@@ -1,4 +1,4 @@
-From dc7366896dd5a5bae82be4b11530bc9fdb7cbcdd Mon Sep 17 00:00:00 2001
+From 9a16da2628cc4fddf37fe0368b4f6424270f0b2d Mon Sep 17 00:00:00 2001
 From: Yang Shi <yang.shi@windriver.com>
 Date: Mon, 26 Aug 2013 10:58:02 -0700
 Subject: [PATCH] irqbalance: Add status and reload commands
@@ -6,9 +6,10 @@ Subject: [PATCH] irqbalance: Add status and reload commands
 Add status and reload commands for irqbalanced init script
 
 Signed-off-by: Yang Shi <yang.shi@windriver.com>
+
 ---
- irqbalance.init |   12 +++++++++---
- 1 files changed, 9 insertions(+), 3 deletions(-)
+ irqbalance.init | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
 
 diff --git a/irqbalance.init b/irqbalance.init
 index d12d62c..f58bf55 100644
@@ -50,6 +51,3 @@ index d12d62c..f58bf55 100644
  	exit 1
  	;;
  esac
--- 
-1.7.5.4
-
-- 
2.7.4


