Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.8910.1600420810065665313
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Sep 2020 02:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7B74E38C084A
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 02:20:09 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,274,1596470400"; 
   d="scan'208";a="99403713"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Sep 2020 17:20:08 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 2784448990EF
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 17:20:04 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Sep 2020 17:20:04 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-ipaddr: upgrade 2.1.11 -> 2.2.0
Date: Sat, 19 Sep 2020 05:20:06 +0800
Message-ID: <1600464006-31108-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2784448990EF.AE437
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Update PKG-INFO.

Because python2 is no longer maintained, bb file is changed to python3 version.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-ipaddr_2.1.11.bb            | 19 -------------------
 .../python/python3-ipaddr_2.2.0.bb            | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 19 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-ipaddr_2.1.11.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-ipaddr_2.2.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-ipaddr_2.1.11.bb b/meta-openstack/recipes-devtools/python/python-ipaddr_2.1.11.bb
deleted file mode 100644
index 989f715..0000000
--- a/meta-openstack/recipes-devtools/python/python-ipaddr_2.1.11.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Google's IP address manipulation library"
-HOMEPAGE = "http://code.google.com/p/ipaddr-py/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=d8b8c1199001505d7b77da5db34ba441"
-
-SRC_URI[md5sum] = "f2c7852f95862715f92e7d089dc3f2cf"
-SRC_URI[sha256sum] = "1b555b8a8800134fdafe32b7d0cb52f5bdbfdd093707c3dd484c5ea59f1d98b7"
-
-inherit distutils3 pypi
-
-DEPENDS += " \
-        python-pip \
-        python-pbr \
-        "
-
-RDEPENDS_${PN} += " \
-        python-pbr \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-ipaddr_2.2.0.bb b/meta-openstack/recipes-devtools/python/python3-ipaddr_2.2.0.bb
new file mode 100644
index 0000000..008ae39
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-ipaddr_2.2.0.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Google's IP address manipulation library"
+HOMEPAGE = "http://code.google.com/p/ipaddr-py/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e7e54827196088e6e96b33e9aec35c4a"
+
+SRC_URI[md5sum] = "f88353e40dec06410acfa075b8209b27"
+SRC_URI[sha256sum] = "4092dfe667588d16aa12b59acb7c8a4024e5dcb23a681cd0b0b602373eca88d6"
+
+inherit distutils3 pypi
+
+DEPENDS += " \
+        python3-pip \
+        python3-pbr \
+        "
+
+RDEPENDS_${PN} += " \
+        python3-pbr \
+        "
-- 
2.25.1



