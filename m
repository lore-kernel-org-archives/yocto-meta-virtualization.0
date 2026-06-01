Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95C9CD6E55
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 18:36:02 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6332.1780338956683361300
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 01 Jun 2026 11:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DBWcw+wM;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1004; q=dns/txt;
  s=iport01; t=1780338956; x=1781548556;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DaRWeInCeAe7W+GkbfwDh90abPWsMVcbqpI5h2NPI9g=;
  b=DBWcw+wMzL8QBkq+9UPAUNhYbFH3AacIYADxBWYis6+Q9eJUOpZTuWkR
   U3zBDV4Oqwt4arYUxGkA/geuwg8Jig1kIInF5O++3AKl0dTdNRIuAmnM7
   gOOIrsVhxywSq2kTCK087AAhmUNHqy26AhYjwG4jdLmZ/12HJWqsF/Ddm
   4MTELgd8NRZGzzs+yJ392aJ6QbT85ahunV4syra36XGGrvnBFvlJL8Pre
   ZGcpZsiS9RtDmsRg0++AiZJxWctyxnwCrUyYnXZgcQijs3mfVG97suMDR
   WnF1VYD7/eUWpyvZAlzzItKRonuWiYFuHT3m4n/Hswsf96m7Y1+Jpgd8O
   w==;
X-CSE-ConnectionGUID: 59TIHeVuThyQSycfP1bQwA==
X-CSE-MsgGUID: kd4hrbS3QZi+CQi1K1uIJQ==
X-IPAS-Result: =?us-ascii?q?A0BAAgDRzx1q/5P/Ja1aglmCV3JfQkkDlCegP4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYRAjXoCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2HEwF2XB0BJoMCAYJzAgERtRaCLIEBg2gCQ1DbKAEFBhQBgTiFP4gdc?=
 =?us-ascii?q?wGEeycbG4FygRWDaIEFgVwBAYIthXcEgiJ6EoF7jWBIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XgQsbBwWBSoFVaoEChRgjHwM5gReBf4ErbDYDCxgNS?=
 =?us-ascii?q?BEsNxQbBD5uB4tMFw+CNYEOLASCKKV2oQ4KKIN0jCGVOhozqmsLmHuOCZZPh?=
 =?us-ascii?q?GiBaDyBRwsHcBWDIlMZD444g2uBf8dKJDUOLwEBBwIHDgMLgWiRfQEB?=
IronPort-Data: A9a23:rRx7kKsp8OxSar+ZRNwDGNe3lOfnVAVfMUV32f8akzHdYApBsoF/q
 tZmKTyBb63cZzHwLtklPN+38UMEu57XmoBnSAQ+qi0zQ3kRgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZDdJ5xYuajhKs/zb8Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwp7dLIEFDy
 +EkKCE0VQGIidrvyoukY7w57igjBJGD0II3oHpsy3TdSP0hW52GGv2M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtIYH49tL/Aan3XaCBUtVefpaMf6GnIxws327/oWDbQUoDaGpsOzxzE+
 goq+Uz6Dk0aLtakkgO38zGHv+6WvnrmeaArQejQGvlCxQf7KnYoIBgbSVL+v/ijllO3X9NNI
 lAV/SwGqakp6FftX972QxqgunmGsxUAHd1KHIUHBBql0KHY5UOdQ2MDVDMEMYRgv84tTjts3
 ViM9z/0OQFSXHSuYSr13t+pQfmaYED58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:O9X7+6NKAjXGfcBcTvGjsMiBIKoaSvp037BN7TESdfU7SKKlfq
 yV8cjztiWE6wr5JktApTnoAsDpKhnhHPVOjrX5U43PYOCfgguVBbAny5f+yDv9HCC73Otc2a
 B8N5VaMrTLfD1HZQKQ2njeLz7mq+P3lJyVuQ==
X-Talos-CUID: 9a23:660t+G+SjVN4PS8NlsyVvxNFJuEFf0PA8HfBGnSpAmhREbesVnbFrQ==
X-Talos-MUID: 9a23:8pm15wYqX+LPt+BTtDOwhCtoD5xR0aXtI3kMyLZfpuimDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,181,1774310400"; 
   d="scan'208";a="487639244"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Jun 2026 18:35:54 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 034F718000A71
	for <meta-virtualization@lists.yoctoproject.org>; Mon,  1 Jun 2026 18:35:54 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 9A612CB6A93; Mon,  1 Jun 2026 11:35:53 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][scarthgap][PATCH] podman: set status for CVE-2026-33414
Date: Mon,  1 Jun 2026 11:35:37 -0700
Message-Id: <20260601183536.3478585-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 01 Jun 2026 18:36:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9838

From: Sudhir Dumbhare <sudumbha@cisco.com>

The vulnerability only affects Podman's Windows HyperV backend.
Ignore this CVE because this recipe builds for the Linux variant.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-33414
https://github.com/containers/podman/security/advisories/GHSA-hc8w-h2mf-hp59

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 recipes-containers/podman/podman_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index b80b8d5b..44ee9e35 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -37,6 +37,7 @@ PV = "5.0.3+git"
 
 CVE_STATUS[CVE-2022-2989] = "fixed-version: fixed since v4.3.0"
 CVE_STATUS[CVE-2023-0778] = "fixed-version: fixed since v4.5.0"
+CVE_STATUS[CVE-2026-33414] = "not-applicable-platform: affects only Podman's Windows HyperV backend"
 
 PACKAGES =+ "${PN}-contrib"
 
-- 
2.44.4


