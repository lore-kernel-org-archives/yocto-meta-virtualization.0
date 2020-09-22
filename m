Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.4650.1600741695222797041
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Sep 2020 19:28:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id B0E4838C0638
	for <meta-virtualization@yoctoproject.org>; Mon, 21 Sep 2020 19:28:14 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,288,1596470400"; 
   d="scan'208";a="99489033"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Sep 2020 10:28:13 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id CC5AD48990F2
	for <meta-virtualization@yoctoproject.org>; Tue, 22 Sep 2020 10:28:12 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 22 Sep 2020 10:28:10 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-memcache: upgrade 1.2.9 -> 3.4.0
Date: Tue, 22 Sep 2020 10:28:17 +0800
Message-ID: <1600741697-124327-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: CC5AD48990F2.A78DD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.
-License-Update: Update PKG-INFO.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-memcache.inc                | 22 ----------------
 .../python/python3-memcache_1.2.9.bb          |  2 --
 .../python/python3-memcache_3.4.0.bb          | 26 +++++++++++++++++++
 3 files changed, 26 insertions(+), 24 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-memcache.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-memcache_1.2.9.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-memcache_3.4.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-memcache.inc b/meta-openstack/recipes-devtools/python/python-memcache.inc
deleted file mode 100644
index 61fe67d..0000000
--- a/meta-openstack/recipes-devtools/python/python-memcache.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "A comprehensive, fast, pure Python memcached client"
-HOMEPAGE = "https://github.com/Pinterest/pymemcache"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e8538d10fb74087ea2dc61033b6ebf9f"
-
-PYPI_PACKAGE = "pymemcache"
-
-SRC_URI[md5sum] = "215510250997423a2a57da061b1bd592"
-SRC_URI[sha256sum] = "05fd71f0337384024cc3d1340d35fd0d46307cf711eac9365b0eb166812bb121"
-
-inherit pypi
-
-# DEPENDS_default: python-pip
-
-DEPENDS += " \
-        ${PYTHON_PN}-pip \
-        "
-
-# RDEPENDS_default: 
-RDEPENDS_${PN} += " \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-memcache_1.2.9.bb b/meta-openstack/recipes-devtools/python/python3-memcache_1.2.9.bb
deleted file mode 100644
index 08ecb7b..0000000
--- a/meta-openstack/recipes-devtools/python/python3-memcache_1.2.9.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-memcache.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-memcache_3.4.0.bb b/meta-openstack/recipes-devtools/python/python3-memcache_3.4.0.bb
new file mode 100644
index 0000000..8d189f8
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-memcache_3.4.0.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "A comprehensive, fast, pure Python memcached client"
+HOMEPAGE = "https://github.com/Pinterest/pymemcache"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=efde6ee9f51b69abbdca7d447b0d1488"
+
+PYPI_PACKAGE = "pymemcache"
+
+SRC_URI[md5sum] = "f0da0618d828f67ff3e0742c9ace3cd7"
+SRC_URI[sha256sum] = "47882ab1c7e5e1dea67df8aa9faf410ce82e606fd5f29501273a60ff61d7cc99"
+
+inherit setuptools3 pypi
+
+# DEPENDS_default: python-pip
+
+DEPENDS += " \
+        ${PYTHON_PN}-pip \
+        ${PYTHON_PN}-six-native \
+        "
+
+# RDEPENDS_default: 
+RDEPENDS_${PN} += " \
+        ${PYTHON_PN}-io \
+        ${PYTHON_PN}-six \
+        ${PYTHON_PN}-logging \
+        "
-- 
2.25.1



