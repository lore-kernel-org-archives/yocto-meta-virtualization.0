Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.24542.1604990886524507959
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 22:48:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0026F38C06E0
	for <meta-virtualization@yoctoproject.org>; Mon,  9 Nov 2020 22:48:05 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.77,465,1596470400"; 
   d="scan'208";a="101136678"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 10 Nov 2020 14:48:05 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 93BD74CE3A6E
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Nov 2020 14:48:02 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 10 Nov 2020 14:48:01 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-tempita: Consolidate in a single file
Date: Tue, 10 Nov 2020 14:47:59 +0800
Message-ID: <1604990879-97031-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 93BD74CE3A6E.A9E44
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-tempita.inc     | 12 ------------
 .../python/python3-tempita_0.5.3dev.bb             | 14 ++++++++++++--
 2 files changed, 12 insertions(+), 14 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-tempita.inc

diff --git a/meta-openstack/recipes-devtools/python/python-tempita.inc b/meta-openstack/recipes-devtools/python/python-tempita.inc
deleted file mode 100644
index c511c128..00000000
--- a/meta-openstack/recipes-devtools/python/python-tempita.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "A very small text templating language"
-HOMEPAGE = "http://pythonpaste.org/tempita/"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=33;endline=33;md5=2d33c00f47720c7e35e1fdb4b9fab027"
-
-PYPI_PACKAGE = "Tempita"
-
-SRC_URI[md5sum] = "365c3b4f36435e2178902d5619301140"
-SRC_URI[sha256sum] = "38392bb708a10128419f75fa9120a6d2c8d137013b353968e5008a77a5c7a2ca"
-
-inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python3-tempita_0.5.3dev.bb b/meta-openstack/recipes-devtools/python/python3-tempita_0.5.3dev.bb
index a0123a69..140b334d 100644
--- a/meta-openstack/recipes-devtools/python/python3-tempita_0.5.3dev.bb
+++ b/meta-openstack/recipes-devtools/python/python3-tempita_0.5.3dev.bb
@@ -1,2 +1,12 @@
-require python-tempita.inc
-inherit setuptools3
+DESCRIPTION = "A very small text templating language"
+HOMEPAGE = "http://pythonpaste.org/tempita/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=33;endline=33;md5=2d33c00f47720c7e35e1fdb4b9fab027"
+
+PYPI_PACKAGE = "Tempita"
+
+SRC_URI[md5sum] = "365c3b4f36435e2178902d5619301140"
+SRC_URI[sha256sum] = "38392bb708a10128419f75fa9120a6d2c8d137013b353968e5008a77a5c7a2ca"
+
+inherit setuptools3 pypi
-- 
2.25.1



