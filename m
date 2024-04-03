Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABE2CD11C2
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 00:25:45 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.3763.1712103938005637113
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 Apr 2024 17:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=srvmrQSs;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712103938; x=1743639938;
  h=from:to:cc:subject:date:message-id;
  bh=4z6whyRXgGYCmlybp1W+pqMpw8/1bXxQDiVfV5mls30=;
  b=srvmrQSstGCev6xNB+qNQMIBNNxd3kvHE2Fg7HgH57xSLT5ZCwPmxLw0
   JjSOYuTZWCSXLdARrSw4iK0PotbI98P3uOhjmo2BRx7mTMCPRA2gAfJ5L
   H9mrpl5drSvNJmX8rXyCdD8jUbtTB+QBgaB5RbVjnLsglDcbB40H6mXKb
   AVEsY1b2dqZdLjXWDsGnIHAfj9JU6WnZn4+ilRWnhhBnXI6O4jJuwxr6o
   6cU8DlO7EvgiAG3b7YrVeqRLzJml81sEs3iPRDpgGOdULNrBurjQocMbo
   ELALcUN0+mDhFiP8EECxBJvlzEl+Kf4IecEMgF8hdlaeDR6fSDYO9Us8b
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="154404334"
X-IronPort-AV: E=Sophos;i="6.07,176,1708354800"; 
   d="scan'208";a="154404334"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 09:25:36 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 834FDD4801
	for <meta-virtualization@lists.yoctoproject.org>; Wed,  3 Apr 2024 09:25:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id AD698D5618
	for <meta-virtualization@lists.yoctoproject.org>; Wed,  3 Apr 2024 09:25:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 499562007473F
	for <meta-virtualization@lists.yoctoproject.org>; Wed,  3 Apr 2024 09:25:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BE3381A0002;
	Wed,  3 Apr 2024 08:25:31 +0800 (CST)
From: wangmy@fujitsu.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization] [meta-cloud-services] [PATCH] layer.conf: use scarthgap to LAYERSERIES_COMPAT
Date: Wed,  3 Apr 2024 08:25:25 +0800
Message-Id: <1712103925-28778-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28294.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28294.003
X-TMASE-Result: 10--2.407700-10.000000
X-TMASE-MatchedRID: VeGrP/UIbZzQMti10yO4NxF4zyLyne+ATJDl9FKHbrkg9R3V8qg5xHGH
	F8brtu3j4vM1YF6AJbZhyT3WNjppUtAtbEEX0MxBxEHRux+uk8hxKpvEGAbTDly9abPmEw8hA+y
	Q7LA/sOnLVCUcQuQYDc8ifHlBh0Bg1tgpljPRNTkYL1j/QQi/QjmUSSfp84/CGw6wBjDIXszmvP
	qMszdonIK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Apr 2024 00:25:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8660

From: Wang Mingyu <wangmy@fujitsu.com>

conf: mark layer compatible with scarthgap

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-openstack/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index 24768809..b035adf7 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-layer"
 BBFILE_PATTERN_openstack-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-layer = "5"
-LAYERSERIES_COMPAT_openstack-layer = "nanbield"
+LAYERSERIES_COMPAT_openstack-layer = "scarthgap"
 BB_DANGLINGAPPENDS_WARNONLY ?= "true"
 
 LAYERDEPENDS_openstack-layer = " \
-- 
2.34.1


