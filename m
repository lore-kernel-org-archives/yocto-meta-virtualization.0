Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC396D1037A
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 04:23:22 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5928.1764130999617338068
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Nov 2025 20:23:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.52 with ESMTP; 26 Nov 2025 13:23:16 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto.lge.net) (10.177.121.44)
	by 156.147.1.125 with ESMTP; 26 Nov 2025 13:23:16 +0900
X-Original-SENDERIP: 10.177.121.44
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [PATCH] irqbalance: fix build with musl
Date: Wed, 26 Nov 2025 13:22:40 +0900
Message-ID: <20251126042241.3881019-1-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Nov 2025 04:23:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9457

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
---
 ...fix-initialisation-of-regex_t-struct.patch | 36 +++++++++++++++++++
 recipes-extended/irqbalance/irqbalance_git.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 recipes-extended/irqbalance/irqbalance/0002-procinterrupts-fix-initialisation-of-regex_t-struct.patch

diff --git a/recipes-extended/irqbalance/irqbalance/0002-procinterrupts-fix-initialisation-of-regex_t-struct.patch b/recipes-extended/irqbalance/irqbalance/0002-procinterrupts-fix-initialisation-of-regex_t-struct.patch
new file mode 100644
index 00000000..993d9ad8
--- /dev/null
+++ b/recipes-extended/irqbalance/irqbalance/0002-procinterrupts-fix-initialisation-of-regex_t-struct.patch
@@ -0,0 +1,36 @@
+From d02ec54e635da8da8439d35b0523ce2b5d5dbae1 Mon Sep 17 00:00:00 2001
+From: psykose <alice@ayaya.dev>
+Date: Wed, 19 Apr 2023 19:31:19 +0000
+Subject: [PATCH] procinterrupts: fix initialisation of regex_t struct
+
+{NULL} utilises the null pointer, but this is not valid, because null is a pointer:
+
+procinterrupts.c:110:29: error: initialization of 'long unsigned int' from 'void *' makes integer from pointer without a cast [-Werror=int-conversion]
+  110 |                 { "eth.*" ,{NULL} ,NULL, IRQ_TYPE_LEGACY, IRQ_GBETH },
+
+0-initialisation should be done with '0' instead of a pointer.
+
+Upstream-Status: Backport [https://github.com/Irqbalance/irqbalance/commit/d02ec54e635da8da8439d35b0523ce2b5d5dbae1]
+---
+ procinterrupts.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/procinterrupts.c b/procinterrupts.c
+index ec7a52b..dfa95c6 100644
+--- a/procinterrupts.c
++++ b/procinterrupts.c
+@@ -107,10 +107,10 @@ static void guess_arm_irq_hints(char *name, struct irq_info *info)
+ 	static int compiled = 0;
+ 	/* Note: Last entry is a catchall */
+ 	static struct irq_match matches[] = {
+-		{ "eth.*" ,{NULL} ,NULL, IRQ_TYPE_LEGACY, IRQ_GBETH },
+-		{ "[A-Z0-9]{4}[0-9a-f]{4}", {NULL} ,check_platform_device, IRQ_TYPE_LEGACY, IRQ_OTHER},
+-		{ "PNP[0-9a-f]{4}", {NULL} ,check_platform_device, IRQ_TYPE_LEGACY, IRQ_OTHER},
+-		{ ".*", {NULL}, NULL, IRQ_TYPE_LEGACY, IRQ_OTHER},
++		{ "eth.*" , {0},NULL, IRQ_TYPE_LEGACY, IRQ_GBETH },
++		{ "[A-Z0-9]{4}[0-9a-f]{4}", {0}, check_platform_device, IRQ_TYPE_LEGACY, IRQ_OTHER},
++		{ "PNP[0-9a-f]{4}", {0}, check_platform_device, IRQ_TYPE_LEGACY, IRQ_OTHER},
++		{ ".*", {0}, NULL, IRQ_TYPE_LEGACY, IRQ_OTHER},
+ 		{NULL},
+ 	};
+ 
diff --git a/recipes-extended/irqbalance/irqbalance_git.bb b/recipes-extended/irqbalance/irqbalance_git.bb
index 46b8ed0f..7fdf1216 100644
--- a/recipes-extended/irqbalance/irqbalance_git.bb
+++ b/recipes-extended/irqbalance/irqbalance_git.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/Irqbalance/irqbalance;branch=master;protocol=https \
            file://add-initscript.patch \
            file://irqbalance-Add-status-and-reload-commands.patch \
            file://0001-add-void-to-fix-strict-prototypes.patch \
+           file://0002-procinterrupts-fix-initialisation-of-regex_t-struct.patch \
           "
 
 CFLAGS += "-Wno-error=format-security"
-- 
2.47.2


