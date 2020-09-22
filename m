Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.4644.1600741688139046486
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Sep 2020 19:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7783138C0638
	for <meta-virtualization@yoctoproject.org>; Mon, 21 Sep 2020 19:28:07 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,288,1596470400"; 
   d="scan'208";a="99489023"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Sep 2020 10:28:07 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 50F6A48990F3
	for <meta-virtualization@yoctoproject.org>; Tue, 22 Sep 2020 10:28:06 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 22 Sep 2020 10:28:03 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-memcached: upgrade 1.57 -> 1.59
Date: Tue, 22 Sep 2020 10:28:10 +0800
Message-ID: <1600741690-124287-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 50F6A48990F3.A6579
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-memcached.inc               | 21 ----------------
 .../python/python3-memcached_git.bb           | 24 ++++++++++++++++++-
 2 files changed, 23 insertions(+), 22 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-memcached.inc

diff --git a/meta-openstack/recipes-devtools/python/python-memcached.inc b/meta-openstack/recipes-devtools/python/python-memcached.inc
deleted file mode 100644
index 5acf43c..0000000
--- a/meta-openstack/recipes-devtools/python/python-memcached.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Pure python memcached client"
-DESCRIPTION = "\
-  This software is a 100% Python interface to the memcached memory cache daemon. \
-  It is the client side software which allows storing values in one or more, possibly remote, \
-  memcached servers. Search google for memcached for more information."
-HOMEPAGE = "https://pypi.python.org/pypi/python-memcached/"
-SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://PSF.LICENSE;md5=7dd786e8594f1e787da94a946557b40e"
-
-PV = "1.57+git${SRCPV}"
-SRCREV = "664bd3e23fe500fbde4c70636e2d24c8fd2f35af"
-
-SRC_URI = "git://github.com/linsomniac/python-memcached.git"
-
-S = "${WORKDIR}/git"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-six \
-    "
-
diff --git a/meta-openstack/recipes-devtools/python/python3-memcached_git.bb b/meta-openstack/recipes-devtools/python/python3-memcached_git.bb
index de96734..a129725 100644
--- a/meta-openstack/recipes-devtools/python/python3-memcached_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-memcached_git.bb
@@ -1,2 +1,24 @@
-require python-memcached.inc
+SUMMARY = "Pure python memcached client"
+DESCRIPTION = "\
+  This software is a 100% Python interface to the memcached memory cache daemon. \
+  It is the client side software which allows storing values in one or more, possibly remote, \
+  memcached servers. Search google for memcached for more information."
+HOMEPAGE = "https://pypi.python.org/pypi/python-memcached/"
+SECTION = "devel/python"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://PSF.LICENSE;md5=7dd786e8594f1e787da94a946557b40e"
+
+PV = "1.59+git${SRCPV}"
+SRCREV = "959e068fec8b4c956b0d82269336818e667726e7"
+
+SRC_URI = "git://github.com/linsomniac/python-memcached.git"
+
+S = "${WORKDIR}/git"
+
 inherit setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-pickle \
+    "
+
-- 
2.25.1



