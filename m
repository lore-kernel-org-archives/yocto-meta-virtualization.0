Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B494C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 05:05:01 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33607.1785906300575048325
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Aug 2026 22:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=A7pPwsP6;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1232; q=dns/txt;
  s=iport01; t=1785906300; x=1787115900;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AWfaGoYikHA0EB++9cyJISVM1E3KuZOw/RTUAk63Ofc=;
  b=A7pPwsP6kXyemMy2SrY4K+hM71UMueVa9x9F9g6+03NKyb9M6z3y//jX
   +lQwyLKagnaYdX+yoExxKxaPRalC9DaknsRN5xgIzyg57EFAbwcvW+9+U
   5Mke9J9lyfmV44AsbepcU82AFdOoF1uO7cAPRBjD66OVxaibABZp960E9
   KnuHMuLROtrRbZLaNWehkmbH/4xBXyEkcviBUbbrgmo4TE7ncRZSpC7bo
   m67gpOOf+iIh/ltQrvhoi+Fw0Gm1JD4mi1gATkGZLYB8hC978K9WZUM+U
   2LTI0I/52E2gSvXDWJxXxx4hqXWvIn0qYVzSniZ61XJGwOXT8kVHrpiTf
   Q==;
X-CSE-ConnectionGUID: XapTStC/SzmWXBhim02AAg==
X-CSE-MsgGUID: h4AKEQZ5TBSNhuZEG35udQ==
X-IPAS-Result: =?us-ascii?q?A0D2AgC+w3Jq/5AQJK1aHgEBCxIMggULgld0XkNJojGSN?=
 =?us-ascii?q?4F+DwEBAQ8xIAQBAYUFjWgCJjYHDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GXTYBRjAmKwtEgwIBgjoDNwO8bIIsgQHdRg2CWAELFAEFg?=
 =?us-ascii?q?TOFP4J+hSN1AYR8JxsbgXKEfoEFgRpCAoIthVYiBIIiehKDAY9QSIEeA1ksA?=
 =?us-ascii?q?VUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwcFgR2BKIRtIxk2fIEJXoEtKmQBE?=
 =?us-ascii?q?heBCYJ7AoJ6bwsYDUgRLDcUGQQ+bgeNaCCCCzWBDoIYlDyReqAecQoog3WMI?=
 =?us-ascii?q?Y8+hXwaM4VbpRELI5haizeGXJJHhGmBbwwpgVlwFYMiCUoZD444J4NEzDknM?=
 =?us-ascii?q?j0BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:OuZWgKAXlD+8txVW/3niw5YqxClBgxIJ4kV8jS/XYbTApGwlgT1Ux
 2VLCmrUa/mJNjP8fNBwOti+80hTvJbSzYJiOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA/9h2YuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE8/x2MHoqFsoj6ONIMUtO9
 PlAchkkYUXW7w626OrTpuhEj8AnKozveYgYoHwllW6fBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWYHgBfoO3WjPn8bBYw3mvyonlH0ciZTrxSeoq9fD237k10hjue8bYWFEjCMbcUJt2W1n
 1Cbw07CJBEHBvGwkmeY/kv504cjmgu+Aur+DoaQ8/N2iRiNx3YPFRQSVEmyvfi+jGa6WslDM
 AoF/SEyqrAo806mRcW7WAe3yENopTYVX95WVul/4waXx++MvECSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:VriyeK2/tl/+ggMIaDz3lwqjBJ4kLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKhTbaknDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: =?us-ascii?q?9a23=3AhlOKvGosKLyfOScgIRKqPurmUfAsakHm0FyXGF2?=
 =?us-ascii?q?9NlZDSLyQEQW50awxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A0KiTWw16XqBZti2/l4XOb/StPzUj4/iHK200o8g?=
 =?us-ascii?q?6kfKiNTFCFhjG0Sm7e9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,205,1779148800"; 
   d="scan'208";a="798679578"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 05:04:59 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id AB56C18000345;
	Wed,  5 Aug 2026 05:04:59 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id 40C5CCC12A6; Tue,  4 Aug 2026 22:04:59 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: xe-linux-external@cisco.com
Subject: [meta-virtualization][wrynose][PATCH] docker-compose: add CVE_PRODUCT and CVE_STATUS for CVE-2025-62725
Date: Tue,  4 Aug 2026 22:04:59 -0700
Message-Id: <20260805050459.1743048-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Aug 2026 05:05:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10021

From: "mark.yang" <mark.yang@lge.com>

Add CVE_PRODUCT to docker-compose that matches CPE.
<vendor>:<product> must be set to docker:compose for proper matching.

CVE-2025-62725 was fixed in 2.40.2, but its record encodes the range as
a plain "< 2.40.2" version string that automated version comparison
cannot use, so mark it as fixed-version.

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit e456f38266f55e32521903cddd8a0f9fee2fd5eb)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 recipes-containers/docker-compose/docker-compose_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/recipes-containers/docker-compose/docker-compose_git.bb
index 3eb78c04..aa61d245 100644
--- a/recipes-containers/docker-compose/docker-compose_git.bb
+++ b/recipes-containers/docker-compose/docker-compose_git.bb
@@ -30,6 +30,10 @@ GO_IMPORT = "import"
 
 PV = "5.1.0"
 
+CVE_PRODUCT = "docker:compose"
+
+CVE_STATUS[CVE-2025-62725] = "fixed-version: fixed in 2.40.2"
+
 COMPOSE_PKG = "github.com/docker/compose/v2"
 
 # go-mod-discovery configuration
-- 
2.53.0


