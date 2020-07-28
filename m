Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.2320.1595897094431810982
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jul 2020 17:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,404,1589212800"; 
   d="scan'208";a="96959704"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jul 2020 08:44:51 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 6101E4CE506F
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2020 08:44:48 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 28 Jul 2020 08:44:47 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [PATCH 1/3] [meta-virtualization][PATCH] python3-keystoneclient: Change python to python3
Date: Tue, 28 Jul 2020 08:44:55 +0800
Message-ID: <1595897097-20455-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 6101E4CE506F.A6383
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Version updated to 3.13.1

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../keystone-api-check.sh                     |  0
 ...t_git.bb => python3-keystoneclient_git.bb} | 40 ++++++++++---------
 2 files changed, 21 insertions(+), 19 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-keystoneclient => python3-keystoneclient}/keystone-api-check.sh (100%)
 rename meta-openstack/recipes-devtools/python/{python-keystoneclient_git.bb => python3-keystoneclient_git.bb} (59%)

diff --git a/meta-openstack/recipes-devtools/python/python-keystoneclient/keystone-api-check.sh b/meta-openstack/recipes-devtools/python/python3-keystoneclient/keystone-api-check.sh
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python-keystoneclient/keystone-api-check.sh
rename to meta-openstack/recipes-devtools/python/python3-keystoneclient/keystone-api-check.sh
diff --git a/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb b/meta-openstack/recipes-devtools/python/python3-keystoneclient_git.bb
similarity index 59%
rename from meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
rename to meta-openstack/recipes-devtools/python/python3-keystoneclient_git.bb
index c7bfef4..c8fe38a 100644
--- a/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-keystoneclient_git.bb
@@ -6,12 +6,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4a4d0e932ffae1c0131528d30d419c55"
 
 SRCNAME = "keystoneclient"
 
+SRC_URI = "file://keystone-api-check.sh"
+
 SRC_URI = "\
-	git://github.com/openstack/python-keystoneclient.git;branch=stable/pike \
-	file://keystone-api-check.sh \
-	"
+        git://github.com/openstack/python-keystoneclient.git;branch=stable/pike \
+        file://keystone-api-check.sh \
+        "
 
-PV = "3.13.0+git${SRCPV}"
+PV = "4.1.0+git${SRCPV}"
 SRCREV = "7ff05baa1fa56f152173651f16fc6fd181291292"
 S = "${WORKDIR}/git"
 
@@ -20,28 +22,28 @@ inherit setuptools3 monitor
 FILES_${PN}-doc += "${datadir}/keystoneclient" 
 
 DEPENDS += " \
-        python-pip \
-        python-pbr \
+        python3-pip \
+        python3-pbr \
         "
 
 # Satisfy setup.py 'setup_requires'
 DEPENDS += " \
-        python-pbr-native \
+        python3-pbr-native \
         "
 
 RDEPENDS_${PN} += " \
         bash \
-        python-pbr \
-        python-debtcollector \
-        python-keystoneauth1 \
-        python-oslo.config \
-        python-oslo.i18n \
-        python-oslo.serialization \
-        python-oslo.utils \
-        python-positional \
-        python-requests \
-        python-six \
-        python-stevedore \
+        python3-pbr \
+        python3-debtcollector \
+        python3-keystoneauth1 \
+        python3-oslo.config \
+        python3-oslo.i18n \
+        python3-oslo.serialization \
+        python3-oslo.utils \
+        python3-positional \
+        python3-requests \
+        python3-six \
+        python3-stevedore \
         "
 
 do_install_append() {
@@ -53,7 +55,7 @@ PACKAGES =+ " ${SRCNAME}-tests"
 FILES_${SRCNAME}-tests = "${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/examples \
         "
 RDEPENDS_${SRCNAME}-tests += " \
-	python-httpretty \
+	python3-httpretty \
         bash \
 	"
 
-- 
2.17.1



