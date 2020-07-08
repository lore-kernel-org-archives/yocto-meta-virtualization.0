Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.6719.1594198481766301173
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Jul 2020 01:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,327,1589212800"; 
   d="scan'208";a="95925635"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Jul 2020 16:54:30 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 60D6B4CE4BD9
	for <meta-virtualization@lists.yoctoproject.org>; Wed,  8 Jul 2020 16:54:29 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Jul 2020 16:54:29 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH] python3-xstatic-jquery-ui: Change python to python3
Date: Wed, 8 Jul 2020 16:54:22 +0800
Message-ID: <1594198463-42395-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594198463-42395-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1594198463-42395-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 60D6B4CE4BD9.A7890
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

upgrade 1.11.0.1 -> 1.12.1.1

PKG-INFO-Update: Version updated to 1.12.1.1.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python-xstatic-jquery-ui_1.11.0.1.bb      | 22 -------------------
 .../python3-xstatic-jquery-ui_1.12.1.1.bb     | 22 +++++++++++++++++++
 2 files changed, 22 insertions(+), 22 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-jquery-ui_1.11.0.1.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-xstatic-jquery-ui_1.12.1.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jquery-ui_1.11.0.1.bb b/meta-openstack/recipes-devtools/python/python-xstatic-jquery-ui_1.11.0.1.bb
deleted file mode 100644
index ca2d447..0000000
--- a/meta-openstack/recipes-devtools/python/python-xstatic-jquery-ui_1.11.0.1.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "%DESCRIPTION%"
-HOMEPAGE = "%URL%"
-SECTION = "devel/python"
-LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=55ac15f231e5629fb6576e349c318199"
-
-PYPI_PACKAGE = "XStatic-jquery-ui"
-
-SRC_URI[md5sum] = "03d8ea7a0dab29d548e7bc195703b04f"
-SRC_URI[sha256sum] = "099b1836eb0d91b8dc98f5b8a6b856a2631d43af0d47f33ef90ee72ed37bda58"
-
-inherit setuptools3 pypi
-
-# DEPENDS_default: python-pip
-
-DEPENDS += " \
-        python-pip \
-        "
-
-# RDEPENDS_default: 
-RDEPENDS_${PN} += " \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-jquery-ui_1.12.1.1.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-jquery-ui_1.12.1.1.bb
new file mode 100644
index 0000000..98346af
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-jquery-ui_1.12.1.1.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "%DESCRIPTION%"
+HOMEPAGE = "%URL%"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=7de5500e6244db6d698bbb724aea9a17"
+
+PYPI_PACKAGE = "XStatic-jquery-ui"
+
+SRC_URI[md5sum] = "2d5569524c7936d82f41d833f3c84e62"
+SRC_URI[sha256sum] = "d6ba48bb474420a8bcb2be02eef6ae96281ec24eff6befa54f04ebc9e4cc8910"
+
+inherit setuptools3 pypi
+
+# DEPENDS_default: python3-pip
+
+DEPENDS += " \
+        python3-pip \
+        "
+
+# RDEPENDS_default: 
+RDEPENDS_${PN} += " \
+        "
-- 
2.17.1



