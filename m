Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5837C88E42
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 03:44:52 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12237.1769399084003716969
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 25 Jan 2026 19:44:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=flNFwxSO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769399084; x=1800935084;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AL+jFGhd0pvY3cCIImOjyeHLYMa47JQAi1OaS0oTsIM=;
  b=flNFwxSOLpE8nnv2PHOQBp83357dhl/DHlwAsr16stUX2LU1iJFmRfEd
   hgvFIgmI+WQJNHXHVc+Y6dU1Hrm60saM0bHzIuxaNeAjtHYohEv+b9wnv
   bd/UO9cWEqmEbSzMk7nQjwjcWY03nLeaGqT8cgQawDnHLOzAAYBrzEx5O
   7bdZpVe9jbjLsSDyMIfgNSpgG3JpTbj5LF5R56c4s1W18/Nif6uqdlHGM
   VYfaYLlPR3Pl+vA0cdcRbbXGgPGvszH7EPoIm+/WxwSVuUdbMPzJnIorj
   e0J+19DRl8i4tXg6iUXrkzNvt5s2iF5Zak8vh2WXSJMSFC7FcuBQ37c4P
   g==;
X-CSE-ConnectionGUID: pBTlQoSPR7G1Mgwf3TAKdw==
X-CSE-MsgGUID: 3MxFJRWUQaWK7dyNIBRM9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="227077033"
X-IronPort-AV: E=Sophos;i="6.21,254,1763391600"; 
   d="scan'208";a="227077033"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 12:44:42 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 20CD6677D
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Jan 2026 03:44:42 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id C91A11800317
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Jan 2026 03:44:41 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 79D1014000B8
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Jan 2026 03:44:39 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] irqbalance: Fix PACKAGECONFIG[systemd] parameter
Date: Mon, 26 Jan 2026 11:44:34 +0800
Message-ID: <20260126034434.4242-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Jan 2026 03:44:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9552

irqbalance: correct to install /etc/default for sysvinit

1. This commit uses option --with-pkgconfdir to correct to install /etc/default
   Without this fix, there will show do_package QA Issue
   ERROR: irqbalance-1.9.4+git-r0 do_package: QA Issue: irqbalance: Files/directories were installed but not shipped in any package:
     /usr/etc
     /usr/etc/default
     /usr/etc/default/irqbalance.env

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


