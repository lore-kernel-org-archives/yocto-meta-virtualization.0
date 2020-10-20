Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.1608.1603176703830893821
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 23:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4686A38C0694
	for <meta-virtualization@yoctoproject.org>; Mon, 19 Oct 2020 23:51:43 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,396,1596470400"; 
   d="scan'208";a="100322394"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Oct 2020 14:51:42 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 2B1B44CE3119
	for <meta-virtualization@yoctoproject.org>; Tue, 20 Oct 2020 14:51:36 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 20 Oct 2020 14:51:35 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-saharaclient: upgrade 2.3.0 -> 3.2.1
Date: Tue, 20 Oct 2020 14:51:34 +0800
Message-ID: <1603176694-40858-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2B1B44CE3119.A1A01
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-saharaclient.inc            | 28 -----------------
 .../python/python3-saharaclient_git.bb        | 30 ++++++++++++++++++-
 2 files changed, 29 insertions(+), 29 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-saharaclient.inc

diff --git a/meta-openstack/recipes-devtools/python/python-saharaclient.inc b/meta-openstack/recipes-devtools/python/python-saharaclient.inc
deleted file mode 100644
index 91549ae..0000000
--- a/meta-openstack/recipes-devtools/python/python-saharaclient.inc
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "CLI and python client library for OpenStack Sahara"
-HOMEPAGE = "https://launchpad.net/sahara"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
-
-DEPENDS += " \
-        ${PYTHON_PN}-pip \
-        ${PYTHON_PN}-pbr \
-        "
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-        ${PYTHON_PN}-pbr-native \
-"
-
-RDEPENDS_${PN} += " \
-	${PYTHON_PN}-pbr \
-	"
-
-SRCNAME = "saharaclient"
-
-SRC_URI = "git://github.com/openstack/python-saharaclient.git;branch=master"
-
-PV = "2.3.0+git${SRCPV}"
-SRCREV = "3107b452467537f4eef3d9ecfb5e35d110d19662"
-S = "${WORKDIR}/git"
-
diff --git a/meta-openstack/recipes-devtools/python/python3-saharaclient_git.bb b/meta-openstack/recipes-devtools/python/python3-saharaclient_git.bb
index 806cd76..9ec4c56 100644
--- a/meta-openstack/recipes-devtools/python/python3-saharaclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-saharaclient_git.bb
@@ -1,2 +1,30 @@
-require python-saharaclient.inc
+DESCRIPTION = "CLI and python client library for OpenStack Sahara"
+HOMEPAGE = "https://launchpad.net/sahara"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+DEPENDS += " \
+        ${PYTHON_PN}-pip \
+        ${PYTHON_PN}-pbr \
+        "
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        ${PYTHON_PN}-pbr-native \
+"
+
+RDEPENDS_${PN} += " \
+	${PYTHON_PN}-pbr \
+	"
+
+SRCNAME = "saharaclient"
+
 inherit setuptools3
+
+SRC_URI = "git://github.com/openstack/python-saharaclient.git;branch=master"
+
+PV = "3.2.1+git${SRCPV}"
+SRCREV = "a9fee07108c432e20a3ca7760541d4fcb4f14811"
+S = "${WORKDIR}/git"
+
-- 
2.25.1



