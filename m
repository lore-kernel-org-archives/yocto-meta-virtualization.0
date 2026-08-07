Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07AFC5AC81
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 02:50:49 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35189.1786071046510629660
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 19:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AvrskzTd;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1786071047; x=1817607047;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+lpx2NF978StAYVRCCJQjBfhTq0SPH4x9fdC/mjrO3M=;
  b=AvrskzTdgSR0Shi43TAUfd3Eph4dZ30mNoeyVQ2+VWsdxzsCaskq09/m
   xNCDcMoCEzKOXZnK6nHbqCVXQyp0M7+fZkiZN+RVLl5+49WXw8896Hkny
   Ax767pIY0pTHUDocg6DvEbIAB5UQv654v2T0QfD7rHipPGY6qtI/6KCNc
   Gs7QLt/Z/zMnOzDmQa+f6CojqAFhreUrZ5Gexvp6Hv/OlbYlJhj2J4OWd
   7GuDNRyeiyPEciohGZJ06w2v/Jy9qHz5luTnQt8B38EGiSGgrX0diTQsA
   NFhnMvAx5UEIU6anew4y2WfwZFd0M+pL3RFK08QA3TRCpFRp4VNaUJk7Z
   g==;
X-CSE-ConnectionGUID: gE9LULnfQ6GP45QkV+yFgA==
X-CSE-MsgGUID: taOMT71OT3yRfAxCwabK0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="250028317"
X-IronPort-AV: E=Sophos;i="6.25,209,1779116400"; 
   d="scan'208";a="250028317"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 11:50:45 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 7839A8204D6
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  7 Aug 2026 02:50:44 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 33A7DC0737D
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  7 Aug 2026 02:50:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 5FC6140432B;
	Fri,  7 Aug 2026 02:50:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization] [meta-cloud-services] [PATCH] open-iscsi-kernel: remove recipe
Date: Fri,  7 Aug 2026 10:50:36 +0800
Message-ID: <20260807025036.1571-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260807025036.1571-1-wangmy@fujitsu.com>
References: <20260807025036.1571-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 07 Aug 2026 02:50:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10033

From: Wang Mingyu <wangmy@fujitsu.com>

Upstream SRC_URI is no longer reachable, so the recipe cannot fetch.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../open-iscsi/open-iscsi-kernel_2.0-873.bb   | 25 -------------------
 1 file changed, 25 deletions(-)
 delete mode 100644 meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-kernel_2.0-873.bb

diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-kernel_2.0-873.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-kernel_2.0-873.bb
deleted file mode 100644
index 81b3cd01..00000000
--- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-kernel_2.0-873.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "Open-iSCSI project is a high performance, transport independent, multi-platform implementation of RFC3720."
-HOMEPAGE = "http://www.open-iscsi.org/"
-LICENSE = "GPL"
-MACHINE_KERNEL_PR:append = "a"
-PR = "r2"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
-
-SRC_URI = " http://www.open-iscsi.org/bits/open-iscsi-${PV}.tar.gz "
-
-S = "${UNPACKDIR}/open-iscsi-${PV}"
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-inherit module
-
-do_compile () {
-        oe_runmake 'KSRC=${STAGING_KERNEL_DIR}' LDFLAGS="" kernel
-}
-
-do_install() {
-        oe_runmake 'KSRC=${STAGING_KERNEL_DIR}' LDFLAGS="" DESTDIR="${D}" install_kernel
-}
-
-SRC_URI[md5sum] = "8b8316d7c9469149a6cc6234478347f7"
-SRC_URI[sha256sum] = "7dd9f2f97da417560349a8da44ea4fcfe98bfd5ef284240a2cc4ff8e88ac7cd9"
-- 
2.43.0


