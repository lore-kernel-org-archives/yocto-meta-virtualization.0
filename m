Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.8960.1600420916287373824
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Sep 2020 02:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id B92DA38C084A
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 02:21:55 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,274,1596470400"; 
   d="scan'208";a="99403869"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Sep 2020 17:21:53 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 589EA48990CB
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 17:21:51 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Sep 2020 17:21:51 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-heat-cfntools: upgrade 1.2.8 -> 1.4.2
Date: Sat, 19 Sep 2020 05:21:54 +0800
Message-ID: <1600464114-31678-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 589EA48990CB.A0681
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python2 is no longer maintained, bb file is changed to python3 version.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...fntools_1.2.8.bb => python3-heat-cfntools_1.4.2.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-heat-cfntools_1.2.8.bb => python3-heat-cfntools_1.4.2.bb} (65%)

diff --git a/meta-openstack/recipes-devtools/python/python-heat-cfntools_1.2.8.bb b/meta-openstack/recipes-devtools/python/python3-heat-cfntools_1.4.2.bb
similarity index 65%
rename from meta-openstack/recipes-devtools/python/python-heat-cfntools_1.2.8.bb
rename to meta-openstack/recipes-devtools/python/python3-heat-cfntools_1.4.2.bb
index 1160594..8439daa 100644
--- a/meta-openstack/recipes-devtools/python/python-heat-cfntools_1.2.8.bb
+++ b/meta-openstack/recipes-devtools/python/python3-heat-cfntools_1.4.2.bb
@@ -4,20 +4,20 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI[md5sum] = "0d5f8e7685e7f9a34dbd2552ffa40984"
-SRC_URI[sha256sum] = "de7d93338d3afb71cc4c53d713740316ead0af3a9c869b1231617347e94a8326"
+SRC_URI[md5sum] = "395e95fecdfa47a89e260998fd5e50b4"
+SRC_URI[sha256sum] = "8608e11c2cfdd198bbead763a1a73008a17111c67e44a7e299922f4d5da8ca33"
 
 inherit setuptools3 pypi
 
 DEPENDS += "\
-    python-pbr \
+    python3-pbr \
     "
 
 # Satisfy setup.py 'setup_requires'
 DEPENDS += " \
-        python-pbr-native \
+        python3-pbr-native \
         "
 
 RDPENDS_${PN} += "\
-    python-pbr \
+    python3-pbr \
     "
-- 
2.25.1



