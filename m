Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4AC2CD6E55
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 13:48:20 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29164.1780321700205895030
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 01 Jun 2026 06:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DQxJR/ex;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1562; q=dns/txt;
  s=iport01; t=1780321700; x=1781531300;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Uli77EilaOdWQXaq6UL7G+y3eQJfuFGT6KhRUYqamtU=;
  b=DQxJR/exHhMhpGZ4DIDq369LWpREKSxjxg0jlxV/F6cKQTxvlCsGS7F0
   h8Sup1l/J3adV85p1eKNtckvi6xqj0jNRXLhILC24M4LGWeJT3yK7EmTi
   0PdZLAkk/IefHiBFAK2tQ4EtV5xdjJqxAEwXGDt7L2CuCQjvCYA0hr7N+
   6aKt8vwHc3pU++ARAqTfuNzwTMDLWXx47aI2rCXAa7ZiEkbCKP5x2i6hm
   KbsP7G+wExkEGxS83bjxM5NiFbF4zQSCQqvaLzHZ/fosI/a84y6pShUOI
   Et+tBrd446LWGYNTMq/vOFTX+CHEUUk8Blt5hzFHhxgpF6hYiI/w/Tp+a
   g==;
X-CSE-ConnectionGUID: KCe4e0QeTgyM17NQS1JuUA==
X-CSE-MsgGUID: OgRe3OECQcy+4ViMEN1GdA==
X-IPAS-Result: =?us-ascii?q?A0DBAgD2jB1q/4v/Ja1aHgEBCxIMggULgldyX0JJlkueH?=
 =?us-ascii?q?hSBag8BAQEPPRQEAQGFBo00AiY1CA4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8Nhl02AUYwGEREgwIBgnMCARGzXIIsgQGDaAJDUNsoAQUGF?=
 =?us-ascii?q?AEFgTOFP4gdcwGEeycbG4FygRSDaYEFgVwBgRptGQ6FdwSCIoEMgXuNOUiBH?=
 =?us-ascii?q?gNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBCxsHBYFKgVVqgQKFGCMfAzmBF?=
 =?us-ascii?q?4F/gStIAwsYDUgRLDcUGwQ+bgeLHxcPgjNgLiwFgQeBE5MyklGhDgoog3SMI?=
 =?us-ascii?q?ZU6GjOqawuYe44JlWYyN4RogWoDN4FHCwdwFYMiUxkPjjiFashgJDU9AQEHA?=
 =?us-ascii?q?gcOAwuBaJF9AQE?=
IronPort-Data: A9a23:V419P6nQjpDXIfpIWdJ79p/o5gzSJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZDG7TOfyIZ2T1eN1yPI3g/UkB7MWEytdkSQBk+CpjHltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZG31GONgWYubDpKs/vb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fa4z97p6WVhDy
 fMJDWlSSCm43sCr/ZvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQUaz/7C7pm9AusrnDzdDtXoUiYjaE2+GPUigd21dABNfKJKoPXHJ8MwBbwS
 mTu2GvDD0o9GfemwivGrkyto8LpxAz3cddHfFG/3rsw6LGJ/UQWBQEfEEW6u+Wkg0q/SdtDK
 ksS0i4vtrQpsl2sRcX6Rwe/onOPolgbQdU4LgEhwBuGxqyR50OSAXIJC2YbLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:ElZNPaoVI9L4XVx1YSfmbBAaV5oHeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080l6QU3WB5B97LN2PbUQCTQr2Kg7GP/9TIIVybygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:iQ/B72D6mX9v5PP6EwpM+RIZQvkoTnLM6S6PBXaDUER0dZTAHA==
X-Talos-MUID: 9a23:VIZ4eQpxLaHTTP2FzPkezxZtDsozxImFMUsc0sk4uuypE3VfNx7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,181,1774310400"; 
   d="scan'208";a="487512168"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Jun 2026 13:48:19 +0000
Received: from sjc-ads-4153.cisco.com (sjc-ads-4153.cisco.com [171.70.54.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 47FF818000200;
	Mon,  1 Jun 2026 13:48:19 +0000 (GMT)
Received: by sjc-ads-4153.cisco.com (Postfix, from userid 1870532)
	id E3CA3CAEF48; Mon,  1 Jun 2026 06:48:18 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [meta-virtualization] [Scarthgap] [PATCH] go-distribution: CVE-2020-29591
Date: Mon,  1 Jun 2026 06:48:11 -0700
Message-ID: <20260601134811.52832-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4153.cisco.com [171.70.54.174];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.174, sjc-ads-4153.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 01 Jun 2026 13:48:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9837

From: Anil Dongare <adongare@cisco.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-29591

CVE-2020-29591 affects official Docker Hub registry container images
that shipped with an unlocked root account. This recipe is source-only:
it does not compile binaries and does not ship the official registry
container image or root filesystem where the vulnerable configuration
existed.

Mark this CVE as cpe-incorrect because the affected artifact is the
official container image configuration, not the go-distribution source
recipe.

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 recipes-devtools/go/go-distribution_git.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/recipes-devtools/go/go-distribution_git.bb b/recipes-devtools/go/go-distribution_git.bb
index 740fdfe4..4e0b2a44 100644
--- a/recipes-devtools/go/go-distribution_git.bb
+++ b/recipes-devtools/go/go-distribution_git.bb
@@ -14,6 +14,13 @@ PV = "2.6.0+git"
 
 S = "${WORKDIR}/git"
 
+# CVE-2020-29591 affects official Docker Hub registry container images
+# with an unlocked root account, not the go-distribution source recipe.
+# This recipe is source-only and does not ship the official registry
+# container image or rootfs where the vulnerable /etc/shadow
+# configuration existed.
+CVE_STATUS[CVE-2020-29591] = "cpe-incorrect: affects official registry container image configuration, not this source-only recipe"
+
 inherit meta-virt-depreciated-warning
 
 # NO-OP the do compile rule because this recipe is source only.
-- 
2.44.4


