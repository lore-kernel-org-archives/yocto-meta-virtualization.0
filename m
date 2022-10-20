Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97DD1C433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 16:23:17 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web09.11726.1666282994643161094
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Oct 2022 09:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([76.164.132.203])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 29KGNDjL008509
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Oct 2022 11:23:13 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: meta-virtualization@lists.yoctoproject.org
Subject: [master,langdale,kirkstone][PATCH] xen: Make xilinx extension generic
Date: Thu, 20 Oct 2022 11:23:12 -0500
Message-Id: <20221020162312.915541-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Oct 2022 16:23:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7663

Move the xilinx specific bbappend to a wildcard append.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 .../recipes-extended/xen/{xen_4.14.bbappend => xen_%.bbappend}   | 0
 dynamic-layers/xilinx/recipes-extended/xen/xen_git.bbappend      | 1 -
 2 files changed, 1 deletion(-)
 rename dynamic-layers/xilinx/recipes-extended/xen/{xen_4.14.bbappend => xen_%.bbappend} (100%)
 delete mode 100644 dynamic-layers/xilinx/recipes-extended/xen/xen_git.bbappend

diff --git a/dynamic-layers/xilinx/recipes-extended/xen/xen_4.14.bbappend b/dynamic-layers/xilinx/recipes-extended/xen/xen_%.bbappend
similarity index 100%
rename from dynamic-layers/xilinx/recipes-extended/xen/xen_4.14.bbappend
rename to dynamic-layers/xilinx/recipes-extended/xen/xen_%.bbappend
diff --git a/dynamic-layers/xilinx/recipes-extended/xen/xen_git.bbappend b/dynamic-layers/xilinx/recipes-extended/xen/xen_git.bbappend
deleted file mode 100644
index 54edd1b..0000000
--- a/dynamic-layers/xilinx/recipes-extended/xen/xen_git.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-include xen-xilinx.inc
-- 
2.25.1


