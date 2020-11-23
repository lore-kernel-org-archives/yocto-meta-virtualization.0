Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.30778.1606110119362277982
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Nov 2020 21:41:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id D27A738C0532
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 05:41:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,361,1599494400"; 
   d="scan'208";a="101645265"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Nov 2020 13:41:57 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 6541A4CE5475
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 13:41:55 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 23 Nov 2020 13:41:53 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-magnumclient: Change to python3
Date: Mon, 23 Nov 2020 22:41:53 +0800
Message-ID: <1606142513-3634-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 6541A4CE5475.A3056
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-magnumclient_git.bb         | 39 -------------------
 .../python/python3-magnumclient_3.2.1.bb      | 36 +++++++++++++++++
 2 files changed, 36 insertions(+), 39 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-magnumclient_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-magnumclient_3.2.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-magnumclient_git.bb b/meta-openstack/recipes-devtools/python/python-magnumclient_git.bb
deleted file mode 100644
index 959852b0..00000000
--- a/meta-openstack/recipes-devtools/python/python-magnumclient_git.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-DESCRIPTION = "Python client for containers service"
-HOMEPAGE = "https://github.com/openstack/python-magnumclient"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
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
-        python-babel \
-        python-oslo.config \
-        python-oslo.i18n \
-        python-oslo.serialization \
-        python-oslo.utils \
-        python-iso8601 \
-        python-requests \
-        python-keystoneclient \
-        python-pyyaml \
-        python-stevedore \
-        python-six \
-	"
-
-SRCNAME = "magnumclient"
-SRC_URI = "git://github.com/openstack/${BPN}.git;branch=master"
-
-PV = "1.0.0.0b1+git${SRCPV}"
-SRCREV = "fb1ff6777eb96a5b7ba38156bf8354cda9b88ad4"
-S = "${WORKDIR}/git"
-
-inherit setuptools3 rmargparse
diff --git a/meta-openstack/recipes-devtools/python/python3-magnumclient_3.2.1.bb b/meta-openstack/recipes-devtools/python/python3-magnumclient_3.2.1.bb
new file mode 100644
index 00000000..28af248b
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-magnumclient_3.2.1.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "Python client for containers service"
+HOMEPAGE = "https://github.com/openstack/python-magnumclient"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
+
+SRC_URI[sha256sum] = "3d03a3a3cf4b9ece4e903a77415356767c2bea44ce5c1449a00edb527fc9cb0e"
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
+        python3-babel \
+        python3-oslo.config \
+        python3-oslo.i18n \
+        python3-oslo.serialization \
+        python3-oslo.utils \
+        python3-iso8601 \
+        python3-requests \
+        python3-keystoneclient \
+        python3-pyyaml \
+        python3-stevedore \
+        python3-six \
+	"
+
+PYPI_PACKAGE = "python-magnumclient"
+
+inherit setuptools3 pypi 
-- 
2.25.1



