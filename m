Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.12130.1601348308264562389
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Sep 2020 19:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id A2D4838C074C
	for <meta-virtualization@yoctoproject.org>; Mon, 28 Sep 2020 19:58:27 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,316,1596470400"; 
   d="scan'208";a="99697800"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Sep 2020 10:58:13 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 1634248990E8
	for <meta-virtualization@yoctoproject.org>; Tue, 29 Sep 2020 10:58:09 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 29 Sep 2020 10:58:07 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-ordereddict: Consolidate in a single file
Date: Tue, 29 Sep 2020 22:58:07 +0800
Message-ID: <1601391487-4886-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 1634248990E8.AF503
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-ordereddict.inc             | 21 -----------------
 .../python/python3-ordereddict_1.1.bb         | 23 +++++++++++++++++--
 2 files changed, 21 insertions(+), 23 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-ordereddict.inc

diff --git a/meta-openstack/recipes-devtools/python/python-ordereddict.inc b/meta-openstack/recipes-devtools/python/python-ordereddict.inc
deleted file mode 100644
index fff4bf6..0000000
--- a/meta-openstack/recipes-devtools/python/python-ordereddict.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "A drop-in substitute for Py2.7's new collections.OrderedDict that works in Python 2.4-2.6."
-HOMEPAGE = "https://pypi.python.org/pypi/ordereddict"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7f0267460024072a9bbf135ee87a41b8"
-
-SRC_URI[md5sum] = "a0ed854ee442051b249bfad0f638bbec"
-SRC_URI[sha256sum] = "1c35b4ac206cef2d24816c89f89cf289dd3d38cf7c449bb3fab7bf6d43f01b1f"
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
-    ${PYTHON_PN}-pip \
-    "
diff --git a/meta-openstack/recipes-devtools/python/python3-ordereddict_1.1.bb b/meta-openstack/recipes-devtools/python/python3-ordereddict_1.1.bb
index 46c08d0..9fa676b 100644
--- a/meta-openstack/recipes-devtools/python/python3-ordereddict_1.1.bb
+++ b/meta-openstack/recipes-devtools/python/python3-ordereddict_1.1.bb
@@ -1,2 +1,21 @@
-require python-ordereddict.inc
-inherit setuptools3
+DESCRIPTION = "A drop-in substitute for Py2.7's new collections.OrderedDict that works in Python 2.4-2.6."
+HOMEPAGE = "https://pypi.python.org/pypi/ordereddict"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7f0267460024072a9bbf135ee87a41b8"
+
+SRC_URI[md5sum] = "a0ed854ee442051b249bfad0f638bbec"
+SRC_URI[sha256sum] = "1c35b4ac206cef2d24816c89f89cf289dd3d38cf7c449bb3fab7bf6d43f01b1f"
+
+inherit setuptools3 pypi
+
+# DEPENDS_default: python-pip
+
+DEPENDS += " \
+        ${PYTHON_PN}-pip \
+        "
+
+# RDEPENDS_default: 
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-pip \
+    "
-- 
2.25.1



