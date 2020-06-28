Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.23056.1593320537013761207
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 27 Jun 2020 22:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,290,1589212800"; 
   d="scan'208";a="95408944"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jun 2020 13:02:10 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 46D234CE49B2
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 28 Jun 2020 12:51:39 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sun, 28 Jun 2020 13:02:07 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH 1/4] python3-oslo.utils: Remove inc file
Date: Sun, 28 Jun 2020 13:01:59 +0800
Message-ID: <1593320522-14645-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 46D234CE49B2.A4BE2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/python-oslo.utils.inc              | 37 ------------------
 .../python/python3-oslo.utils_git.bb          | 38 ++++++++++++++++++-
 2 files changed, 37 insertions(+), 38 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-oslo.utils.inc

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.utils.inc b/meta-openstack/recipes-devtools/python/python-oslo.utils.inc
deleted file mode 100644
index 8c3022d..0000000
--- a/meta-openstack/recipes-devtools/python/python-oslo.utils.inc
+++ /dev/null
@@ -1,37 +0,0 @@
-DESCRIPTION = "Oslo utils"
-HOMEPAGE = "https://launchpad.net/oslo"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
-
-SRCNAME = "oslo.utils"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
-
-PV = "3.28.0+git${SRCPV}"
-SRCREV = "8b3965b9bbe1e31a4939f2f69c5239d6d5c7f72c"
-S = "${WORKDIR}/git"
-
-# DEPENDS_default: python-pip
-
-DEPENDS += " \
-        ${PYTHON_PN}-pip \
-        ${PYTHON_PN}-pbr \
-        "
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-        ${PYTHON_PN}-pbr-native \
-        "
-
-# RDEPENDS_default: 
-RDEPENDS_${PN} += " \
-        ${PYTHON_PN}-pbr \
-        ${PYTHON_PN}-six \
-        ${PYTHON_PN}-iso8601 \
-        ${PYTHON_PN}-oslo.i18n \
-        ${PYTHON_PN}-pytz \
-        ${PYTHON_PN}-netaddr \
-        ${PYTHON_PN}-netifaces \
-        ${PYTHON_PN}-debtcollector \
-        ${PYTHON_PN}-pyparsing \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-oslo.utils_git.bb b/meta-openstack/recipes-devtools/python/python3-oslo.utils_git.bb
index 3b4636a..8315443 100644
--- a/meta-openstack/recipes-devtools/python/python3-oslo.utils_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-oslo.utils_git.bb
@@ -1,2 +1,38 @@
+DESCRIPTION = "Oslo utils"
+HOMEPAGE = "https://launchpad.net/oslo"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+
+SRCNAME = "oslo.utils"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
+
+PV = "3.28.0+git${SRCPV}"
+SRCREV = "8b3965b9bbe1e31a4939f2f69c5239d6d5c7f72c"
+S = "${WORKDIR}/git"
+
+# DEPENDS_default: python3-pip
 inherit setuptools3
-require python-oslo.utils.inc
+
+DEPENDS += " \
+        ${PYTHON_PN}-pip \
+        ${PYTHON_PN}-pbr \
+        "
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        ${PYTHON_PN}-pbr-native \
+        "
+
+# RDEPENDS_default:
+RDEPENDS_${PN} += " \
+        ${PYTHON_PN}-pbr \
+        ${PYTHON_PN}-six \
+        ${PYTHON_PN}-iso8601 \
+        ${PYTHON_PN}-oslo.i18n \
+        ${PYTHON_PN}-pytz \
+        ${PYTHON_PN}-netaddr \
+        ${PYTHON_PN}-netifaces \
+        ${PYTHON_PN}-debtcollector \
+        ${PYTHON_PN}-pyparsing \
+        "
-- 
2.17.1



