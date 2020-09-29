Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.12131.1601348308626170732
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Sep 2020 19:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2DB4C38C0857
	for <meta-virtualization@yoctoproject.org>; Mon, 28 Sep 2020 19:58:28 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,316,1596470400"; 
   d="scan'208";a="99697807"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Sep 2020 10:58:25 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 8C9E948990E8
	for <meta-virtualization@yoctoproject.org>; Tue, 29 Sep 2020 10:58:21 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 29 Sep 2020 10:58:20 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-oslo.cache: change to python3
Date: Tue, 29 Sep 2020 22:58:19 +0800
Message-ID: <1601391499-4953-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8C9E948990E8.A0F93
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python2 is no longer maintained, bb file is changed to python3 version.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...cache_git.bb => python3-oslo.cache_git.bb} | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-oslo.cache_git.bb => python3-oslo.cache_git.bb} (54%)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.cache_git.bb b/meta-openstack/recipes-devtools/python/python3-oslo.cache_git.bb
similarity index 54%
rename from meta-openstack/recipes-devtools/python/python-oslo.cache_git.bb
rename to meta-openstack/recipes-devtools/python/python3-oslo.cache_git.bb
index f109b8a..604abca 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.cache_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-oslo.cache_git.bb
@@ -4,11 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-PV = "1.14.0+git${SRCPV}"
-SRCREV = "f5b6ddf7d18a7e06e19712ca7a2509d658a08c4d"
+PV = "2.6.1+git${SRCPV}"
+SRCREV = "df075b2465195de53e42897e7d9be6c6c375ce5e"
 
 SRCNAME = "oslo.cache"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
 
 S = "${WORKDIR}/git"
 
@@ -17,21 +17,21 @@ inherit setuptools3
 # DEPENDS_default: python-pip
 
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
-        python-dogpile.cache \
-        python-six \
-        python-oslo.config \
-        python-oslo.i18n \
-        python-oslo.log \
-        python-oslo.utils \
+        python3-dogpile.cache \
+        python3-six \
+        python3-oslo.config \
+        python3-oslo.i18n \
+        python3-oslo.log \
+        python3-oslo.utils \
         "
-- 
2.25.1



