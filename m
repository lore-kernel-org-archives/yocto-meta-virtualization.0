Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB00C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 08:33:53 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.8563.1645173232508781977
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Feb 2022 00:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 21I8Xnu9009379
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Feb 2022 00:33:49 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 18 Feb 2022 00:33:48 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 18 Feb 2022 00:33:48 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][m-c-s][PATCH 1/2] librdmacm: update LICENSE
 variant
Date: Fri, 18 Feb 2022 16:33:46 +0800
Message-ID: <20220218083347.3359542-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 18 Feb 2022 08:33:53 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7063

From: Changqing Li <changqing.li@windriver.com>

Fix warning:
WARNING: QA Issue: librdmacm: No generic license file exists for: BSD in any provider [license-exists]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-extended/librdmacm/librdmacm_1.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/librdmacm/librdmacm_1.1.0.bb b/recipes-extended/librdmacm/librdmacm_1.1.0.bb
index 2e18b0a9..a3271dfd 100644
--- a/recipes-extended/librdmacm/librdmacm_1.1.0.bb
+++ b/recipes-extended/librdmacm/librdmacm_1.1.0.bb
@@ -9,7 +9,7 @@ Also includes ACM (communication management assistant) service."
 HOMEPAGE = "http://www.openfabrics.org/downloads/rdmacm/"
 SECTION = "libs/devel"
 
-LICENSE = "BSD"
+LICENSE = "BSD-2-Clause | GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=39cc3044d68741f9005da73e9b92db95"
 
 DEPENDS = "virtual/libibverbs"
-- 
2.25.1


