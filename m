Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.4674.1600741657733523776
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Sep 2020 19:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 324CE38C0848
	for <meta-virtualization@yoctoproject.org>; Mon, 21 Sep 2020 19:27:36 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,288,1596470400"; 
   d="scan'208";a="99489001"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Sep 2020 10:27:36 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id EEE4748990D3
	for <meta-virtualization@yoctoproject.org>; Tue, 22 Sep 2020 10:27:32 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 22 Sep 2020 10:27:30 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-logutils: Consolidate in a single file
Date: Tue, 22 Sep 2020 10:27:37 +0800
Message-ID: <1600741657-124205-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: EEE4748990D3.A71AB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-logutils.inc                 | 16 ----------------
 .../python/python3-logutils_0.3.5.bb           | 18 ++++++++++++++++--
 2 files changed, 16 insertions(+), 18 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-logutils.inc

diff --git a/meta-openstack/recipes-devtools/python/python-logutils.inc b/meta-openstack/recipes-devtools/python/python-logutils.inc
deleted file mode 100644
index 87ab631..0000000
--- a/meta-openstack/recipes-devtools/python/python-logutils.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Set of handlers for the Python standard library's logging package"
-HOMEPAGE = "https://pypi.python.org/pypi/logutils"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=44c35f0b8e2a27a2f33a4e4a5c65d014"
-
-SRC_URI[md5sum] = "fcd2f8e9217bfa0b580f253b35a9d954"
-SRC_URI[sha256sum] = "bc058a25d5c209461f134e1f03cab637d66a7a5ccc12e593db56fbb279899a82"
-
-inherit pypi
-
-# avoid "error: option --single-version-externally-managed not recognized"
-DISTUTILS_INSTALL_ARGS = "--root=${D} \
-    --prefix=${prefix} \
-    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
-    --install-data=${datadir}"
diff --git a/meta-openstack/recipes-devtools/python/python3-logutils_0.3.5.bb b/meta-openstack/recipes-devtools/python/python3-logutils_0.3.5.bb
index 4d760e0..c006855 100644
--- a/meta-openstack/recipes-devtools/python/python3-logutils_0.3.5.bb
+++ b/meta-openstack/recipes-devtools/python/python3-logutils_0.3.5.bb
@@ -1,2 +1,16 @@
-inherit setuptools3
-require python-logutils.inc
+DESCRIPTION = "Set of handlers for the Python standard library's logging package"
+HOMEPAGE = "https://pypi.python.org/pypi/logutils"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=44c35f0b8e2a27a2f33a4e4a5c65d014"
+
+SRC_URI[md5sum] = "fcd2f8e9217bfa0b580f253b35a9d954"
+SRC_URI[sha256sum] = "bc058a25d5c209461f134e1f03cab637d66a7a5ccc12e593db56fbb279899a82"
+
+inherit setuptools3 pypi
+
+# avoid "error: option --single-version-externally-managed not recognized"
+DISTUTILS_INSTALL_ARGS = "--root=${D} \
+    --prefix=${prefix} \
+    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
+    --install-data=${datadir}"
-- 
2.25.1



