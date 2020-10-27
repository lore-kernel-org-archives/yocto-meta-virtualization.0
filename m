Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.9711.1603776605044284971
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 22:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 9666C38C1176
	for <meta-virtualization@yoctoproject.org>; Mon, 26 Oct 2020 22:30:02 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,422,1596470400"; 
   d="scan'208";a="100542319"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Oct 2020 13:30:01 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 1295648990DE
	for <meta-virtualization@yoctoproject.org>; Tue, 27 Oct 2020 13:30:00 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 27 Oct 2020 13:29:57 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-retrying: Consolidate in a single file
Date: Tue, 27 Oct 2020 13:29:56 +0800
Message-ID: <1603776596-96676-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 1295648990DE.A3C25
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-retrying.inc                | 20 -----------------
 .../python/python3-retrying_1.3.3.bb          | 22 +++++++++++++++++--
 2 files changed, 20 insertions(+), 22 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-retrying.inc

diff --git a/meta-openstack/recipes-devtools/python/python-retrying.inc b/meta-openstack/recipes-devtools/python/python-retrying.inc
deleted file mode 100644
index b33dc90..0000000
--- a/meta-openstack/recipes-devtools/python/python-retrying.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Retrying"
-HOMEPAGE = "https://github.com/rholder/retrying"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"
-
-SRC_URI[md5sum] = "2a126aeef8b21324ecdeac15ff46ef17"
-SRC_URI[sha256sum] = "08c039560a6da2fe4f2c426d0766e284d3b736e355f8dd24b37367b0bb41973b"
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
diff --git a/meta-openstack/recipes-devtools/python/python3-retrying_1.3.3.bb b/meta-openstack/recipes-devtools/python/python3-retrying_1.3.3.bb
index 9f001fe..e599670 100644
--- a/meta-openstack/recipes-devtools/python/python3-retrying_1.3.3.bb
+++ b/meta-openstack/recipes-devtools/python/python3-retrying_1.3.3.bb
@@ -1,2 +1,20 @@
-require python-retrying.inc
-inherit setuptools3
+DESCRIPTION = "Retrying"
+HOMEPAGE = "https://github.com/rholder/retrying"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"
+
+SRC_URI[md5sum] = "2a126aeef8b21324ecdeac15ff46ef17"
+SRC_URI[sha256sum] = "08c039560a6da2fe4f2c426d0766e284d3b736e355f8dd24b37367b0bb41973b"
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



