Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.53750.1594024663689797525
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2020 01:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8D4F8E01E08; Mon,  6 Jul 2020 01:37:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD007E01E08
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jul 2020 01:37:41 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,318,1589212800"; 
   d="scan'208";a="95816834"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jul 2020 16:36:31 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 389854CE5058
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jul 2020 16:36:31 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 6 Jul 2020 16:36:34 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-httplib2: Remove recipe
Date: Mon, 6 Jul 2020 16:36:25 +0800
Message-ID: <1594024588-6636-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594024588-6636-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1594024588-6636-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 389854CE5058.A0A7A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

This recipe already exists in meta-openembedded, the path is:
/meta-openembedded/meta-python/recipes-devtools/python/python3-httplib2_0.18.1.bb

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-httplib2.inc | 17 -----------------
 .../python/python3-httplib2_0.14.0.bb           |  2 --
 2 files changed, 19 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-httplib2.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-httplib2_0.14.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-httplib2.inc b/meta-openstack/recipes-devtools/python/python-httplib2.inc
deleted file mode 100644
index 35c8b1c..0000000
--- a/meta-openstack/recipes-devtools/python/python-httplib2.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "A comprehensive HTTP client library"
-HOMEPAGE = "https://code.google.com/p/httplib2/"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2d0e1e5a49b6ead3380e3ac544351eb9"
-
-SRC_URI[md5sum] = "427cda9f4d55762db325bd2eb46b7fe0"
-SRC_URI[sha256sum] = "34537dcdd5e0f2386d29e0e2c6d4a1703a3b982d34c198a5102e6e5d6194b107"
-
-inherit pypi
-
-do_install_append() {
-	perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt"`
-	for f in $perm_files; do
-		chmod 644 "${f}"
-	done
-}
diff --git a/meta-openstack/recipes-devtools/python/python3-httplib2_0.14.0.bb b/meta-openstack/recipes-devtools/python/python3-httplib2_0.14.0.bb
deleted file mode 100644
index 03be0bd..0000000
--- a/meta-openstack/recipes-devtools/python/python3-httplib2_0.14.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-httplib2.inc
-- 
2.17.1



