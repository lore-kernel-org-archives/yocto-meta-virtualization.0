Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.10727.1594688612461457818
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Jul 2020 18:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DFF8FE01E7C; Mon, 13 Jul 2020 18:03:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	*  1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C07F2E01E79
	for <meta-virtualization@yoctoproject.org>; Mon, 13 Jul 2020 18:03:29 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,349,1589212800"; 
   d="scan'208";a="96284928"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Jul 2020 09:03:26 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 21EDB4CE3F17
	for <meta-virtualization@yoctoproject.org>; Tue, 14 Jul 2020 09:03:22 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 14 Jul 2020 09:03:21 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-oslo.config: Change python to python3
Date: Tue, 14 Jul 2020 21:03:20 +0800
Message-ID: <1594731800-3845-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 21EDB4CE3F17.A52BA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-oslo.config_git.bb          | 37 -------------------
 .../python/python3-oslo.config_8.2.0.bb       | 26 +++++++++++++
 2 files changed, 26 insertions(+), 37 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-oslo.config_8.2.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
deleted file mode 100644
index 6a0498c..0000000
--- a/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-DESCRIPTION = "API supporting parsing command line arguments and .ini style configuration files."
-HOMEPAGE = "https://pypi.python.org/pypi/oslo.config/4.11.1"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
-
-PV = "4.11.1+git${SRCPV}"
-SRCREV = "fb0738974824af6e1bc7d9fdf32a7c1d3ebf65fb"
-
-SRCNAME = "oslo.config"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools3 rmargparse
-
-DEPENDS += " \
-        python-pbr \
-        python-pip \
-        "
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-        python-pbr-native \
-        "
-
-RDEPENDS_${PN} += " \
-    python-pbr \
-    python-netaddr \
-    python-six \
-    python-stevedore \
-    python-debtcollector \
-    python-oslo.i18n \
-    python-rfc3986 \
-    python-pyyaml \
-    "
-	
diff --git a/meta-openstack/recipes-devtools/python/python3-oslo.config_8.2.0.bb b/meta-openstack/recipes-devtools/python/python3-oslo.config_8.2.0.bb
new file mode 100644
index 0000000..6898a1f
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-oslo.config_8.2.0.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "API supporting parsing command line arguments and .ini style configuration files."
+HOMEPAGE = "https://pypi.python.org/pypi/oslo.config/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
+
+SRC_URI[sha256sum] = "116ff3a7b98b0309b083af7906d99f8c6bea67df5ee03a85e2ac02700dd75d30"
+
+inherit setuptools3 pypi
+
+DEPENDS += " \
+        python3-pbr \
+        python3-pbr-native \
+        python3-pip \
+        "
+
+RDEPENDS_${PN} += " \
+    python3-requests \
+    python3-netaddr \
+    python3-stevedore \
+    python3-debtcollector \
+    python3-oslo.i18n \
+    python3-rfc3986 \
+    python3-pyyaml \
+    "
+	
-- 
2.17.1



