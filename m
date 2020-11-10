Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.24197.1604990861216907970
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 22:47:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id B1E6338C06E0
	for <meta-virtualization@yoctoproject.org>; Mon,  9 Nov 2020 22:47:40 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.77,465,1596470400"; 
   d="scan'208";a="101136653"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 10 Nov 2020 14:47:40 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 3D6684CE3A70
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Nov 2020 14:47:39 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 10 Nov 2020 14:47:38 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-routes: upgrade 2.4.1 -> 2.5.1
Date: Tue, 10 Nov 2020 14:47:40 +0800
Message-ID: <1604990860-96957-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 3D6684CE3A70.A7FD3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-routes.inc   | 15 ---------------
 .../python/python3-routes_2.5.1.bb              | 17 +++++++++++++++++
 .../python/python3-routes_git.bb                |  2 --
 3 files changed, 17 insertions(+), 17 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-routes.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-routes_2.5.1.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-routes_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-routes.inc b/meta-openstack/recipes-devtools/python/python-routes.inc
deleted file mode 100644
index 4224552f..00000000
--- a/meta-openstack/recipes-devtools/python/python-routes.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "A Python re-implementation of the Rails routes system."
-HOMEPAGE = "http://routes.groovie.org"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=90976c1a0e3029278f882cfe2e84a6ae"
-
-PV = "2.4.1+git${SRCPV}"
-SRCREV = "2dcef8079cf09f427eeb0be62374f6c1a52bf59d"
-
-SRCNAME = "Routes"
-SRC_URI = "git://github.com/bbangert/routes.git"
-
-S = "${WORKDIR}/git"
-
-RDEPENDS_${PN} += "${PYTHON_PN}-repoze.lru"
diff --git a/meta-openstack/recipes-devtools/python/python3-routes_2.5.1.bb b/meta-openstack/recipes-devtools/python/python3-routes_2.5.1.bb
new file mode 100644
index 00000000..309bb292
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-routes_2.5.1.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "A Python re-implementation of the Rails routes system."
+HOMEPAGE = "http://routes.groovie.org"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=90976c1a0e3029278f882cfe2e84a6ae"
+
+SRC_URI[sha256sum] = "b6346459a15f0cbab01a45a90c3d25caf980d4733d628b4cc1952b865125d053"
+
+PYPI_PACKAGE = "Routes"
+
+inherit setuptools3 pypi
+
+RDEPENDS_${PN} += " \
+	${PYTHON_PN}-netclient \	
+	${PYTHON_PN}-six \	
+	${PYTHON_PN}-repoze.lru \	
+"
diff --git a/meta-openstack/recipes-devtools/python/python3-routes_git.bb b/meta-openstack/recipes-devtools/python/python3-routes_git.bb
deleted file mode 100644
index 06dd1ad7..00000000
--- a/meta-openstack/recipes-devtools/python/python3-routes_git.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-routes.inc
-- 
2.25.1



