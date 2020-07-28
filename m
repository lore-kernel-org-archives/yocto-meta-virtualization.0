Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.2887.1595899216242890775
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jul 2020 18:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C03F8E01F22; Mon, 27 Jul 2020 18:20:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ADB14E01F22
	for <meta-virtualization@yoctoproject.org>; Mon, 27 Jul 2020 18:20:13 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,404,1589212800"; 
   d="scan'208";a="96962012"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jul 2020 09:20:12 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 399E74CE38CB
	for <meta-virtualization@yoctoproject.org>; Tue, 28 Jul 2020 09:20:10 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 28 Jul 2020 09:20:09 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-zake: upgrade 0.2.1 -> 0.2.2
Date: Tue, 28 Jul 2020 09:20:02 +0800
Message-ID: <1595899203-25666-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 399E74CE38CB.A470B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-zake_0.2.1.bb               | 21 -------------------
 .../python/python3-zake_0.2.2.bb              | 18 ++++++++++++++++
 2 files changed, 18 insertions(+), 21 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-zake_0.2.1.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-zake_0.2.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-zake_0.2.1.bb b/meta-openstack/recipes-devtools/python/python-zake_0.2.1.bb
deleted file mode 100644
index 68cb67b..0000000
--- a/meta-openstack/recipes-devtools/python/python-zake_0.2.1.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "A python package that works to provide a nice set of testing utilities for the kazoo library."
-HOMEPAGE = "https://github.com/yahoo/Zake"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=33573af7505a94ff3d122a7920b2c735"
-
-SRC_URI[md5sum] = "bd8db293a78c22171ecfdd54f4d65c63"
-SRC_URI[sha256sum] = "2e5bcb215e366e682fd05dd1df4f2e6affceefa5d3781c2987a21fd597659a21"
-
-inherit setuptools3 pypi
-
-# DEPENDS_default: python-pip
-
-DEPENDS += " \
-        python-pip \
-        "
-
-# RDEPENDS_default: 
-RDEPENDS_${PN} += " \
-        python-kazoo \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-zake_0.2.2.bb b/meta-openstack/recipes-devtools/python/python3-zake_0.2.2.bb
new file mode 100644
index 0000000..700bf85
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-zake_0.2.2.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "A python package that works to provide a nice set of testing utilities for the kazoo library."
+HOMEPAGE = "https://github.com/yahoo/Zake"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=14e79e6983dbd678bbe0ff17229d8fc1"
+
+SRC_URI[md5sum] = "076dcb58f5cb8b50f575fc0ca7e810b9"
+SRC_URI[sha256sum] = "5a50859931c4f666d318b74d1c407a6150dd5194e4c5812d071a5c7c7cefe4e6"
+
+inherit setuptools3 pypi
+
+DEPENDS += " \
+        python3-pip \
+        "
+
+RDEPENDS_${PN} += " \
+        python3-kazoo \
+        "
-- 
2.25.1



