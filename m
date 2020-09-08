Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.13788.1599542508801251607
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Sep 2020 22:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4D1D338C1129
	for <meta-virtualization@yoctoproject.org>; Mon,  7 Sep 2020 22:21:48 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,404,1592841600"; 
   d="scan'208";a="98993008"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Sep 2020 13:21:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 68DDB48990D9
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Sep 2020 13:21:43 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Sep 2020 13:21:42 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-xstatic-roboto-fontface: Remove python2 recipe
Date: Wed, 9 Sep 2020 01:21:40 +0800
Message-ID: <1599585700-88354-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1599585700-88354-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1599585700-88354-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 68DDB48990D9.A2F9B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Since python2 is no longer maintained, the recipe of python2 is removed.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-xstatic-roboto-fontface.inc | 19 -----------------
 .../python-xstatic-roboto-fontface_0.5.0.0.bb |  2 --
 ...python3-xstatic-roboto-fontface_0.5.0.0.bb | 21 +++++++++++++++++--
 3 files changed, 19 insertions(+), 23 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-roboto-fontface.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-roboto-fontface_0.5.0.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-roboto-fontface.inc b/meta-openstack/recipes-devtools/python/python-xstatic-roboto-fontface.inc
deleted file mode 100644
index d11d0a1..0000000
--- a/meta-openstack/recipes-devtools/python/python-xstatic-roboto-fontface.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "A simple package providing the Roboto fontface."
-HOMEPAGE = "https://github.com/choffmeister/roboto-fontface-bower"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
-
-PYPI_PACKAGE = "XStatic-roboto-fontface"
-
-SRC_URI[md5sum] = "32273ba68fa063623461db0b0767524f"
-SRC_URI[sha256sum] = "6d272df58e20eec3a15bca279163f38614c7074e2fecb537a58b29d109e83f62"
-
-inherit pypi
-
-DEPENDS += " \
-        ${PYTHON_PN}-pip \
-        "
-
-RDEPENDS_${PN} += " \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-roboto-fontface_0.5.0.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-roboto-fontface_0.5.0.0.bb
deleted file mode 100644
index e05e35e..0000000
--- a/meta-openstack/recipes-devtools/python/python-xstatic-roboto-fontface_0.5.0.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-xstatic-roboto-fontface.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-roboto-fontface_0.5.0.0.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-roboto-fontface_0.5.0.0.bb
index e05e35e..a3d6bd0 100644
--- a/meta-openstack/recipes-devtools/python/python3-xstatic-roboto-fontface_0.5.0.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-roboto-fontface_0.5.0.0.bb
@@ -1,2 +1,19 @@
-require python-xstatic-roboto-fontface.inc
-inherit setuptools3
+DESCRIPTION = "A simple package providing the Roboto fontface."
+HOMEPAGE = "https://github.com/choffmeister/roboto-fontface-bower"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
+
+PYPI_PACKAGE = "XStatic-roboto-fontface"
+
+SRC_URI[md5sum] = "32273ba68fa063623461db0b0767524f"
+SRC_URI[sha256sum] = "6d272df58e20eec3a15bca279163f38614c7074e2fecb537a58b29d109e83f62"
+
+inherit setuptools3 pypi
+
+DEPENDS += " \
+        ${PYTHON_PN}-pip \
+        "
+
+RDEPENDS_${PN} += " \
+        "
-- 
2.25.1



