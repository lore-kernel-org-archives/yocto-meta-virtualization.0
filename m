Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7699C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 08:33:52 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.8580.1645173231839894906
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Feb 2022 00:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 21I8XoBQ009382
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Feb 2022 00:33:50 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 21I8XoI8027241
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Feb 2022 00:33:50 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 18 Feb 2022 00:33:50 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Feb 2022 00:33:49 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 18 Feb 2022 00:33:49 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][m-c-s][PATCH 2/2] celt051: update LICENSE
 variant
Date: Fri, 18 Feb 2022 16:33:47 +0800
Message-ID: <20220218083347.3359542-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220218083347.3359542-1-changqing.li@windriver.com>
References: <20220218083347.3359542-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 18 Feb 2022 08:33:52 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7062

From: Changqing Li <changqing.li@windriver.com>

fix warning:
WARNING: QA Issue: celt051: No generic license file exists for: BSD in any provider [license-exists]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-support/celt051/celt051_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-support/celt051/celt051_git.bb b/recipes-support/celt051/celt051_git.bb
index 6eab5669..52c7cf38 100644
--- a/recipes-support/celt051/celt051_git.bb
+++ b/recipes-support/celt051/celt051_git.bb
@@ -9,7 +9,7 @@ with high quality. Unlike these formats CELT imposes very little delay \
 on the signal, even less than is typical for speech centric formats \
 like Speex, GSM, or G.729."
 
-LICENSE = "BSD"
+LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=375f60ab360d17f0172737036ff155b2"
 
 PV = "0.5.1.3"
-- 
2.25.1


