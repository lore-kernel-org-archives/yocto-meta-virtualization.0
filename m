Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.2939.1595899217301930619
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jul 2020 18:20:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2C1D1E01F26; Mon, 27 Jul 2020 18:20:17 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8082CE01F25
	for <meta-virtualization@yoctoproject.org>; Mon, 27 Jul 2020 18:20:15 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,404,1589212800"; 
   d="scan'208";a="96962013"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jul 2020 09:20:12 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id E80404CE5059
	for <meta-virtualization@yoctoproject.org>; Tue, 28 Jul 2020 09:20:10 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 28 Jul 2020 09:20:09 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-zaqarclient: Change to python3
Date: Tue, 28 Jul 2020 09:20:03 +0800
Message-ID: <1595899203-25666-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595899203-25666-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1595899203-25666-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E80404CE5059.A3E7D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-zaqarclient_git.bb          | 37 -------------------
 .../python/python3-zaqarclient_2.0.0.bb       | 34 +++++++++++++++++
 2 files changed, 34 insertions(+), 37 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-zaqarclient_2.0.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb b/meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb
deleted file mode 100644
index 47b28f3..0000000
--- a/meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-DESCRIPTION = "Python Zaqar Client"
-HOMEPAGE = "https://github.com/openstack/python-zaqarclient"
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
-        python-pbr \
-        python-requests \
-        python-six \
-        python-stevedore \
-        python-jsonschema \
-        python-oslo.i18n \
-        python-oslo.log \
-        python-oslo.utils \
-        python-keystoneauth1 \
-        python-osc-lib \
-	"
-	
-SRCNAME = "zaqarclient"
-SRC_URI = "git://github.com/openstack/${BPN}.git"
-
-PV = "1.12.0+git${SRCPV}"
-SRCREV = "9038bf6ba93c24c9a61447dfcb14e436f1267066"
-S = "${WORKDIR}/git"
-
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-zaqarclient_2.0.0.bb b/meta-openstack/recipes-devtools/python/python3-zaqarclient_2.0.0.bb
new file mode 100644
index 0000000..89c3081
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-zaqarclient_2.0.0.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Python Zaqar Client"
+HOMEPAGE = "https://github.com/openstack/python-zaqarclient"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+
+SRC_URI[sha256sum] = "c64e74d1f69321cb2f33721974c793cac1172eb8397056dfc39a7eb3d9c036de"
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
+        python3-pbr \
+        python3-requests \
+        python3-six \
+        python3-stevedore \
+        python3-jsonschema \
+        python3-oslo.i18n \
+        python3-oslo.log \
+        python3-oslo.utils \
+        python3-keystoneauth1 \
+        python3-osc-lib \
+	"
+
+PYPI_PACKAGE = "python-zaqarclient"
+
+inherit setuptools3 pypi
-- 
2.25.1



