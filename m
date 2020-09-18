Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.8930.1600420758989381400
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Sep 2020 02:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id CA49838C084A
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 02:19:17 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,274,1596470400"; 
   d="scan'208";a="99403673"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Sep 2020 17:19:14 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 7CDDA48990EE
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 17:19:14 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Sep 2020 17:19:14 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-hgtools: upgrade 6.3 -> 8.2.0
Date: Sat, 19 Sep 2020 05:19:17 +0800
Message-ID: <1600463957-30892-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7CDDA48990EE.A195D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Update copyright.

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-hgtools.inc   | 13 -------------
 .../python/python3-hgtools_6.3.bb                |  2 --
 .../python/python3-hgtools_8.2.0.bb              | 16 ++++++++++++++++
 3 files changed, 16 insertions(+), 15 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-hgtools.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-hgtools_6.3.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-hgtools_8.2.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-hgtools.inc b/meta-openstack/recipes-devtools/python/python-hgtools.inc
deleted file mode 100644
index 561df3d..0000000
--- a/meta-openstack/recipes-devtools/python/python-hgtools.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "Classes and setuptools plugin for Mercurial repositories"
-HOMEPAGE = "https://pypi.python.org/pypi/hgtools"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a428d7abf1504d4dfeb4cbde155ba484"
-
-PYPI_PACKAGE_EXT = "zip"
-
-SRC_URI[md5sum] = "584d74b81b1efae3604c53086d1a3acb"
-SRC_URI[sha256sum] = "1d0ef6ceaba1673e6923b17d7f09c5ae2f4394d16ef80562812987a27e7836ff"
-
-inherit pypi
-
diff --git a/meta-openstack/recipes-devtools/python/python3-hgtools_6.3.bb b/meta-openstack/recipes-devtools/python/python3-hgtools_6.3.bb
deleted file mode 100644
index 51a488f..0000000
--- a/meta-openstack/recipes-devtools/python/python3-hgtools_6.3.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-hgtools.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-hgtools_8.2.0.bb b/meta-openstack/recipes-devtools/python/python3-hgtools_8.2.0.bb
new file mode 100644
index 0000000..cfaf034
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-hgtools_8.2.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Classes and setuptools plugin for Mercurial repositories"
+HOMEPAGE = "https://pypi.python.org/pypi/hgtools"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
+
+SRC_URI[md5sum] = "200c967071c63efeb869470d24f250e3"
+SRC_URI[sha256sum] = "5f30e3e7729f67e414b63ae91697743bb2ec72f3cac0c514d16fd3c21bd25300"
+
+DEPENDS += " \
+	python3-setuptools-scm-native \
+	python3-toml-native \
+"
+
+inherit setuptools3 pypi
+
-- 
2.25.1



