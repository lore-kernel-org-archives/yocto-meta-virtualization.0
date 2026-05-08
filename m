Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169D2CD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 05:52:26 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7327.1778219540459646058
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 May 2026 22:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kQTAqecP;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778219540; x=1809755540;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=plHMpf+guIrUpL/pW8B+S50a1NnT2f5Q/M0FV8IiMBA=;
  b=kQTAqecPhu4QhMLk+6UlCf6xf9E97alwDCDrTVDSZb9uuZaQ11Ezg4Zc
   YK+i9Sq/aMID9kcHePg4BtUfoP6J2gxT3BxzHvplIzhVyoZSt4a0RiBEi
   v1j1XnFI9jMB5/dTY6derdZWfzr3h9/b19i+z/f72rqDyb6v2qv/3BRUN
   zbMQePd+u6a0dXMaherIXbGrY+4idJEIREcs2TlY8AZGicWbpngOeQ8U3
   6xzfndvlrvWZZsMd112aOOid4B0C9dc25nbQDd9BIseaJihbMKtsXbl5M
   PQb0kj4b0aVKW05FU8ALvjpXPU5HK2tIUSiJ7HuwOr3VX077KAuaUolnO
   g==;
X-CSE-ConnectionGUID: GE9bn54kRoaJiWla+FeyqQ==
X-CSE-MsgGUID: 9xuIqiFTTVaVT3o9B+wQ2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="239319643"
X-IronPort-AV: E=Sophos;i="6.23,223,1770562800"; 
   d="scan'208";a="239319643"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 14:52:18 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 8FAE81C000A1
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  8 May 2026 05:51:48 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 420CD1801E8A
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  8 May 2026 05:51:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id C33488230A0;
	Fri,  8 May 2026 05:51:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization] [meta-cloud-services] [PATCH] iproute2: upgrade bbappend to 7.%
Date: Fri,  8 May 2026 13:51:41 +0800
Message-ID: <20260508055141.351-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 May 2026 05:52:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9789

From: Wang Mingyu <wangmy@fujitsu.com>

Compatibility with OE-core nanbield.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iproute2/{iproute2_6.%.bbappend => iproute2_7.%.bbappend}     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-openstack/recipes-support/iproute2/{iproute2_6.%.bbappend => iproute2_7.%.bbappend} (100%)

diff --git a/meta-openstack/recipes-support/iproute2/iproute2_6.%.bbappend b/meta-openstack/recipes-support/iproute2/iproute2_7.%.bbappend
similarity index 100%
rename from meta-openstack/recipes-support/iproute2/iproute2_6.%.bbappend
rename to meta-openstack/recipes-support/iproute2/iproute2_7.%.bbappend
-- 
2.43.0


