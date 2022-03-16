Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FFFC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 15:20:24 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.26682.1647444023320394247
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Mar 2022 08:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22GFKLWY032105
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Mar 2022 08:20:21 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 16 Mar 2022 08:20:21 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 16 Mar 2022 08:20:21 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 16 Mar 2022 08:20:21 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] ceph: set CXXFLAGS and CFLAGS
Date: Wed, 16 Mar 2022 11:20:20 -0400
Message-ID: <20220316152020.29113-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Mar 2022 15:20:24 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7093

commit a83623a54a375d3ae9198a135b94379881a2b7a5 was added
to oe-core which removes CXXFLAGS and CFLAGS causing
compilation for ceph to fail.

Set CXXFLAGS and CFLAGS to resolve the issue.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 recipes-extended/ceph/ceph_15.2.15.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-extended/ceph/ceph_15.2.15.bb b/recipes-extended/ceph/ceph_15.2.15.bb
index c72953a..17dbcf3 100644
--- a/recipes-extended/ceph/ceph_15.2.15.bb
+++ b/recipes-extended/ceph/ceph_15.2.15.bb
@@ -66,6 +66,9 @@ EXTRA_OECMAKE = "-DWITH_MANPAGE=OFF \
                  -DWITH_REENTRANT_STRSIGNAL=ON \
 "
 
+CXXFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
+CFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
+
 export STAGING_DIR_HOST
 
 do_configure:prepend () {
-- 
2.33.0


