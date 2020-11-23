Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.30533.1606108440689765837
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Nov 2020 21:14:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2D40938C0532
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 05:13:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,361,1599494400"; 
   d="scan'208";a="101644564"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Nov 2020 13:13:59 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 3E4C84CE1505
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 13:13:55 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 23 Nov 2020 13:13:56 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH 5/5] python3-openstacksdk: Change to python3
Date: Mon, 23 Nov 2020 22:55:00 +0800
Message-ID: <1606143300-97349-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3E4C84CE1505.A1254
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-openstacksdk_git.bb         | 34 ---------------
 .../python/python3-openstacksdk_git.bb        | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 34 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-openstacksdk_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-openstacksdk_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-openstacksdk_git.bb b/meta-openstack/recipes-devtools/python/python-openstacksdk_git.bb
deleted file mode 100644
index 3e52d0e2..00000000
--- a/meta-openstack/recipes-devtools/python/python-openstacksdk_git.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-DESCRIPTION = "Unified SDK for OpenStack"
-HOMEPAGE = "https://github.com/openstack/python-openstacksdk"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
-
-SRC_URI = " \
-        git://github.com/openstack/python-openstacksdk.git;branch=master \
-        "
-
-PV = "0.9.19+git${SRCPV}"
-SRCREV = "bd60aa4a21676b8901691298eb0786fc231f7bff"
-S = "${WORKDIR}/git"
-
-inherit setuptools3
-
-DEPENDS += "\
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
-        python-jsonpatch \
-        python-six \
-        python-stevedore \
-        python-os-client-config \
-        python-keystoneauth1 \
-        python-deprecation \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-openstacksdk_git.bb b/meta-openstack/recipes-devtools/python/python3-openstacksdk_git.bb
new file mode 100644
index 00000000..7c148187
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-openstacksdk_git.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "Unified SDK for OpenStack"
+HOMEPAGE = "https://github.com/openstack/python-openstacksdk"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+
+SRC_URI = " \
+        git://github.com/openstack/python-openstacksdk.git;branch=master \
+        "
+
+PV = "0.52.0+git${SRCPV}"
+SRCREV = "e169c495de39a2d97ef1d8bb7894b18e4ef268dd"
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+DEPENDS += "\
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
+        bash \
+        python3-jsonpatch \
+        python3-six \
+        python3-stevedore \
+        python3-os-client-config \
+        python3-keystoneauth1 \
+        python3-deprecation \
+        python3-os-service-types \
+        python3-munch \
+        python3-jmespath \
+        python3-netifaces \
+        python3-decorator \
+        python3-dogpile.cache \
+        "
-- 
2.25.1



