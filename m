Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C74C5AC67
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 02:50:49 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35186.1786071044257587863
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 19:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=D4IfNTQU;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1786071044; x=1817607044;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ulYVNodlI0qET+UH5zmnY/mxLcmUCsjol1ZkJN3GGjY=;
  b=D4IfNTQUIDoa7jC/p6aL5WioLa3gGk136/X78zwfTNTl7DZasMKRqkSe
   Y5qU2PmO/e0WlozRMyoQeUSIhQ3qgT7V+fXIoASaBngyqo6HS+T1GZ8vk
   4CLW2S/zU4hPTnao5qqEcpbWIuUJ6et1kgP9rHQKPDCAUUHacWr83Hphh
   uaH2+Wkdp1GLCvdCTL0U9c5cCAZV4dne+hqSoaT8Hq2uo8LdOH/VG2Tzp
   AScZgxVAG7XHAA1maHwn78LI4aIAIH+OY4c26BIpdm7VOaAnqwsqm7J0Q
   nfO71bdBWh7aZe2sVPDmoBCK0SuSE6rOiF7RCEPLPUussrncohOXbEdGg
   A==;
X-CSE-ConnectionGUID: dTZsZFBaTs6Pbx5WrFiZPQ==
X-CSE-MsgGUID: rXJTbAyVSaqeqBxjrFuyFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="236203809"
X-IronPort-AV: E=Sophos;i="6.25,209,1779116400"; 
   d="scan'208";a="236203809"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 11:50:42 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 49C258204D6
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  7 Aug 2026 02:50:42 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 054D1C0737D
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  7 Aug 2026 02:50:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 2B30440432B;
	Fri,  7 Aug 2026 02:50:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization] [meta-cloud-services] [PATCH] fix license error
Date: Fri,  7 Aug 2026 10:50:35 +0800
Message-ID: <20260807025036.1571-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 07 Aug 2026 02:50:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10032

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-cssselect_1.1.0.bb                 |  2 +-
 .../python/python3-django-appconf_1.0.4.bb            |  2 +-
 .../python/python3-django-babel_0.6.2.bb              |  2 +-
 .../python/python3-django-nose_1.4.7.bb               |  4 ++--
 .../python/python3-dogpile.cache_1.1.2.bb             |  2 +-
 .../recipes-devtools/python/python3-kombu_5.0.2.bb    |  2 +-
 .../recipes-devtools/python/python3-logutils_0.3.5.bb |  2 +-
 .../python/python3-nose-exclude_0.5.0.bb              |  5 -----
 .../recipes-devtools/python/python3-pecan_1.4.0.bb    |  8 ++++++--
 .../recipes-devtools/python/python3-pysnmp_4.4.12.bb  |  4 ++--
 .../python/python3-setuptools-git_1.2.bb              |  2 +-
 ...narios_0.5.0.bb => python3-testscenarios_0.6.2.bb} | 11 ++++++-----
 .../python/python3-unicodecsv_0.14.1.bb               |  2 +-
 .../python/python3-voluptuous_0.12.0.bb               |  2 +-
 14 files changed, 25 insertions(+), 25 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-testscenarios_0.5.0.bb => python3-testscenarios_0.6.2.bb} (61%)

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


