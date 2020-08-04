Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.1110.1596528735008479425
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Aug 2020 01:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D7809E01F80; Tue,  4 Aug 2020 01:12:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5F29E01F7C
	for <meta-virtualization@yoctoproject.org>; Tue,  4 Aug 2020 01:12:12 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,433,1589212800"; 
   d="scan'208";a="97579905"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Aug 2020 16:12:09 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 6357F4CE4B09
	for <meta-virtualization@yoctoproject.org>; Tue,  4 Aug 2020 16:12:07 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 4 Aug 2020 16:12:07 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-swiftclient: change to python3
Date: Wed, 5 Aug 2020 01:11:07 +0800
Message-ID: <1596561067-7808-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 6357F4CE4B09.A860B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
---
 .../python/python-swiftclient_git.bb          | 35 -------------------
 .../python/python3-swiftclient_3.10.0.bb      | 31 ++++++++++++++++
 2 files changed, 31 insertions(+), 35 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-swiftclient_3.10.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb b/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
deleted file mode 100644
index 7a99e8a..0000000
--- a/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "Client library for OpenStack Object Storage API"
-HOMEPAGE = "https://github.com/openstack/python-swiftclient"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
-
-PR = "r0"
-SRCNAME = "swiftclient"
-
-SRC_URI = "git://github.com/openstack/python-swiftclient.git;branch=master"
-
-PV = "3.8.1+git${SRCPV}"
-SRCREV = "72b90fed4c62cf75497a7d66714f5fb0aa91f18b"
-S = "${WORKDIR}/git"
-
-inherit setuptools3 python3-dir
-
-do_install_append() {
-    cp -r tests ${D}/${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/
-}
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
-RDEPENDS_${PN} += " \
-        python-simplejson \
-        python-pbr \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-swiftclient_3.10.0.bb b/meta-openstack/recipes-devtools/python/python3-swiftclient_3.10.0.bb
new file mode 100644
index 0000000..1025d9e
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-swiftclient_3.10.0.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Client library for OpenStack Object Storage API"
+HOMEPAGE = "https://github.com/openstack/python-swiftclient"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+
+PYPI_PACKAGE = "python-swiftclient"
+
+SRC_URI[sha256sum] = "66227eaf29a691c70675fb9982022980b92797c273dd5e6dc7e680425e9a3634"
+
+inherit pypi setuptools3 python3-dir
+
+do_install_append() {
+    cp -r test ${D}/${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/
+}
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
+RDEPENDS_${PN} += " \
+        python3-simplejson \
+        python3-pbr \
+        python3-requests \
+        "
-- 
2.25.1



