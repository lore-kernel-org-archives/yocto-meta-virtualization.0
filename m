Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E49C8303F
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 05:23:49 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.web10.6714.1756445026677023569
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Aug 2025 22:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Ba2t+Q0A;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1752; q=dns/txt;
  s=iport01; t=1756445026; x=1757654626;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rhf6jarB17bioYYrjCbX6DclBc9GIOTflkp35NbYTvs=;
  b=Ba2t+Q0Afmq6A3VsRQhn/onPV26QCnLWq/D3A5zFMAswaf7CvKhGiNrt
   4SlaXPEYG2CsRKS0BMTrg9MDjqdCG098bYnVb6TDHD+MRlOWxUmup6Jsx
   s4D4/4yYiSxnsw9ycMTcXdFrdfN1f1lucRy2PbAUDTodBWPBrZRe7tWj4
   FtbX6alW33ECPQp4JCU/ztkdYLZbmuCwnu6tNzYiGZJNutLgJR+xyxIcR
   o8gxai42JUJhl/I3mzE027GXuOvYRLZdH2wbUGxmR40Sfk0Y+ioeGTXla
   icoKQ7upUUPjhhHbBaey7otUydOHenra+t+GZBn2RSdQvnLK2QaF+De8T
   Q==;
X-CSE-ConnectionGUID: gguDp9FOSpunnNaFgZUGXQ==
X-CSE-MsgGUID: am/VqFO4ROqkPAmeua1/Jw==
X-IPAS-Result: =?us-ascii?q?A0AFAACpOLFo/4z/Ja1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgX8FAQEBAQsBgkZ6WUNJjHCJVZ4dgX8PAQEBDz0UBAEBhQeMJ?=
 =?us-ascii?q?wImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GX?=
 =?us-ascii?q?TYBPQkwXESDAgGCcgMRuHeCLIEBg1oFCQJDT9sjBoFJAY1MbwGEdycbG4Fyh?=
 =?us-ascii?q?H2BBYFcAQGCLYV3BIIigRaQM4MAh3BIgR4DWSwBVRMNCgsHBYFjAzUMCy4Vb?=
 =?us-ascii?q?jIdgSeFDYQeK0+FAoRqJGsPBoEVg18Gg21AAwsYDUgRLDcUGwY+bgeUP4MuI?=
 =?us-ascii?q?W0BKgEEHAKCCpMlgz2PEqEOCiiDdIwelTkaM6prmQaOCJZQhGmBaDyBRwsHc?=
 =?us-ascii?q?BWDIlIZD444g2mBf7pEJjI8AgcLAQEDCZNnAQE?=
IronPort-Data: A9a23:ckAGLqK78fwQsdqmFE+RpJQlxSXFcZb7ZxGr2PjKsXjdYENS1jEFy
 zMdWTuCPfaNNGDzL91zb4nl9xwOvZ/XxoMxTgAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCWa/073WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVrd0
 T/Oi5eHYgL9i2Qkajl8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1hA1waJdw23d1vHGdI0
 /U2JwIwQSC60rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBVrAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEyojx5nYj/7DLo3kOCuiXDlfhVTqUmeouw85G27IAlZjeO9aISOI4LRLSlTtk+d4
 Vzf0UOlODYDN+S2zDeY+yvrpPCayEsXX6pXTtVU7MVCikeOzWFVAQYWW1q2pfWRhUu3WtYZI
 EsRkgIroLQ7sVKqVMXgVhm5sneYvxkac95RCPEhrhCKwbbT+xyeBGUPUnhGctNOiSMtbSYh2
 lnMm5biAiZi9eXOD3mc7byT6zi1PED5MFM/WMPNdiNdi/GLnW35pkinogpLeEJtsuDIJA==
IronPort-HdrOrdr: A9a23:FB0JsKoWc4eIG7JDAg/KUfUaV5ogeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080l6QU3WB5B97LN2PbUQCTQr2Kg7GP/9SZIVycygaYvp
 0QFJSXz7bLfDxHsfo=
X-Talos-CUID: =?us-ascii?q?9a23=3ACGJxLGt7lqVKq2dFFytW4e2T6IsqfWDx1Cb+BHS?=
 =?us-ascii?q?gFGBvbrS7Rm2t15Ndxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AVILbZA2TDvYoAVYVZ5n7IAzLxjUj6qHpNlkjtsk?=
 =?us-ascii?q?8nNCHDQV1NiqU1XOVXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,221,1751241600"; 
   d="scan'208";a="538063163"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Aug 2025 05:23:45 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 97342180001F4;
	Fri, 29 Aug 2025 05:23:45 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id 3FBE4CC1288; Thu, 28 Aug 2025 22:23:45 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	vchavda@cisco.com
Subject: [meta-virtualization] [master] [PATCH] grpc-go 1.59.0+git: Ignore CVE-2024-7246
Date: Thu, 28 Aug 2025 22:22:27 -0700
Message-ID: <20250829052335.2162583-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Aug 2025 05:23:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9362

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
index 839a4f9c..c2990869 100644
--- a/recipes-devtools/go/grpc-go_git.bb
+++ b/recipes-devtools/go/grpc-go_git.bb
@@ -41,3 +41,8 @@ FILES:${PN} += " \
 # some CVEs are reported with "cpe:2.3:a:grpc:grpc:*:*:*:*:*:go:*:*"
 # it's better to have false positives than false negatives
 CVE_PRODUCT += "grpc"
+# CVE-2024-7246 is an HTTP/2 HPACK poisoning issue in gRPC C-core
+# (C/C++ implementation, meta-openembedded).
+# grpc-go (Go implementation in meta-virtualization) does not
+# contain the affected HPACK code path.
+CVE_STATUS[CVE-2024-7246] = "not-applicable-config: CVE is for grpc (C-core), not grpc-go."
-- 
2.44.1


