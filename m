Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.1533.1603176148466097000
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 23:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7BED538C06C8
	for <meta-virtualization@yoctoproject.org>; Mon, 19 Oct 2020 23:42:25 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,396,1596470400"; 
   d="scan'208";a="100321986"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Oct 2020 14:42:24 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 4001648990FB
	for <meta-virtualization@yoctoproject.org>; Tue, 20 Oct 2020 14:42:23 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 20 Oct 2020 14:42:21 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-oslo.versionedobjects: change to python3
Date: Tue, 20 Oct 2020 14:42:18 +0800
Message-ID: <1603176138-40410-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 4001648990FB.A2449
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python2 is no longer maintained, bb file is changed to python3 version.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python-oslo.versionedobjects_git.bb       | 41 -------------------
 .../python3-oslo.versionedobjects_git.bb      | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 41 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-oslo.versionedobjects_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-oslo.versionedobjects_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.versionedobjects_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.versionedobjects_git.bb
deleted file mode 100644
index 16a57e1..0000000
--- a/meta-openstack/recipes-devtools/python/python-oslo.versionedobjects_git.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-DESCRIPTION = "oslo.versionedobjects library"
-HOMEPAGE = "https://wiki.openstack.org/wiki/Oslo"
-SECTION = "devel/python"
-LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
-
-PV = "1.26.0+git${SRCPV}"
-SRCREV = "78cd10662f20c4ae43e20a2dfa844cfd4e5cae26"
-
-SRCNAME = "oslo.versionedobjects"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools3
-
-DEPENDS += " \
-        python-pip \
-        python-pbr \
-        "
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-        python-pbr-native \
-        "
-
-# RDEPENDS_default: 
-RDEPENDS_${PN} += " \
-        python-six \
-        python-oslo.concurrency \
-        python-oslo.config \
-        python-oslo.context \
-        python-oslo.messaging \
-        python-oslo.serialization \
-        python-oslo.utils \
-        python-oslo.log \
-        python-oslo.i18n \
-        python-webob \
-        python-iso8601 \
-        python-netaddr \
-       "
diff --git a/meta-openstack/recipes-devtools/python/python3-oslo.versionedobjects_git.bb b/meta-openstack/recipes-devtools/python/python3-oslo.versionedobjects_git.bb
new file mode 100644
index 0000000..41064dd
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-oslo.versionedobjects_git.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "oslo.versionedobjects library"
+HOMEPAGE = "https://wiki.openstack.org/wiki/Oslo"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+PV = "2.3.0+git${SRCPV}"
+SRCREV = "8db69628834332ed2df6690135be5d5c1ebd3ca1"
+
+SRCNAME = "oslo.versionedobjects"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+DEPENDS += " \
+        python3-pip \
+        python3-pbr \
+        "
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python3-pbr-native \
+        "
+
+# RDEPENDS_default: 
+RDEPENDS_${PN} += " \
+        python3-six \
+        python3-oslo.concurrency \
+        python3-oslo.config \
+        python3-oslo.context \
+        python3-oslo.messaging \
+        python3-oslo.serialization \
+        python3-oslo.utils \
+        python3-oslo.log \
+        python3-oslo.i18n \
+        python3-webob \
+        python3-iso8601 \
+        python3-netaddr \
+       "
-- 
2.25.1



