Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.9008.1600420890351842620
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Sep 2020 02:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id C3AED38C084A
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 02:21:29 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,274,1596470400"; 
   d="scan'208";a="99403830"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Sep 2020 17:21:28 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 7AA3E48990CB
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 17:21:25 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Sep 2020 17:21:25 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-xstatic-hogan: upgrade 2.0.0.2 -> 2.0.0.3
Date: Sat, 19 Sep 2020 05:21:28 +0800
Message-ID: <1600464088-31520-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7AA3E48990CB.A2635
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Update PKG-INFO.
Consolidate inc and bb files into a single bb file.
Since python2 is no longer maintained, the recipe of python2 is removed.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-xstatic-hogan_2.0.0.2.bb                | 2 --
 .../python/python3-xstatic-hogan_2.0.0.2.bb               | 2 --
 ...xstatic-hogan.inc => python3-xstatic-hogan_2.0.0.3.bb} | 8 ++++----
 3 files changed, 4 insertions(+), 8 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-hogan_2.0.0.2.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-xstatic-hogan_2.0.0.2.bb
 rename meta-openstack/recipes-devtools/python/{python-xstatic-hogan.inc => python3-xstatic-hogan_2.0.0.3.bb} (58%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-hogan_2.0.0.2.bb b/meta-openstack/recipes-devtools/python/python-xstatic-hogan_2.0.0.2.bb
deleted file mode 100644
index bdd3c27..0000000
--- a/meta-openstack/recipes-devtools/python/python-xstatic-hogan_2.0.0.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-xstatic-hogan.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-hogan_2.0.0.2.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-hogan_2.0.0.2.bb
deleted file mode 100644
index bdd3c27..0000000
--- a/meta-openstack/recipes-devtools/python/python3-xstatic-hogan_2.0.0.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-xstatic-hogan.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-hogan.inc b/meta-openstack/recipes-devtools/python/python3-xstatic-hogan_2.0.0.3.bb
similarity index 58%
rename from meta-openstack/recipes-devtools/python/python-xstatic-hogan.inc
rename to meta-openstack/recipes-devtools/python/python3-xstatic-hogan_2.0.0.3.bb
index deeeae1..14f6a3d 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-hogan.inc
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-hogan_2.0.0.3.bb
@@ -2,14 +2,14 @@ DESCRIPTION = "Hogan JavaScript library packaged for setuptools"
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Hogan"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=18dc983faa3113478ed59ae157a985d5"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e5366bec2bd8e901c248ef0df2425a7f"
 
 PYPI_PACKAGE = "XStatic-Hogan"
 
-SRC_URI[md5sum] = "1c1de09c4813e8568aab98fa5270d6a0"
-SRC_URI[sha256sum] = "5941bc7fb2a09916b8837848e6fc2a13b2dfc271811e9b522c61e1337d5fc2bd"
+SRC_URI[md5sum] = "b9b7610ba5c16e9ba398efb83d26a656"
+SRC_URI[sha256sum] = "27a921963e470abbada15b2d85d198833795aaead5fd73339bc2883cfddb5619"
 
-inherit pypi
+inherit setuptools3 pypi
 
 # DEPENDS_default: python-pip
 
-- 
2.25.1



