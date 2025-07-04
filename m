Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2529C83F05
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 00:12:23 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.1888.1751587937873190817
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 03 Jul 2025 17:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZvSE9/0z;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751587938; x=1783123938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eIJpyhfaVYV+cnxgplGCz9oNfwHisDT5sG0eVIlqbPs=;
  b=ZvSE9/0ziuSCPQ6jKcoI79y2Q9kppPlLd4xUKe0OfIpFYhB9qWDv6ryz
   X69JPKtbG4TIQeO5CPu2llJSd6/zQD6VuVWa8Tetk/aFXDOupab7g3a/Z
   NQar57Mg478xyMLBFW2FKRYeAChZtrvy2zpFbMnGqU5nNkXChDt4szFt6
   Q/3V1seNJc8Zfd0r4KK2/2abCmgt3Psj286vosULDWnYpNh2Hbk4Xexnr
   T3o4HAdi+XoMOteKAcbIU3X64vZ51a+hsvZF3nnDgwsoVAUbcRx1Q0nrR
   5dPd6y4JEo7Z0ysBNtokUeEP6y5TxX67Aql5lEOIf0xLo6WN+BtFg1dzx
   w==;
X-CSE-ConnectionGUID: dAVl4le1TlCjWxFPLmks0g==
X-CSE-MsgGUID: fUbakmQ4TGq5HvB/r0DAjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="204445548"
X-IronPort-AV: E=Sophos;i="6.16,285,1744038000"; 
   d="scan'208";a="204445548"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 09:12:16 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 3B4241000347
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  4 Jul 2025 00:12:16 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTP id AC3991C00143
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  4 Jul 2025 00:12:15 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 29806BF3C5
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  4 Jul 2025 09:12:14 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A05261A0073;
	Fri,  4 Jul 2025 08:12:13 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization] [PATCH 3/4] podman-compose: drop unneeded S assignment
Date: Fri,  4 Jul 2025 08:12:06 +0800
Message-ID: <20250704001207.250-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250704001207.250-1-wangmy@fujitsu.com>
References: <20250704001207.250-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Jul 2025 00:12:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9290

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 recipes-containers/podman-compose/podman-compose_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-containers/podman-compose/podman-compose_git.bb b/recipes-containers/podman-compose/podman-compose_git.bb
index 7451dffb..26e1865f 100644
--- a/recipes-containers/podman-compose/podman-compose_git.bb
+++ b/recipes-containers/podman-compose/podman-compose_git.bb
@@ -9,8 +9,6 @@ SRC_URI = "git://github.com/containers/podman-compose.git;branch=main;protocol=h
 
 SRCREV = "4d899edeb3d0622a986d90a6b2d7356aa550723e"
 
-S = "${WORKDIR}/git"
-
 DEPENDS += "python3-pyyaml-native"
 
 RDEPENDS:${PN} += "\
-- 
2.43.0


