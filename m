Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D4C3EF48CD
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 04:31:29 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63995.1770957085012001094
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 20:31:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CjJ1U8lA;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770957085; x=1802493085;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZtoWrzuMl1J0UQa+xG0jVEHlfd5YkaRS9DyO3WXmRyI=;
  b=CjJ1U8lAmtK6QTxCnIs2Tyq8uZCEFZgkE0Dd/NFkjVpDloDrZZNsnP+6
   FiPfGqlBMoHhC5pFvakMIt/JoN61iSQlrEXq6WoBm4co5k6YX2/rJ5c+t
   ZgPraDtyHY5OyqCSsR/DfncMsJqEvTNGFqndhdi4e5mPbt5yvJN8uz830
   XffQvimNd6JU2ocptdUcrk+W3eSlPe1BEGWc/9wYEH22o2xsXnJzoiwZK
   XrbN58ahUZvS9BSXiIxVfU0/EI9/q52E7VL+mgjyxLCjFWoWiydDRsQRE
   pSRsi6cPmnI4i42Zh+hMsgD5LCRjhGrD8fz8ov/NcVPVjgvsE/xx795nX
   w==;
X-CSE-ConnectionGUID: pvhjHAeuTzy2l0btGDKCpg==
X-CSE-MsgGUID: pvkBXXQGS0W6Nrn2JIXREQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="228875237"
X-IronPort-AV: E=Sophos;i="6.21,288,1763391600"; 
   d="scan'208";a="228875237"
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id 29DD33BC
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Feb 2026 04:31:23 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id D47CB1804160
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Feb 2026 04:31:22 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 9308F20000EB
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Feb 2026 04:31:20 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH v2] irqbalance: Fix QA error when sysvinit is used
Date: Fri, 13 Feb 2026 12:31:13 +0800
Message-ID: <20260213043115.19961-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Feb 2026 04:31:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9586

irqbalance: correct to install /etc/default for sysvinit

1.This commit uses option --with-pkgconfdir for sysvinit to correct to install /etc/default
  Without this fix, there will show do_package QA Issue when sysvinit is used
  ERROR: irqbalance-1.9.4+git-r0 do_package: QA Issue: irqbalance: Files/directories were installed but not shipped in any package:
    /usr/etc
    /usr/etc/default
    /usr/etc/default/irqbalance.env

  Previous PACKAGECONFIG[systemd] only works when systemd is used. So making this patch to fix it.

2.Merge DEPENDS for systemd into PACKAGECONFIG[systemd]

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
Changes in v2:
- Improved commit message to explain the sysvinit case
- Use PACKAGECONFIG instead of EXTRA_OECONF

---
 recipes-extended/irqbalance/irqbalance.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-extended/irqbalance/irqbalance.inc b/recipes-extended/irqbalance/irqbalance.inc
index 35b6388e..0c570e12 100644
--- a/recipes-extended/irqbalance/irqbalance.inc
+++ b/recipes-extended/irqbalance/irqbalance.inc
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		   "
 
 DEPENDS = "glib-2.0"
-DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 INITSCRIPT_NAME = "irqbalanced"
 INITSCRIPT_PARAMS = "defaults"
@@ -34,7 +33,7 @@ PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd',
 #
 PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl,"
 PACKAGECONFIG[libcap-ng] = "--with-libcap-ng,--without-libcap-ng,libcap-ng,"
-PACKAGECONFIG[systemd] = "--with-systemd --with-pkgconfdir=${sysconfdir},,,"
+PACKAGECONFIG[systemd] = "--with-systemd --with-pkgconfdir=${sysconfdir},--with-pkgconfdir=${sysconfdir},systemd,"
 
 do_install () {
         oe_runmake 'DESTDIR=${D}' install
-- 
2.43.0


