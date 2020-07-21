Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.13366.1595311096457903718
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2020 22:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,377,1589212800"; 
   d="scan'208";a="96683129"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Jul 2020 13:58:12 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 91C7F4CE1505
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jul 2020 13:58:08 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Jul 2020 13:58:07 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][PATCH] python3-barbicanclient: Change python to python3
Date: Tue, 21 Jul 2020 13:58:09 +0800
Message-ID: <1595311098-1934-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 91C7F4CE1505.A4A2F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Version updated to 5.0.0

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/python-barbicanclient_git.bb       | 36 ------------------
 .../python/python3-barbicanclient_git.bb      | 37 +++++++++++++++++++
 2 files changed, 37 insertions(+), 36 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-barbicanclient_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb b/meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb
deleted file mode 100644
index 289495a..0000000
--- a/meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-DESCRIPTION = "Client library for Barbican API"
-HOMEPAGE = "https://github.com/stackforge/python-barbicanclient"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e031cff4528978748f9cc064c6e6fa73"
-
-SRC_URI = "\
-	git://github.com/openstack/python-barbicanclient.git \
-	"
-
-PV = "4.9.0+git${SRCPV}"
-SRCREV = "9c0e02d367b86eb5bdebda4e0ff1434d70db5f61"
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
-        python-pbr \
-        python-requests \
-        python-six \
-        python-cliff \
-        python-keystoneauth1 \
-        python-oslo.i18n \
-        python-oslo.serialization \
-        python-oslo.utils \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-barbicanclient_git.bb b/meta-openstack/recipes-devtools/python/python3-barbicanclient_git.bb
new file mode 100644
index 0000000..8e99a9f
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-barbicanclient_git.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "Client library for Barbican API"
+HOMEPAGE = "https://github.com/stackforge/python3-barbicanclient"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e031cff4528978748f9cc064c6e6fa73"
+
+SRC_URI = "\
+	git://github.com/openstack/python-barbicanclient.git \
+	"
+
+PV = "5.0.0+git${SRCPV}"
+SRCREV = "904fd44ca34bea7d67c203b006443af95d4fa596"
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
+        python3-pbr \
+        python3-requests \
+        python3-six \
+        python3-cliff \
+        python3-keystoneauth1 \
+        python3-oslo.i18n \
+        python3-oslo.serialization \
+        python3-oslo.utils \
+        python3-monotonic \
+        "
-- 
2.25.1



