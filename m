Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.1649.1603176208276784993
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 23:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id BE93E38C06C8
	for <meta-virtualization@yoctoproject.org>; Mon, 19 Oct 2020 23:43:27 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,396,1596470400"; 
   d="scan'208";a="100322051"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Oct 2020 14:43:26 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id AD9A748990E8
	for <meta-virtualization@yoctoproject.org>; Tue, 20 Oct 2020 14:43:24 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 20 Oct 2020 14:43:22 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-testtools: remove recipe
Date: Tue, 20 Oct 2020 14:43:22 +0800
Message-ID: <1603176202-40565-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: AD9A748990E8.A67BF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Remove this recipe, because a higher version of the recipe exists in:
poky/meta/recipes-devtools/python/python3-testtools_2.4.0.bb

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-testtools.inc               | 23 -------------------
 .../python/python3-testtools_2.3.0.bb         |  2 --
 2 files changed, 25 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-testtools.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-testtools_2.3.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-testtools.inc b/meta-openstack/recipes-devtools/python/python-testtools.inc
deleted file mode 100644
index 7cc63f4..0000000
--- a/meta-openstack/recipes-devtools/python/python-testtools.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Extensions to the Python standard library unit testing framework"
-HOMEPAGE = "https://pypi.python.org/pypi/testtools/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c9d3e8ba7141c83bfef190e0b9379a"
-
-SRC_URI[md5sum] = "0f0feb915497816cb99e39437494217e"
-SRC_URI[sha256sum] = "5827ec6cf8233e0f29f51025addd713ca010061204fdea77484a2934690a0559"
-
-inherit pypi
-DEPENDS += " \
-    ${PYTHON_PN}-pbr \
-    "
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-    ${PYTHON_PN}-pbr-native \
-    "
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-extras \
-    ${PYTHON_PN}-pbr \
-    "
diff --git a/meta-openstack/recipes-devtools/python/python3-testtools_2.3.0.bb b/meta-openstack/recipes-devtools/python/python3-testtools_2.3.0.bb
deleted file mode 100644
index 896ecee..0000000
--- a/meta-openstack/recipes-devtools/python/python3-testtools_2.3.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-testtools.inc
-- 
2.25.1



