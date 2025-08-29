Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC29DC8303F
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 04:53:58 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.web11.6119.1756443235559721014
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Aug 2025 21:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Tx8rH3yP;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1752; q=dns/txt;
  s=iport01; t=1756443235; x=1757652835;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wav/qdsiTOnd+8QN6nnWFWCWXO20390D8qX/ynSyRHA=;
  b=Tx8rH3yP/MHMqvBWdCLdoz0OoHgn9wV/Qf2Expn+EUBYoZgucBvnjWfy
   A7N2lanFCn3+sv1obms0uTCEgTtzkV/jDFaEYtceMLdPzLKPtsc+aljn4
   KfOhBECV1jL5sNFWttzhn7Q66/52r0czwLMhfc6r802rzmdC5EfhIed5Y
   WlLupUF0W7oQQdKyCsq4oL6bH0dBj4cdpyVBxudVM7cWBgxfXb5XVuigB
   l8PBckaDSahqFgqIKpAMv7yLexIByPdUy2yWA+AuaCLy6+FC37pbojpSf
   N/sJGO51GP15/n+T4epqaBDSjEfHIMEhllVT0CzQp+Z69EpRs1hvRBcY+
   g==;
X-CSE-ConnectionGUID: hQJo2fjbRA6xNkItsjpSEw==
X-CSE-MsgGUID: CWYgOaJZRbCUb8gwgLbi3g==
X-IPAS-Result: =?us-ascii?q?A0AFAACKMbFo/5T/Ja1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgX8FAQEBAQsBgkZ6WUNJjHCJVZ4dgX8PAQEBDz0UBAEBhQeMJ?=
 =?us-ascii?q?wImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GX?=
 =?us-ascii?q?TYBPQkwXESDAgGCcgMRuRWCLIEBg1oFCQJDT9sjBoFJAY1MbwGEdycbG4Fyh?=
 =?us-ascii?q?H2BBYFcAQGCLYV3BIIigRaQM4MAh3BIgR4DWSwBVRMNCgsHBYFjAzUMCy4Vb?=
 =?us-ascii?q?jIdgSeFDYQeK0+FAoRqJGsPBoEVg18Gg21AAwsYDUgRLDcUGwY+bgeUP4MuI?=
 =?us-ascii?q?W0BKgEEHAKCCpMlgz2PEqEOCiiDdIwelTkaM6prmQaOCJZQhGmBaDyBRwsHc?=
 =?us-ascii?q?BWDIlIZD444J4NCgX+6RiYyPAIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:tPkmz6nZQc/AMg+oq20TIZPo5gz0J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJND2yPaayLa2b2eNhyaNng9B5XvcDXxtZrTwE9/CtgEVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raP649CMUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+p231GONgWYubzpEsfLb83uDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FY0h2OEtD2NEz
 9VGOBYOTwyYhfqN7a3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMmaBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTaj/7C7pm9AusrnDzdDtXoUiYjaE2+GPUigd21dABNfKIIYPRH50PxxnwS
 mTu1FvIDTYTFu6lwxG4+CKjmeDrlyKgV9dHfFG/3rsw6LGJ/UQZEgAdWB2yuvm3i0O6V/pQL
 kUV/mwlqq1a3EmmUtC4QRyivGONuh8OUsZRFOsS7ACW1rGS8gGSGm8cVDlDZdc68sgsSlQXO
 kShhdjlA3lr9baSU3/Yr+7SpjKpMi9TJmgHDcMZcTY4DxDYiNlbpnryohxLScZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:rVRxsql++J5zUn+nCk3gG3fv5LfpDfIn3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdg7NwAV7KZmCP0wGVxepZg7cKrQeNJ8SHzJ8/6U
 +lGJIOb+EZyjNB/KLH3DU=
X-Talos-CUID: =?us-ascii?q?9a23=3AULnHm2vfEep1S/zYmUsaIaMs6IslS1/alnnSKXW?=
 =?us-ascii?q?RV3ZPS5yJUl2Iw457xp8=3D?=
X-Talos-MUID: 9a23:kkxU4QnywgZ09qWmvS62dnpJC/ZnxK2MOnoHuqgM68abOgh6OmyS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,221,1751241600"; 
   d="scan'208";a="537320217"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Aug 2025 04:53:54 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 8969018000151;
	Fri, 29 Aug 2025 04:53:54 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id 3233FCC1288; Thu, 28 Aug 2025 21:53:54 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	vchavda@cisco.com
Subject: [meta-virtualization] [scarthgap] [PATCH] grpc-go 1.59.0+git: Ignore CVE-2024-7246
Date: Thu, 28 Aug 2025 21:52:44 -0700
Message-ID: <20250829045345.2030325-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Aug 2025 04:53:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9361

From: Anil Dongare <adongare@cisco.com>

Upstream Repository: https://github.com/grpc/grpc-go

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2024-7246
Type: Security Fix
CVE: CVE-2024-7246
Score: 6.3 (Medium)
Patch: https://github.com/grpc/grpc/issues/36245

Analysis:
-CVE-2024-7246 describes an HTTP/2 HPACK header table poisoning
 issue found in the gRPC C-core implementation (grpc/grpc).
-The vulnerability does not apply to the pure Go implementation
 (grpc-go) used in Yocto (meta-virtualization layer).
-Marking as not-applicable-config (implementation difference).
-The affected code path is not present in grpc-go.Hence ignoring the
  CVE for grpc-go.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2024-7246
[2] https://github.com/grpc/grpc/issues/36245
[3] Upstream gRPC release notes confirming fixed versions for gRPC
    C-core (not grpc-go).

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 recipes-devtools/go/grpc-go_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-devtools/go/grpc-go_git.bb b/recipes-devtools/go/grpc-go_git.bb
index 7989c02f..fdfc2307 100644
--- a/recipes-devtools/go/grpc-go_git.bb
+++ b/recipes-devtools/go/grpc-go_git.bb
@@ -43,3 +43,8 @@ FILES:${PN} += " \
 # some CVEs are reported with "cpe:2.3:a:grpc:grpc:*:*:*:*:*:go:*:*"
 # it's better to have false positives than false negatives
 CVE_PRODUCT += "grpc"
+# CVE-2024-7246 is an HTTP/2 HPACK poisoning issue in gRPC C-core
+# (C/C++ implementation, meta-openembedded).
+# grpc-go (Go implementation in meta-virtualization) does not
+# contain the affected HPACK code path.
+CVE_STATUS[CVE-2024-7246] = "not-applicable-config: CVE is for grpc (C-core), not grpc-go."
-- 
2.43.5


