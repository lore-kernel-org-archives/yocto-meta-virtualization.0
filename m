Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2864ECD4F26
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 05:56:57 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14679.1782194206511554027
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 22:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZzK6oX7Z;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782194206; x=1813730206;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TqK28S+Uc8VU3EiR8dd09keLk99Zq7sj/GYbV/YEyC8=;
  b=ZzK6oX7Z4pc55TPpeI4DL4Api8zHEXOWFKEr8pfBDtsTnk/grO8mwUiF
   F3P4JEJQJn+2xwO6sZRPW39QxPvydbiJ3vgYPcD+uRYjxRlP3Waa/HmAn
   KVx595tsrP5aNObN7RCFiOINoJ0YKfUO2aY7zNFB8HSTDH/9ToUxQ+kgJ
   ZHUQfPo6Tz9jhKN7iN41Jc9Sy0YS/Kdin8NmbBHk1pM3kMz9MK8n5e+a9
   PiVahLtdhOJDOtQdCi2jcGgFE9HGzcvSzenKBwt1JEItdtL5yMZU2gCT3
   iJ/FhEZzqHDeDAjbn3/UeInIlLOZFVuqPRB0fmpUS8LKrSQqYUzGCH6sB
   Q==;
X-CSE-ConnectionGUID: 55m1CQ8XTlaOyF2cX8Bh7A==
X-CSE-MsgGUID: NdVd61OGTL2g+ErHJqRW3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="232404870"
X-IronPort-AV: E=Sophos;i="6.24,220,1774278000"; 
   d="scan'208";a="232404870"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 14:56:44 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A76C5C01827
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 23 Jun 2026 05:56:44 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 5DADD140060B
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 23 Jun 2026 05:56:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 8133518001DC;
	Tue, 23 Jun 2026 05:56:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [meta-virtualization] [meta-cloud-services] [PATCH] qemu: upgrade bbappend to 11.%
Date: Tue, 23 Jun 2026 13:56:38 +0800
Message-ID: <20260623055639.1185-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 23 Jun 2026 05:56:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9902

From: Wang Mingyu <wangmy@fujitsu.com>

Compatibility with OE-core.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../qemu/{qemu_10.%.bbappend => qemu_11.%.bbappend}               | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-openstack/recipes-devtools/qemu/{qemu_10.%.bbappend => qemu_11.%.bbappend} (100%)

diff --git a/meta-openstack/recipes-devtools/qemu/qemu_10.%.bbappend b/meta-openstack/recipes-devtools/qemu/qemu_11.%.bbappend
similarity index 100%
rename from meta-openstack/recipes-devtools/qemu/qemu_10.%.bbappend
rename to meta-openstack/recipes-devtools/qemu/qemu_11.%.bbappend
-- 
2.43.0


