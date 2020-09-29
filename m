Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.12599.1601349604871436315
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Sep 2020 20:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 674A038C06F7
	for <meta-virtualization@yoctoproject.org>; Mon, 28 Sep 2020 20:20:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,316,1596470400"; 
   d="scan'208";a="99698522"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Sep 2020 11:20:03 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 1C02D48990CC
	for <meta-virtualization@yoctoproject.org>; Tue, 29 Sep 2020 11:19:59 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 29 Sep 2020 11:19:56 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-pastedeploy: upgrade 2.0.1 -> 2.1.0
Date: Tue, 29 Sep 2020 11:19:53 +0800
Message-ID: <1601349593-108482-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 1C02D48990CC.A73FB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.
-License-Update: Update PKG-INFO.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-pastedeploy.inc             | 16 ----------------
 .../python/python3-pastedeploy_2.0.1.bb       |  2 --
 .../python/python3-pastedeploy_2.1.0.bb       | 19 +++++++++++++++++++
 3 files changed, 19 insertions(+), 18 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pastedeploy.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-pastedeploy_2.0.1.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-pastedeploy_2.1.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pastedeploy.inc b/meta-openstack/recipes-devtools/python/python-pastedeploy.inc
deleted file mode 100644
index db0b4ac..0000000
--- a/meta-openstack/recipes-devtools/python/python-pastedeploy.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Load, configure, and compose WSGI applications and servers"
-HOMEPAGE = "http://pythonpaste.org/deploy/"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=d6c3089319205d7e6129f0213b7e949f"
-
-PYPI_PACKAGE = "PasteDeploy"
-
-SRC_URI[md5sum] = "6193afccc0982abedb9b7711d0d6adb0"
-SRC_URI[sha256sum] = "d423fb9d51fdcf853aa4ff43ac7ec469b643ea19590f67488122d6d0d772350a"
-
-inherit pypi
-
-DEPENDS += "${PYTHON_PN}-pytest-runner-native"
-
-RDEPENDS_${PN} += "${PYTHON_PN}-paste"
diff --git a/meta-openstack/recipes-devtools/python/python3-pastedeploy_2.0.1.bb b/meta-openstack/recipes-devtools/python/python3-pastedeploy_2.0.1.bb
deleted file mode 100644
index 91c31a1..0000000
--- a/meta-openstack/recipes-devtools/python/python3-pastedeploy_2.0.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-pastedeploy.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-pastedeploy_2.1.0.bb b/meta-openstack/recipes-devtools/python/python3-pastedeploy_2.1.0.bb
new file mode 100644
index 0000000..c08644f
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-pastedeploy_2.1.0.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Load, configure, and compose WSGI applications and servers"
+HOMEPAGE = "http://pythonpaste.org/deploy/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=57609488f8ad28ebf6844a5169a85215"
+
+PYPI_PACKAGE = "PasteDeploy"
+
+SRC_URI[md5sum] = "f1e62dc76092433b7ae150cd81603fbd"
+SRC_URI[sha256sum] = "e7559878b6e92023041484be9bcb6d767cf4492fc3de7257a5dae76a7cc11a9b"
+
+inherit setuptools3 pypi
+
+DEPENDS += "${PYTHON_PN}-pytest-runner-native"
+
+RDEPENDS_${PN} += " \
+	${PYTHON_PN}-paste \
+	${PYTHON_PN}-setuptools \
+"
-- 
2.25.1



