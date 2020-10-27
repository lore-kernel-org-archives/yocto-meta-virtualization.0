Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.9536.1603776555357784368
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 22:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 3750438C1176
	for <meta-virtualization@yoctoproject.org>; Mon, 26 Oct 2020 22:29:14 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,422,1596470400"; 
   d="scan'208";a="100542299"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Oct 2020 13:29:13 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 30F3A4CE1A08
	for <meta-virtualization@yoctoproject.org>; Tue, 27 Oct 2020 13:29:07 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 27 Oct 2020 13:29:05 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-requestsexceptions: Consolidate in a single file
Date: Tue, 27 Oct 2020 13:29:03 +0800
Message-ID: <1603776543-96637-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 30F3A4CE1A08.A7B97
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-requestsexceptions.inc      | 23 -----------------
 .../python3-requestsexceptions_1.4.0.bb       | 25 +++++++++++++++++--
 2 files changed, 23 insertions(+), 25 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-requestsexceptions.inc

diff --git a/meta-openstack/recipes-devtools/python/python-requestsexceptions.inc b/meta-openstack/recipes-devtools/python/python-requestsexceptions.inc
deleted file mode 100644
index bac99a3..0000000
--- a/meta-openstack/recipes-devtools/python/python-requestsexceptions.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Import exceptions from potentially bundled packages in requests."
-HOMEPAGE = "https://www.openstack.org/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
-
-SRC_URI[md5sum] = "f43b246ccd7d5b618e6f0dc946a6c3f3"
-SRC_URI[sha256sum] = "b095cbc77618f066d459a02b137b020c37da9f46d9b057704019c9f77dba3065"
-
-inherit pypi
-
-# conflicting file prevention
-do_install_append() {
-	rm -f ${D}${libdir}/python*/site-packages/tests/*
-}
-
-DEPENDS += " \
-        ${PYTHON_PN}-pbr-native \
-        "
-
-RDEPENDS_${PN} += " \
-        ${PYTHON_PN}-pbr \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-requestsexceptions_1.4.0.bb b/meta-openstack/recipes-devtools/python/python3-requestsexceptions_1.4.0.bb
index 1c049f3..4bf9c0e 100644
--- a/meta-openstack/recipes-devtools/python/python3-requestsexceptions_1.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-requestsexceptions_1.4.0.bb
@@ -1,2 +1,23 @@
-inherit setuptools3
-require python-requestsexceptions.inc
+DESCRIPTION = "Import exceptions from potentially bundled packages in requests."
+HOMEPAGE = "https://www.openstack.org/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
+
+SRC_URI[md5sum] = "f43b246ccd7d5b618e6f0dc946a6c3f3"
+SRC_URI[sha256sum] = "b095cbc77618f066d459a02b137b020c37da9f46d9b057704019c9f77dba3065"
+
+inherit setuptools3 pypi
+
+# conflicting file prevention
+do_install_append() {
+	rm -f ${D}${libdir}/python*/site-packages/tests/*
+}
+
+DEPENDS += " \
+        ${PYTHON_PN}-pbr-native \
+        "
+
+RDEPENDS_${PN} += " \
+        ${PYTHON_PN}-pbr \
+        "
-- 
2.25.1



