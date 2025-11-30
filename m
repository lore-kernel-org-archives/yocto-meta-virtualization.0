Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E74D116E2
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 03:25:18 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7811.1764473107947253329
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 29 Nov 2025 19:25:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.53 with ESMTP; 30 Nov 2025 12:25:05 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto.lge.net) (10.177.121.44)
	by 156.147.1.127 with ESMTP; 30 Nov 2025 12:25:05 +0900
X-Original-SENDERIP: 10.177.121.44
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [PATCH v2] lxc: Fix build with musl
Date: Sun, 30 Nov 2025 12:24:38 +0900
Message-ID: <20251130032438.1200801-1-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 30 Nov 2025 03:25:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9464

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
---
 ...01-build-Check-if-P_PIDFD-is-defined.patch | 56 +++++++++++++++++++
 recipes-containers/lxc/lxc_git.bb             |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 recipes-containers/lxc/files/0001-build-Check-if-P_PIDFD-is-defined.patch

diff --git a/recipes-containers/lxc/files/0001-build-Check-if-P_PIDFD-is-defined.patch b/recipes-containers/lxc/files/0001-build-Check-if-P_PIDFD-is-defined.patch
new file mode 100644
index 00000000..b7a2bb05
--- /dev/null
+++ b/recipes-containers/lxc/files/0001-build-Check-if-P_PIDFD-is-defined.patch
@@ -0,0 +1,56 @@
+From 4d00d4f8046972907ef34ac5677d07ae39f3aded Mon Sep 17 00:00:00 2001
+From: Jaeyoon Jung <jaeyoon.jung@lge.com>
+Date: Sun, 30 Nov 2025 11:51:13 +0900
+Subject: [PATCH] build: Check if P_PIDFD is defined
+
+It is defined in enum 'idtype_t' in some environment in which causes an
+error like:
+../git/src/lxc/process_utils.h:144:17: error: expected identifier before numeric constant
+  144 | #define P_PIDFD 3
+      |                 ^
+
+Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
+Upstream-Status: Submitted [https://github.com/lxc/lxc/pull/4614]
+---
+ meson.build             | 11 +++++++++++
+ src/lxc/process_utils.h |  2 +-
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index ec7524c2..4b3a8f07 100644
+--- a/meson.build
++++ b/meson.build
+@@ -521,6 +521,17 @@ foreach ccattr: [
+     srcconf.set10('HAVE_COMPILER_ATTR_' + ccattr.underscorify().to_upper(), cc.has_function_attribute(ccattr))
+ endforeach
+ 
++## P_PIDFD
++test_code = '''
++#include <sys/wait.h>
++void func() { siginfo_t s; int r = waitid(P_PIDFD, 0, &s, 0); }
++'''
++if cc.compiles(test_code, name: 'waitid(P_PIDFD, ...)')
++    srcconf.set('HAVE_P_PIDFD', 1)
++  else
++    srcconf.set('HAVE_P_PIDFD', 0)
++endif
++
+ ## Headers.
+ foreach ident: [
+     ['bpf',               '''#include <sys/syscall.h>
+diff --git a/src/lxc/process_utils.h b/src/lxc/process_utils.h
+index effff9bd..f4f53a23 100644
+--- a/src/lxc/process_utils.h
++++ b/src/lxc/process_utils.h
+@@ -139,7 +139,7 @@
+ #endif
+ 
+ /* waitid */
+-#if !HAVE_SYS_PIDFD_H
++#if !HAVE_P_PIDFD
+ #ifndef P_PIDFD
+ #define P_PIDFD 3
+ #endif
+-- 
+2.47.2
+
diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
index 2f0e8e74..5d4494a6 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -45,6 +45,7 @@ SRC_URI = "git://github.com/lxc/lxc.git;branch=stable-6.0;protocol=https \
 	file://0001-download-don-t-try-compatbility-index.patch \
 	file://tests-our-init-is-not-busybox.patch \
 	file://0001-template-if-busybox-contains-init-use-it-in-containe.patch \
+	file://0001-build-Check-if-P_PIDFD-is-defined.patch \
 	file://dnsmasq.conf \
 	file://lxc-net \
 	"
-- 
2.47.2


