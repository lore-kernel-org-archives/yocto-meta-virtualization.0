Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.12298.1601348355446876124
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Sep 2020 19:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id F1F6238C06C2
	for <meta-virtualization@yoctoproject.org>; Mon, 28 Sep 2020 19:59:14 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,316,1596470400"; 
   d="scan'208";a="99697878"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Sep 2020 10:59:14 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 3E0C148990CC
	for <meta-virtualization@yoctoproject.org>; Tue, 29 Sep 2020 10:59:11 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 29 Sep 2020 10:59:10 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-oslo.reports: Change to python3
Date: Tue, 29 Sep 2020 22:59:09 +0800
Message-ID: <1601391549-5177-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3E0C148990CC.A0EAA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python2 is no longer maintained, bb file is changed to python3 version.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...rts_git.bb => python3-oslo.reports_git.bb} | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-oslo.reports_git.bb => python3-oslo.reports_git.bb} (50%)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.reports_git.bb b/meta-openstack/recipes-devtools/python/python3-oslo.reports_git.bb
similarity index 50%
rename from meta-openstack/recipes-devtools/python/python-oslo.reports_git.bb
rename to meta-openstack/recipes-devtools/python/python3-oslo.reports_git.bb
index 7a6cdd7..a3377e6 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.reports_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-oslo.reports_git.bb
@@ -4,33 +4,33 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-PV = "1.22.0+git${SRCPV}"
-SRCREV = "a837f40bb0c31958d3ce99e2f9a6eb2fe651f4e6"
+PV = "2.2.0+git${SRCPV}"
+SRCREV = "bc631aedef131bc45225720e5c8f8e4ca35ff020"
 
 SRCNAME = "oslo.reports"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
 
 S = "${WORKDIR}/git"
 
 inherit setuptools3
 
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
-        python-six \
-        python-jinja2 \
-        python-psutil \
-        python-oslo.i18n \
-        python-oslo.utils \
-        python-oslo.serialization \
+        python3-pbr \
+        python3-six \
+        python3-jinja2 \
+        python3-psutil \
+        python3-oslo.i18n \
+        python3-oslo.utils \
+        python3-oslo.serialization \
         "
-- 
2.25.1



