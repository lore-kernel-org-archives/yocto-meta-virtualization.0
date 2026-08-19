Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85BD4C5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:45:34 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3507.1787132720281837314
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Aug 2026 02:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q1Wo23dj;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132729; x=1818668729;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R3z1t4HuxPhdx/uSbsWB4ek5IW1KfYIz9ova3CCBaBU=;
  b=q1Wo23djOS8Qt9MZRlqOtsNqpe3SPDSRTgImMOTh3gvxT3zcEKoELQ0a
   6pwZCnssXc/pSXpitzZ9C4rKVHdxeCsa8EhqdFJ55yBSjPodYieTfNX7H
   V8Wfk6HcqnAuknvKuQVuslVmcqFh0a2zGMmGxlOPXdI1YjIvpD5oPgY/z
   7HOomLi/xUJO7UnZCtJwEPEqk3tTnGhy63ZG/GIr5vmYW071PQwV64+uM
   q3SpqT2l7RiAdzu4tFmglMJTOr8z+Hv5X/SXFy8c8Q5n8YtyZi09wYUO4
   m9chIvyPnJIUXJ+X7EUMwpdfsufx6ttvANm99rlWj9bWq2IT4QL+HqlhW
   A==;
X-CSE-ConnectionGUID: MlZsUM2HT+aob2TzkyfW3Q==
X-CSE-MsgGUID: KX3zwj5sQQWX5rEUIEvjNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="255508772"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="255508772"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:45:29 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id BFBD9100037F
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Aug 2026 09:45:25 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 732111C135EB
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Aug 2026 09:45:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 7118E200076A;
	Wed, 19 Aug 2026 09:45:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization] [meta-cloud-services] [PATCH 5/5] python3-testscenarios: update to 0.6.2
Date: Wed, 19 Aug 2026 17:45:12 +0800
Message-ID: <20260819094512.1153-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819094512.1153-1-wangmy@fujitsu.com>
References: <20260819094512.1153-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Aug 2026 09:45:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10047

From: Wang Mingyu <wangmy@fujitsu.com>

PV bump, dual-license update to "Apache-2.0 OR BSD-3-Clause",
backend switch to python_hatchling, dependencies.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...narios_0.5.0.bb => python3-testscenarios_0.6.2.bb} | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-testscenarios_0.5.0.bb => python3-testscenarios_0.6.2.bb} (61%)

diff --git a/meta-openstack/recipes-devtools/python/python3-testscenarios_0.5.0.bb b/meta-openstack/recipes-devtools/python/python3-testscenarios_0.6.2.bb
similarity index 61%
rename from meta-openstack/recipes-devtools/python/python3-testscenarios_0.5.0.bb
rename to meta-openstack/recipes-devtools/python/python3-testscenarios_0.6.2.bb
index 79b03fb7..2a9dd71c 100644
--- a/meta-openstack/recipes-devtools/python/python3-testscenarios_0.5.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-testscenarios_0.6.2.bb
@@ -1,16 +1,17 @@
 DESCRIPTION = "testscenarios: a pyunit extension for dependency injection"
 HOMEPAGE = "https://pypi.python.org/pypi/testscenarios"
 SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://BSD;md5=0805e4f024d089a52dca0671a65b8b66"
+LICENSE = "Apache-2.0 OR BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://BSD;md5=0805e4f024d089a52dca0671a65b8b66 \
+                    file://Apache-2.0;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "859073d9e7b049aee2e6704c51f6001a"
-SRC_URI[sha256sum] = "c257cb6b90ea7e6f8fef3158121d430543412c9a87df30b5dde6ec8b9b57a2b6"
+SRC_URI[sha256sum] = "ab5ae8cd550e11ea978151981e7a8ecac329b7b22e4dec706b1e6fe213f463e7"
 
-inherit setuptools3 pypi
+inherit python_hatchling pypi
 
 DEPENDS += "\
     ${PYTHON_PN}-pbr \
+    ${PYTHON_PN}-hatch-vcs-native \
     "
 
 # Satisfy setup.py 'setup_requires'
-- 
2.43.0


