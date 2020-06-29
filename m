Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.11573.1593401888679739932
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 28 Jun 2020 20:38:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,293,1589212800"; 
   d="scan'208";a="95462001"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Jun 2020 11:38:00 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 93AE64CE49B3
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 29 Jun 2020 11:27:28 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 29 Jun 2020 11:37:56 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH] python3-flake8: Change python to python3
Date: Mon, 29 Jun 2020 11:37:47 +0800
Message-ID: <1593401871-17345-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 93AE64CE49B3.A3C88
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

upgrade 2.4.0 -> 3.8.3

-License-Update: Copyright year updated to 2016.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/python-flake8_2.4.0.bb               | 17 -----------------
 .../python/python3-flake8_3.8.3.bb              | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 17 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-flake8_2.4.0.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-flake8_3.8.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-flake8_2.4.0.bb b/meta-openstack/recipes-devtools/python/python-flake8_2.4.0.bb
deleted file mode 100644
index f476c42..0000000
--- a/meta-openstack/recipes-devtools/python/python-flake8_2.4.0.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "The modular source code checker: pep8, pyflakes and co"
-HOMEPAGE = "https://github.com/dreamhost/cliff"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7a76e57e683629e1ac2a49406169c2a3"
-
-SRC_URI[md5sum] = "d413935bb21026c18aca82654114502f"
-SRC_URI[sha256sum] = "d26a9d0252da9f831b8277b824961bb10b1f9d79f4752d32e4814b7bcd1e089b"
-
-inherit setuptools3 pypi
-
-RDEPENDS_${PN} += "python-prettytable \
-            python-cmd2 \
-            python-pyparsing \
-            python-mccabe \
-            python-pep8 \
-            python-pyflakes"
diff --git a/meta-openstack/recipes-devtools/python/python3-flake8_3.8.3.bb b/meta-openstack/recipes-devtools/python/python3-flake8_3.8.3.bb
new file mode 100644
index 0000000..9385c80
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-flake8_3.8.3.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "The modular source code checker: pep8, pyflakes and co"
+HOMEPAGE = "https://github.com/dreamhost/cliff"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=75b26781f1adf1aa310bda6098937878"
+
+SRC_URI[md5sum] = "b11380b47468c3dc7323396d4b8c1746"
+SRC_URI[sha256sum] = "f04b9fcbac03b0a3e58c0ab3a0ecc462e023a9faf046d57794184028123aa208"
+
+inherit setuptools3 pypi
+
+RDEPENDS_${PN} += "python3-prettytable \
+            python3-cmd2 \
+            python3-pyparsing \
+            python3-mccabe \
+            python3-pep8 \
+            python3-pyflakes"
-- 
2.17.1



