Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.1543.1603176192684707120
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 23:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 35DF438C06C8
	for <meta-virtualization@yoctoproject.org>; Mon, 19 Oct 2020 23:43:12 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,396,1596470400"; 
   d="scan'208";a="100322038"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Oct 2020 14:43:11 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 353F648990CC
	for <meta-virtualization@yoctoproject.org>; Tue, 20 Oct 2020 14:43:11 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 20 Oct 2020 14:43:09 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-testscenarios: Consolidate in a single file
Date: Tue, 20 Oct 2020 14:43:04 +0800
Message-ID: <1603176184-40527-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 353F648990CC.A4C16
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-testscenarios.inc           | 24 -----------------
 .../python/python3-testscenarios_0.5.0.bb     | 26 +++++++++++++++++--
 2 files changed, 24 insertions(+), 26 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-testscenarios.inc

diff --git a/meta-openstack/recipes-devtools/python/python-testscenarios.inc b/meta-openstack/recipes-devtools/python/python-testscenarios.inc
deleted file mode 100644
index 1008f11..0000000
--- a/meta-openstack/recipes-devtools/python/python-testscenarios.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "testscenarios: a pyunit extension for dependency injection"
-HOMEPAGE = "https://pypi.python.org/pypi/testscenarios"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://BSD;md5=0805e4f024d089a52dca0671a65b8b66"
-
-SRC_URI[md5sum] = "859073d9e7b049aee2e6704c51f6001a"
-SRC_URI[sha256sum] = "c257cb6b90ea7e6f8fef3158121d430543412c9a87df30b5dde6ec8b9b57a2b6"
-
-inherit pypi
-
-DEPENDS += "\
-    ${PYTHON_PN}-pbr \
-    "
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-    ${PYTHON_PN}-pbr-native \
-    "
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-testtools \
-    ${PYTHON_PN}-pbr \
-    "
diff --git a/meta-openstack/recipes-devtools/python/python3-testscenarios_0.5.0.bb b/meta-openstack/recipes-devtools/python/python3-testscenarios_0.5.0.bb
index 6f7d418..92523c2 100644
--- a/meta-openstack/recipes-devtools/python/python3-testscenarios_0.5.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-testscenarios_0.5.0.bb
@@ -1,2 +1,24 @@
-inherit setuptools3
-require python-testscenarios.inc
+DESCRIPTION = "testscenarios: a pyunit extension for dependency injection"
+HOMEPAGE = "https://pypi.python.org/pypi/testscenarios"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://BSD;md5=0805e4f024d089a52dca0671a65b8b66"
+
+SRC_URI[md5sum] = "859073d9e7b049aee2e6704c51f6001a"
+SRC_URI[sha256sum] = "c257cb6b90ea7e6f8fef3158121d430543412c9a87df30b5dde6ec8b9b57a2b6"
+
+inherit setuptools3 pypi
+
+DEPENDS += "\
+    ${PYTHON_PN}-pbr \
+    "
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+    ${PYTHON_PN}-pbr-native \
+    "
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-testtools \
+    ${PYTHON_PN}-pbr \
+    "
-- 
2.25.1



