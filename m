Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF95EC47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:52:56 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.3104.1700124771844578451
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Nov 2023 00:52:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="140031116"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="140031116"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:52:49 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8F496D3EA9
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Nov 2023 17:52:47 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D6F5ACF7E7
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Nov 2023 17:52:46 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 269BE20079110;
	Thu, 16 Nov 2023 17:52:46 +0900 (JST)
From: wangmy@fujitsu.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization] [meta-cloud-services] [PATCH] layer.conf: use nanbield to LAYERSERIES_COMPAT
Date: Thu, 16 Nov 2023 16:52:14 +0800
Message-Id: <1700124734-23018-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28000.003
X-TMASE-Result: 10--5.927700-10.000000
X-TMASE-MatchedRID: ZYjN+pfhQkov+0FNnM7lDQPZZctd3P4BRzUPAqhCjtiXRiOSHPJchXGH
	F8brtu3j4vM1YF6AJbZhyT3WNjppUtAtbEEX0MxBxEHRux+uk8h+ICquNi0WJPW/zsQGihMmjJ4
	V0yBl2Q97EMHCsLQnx47azZJKGQpXftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Nov 2023 08:52:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8459

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 4f71854d..9568719c 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,5 +7,5 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "cloud-services-layer"
 BBFILE_PATTERN_cloud-services-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_cloud-services-layer = "5"
-LAYERSERIES_COMPAT_cloud-services-layer = "honister"
+LAYERSERIES_COMPAT_cloud-services-layer = "nanbield"
 LAYERDEPENDS_cloud-services-layer = "core filesystems-layer networking-layer"
-- 
2.34.1


