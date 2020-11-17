Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.3520.1605586528929931045
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Nov 2020 20:15:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6C71738C0836
	for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 04:15:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.77,484,1596470400"; 
   d="scan'208";a="101443894"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 17 Nov 2020 12:15:27 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 150BF4CE5059
	for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 12:15:22 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 17 Nov 2020 12:15:20 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-functools32: Remove recipe
Date: Wed, 18 Nov 2020 00:15:21 +0800
Message-ID: <1605629721-107646-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 150BF4CE5059.A0E5B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

This is a backport of the functools standard library module from Python 3.2.3 for use on Python 2.7 and PyPy. It includes new features lru_cache (Least-recently-used cache decorator).But the current version of python3 is 3.9.0, so remove this recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-functools32_git.bb          | 30 -------------------
 1 file changed, 30 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-functools32_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-functools32_git.bb b/meta-openstack/recipes-devtools/python/python-functools32_git.bb
deleted file mode 100644
index 9744b522..00000000
--- a/meta-openstack/recipes-devtools/python/python-functools32_git.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "Python higher-order functions and operations on callable objects"
-HOMEPAGE = "https://pypi.python.org/pypi/functools32"
-SECTION = "devel/python"
-LICENSE = "PSFv2"
-
-PV = "3.2.3-2"
-SRCREV = "ad90fa86e2f4f494a3aedb0571274f3bbc6d7ab5"
-
-SRCNAME = "functools32"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=27cf2345969ed18e6730e90fb0063a10"
-SRC_URI = "git://github.com/MiCHiLU/python-${SRCNAME}.git"
-
-S = "${WORKDIR}/git"
-
-inherit distutils3
-
-DISTUTILS_INSTALL_ARGS = "--root=${D} \
-    --prefix=${prefix} \
-    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
-    --install-data=${datadir}"
-
-DEPENDS += " \
-	python-pbr \
-	"
-
-RDEPENDS_${PN} += "python-testtools \
-	python-pbr \
-	"
-
-- 
2.25.1



