Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81583C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:45:24 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3507.1787132720281837314
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Aug 2026 02:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aIG0tmCr;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132726; x=1818668726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aH3otso6k7gLAvBPKn1L2uI6lVPYunjA+LIc+e/wUBY=;
  b=aIG0tmCrfx0biQ8jn6wbaK18ORV3LNBYh+degQdpSIn+PEFtd/vKq5aa
   I+WpROvu9B4pVEinjZo6fOKSPG2szpEvC47QxHJcFKYOgmkqWOy7efSgc
   J5BJsrUmgKlo6BgDl0effB/kHY+OmlJv+YdGs1lEoZlYz8WxiNqUrUms/
   FwX8dz+8qPkdb8z3MuVJvcp9WIDFyx5uYz+qiXPJzoo4vLJLxsHCikC3B
   o6+PWcbvtJ2VE4tZ2uZb6RNKJBnsdiLVb5HUMICS7/vNFZjTiDsHztxCT
   gdkiRtoy2plK5sq5BvRRJR1MSnoeHlLWT++yAzYcVPlgAPOJh223U4IX4
   g==;
X-CSE-ConnectionGUID: +2h1biLbS8K+Dxc5zQvfFg==
X-CSE-MsgGUID: u/g43mpkQYasezL3HqQk5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="255508767"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="255508767"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:45:25 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 165761C000EA
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Aug 2026 09:45:22 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B95FB1C0029E
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Aug 2026 09:45:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id B8225200076D;
	Wed, 19 Aug 2026 09:45:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization] [meta-cloud-services] [PATCH 3/5] python3-pecan: migrate to python_setuptools_build_meta and use SPDX-2 BSD-3-Clause instead of bare BSD
Date: Wed, 19 Aug 2026 17:45:10 +0800
Message-ID: <20260819094512.1153-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819094512.1153-1-wangmy@fujitsu.com>
References: <20260819094512.1153-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Aug 2026 09:45:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10045

From: Wang Mingyu <wangmy@fujitsu.com>

PEP 517 backend switch and the scripts= sed in setup.py.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/python/python3-pecan_1.4.0.bb        | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python3-pecan_1.4.0.bb b/meta-openstack/recipes-devtools/python/python3-pecan_1.4.0.bb
index b772ca40..b8ed8231 100644
--- a/meta-openstack/recipes-devtools/python/python3-pecan_1.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-pecan_1.4.0.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "WSGI object-dispatching web framework"
 HOMEPAGE = "https://pypi.python.org/pypi/pecan/"
 SECTION = "devel/python"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d846877d24bbb3d7a00a985c90378e8c"
 
 SRC_URI[md5sum] = "70667908b648043bc8a3fcb7d1e4d53a"
 SRC_URI[sha256sum] = "4b2acd6802a04b59e306d0a6ccf37701d24376f4dc044bbbafba3afdf9d3389a"
 
-inherit setuptools3 pypi
+inherit python_setuptools_build_meta pypi
 
 RDEPENDS:${PN} = "${PYTHON_PN}-mako \
                   ${PYTHON_PN}-webtest \
@@ -17,3 +17,7 @@ RDEPENDS:${PN} = "${PYTHON_PN}-mako \
                   ${PYTHON_PN}-backlash \
                   ${PYTHON_PN}-pprint \
 "
+
+do_configure:prepend() {
+    sed -i "/scripts.*bin\/pecan/d" ${S}/setup.py
+}
-- 
2.43.0


