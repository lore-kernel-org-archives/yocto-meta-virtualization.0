Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.9549.1603775097191394313
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 22:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id B237E38C1176
	for <meta-virtualization@yoctoproject.org>; Mon, 26 Oct 2020 22:04:56 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,422,1596470400"; 
   d="scan'208";a="100541519"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Oct 2020 13:04:56 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 6584748990DE
	for <meta-virtualization@yoctoproject.org>; Tue, 27 Oct 2020 13:04:52 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 27 Oct 2020 13:04:51 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-positional: Consolidate in a single file
Date: Tue, 27 Oct 2020 13:04:52 +0800
Message-ID: <1603775092-49376-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6584748990DE.A16DB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-positional.inc              | 21 -----------------
 .../python/python3-positional_1.2.1.bb        | 23 +++++++++++++++++--
 2 files changed, 21 insertions(+), 23 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-positional.inc

diff --git a/meta-openstack/recipes-devtools/python/python-positional.inc b/meta-openstack/recipes-devtools/python/python-positional.inc
deleted file mode 100644
index 736e691..0000000
--- a/meta-openstack/recipes-devtools/python/python-positional.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "Library to enforce positional or key-word arguments"
-HOMEPAGE = "https://github.com/morganfainberg/positional"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5335066555b14d832335aa4660d6c376"
-
-SRC_URI[md5sum] = "4afcffd8e2ba733fd7a50f137a2ee893"
-SRC_URI[sha256sum] = "cf48ea169f6c39486d5efa0ce7126a97bed979a52af6261cf255a41f9a74453a"
-
-inherit pypi
-
-CLEANBROKEN = "1"
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-        ${PYTHON_PN}-pbr-native \
-        "
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-wrapt \
-"
diff --git a/meta-openstack/recipes-devtools/python/python3-positional_1.2.1.bb b/meta-openstack/recipes-devtools/python/python3-positional_1.2.1.bb
index 3081cd2..5e2f178 100644
--- a/meta-openstack/recipes-devtools/python/python3-positional_1.2.1.bb
+++ b/meta-openstack/recipes-devtools/python/python3-positional_1.2.1.bb
@@ -1,2 +1,21 @@
-inherit setuptools3
-require python-positional.inc
+DESCRIPTION = "Library to enforce positional or key-word arguments"
+HOMEPAGE = "https://github.com/morganfainberg/positional"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5335066555b14d832335aa4660d6c376"
+
+SRC_URI[md5sum] = "4afcffd8e2ba733fd7a50f137a2ee893"
+SRC_URI[sha256sum] = "cf48ea169f6c39486d5efa0ce7126a97bed979a52af6261cf255a41f9a74453a"
+
+inherit setuptools3 pypi
+
+CLEANBROKEN = "1"
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        ${PYTHON_PN}-pbr-native \
+        "
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-wrapt \
+"
-- 
2.25.1



