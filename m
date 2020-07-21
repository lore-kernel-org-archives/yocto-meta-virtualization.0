Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.13399.1595311311199747741
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2020 23:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,377,1589212800"; 
   d="scan'208";a="96683375"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Jul 2020 14:01:50 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 2F9364CE4B09
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jul 2020 14:01:45 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Jul 2020 14:01:44 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][PATCH 6/6] python3-oslo.middleware: Change python to python3
Date: Tue, 21 Jul 2020 14:01:55 +0800
Message-ID: <1595311315-2133-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 2F9364CE4B09.A1D44
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Version updated to : 4.1.0

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/python-oslo.middleware_git.bb      | 42 ------------------
 .../python/python3-oslo.middleware_git.bb     | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 42 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-oslo.middleware_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-oslo.middleware_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.middleware_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.middleware_git.bb
deleted file mode 100644
index b5a6835..0000000
--- a/meta-openstack/recipes-devtools/python/python-oslo.middleware_git.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-DESCRIPTION = "Oslo Middleware library"
-HOMEPAGE = "http://launchpad.net/oslo"
-SECTION = "devel/python"
-LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
-
-PV = "3.30.1+git${SRCPV}"
-SRCREV = "d9ad4bae1e0d6c43a009d393ac94f7ff50116171"
-
-SRCNAME = "oslo.middleware"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
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
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-        python-pbr-native \
-        "
-
-
-# RDEPENDS_default: 
-RDEPENDS_${PN} += " \
-        python-pbr \
-        python-jinja2 \
-        python-oslo.config \
-        python-oslo.context \
-        python-oslo.i18n \
-        python-oslo.utils \
-        python-six \
-        python-stevedore \
-        python-webob \
-        python-debtcollector \
-        python-statsd \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-oslo.middleware_git.bb b/meta-openstack/recipes-devtools/python/python3-oslo.middleware_git.bb
new file mode 100644
index 0000000..a481818
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-oslo.middleware_git.bb
@@ -0,0 +1,43 @@
+DESCRIPTION = "Oslo Middleware library"
+HOMEPAGE = "http://launchpad.net/oslo"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+
+PV = "4.1.0+git${SRCPV}"
+SRCREV = "7355d905bc0e6b7d8884e290cc26895eed0f7179"
+
+SRCNAME = "oslo.middleware"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+# DEPENDS_default: python3-pip
+
+DEPENDS += " \
+        python3-pip \
+        python3-pbr \
+        "
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python3-pbr-native \
+        "
+
+
+# RDEPENDS_default: 
+RDEPENDS_${PN} += " \
+        python3-pbr \
+        python3-jinja2 \
+        python3-oslo.config \
+        python3-oslo.context \
+        python3-oslo.i18n \
+        python3-oslo.utils \
+        python3-six \
+        python3-stevedore \
+        python3-webob \
+        python3-debtcollector \
+        python3-statsd \
+        python3-monotonic \
+        "
-- 
2.25.1



