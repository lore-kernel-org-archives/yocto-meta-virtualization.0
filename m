Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.4690.1598928485863048681
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Aug 2020 19:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B18C3E020F0; Mon, 31 Aug 2020 19:48:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5DE09E020EE
	for <meta-virtualization@yoctoproject.org>; Mon, 31 Aug 2020 19:48:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,377,1592841600"; 
   d="scan'208";a="98755835"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Sep 2020 10:48:03 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 7AE2F48990DA
	for <meta-virtualization@yoctoproject.org>; Tue,  1 Sep 2020 10:48:03 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 1 Sep 2020 10:47:59 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-enum-compat: Remove python2 recipe
Date: Tue, 1 Sep 2020 10:47:59 +0800
Message-ID: <1598928479-124512-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 7AE2F48990DA.AA9D5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Since python2 is no longer maintained, the recipe of python2 is removed.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-enum-compat.inc   | 10 ----------
 .../python/python-enum-compat_0.0.3.bb               |  2 --
 .../python/python3-enum-compat_0.0.3.bb              | 12 ++++++++++--
 3 files changed, 10 insertions(+), 14 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-enum-compat.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-enum-compat_0.0.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-enum-compat.inc b/meta-openstack/recipes-devtools/python/python-enum-compat.inc
deleted file mode 100644
index 9fa8c52..0000000
--- a/meta-openstack/recipes-devtools/python/python-enum-compat.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "Python enum/enum34 compatibility package"
-HOMEPAGE = "https://github.com/jstasiak/enum-compat"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-
-SRC_URI[md5sum] = "74c19a80356825e5351aba8c4c1b00e6"
-SRC_URI[sha256sum] = "3677daabed56a6f724451d585662253d8fb4e5569845aafa8bb0da36b1a8751e"
-
-inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python-enum-compat_0.0.3.bb b/meta-openstack/recipes-devtools/python/python-enum-compat_0.0.3.bb
deleted file mode 100644
index a9bff30..0000000
--- a/meta-openstack/recipes-devtools/python/python-enum-compat_0.0.3.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-enum-compat.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.3.bb b/meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.3.bb
index a9bff30..a1c0ef6 100644
--- a/meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.3.bb
+++ b/meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.3.bb
@@ -1,2 +1,10 @@
-inherit setuptools3
-require python-enum-compat.inc
+DESCRIPTION = "Python enum/enum34 compatibility package"
+HOMEPAGE = "https://github.com/jstasiak/enum-compat"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI[md5sum] = "74c19a80356825e5351aba8c4c1b00e6"
+SRC_URI[sha256sum] = "3677daabed56a6f724451d585662253d8fb4e5569845aafa8bb0da36b1a8751e"
+
+inherit setuptools3 pypi
-- 
2.25.1



