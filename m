Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46C7CAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:06:32 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.web10.14632.1758013590199711306
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 Sep 2025 02:06:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hPggMf6e;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1165; q=dns/txt;
  s=iport01; t=1758013590; x=1759223190;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=00CdcpgTXR6G/xGghSidO/NNlBa5t2ug/sTzAtwTSHg=;
  b=hPggMf6eIUB3NfdG46FOZbgyymuWKK8q3h60sT+i/Gw0EjN4nxkaQDT4
   utu88WxEjmK46+U64J4TD12/toEbLie9TATF91A5z3YPS+jXnl4YGJ5RL
   cEZljijc7hwfeH55WGkAWFU8BOMKtFlclQa9KR26tQuHxfxbRk1C225ut
   TVH3FjxVTmFwRnR5yvucwyPFcNmV90XlnhTphbhKipxR20+MI8kiJSNRb
   5vN2wEM5GZekvD+wVG4RLr57ykc6B66NiYA4jyAmKc/2C33Kv9Kx32K7z
   Lt/q5k7hcVyQzfEYCdkBaz4IsOG6CE1Kk4tCKPHkC0V/RVR2RUZ/l5cOU
   g==;
X-CSE-ConnectionGUID: Br9iN+kEQfud26GYD8aQSg==
X-CSE-MsgGUID: DQzeFkMaS1evmKOb/7PFmA==
X-IPAS-Result: =?us-ascii?q?A0A3AAA3J8lo/5H/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?wcBAQsBgkZ7WUNJjHCHNI4YjiGEBYF/DwEBAQ89FAQBAZE7AiY0CQ4BAgQBA?=
 =?us-ascii?q?QEBAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYcTAYFSRIMCAYJyA?=
 =?us-ascii?q?xG1Y4IsgQGDaAJDT9k9gWcGgUkBjUxwhHcnG4FJRIR9gQWBXAEBgi2FdwSDO?=
 =?us-ascii?q?IFVjlyENYdDSIEeA1ksAVUTDQoLBwWBYwM1DAsuFW4yHYEnhQyEHitPhQKEa?=
 =?us-ascii?q?yRrDwaBFYNbgTeEE0ADCxgNSBEsNxQbBj5uB5U5gzE9USyCLJMlkk+hDoQmj?=
 =?us-ascii?q?B6VORozqmuZBooJg3+WUIRpgWg8gUcLB00jFYMiUhkPjjgng0KBf7w/JjI8A?=
 =?us-ascii?q?gcLAQEDCZNnAQE?=
IronPort-Data: A9a23:E+f4x6IbW2XspGr4FE+RgpQlxSXFcZb7ZxGr2PjKsXjdYENS32APz
 TRMXj3VOf6DMzGjcotwOoy1oxwB65fWztBkGlMd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCWa/073WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVrd0
 T/Oi5eHYgL9imcqajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1EFhA3G84b1995HG0Uq
 9MpBGAEVyuM0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBXbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEmojx5nYj/7DLolhPqzhmH8ehVTqUmeouw85G27IAlZjea8aYOFJILTLSlTtmqht
 G/o/EHwOUgXKtm87jDCrUqCg8aayEsXX6pXTtVU7MVChVCPzykNCQcKSFK/oOuwlk+5XfpbK
 lcI4Ww/qqMu81SxSdvwVAH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBVi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:zpeBi64Jj7L1WzfujQPXwN3XdLJyesId70hD6qkXc202TiX2ra
 6TdZgguCMc6wxhO03I5+rgBEDoexq1nvRICOIqUotKMjOLhILRFuFfBU+I+UyFJ8U4ndQtsJ
 tdTw==
X-Talos-CUID: 9a23:fpDDNWG/K9uKvKUXqmJN7h8VPIMmX0TT0XuKfWCJJTZgcYaaHAo=
X-Talos-MUID: 9a23:E8dNyQu9xz+GLxl8rs2nqAhwOelrxq2VUU0TlLYhsY7bDQJ1EmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,268,1751241600"; 
   d="scan'208";a="569118661"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Sep 2025 09:06:29 +0000
Received: from sjc-ads-9088.cisco.com (sjc-ads-9088.cisco.com [10.30.208.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 40D8A180001EB
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Sep 2025 09:06:29 +0000 (GMT)
Received: by sjc-ads-9088.cisco.com (Postfix, from userid 1839047)
	id DD865CC1292; Tue, 16 Sep 2025 02:06:28 -0700 (PDT)
From: Shubham Pushpkar <spushpka@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization] [Master] [PATCH] grpc-go 1.59.0+git: Mark CVE-2023-44487 as Patched
Date: Tue, 16 Sep 2025 02:06:28 -0700
Message-Id: <20250916090628.1157706-1-spushpka@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.208.98, sjc-ads-9088.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Sep 2025 09:06:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9395

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2023-44487
Type: Security Advisory
CVE: CVE-2023-44487
Score: 7.5

Analysis:
- CVE fix is available at [1][2].
- Current grpc-go v1.59.0 source has the fix integrated.[3]
- So, marking the patch as Patched.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2023-44487
[2] https://github.com/grpc/grpc-go/pull/6703
[3] https://github.com/grpc/grpc-go/commit/e88f12e0517d [v1.59.x]

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
---
 recipes-devtools/go/grpc-go_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-devtools/go/grpc-go_git.bb b/recipes-devtools/go/grpc-go_git.bb
index c2990869..08c9f91f 100644
--- a/recipes-devtools/go/grpc-go_git.bb
+++ b/recipes-devtools/go/grpc-go_git.bb
@@ -46,3 +46,4 @@ CVE_PRODUCT += "grpc"
 # grpc-go (Go implementation in meta-virtualization) does not
 # contain the affected HPACK code path.
 CVE_STATUS[CVE-2024-7246] = "not-applicable-config: CVE is for grpc (C-core), not grpc-go."
+CVE_STATUS[CVE-2023-44487] = "fixed-version: Fix for the vulnerability is already integrated as part of v1.59.x source."
-- 
2.35.6


