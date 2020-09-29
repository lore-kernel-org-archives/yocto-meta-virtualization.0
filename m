Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.12325.1601348350041801037
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Sep 2020 19:59:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 90C9938C06C2
	for <meta-virtualization@yoctoproject.org>; Mon, 28 Sep 2020 19:59:09 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,316,1596470400"; 
   d="scan'208";a="99697871"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Sep 2020 10:59:08 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 3E13748990E8
	for <meta-virtualization@yoctoproject.org>; Tue, 29 Sep 2020 10:59:04 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 29 Sep 2020 10:59:03 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-oslo.messaging: change to python3
Date: Tue, 29 Sep 2020 22:59:02 +0800
Message-ID: <1601391542-5125-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3E13748990E8.A06CE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python2 is no longer maintained, bb file is changed to python3 version.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-oslo.messaging_git.bb       | 52 -------------------
 .../python/python3-oslo.messaging_git.bb      | 51 ++++++++++++++++++
 2 files changed, 51 insertions(+), 52 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-oslo.messaging_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb
deleted file mode 100644
index 28404e3..0000000
--- a/meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb
+++ /dev/null
@@ -1,52 +0,0 @@
-DESCRIPTION = "Oslo Messaging API"
-HOMEPAGE = "https://launchpad.net/oslo"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
-
-SRCNAME = "oslo.messaging"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
-
-PV = "5.30.1+git${SRCPV}"
-SRCREV = "a07d852b237d229a0f4dd55fd83379c0581e44e9"
-S = "${WORKDIR}/git"
-
-inherit setuptools3
-
-# DEPENDS_default: python-pip
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
-        bash \
-        python-pbr \
-        python-cachetools \
-        python-futurist \
-        python-oslo.log \
-        python-oslo.utils \
-        python-oslo.serialization \
-        python-oslo.middleware \
-        python-oslo.service \
-        python-oslo.i18n \
-        python-stevedore \
-        python-debtcollector \
-        python-monotonic \
-        python-six \
-        python-webob \
-        python-pyyaml \
-        python-amqp \
-        python-kombu \
-        python-pika \
-        python-pika-pool \
-        python-futures \
-        python-tenacity \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-oslo.messaging_git.bb b/meta-openstack/recipes-devtools/python/python3-oslo.messaging_git.bb
new file mode 100644
index 0000000..9582c6b
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-oslo.messaging_git.bb
@@ -0,0 +1,51 @@
+DESCRIPTION = "Oslo Messaging API"
+HOMEPAGE = "https://launchpad.net/oslo"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
+
+SRCNAME = "oslo.messaging"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
+
+PV = "12.5.0+git${SRCPV}"
+SRCREV = "62e104bdb57714a0754f788795d1b4faf8ebb74d"
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+# DEPENDS_default: python-pip
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
+        bash \
+        python3-pbr \
+        python3-cachetools \
+        python3-futurist \
+        python3-oslo.log \
+        python3-oslo.utils \
+        python3-oslo.serialization \
+        python3-oslo.middleware \
+        python3-oslo.service \
+        python3-oslo.i18n \
+        python3-stevedore \
+        python3-debtcollector \
+        python3-monotonic \
+        python3-six \
+        python3-webob \
+        python3-pyyaml \
+        python3-amqp \
+        python3-kombu \
+        python3-pika \
+        python3-pika-pool \
+        python3-tenacity \
+        "
-- 
2.25.1



