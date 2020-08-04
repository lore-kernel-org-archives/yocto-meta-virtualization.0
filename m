Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.11447.1596508844533922382
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 03 Aug 2020 19:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5E242E01F7E; Mon,  3 Aug 2020 19:40:44 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18C49E01F7F
	for <meta-virtualization@yoctoproject.org>; Mon,  3 Aug 2020 19:40:42 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,432,1589212800"; 
   d="scan'208";a="97568838"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Aug 2020 10:40:38 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 8990C4CE4BDD
	for <meta-virtualization@yoctoproject.org>; Tue,  4 Aug 2020 10:40:34 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 4 Aug 2020 10:40:34 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-pytest-salt: upgrade 2017.7.0 -> 2020.1.27
Date: Tue, 4 Aug 2020 22:40:33 +0800
Message-ID: <1596552033-78898-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596552033-78898-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1596552033-78898-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8990C4CE4BDD.A5A12
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

-License-Update: Change to a PKG-INFO file containing licenses information.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-pytest-salt.inc             | 21 -------------------
 .../python/python-pytest-salt_2017.7.0.bb     |  2 --
 .../python/python3-pytest-salt_2017.7.0.bb    |  2 --
 .../python/python3-pytest-salt_2020.1.27.bb   | 17 +++++++++++++++
 4 files changed, 17 insertions(+), 25 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pytest-salt.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pytest-salt_2017.7.0.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-pytest-salt_2017.7.0.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-pytest-salt_2020.1.27.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pytest-salt.inc b/meta-openstack/recipes-devtools/python/python-pytest-salt.inc
deleted file mode 100644
index 1f82763..0000000
--- a/meta-openstack/recipes-devtools/python/python-pytest-salt.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "This pytest plugin will allow the Salt Daemons to be used in tests."
-HOMEPAGE = "https://github.com/saltstack/pytest-salt"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"
-
-SRCNAME = "pytest-salt"
-SRC_URI = "git://github.com/saltstack/${SRCNAME}.git;branch=master"
-
-SRC_URI[md5sum] = "c598d7db87ea52cdeb067d7596b3b0b1"
-SRC_URI[sha256sum] = "7052459cda9fbdbbfff9a25b24243b0b96cf56835a2c41135d754cc5b65e2494"
-
-SRCREV = "feb5031f80cf84b113ebe69543cdd44b6a373d21"
-S = "${WORKDIR}/git"
-
-RDEPENDS_${PN} = " \
-    ${PYTHON_PN}-pytest \
-    ${PYTHON_PN}-pytest-tempdir \
-    ${PYTHON_PN}-pytest-helpers-namespace \
-    ${PYTHON_PN}-psutil \
-    "
diff --git a/meta-openstack/recipes-devtools/python/python-pytest-salt_2017.7.0.bb b/meta-openstack/recipes-devtools/python/python-pytest-salt_2017.7.0.bb
deleted file mode 100644
index 4e33265..0000000
--- a/meta-openstack/recipes-devtools/python/python-pytest-salt_2017.7.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-pytest-salt.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-pytest-salt_2017.7.0.bb b/meta-openstack/recipes-devtools/python/python3-pytest-salt_2017.7.0.bb
deleted file mode 100644
index 4e33265..0000000
--- a/meta-openstack/recipes-devtools/python/python3-pytest-salt_2017.7.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-pytest-salt.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-pytest-salt_2020.1.27.bb b/meta-openstack/recipes-devtools/python/python3-pytest-salt_2020.1.27.bb
new file mode 100644
index 0000000..f8a19e7
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-pytest-salt_2020.1.27.bb
@@ -0,0 +1,17 @@
+SUMMARY = "This pytest plugin will allow the Salt Daemons to be used in tests."
+HOMEPAGE = "https://github.com/saltstack/pytest-salt"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5da5421b61b52c332140da3f2e10e40a"
+
+SRC_URI[md5sum] = "3d6e5d10f7c16abcfbc176b5dbb6ad36"
+SRC_URI[sha256sum] = "fcc29c9e8208eda8955367c11607e72467a68564d5afbcf632b1dd6ecfbe55a1"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} = " \
+    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-pytest-tempdir \
+    ${PYTHON_PN}-pytest-helpers-namespace \
+    ${PYTHON_PN}-psutil \
+    "
-- 
2.25.1



