Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.13187.1595311099997904247
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2020 22:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,377,1589212800"; 
   d="scan'208";a="96683140"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Jul 2020 13:58:19 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 4E2714CE505C
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jul 2020 13:58:13 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Jul 2020 13:58:12 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][PATCH] python3-suds-jurko: Change python to python3
Date: Tue, 21 Jul 2020 13:58:12 +0800
Message-ID: <1595311098-1934-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595311098-1934-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1595311098-1934-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 4E2714CE505C.A296C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/python-suds-jurko.inc              | 20 ------------------
 .../python/python-suds-jurko_0.6.bb           |  3 ---
 .../python/python3-suds-jurko_0.6.bb          | 21 +++++++++++++++++--
 3 files changed, 19 insertions(+), 25 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-suds-jurko.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-suds-jurko_0.6.bb

diff --git a/meta-openstack/recipes-devtools/python/python-suds-jurko.inc b/meta-openstack/recipes-devtools/python/python-suds-jurko.inc
deleted file mode 100644
index 579212a..0000000
--- a/meta-openstack/recipes-devtools/python/python-suds-jurko.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Lightweight SOAP client (Jurko's fork)"
-HOMEPAGE = "https://bitbucket.org/jurko/suds"
-SECTION = "devel/python"
-LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=847e96bce86d8774f491a92924343a29"
-
-PYPI_PACKAGE_EXT = "tar.bz2"
-
-SRC_URI[md5sum] = "1309e9bc2454aa3434041f0a24ae4e11"
-SRC_URI[sha256sum] = "29edb72fd21e3044093d86f33c66cf847c5aaab26d64cb90e69e528ef014e57f"
-
-inherit pypi
-
-DEPENDS += " \
-        ${PYTHON_PN}-pip \
-        "
-
-RDEPENDS_${PN} += " \
-        "
-
diff --git a/meta-openstack/recipes-devtools/python/python-suds-jurko_0.6.bb b/meta-openstack/recipes-devtools/python/python-suds-jurko_0.6.bb
deleted file mode 100644
index d230c8d..0000000
--- a/meta-openstack/recipes-devtools/python/python-suds-jurko_0.6.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit setuptools3
-require python-suds-jurko.inc
-
diff --git a/meta-openstack/recipes-devtools/python/python3-suds-jurko_0.6.bb b/meta-openstack/recipes-devtools/python/python3-suds-jurko_0.6.bb
index d230c8d..183eab0 100644
--- a/meta-openstack/recipes-devtools/python/python3-suds-jurko_0.6.bb
+++ b/meta-openstack/recipes-devtools/python/python3-suds-jurko_0.6.bb
@@ -1,3 +1,20 @@
-inherit setuptools3
-require python-suds-jurko.inc
+DESCRIPTION = "Lightweight SOAP client (Jurko's fork)"
+HOMEPAGE = "https://bitbucket.org/jurko/suds"
+SECTION = "devel/python"
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=847e96bce86d8774f491a92924343a29"
+
+PYPI_PACKAGE_EXT = "tar.bz2"
+
+SRC_URI[md5sum] = "1309e9bc2454aa3434041f0a24ae4e11"
+SRC_URI[sha256sum] = "29edb72fd21e3044093d86f33c66cf847c5aaab26d64cb90e69e528ef014e57f"
+
+inherit pypi setuptools3
+
+DEPENDS += " \
+        ${PYTHON_PN}-pip \
+        "
+
+RDEPENDS_${PN} += " \
+        "
 
-- 
2.17.1



