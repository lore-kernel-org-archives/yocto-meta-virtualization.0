Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930E5C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:45:34 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3507.1787132720281837314
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Aug 2026 02:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O5CFGfgT;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132728; x=1818668728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QhS6Al/pI51gXCJmQ+XQY2qbKIowB5McZb9TeoDUtRU=;
  b=O5CFGfgT4h62mptVT3HO45VWIN933VJIU5wH+MT4Llkg470igAJGwvsu
   fLAzY0hGCcs145dY4fCFvzLs7wBbnql70G+2yVpzTOl0jVJGqPREiIGic
   nJnRbxHIo0Y0zihamMlyqh0uAXAaBSozZKrkNMcMtRpUazbuVgAm1f/xl
   WYDBKpqKcrIIR97+ap5ipnaPS6R22VSKNWWvp4QVSOQKI7xO1bCac1DFw
   r8LMCvJWAogkUWySoyy0dGKIf4OjHk5Ts5tWJ05ocddc7KM2zREu5dwsx
   k8wkt7lV5eEP7V2l6Hu37oTsuLzI9m/BSUwHExXqkVo7fh0WAebfIk5aY
   g==;
X-CSE-ConnectionGUID: e1XJh7nKQw2VeqAVdjKGbQ==
X-CSE-MsgGUID: m93Y6UlsRt+kTYd0AA7nsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="255508770"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="255508770"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:45:27 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 0C49DC000AE
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Aug 2026 09:45:24 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B69DB1800264
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Aug 2026 09:45:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 8FB95200076B;
	Wed, 19 Aug 2026 09:45:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization] [meta-cloud-services] [PATCH 4/5] python3-pysnmp: replace dead pycrypto with pycryptodome and use SPDX-2 BSD-3-Clause instead of bare BSD
Date: Wed, 19 Aug 2026 17:45:11 +0800
Message-ID: <20260819094512.1153-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819094512.1153-1-wangmy@fujitsu.com>
References: <20260819094512.1153-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Aug 2026 09:45:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10046

From: Wang Mingyu <wangmy@fujitsu.com>

pycrypto is EOL upstream and gone from oe-core; pycryptodome is the maintained fork.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/python/python3-pysnmp_4.4.12.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python3-pysnmp_4.4.12.bb b/meta-openstack/recipes-devtools/python/python3-pysnmp_4.4.12.bb
index c7acfaea..4cdd76f1 100644
--- a/meta-openstack/recipes-devtools/python/python3-pysnmp_4.4.12.bb
+++ b/meta-openstack/recipes-devtools/python/python3-pysnmp_4.4.12.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "A pure-Python SNMPv1/v2c/v3 library"
 HOMEPAGE = "https://pypi.python.org/pypi/pysnmp"
 SECTION = "devel/python"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=b15d29f500f748d1c2a15709769090a8"
 
 SRC_URI[md5sum] = "2222880259daf6e2cb322e938c818276"
@@ -9,6 +9,6 @@ SRC_URI[sha256sum] = "0c3dbef2f958caca96071fe5c19de43e9c1b0484ab02a0cf08b190bcee
 
 inherit setuptools3 pypi
 
-RDEPENDS:${PN} += "${PYTHON_PN}-pycrypto \
+RDEPENDS:${PN} += "${PYTHON_PN}-pycryptodome \
                    ${PYTHON_PN}-pyasn1 \
 "
-- 
2.43.0


