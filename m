Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.8977.1600420771586647777
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Sep 2020 02:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0B1CC38C084A
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 02:19:30 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,274,1596470400"; 
   d="scan'208";a="99403679"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Sep 2020 17:19:30 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A64E448990CB
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 17:19:26 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Sep 2020 17:19:26 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-httpretty: upgrade 0.9.7 -> 1.0.2
Date: Sat, 19 Sep 2020 05:19:29 +0800
Message-ID: <1600463969-30949-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A64E448990CB.A15E5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Copyright year updated to 2020.

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-httpretty.inc               | 18 --------------
 .../python/python3-httpretty_0.9.7.bb         |  3 ---
 .../python/python3-httpretty_1.0.2.bb         | 24 +++++++++++++++++++
 3 files changed, 24 insertions(+), 21 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-httpretty.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-httpretty_0.9.7.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-httpretty_1.0.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-httpretty.inc b/meta-openstack/recipes-devtools/python/python-httpretty.inc
deleted file mode 100644
index 97bd6b3..0000000
--- a/meta-openstack/recipes-devtools/python/python-httpretty.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-#
-# Copyright (C) 2014 Wind River Systems, Inc.
-#
-DESCRIPTION = "HTTP client mock for Python"
-HOMEPAGE = "https://pypi.python.org/pypi/httpretty"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=113a91608a1d89039af9393c39bcaa2c"
-
-SRC_URI[md5sum] = "2fc3d0dc986200be95ce8ad3ef56bc04"
-SRC_URI[sha256sum] = "66216f26b9d2c52e81808f3e674a6fb65d4bf719721394a1a9be926177e55fbe"
-
-inherit pypi
-
-DEPENDS += " \
-        ${PYTHON_PN}-pip \
-        "
-
diff --git a/meta-openstack/recipes-devtools/python/python3-httpretty_0.9.7.bb b/meta-openstack/recipes-devtools/python/python3-httpretty_0.9.7.bb
deleted file mode 100644
index b9f7699..0000000
--- a/meta-openstack/recipes-devtools/python/python3-httpretty_0.9.7.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit setuptools3
-require python-httpretty.inc
-
diff --git a/meta-openstack/recipes-devtools/python/python3-httpretty_1.0.2.bb b/meta-openstack/recipes-devtools/python/python3-httpretty_1.0.2.bb
new file mode 100644
index 0000000..0b8f192
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-httpretty_1.0.2.bb
@@ -0,0 +1,24 @@
+#
+# Copyright (C) 2014 Wind River Systems, Inc.
+#
+DESCRIPTION = "HTTP client mock for Python"
+HOMEPAGE = "https://pypi.python.org/pypi/httpretty"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d87f7868a62b8d598eab40164594d21b"
+
+SRC_URI[md5sum] = "1f6b9b64818837134b93839e5c7051bb"
+SRC_URI[sha256sum] = "24a6fd2fe1c76e94801b74db8f52c0fb42718dc4a199a861b305b1a492b9d868"
+
+inherit setuptools3 pypi
+
+DEPENDS += " \
+        ${PYTHON_PN}-pip \
+        "
+
+RDEPENDS_${PN} = " \
+	${PYTHON_PN}-crypt \
+	${PYTHON_PN}-logging \
+	${PYTHON_PN}-json \
+	${PYTHON_PN}-typing \
+"
-- 
2.25.1



