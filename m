Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.3207.1595900086234245978
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jul 2020 18:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0F6C2E01F26; Mon, 27 Jul 2020 18:34:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E1499E01F22
	for <meta-virtualization@yoctoproject.org>; Mon, 27 Jul 2020 18:34:44 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,404,1589212800"; 
   d="scan'208";a="96962867"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jul 2020 09:34:43 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 1A2EF4CE506F
	for <meta-virtualization@yoctoproject.org>; Tue, 28 Jul 2020 09:34:42 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 28 Jul 2020 09:34:42 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-os-xenapi: Change to python3
Date: Tue, 28 Jul 2020 09:34:35 +0800
Message-ID: <1595900075-54608-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 1A2EF4CE506F.A8A2F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
---
 .../python/python-os-xenapi_git.bb            | 36 -------------------
 .../python/python3-os-xenapi_0.3.4.bb         | 29 +++++++++++++++
 2 files changed, 29 insertions(+), 36 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-os-xenapi_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-os-xenapi_0.3.4.bb

diff --git a/meta-openstack/recipes-devtools/python/python-os-xenapi_git.bb b/meta-openstack/recipes-devtools/python/python-os-xenapi_git.bb
deleted file mode 100644
index b6ef425..0000000
--- a/meta-openstack/recipes-devtools/python/python-os-xenapi_git.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-DESCRIPTION = "XenAPI library for OpenStack projects."
-HOMEPAGE = "https://github.com/openstack/os-xenapi"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
-
-SRCNAME = "os-xenapi"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master"
-
-PV = "0.3.1+git${SRCPV}"
-SRCREV = "7dce682e2ab0c14236dbc58a38c925536b3b6f8d"
-S = "${WORKDIR}/git"
-
-inherit setuptools3
-
-# DEPENDS_default: python-pip
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
-        python-babel \
-        python-eventlet \
-        python-oslo.concurrency \
-        python-oslo.log \
-        python-oslo.utils \
-        python-oslo.i18n \
-        python-six \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-os-xenapi_0.3.4.bb b/meta-openstack/recipes-devtools/python/python3-os-xenapi_0.3.4.bb
new file mode 100644
index 0000000..d88d0a0
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-os-xenapi_0.3.4.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "XenAPI library for OpenStack projects."
+HOMEPAGE = "https://github.com/openstack/os-xenapi"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRC_URI[sha256sum] = "85d9d4bff4086a9c36eb9b2b9dfce542fa8336821a63826180dc0e8637e8ad72"
+
+inherit setuptools3 pypi
+
+DEPENDS += " \
+        python3-pbr \
+        "
+
+DEPENDS += " \
+        python3-pbr-native \
+	"
+	
+RDEPENDS_${PN} += " \
+	bash \
+        python3-pbr \
+        python3-babel \
+        python3-eventlet \
+        python3-oslo.concurrency \
+        python3-oslo.log \
+        python3-oslo.utils \
+        python3-oslo.i18n \
+        python3-six \
+        "
-- 
2.25.1



