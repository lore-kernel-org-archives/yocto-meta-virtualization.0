Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.11817.1593402808266288794
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 28 Jun 2020 20:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,293,1589212800"; 
   d="scan'208";a="95462008"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Jun 2020 11:38:06 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id D8C5F4CE49D8
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 29 Jun 2020 11:27:36 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 29 Jun 2020 11:38:06 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH] python3-xstatic-bootswatch: Change python to python3
Date: Mon, 29 Jun 2020 11:37:51 +0800
Message-ID: <1593401871-17345-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593401871-17345-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1593401871-17345-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: D8C5F4CE49D8.A5F0B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/python-xstatic-bootswatch.inc      | 19 -----------------
 .../python-xstatic-bootswatch_3.3.7.0.bb      |  2 --
 .../python3-xstatic-bootswatch_3.3.7.0.bb     | 21 +++++++++++++++++--
 3 files changed, 19 insertions(+), 23 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-bootswatch.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-bootswatch_3.3.7.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-bootswatch.inc b/meta-openstack/recipes-devtools/python/python-xstatic-bootswatch.inc
deleted file mode 100644
index 60b978a..0000000
--- a/meta-openstack/recipes-devtools/python/python-xstatic-bootswatch.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "bootswatch javascript library packaged for setuptools (easy_install) / pip."
-HOMEPAGE = "https://pypi.python.org/pypi/XStatic-bootswatch"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-
-PYPI_PACKAGE = "XStatic-bootswatch"
-
-SRC_URI[md5sum] = "422f09e076ff1741b76a9f7554ceca32"
-SRC_URI[sha256sum] = "93ee5863c1ec07212fe12ae137a10708b4102720391d460f061dd3f441ba3b6e"
-
-inherit pypi
-
-DEPENDS += " \
-        ${PYTHON_PN}-pip \
-        "
-
-RDEPENDS_${PN} += " \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-bootswatch_3.3.7.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-bootswatch_3.3.7.0.bb
deleted file mode 100644
index 5a7d5f8..0000000
--- a/meta-openstack/recipes-devtools/python/python-xstatic-bootswatch_3.3.7.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-xstatic-bootswatch.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-bootswatch_3.3.7.0.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-bootswatch_3.3.7.0.bb
index 5a7d5f8..52cbe2a 100644
--- a/meta-openstack/recipes-devtools/python/python3-xstatic-bootswatch_3.3.7.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-bootswatch_3.3.7.0.bb
@@ -1,2 +1,19 @@
-require python-xstatic-bootswatch.inc
-inherit setuptools3
+DESCRIPTION = "bootswatch javascript library packaged for setuptools (easy_install) / pip."
+HOMEPAGE = "https://pypi.python.org/pypi/XStatic-bootswatch"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+PYPI_PACKAGE = "XStatic-bootswatch"
+
+SRC_URI[md5sum] = "422f09e076ff1741b76a9f7554ceca32"
+SRC_URI[sha256sum] = "93ee5863c1ec07212fe12ae137a10708b4102720391d460f061dd3f441ba3b6e"
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



