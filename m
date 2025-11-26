Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3E7D1039A
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 09:44:04 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9894.1764150240176016967
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 01:44:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.51 with ESMTP; 26 Nov 2025 18:43:57 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto.lge.net) (10.177.121.44)
	by 156.147.1.151 with ESMTP; 26 Nov 2025 18:43:57 +0900
X-Original-SENDERIP: 10.177.121.44
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [PATCH] lxc: Fix build with musl
Date: Wed, 26 Nov 2025 18:43:30 +0900
Message-ID: <20251126094330.3883972-1-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Nov 2025 09:44:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9461

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
---
 ...1-process_utils-Remove-P_PIDFD-macro.patch | 38 +++++++++++++++++++
 recipes-containers/lxc/lxc_git.bb             |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 recipes-containers/lxc/files/0001-process_utils-Remove-P_PIDFD-macro.patch

diff --git a/recipes-containers/lxc/files/0001-process_utils-Remove-P_PIDFD-macro.patch b/recipes-containers/lxc/files/0001-process_utils-Remove-P_PIDFD-macro.patch
new file mode 100644
index 00000000..3f97b2bd
--- /dev/null
+++ b/recipes-containers/lxc/files/0001-process_utils-Remove-P_PIDFD-macro.patch
@@ -0,0 +1,38 @@
+From 5bab17c0551db59fcaab85716e46ad84f8bd77ee Mon Sep 17 00:00:00 2001
+From: Jaeyoon Jung <jaeyoon.jung@lge.com>
+Date: Wed, 26 Nov 2025 18:24:47 +0900
+Subject: [PATCH] process_utils: Remove P_PIDFD macro
+
+It is already defined as enum in sys/wait.h. Redefining it as a macro
+would end up a build error if !HAVE_SYS_PIDFD_H, eg.
+../git/src/lxc/process_utils.h:144:17: error: expected identifier before numeric constant
+  144 | #define P_PIDFD 3
+      |                 ^
+
+Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
+Upstream-Status: Submitted [https://github.com/lxc/lxc/pull/4611]
+---
+ src/lxc/process_utils.h | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/src/lxc/process_utils.h b/src/lxc/process_utils.h
+index effff9bd..5b39b8bb 100644
+--- a/src/lxc/process_utils.h
++++ b/src/lxc/process_utils.h
+@@ -138,13 +138,6 @@
+ #define CLONE_NEWTIME 0x00000080 /* New time namespace */
+ #endif
+ 
+-/* waitid */
+-#if !HAVE_SYS_PIDFD_H
+-#ifndef P_PIDFD
+-#define P_PIDFD 3
+-#endif
+-#endif
+-
+ #ifndef CLONE_ARGS_SIZE_VER0
+ #define CLONE_ARGS_SIZE_VER0 64 /* sizeof first published struct */
+ #endif
+-- 
+2.47.2
+
diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
index 2f0e8e74..afbf95a4 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -45,6 +45,7 @@ SRC_URI = "git://github.com/lxc/lxc.git;branch=stable-6.0;protocol=https \
 	file://0001-download-don-t-try-compatbility-index.patch \
 	file://tests-our-init-is-not-busybox.patch \
 	file://0001-template-if-busybox-contains-init-use-it-in-containe.patch \
+	file://0001-process_utils-Remove-P_PIDFD-macro.patch \
 	file://dnsmasq.conf \
 	file://lxc-net \
 	"
-- 
2.47.2


