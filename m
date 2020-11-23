Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.30896.1606110179675270673
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Nov 2020 21:42:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 1ADC138C0532
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 05:42:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,361,1599494400"; 
   d="scan'208";a="101645296"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Nov 2020 13:42:58 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 4EACB4CE5458
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 13:42:52 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 23 Nov 2020 13:42:50 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-os-vif: Change to python3
Date: Mon, 23 Nov 2020 22:42:49 +0800
Message-ID: <1606142569-3789-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 4EACB4CE5458.A73E7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-os-vif_git.bb               | 38 -------------------
 .../python/python3-os-vif_git.bb              | 37 ++++++++++++++++++
 2 files changed, 37 insertions(+), 38 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-os-vif_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-os-vif_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-os-vif_git.bb b/meta-openstack/recipes-devtools/python/python-os-vif_git.bb
deleted file mode 100644
index 6ad2020c..00000000
--- a/meta-openstack/recipes-devtools/python/python-os-vif_git.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-DESCRIPTION = "OpenStack integration library between network and compute providers."
-HOMEPAGE = "https://github.com/openstack/os-vif"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
-
-SRC_URI = "\
-	git://github.com/openstack/os-vif.git;branch=stable/pike \
-	"
-
-PV = "1.7.0+git${SRCPV}"
-SRCREV = "5184b7fc3b8d1689823eacb859087c8a943f9a09"
-S = "${WORKDIR}/git"
-
-inherit setuptools3
-
-DEPENDS += " \
-        python-pbr \
-        "
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-        python-pbr-native \
-	"
-
-RDEPENDS_${PN} += " \
-        python-pbr \
-        python-netaddr \
-        python-oslo.concurrency \
-        python-oslo.config \
-        python-oslo.log \
-        python-oslo.i18n \
-        python-oslo.privsep \
-        python-oslo.versionedobjects \
-        python-six \
-        python-stevedore \
-        "
-	
diff --git a/meta-openstack/recipes-devtools/python/python3-os-vif_git.bb b/meta-openstack/recipes-devtools/python/python3-os-vif_git.bb
new file mode 100644
index 00000000..18a9e6b3
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-os-vif_git.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "OpenStack integration library between network and compute providers."
+HOMEPAGE = "https://github.com/openstack/os-vif"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRC_URI = "\
+	git://github.com/openstack/os-vif.git \
+	"
+
+PV = "2.2.0+git${SRCPV}"
+SRCREV = "d7928102d69dadf653c9f734e5cf8fd504335849"
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+DEPENDS += " \
+        python3-pbr \
+        "
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python3-pbr-native \
+	"
+
+RDEPENDS_${PN} += " \
+        python3-pbr \
+        python3-netaddr \
+        python3-oslo.concurrency \
+        python3-oslo.config \
+        python3-oslo.log \
+        python3-oslo.i18n \
+        python3-oslo.privsep \
+        python3-six \
+        python3-stevedore \
+        "
+	
-- 
2.25.1



