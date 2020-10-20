Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.11651.1603164570960513258
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 20:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id BC5FF38C0699
	for <meta-virtualization@yoctoproject.org>; Mon, 19 Oct 2020 20:29:29 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,395,1596470400"; 
   d="scan'208";a="100316552"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Oct 2020 11:29:27 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 53E084CE1A08
	for <meta-virtualization@yoctoproject.org>; Tue, 20 Oct 2020 11:29:26 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 20 Oct 2020 11:29:22 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-wsme: upgrade 0.9.3 -> 0.10.0
Date: Tue, 20 Oct 2020 11:29:22 +0800
Message-ID: <1603164562-37683-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 53E084CE1A08.A1F02
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-wsme.inc => python3-wsme_0.10.0.bb} | 10 ++++++++--
 .../recipes-devtools/python/python3-wsme_0.9.3.bb      |  2 --
 2 files changed, 8 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-wsme.inc => python3-wsme_0.10.0.bb} (64%)
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-wsme_0.9.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-wsme.inc b/meta-openstack/recipes-devtools/python/python3-wsme_0.10.0.bb
similarity index 64%
rename from meta-openstack/recipes-devtools/python/python-wsme.inc
rename to meta-openstack/recipes-devtools/python/python3-wsme_0.10.0.bb
index b402a09..57538ec 100644
--- a/meta-openstack/recipes-devtools/python/python-wsme.inc
+++ b/meta-openstack/recipes-devtools/python/python3-wsme_0.10.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5a9126e7f56a0cf3247050de7f10d0f4"
 
 PYPI_PACKAGE = "WSME"
 
-SRC_URI[md5sum] = "e6cb3864bae872acaa0cd0c2efacc94f"
-SRC_URI[sha256sum] = "e24fcff24392a0b176e560ffc6591b1f658342bbc992f84e0e8a3c53fd92580a"
+SRC_URI[md5sum] = "7e5d5c6dbee2ad1e82c518ef3bfdf108"
+SRC_URI[sha256sum] = "965b9ce48161e5c50d84aedcf50dca698f05bf07e9d489201bccaec3141cd304"
 
 DEPENDS += " \
         ${PYTHON_PN}-pip \
@@ -21,4 +21,10 @@ DEPENDS += " \
 
 RDEPENDS_${PN} += "\
         ${PYTHON_PN}-pbr \
+        ${PYTHON_PN}-six \
+        ${PYTHON_PN}-pytz \
+        ${PYTHON_PN}-netaddr \
+        ${PYTHON_PN}-webob \
         "
+
+inherit setuptools3 pypi
diff --git a/meta-openstack/recipes-devtools/python/python3-wsme_0.9.3.bb b/meta-openstack/recipes-devtools/python/python3-wsme_0.9.3.bb
deleted file mode 100644
index f792d0e..0000000
--- a/meta-openstack/recipes-devtools/python/python3-wsme_0.9.3.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3 pypi
-require python-wsme.inc
-- 
2.25.1



