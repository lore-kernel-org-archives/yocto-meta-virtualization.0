Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C56CCA0EFA
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 10:57:28 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.web11.36457.1756119443057662279
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Aug 2025 03:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gU9j6k9Z;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9; q=dns/txt; s=iport01;
  t=1756119443; x=1757329043;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GaJc7Xdi3mHYM0xb2teG3SiyidmyZoXhdM8Wnkm4bpU=;
  b=gU9j6k9ZVRm9aBY9tJyfV5v/79gTUtfEKt5btMAvu//2hN8qfNxOnSap
   Se75SbhZ4ZLcG6zFqjMlBSV/Cpv5yuik6tztydsx5Sd1eYNroYsrCvHh/
   3vUj5c+lC5+M3B7IMP4jK0M85geFF1/7rYujGhktiZHvAR1pTjUfDtaXF
   v5UZXNVHERAlxlZX1DpOvyE7RBA4wmEAE0gL/+y+wr7tYe43utZofVQKh
   rHAb/1OrwV2uBvXWurEHM/N2GsZbA4lu2gb94mwzqxwIfAYfZBHKzFglE
   qSAjKaDKgS/ln0W+yyoDGCWthmUx1vmNysQxp0+Xu8YBM7XJ/q5ll8Yes
   w==;
X-CSE-ConnectionGUID: A+tpe7W6Q2iCS9GxlfPnxA==
X-CSE-MsgGUID: /R3g7+R3TA26fUFjmWG+8w==
X-IPAS-Result: =?us-ascii?q?A0ACAQCwQKxo/4r/Ja1aGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAYITgkeBVEK3FhQPAQEBD1EEAQGFBwKMJQImOBMBAgQBAQEBAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQELAQEFAQEBAgEHBYEOE4ZXBYZbAgEDeRALRisrgxuCcwIBr3yCL?=
 =?us-ascii?q?IEBhHzbKYFJjU1vAYR3JxsbgXKEPz6BBYQLhVUiBIIigRYdkB2KC0gKgRQDW?=
 =?us-ascii?q?SwBVRMNCgsHBYEgQwM1DAsuFSNLBS0dgSd5hBWEHytPghtygXVahBIeBmsPB?=
 =?us-ascii?q?oEVGR0uAgICBQJDPoFxBh4GHxICAwECAlM9EAIzQAMLGA1IESw3FBsGPm4Hw?=
 =?us-ascii?q?GChDgoog3ShVxozg3EBpnkLmHukWIRpgX8lgVlwFYMjURkPjjgnvEkjgQoJk?=
 =?us-ascii?q?2cBAQ?=
IronPort-Data: A9a23:cB1EDK3zuffuPKEfl/bD5YBwkn2cJEfYwER7XKvMYLTBsI5bpzIGn
 DBJW2yOOa2IM2X8Lo8kPdjj9EsOv8fXmNMwTAVt3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmG4E70aNANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXU5
 rsen+WFYAX4g24uaDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGJQIqJYBHxbhOW2Blz
 q03ODQDVhaTrrfjqF67YrEEasULNsLnOsYb/3pn1zycVa9gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNU+QC/FMEg9/5JYWh/qkm3z1czRwo1OOrq1x6G/WpOB0+OW2boKLJYfQGK25mG7fn
 DnJoCfDWS0zboKR9BSH902Dxb/QyHaTtIU6UefQGuRRqFie2mVWFhwMSUaypfirg1K/XNR3L
 00P5jFovK856EuzVN7/Uhak5nmesXYht8F4CeY27kSJj6HT+QvcXjFCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:5cdqma6hLzVSWy7hFwPXwM/XdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcW2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPN
 9bAstD4BmaNykCsS48izPIdeod/A==
X-Talos-CUID: =?us-ascii?q?9a23=3AfDxVkmgtqQmAWRWsfSrSjWYZxjJuWz7B1HqPHBG?=
 =?us-ascii?q?BU2dCc+y6WVuewKV0up87?=
X-Talos-MUID: 9a23:l58MkAp+9mIatWUpK/sez3ZYb8g3oJ71NGlXz5s7lcuBCgMzayjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.17,312,1747699200"; 
   d="scan'208,209";a="536067325"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Aug 2025 10:57:22 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 2265D180001E6;
	Mon, 25 Aug 2025 10:57:22 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id C2463CBEF79; Mon, 25 Aug 2025 03:57:21 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: vchavda@cisco.com,
	deeratho@cisco.com
Subject: Re: [meta-virtualization] [scarthgap] [PATCH] docker-moby 25.0.3: fix CVE-2024-36623
Date: Mon, 25 Aug 2025 03:57:12 -0700
Message-ID: <20250825105720.228263-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20250804130449.324152-1-sudumbha@cisco.com>
References: <20250804130449.324152-1-sudumbha@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Aug 2025 10:57:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9358

ping=0D

