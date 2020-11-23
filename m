Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.30785.1606110137302694659
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Nov 2020 21:42:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id CB7DE38C0532
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 05:42:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,361,1599494400"; 
   d="scan'208";a="101645274"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Nov 2020 13:42:15 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 3D4F64CE5474
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 13:42:13 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 23 Nov 2020 13:42:11 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-manilaclient: Change to python3
Date: Mon, 23 Nov 2020 22:42:07 +0800
Message-ID: <1606142527-3679-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 3D4F64CE5474.A3418
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-manilaclient_git.bb         | 40 -------------------
 .../python/python3-manilaclient_2.3.0.bb      | 37 +++++++++++++++++
 2 files changed, 37 insertions(+), 40 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-manilaclient_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-manilaclient_2.3.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb b/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb
deleted file mode 100644
index 2748efc2..00000000
--- a/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-DESCRIPTION = "Python bindings to the OpenStack Manila API"
-HOMEPAGE = "https://github.com/openstack/python-manilaclient"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9edbbf5857ab51214ef0e8b79069bb07"
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
-RDEPENDS_${PN} +=" \
-        python-pbr \
-        python-iso8601 \
-        python-oslo.config \
-        python-oslo.log \
-        python-oslo.serialization \
-        python-oslo.utils \
-        python-prettytable \
-        python-pycrypto \
-        python-requests \
-        python-simplejson \
-        python-babel \
-        python-six \
-        python-keystoneclient \
-	"
-
-SRCNAME = "manilaclient"
-SRC_URI = "git://github.com/openstack/${BPN}.git;branch=master"
-
-PV = "1.29.0+git${SRCPV}"
-SRCREV = "1b2cafb008bee70242b68a03212bcc575df683b9"
-S = "${WORKDIR}/git"
-
-inherit setuptools3 rmargparse
diff --git a/meta-openstack/recipes-devtools/python/python3-manilaclient_2.3.0.bb b/meta-openstack/recipes-devtools/python/python3-manilaclient_2.3.0.bb
new file mode 100644
index 00000000..78403c2d
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-manilaclient_2.3.0.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "Python bindings to the OpenStack Manila API"
+HOMEPAGE = "https://github.com/openstack/python-manilaclient"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9edbbf5857ab51214ef0e8b79069bb07"
+
+SRC_URI[sha256sum] = "7b5b3215215a720ace08e53caca447a605dee9c8b3b3cfaa302b6bc7e63e4a28"
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
+RDEPENDS_${PN} +=" \
+        python3-pbr \
+        python3-iso8601 \
+        python3-oslo.config \
+        python3-oslo.log \
+        python3-oslo.serialization \
+        python3-oslo.utils \
+        python3-prettytable \
+        python3-pycrypto \
+        python3-requests \
+        python3-simplejson \
+        python3-babel \
+        python3-six \
+        python3-keystoneclient \
+	"
+
+PYPI_PACKAGE = "python-manilaclient"
+
+inherit setuptools3 pypi
-- 
2.25.1



