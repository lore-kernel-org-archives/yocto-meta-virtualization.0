Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D68CA1013
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 13:35:57 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.web10.22037.1757079355450267490
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 05 Sep 2025 06:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NfjcaBHu;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1164; q=dns/txt;
  s=iport01; t=1757079355; x=1758288955;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ckfXYjYqihfB+G+lnEflXNcXhRCTKt/o73LPZQvhtW0=;
  b=NfjcaBHuKJYY/ZzOKkeQWEGgBiDe5tnbaudoVLph3LyP/6CWqah5ph9M
   nPiv+E0BMtfh3XkmFqLTnVYgrfZUigiEVDl52/LZUvxVHh5pq5lyrXmyd
   /nKkkOtWZiUnC7gu/7y7aq6ZF2pTM3ZU1qSduvnAtgvd39eWAXK6ccqpO
   5EnX/6Dq176Q0+UkybETplGV78kyyM5ZTkiypDDQKcu0xGJjnFnVPu2/s
   vgdAG9st+klehoIFEs2FHL+2fNpLJnPX0h8WSO+O8Xzlu0vPsajAGVVXP
   TfEpjTvtsDJPuy5+bBpvUq/3aTtp3f8rr0XsCaWkXmvyldl7M4Rw34mox
   g==;
X-CSE-ConnectionGUID: Gj7Wm1a0T2CbTmsCviYoWQ==
X-CSE-MsgGUID: A+dFuSyuQLeTKa+S7F635A==
X-IPAS-Result: =?us-ascii?q?A0AHAAA95rpo/4v/Ja1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBggAEAQEBAQsBgkZ6WUNJojyOIYQFgX8PAQEBDz0UBAEBhQeMK?=
 =?us-ascii?q?gImNQgOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GX?=
 =?us-ascii?q?TYBRoEMRIMCAYJyAxGxI4IsgQGDaAJD2guBZwaBSQGNTHCEdycbgUlEhH2BB?=
 =?us-ascii?q?YFcAQGCLYV3BIM4gVWGa4dzhDeGf0iBHgNZLAFVEw0KCwcFgWMDNQwLLhVuM?=
 =?us-ascii?q?h2BJ4UNhB4rT4UBhGokaw8GgRWDXQaBMYMUQAMLGA1IESw3FBsGPm4HlHmDL?=
 =?us-ascii?q?z1RLIIskyWzXYQmjB6VORozqmuZBooJg3+WUIRpgWkBOoFHCwdNIxWDIlIZD?=
 =?us-ascii?q?444J4NCgX+3MkYyPAIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:M3AiN6BfH7KhlRVW/3riw5YqxClBgxIJ4kV8jS/XYbTApGgn3jJVy
 zRJX22OM/veamvzc9x3bdzn8xkOv8SGxtRkOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZuCCaF/H9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357gU2thh
 fuo+5eCYA79hmYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE7PcxM0RvNNUkoM19PWRV3
 uIZGTcyV0XW7w626OrTpuhEnM8vKozveYgYoHwllWufBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGE+BPjDS0Un1lM/E4ojh+ewhXDXeDxDo1XTrq0yi4TW5FEtieS1boaIJrRmQ+183Uq2u
 1nX4l3dDy05PZ+klhTbqS+F07qncSTTHdh6+KeD3vtnnFTW2G0JFAAfUVqpqOW4jUiWX9NEN
 1dS6y0lsa8q7kupQ9LhGRqirxa5UgU0QdFcFag+rQqK0KeRu1zfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:xjEehKiGVtUWD5tjYZFUbt4e03BQXtEji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcW2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8lXFh41gPW
 MKSdkYNDU2ZmIK6frH3A==
X-Talos-CUID: 9a23:9HB1Y25IIZwSy0qCg9ss20xLJcV8eyXhllzaH0qjInhoebqqcArF
X-Talos-MUID: =?us-ascii?q?9a23=3ACsYfIQ8/gv/dQuYA9IF9Z5uQf+4r74qzM1EQqLE?=
 =?us-ascii?q?Lh+qNdhcvFWnG0R3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,241,1751241600"; 
   d="scan'208";a="541406454"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Sep 2025 13:35:54 +0000
Received: from sjc-ads-9088.cisco.com (sjc-ads-9088.cisco.com [10.30.208.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 59C5A18000351;
	Fri,  5 Sep 2025 13:35:54 +0000 (GMT)
Received: by sjc-ads-9088.cisco.com (Postfix, from userid 1839047)
	id F3DF4CC1292; Fri,  5 Sep 2025 06:35:53 -0700 (PDT)
From: Shubham Pushpkar <spushpka@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: vchavda@cisco.com,
	deeratho@cisco.com
Subject: [meta-virtualization] [Scarthgap] [PATCH] grpc-go 1.59.0+git: Mark CVE-2023-44487 as Patched
Date: Fri,  5 Sep 2025 13:35:52 +0000
Message-ID: <20250905133553.1087661-1-spushpka@cisco.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.208.98, sjc-ads-9088.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 05 Sep 2025 13:35:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9376

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2023-44487
Type: Security Advisory
CVE: CVE-2023-44487
Score: 7.5

Analysis:
- CVE fix is available at [1][2].
- Current grpc-go v1.59.0 source has the fix integrated.[3]
- So, marking this CVE as Patched.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2023-44487
[2] https://github.com/grpc/grpc-go/pull/6703
[3] https://github.com/grpc/grpc-go/commit/e88f12e0517d [v1.59.x]

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
---
 recipes-devtools/go/grpc-go_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-devtools/go/grpc-go_git.bb b/recipes-devtools/go/grpc-go_git.bb
index fdfc2307..0f52988d 100644
--- a/recipes-devtools/go/grpc-go_git.bb
+++ b/recipes-devtools/go/grpc-go_git.bb
@@ -48,3 +48,4 @@ CVE_PRODUCT += "grpc"
 # grpc-go (Go implementation in meta-virtualization) does not
 # contain the affected HPACK code path.
 CVE_STATUS[CVE-2024-7246] = "not-applicable-config: CVE is for grpc (C-core), not grpc-go."
+CVE_STATUS[CVE-2023-44487] = "fixed-version: Fix for the vulnerability is already integrated as part of v1.59.x source."
-- 
2.44.0


