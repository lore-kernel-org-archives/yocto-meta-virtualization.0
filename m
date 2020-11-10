Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.24543.1604990894719388563
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 22:48:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 22F7D38C06E0
	for <meta-virtualization@yoctoproject.org>; Mon,  9 Nov 2020 22:48:13 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.77,465,1596470400"; 
   d="scan'208";a="101136679"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 10 Nov 2020 14:48:12 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 248094CE3A6C
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Nov 2020 14:48:07 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 10 Nov 2020 14:48:06 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-wsgiref: remove recipe
Date: Tue, 10 Nov 2020 14:48:08 +0800
Message-ID: <1604990888-97067-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 248094CE3A6C.A8D0E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

This is a standalone release of the wsgiref library, that provides
validation support for WSGI 1.0.1 (PEP 3333) for Python versions < 3.2,
and includes the new wsgiref.util.test() utility function.But the
current version of python3 is 3.9.0, so remove this recipe.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-wsgiref.inc                 | 23 -------------------
 .../python/python3-wsgiref_0.1.2.bb           |  2 --
 2 files changed, 25 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-wsgiref.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-wsgiref_0.1.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-wsgiref.inc b/meta-openstack/recipes-devtools/python/python-wsgiref.inc
deleted file mode 100644
index 1449bea0..00000000
--- a/meta-openstack/recipes-devtools/python/python-wsgiref.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "WSGI (PEP 333) Reference Library"
-HOMEPAGE = "http://cheeseshop.python.org/pypi/wsgiref"
-SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=fe761dfec1d54629c6b9a3bbc7b1baf5"
-
-# Archived version so we need to overwrite what the pypi class will derive
-PYPI_SRC_URI = "https://pypi.python.org/packages/source/w/wsgiref/wsgiref-${PV}.zip"
-
-SRC_URI[md5sum] = "29b146e6ebd0f9fb119fe321f7bcf6cb"
-SRC_URI[sha256sum] = "c7e610c800957046c04c8014aab8cce8f0b9f0495c8cd349e57c1f7cabf40e79"
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
diff --git a/meta-openstack/recipes-devtools/python/python3-wsgiref_0.1.2.bb b/meta-openstack/recipes-devtools/python/python3-wsgiref_0.1.2.bb
deleted file mode 100644
index 0fa887af..00000000
--- a/meta-openstack/recipes-devtools/python/python3-wsgiref_0.1.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-wsgiref.inc
-inherit setuptools3
-- 
2.25.1



