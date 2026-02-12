Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4D9EDF023
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 03:10:03 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36819.1770865797404502428
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 19:09:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Lp/Rh0FA;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770865797; x=1802401797;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S3tPMkH65npXrntQEgO//VXYDIVwKJOZKirTzJaHGkY=;
  b=Lp/Rh0FAuHH6D2jKKGzCV1Ku+fYgiGR35KcGWyU0L4VSwVsj68Mc2RHE
   ErGSVIiksRZ5VX+VDUw1J9BybIGGl6wEdZ0cd9309YXg0N605fcED/Vrs
   5Mysnqu9eoFc+b+vygRBI3dRDmyziwBJeJgwua7lHreLlJOtonp7gBrQH
   XBLtG/ngOUKxsFJr+4JNdsDFZoMtTODl6CcfA9K1zI1BBJssQITdggTHe
   T/q5VxCwgp5j+ohE6dLAyZnpXQSqnh8YUtIqewcTgma7cV4OvVp21JE3B
   HQXbq3ro8AlXV73YP0FXPlFZA1WxDpdAlwg9Na1sT1XAn11Q8zbU+gunj
   w==;
X-CSE-ConnectionGUID: b4IxLwOSQDq8cCwzaEyH5A==
X-CSE-MsgGUID: ZM0gfeDaR++EJg4p0LsSlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="208130002"
X-IronPort-AV: E=Sophos;i="6.21,285,1763391600"; 
   d="scan'208";a="208130002"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id 860A01000376
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Feb 2026 03:09:55 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 231ED1800240
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Feb 2026 03:09:55 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id D6321404311
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Feb 2026 03:09:52 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH v2] irqbalance: Fix QA error when sysvinit is used
Date: Thu, 12 Feb 2026 11:09:38 +0800
Message-ID: <20260212030943.15928-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Feb 2026 03:10:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9582

irqbalance: correct to install /etc/default for sysvinit

1. This commit uses option --with-pkgconfdir to correct to install /etc/default when sysvinit is used.
   Without this fix, there will show do_package QA Issue
   ERROR: irqbalance-1.9.4+git-r0 do_package: QA Issue: irqbalance: Files/directories were installed but not shipped in any package:
     /usr/etc
     /usr/etc/default
     /usr/etc/default/irqbalance.env

  Previous PACKAGECONFIG[systemd] only works when systemd is used. When using sysvinit, --with-pkgconfdir=${sysconfdir} can't work, so making this patch to fix it.

2. Merge DEPENDS for systemd into PACKAGECONFIG[systemd]

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 recipes-extended/irqbalance/irqbalance.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/irqbalance/irqbalance.inc b/recipes-extended/irqbalance/irqbalance.inc
index 35b6388e..b7b34a0b 100644
--- a/recipes-extended/irqbalance/irqbalance.inc
+++ b/recipes-extended/irqbalance/irqbalance.inc
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		   "
 
 DEPENDS = "glib-2.0"
-DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 INITSCRIPT_NAME = "irqbalanced"
 INITSCRIPT_PARAMS = "defaults"
@@ -25,6 +24,7 @@ SYSTEMD_PACKAGES = "irqbalance"
 SYSTEMD_SERVICE:irqbalance = "irqbalance.service"
 
 EXTRA_OECONF = "--program-transform-name= \
+                --with-pkgconfdir=${sysconfdir} \
 	       "
 
 # let the recipes or appends define options
@@ -34,7 +34,7 @@ PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd',
 #
 PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl,"
 PACKAGECONFIG[libcap-ng] = "--with-libcap-ng,--without-libcap-ng,libcap-ng,"
-PACKAGECONFIG[systemd] = "--with-systemd --with-pkgconfdir=${sysconfdir},,,"
+PACKAGECONFIG[systemd] = "--with-systemd,,systemd"
 
 do_install () {
         oe_runmake 'DESTDIR=${D}' install
-- 
2.43.0


