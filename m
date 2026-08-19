Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A64C5DF87
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:45:24 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3507.1787132720281837314
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Aug 2026 02:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HlxMDgbY;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132724; x=1818668724;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tSafQ/iwNr+APz7UwBxyU9njyBFr1UIrYJYwJVWZhLs=;
  b=HlxMDgbYqnKj0rcmgiWZ3fHNUGB67wGEAULWQpCW8+k6lpw4w+bzJoHj
   kGarBJinrohwvU56Pps7cxorrEalpbyUA3M7oKU31wTCbmdL4bQQrpzd8
   ajzsD/qFPDhsf6tfzlH6eRqda4A4KYSx2X2AkCh0zhEPaYTZlfIwK56Uw
   xAj5uaQ9AJsTeHOSjiNb80I6TBtu33ARmmiRK6/JH4XuxR9PAwSM8Hrec
   1+mu+1P1SSbmNj+LgHMNAjLN6pxhsLZxAdIVK+gGxEc98tV1alQ8Lvxqz
   xsO0frsqIv2GTLM70jP0I2HAc/Lx7kiG/n79J2fD+gMB3Y14qpDZxeg8X
   A==;
X-CSE-ConnectionGUID: 3I4a0YVST8WI473n0HdCPw==
X-CSE-MsgGUID: gFlyTATRR5GGGHJnuuEHaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="255508760"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="255508760"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:45:22 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 8582E8200BD
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Aug 2026 09:45:18 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 398E91800264
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Aug 2026 09:45:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 11EE7200076A;
	Wed, 19 Aug 2026 09:45:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization] [meta-cloud-services] [PATCH 1/5] python3-*: Use SPDX-2 BSD-3-Clause instead of bare BSD
Date: Wed, 19 Aug 2026 17:45:08 +0800
Message-ID: <20260819094512.1153-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Aug 2026 09:45:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10043

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/python/python3-cssselect_1.1.0.bb          | 2 +-
 .../recipes-devtools/python/python3-django-appconf_1.0.4.bb     | 2 +-
 .../recipes-devtools/python/python3-django-babel_0.6.2.bb       | 2 +-
 .../recipes-devtools/python/python3-dogpile.cache_1.1.2.bb      | 2 +-
 meta-openstack/recipes-devtools/python/python3-kombu_5.0.2.bb   | 2 +-
 .../recipes-devtools/python/python3-logutils_0.3.5.bb           | 2 +-
 .../recipes-devtools/python/python3-setuptools-git_1.2.bb       | 2 +-
 .../recipes-devtools/python/python3-unicodecsv_0.14.1.bb        | 2 +-
 .../recipes-devtools/python/python3-voluptuous_0.12.0.bb        | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python3-cssselect_1.1.0.bb b/meta-openstack/recipes-devtools/python/python3-cssselect_1.1.0.bb
index a13a2183..592c640c 100644
--- a/meta-openstack/recipes-devtools/python/python3-cssselect_1.1.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-cssselect_1.1.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "cssselect parses CSS3 Selectors and translates them to XPath 1.0"
 HOMEPAGE = "http://packages.python.org/cssselect/"
 SECTION = "devel/python"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=952026b3fd2f625f2a3c0aa21da2493d"
 
 SRC_URI[md5sum] = "fa57704c1cb66cc8e537b782bd6b227e"
diff --git a/meta-openstack/recipes-devtools/python/python3-django-appconf_1.0.4.bb b/meta-openstack/recipes-devtools/python/python3-django-appconf_1.0.4.bb
index cffcb353..7d334e81 100644
--- a/meta-openstack/recipes-devtools/python/python3-django-appconf_1.0.4.bb
+++ b/meta-openstack/recipes-devtools/python/python3-django-appconf_1.0.4.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "A helper class for handling configuration defaults of packaged apps gracefully."
 HOMEPAGE = "http://django-appconf.readthedocs.org/"
 SECTION = "devel/python"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3f34b9b2f6413fd5f91869fa7e992457"
 
 SRC_URI[md5sum] = "da4a355140acaa3eeb236987ab174e9d"
diff --git a/meta-openstack/recipes-devtools/python/python3-django-babel_0.6.2.bb b/meta-openstack/recipes-devtools/python/python3-django-babel_0.6.2.bb
index 0c4dd755..0cca5755 100644
--- a/meta-openstack/recipes-devtools/python/python3-django-babel_0.6.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-django-babel_0.6.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Tools for using Babel with Django"
 HOMEPAGE = "https://github.com/python-babel/django-babel"
 SECTION = "devel/python"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5ae97ab65116b8d7890c59de57577b46"
 
 inherit setuptools3 pypi
diff --git a/meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.1.2.bb b/meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.1.2.bb
index 41e36333..f0970942 100644
--- a/meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.1.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.1.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Python Dogpile Cache: A caching front-end based on the Dogpile lock"
 HOMEPAGE = "https://pypi.python.org/pypi/dogpile.cache"
 SECTION = "devel/python"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6d830a549d9d8c25362346e0f8fbba53"
 
 SRC_URI[md5sum] = "fb9bea726156560d03890599c4cd92e0"
diff --git a/meta-openstack/recipes-devtools/python/python3-kombu_5.0.2.bb b/meta-openstack/recipes-devtools/python/python3-kombu_5.0.2.bb
index bd06f3ee..a3c97314 100644
--- a/meta-openstack/recipes-devtools/python/python3-kombu_5.0.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-kombu_5.0.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "A messaging framework for Python"
 HOMEPAGE = "http://kombu.readthedocs.org"
 SECTION = "devel/python"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
 
 SRC_URI[md5sum] = "52192e631ac39a443fb1abeb52299f22"
diff --git a/meta-openstack/recipes-devtools/python/python3-logutils_0.3.5.bb b/meta-openstack/recipes-devtools/python/python3-logutils_0.3.5.bb
index c0068559..2024ee0d 100644
--- a/meta-openstack/recipes-devtools/python/python3-logutils_0.3.5.bb
+++ b/meta-openstack/recipes-devtools/python/python3-logutils_0.3.5.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Set of handlers for the Python standard library's logging package"
 HOMEPAGE = "https://pypi.python.org/pypi/logutils"
 SECTION = "devel/python"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=44c35f0b8e2a27a2f33a4e4a5c65d014"
 
 SRC_URI[md5sum] = "fcd2f8e9217bfa0b580f253b35a9d954"
diff --git a/meta-openstack/recipes-devtools/python/python3-setuptools-git_1.2.bb b/meta-openstack/recipes-devtools/python/python3-setuptools-git_1.2.bb
index 98fec91f..7554cc33 100644
--- a/meta-openstack/recipes-devtools/python/python3-setuptools-git_1.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-setuptools-git_1.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Plugin for setuptools that enables git integration"
 HOMEPAGE = "https://github.com/wichert/setuptools-git"
 SECTION = "devel/python"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3775480a712fc46a69647678acb234cb"
 
 SRC_URI[md5sum] = "40b2ef7687a384ea144503c2e5bc67e2"
diff --git a/meta-openstack/recipes-devtools/python/python3-unicodecsv_0.14.1.bb b/meta-openstack/recipes-devtools/python/python3-unicodecsv_0.14.1.bb
index b11c3d85..3520a980 100644
--- a/meta-openstack/recipes-devtools/python/python3-unicodecsv_0.14.1.bb
+++ b/meta-openstack/recipes-devtools/python/python3-unicodecsv_0.14.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Python2's stdlib csv module replacement with unicode support"
 HOMEPAGE = "https://github.com/jdunck/python-unicodecsv"
 SECTION = "devel/python"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=776dee90d219355b4ffd5c06fda5a39d"
 
diff --git a/meta-openstack/recipes-devtools/python/python3-voluptuous_0.12.0.bb b/meta-openstack/recipes-devtools/python/python3-voluptuous_0.12.0.bb
index 3e77e306..7b5e50b3 100644
--- a/meta-openstack/recipes-devtools/python/python3-voluptuous_0.12.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-voluptuous_0.12.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Voluptuous is a Python data validation library"
 HOMEPAGE = "https://pypi.python.org/pypi/voluptuous/"
 SECTION = "devel/python"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9855ba150f2edb00d8e7a41554896ffb"
 
 SRC_URI[md5sum] = "4b628978d320baeee543ee407aefc0b1"
-- 
2.43.0


