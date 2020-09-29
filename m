Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.12287.1601348331615456922
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Sep 2020 19:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 28BD338C06C2
	for <meta-virtualization@yoctoproject.org>; Mon, 28 Sep 2020 19:58:50 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,316,1596470400"; 
   d="scan'208";a="99697848"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Sep 2020 10:58:50 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A3CEE48990CC
	for <meta-virtualization@yoctoproject.org>; Tue, 29 Sep 2020 10:58:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 29 Sep 2020 10:58:46 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-oslo.i18n: upgrade 3.23.1 -> 5.0.1
Date: Tue, 29 Sep 2020 22:58:45 +0800
Message-ID: <1601391525-5062-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A3CEE48990CC.A4458
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.
Since python2 is no longer maintained, the recipe of python2 is removed.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-oslo.i18n.inc               | 32 -----------------
 .../python/python-oslo.i18n_3.23.1.bb         | 33 ------------------
 .../python/python3-oslo.i18n_git.bb           | 34 ++++++++++++++++++-
 3 files changed, 33 insertions(+), 66 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-oslo.i18n.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-oslo.i18n_3.23.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.i18n.inc b/meta-openstack/recipes-devtools/python/python-oslo.i18n.inc
deleted file mode 100644
index 3c0e74c..0000000
--- a/meta-openstack/recipes-devtools/python/python-oslo.i18n.inc
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION = "oslo.i18n library"
-HOMEPAGE = "http://launchpad.net/oslo"
-SECTION = "devel/python"
-LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
-
-PV = "3.17.0+git${SRCPV}"
-SRCREV = "f2729cd36f8694a6ec53a0e700599ddf4427440d"
-
-SRCNAME = "oslo.i18n"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
-
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
-        ${PYTHON_PN}-babel \
-        ${PYTHON_PN}-pbr \
-        ${PYTHON_PN}-six \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.i18n_3.23.1.bb b/meta-openstack/recipes-devtools/python/python-oslo.i18n_3.23.1.bb
deleted file mode 100644
index 1dedfa2..0000000
--- a/meta-openstack/recipes-devtools/python/python-oslo.i18n_3.23.1.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION = "oslo.i18n library"
-HOMEPAGE = "http://launchpad.net/oslo"
-SECTION = "devel/python"
-LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
-
-SRCREV = "20bbee510b9714075b7f48f7c3968d7e2bd21a8a"
-
-SRCNAME = "oslo.i18n"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools3
-
-# DEPENDS_default: python-pip
-
-DEPENDS += " \
-        python-pip \
-        python-pbr \
-        "
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-        python-pbr-native \
-        "
-
-# RDEPENDS_default: 
-RDEPENDS_${PN} += " \
-        python-babel \
-        python-pbr \
-        python-six \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-oslo.i18n_git.bb b/meta-openstack/recipes-devtools/python/python3-oslo.i18n_git.bb
index 5a06622..6cfd374 100644
--- a/meta-openstack/recipes-devtools/python/python3-oslo.i18n_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-oslo.i18n_git.bb
@@ -1,2 +1,34 @@
+DESCRIPTION = "oslo.i18n library"
+HOMEPAGE = "http://launchpad.net/oslo"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+
+PV = "5.0.1+git${SRCPV}"
+SRCREV = "73187bd86903fc87665a829c9a0c714db6aa3022"
+
+SRCNAME = "oslo.i18n"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
+
 inherit setuptools3
-require python-oslo.i18n.inc
+
+S = "${WORKDIR}/git"
+
+# DEPENDS_default: python-pip
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
+        ${PYTHON_PN}-babel \
+        ${PYTHON_PN}-pbr \
+        ${PYTHON_PN}-six \
+        "
-- 
2.25.1



