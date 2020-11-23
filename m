Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.31044.1606110191841524030
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Nov 2020 21:43:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 55DE938C0532
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 05:43:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,361,1599494400"; 
   d="scan'208";a="101645309"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Nov 2020 13:43:10 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 718E54CE5472
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 13:43:05 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 23 Nov 2020 13:43:03 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-pypowervm: upgrade 1.1.10 -> 1.1.24
Date: Mon, 23 Nov 2020 22:43:03 +0800
Message-ID: <1606142583-3826-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 718E54CE5472.A491B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python2 is no longer maintained, bb file is changed to python3 version.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-pypowervm_1.1.10.bb         | 33 -------------------
 .../python/python3-pypowervm_1.1.24.bb        | 32 ++++++++++++++++++
 2 files changed, 32 insertions(+), 33 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pypowervm_1.1.10.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-pypowervm_1.1.24.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pypowervm_1.1.10.bb b/meta-openstack/recipes-devtools/python/python-pypowervm_1.1.10.bb
deleted file mode 100644
index 062d351e..00000000
--- a/meta-openstack/recipes-devtools/python/python-pypowervm_1.1.10.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION = "Python binding for the PowerVM REST API"
-HOMEPAGE = "https://pypi.python.org/pypi/pypowervm"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
-
-SRC_URI[md5sum] = "54e4dfaa569350254b0a0f4c19686ded"
-SRC_URI[sha256sum] = "ab27d4efb59105555b6c9b1fe7792fd895ad9ca893058c39bba4106d6a0ad986"
-
-inherit setuptools3 pypi
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-        python-pbr-native \
-	"
-
-RDEPENDS_${PN} += " \
-        python-lxml \
-        python-oslo.concurrency \
-        python-oslo.context \
-        python-oslo.i18n \
-        python-oslo.log \
-        python-oslo.utils \
-        python-pbr \
-        python-pyasn1-modules \
-        python-pyasn1 \
-        python-pytz \
-        python-requests \
-        python-six \
-        python-futures \
-        python-taskflow \
-        python-networkx \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-pypowervm_1.1.24.bb b/meta-openstack/recipes-devtools/python/python3-pypowervm_1.1.24.bb
new file mode 100644
index 00000000..e659f618
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-pypowervm_1.1.24.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "Python binding for the PowerVM REST API"
+HOMEPAGE = "https://pypi.python.org/pypi/pypowervm"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRC_URI[md5sum] = "50b580055e5628aadaeb42fd69158ff8"
+SRC_URI[sha256sum] = "4c6bf225d2b1022b5d363f9b3695fd1692523235d3ce1b5b4506fbc608bdb535"
+
+inherit setuptools3 pypi
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python3-pbr-native \
+	"
+
+RDEPENDS_${PN} += " \
+        python3-lxml \
+        python3-oslo.concurrency \
+        python3-oslo.context \
+        python3-oslo.i18n \
+        python3-oslo.log \
+        python3-oslo.utils \
+        python3-pbr \
+        python3-pyasn1-modules \
+        python3-pyasn1 \
+        python3-pytz \
+        python3-requests \
+        python3-six \
+        python3-taskflow \
+        python3-networkx \
+        "
-- 
2.25.1



