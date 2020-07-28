Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.2320.1595897094431810982
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jul 2020 17:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,404,1589212800"; 
   d="scan'208";a="96959706"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jul 2020 08:44:56 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 7B2604CE2808
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2020 08:44:51 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 28 Jul 2020 08:44:50 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [PATCH 3/3] [meta-virtualization][PATCH] python3-keystonemiddleware: Change python to python3
Date: Tue, 28 Jul 2020 08:44:57 +0800
Message-ID: <1595897097-20455-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595897097-20455-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1595897097-20455-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 7B2604CE2808.A3497
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Version updated to 4.17.1

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/python-keystonemiddleware_git.bb   | 44 -------------------
 .../python/python3-keystonemiddleware_git.bb  | 44 +++++++++++++++++++
 2 files changed, 44 insertions(+), 44 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-keystonemiddleware_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-keystonemiddleware_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-keystonemiddleware_git.bb b/meta-openstack/recipes-devtools/python/python-keystonemiddleware_git.bb
deleted file mode 100644
index c730906..0000000
--- a/meta-openstack/recipes-devtools/python/python-keystonemiddleware_git.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-DESCRIPTION = "Middleware for OpenStack Identity API"
-HOMEPAGE = "https://launchpad.net/keystonemiddleware"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4a4d0e932ffae1c0131528d30d419c55"
-
-SRCNAME = "keystonemiddleware"
-
-SRC_URI = "\
-	git://git.openstack.org/openstack/keystonemiddleware;branch=stable/pike \
-	"
-
-PV = "4.17.0+git${SRCPV}"
-SRCREV = "69aed2693475797c8d0dda2725a790eea05a9419"
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
-        python-keystoneauth1 \
-        python-oslo.config \
-        python-oslo.context \
-        python-oslo.i18n \
-        python-oslo.log \
-        python-oslo.serialization \
-        python-oslo.utils \
-        python-pbr \
-        python-positional \
-        python-pycadf \
-        python-keystoneclient \
-        python-requests \
-        python-six \
-        python-webob \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-keystonemiddleware_git.bb b/meta-openstack/recipes-devtools/python/python3-keystonemiddleware_git.bb
new file mode 100644
index 0000000..b9f0f79
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-keystonemiddleware_git.bb
@@ -0,0 +1,44 @@
+DESCRIPTION = "Middleware for OpenStack Identity API"
+HOMEPAGE = "https://launchpad.net/keystonemiddleware"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4a4d0e932ffae1c0131528d30d419c55"
+
+SRCNAME = "keystonemiddleware"
+
+SRC_URI = "\
+	git://git.openstack.org/openstack/keystonemiddleware;branch=stable/pike \
+	"
+
+PV = "4.17.1+git${SRCPV}"
+SRCREV = "6712e8b7125fcbcf891b7e89ecb240798dad28ac"
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
+        python3-keystoneauth1 \
+        python3-oslo.config \
+        python3-oslo.context \
+        python3-oslo.i18n \
+        python3-oslo.log \
+        python3-oslo.serialization \
+        python3-oslo.utils \
+        python3-pbr \
+        python3-positional \
+        python3-pycadf \
+        python3-keystoneclient \
+        python3-requests \
+        python3-six \
+        python3-webob \
+        "
-- 
2.17.1



