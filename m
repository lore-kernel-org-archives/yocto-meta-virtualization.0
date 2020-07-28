Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.3153.1595900112782216491
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jul 2020 18:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A037FE01F26; Mon, 27 Jul 2020 18:35:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A9683E01F22
	for <meta-virtualization@yoctoproject.org>; Mon, 27 Jul 2020 18:35:11 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,404,1589212800"; 
   d="scan'208";a="96962887"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jul 2020 09:35:10 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 972324CE2808
	for <meta-virtualization@yoctoproject.org>; Tue, 28 Jul 2020 09:35:08 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 28 Jul 2020 09:35:09 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-semantic-version: upgrade 2.4.2 -> 2.8.5
Date: Tue, 28 Jul 2020 09:35:06 +0800
Message-ID: <1595900106-54645-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 972324CE2808.A5210
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

-License-Update: Copyright update.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
---
 .../python/python-semantic-version.inc        | 24 -------------------
 .../python/python-semantic-version_2.4.2.bb   |  2 --
 .../python/python3-semantic-version_2.4.2.bb  |  2 --
 .../python/python3-semantic-version_2.8.5.bb  | 13 ++++++++++
 4 files changed, 13 insertions(+), 28 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-semantic-version.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-semantic-version_2.4.2.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-semantic-version_2.4.2.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-semantic-version_2.8.5.bb

diff --git a/meta-openstack/recipes-devtools/python/python-semantic-version.inc b/meta-openstack/recipes-devtools/python/python-semantic-version.inc
deleted file mode 100644
index e003c0c..0000000
--- a/meta-openstack/recipes-devtools/python/python-semantic-version.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "A library which provides a few tools to handle SemVer in Python."
-HOMEPAGE = "http://pypi.python.org/pypi/semantic_version"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a7dcaa0740d59f8f13ef05a3d0ed7313"
-
-PYPI_PACKAGE = "semantic_version"
-
-SRC_URI[md5sum] = "fd7d5ade76e78d8540b9a4044496a57c"
-SRC_URI[sha256sum] = "7e8b7fa74a3bc9b6e90b15b83b9bc2377c78eaeae3447516425f475d5d6932d2"
-
-#export BUILD_SYS
-#export HOST_SYS
-
-inherit pypi
-
-# DEPENDS_default: python-pip
-
-DEPENDS += " \
-        "
-
-# RDEPENDS_default: 
-RDEPENDS_${PN} += " \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python-semantic-version_2.4.2.bb b/meta-openstack/recipes-devtools/python/python-semantic-version_2.4.2.bb
deleted file mode 100644
index f4191f5..0000000
--- a/meta-openstack/recipes-devtools/python/python-semantic-version_2.4.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-semantic-version.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-semantic-version_2.4.2.bb b/meta-openstack/recipes-devtools/python/python3-semantic-version_2.4.2.bb
deleted file mode 100644
index f4191f5..0000000
--- a/meta-openstack/recipes-devtools/python/python3-semantic-version_2.4.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-semantic-version.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-semantic-version_2.8.5.bb b/meta-openstack/recipes-devtools/python/python3-semantic-version_2.8.5.bb
new file mode 100644
index 0000000..b91b655
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-semantic-version_2.8.5.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "A library which provides a few tools to handle SemVer in Python."
+HOMEPAGE = "http://pypi.python.org/pypi/semantic_version"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4fb31e3c1c7eeb8b5e8c07657cdd54e2"
+
+PYPI_PACKAGE = "semantic_version"
+
+SRC_URI[md5sum] = "76d7364def7ee487b6153d40b13de904"
+SRC_URI[sha256sum] = "d2cb2de0558762934679b9a104e82eca7af448c9f4974d1f3eeccff651df8a54"
+
+inherit setuptools3 pypi
+
-- 
2.25.1



