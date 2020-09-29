Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.12318.1601348319166880359
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Sep 2020 19:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id ACA6C38C06C2
	for <meta-virtualization@yoctoproject.org>; Mon, 28 Sep 2020 19:58:38 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,316,1596470400"; 
   d="scan'208";a="99697833"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Sep 2020 10:58:37 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 400EF48990F2
	for <meta-virtualization@yoctoproject.org>; Tue, 29 Sep 2020 10:58:37 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 29 Sep 2020 10:58:36 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-oslo.db: change to python3
Date: Tue, 29 Sep 2020 22:58:34 +0800
Message-ID: <1601391514-5000-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 400EF48990F2.A11F6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python2 is no longer maintained, bb file is changed to python3 version.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-oslo.db_git.bb              | 38 -------------------
 .../python/python3-oslo.db_git.bb             | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 38 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-oslo.db_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-oslo.db_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.db_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.db_git.bb
deleted file mode 100644
index a330ed4..0000000
--- a/meta-openstack/recipes-devtools/python/python-oslo.db_git.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-DESCRIPTION = "oslo.db library"
-HOMEPAGE = "http://launchpad.net/oslo"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
-
-PV = "4.25.0+git${SRCPV}"
-SRCREV = "71607d59ec5c02d7beb5109c500aa9b6a0d9ee2c"
-
-SRCNAME = "oslo.db"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools3
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
-RDEPENDS_${PN} += " \
-       python-six \
-       python-alembic \
-       python-oslo.config \
-       python-oslo.i18n \
-       python-oslo.utils \
-       python-sqlalchemy \
-       python-sqlalchemy-migrate \
-       python-stevedore \
-       python-pbr \
-       python-debtcollector \
-       "
diff --git a/meta-openstack/recipes-devtools/python/python3-oslo.db_git.bb b/meta-openstack/recipes-devtools/python/python3-oslo.db_git.bb
new file mode 100644
index 0000000..3a78391
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-oslo.db_git.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "oslo.db library"
+HOMEPAGE = "http://launchpad.net/oslo"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+
+PV = "8.4.0+git${SRCPV}"
+SRCREV = "e42c73343f640eaacb0a76d204eb55c85de4f5d5"
+
+SRCNAME = "oslo.db"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+DEPENDS += " \
+        python3-pip \
+        python3-pbr \
+        "
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python3-pbr-native \
+        "
+
+RDEPENDS_${PN} += " \
+       python3-six \
+       python3-alembic \
+       python3-oslo.config \
+       python3-oslo.i18n \
+       python3-oslo.utils \
+       python3-sqlalchemy \
+       python3-sqlalchemy-migrate \
+       python3-stevedore \
+       python3-pbr \
+       python3-debtcollector \
+       "
-- 
2.25.1



