Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94F4C3ABB3
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 23:25:25 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.124982.1726442721953296454
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 15 Sep 2024 16:25:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 48FNOFTT019787;
	Sun, 15 Sep 2024 18:24:17 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com
Subject: [meta-virtualization][scarthgap,master][PATCH] u-boot-xlnx-scr.bbappend: Fix xen boot script comparison
Date: Sun, 15 Sep 2024 18:24:13 -0500
Message-Id: <1726442653-16083-1-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 15 Sep 2024 23:25:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8896

From: Mark Hatle <mark.hatle@amd.com>

Some versions of python/bitbake appear to allow 'true' and 'false',
but this is incorrect, True and False are the correct boolean variables.

Fixes:
  ERROR: ExpansionError during parsing .../meta-xilinx/meta-xilinx-core/recipes-bsp/u-boot/u-boot-xlnx-scr.bb

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 .../xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
index 819a0c6..ec64d24 100644
--- a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
+++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
@@ -1,4 +1,4 @@
 # Include xen-boot-cmd.inc only if ENABLE_XEN_UBOOT_SCR is set from configuration
 # file and xen enabled in DISTRO_FEATURES.
 ENABLE_XEN_UBOOT_SCR ?= ""
-include ${@'xen-boot-cmd.inc' if d.getVar('ENABLE_XEN_UBOOT_SCR') == '1' and bb.utils.contains('DISTRO_FEATURES', 'xen', true, false, d) else ''}
+include ${@'xen-boot-cmd.inc' if d.getVar('ENABLE_XEN_UBOOT_SCR') == '1' and bb.utils.contains('DISTRO_FEATURES', 'xen', True, False, d) else ''}
-- 
2.44.1


