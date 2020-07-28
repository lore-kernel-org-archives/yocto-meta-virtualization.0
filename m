Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.2320.1595897094431810982
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jul 2020 17:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,404,1589212800"; 
   d="scan'208";a="96959703"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jul 2020 08:44:50 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id DC28B4CE5450
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2020 08:44:49 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 28 Jul 2020 08:44:48 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [PATCH 2/3] [meta-virtualization][PATCH] python3-pycadf: Change python to python3
Date: Tue, 28 Jul 2020 08:44:56 +0800
Message-ID: <1595897097-20455-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595897097-20455-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1595897097-20455-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: DC28B4CE5450.A6201
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Version updated to 3.1.0

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...on-pycadf_git.bb => python3-pycadf_git.bb} | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-pycadf_git.bb => python3-pycadf_git.bb} (59%)

diff --git a/meta-openstack/recipes-devtools/python/python-pycadf_git.bb b/meta-openstack/recipes-devtools/python/python3-pycadf_git.bb
similarity index 59%
rename from meta-openstack/recipes-devtools/python/python-pycadf_git.bb
rename to meta-openstack/recipes-devtools/python/python3-pycadf_git.bb
index 03a105d..6e864e8 100644
--- a/meta-openstack/recipes-devtools/python/python-pycadf_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-pycadf_git.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
 
-PV = "2.10.0+git${SRCPV}"
-SRCREV = "d113c1564d49d93451d9330955e8a42b7db04149"
+PV = "3.1.0+git${SRCPV}"
+SRCREV = "2402013a8719873d65136fc283e1855166adbc26"
 
 SRCNAME = "pycadf"
 SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
@@ -17,21 +17,21 @@ inherit setuptools3
 FILES_${PN} += "${datadir}/etc/${SRCNAME}/*"
 
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
-      python-babel \
-      python-iso8601 \
-      python-netaddr \
-      python-posix-ipc \
-      python-pytz \
-      python-six \
-      python-webob \
-      python-pbr \
+      python3-babel \
+      python3-iso8601 \
+      python3-netaddr \
+      python3-posix-ipc \
+      python3-pytz \
+      python3-six \
+      python3-webob \
+      python3-pbr \
         "
-- 
2.17.1



