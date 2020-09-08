Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.12097.1599532996781019174
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Sep 2020 19:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 525FB38C0894
	for <meta-virtualization@yoctoproject.org>; Mon,  7 Sep 2020 19:43:16 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,404,1592841600"; 
   d="scan'208";a="98988951"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Sep 2020 10:43:15 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 095BE48990E7
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Sep 2020 10:43:14 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Sep 2020 10:43:12 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-xstatic-angular-schema: Remove python2 recipe
Date: Tue, 8 Sep 2020 10:43:14 +0800
Message-ID: <1599532994-124479-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 095BE48990E7.A8819
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Since python2 is no longer maintained, the recipe of python2 is removed.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python-xstatic-angular-schema-form.inc    | 22 -----------------
 ...on-xstatic-angular-schema-form_0.8.13.0.bb |  2 --
 ...n3-xstatic-angular-schema-form_0.8.13.0.bb | 24 +++++++++++++++++--
 3 files changed, 22 insertions(+), 26 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form_0.8.13.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form.inc b/meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form.inc
deleted file mode 100644
index 7bfa957..0000000
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Angular Schema Form packaged for setuptools (easy_install) / pip."
-HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-Schema-Form"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0e4430cb0dfdb98d3008c66d8339f31a"
-
-PYPI_PACKAGE = "XStatic-Angular-Schema-Form"
-
-SRC_URI[md5sum] = "d0faab81c36f4cfc03e092fedc30018d"
-SRC_URI[sha256sum] = "7c08634901751267fe26d266fc027cf6ed2e5f422696985cec750594b3f4e300"
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
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form_0.8.13.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form_0.8.13.0.bb
deleted file mode 100644
index eae97b2..0000000
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form_0.8.13.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-xstatic-angular-schema-form.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-angular-schema-form_0.8.13.0.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-schema-form_0.8.13.0.bb
index eae97b2..aa49f61 100644
--- a/meta-openstack/recipes-devtools/python/python3-xstatic-angular-schema-form_0.8.13.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-schema-form_0.8.13.0.bb
@@ -1,2 +1,22 @@
-require python-xstatic-angular-schema-form.inc
-inherit setuptools3
+DESCRIPTION = "Angular Schema Form packaged for setuptools (easy_install) / pip."
+HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-Schema-Form"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0e4430cb0dfdb98d3008c66d8339f31a"
+
+PYPI_PACKAGE = "XStatic-Angular-Schema-Form"
+
+SRC_URI[md5sum] = "d0faab81c36f4cfc03e092fedc30018d"
+SRC_URI[sha256sum] = "7c08634901751267fe26d266fc027cf6ed2e5f422696985cec750594b3f4e300"
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
+        "
-- 
2.25.1



