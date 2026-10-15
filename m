Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA84CC6B2E
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 04:40:20 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32498.1792039210479120283
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Oct 2026 21:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=IiOg6aHH;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1358; q=dns/txt;
  s=iport01; t=1792039210; x=1793248810;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qUUm9T8YYTGpMn9nv+2SGi5/Un4PHLayXEI+EzW3wko=;
  b=IiOg6aHHBvlA716u2PbToG2izvXmuI6v100s6kxtWJsLPL0VOFmR2dsY
   GWmr8XD7NAhlOEuCXL+/+U4Uu5i4HYQc6PALvs22lX8iW6PdSXuStGwyr
   rNyLm2L3mBIt+gJmhKlU2hsqzUgV+hZWOKHehO0/8jw/EGSpnrEk09H34
   MTS5nfQlHVesPKbwl2StIFkEB67Pd/c7BvormN2LMQXuRE2p+NyFf0lke
   zz45mct3pwT0Spc+b6JbaYj3OPeAq64E5OokTPDtI8CIa3T0XteE9Q9kM
   cx5jEFZ0JSEFAYim/C2FlPXVMohdwW8ynCLY5Eli2FmuJ1w+fIqM91qf/
   w==;
X-CSE-ConnectionGUID: sz80QNhlRqCwS7ySU+AFyg==
X-CSE-MsgGUID: 0TjMyJJNTI6z3Rqb+9m7yg==
X-IPAS-Result: =?us-ascii?q?A0BCAgCRV9Bq/5P/Ja1aglmCV3VgQ0mWSp4dgSQDVw8BA?=
 =?us-ascii?q?QEPPRQEAQGFBY4WAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZAVNgFGMFxEgwIBgnQDEQa6U4IsgQGDaQJDUNsyAQUGFAEFgTOFQ?=
 =?us-ascii?q?IgjdQGEfCcbG4FygRWDaYEFgVwBAQKCK4V4BIIigQyUQoJISIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWABEBeBC?=
 =?us-ascii?q?YIHAoJUggACAUlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyC?=
 =?us-ascii?q?AINCQ0YDUgRLDcVGQQ+bgeRfB6CZRB+LASCKBGlZaEPCiiDdowilToaM6pvC?=
 =?us-ascii?q?5h9jgqWUIRpgWg8OYEgcBWDIlMZD445g2vOWicyAjsBAQcCBw4DC4FokX4BA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:Rd5j2KJ/WWTOhw3eFE+RgZQlxSXFcZb7ZxGr2PjKsXjdYENSgWcCm
 jEZW2zQPquIMGH0c94kad+/pkoFvJDdmIU1GwYd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8g2cpajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN11HhFuBKsY/txuKn51q
 u0jFXMkQAGM0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAVbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEuojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQsi+W1a4KNK4biqcN9xnqag
 3Pk3ULFI08Ib+aGw3nU9y29ibqa9c/8cMdIfFGizdZvjUGag3ISEgELXF+6s/Cli0m4c9ZeM
 FAPvDspprQ17FasTNT2Q1u/unHsg/IHc8BbH+t/7ESGzbDZpl/BQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:L3G1760JrzEwJjetMidmHQqjBJ4kLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKhTbaknDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:PVTqwG1ikvCSzJapdSRJFLxfAdJ1KkT7zHPqOmSnMjl4c4DWYHGB9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3Aags9lw0N/xlKfAM3x3cJ/rPFqjUju5isLVEvs7M?=
 =?us-ascii?q?6mpeWbhZpMXTMiWumTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,159,1787011200"; 
   d="scan'208";a="535030092"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Oct 2026 04:40:09 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 54BC618000267;
	Thu, 15 Oct 2026 04:40:09 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id F0573CC1611; Wed, 14 Oct 2026 21:40:08 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: xe-linux-external@cisco.com
Subject: [meta-virtualization][wrynose][PATCH 1/2] grpc-go: Ignore CVE-2023-33953
Date: Wed, 14 Oct 2026 21:40:07 -0700
Message-Id: <20261015044008.538247-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 15 Oct 2026 04:40:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10111

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- CVE-2023-33953 affects the gRPC C-core HPACK parser used by the
  C++, Python, and Ruby implementations [1][2].
- grpc-go is an independent Go implementation and does not contain the
  affected C-core HPACK path [1][2].
- The grpc-go v1.56.1 to v1.56.2 comparison contains no HPACK security
  fix, so the C-core 1.56.2 fixed-version boundary does not apply [3].
- Hence ignoring the CVE for grpc-go.

Reference:
[1] https://cloud.google.com/support/bulletins#gcp-2023-022
[2] https://github.com/advisories/GHSA-496j-2rq6-j6cc
[3] https://github.com/grpc/grpc-go/compare/v1.56.1...v1.56.2

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 recipes-devtools/go/grpc-go_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-devtools/go/grpc-go_git.bb b/recipes-devtools/go/grpc-go_git.bb
index 2b5894d3..7c8e05ca 100644
--- a/recipes-devtools/go/grpc-go_git.bb
+++ b/recipes-devtools/go/grpc-go_git.bb
@@ -46,3 +46,4 @@ CVE_PRODUCT += "grpc"
 # grpc-go (Go implementation in meta-virtualization) does not
 # contain the affected HPACK code path.
 CVE_STATUS[CVE-2024-7246] = "not-applicable-config: CVE is for grpc (C-core), not grpc-go."
+CVE_STATUS[CVE-2023-33953] = "not-applicable-config: CVE affects gRPC C-core-based implementations, not grpc-go."
-- 
2.35.6


