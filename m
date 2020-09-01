Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.5145.1598930660035660250
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Aug 2020 20:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 99F1FE020F0; Mon, 31 Aug 2020 20:24:19 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 222D6E020EE
	for <meta-virtualization@yoctoproject.org>; Mon, 31 Aug 2020 20:24:09 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,377,1592841600"; 
   d="scan'208";a="98757272"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Sep 2020 11:24:07 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 3DFDC48990D9
	for <meta-virtualization@yoctoproject.org>; Tue,  1 Sep 2020 11:24:07 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 1 Sep 2020 11:24:06 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH 2/2] python3-cursive: Change to python3
Date: Tue, 1 Sep 2020 11:23:58 +0800
Message-ID: <1598930638-79311-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3DFDC48990D9.A5FF3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

Because python2 is no longer maintained, bb file is changed to python3
version.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-cursive_git.bb              | 37 -------------------
 .../python/python3-cursive_0.2.2.bb           | 31 ++++++++++++++++
 2 files changed, 31 insertions(+), 37 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-cursive_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-cursive_0.2.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-cursive_git.bb b/meta-openstack/recipes-devtools/python/python-cursive_git.bb
deleted file mode 100644
index ce82998..0000000
--- a/meta-openstack/recipes-devtools/python/python-cursive_git.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-DESCRIPTION = "Library for validation of digital signatures."
-HOMEPAGE = "https://github.com/openstack/cursive"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
-
-SRC_URI = "\
-	git://git.openstack.org/openstack/cursive.git;branch=master \
-	"
-
-PV="0.2.0+git${SRCPV}"
-SRCREV="ad25a4016c56eeceb85764c7ac4501def2b5445a"
-S = "${WORKDIR}/git"
-
-inherit setuptools3
-
-DEPENDS += " \
-        python-pbr \
-        "
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-        python-pbr-native \
-        "
-
-RDEPENDS_${PN} += " \
-        python-pbr \
-        python-lxml \
-        python-cryptography \
-        python-netifaces \
-        python-six \
-        python-oslo.serialization \
-        python-oslo.utils \
-        python-oslo.i18n \
-        python-oslo.log \
-        python-castellan \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-cursive_0.2.2.bb b/meta-openstack/recipes-devtools/python/python3-cursive_0.2.2.bb
new file mode 100644
index 0000000..770acdc
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-cursive_0.2.2.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Library for validation of digital signatures."
+HOMEPAGE = "https://github.com/openstack/cursive"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+inherit setuptools3 pypi
+
+SRC_URI[sha256sum] = "fbdc2b088bf0b9a69b1897d726e6027e8fba8f21f0a881344f70e7a407d9abda"
+
+DEPENDS += " \
+        python3-pbr \
+        "
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python3-pbr-native \
+        "
+
+RDEPENDS_${PN} += " \
+        python3-pbr \
+        python3-lxml \
+        python3-cryptography \
+        python3-netifaces \
+        python3-six \
+        python3-oslo.serialization \
+        python3-oslo.utils \
+        python3-oslo.i18n \
+        python3-oslo.log \
+        python3-castellan \
+        "
-- 
2.25.1



