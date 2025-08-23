Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56333CA0EFA
	for <webhook@archiver.kernel.org>; Sat, 23 Aug 2025 08:27:59 +0000 (UTC)
Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.web10.2942.1755937669769387490
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 23 Aug 2025 01:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dAqDLrD/;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2878; q=dns/txt;
  s=iport01; t=1755937669; x=1757147269;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fMdked2RS6ZFbWFUPwcuvXIK8OWgAQf9HA83qtZ2BX4=;
  b=dAqDLrD/OLqlmutIIGuBLIITW7Z2oraaa8SER7Qtt7wOSl/fPfKDQsrX
   4H5e3ssFETvwa/29QV2qGjGI5I7Z3FGnoaajYgqLSE/p8kxX+lKQDb6UY
   OcbT1ylNVr64vQvddqUffBpSH3481kz1Yqfkry1Hl7yaBpJaB4oz+VOth
   3er7+LTd3xaGwP4Rc+gcMrgY2ZG5WbBpg9bdhxJ2K7IbAJcgpeopIqRC+
   AThcIU7ifhfxgkfpuP9rfrqJ19lXd6LQF5eQiBRjtBcemGXZJio6Yr6WO
   KPRk6ooY7X0C0WK/mgumBYiHCX3yT7XvE+iVpPuaS4GmdBsR/T0WlTlX9
   g==;
X-CSE-ConnectionGUID: Z+ktA89RRHydrvmhhL0ulw==
X-CSE-MsgGUID: qXi/P+7yQ4SZdM2wbE1Xzw==
X-IPAS-Result: =?us-ascii?q?A0AFAAALe6lo/85K/pBaGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgX8FAQEBAQsBgkZ6WkJJjHCJVZ4dgX8PAQEBDz0UBAEBhQeMJ?=
 =?us-ascii?q?wImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GW?=
 =?us-ascii?q?gECATUBRiwDAQIkNiMZCIMCAYJyAxGwboIsgQHgJYFJAY1MhWcnGxuBcoJQg?=
 =?us-ascii?q?T5vgmECgSeBBoVVIgSCIoECFIpPhg19gg6HCkiBHgNZLAFVEw0KCwcFgWMDN?=
 =?us-ascii?q?QwLLhVuMh2BJ4UThCYrT4UOhGwkaw8GgRWDZQaCOkADCxgNSBEsNxQbBj5uB?=
 =?us-ascii?q?5Nqgy57EwErf35NkxCSQ4E4n1kKKIN0jB6VORozhVulEJkGizWCU5ZQhGmBa?=
 =?us-ascii?q?DyBWXAVgyIJSRkPji0WHINCuGU7NQI6AgcLAQEDCZFqgX0BAQ?=
IronPort-Data: A9a23:hC9rq60MjFYXbUr5R/bD5YVwkn2cJEfYwER7XKvMYLTBsI5bp2QOm
 2MbXmqAMvaLZGCjeIpxaYu08U8BuMLcztNjTFY43Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmG4E70aNANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXU5
 rsen+WFYAX4g24uaDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGPgI1IaRIq9xNIXBC7
 +IdKDApNg2HmLfjqF67YrEEasULJcTxeYdasXZ6wHSBULAtQIvIROPB4towMDUY35wSW6yDO
 4xGNXw1NEqojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZi+C3aIaMI4TiqcN9h3aZ4
 VqFoHXAXiooOPnF1jCoq0K+mbqa9c/8cMdIfFGizdZvjUGag3ISEgELXF+6s/Cli0m4c9ZeM
 FAPvDspprQ17FasTNT2Q1u/unHsg/IHc9NdCag+rQqK0KeRu1vfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:TS7jgKEEVPaMe4XrpLqE48eALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KlbGSoAEJ30bFh4lgPW
 AKSdkbNOHN
X-Talos-CUID: =?us-ascii?q?9a23=3AakGHPGjfS4Cv62sPwQlMlG570zJuQD7e0F6AcnW?=
 =?us-ascii?q?CKXdlUqOQSV+0oL5gjJ87?=
X-Talos-MUID: 9a23:orK5pAlVGXVnwI5KBOw8dnp7BMYv2+fxGXlRqqcKnpObPwEpCyWC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.17,312,1747699200"; 
   d="scan'208";a="30204110"
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Aug 2025 08:27:47 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id 9AEBC18000230;
	Sat, 23 Aug 2025 08:27:47 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 51A9CCC1295; Sat, 23 Aug 2025 13:57:46 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: deeratho@cisco.com
Subject: [meta-virtualization][scarthgap][PATCH] runc-opencontainer: Fix typo in Makefile for static-pie option
Date: Sat, 23 Aug 2025 13:57:38 +0530
Message-Id: <20250823082738.2280799-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-05.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 23 Aug 2025 08:27:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9356

From: Deepak Rathore <deeratho@cisco.com>

runc-opencontainer build is failing with clang toolchain due to typo
error for --static-pie option.

Build Error Logs:
| running x86_64-oe-linux-clang failed: exit status 1
| x86_64-oe-linux-clang: error: unknown argument '--static-pie'; did you mean '-static-pie'?
|
| make: *** [Makefile:69: static] Error 1
| ERROR: oe_runmake failed

Fixed it by replacing --static-pie with -static-pie in LDFLAGS_STATIC.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 ...-Makefile-fix-typo-in-LDFLAGS_STATIC.patch | 30 +++++++++++++++++++
 .../runc/runc-opencontainers_git.bb           |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 recipes-containers/runc/files/0001-Makefile-fix-typo-in-LDFLAGS_STATIC.patch

diff --git a/recipes-containers/runc/files/0001-Makefile-fix-typo-in-LDFLAGS_STATIC.patch b/recipes-containers/runc/files/0001-Makefile-fix-typo-in-LDFLAGS_STATIC.patch
new file mode 100644
index 00000000..bfcfd533
--- /dev/null
+++ b/recipes-containers/runc/files/0001-Makefile-fix-typo-in-LDFLAGS_STATIC.patch
@@ -0,0 +1,30 @@
+From 6f20df5de2c6eb2343202c55e4a8b3d9a4feff10 Mon Sep 17 00:00:00 2001
+From: CrazyMax <crazy-max@users.noreply.github.com>
+Date: Tue, 14 Feb 2023 21:27:26 +0100
+Subject: [PATCH] Makefile: fix typo in LDFLAGS_STATIC
+
+Upstream-Status: Backport [https://github.com/opencontainers/runc/commit/2e44a2028077]
+
+Signed-off-by: CrazyMax <crazy-max@users.noreply.github.com>
+(cherry picked from commit 2e44a2028077685cde67d7988f95ce66110be5ae)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: git/src/import/Makefile
+===================================================================
+--- git.orig/src/import/Makefile
++++ git/src/import/Makefile
+@@ -36,7 +36,7 @@ LDFLAGS_STATIC := -extldflags -static
+ ifneq (,$(filter $(GOARCH),arm64 amd64))
+ 	ifeq (,$(findstring -race,$(EXTRA_FLAGS)))
+ 		GO_BUILDMODE_STATIC := -buildmode=pie
+-		LDFLAGS_STATIC := -linkmode external -extldflags --static-pie
++		LDFLAGS_STATIC := -linkmode external -extldflags -static-pie
+ 	endif
+ endif
+ # Enable static PIE binaries on supported platforms.
+-- 
+2.42.0
+
diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index 6eef2c8f..4c831502 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -4,6 +4,7 @@ SRCREV = "2c9f5602f0ba3d9da1c2596322dfc4e156844890"
 SRC_URI = " \
     git://github.com/opencontainers/runc;branch=release-1.1;protocol=https \
     file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
+    file://0001-Makefile-fix-typo-in-LDFLAGS_STATIC.patch \
     "
 RUNC_VERSION = "1.1.14"
 
-- 
2.44.3


