Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DEDFAD409
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 04:39:47 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12758.1776919179556955426
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 21:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WaEbyjFv;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1340; q=dns/txt;
  s=iport01; t=1776919179; x=1778128779;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sz/2e8e6V139JerIcUXcy2OtkCuNmpfi3L/QxOTO6kI=;
  b=WaEbyjFvyDXdSiss3o2JJDik/+pefwQiAYmXAZlFYMY1tvFJECB1bjki
   jZUSKlF+qJVgRacDM7XSTyo02P37EQ2sdJ/E74N+902WySrKRs7HUvU33
   MOfJ5sAReO9N4VxAD/qwzdJQTzoxmYMU3bcbzkbOOLGnvsdU9GK9Rfxeb
   lcCn6ls+lj/CjCx/RL3Zxe49FOKFh27is67a2KEgm9AHK9cBvhjuyXPyy
   kusEo1bt/+RWjMzZzu01ZGVB2INCKZcI68PBgz+6E6MlNc1H84dS//JJx
   w3ZXSe48ofxdclSpk6ypG0Ij2jom3ZDpbGzG6Mc2c1dir/ezBqGGdDAjy
   A==;
X-CSE-ConnectionGUID: XaPmIoJ8T3ekL8bIS5yRSA==
X-CSE-MsgGUID: 288IV8uhQ3yD2KKfQMWT3g==
X-IPAS-Result: =?us-ascii?q?A0BLAgARoulp/4//Ja1agjQQGoJTgU9DSZNaAY5XkjaBf?=
 =?us-ascii?q?w8BAQEPUQQBAYUGjS4CJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4Zchl02AUYwUQtEgwKCOwM2A65igiyBAYR9sikNglIBCxQBg?=
 =?us-ascii?q?TiFP4J5hSOFbicbG4FyhH2CH4JxhXcEgiKBDoF+hHSCGIYfSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgUuEGW1qgQuDMIE5dQMLGA1IESw3F?=
 =?us-ascii?q?BsEPm4Hij0gEIIrgQ6oTKAdcQoog3SbXIV8GjOqay6YWJISkkeEaIFoPEaBE?=
 =?us-ascii?q?3AVgyJTGQ+OX8oDJjI9AgcCBw0DC5NlAQE?=
IronPort-Data: A9a23:AfXwd6mr3aPgORDrFpz/yYbo5gzFJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfCzqBP6nbazCjfd8gaNvn8RkOsJPQyt4yHFA/rXtkH1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav69/ScUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+Za31GONgWYubDpIsfnb8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36YWBivkFrt52K2XCukMCdPpETb5LwYW8P49mAcksYJ
 N9l7fRcQi9xVkHAdXh0vxRwS0lD0aN6FLDvEXGHtO2U7R36KHbv56VkLXprLLcj07MiaY1O3
 aRwxDEldBuPgaeyhbm8UOQp3pplJ8jwN4RZsXZlpd3bJa95GtaYHOOQuIIehWtr7ixNNa62i
 84xaThmYBPGSxZOIVwQTpk5mY9Eg1GgL2UG9Q/L+/FfD277llwh8Ya9LdrsIc2mH+Z2kH+9m
 V6d8DGsav0dHJnFodafyVqpi/PG2D36Qp4PHbm55Pd2gVqV7mgSEwENE0q8quW+klS5Wd9UN
 woT4CVGkEQp3FagQt+4W1izp2SJ+0ZCHdFRCOY9rgqKz8I4/jqkO4TNdRYZAPROiSP8bWVCO
 oOh9z8xOQFSjQ==
IronPort-HdrOrdr: A9a23:/IReAqHhh5s81pojpLqE3seALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KlbGSoAHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPId+rJBLK8gcaVbSC09QYLcT1X
X-Talos-CUID: =?us-ascii?q?9a23=3A/rj6mmkHrCvfs58k1GtMW8nosw/XOU3U9HLxJG3?=
 =?us-ascii?q?oNT1kS5nFQ36rpbJeqOM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3APaxyHA1LJSJa4Zx5sKlspWZufDUjufT+KX5djJU?=
 =?us-ascii?q?/4Niobw9TNQ64swjsTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,194,1770595200"; 
   d="scan'208";a="740655663"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Apr 2026 04:39:38 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 852FE18000279;
	Thu, 23 Apr 2026 04:39:38 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 2F091CC1288; Wed, 22 Apr 2026 21:39:38 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: vchavda@cisco.com
Subject: [meta-virtualization] [scarthgap] [PATCH] cni: Add CVE_PRODUCT to align with NVD CPE
Date: Wed, 22 Apr 2026 21:39:32 -0700
Message-Id: <20260423043932.2406-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Apr 2026 04:39:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9723

From: Himanshu Jadon <hjadon@cisco.com>

`CVE_PRODUCT` has been set to `linuxfoundation:container_network_interface linuxfoundation:cni_network_plugins`
to align with the product naming defined in the NVD CPE database for `cni`.

The NVD CPE database contains product variants for this project under:
 `cpe:2.3:a:linuxfoundation:container_network_interface`
 `cpe:2.3:a:linuxfoundation:cni_network_plugins`

The NVD references for these CPEs confirm that they correspond to the
source code used in our recipe.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit 84c856c442e420a8fcaa9498d1f0dc2fe511cc01)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 recipes-networking/cni/cni_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index b41b47cf..9c203aee 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -96,3 +96,6 @@ INSANE_SKIP:${PN} += "ldflags already-stripped"
 deltask compile_ptest_base
 
 RDEPENDS:${PN} += " ca-certificates"
+
+# Add CVE_PRODUCT to match the NVD CPE product names
+CVE_PRODUCT = "linuxfoundation:container_network_interface linuxfoundation:cni_network_plugins"
-- 
2.35.6


