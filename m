Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.7800.1608016961908819137
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Dec 2020 23:22:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6475E38C09BD
	for <meta-virtualization@yoctoproject.org>; Tue, 15 Dec 2020 07:22:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; 
   d="scan'208";a="102408325"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Dec 2020 15:22:40 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 029814CE600E
	for <meta-virtualization@yoctoproject.org>; Tue, 15 Dec 2020 15:22:35 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 15 Dec 2020 15:22:34 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH 7/7] python3-osprofiler: upgrade 2.9.0 -> 3.4.0
Date: Tue, 15 Dec 2020 15:22:36 +0800
Message-ID: <1608016956-55876-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 029814CE600E.A413E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python2 is no longer maintained, bb file is changed to python3 version.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-osprofiler_2.9.0.bb         | 35 -------------------
 .../python/python3-osprofiler_3.4.0.bb        | 35 +++++++++++++++++++
 2 files changed, 35 insertions(+), 35 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-osprofiler_2.9.0.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-osprofiler_3.4.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-osprofiler_2.9.0.bb b/meta-openstack/recipes-devtools/python/python-osprofiler_2.9.0.bb
deleted file mode 100644
index e6fe8656..00000000
--- a/meta-openstack/recipes-devtools/python/python-osprofiler_2.9.0.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "OpenStack Profiler Library"
-HOMEPAGE = "http://www.openstack.org/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5"
-
-SRC_URI[md5sum] = "75f190b00ac248b3d547b67a480801db"
-SRC_URI[sha256sum] = "6915cbf8ac390dc3e125340b0ff368dd53f5889e3d053f9122dd83ba0dd366f7"
-
-inherit setuptools3 pypi
-
-# DEPENDS_default: python-pip
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
-# RDEPENDS_default: 
-RDEPENDS_${PN} += " \
-        python-pbr \
-        python-six \
-        python-oslo.messaging \
-        python-oslo.log \
-        python-oslo.utils \
-        python-webob \
-        python-requests \
-        python-netaddr \
-        python-oslo.concurrency \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-osprofiler_3.4.0.bb b/meta-openstack/recipes-devtools/python/python3-osprofiler_3.4.0.bb
new file mode 100644
index 00000000..5d7939b6
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-osprofiler_3.4.0.bb
@@ -0,0 +1,35 @@
+DESCRIPTION = "OpenStack Profiler Library"
+HOMEPAGE = "http://www.openstack.org/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5"
+
+SRC_URI[md5sum] = "691c4d2cc77e60eeaa30edd7bf087481"
+SRC_URI[sha256sum] = "f7fe387f4dd681bbf92b9fbe857cc90e89cfe96d44522a2727540902310a9ed6"
+
+inherit setuptools3 pypi
+
+# DEPENDS_default: python-pip
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
+# RDEPENDS_default: 
+RDEPENDS_${PN} += " \
+        python3-pbr \
+        python3-six \
+        python3-oslo.messaging \
+        python3-oslo.log \
+        python3-oslo.utils \
+        python3-webob \
+        python3-requests \
+        python3-netaddr \
+        python3-oslo.concurrency \
+        "
-- 
2.25.1



