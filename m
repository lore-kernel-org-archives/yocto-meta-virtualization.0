Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B119AC27C6E
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 08:13:53 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.51660.1718612023197195593
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Jun 2024 01:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aoolWnnz;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718612023; x=1750148023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=r+63g/+WyTF7yig2a+g/8Y8IE1rZcA3RXOLZSauVLeg=;
  b=aoolWnnziGZwLOCjkSBOjgaBShF0DQIF6IRx9OSoQIuIaiFycFFtYmpZ
   rtafX8QYi3p72k1KyF9RaVJsFhr7tQpACzN0kIKSmlKid0kvRqg7XIL8C
   EyqHWErS7n5+XY9FdTKJa3TZhRIslES7n6OUYbuljS13iWIBzVaQico3J
   wfF3yahL++VvbROEuo41OyR2EYN/53n0tQg5BxhE46USK6NCnwa9cGFGd
   3DPGdIht4CCO2ZAuk0Mf08LpcmoYUlcqffrR6mD0OFFE2NWBsson5rE5p
   FQavuhr6MNC3n/khbpMQIE3kqSXZUyG1LZuKQk8VAELERwhlO3725dP4d
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="151688916"
X-IronPort-AV: E=Sophos;i="6.08,244,1712588400"; 
   d="scan'208";a="151688916"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 17:13:40 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CD58AD4255
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Jun 2024 17:13:38 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 229D7D7743
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Jun 2024 17:13:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B433D6B5C5
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Jun 2024 17:13:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 649EC1A0002;
	Mon, 17 Jun 2024 16:13:37 +0800 (CST)
From: wangmy@fujitsu.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization] [PATCH 2/2] openvswitch: Start WORKDIR -> UNPACKDIR transition
Date: Mon, 17 Jun 2024 16:13:19 +0800
Message-Id: <1718611999-8852-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718611999-8852-1-git-send-email-wangmy@fujitsu.com>
References: <1718611999-8852-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28458.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28458.006
X-TMASE-Result: 10--1.836700-10.000000
X-TMASE-MatchedRID: lS1RyDVQvTVAJjQFQUSfYfLeH1FBnhK0wTlc9CcHMZerwqxtE531VOgV
	4TkxLE0x4vM1YF6AJbbCCfuIMF6xLSdET58jp62S708WhkTVVVt8uaclutQybwIHbd5wlOF4Hd8
	h36kvwL23Poq03wufQ/zcp6W50h5BUaJq5wh2+yS0OinDc6QY3oTcajesOJbHS7+RMq/2CK6rA4
	c7UV2fQpvi2PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Jun 2024 08:13:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8800

From: Wang Mingyu <wangmy@fujitsu.com>

Replace references of WORKDIR with UNPACKDIR where it makes sense to do so in preparation for changing the default value of UNPACKDIR.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 recipes-networking/openvswitch/openvswitch.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
index 767a41e6..a792a903 100644
--- a/recipes-networking/openvswitch/openvswitch.inc
+++ b/recipes-networking/openvswitch/openvswitch.inc
@@ -104,13 +104,13 @@ do_install:prepend() {
 
 do_install:append() {
 	install -d ${D}/${sysconfdir}/default/
-	install -m 660 ${WORKDIR}/openvswitch-switch-setup ${D}/${sysconfdir}/default/openvswitch-switch
+	install -m 660 ${UNPACKDIR}/openvswitch-switch-setup ${D}/${sysconfdir}/default/openvswitch-switch
 	install -d ${D}/${sysconfdir}/openvswitch-testcontroller
-	install -m 660 ${WORKDIR}/openvswitch-testcontroller-setup ${D}/${sysconfdir}/default/openvswitch-testcontroller
+	install -m 660 ${UNPACKDIR}/openvswitch-testcontroller-setup ${D}/${sysconfdir}/default/openvswitch-testcontroller
 
 	install -d ${D}/${sysconfdir}/init.d/
-	install -m 755 ${WORKDIR}/openvswitch-testcontroller ${D}/${sysconfdir}/init.d/openvswitch-testcontroller
-	install -m 755 ${WORKDIR}/openvswitch-switch ${D}/${sysconfdir}/init.d/openvswitch-switch
+	install -m 755 ${UNPACKDIR}/openvswitch-testcontroller ${D}/${sysconfdir}/init.d/openvswitch-testcontroller
+	install -m 755 ${UNPACKDIR}/openvswitch-switch ${D}/${sysconfdir}/init.d/openvswitch-switch
 	true || rm -fr ${D}/${datadir}/${PN}/pki
 
 	install -d ${D}/${sysconfdir}/sysconfig
-- 
2.34.1


