Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.13778.1599542508172931078
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Sep 2020 22:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id B73BD38C0894
	for <meta-virtualization@yoctoproject.org>; Mon,  7 Sep 2020 22:21:47 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,404,1592841600"; 
   d="scan'208";a="98993007"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Sep 2020 13:21:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 5B74A48990E4
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Sep 2020 13:21:42 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Sep 2020 13:21:40 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-happybase: Consolidate in a single file
Date: Wed, 9 Sep 2020 01:21:39 +0800
Message-ID: <1599585700-88354-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1599585700-88354-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1599585700-88354-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5B74A48990E4.A1C1A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-happybase.inc               | 18 -----------------
 .../python/python3-happybase_1.2.0.bb         | 20 +++++++++++++++++--
 2 files changed, 18 insertions(+), 20 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-happybase.inc

diff --git a/meta-openstack/recipes-devtools/python/python-happybase.inc b/meta-openstack/recipes-devtools/python/python-happybase.inc
deleted file mode 100644
index 325b2d1..0000000
--- a/meta-openstack/recipes-devtools/python/python-happybase.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "Python library to interact with Apache HBase"
-HOMEPAGE = "https://pypi.python.org/pypi/happybase/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=41f55ae3d7000e4323e84c468d8b42ee"
-
-SRC_URI[md5sum] = "96cb7ea8163f531907fabd0dddc8b87e"
-SRC_URI[sha256sum] = "850b4ee651128588a57e1e152dd1252e5ec39776a5d3d14ee892b8bac0fa9e1a"
-
-inherit pypi
-
-do_install_append() {
-	perm_files=$(find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt")
-	perm_files="$perm_files "$(find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "PKG-INFO")
-	for f in $perm_files; do
-		chmod 644 "${f}"
-	done
-}
diff --git a/meta-openstack/recipes-devtools/python/python3-happybase_1.2.0.bb b/meta-openstack/recipes-devtools/python/python3-happybase_1.2.0.bb
index 8b5571b..56b6c79 100644
--- a/meta-openstack/recipes-devtools/python/python3-happybase_1.2.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-happybase_1.2.0.bb
@@ -1,2 +1,18 @@
-inherit setuptools3
-require python-happybase.inc
+DESCRIPTION = "Python library to interact with Apache HBase"
+HOMEPAGE = "https://pypi.python.org/pypi/happybase/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=41f55ae3d7000e4323e84c468d8b42ee"
+
+SRC_URI[md5sum] = "96cb7ea8163f531907fabd0dddc8b87e"
+SRC_URI[sha256sum] = "850b4ee651128588a57e1e152dd1252e5ec39776a5d3d14ee892b8bac0fa9e1a"
+
+inherit setuptools3 pypi
+
+do_install_append() {
+	perm_files=$(find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt")
+	perm_files="$perm_files "$(find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "PKG-INFO")
+	for f in $perm_files; do
+		chmod 644 "${f}"
+	done
+}
-- 
2.25.1



