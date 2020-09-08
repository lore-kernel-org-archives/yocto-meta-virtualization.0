Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.12035.1599532985075410716
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Sep 2020 19:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 3D38938C0894
	for <meta-virtualization@yoctoproject.org>; Mon,  7 Sep 2020 19:43:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,404,1592841600"; 
   d="scan'208";a="98988945"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Sep 2020 10:43:03 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 6D1D748990EE
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Sep 2020 10:42:59 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Sep 2020 10:42:58 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-rtslib-fb: upgrade 2.1.51 -> 2.1.74
Date: Tue, 8 Sep 2020 10:42:59 +0800
Message-ID: <1599532979-124418-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 6D1D748990EE.A9F80
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Since python2 is no longer maintained, the recipe of python2 is removed.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-rtslib-fb.inc               | 20 ---------------
 .../python/python-rtslib-fb_2.1.51.bb         |  2 --
 .../python/python3-rtslib-fb_2.1.51.bb        |  2 --
 .../python/python3-rtslib-fb_2.1.74.bb        | 25 +++++++++++++++++++
 4 files changed, 25 insertions(+), 24 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-rtslib-fb.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-rtslib-fb_2.1.51.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-rtslib-fb_2.1.51.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-rtslib-fb_2.1.74.bb

diff --git a/meta-openstack/recipes-devtools/python/python-rtslib-fb.inc b/meta-openstack/recipes-devtools/python/python-rtslib-fb.inc
deleted file mode 100644
index e14f33d..0000000
--- a/meta-openstack/recipes-devtools/python/python-rtslib-fb.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "API for Linux kernel SCSI target (aka LIO)"
-HOMEPAGE = "http://github.com/agrover/rtslib-fb"
-SECTION = "devel/python"
-LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=867c358d5dbac2602d0c0f850f731e62"
-
-SRC_URI[md5sum] = "4ec7575eb90b7c5a91bbea2962f0e036"
-SRC_URI[sha256sum] = "1902c581d6e04b7813f3cd1b11e2abc796205f646c39571cbbb809229fd5553e"
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
diff --git a/meta-openstack/recipes-devtools/python/python-rtslib-fb_2.1.51.bb b/meta-openstack/recipes-devtools/python/python-rtslib-fb_2.1.51.bb
deleted file mode 100644
index 571b68c..0000000
--- a/meta-openstack/recipes-devtools/python/python-rtslib-fb_2.1.51.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-rtslib-fb.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-rtslib-fb_2.1.51.bb b/meta-openstack/recipes-devtools/python/python3-rtslib-fb_2.1.51.bb
deleted file mode 100644
index 571b68c..0000000
--- a/meta-openstack/recipes-devtools/python/python3-rtslib-fb_2.1.51.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-rtslib-fb.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-rtslib-fb_2.1.74.bb b/meta-openstack/recipes-devtools/python/python3-rtslib-fb_2.1.74.bb
new file mode 100644
index 0000000..e1eef6b
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-rtslib-fb_2.1.74.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "API for Linux kernel SCSI target (aka LIO)"
+HOMEPAGE = "http://github.com/agrover/rtslib-fb"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=cf391b108961d84a581f45259ec47c52"
+
+SRC_URI[md5sum] = "85ab011e3a98fb585d8a0fb337c5dab4"
+SRC_URI[sha256sum] = "6f15bc30b55e0d35f29edde4f35880965b2f1e9acee1424e6e9820f32b0a925c"
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
+        ${PYTHON_PN}-json \
+        ${PYTHON_PN}-shell \
+        ${PYTHON_PN}-six \
+        ${PYTHON_PN}-pyudev \
+        ${PYTHON_PN}-resource \
+        "
-- 
2.25.1



