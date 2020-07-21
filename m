Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.13364.1595311276001528358
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2020 23:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,377,1589212800"; 
   d="scan'208";a="96683341"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Jul 2020 14:01:14 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id E81814CE4B09
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jul 2020 14:01:13 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Jul 2020 14:01:13 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][PATCH 2/6] python3-oslo.concurrency: Change python to python3
Date: Tue, 21 Jul 2020 14:01:24 +0800
Message-ID: <1595311284-1985-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: E81814CE4B09.A26BE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Version updated to 3.21.2

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...git.bb => python3-oslo.concurrency_git.bb} | 25 +++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-oslo.concurrency_git.bb => python3-oslo.concurrency_git.bb} (57%)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.concurrency_git.bb b/meta-openstack/recipes-devtools/python/python3-oslo.concurrency_git.bb
similarity index 57%
rename from meta-openstack/recipes-devtools/python/python-oslo.concurrency_git.bb
rename to meta-openstack/recipes-devtools/python/python3-oslo.concurrency_git.bb
index 567606c..8b2043b 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.concurrency_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-oslo.concurrency_git.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-PV = "3.21.1+git${SRCPV}"
-SRCREV = "8adf9b1f0d69dca7372b967ef4f894487f1a9d64"
+PV = "3.21.2+git${SRCPV}"
+SRCREV = "1b25351d1c63e573068fff3d16faca440bbdcabf"
 
 SRCNAME = "oslo.concurrency"
 SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
@@ -14,25 +14,24 @@ S = "${WORKDIR}/git"
 
 inherit setuptools3
 
-# DEPENDS_default: python-pip
+# DEPENDS_default: python3-pip
 
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
 
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
-        python-pbr \
-        python-fasteners \
-        python-oslo.config \
-        python-oslo.i18n \
-        python-oslo.utils \
-        python-six \
-        python-enum34 \
+        python3-pbr \
+        python3-fasteners \
+        python3-oslo.config \
+        python3-oslo.i18n \
+        python3-oslo.utils \
+        python3-six \
         "
-- 
2.17.1



