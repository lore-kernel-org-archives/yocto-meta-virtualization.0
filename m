Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.11572.1593401888512823157
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 28 Jun 2020 20:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,293,1589212800"; 
   d="scan'208";a="95461998"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Jun 2020 11:38:00 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 1FF454CE4B13
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 29 Jun 2020 11:27:33 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 29 Jun 2020 11:38:02 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH] python3-ovsdbapp: Change python to python3
Date: Mon, 29 Jun 2020 11:37:49 +0800
Message-ID: <1593401871-17345-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593401871-17345-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1593401871-17345-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 1FF454CE4B13.A314F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

upgrade 0.4.1 -> 0.4.4

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...ovsdbapp_git.bb => python3-ovsdbapp_git.bb} | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-ovsdbapp_git.bb => python3-ovsdbapp_git.bb} (65%)

diff --git a/meta-openstack/recipes-devtools/python/python-ovsdbapp_git.bb b/meta-openstack/recipes-devtools/python/python3-ovsdbapp_git.bb
similarity index 65%
rename from meta-openstack/recipes-devtools/python/python-ovsdbapp_git.bb
rename to meta-openstack/recipes-devtools/python/python3-ovsdbapp_git.bb
index c464f2a..4c0510c 100644
--- a/meta-openstack/recipes-devtools/python/python-ovsdbapp_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-ovsdbapp_git.bb
@@ -7,26 +7,26 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 SRCNAME = "ovsdbapp"
 SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
 
-PV = "0.4.1+git${SRCPV}"
-SRCREV = "742754bce3c9453f8c7186455a92e4f6d6b18ace"
+PV = "0.4.4+git${SRCPV}"
+SRCREV = "40064ca2d99389f278028508a17f2e38d6df6f10"
 S = "${WORKDIR}/git"
 
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
 
 RDEPENDS_${PN} += " \
-        python-fixtures \
-        python-ovs \
-        python-pbr \
+        python3-fixtures \
+        python3-ovs \
+        python3-pbr \
         "
-- 
2.17.1



