Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.21593.1604970519767475308
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 17:08:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 39D4138C0706
	for <meta-virtualization@yoctoproject.org>; Mon,  9 Nov 2020 17:08:38 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.77,464,1596470400"; 
   d="scan'208";a="101121307"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 10 Nov 2020 09:08:05 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 9DFF34CE3A72
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Nov 2020 09:08:03 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 10 Nov 2020 09:08:02 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-paramiko: remove recipe
Date: Tue, 10 Nov 2020 09:07:56 +0800
Message-ID: <1604970476-79636-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 9DFF34CE3A72.A4F21
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Remove this recipe, because a higher version of the recipe exists in:
meta-virtualization/recipes-devtools/python/python3-paramiko_2.7.0.bb

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-paramiko.inc      | 12 ------------
 .../python/python3-paramiko_2.6.0.bb                 |  2 --
 2 files changed, 14 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-paramiko.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-paramiko_2.6.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-paramiko.inc b/meta-openstack/recipes-devtools/python/python-paramiko.inc
deleted file mode 100644
index da47c796..00000000
--- a/meta-openstack/recipes-devtools/python/python-paramiko.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "SSH2 protocol library"
-HOMEPAGE = "https://github.com/paramiko/paramiko/"
-SECTION = "devel/python"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
-
-SRC_URI[md5sum] = "f729a45c9122bf975b9177ec5aaa3791"
-SRC_URI[sha256sum] = "f4b2edfa0d226b70bd4ca31ea7e389325990283da23465d572ed1f70a7583041"
-
-inherit pypi
-
-RDEPENDS_${PN} += "${PYTHON_PN}-pycrypto"
diff --git a/meta-openstack/recipes-devtools/python/python3-paramiko_2.6.0.bb b/meta-openstack/recipes-devtools/python/python3-paramiko_2.6.0.bb
deleted file mode 100644
index 97e56e10..00000000
--- a/meta-openstack/recipes-devtools/python/python3-paramiko_2.6.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-paramiko.inc
-- 
2.25.1



