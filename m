Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.31039.1606110167149958016
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Nov 2020 21:42:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7720238C0532
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 05:42:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,361,1599494400"; 
   d="scan'208";a="101645286"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Nov 2020 13:42:46 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 0D7944CE5464
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 13:42:44 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 23 Nov 2020 13:42:42 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-os-brick: Change to python3
Date: Mon, 23 Nov 2020 22:42:43 +0800
Message-ID: <1606142563-3752-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 0D7944CE5464.A3748
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-os-brick_git.bb             | 42 -------------------
 .../python/python3-os-brick_git.bb            | 42 +++++++++++++++++++
 2 files changed, 42 insertions(+), 42 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-os-brick_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-os-brick_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-os-brick_git.bb b/meta-openstack/recipes-devtools/python/python-os-brick_git.bb
deleted file mode 100644
index 5dd08dce..00000000
--- a/meta-openstack/recipes-devtools/python/python-os-brick_git.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-DESCRIPTION = "OpenStack Cinder brick library for managing local volume attaches"
-HOMEPAGE = "https://github.com/openstack/os-brick"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
-
-SRC_URI = "\
-	git://github.com/openstack/os-brick.git;branch=stable/pike \
-	"
-
-PV = "1.15.5+git${SRCPV}"
-SRCREV = "4090db76673cadb3b8adfceb106069e03414de49"
-S = "${WORKDIR}/git"
-
-inherit setuptools3
-
-FILES_${PN} += "${datadir}/etc/*"
-
-DEPENDS += " \
-        python-pbr \
-        "
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-        python-pbr-native \
-        "
-
-RDEPENDS_${PN} += " \
-        python-pbr \
-        python-babel \
-        python-eventlet \
-        python-oslo.concurrency \
-        python-oslo.log \
-        python-oslo.serialization \
-        python-oslo.i18n \
-        python-oslo.privsep \
-        python-oslo.service \
-        python-oslo.utils \
-        python-requests \
-        python-retrying \
-        python-six \
-        python-os-win \
diff --git a/meta-openstack/recipes-devtools/python/python3-os-brick_git.bb b/meta-openstack/recipes-devtools/python/python3-os-brick_git.bb
new file mode 100644
index 00000000..4fc01f62
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-os-brick_git.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "OpenStack Cinder brick library for managing local volume attaches"
+HOMEPAGE = "https://github.com/openstack/os-brick"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRC_URI = "\
+	git://github.com/openstack/os-brick.git;branch=stable/victoria \
+	"
+SRCREV = "f0cf77672fed70f20896c23015cb50341f311f38"
+
+PV = "4.0.1+git${SRCPV}"
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+FILES_${PN} += "${datadir}/etc/*"
+
+DEPENDS += " \
+        python3-pbr \
+        "
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python3-pbr-native \
+        "
+
+RDEPENDS_${PN} += " \
+        python3-pbr \
+        python3-babel \
+        python3-eventlet \
+        python3-oslo.concurrency \
+        python3-oslo.log \
+        python3-oslo.serialization \
+        python3-oslo.i18n \
+        python3-oslo.privsep \
+        python3-oslo.service \
+        python3-oslo.utils \
+        python3-requests \
+        python3-retrying \
+        python3-six \
+        python3-os-win \
-- 
2.25.1



