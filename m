Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.9369.1603775044520832606
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 22:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0B8B138C1176
	for <meta-virtualization@yoctoproject.org>; Mon, 26 Oct 2020 22:04:03 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,422,1596470400"; 
   d="scan'208";a="100541488"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Oct 2020 13:04:01 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id AABB64CE1506
	for <meta-virtualization@yoctoproject.org>; Tue, 27 Oct 2020 13:03:59 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 27 Oct 2020 13:03:58 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-rsa: Remove recipe
Date: Tue, 27 Oct 2020 13:03:53 +0800
Message-ID: <1603775033-49249-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: AABB64CE1506.A2C26
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Remove this recipe, because a higher version of the recipe exists in:
meta-openembedded/meta-python/recipes-devtools/python/python3-rsa_4.6.bb

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-rsa.inc          | 13 -------------
 .../recipes-devtools/python/python3-rsa_3.4.2.bb    |  2 --
 2 files changed, 15 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-rsa.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-rsa_3.4.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-rsa.inc b/meta-openstack/recipes-devtools/python/python-rsa.inc
deleted file mode 100644
index ccb65d5..0000000
--- a/meta-openstack/recipes-devtools/python/python-rsa.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Pure-Python RSA implementation"
-AUTHOR = "Sybren A. Stuvel"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634"
-
-inherit pypi
-
-SRC_URI[md5sum] = "b315f47882c24030ee6b5aad628cccdb"
-SRC_URI[sha256sum] = "25df4e10c263fb88b5ace923dd84bf9aa7f5019687b5e55382ffcdb8bede9db5"
-
-RDEPENDS_${PN} += " \
-        ${PYTHON_PN}-pyasn1 \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-rsa_3.4.2.bb b/meta-openstack/recipes-devtools/python/python3-rsa_3.4.2.bb
deleted file mode 100644
index 2d6c93c..0000000
--- a/meta-openstack/recipes-devtools/python/python3-rsa_3.4.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-rsa.inc
-- 
2.25.1



