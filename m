Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.4677.1598928432443774040
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Aug 2020 19:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4EDF0E020F0; Mon, 31 Aug 2020 19:47:12 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7D2FE020EE
	for <meta-virtualization@yoctoproject.org>; Mon, 31 Aug 2020 19:47:08 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,377,1592841600"; 
   d="scan'208";a="98755792"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Sep 2020 10:47:07 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 175C748990DA
	for <meta-virtualization@yoctoproject.org>; Tue,  1 Sep 2020 10:47:02 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 1 Sep 2020 10:47:00 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-dogpile.cache: upgrade 0.9.0 -> 1.0.2
Date: Tue, 1 Sep 2020 10:47:00 +0800
Message-ID: <1598928420-124391-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 175C748990DA.A7E44
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.
-License-Update: Copyright year updated to 2020.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-dogpile.cache.inc                | 12 ------------
 .../python/python3-dogpile.cache_0.9.0.bb          |  4 ----
 .../python/python3-dogpile.cache_1.0.2.bb          | 14 ++++++++++++++
 3 files changed, 14 insertions(+), 16 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-dogpile.cache.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.9.0.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.0.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc b/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc
deleted file mode 100644
index 5074acf..0000000
--- a/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Python Dogpile Cache: A caching front-end based on the Dogpile lock"
-HOMEPAGE = "https://pypi.python.org/pypi/dogpile.cache"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e8d5890806254a2648269bb4029f74c6"
-
-SRC_URI[md5sum] = "d48b4752b404e2e2a33f984d261fff7d"
-SRC_URI[sha256sum] = "b348835825c9dcd251d9aad1f89f257277ac198a3e35a61980ab4cb28c75216b"
-
-inherit pypi
-
-
diff --git a/meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.9.0.bb b/meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.9.0.bb
deleted file mode 100644
index ccfb292..0000000
--- a/meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.9.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools3
-require python-dogpile.cache.inc
-
-
diff --git a/meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.0.2.bb b/meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.0.2.bb
new file mode 100644
index 0000000..82057a6
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.0.2.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Python Dogpile Cache: A caching front-end based on the Dogpile lock"
+HOMEPAGE = "https://pypi.python.org/pypi/dogpile.cache"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=46e560ef3e93a33b284504845ea6a11d"
+
+SRC_URI[md5sum] = "a325ec142d690269573a872e24fc1cb6"
+SRC_URI[sha256sum] = "64fda39d25b46486a4876417ca03a4af06f35bfadba9f59613f9b3d748aa21ef"
+
+inherit setuptools3 pypi
+
+RDEPENDS_${PN} += "python3-decorator"
+
+
-- 
2.25.1



