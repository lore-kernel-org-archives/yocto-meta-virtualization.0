Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.4903.1598319041874278611
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 18:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B3277E02092; Mon, 24 Aug 2020 18:30:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7924E0204B
	for <meta-virtualization@yoctoproject.org>; Mon, 24 Aug 2020 18:30:40 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,350,1592841600"; 
   d="scan'208";a="98494825"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Aug 2020 09:30:39 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 99B1748990DD
	for <meta-virtualization@yoctoproject.org>; Tue, 25 Aug 2020 09:30:36 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 25 Aug 2020 09:30:36 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH v2] python3-xstatic-angular-cookies: Remove python recipe
Date: Tue, 25 Aug 2020 09:29:58 +0800
Message-ID: <1598318998-123340-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 99B1748990DD.A7F52
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Because python is no longer maintained, delete the python2 version of
the recipe.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-xstatic-angular-cookies.inc | 22 -----------------
 .../python-xstatic-angular-cookies_1.2.1.1.bb |  2 --
 ...python3-xstatic-angular-cookies_1.2.1.1.bb | 24 +++++++++++++++++--
 3 files changed, 22 insertions(+), 26 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies_1.2.1.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies.inc b/meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies.inc
deleted file mode 100644
index bc3923b..0000000
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Angular-Cookies JavaScript library packaged for setuptools"
-HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-Cookies"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=70856f1d03d62a3e0c0cb1b7f8c7fd00"
-
-PYPI_PACKAGE = "XStatic-Angular-Cookies"
-
-SRC_URI[md5sum] = "a67066fac5dfe9774ab163d44e5a896a"
-SRC_URI[sha256sum] = "c8fc1a52549c601809fc9f25144e4fd346820412b6430e89256e7ec71fce0b4c"
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
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies_1.2.1.1.bb b/meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies_1.2.1.1.bb
deleted file mode 100644
index ee9591a..0000000
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies_1.2.1.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-xstatic-angular-cookies.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-angular-cookies_1.2.1.1.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-cookies_1.2.1.1.bb
index ee9591a..001bde9 100644
--- a/meta-openstack/recipes-devtools/python/python3-xstatic-angular-cookies_1.2.1.1.bb
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-cookies_1.2.1.1.bb
@@ -1,2 +1,22 @@
-require python-xstatic-angular-cookies.inc
-inherit setuptools3
+DESCRIPTION = "Angular-Cookies JavaScript library packaged for setuptools"
+HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-Cookies"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=70856f1d03d62a3e0c0cb1b7f8c7fd00"
+
+PYPI_PACKAGE = "XStatic-Angular-Cookies"
+
+SRC_URI[md5sum] = "a67066fac5dfe9774ab163d44e5a896a"
+SRC_URI[sha256sum] = "c8fc1a52549c601809fc9f25144e4fd346820412b6430e89256e7ec71fce0b4c"
+
+inherit setuptools3 pypi
+
+# DEPENDS_default: python-pip
+
+DEPENDS += " \
+        ${PYTHON_PN}-pip \
+        "
+
+# RDEPENDS_default: 
+RDEPENDS_${PN} += " \
+        "
-- 
2.25.1



