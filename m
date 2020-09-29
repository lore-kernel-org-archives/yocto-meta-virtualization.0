Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.12466.1601349634884754032
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Sep 2020 20:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6BED038C06F7
	for <meta-virtualization@yoctoproject.org>; Mon, 28 Sep 2020 20:20:34 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,316,1596470400"; 
   d="scan'208";a="99698551"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Sep 2020 11:20:34 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 081AB48990F6
	for <meta-virtualization@yoctoproject.org>; Tue, 29 Sep 2020 11:20:34 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 29 Sep 2020 11:20:31 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-pep8: Remove recipe
Date: Tue, 29 Sep 2020 11:20:30 +0800
Message-ID: <1601349630-108615-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 081AB48990F6.A5BA4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Remove this recipe, because a higher version of the recipe exists in:
meta-openembedded/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-pep8.inc        | 14 --------------
 .../recipes-devtools/python/python3-pep8_1.7.1.bb  |  5 -----
 2 files changed, 19 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pep8.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-pep8_1.7.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pep8.inc b/meta-openstack/recipes-devtools/python/python-pep8.inc
deleted file mode 100644
index 959c3d1..0000000
--- a/meta-openstack/recipes-devtools/python/python-pep8.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "Python style guide checker"
-HOMEPAGE = "https://github.com/dreamhost/cliff"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=d8ebbbe831259ce010179d2f310b0f3e"
-
-SRC_URI[md5sum] = "a03bb494859e87b42601b61b1b043a0c"
-SRC_URI[sha256sum] = "603a46e5c358ce20ac4807a0eeafac7505d1125a4c1bd8378757ada06f61bed8"
-
-inherit pypi
-
-RDEPENDS_${PN} += "${PYTHON_PN}-prettytable \
-            ${PYTHON_PN}-cmd2 \
-            ${PYTHON_PN}-pyparsing"
\ No newline at end of file
diff --git a/meta-openstack/recipes-devtools/python/python3-pep8_1.7.1.bb b/meta-openstack/recipes-devtools/python/python3-pep8_1.7.1.bb
deleted file mode 100644
index 64fd154..0000000
--- a/meta-openstack/recipes-devtools/python/python3-pep8_1.7.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit setuptools3
-require python-pep8.inc
-
-SRC_URI[md5sum] = "603821d06db945c71d811b5a8d78423c"
-SRC_URI[sha256sum] = "fe249b52e20498e59e0b5c5256aa52ee99fc295b26ec9eaa85776ffdb9fe6374"
\ No newline at end of file
-- 
2.25.1



