Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.8927.1600420866090628412
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Sep 2020 02:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8C71A38C084A
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 02:21:05 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,274,1596470400"; 
   d="scan'208";a="99403799"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Sep 2020 17:21:04 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 6DEB648990C4
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 17:21:02 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Sep 2020 17:21:02 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-keyring: Change to python3
Date: Sat, 19 Sep 2020 05:21:05 +0800
Message-ID: <1600464065-31406-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6DEB648990C4.A1799
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python2 is no longer maintained, bb file is changed to python3 version.
-License-Update:Because CONTRIBUTIRS.txt file does not exist in the latest version, choose LICENSE file to verify.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-keyring_5.3.bb              | 14 -------------
 .../python/python3-keyring_21.4.0.bb          | 21 +++++++++++++++++++
 2 files changed, 21 insertions(+), 14 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-keyring_5.3.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-keyring_21.4.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-keyring_5.3.bb b/meta-openstack/recipes-devtools/python/python-keyring_5.3.bb
deleted file mode 100644
index e137fc6..0000000
--- a/meta-openstack/recipes-devtools/python/python-keyring_5.3.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "Store and access your passwords safely"
-HOMEPAGE = "https://pypi.python.org/pypi/keyring/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://CONTRIBUTORS.txt;md5=50793e96bcc5250698eddfef509a2061"
-
-PYPI_PACKAGE_EXT = "zip"
-
-SRC_URI[md5sum] = "fd50a2be4a44a78efb09a7c046b6410d"
-SRC_URI[sha256sum] = "ac2b4dc17e6edfb804b09ade15df79f251522e442976ea0c8ea0051474502cf5"
-
-inherit setuptools3 pypi
-
-DEPENDS += " python-hgtools"
diff --git a/meta-openstack/recipes-devtools/python/python3-keyring_21.4.0.bb b/meta-openstack/recipes-devtools/python/python3-keyring_21.4.0.bb
new file mode 100644
index 0000000..569a546
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-keyring_21.4.0.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Store and access your passwords safely"
+HOMEPAGE = "https://pypi.python.org/pypi/keyring/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
+
+SRC_URI[md5sum] = "c9691de646eced3b15e888e5b410d6a1"
+SRC_URI[sha256sum] = "9aeadd006a852b78f4b4ef7c7556c2774d2432bbef8ee538a3e9089ac8b11466"
+
+inherit setuptools3 pypi
+
+DEPENDS += " \
+	python3-hgtools \
+	python3-setuptools-scm-native \
+	python3-toml-native \
+"
+
+RDEPENDS_${PN} = " \
+	python3-logging \
+	python3-importlib-metadata \
+"
-- 
2.25.1



