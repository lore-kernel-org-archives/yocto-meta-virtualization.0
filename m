Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.8953.1600420878327436976
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Sep 2020 02:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id BF37A38C084A
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 02:21:17 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,274,1596470400"; 
   d="scan'208";a="99403813"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Sep 2020 17:21:16 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 85AFF48990D9
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 17:21:13 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Sep 2020 17:21:13 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-xstatic-angular-irdragndrop: Consolidate in a single file
Date: Sat, 19 Sep 2020 05:21:16 +0800
Message-ID: <1600464076-31466-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 85AFF48990D9.A25E3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.
Since python2 is no longer maintained, the recipe of python2 is removed.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python-xstatic-angular-irdragndrop.inc    | 19 -----------------
 ...hon-xstatic-angular-irdragndrop_1.0.2.2.bb |  2 --
 ...on3-xstatic-angular-irdragndrop_1.0.2.2.bb | 21 +++++++++++++++++--
 3 files changed, 19 insertions(+), 23 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop_1.0.2.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop.inc b/meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop.inc
deleted file mode 100644
index 90331a9..0000000
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "IrDragNDrop javascript library packaged for setuptools"
-HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-IrDragNDrop"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9acc2dfc3a0345c175df08104bd22298"
-
-PYPI_PACKAGE = "XStatic-Angular-IrDragNDrop"
-
-SRC_URI[md5sum] = "6ea8809bae94014aef699d58836dba84"
-SRC_URI[sha256sum] = "5595f4a98ac8f8468f7e56dc916e10c0fc5f0197567899a75755f99fe8b5bd6d"
-
-inherit pypi
-
-DEPENDS += " \
-        ${PYTHON_PN}-pip \
-        "
-
-RDEPENDS_${PN} += " \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop_1.0.2.2.bb b/meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop_1.0.2.2.bb
deleted file mode 100644
index 72c8781..0000000
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop_1.0.2.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-xstatic-angular-irdragndrop.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-angular-irdragndrop_1.0.2.2.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-irdragndrop_1.0.2.2.bb
index 72c8781..b50fe20 100644
--- a/meta-openstack/recipes-devtools/python/python3-xstatic-angular-irdragndrop_1.0.2.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-irdragndrop_1.0.2.2.bb
@@ -1,2 +1,19 @@
-require python-xstatic-angular-irdragndrop.inc
-inherit setuptools3
+DESCRIPTION = "IrDragNDrop javascript library packaged for setuptools"
+HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-IrDragNDrop"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9acc2dfc3a0345c175df08104bd22298"
+
+PYPI_PACKAGE = "XStatic-Angular-IrDragNDrop"
+
+SRC_URI[md5sum] = "6ea8809bae94014aef699d58836dba84"
+SRC_URI[sha256sum] = "5595f4a98ac8f8468f7e56dc916e10c0fc5f0197567899a75755f99fe8b5bd6d"
+
+inherit setuptools3 pypi
+
+DEPENDS += " \
+        ${PYTHON_PN}-pip \
+        "
+
+RDEPENDS_${PN} += " \
+        "
-- 
2.25.1



