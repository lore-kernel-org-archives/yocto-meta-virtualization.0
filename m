Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F409C27C6E
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 08:13:43 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.51256.1718612018577598304
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Jun 2024 01:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nBDuWWHE;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718612019; x=1750148019;
  h=from:to:cc:subject:date:message-id;
  bh=fCs34wJM6DEuoI7vEVJO3nG08noIIgTpqH10DxUcLzg=;
  b=nBDuWWHEVcY3NGUrGj3fhnH0FZNHJEiP6Pc9V0NXl2ZxwmUnMNe3HWfx
   pr7XTdxWRgmOhDXObUxOACcmfR1kG5ikJr/0BRgWtzlaBVCasWu+oOdnR
   dXH+J+10An6pKmtbYFhuE8HquP0HXOPNpBMkRneqIZGV3PPyM+WbXRNSR
   OpoqjuYvNQDlFolEkZSck9ZCTPnhS6b1w3UheUJZt9xVtGqxTljUx64eY
   SzT2u7qJwgPcUo3oTYBmJViAwFWHnIu3LdlFxJ5N1XdF/1Phj/eWqrZoT
   VVDE+i7iBDwiybU9lWzuqLn7SZu1heTKBw9wkhBGNVlQy106z/wN9g/p6
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="163743186"
X-IronPort-AV: E=Sophos;i="6.08,244,1712588400"; 
   d="scan'208";a="163743186"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 17:13:36 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 33040D424E
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Jun 2024 17:13:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 784F9D774F
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Jun 2024 17:13:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 093926B5C5
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Jun 2024 17:13:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9D1851A0002;
	Mon, 17 Jun 2024 16:13:32 +0800 (CST)
From: wangmy@fujitsu.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization] [meta-cloud-services] [PATCH] nss-pam-ldapd: Start WORKDIR -> UNPACKDIR transition
Date: Mon, 17 Jun 2024 16:13:17 +0800
Message-Id: <1718611999-8852-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28458.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28458.006
X-TMASE-Result: 10--3.668900-10.000000
X-TMASE-MatchedRID: TtGBFeo3UetAJjQFQUSfYfLeH1FBnhK0wTlc9CcHMZerwqxtE531VNnf
	JrUSEbFDdnLCqPd2a8f0Iu1L7a9df1gh7i+m6ZSongIgpj8eDcBpkajQR5gb3lQwtQm7iV5jKra
	uXd3MZDVr47e0TKFoZbvF3s+uGcEFNr9hQbx3mjVBJU2rqcDZVIefanly4A2olJYLnV0VsQk/nY
	5fYdlsJ9L+Q/5CODv9l9DKmm5wTFLXLUmqx52PxFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Jun 2024 08:13:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8798

From: Wang Mingyu <wangmy@fujitsu.com>

Replace references of WORKDIR with UNPACKDIR where it makes sense to do so in preparation for changing the default value of UNPACKDIR.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
index 7f3b9e38..582f7592 100644
--- a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
+++ b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
@@ -43,14 +43,14 @@ FILES:${PN}-dbg += "${base_libdir}/security/.debug"
 LDAP_DN ?= "dc=my-domain,dc=com"
 
 do_install:append() {
-	install -D -m 0755 ${WORKDIR}/nslcd.init ${D}${sysconfdir}/init.d/nslcd
+	install -D -m 0755 ${UNPACKDIR}/nslcd.init ${D}${sysconfdir}/init.d/nslcd
 
 	sed -i -e 's/^uid nslcd/# uid nslcd/;' ${D}${sysconfdir}/nslcd.conf
 	sed -i -e 's/^gid nslcd/# gid nslcd/;' ${D}${sysconfdir}/nslcd.conf
 	sed -i -e 's/^base dc=example,dc=com/base ${LDAP_DN}/;' ${D}${sysconfdir}/nslcd.conf
 
 	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/nslcd.service ${D}${systemd_unitdir}/system
+	install -m 0644 ${UNPACKDIR}/nslcd.service ${D}${systemd_unitdir}/system
 }
 
 inherit update-rc.d systemd
-- 
2.34.1


