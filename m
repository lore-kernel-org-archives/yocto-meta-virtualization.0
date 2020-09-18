Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.8919.1600420828993322165
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Sep 2020 02:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6767638C084A
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 02:20:28 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,274,1596470400"; 
   d="scan'208";a="99403736"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Sep 2020 17:20:27 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id D316149B1116
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 17:20:26 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Sep 2020 17:20:26 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-jsonpath-rw: Consolidate in a single file
Date: Sat, 19 Sep 2020 05:20:29 +0800
Message-ID: <1600464029-31205-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: D316149B1116.AE604
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.
Since python2 is no longer maintained, the recipe of python2 is removed.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-jsonpath-rw.inc   | 10 ----------
 .../python/python-jsonpath-rw_1.4.0.bb               |  2 --
 .../python/python3-jsonpath-rw_1.4.0.bb              | 12 ++++++++++--
 3 files changed, 10 insertions(+), 14 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-jsonpath-rw.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-jsonpath-rw_1.4.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-jsonpath-rw.inc b/meta-openstack/recipes-devtools/python/python-jsonpath-rw.inc
deleted file mode 100644
index dc2bad2..0000000
--- a/meta-openstack/recipes-devtools/python/python-jsonpath-rw.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "A robust and significantly extended implementation of JSONPath for Python"
-HOMEPAGE = "https://github.com/kennknowles/python-jsonpath-rw"
-SECTION = "devel/python"
-LICENSE = "BSD+"
-LIC_FILES_CHKSUM = "file://README.rst;md5=02384665f821c394981e0dd1faec9a7d"
-
-SRC_URI[md5sum] = "3a807e05c2c12158fc6bb0a402fd5778"
-SRC_URI[sha256sum] = "05c471281c45ae113f6103d1268ec7a4831a2e96aa80de45edc89b11fac4fbec"
-
-inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python-jsonpath-rw_1.4.0.bb b/meta-openstack/recipes-devtools/python/python-jsonpath-rw_1.4.0.bb
deleted file mode 100644
index c320f01..0000000
--- a/meta-openstack/recipes-devtools/python/python-jsonpath-rw_1.4.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-jsonpath-rw.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb b/meta-openstack/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
index c320f01..77366f3 100644
--- a/meta-openstack/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
@@ -1,2 +1,10 @@
-require python-jsonpath-rw.inc
-inherit setuptools3
+DESCRIPTION = "A robust and significantly extended implementation of JSONPath for Python"
+HOMEPAGE = "https://github.com/kennknowles/python-jsonpath-rw"
+SECTION = "devel/python"
+LICENSE = "BSD+"
+LIC_FILES_CHKSUM = "file://README.rst;md5=02384665f821c394981e0dd1faec9a7d"
+
+SRC_URI[md5sum] = "3a807e05c2c12158fc6bb0a402fd5778"
+SRC_URI[sha256sum] = "05c471281c45ae113f6103d1268ec7a4831a2e96aa80de45edc89b11fac4fbec"
+
+inherit setuptools3 pypi
-- 
2.25.1



