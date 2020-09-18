Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.8937.1600420794001065909
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Sep 2020 02:19:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id DF48B38C084A
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 02:19:52 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,274,1596470400"; 
   d="scan'208";a="99403693"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Sep 2020 17:19:51 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 7761048990C4
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 17:19:50 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Sep 2020 17:19:50 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-i18n: upgrade 0.3.1 -> 0.3.9
Date: Sat, 19 Sep 2020 05:19:53 +0800
Message-ID: <1600463993-31018-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7761048990C4.AE589
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Update README.md.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-i18n_0.3.1.bb         | 2 --
 .../python/{python-i18n.inc => python3-i18n_0.3.9.bb}     | 8 ++++----
 2 files changed, 4 insertions(+), 6 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-i18n_0.3.1.bb
 rename meta-openstack/recipes-devtools/python/{python-i18n.inc => python3-i18n_0.3.9.bb} (58%)

diff --git a/meta-openstack/recipes-devtools/python/python3-i18n_0.3.1.bb b/meta-openstack/recipes-devtools/python/python3-i18n_0.3.1.bb
deleted file mode 100644
index 8e98d13..0000000
--- a/meta-openstack/recipes-devtools/python/python3-i18n_0.3.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-i18n.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python-i18n.inc b/meta-openstack/recipes-devtools/python/python3-i18n_0.3.9.bb
similarity index 58%
rename from meta-openstack/recipes-devtools/python/python-i18n.inc
rename to meta-openstack/recipes-devtools/python/python3-i18n_0.3.9.bb
index 74200e7..92a5aa3 100644
--- a/meta-openstack/recipes-devtools/python/python-i18n.inc
+++ b/meta-openstack/recipes-devtools/python/python3-i18n_0.3.9.bb
@@ -2,14 +2,14 @@ DESCRIPTION = "Translation library for Python"
 HOMEPAGE = "https://github.com/tuvistavie/python-i18n"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README.md;md5=7624ac071dec291ca8ef74e62e536a7a"
+LIC_FILES_CHKSUM = "file://README.md;md5=57cb947993e30ec5ab6df3f12d04ebad"
 
 PYPI_PACKAGE = "python-i18n"
 
-SRC_URI[md5sum] = "08b8c247add9f90806c4742a685fdb88"
-SRC_URI[sha256sum] = "e1d832ff7d1d39ce593793cc709b2344aa8fdf321cf707081335f146160d9f20"
+SRC_URI[md5sum] = "581de49007179e536c4c47982a651cea"
+SRC_URI[sha256sum] = "df97f3d2364bf3a7ebfbd6cbefe8e45483468e52a9e30b909c6078f5f471e4e8"
 
-inherit pypi
+inherit setuptools3 pypi
 
 # DEPENDS_default: python-pip
 
-- 
2.25.1



