Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFD8C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 20:55:07 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.840.1647982505455904913
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 13:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22MKt3tC028370
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 13:55:03 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 22 Mar 2022 13:55:03 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 22 Mar 2022 13:55:03 -0700
Received: from localhost.localdomain (128.224.72.92) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 22 Mar 2022 13:55:02 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH V2] ceph: set CXXFLAGS and CFLAGS
Date: Tue, 22 Mar 2022 16:54:43 -0400
Message-ID: <20220322205443.65641-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Mar 2022 20:55:07 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7105

In oe-core, the commit:
   a83623a54a Revert "cmake.bbclass: Set CXXFLAGS and CFLAGS"

drops compiler flags overrides for all cmake-based recipes,
causing the ceph compile to fail with the error:
  ld: cannot find crtn.o: No such file or directory

  collect2: error: ld returned 1 exit status

Add the override back for ceph to fix the build error.

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
2.25.1


