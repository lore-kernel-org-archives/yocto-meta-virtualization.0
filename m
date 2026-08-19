Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78813C5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:45:24 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3508.1787132722029880578
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Aug 2026 02:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NoNftVzm;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132722; x=1818668722;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qp0NcmlTLjXVfs+UH4OBUn8TPPUjVwKQUmuHBcq1kgk=;
  b=NoNftVzmWFG/mkG/OhxxfS7SF2W0J9g96j7b5fz79ir9tYDL4vCTKn9n
   48p2ehfAZGb7Gv7XBrjN3O/iq30uAK3Ql9pFldj4BRPAg8qo+xsK9Dd1M
   oWxZKrtzVnmXwR9RXdiGPN3quLRL5NjxzEfovJ9Huq4CM6ZVjnzG7Hxuq
   GxmYNX2VL0Rzpl7rIjL4nKW9ndJ3VUUSsf6wzGMm5wDwJnzhGcVuF6U+f
   WDQuYXAIY7cki5+tC+i0kX/9a9Xwd/nYDZQXieuvVbaPcJq+S7XFmGhuW
   TYGswMqq+gdJ4cBFPqWXMMtmUp2PSG8FkHwjZ93ltBehPwLA8HxSEdWeq
   Q==;
X-CSE-ConnectionGUID: varpBdd7RdG8693PR1BIig==
X-CSE-MsgGUID: 4NiLmmy7TWWiB46KYB2k3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="239836292"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="239836292"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:45:20 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3C458307C
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Aug 2026 09:45:20 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id E81AD1000104
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Aug 2026 09:45:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id E02C5200076C;
	Wed, 19 Aug 2026 09:45:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization] [meta-cloud-services] [PATCH 2/5] python3-django-nose, python3-nose-exclude: drop dead python3-nose RDEPENDS and use SPDX-2 BSD-3-Clause instead of bare BSD
Date: Wed, 19 Aug 2026 17:45:09 +0800
Message-ID: <20260819094512.1153-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819094512.1153-1-wangmy@fujitsu.com>
References: <20260819094512.1153-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Aug 2026 09:45:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10044

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/python/python3-django-nose_1.4.7.bb     | 4 ++--
 .../recipes-devtools/python/python3-nose-exclude_0.5.0.bb    | 5 -----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python3-django-nose_1.4.7.bb b/meta-openstack/recipes-devtools/python/python3-django-nose_1.4.7.bb
index 3fb8b633..fa3e3798 100644
--- a/meta-openstack/recipes-devtools/python/python3-django-nose_1.4.7.bb
+++ b/meta-openstack/recipes-devtools/python/python3-django-nose_1.4.7.bb
@@ -4,7 +4,7 @@
 DESCRIPTION = "Django test runner using nose"
 HOMEPAGE = "https://github.com/django-nose/django-nose"
 SECTION = "devel/python"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7f88f52f66738ec7259424ce46e855c2"
 
 SRC_URI[md5sum] = "fe386c6e218b0f7b353494329c380a79"
@@ -18,7 +18,7 @@ DEPENDS += " \
 
 RDEPENDS:${PN} += " \
         python3-django \
-        python3-nose \
+        python3-nose-exclude \
         python3-misc \
         "
 
diff --git a/meta-openstack/recipes-devtools/python/python3-nose-exclude_0.5.0.bb b/meta-openstack/recipes-devtools/python/python3-nose-exclude_0.5.0.bb
index 765c9b08..e8356bbe 100644
--- a/meta-openstack/recipes-devtools/python/python3-nose-exclude_0.5.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-nose-exclude_0.5.0.bb
@@ -15,8 +15,3 @@ inherit setuptools3 pypi
 DEPENDS += " \
         python3-pip \
         "
-
-RDEPENDS:${PN} += " \
-        python3-nose \
-        "
-
-- 
2.43.0


