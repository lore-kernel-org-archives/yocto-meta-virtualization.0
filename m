Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.8996.1600420843007224975
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Sep 2020 02:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 9C18338C084A
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 02:20:40 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,274,1596470400"; 
   d="scan'208";a="99403758"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Sep 2020 17:20:39 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id D4CA548990C4
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 17:20:35 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Sep 2020 17:20:36 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-jsonpath-rw-ext: Change to python3
Date: Sat, 19 Sep 2020 05:20:38 +0800
Message-ID: <1600464038-31262-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: D4CA548990C4.A0FEF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python2 is no longer maintained, bb file is changed to python3 version.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...it.bb => python3-jsonpath-rw-ext_1.2.2.bb} | 22 ++++++++-----------
 1 file changed, 9 insertions(+), 13 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-jsonpath-rw-ext_git.bb => python3-jsonpath-rw-ext_1.2.2.bb} (51%)

diff --git a/meta-openstack/recipes-devtools/python/python-jsonpath-rw-ext_git.bb b/meta-openstack/recipes-devtools/python/python3-jsonpath-rw-ext_1.2.2.bb
similarity index 51%
rename from meta-openstack/recipes-devtools/python/python-jsonpath-rw-ext_git.bb
rename to meta-openstack/recipes-devtools/python/python3-jsonpath-rw-ext_1.2.2.bb
index c6416f9..a4517a6 100644
--- a/meta-openstack/recipes-devtools/python/python-jsonpath-rw-ext_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-jsonpath-rw-ext_1.2.2.bb
@@ -3,30 +3,26 @@ HOMEPAGE = "https://github.com/sileht/python-jsonpath-rw-ext"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 
-PV = "0.1.9+git${SRCPV}"
-SRCREV = "0a2d032f9743f5c9dd0f29be20a22b3f3388a93d"
-
-SRCNAME = "jsonpath-rw-ext"
-
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
-SRC_URI = "git://github.com/sileht/${BPN}.git"
 
-S = "${WORKDIR}/git"
+SRC_URI[sha256sum] = "a9e44e803b6d87d135b09d1e5af0db4d4cf97ba62711a80aa51c8c721980a994"
 
-inherit setuptools3
+inherit pypi setuptools3
 
 DEPENDS += " \
-	python-pbr \
+	python3-pbr \
 	"
 
 # Satisfy setup.py 'setup_requires'
 DEPENDS += " \
-        python-pbr-native \
+        python3-pbr-native \
         "
 
 RDEPENDS_${PN} += " \
-        python-pbr \
-        python-babel \
-        python-jsonpath-rw \
+        python3-pbr \
+        python3-babel \
+        python3-jsonpath-rw \
+        python3-six \
+        python3-ply \
 	"
 
-- 
2.25.1



