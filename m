Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.4640.1598928480830343025
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Aug 2020 19:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ADDBDE020F0; Mon, 31 Aug 2020 19:48:00 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C13A4E020EE
	for <meta-virtualization@yoctoproject.org>; Mon, 31 Aug 2020 19:47:58 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,377,1592841600"; 
   d="scan'208";a="98755827"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Sep 2020 10:47:57 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 4412848990D9
	for <meta-virtualization@yoctoproject.org>; Tue,  1 Sep 2020 10:47:52 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 1 Sep 2020 10:47:50 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-ecdsa: Remove recipe
Date: Tue, 1 Sep 2020 10:47:44 +0800
Message-ID: <1598928464-124474-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 4412848990D9.A7EDF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Remove this recipe, because a higher version of the recipe exists in:
meta-openembedded/meta-python/recipes-devtools/python/python3-ecdsa_0.15.bb

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-ecdsa.inc  | 20 -------------------
 .../python/python3-ecdsa_0.13.bb              |  2 --
 2 files changed, 22 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-ecdsa.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-ecdsa_0.13.bb

diff --git a/meta-openstack/recipes-devtools/python/python-ecdsa.inc b/meta-openstack/recipes-devtools/python/python-ecdsa.inc
deleted file mode 100644
index b7c8356..0000000
--- a/meta-openstack/recipes-devtools/python/python-ecdsa.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "ECDSA cryptographic signature library"
-HOMEPAGE = "https://github.com/warner/python-ecdsa"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-
-SRC_URI[md5sum] = "1f60eda9cb5c46722856db41a3ae6670"
-SRC_URI[sha256sum] = "64cf1ee26d1cde3c73c6d7d107f835fed7c6a2904aef9eac223d57ad800c43fa"
-
-inherit pypi
-
-DEPENDS += " \
-        ${PYTHON_PN}-pip \
-        ${PYTHON_PN}-pbr \
-        "
-
-# RDEPENDS_default:
-RDEPENDS_${PN} += " \
-        ${PYTHON_PN}-pbr \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-ecdsa_0.13.bb b/meta-openstack/recipes-devtools/python/python3-ecdsa_0.13.bb
deleted file mode 100644
index 13366f4..0000000
--- a/meta-openstack/recipes-devtools/python/python3-ecdsa_0.13.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-ecdsa.inc
-inherit setuptools3
-- 
2.25.1



