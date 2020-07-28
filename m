Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.3166.1595900164835836487
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jul 2020 18:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B1C70E01F26; Mon, 27 Jul 2020 18:36:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D59F3E01F22
	for <meta-virtualization@yoctoproject.org>; Mon, 27 Jul 2020 18:36:03 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,404,1589212800"; 
   d="scan'208";a="96962943"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jul 2020 09:36:02 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 8B0094CE506E
	for <meta-virtualization@yoctoproject.org>; Tue, 28 Jul 2020 09:36:02 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 28 Jul 2020 09:36:03 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-xattr: upgrade 0.6.4 -> 0.9.7
Date: Tue, 28 Jul 2020 09:35:59 +0800
Message-ID: <1595900159-54788-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 8B0094CE506E.A6746
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
---
 .../python/python-xattr_0.6.4.bb               | 10 ----------
 .../python/python3-xattr_0.9.7.bb              | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 10 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xattr_0.6.4.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-xattr_0.9.7.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xattr_0.6.4.bb b/meta-openstack/recipes-devtools/python/python-xattr_0.6.4.bb
deleted file mode 100644
index d349a48..0000000
--- a/meta-openstack/recipes-devtools/python/python-xattr_0.6.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "Python wrapper for extended filesystem attributes"
-HOMEPAGE = "http://github.com/xattr/xattr"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ebb582f22ddff5dcb0bc33d04f7cbb8"
-
-SRC_URI[md5sum] = "1bef31afb7038800f8d5cfa2f4562b37"
-SRC_URI[sha256sum] = "f9dcebc99555634b697fa3dad8ea3047deb389c6f1928d347a0c49277a5c0e9e"
-
-inherit setuptools3 pypi
\ No newline at end of file
diff --git a/meta-openstack/recipes-devtools/python/python3-xattr_0.9.7.bb b/meta-openstack/recipes-devtools/python/python3-xattr_0.9.7.bb
new file mode 100644
index 0000000..ea31fc1
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-xattr_0.9.7.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Python wrapper for extended filesystem attributes"
+HOMEPAGE = "http://github.com/xattr/xattr"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ebb582f22ddff5dcb0bc33d04f7cbb8"
+
+SRC_URI[md5sum] = "3b9a928bc76c14eeeaccbc3c152c4920"
+SRC_URI[sha256sum] = "b0bbca828e04ef2d484a6522ae7b3a7ccad5e43fa1c6f54d78e24bb870f49d44"
+
+inherit setuptools3 pypi
+
+DEPENDS += " \
+	python3-cffi-native \
+"
+
+RDEPENDS_${PN} += " \
+	python3-cffi \
+"
-- 
2.25.1



