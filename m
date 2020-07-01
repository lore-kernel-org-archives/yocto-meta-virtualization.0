Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.15977.1593586815721975371
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 00:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,299,1589212800"; 
   d="scan'208";a="95616575"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Jul 2020 15:00:04 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 294B94CE4BD9
	for <meta-virtualization@lists.yoctoproject.org>; Wed,  1 Jul 2020 14:49:31 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 1 Jul 2020 15:00:00 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH] python3-warlock: fix build error
Date: Wed, 1 Jul 2020 14:59:53 +0800
Message-ID: <1593586793-23074-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593586793-23074-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1593586793-23074-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 294B94CE4BD9.A5E41
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-warlock.inc | 17 -----------------
 .../python/python3-warlock_1.3.3.bb            | 18 ++++++++++++++++--
 2 files changed, 16 insertions(+), 19 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-warlock.inc

diff --git a/meta-openstack/recipes-devtools/python/python-warlock.inc b/meta-openstack/recipes-devtools/python/python-warlock.inc
deleted file mode 100644
index d8a16b1..0000000
--- a/meta-openstack/recipes-devtools/python/python-warlock.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Build self-validating python objects using JSON schemas"
-HOMEPAGE = "http://github.com/bcwaldon/warlock"
-SECTION = "devel/python"
-LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-DEPENDS += "python-jsonschema python-jsonpatch"
-
-SRC_URI[md5sum] = "746aba989d97762948e5fca6601f283f"
-SRC_URI[sha256sum] = "a093c4d04b42b7907f69086e476a766b7639dca50d95edc83aef6aeab9db2090"
-
-inherit pypi
-
-RDEPENDS_${PN} += "${PYTHON_PN}-jsonschema \
-                   ${PYTHON_PN}-jsonpatch  \
-                  "
-
diff --git a/meta-openstack/recipes-devtools/python/python3-warlock_1.3.3.bb b/meta-openstack/recipes-devtools/python/python3-warlock_1.3.3.bb
index 7f4d350..b4f4874 100644
--- a/meta-openstack/recipes-devtools/python/python3-warlock_1.3.3.bb
+++ b/meta-openstack/recipes-devtools/python/python3-warlock_1.3.3.bb
@@ -1,3 +1,17 @@
-inherit setuptools3
-require python-warlock.inc
+DESCRIPTION = "Build self-validating python objects using JSON schemas"
+HOMEPAGE = "http://github.com/bcwaldon/warlock"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+DEPENDS += "python3-jsonschema python3-jsonpatch"
+
+SRC_URI[md5sum] = "746aba989d97762948e5fca6601f283f"
+SRC_URI[sha256sum] = "a093c4d04b42b7907f69086e476a766b7639dca50d95edc83aef6aeab9db2090"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-jsonschema \
+                   ${PYTHON_PN}-jsonpatch  \
+                  "
 
-- 
2.17.1



