Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6103ACFB421
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 09:03:20 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.4555.1728378199470649092
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 08 Oct 2024 02:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=o3txOlx0;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728378199; x=1759914199;
  h=from:to:cc:subject:date:message-id;
  bh=0x4CPf74RGOFXa7yUfMEWFcf1bvWEWxy46t8KeQrms4=;
  b=o3txOlx02XNi3tl38kPQRx+6WjyvVm0IL/dgjdB+lsxTfUkAEZPY2Eua
   kCKYTlsVXLSrRNEtk6XXJJFRYGbZhGMt9hf4HBKH73CiTDm6BTNvbXVHD
   sP3t9zxcMf/STrSHGFuCzFwkC0TTWMh1gOwWHLr8SRZMgjAeMBGTmlM+N
   p2stSB5EEZnGA/4a1kxwEbXP66SndXBr8ynrdLgXEpM8XrS7f+rfUP5aD
   nk9YbsDDr9dq6bxCOzHYy8R0OHHtjUKqJGMtCMf1ftoeOLdQ9h1dnmmjc
   cibSimQCtoPiDAE7WbMuS9raInnIOEsdtwoxbHnZvVgd9Z98RGjVKJTYx
   g==;
X-CSE-ConnectionGUID: sYSbPU9xT9ikrE2lfNU/lA==
X-CSE-MsgGUID: WK9hLIg6RYu0drJUqqiXQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="163515980"
X-IronPort-AV: E=Sophos;i="6.11,186,1725289200"; 
   d="scan'208";a="163515980"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 18:03:17 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C6EAFCA1E6
	for <meta-virtualization@lists.yoctoproject.org>; Tue,  8 Oct 2024 18:03:14 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 17265D7743
	for <meta-virtualization@lists.yoctoproject.org>; Tue,  8 Oct 2024 18:03:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9779D6895D
	for <meta-virtualization@lists.yoctoproject.org>; Tue,  8 Oct 2024 18:03:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4102E1A000A;
	Tue,  8 Oct 2024 17:03:13 +0800 (CST)
From: wangmy@fujitsu.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization] [meta-cloud-services] [PATCH] layer.conf: use styhead to LAYERSERIES_COMPAT
Date: Tue,  8 Oct 2024 17:03:01 +0800
Message-Id: <1728378181-22499-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28716.001
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28716.001
X-TMASE-Result: 10--2.407700-10.000000
X-TMASE-MatchedRID: VeGrP/UIbZzQMti10yO4NxF4zyLyne+ATJDl9FKHbrkg9R3V8qg5xHGH
	F8brtu3j4vM1YF6AJbZhyT3WNjppUtAtbEEX0MxBxEHRux+uk8hxKpvEGAbTDly9abPmEw8hA+y
	Q7LA/sOnLVCUcQuQYDc8ifHlBh0Bgzd8/EPtwvl2t9jAJPx5oE+y1d6gyxwbIwJUDkv8Z/QK4Zl
	W/aWG0nIK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Oct 2024 09:03:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8917

From: Wang Mingyu <wangmy@fujitsu.com>

conf: mark layer compatible with styhead

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-openstack/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index b035adf7..6774aec6 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-layer"
 BBFILE_PATTERN_openstack-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-layer = "5"
-LAYERSERIES_COMPAT_openstack-layer = "scarthgap"
+LAYERSERIES_COMPAT_openstack-layer = "styhead"
 BB_DANGLINGAPPENDS_WARNONLY ?= "true"
 
 LAYERDEPENDS_openstack-layer = " \
-- 
2.34.1


