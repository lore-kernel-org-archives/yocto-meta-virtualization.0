Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AAD4CC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 04:40:20 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32153.1792039210447189628
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Oct 2026 21:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QHWNdumN;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1182; q=dns/txt;
  s=iport01; t=1792039210; x=1793248810;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bJ0Hdp97kWOp+iDhpUDyygAxqnGcOu3vR5OvPhDH34k=;
  b=QHWNdumNkvw/VBdFQ2G3WVWNXS09cY86QkCgX4WX5mFtOekBs3M3ZSOf
   t6aHFfcOpT2BoOtyXwVMhv9n/lxNMG8iLPVxU6ani/rq4WKWt559hGbNU
   pRIRpF5PXVJNARN2zBVMM6Dp7GajPI3gNjoaT1pXfwn0LzNqvfqSbIHDc
   E925tj1Tv+GDtpTo74ULDfMUlT9tfSuZ+VupzyI3q9w9gR+gMzS0pBJv9
   p4YngHxgxF5oCpgrhcUq3WjicdfPYVqZcf4AUWB4+3NptS+68E3bmGOi6
   XmTP8izWtdT1n8tNe6p91H13TdWF9YXaOmcYQiTrCoufquaSBNsVnTYbt
   w==;
X-CSE-ConnectionGUID: 6OpT8ZTIROWqfMxzkJoWnA==
X-CSE-MsgGUID: Xr6/IhA+R5Gh/YxgLv9Tuw==
X-IPAS-Result: =?us-ascii?q?A0BFAgCRV9Bq/5L/Ja1aglmCV3VgQ0kDlkcDnhqBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKOFAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEwIBAzIBRhAgMSsrGYMCAYJ0AxG6WYIsgQGEftsyAQUGFAEFg?=
 =?us-ascii?q?TOFQIgjdQGEfCcbG4FygRWDaYEFgVwCgi2FeASCIoEMlwpIgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgghYjGTZ6gQlegSspYAEQF4EJg?=
 =?us-ascii?q?gcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALgRs4PAkoQRcMcwwdBXIIA?=
 =?us-ascii?q?g0JDRgNSBEsNxUZBD5uB5F8HoJlgQ4sBIEXgRGldqEPCiiDdowilToaM6pvC?=
 =?us-ascii?q?5h9jgqVZ2mEaYFoPIFZcBWDIlMZD445g2vOWicyDi8BAQcCBw4DC4FokX4BA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:P11f5agxjsqSNii8b2ZQYwTkX161MBEKZh0ujC45NGQN5FlHY01je
 htvUWHXOKmOZ2CkethzaI2y8xsD7JDQnNdmQFBvrCs1ECpjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/ve8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVG3f5LUVNy1
 MY/FykDSwCRhMCx/7SSH7wEasQLdKEHPasFsX1miDWcBvE8TNWbEuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgl/5JEWxI9EglH/bz1Rq1uPjaE2+GPUigd21dABNfKIIYHbHJkEwBnwS
 mTuz36nRTAaHZ+llBWFtUO8icvRzB/mR9dHfFG/3rsw6LGJ/UQWBQEfEEW6u+Wkg0q/SdtDK
 ksS0i4vtrQpsl2sRcX6Rwe/onOPolgbQdU4LgEhwBuGxqyR50OSAXIJC2YQLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:A3WPOK1uuEpItZYlPAEQ0AqjBGokLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmoFFebvN5CBB/KXHyTj9Nco8y9+a963tr+Lfw3BxCTxOUchbnn5E4sLxKDwMeOGAbqBJbK
 ah2g==
X-Talos-CUID: =?us-ascii?q?9a23=3AFi7XKWioEVtlcaGvhfpjrQR6kTJuLFrF8CfiH26?=
 =?us-ascii?q?CLllwRpiFW1yy/5xiup87?=
X-Talos-MUID: 9a23:n5RSVQQY3DN+7+lMRXTcnm8lFcdBoJ7zJ0BKoIUJn9fVCTFvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,159,1787011200"; 
   d="scan'208";a="535914967"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Oct 2026 04:40:09 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 566A718000493;
	Thu, 15 Oct 2026 04:40:09 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id F3952CBF201; Wed, 14 Oct 2026 21:40:08 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: xe-linux-external@cisco.com
Subject: [meta-virtualization][wrynose][PATCH 2/2] grpc-go: Ignore CVE-2024-37168
Date: Wed, 14 Oct 2026 21:40:08 -0700
Message-Id: <20261015044008.538247-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261015044008.538247-1-hthakar@cisco.com>
References: <20261015044008.538247-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 15 Oct 2026 04:40:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10110

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- CVE-2024-37168 affects the JavaScript implementation distributed as
  the @grpc/grpc-js npm package [1].
- The grpc-go recipe builds the independent Go implementation and does
  not contain the affected JavaScript message handling paths [1].
- Hence ignoring the CVE for grpc-go as an incorrect CPE match.

Reference:
[1] https://github.com/grpc/grpc-node/security/advisories/GHSA-7v5v-9h63-cj86

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 recipes-devtools/go/grpc-go_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-devtools/go/grpc-go_git.bb b/recipes-devtools/go/grpc-go_git.bb
index 7c8e05ca..6d56ed20 100644
--- a/recipes-devtools/go/grpc-go_git.bb
+++ b/recipes-devtools/go/grpc-go_git.bb
@@ -47,3 +47,4 @@ CVE_PRODUCT += "grpc"
 # contain the affected HPACK code path.
 CVE_STATUS[CVE-2024-7246] = "not-applicable-config: CVE is for grpc (C-core), not grpc-go."
 CVE_STATUS[CVE-2023-33953] = "not-applicable-config: CVE affects gRPC C-core-based implementations, not grpc-go."
+CVE_STATUS[CVE-2024-37168] = "cpe-incorrect: affects @grpc/grpc-js, not grpc-go"
-- 
2.35.6


