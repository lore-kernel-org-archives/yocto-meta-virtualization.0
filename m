Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3187EECAAD3
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 14:47:58 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.13188.1662043673622339529
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Sep 2022 07:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net (ip203.trans.bevcomm.net
 [76.164.132.203] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 281ElqXm023387
	for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 1 Sep 2022 09:47:52 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][master][PATCH] meta-xilinx xen
 bbappend: Rename
Date: Thu,  1 Sep 2022 09:47:51 -0500
Message-Id: <20220901144751.3895401-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Sep 2022 14:47:58 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7589

Xen is no longer on 4.14, rename to 4.% to avoid having to regularly update it.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 .../recipes-extended/xen/{xen_4.14.bbappend => xen_4.%.bbappend}  | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename dynamic-layers/xilinx/recipes-extended/xen/{xen_4.14.bbappend => xen_4.%.bbappend} (100%)

diff --git a/dynamic-layers/xilinx/recipes-extended/xen/xen_4.14.bbappend b/dynamic-layers/xilinx/recipes-extended/xen/xen_4.%.bbappend
similarity index 100%
rename from dynamic-layers/xilinx/recipes-extended/xen/xen_4.14.bbappend
rename to dynamic-layers/xilinx/recipes-extended/xen/xen_4.%.bbappend
-- 
2.25.1


