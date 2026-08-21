Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E01C5DF88
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 05:07:30 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1059.1787288843598000356
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 22:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KeIlH5/I;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1284; q=dns/txt;
  s=iport01; t=1787288843; x=1788498443;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ty2HtfKcRODZN0xsuoLakjKZgKJi1BQ/aZn2wxgSiWo=;
  b=KeIlH5/IPWPdTZ2/jHtQ9iZLk10Bg+K63Ii3pFgusCFm5esXTlYYRG6P
   1y1M6o/U2xhglxYzlVg04tIH5phF+0naIdJ9YXeCf2zn/SDM6a9lPdLIb
   FhTYp0gLeI8MkhrD6GQ81Cmmo79QKN7UFgfpXBSXzdONJEeAVm6xQsP7t
   GINKGV16Tuus4bJQDmiVW0FaCrOOL2VONuJSDNBpAEszb0sz7ICc75HLd
   lImqPOcDUAr8nHcT15Nt50dRb1WSRngewEuvrd4vNE5GRBE1qUweQBMMX
   AH/5DiLCi9+nfNuq2LzIL7ewvyQSCI89O72m+0OKbG0eOC5OxiPl3jcp+
   g==;
X-CSE-ConnectionGUID: yvJTQLAfSQOnTyfojmh/sQ==
X-CSE-MsgGUID: YwT8JgYiSG2Zxhx+uIjEBg==
X-IPAS-Result: =?us-ascii?q?A0AuAwCz3Idq/44QJK1RCYJZgleBUkNJk1kBowwPAQEBD?=
 =?us-ascii?q?1EEAQGFBY1uAiY3Bg4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Th?=
 =?us-ascii?q?lyGXTYBRjBcRIMCgnUDwF6CLIEBhH3bMAELFAEFgTOFP4gihXInGxuBcoR+h?=
 =?us-ascii?q?Bd5hXgEgiKBDJNWSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwYFg?=
 =?us-ascii?q?R2BKIQ3Ixk2fIEJXoErKmEBEheBCYIKAoJfggUCAUlDDgc6CxgNSBEsNxQZB?=
 =?us-ascii?q?D5uB45aIIJGgQ6CGaQUgiGhDwoog3ahWxozqmwumFqkWoRpgX4mgVlwFYMiU?=
 =?us-ascii?q?xkP3lwnMj8HAgcPApNxAQE?=
IronPort-Data: A9a23:6/cr4ah9bxcaaKzAM9qXEh7dX161MxEKZh0ujC45NGQN5FlHY01je
 htvUD2DOf6KY2anLooiboiwpklSvpDWyNNjSAM++CpkFHxjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMu/jb8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUJ5MRLOEVn+
 8chDzYxfx6Ehee2h6mCH7wEasQLdKEHPasWvnVmiDWcBvE8TNWbHuPB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTYD/7C7pm9AusrnXybTRes1KNjaE2+GPUigd21dABNfKFI4HQHJkIxR/wS
 mTuznvFUjMVBd2k5mC34nK8xfLunw7RV9dHfFG/3rsw6LGJ/UQWBQEfEEW6u+Wkg0q/SdtDK
 ksS0i4vtrQpsl2sRcX6Rwe/onOPolgbQdU4LgEhwAiJzqyR50OSAXIJC2YcLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWroUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:QcA3hK//ihxLOMdCwC5uk+D0I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WLK+UyFJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:l5EViWPiHFbL3+5DSTdFyHcwM84eS1rb8GbeJE29CSFycejA
X-Talos-MUID: =?us-ascii?q?9a23=3AXtrKrg2AcCL1O2R350cCuBM3bjUj0ruSWGICoJQ?=
 =?us-ascii?q?9lJO2JSxgeCq8jhmdTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,234,1779148800"; 
   d="scan'208";a="815214531"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Aug 2026 05:07:10 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id 3796D1800016D;
	Fri, 21 Aug 2026 05:07:10 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id CAC8BCC12A6; Thu, 20 Aug 2026 22:07:09 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: xe-linux-external@cisco.com
Subject: [meta-virtualization][PATCH] podman: correct CVE_PRODUCT mapping
Date: Thu, 20 Aug 2026 22:07:09 -0700
Message-Id: <20260821050709.49931-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Aug 2026 05:07:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10057

From: Devansh Patel <devanshp@cisco.com>

The default product-only mapping cannot cover NVD records published under
Podman's former libpod name. podman_project:podman is the active NVD
dictionary CPE and configuration identity. libpod_project:libpod is the
historical NVD dictionary CPE and configuration identity for the same source
lineage, including records already referenced by recipe CVE_STATUS entries.

The exact pair retains all 23 records from the default mapping and adds
CVE-2018-10856, CVE-2019-10214, and CVE-2019-18466 from the historical NVD
identity.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 recipes-containers/podman/podman_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index e3bd1621..03e22e5d 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -29,6 +29,8 @@ GO_IMPORT = "import"
 
 PV = "6.1.0-dev"
 
+CVE_PRODUCT = "podman_project:podman libpod_project:libpod"
+
 CVE_STATUS[CVE-2019-10152] = "fixed-version: fixed since v1.4.0"
 CVE_STATUS[CVE-2020-1726] = "fixed-version: fixed since v1.8.1"
 CVE_STATUS[CVE-2022-2989] = "fixed-version: fixed since v4.3.0"
-- 
2.35.6

