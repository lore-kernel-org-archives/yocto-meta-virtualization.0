Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.4712.1600741797350439709
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Sep 2020 19:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id CB9A238C0848
	for <meta-virtualization@yoctoproject.org>; Mon, 21 Sep 2020 19:29:56 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,288,1596470400"; 
   d="scan'208";a="99489099"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Sep 2020 10:29:55 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 9719448990D2
	for <meta-virtualization@yoctoproject.org>; Tue, 22 Sep 2020 10:29:52 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 22 Sep 2020 10:29:50 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-mistralclient: Change to python3
Date: Tue, 22 Sep 2020 10:29:46 +0800
Message-ID: <1600741786-124453-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 9719448990D2.A51CD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python2 is no longer maintained, bb file is changed to python3 version.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-mistralclient_git.bb        | 32 -------------------
 .../python/python3-mistralclient_4.1.1.bb     | 29 +++++++++++++++++
 2 files changed, 29 insertions(+), 32 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-mistralclient_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-mistralclient_4.1.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-mistralclient_git.bb b/meta-openstack/recipes-devtools/python/python-mistralclient_git.bb
deleted file mode 100644
index c9002e9..0000000
--- a/meta-openstack/recipes-devtools/python/python-mistralclient_git.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION = "Python client for Mistral REST API"
-HOMEPAGE = "https://github.com/openstack/python-mistralclient"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
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
-RDEPENDS_${PN} +=" \
-        python-cliff \
-        python-pbr \
-        python-keystoneclient \
-        python-pyyaml \
-        python-requests \
-	"
-
-SRCNAME = "mistralclient"
-SRC_URI = "git://github.com/openstack/${BPN}.git;branch=master"
-
-PV = "1.1.0+git${SRCPV}"
-SRCREV = "48e2780ee0148efc186c8972ca22e572fa2433c5"
-S = "${WORKDIR}/git"
-
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-mistralclient_4.1.1.bb b/meta-openstack/recipes-devtools/python/python3-mistralclient_4.1.1.bb
new file mode 100644
index 0000000..dd0eb90
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-mistralclient_4.1.1.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "Python client for Mistral REST API"
+HOMEPAGE = "https://github.com/openstack/python-mistralclient"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+
+SRC_URI[sha256sum] = "b03d52ec860df292192a0face767585633e209ba9297fc71da70d42d6a76aebe"
+
+PYPI_PACKAGE = "python-mistralclient"
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
+RDEPENDS_${PN} +=" \
+        python3-cliff \
+        python3-pbr \
+        python3-keystoneclient \
+        python3-pyyaml \
+        python3-requests \
+	"
+
+inherit setuptools3 pypi
-- 
2.25.1



