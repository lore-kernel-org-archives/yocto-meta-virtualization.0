Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.4640.1600741682378682219
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Sep 2020 19:28:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id CD4BF38C0638
	for <meta-virtualization@yoctoproject.org>; Mon, 21 Sep 2020 19:28:01 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,288,1596470400"; 
   d="scan'208";a="99489014"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Sep 2020 10:28:00 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id B3ABE48990E9
	for <meta-virtualization@yoctoproject.org>; Tue, 22 Sep 2020 10:28:00 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 22 Sep 2020 10:27:58 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-mccabe: Remove recipe
Date: Tue, 22 Sep 2020 10:27:46 +0800
Message-ID: <1600741666-124250-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: B3ABE48990E9.A7D09
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Remove this recipe, because a higher version of the recipe exists in:
meta-openembedded/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-mccabe.inc      | 14 --------------
 .../python/python3-mccabe_0.2.1.bb                 |  2 --
 2 files changed, 16 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-mccabe.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-mccabe_0.2.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-mccabe.inc b/meta-openstack/recipes-devtools/python/python-mccabe.inc
deleted file mode 100644
index 5f5e91d..0000000
--- a/meta-openstack/recipes-devtools/python/python-mccabe.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "McCabe checker, plugin for flake8"
-HOMEPAGE = "https://github.com/dreamhost/cliff"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=aa0383f6aee4f5c20084a97cd13164c4"
-
-SRC_URI[md5sum] = "5a3f3fa6a4bad126c88aaaa7dab682f5"
-SRC_URI[sha256sum] = "5a2a170e47de5593a6abfae1e9542bd2c3924ac62bbe4e6ed96c953c0352243a"
-
-inherit pypi
-
-RDEPENDS_${PN} += "${PYTHON_PN}-prettytable \
-            ${PYTHON_PN}-cmd2 \
-            ${PYTHON_PN}-pyparsing"
diff --git a/meta-openstack/recipes-devtools/python/python3-mccabe_0.2.1.bb b/meta-openstack/recipes-devtools/python/python3-mccabe_0.2.1.bb
deleted file mode 100644
index 8af8ec5..0000000
--- a/meta-openstack/recipes-devtools/python/python3-mccabe_0.2.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-mccabe.inc
-inherit setuptools3
-- 
2.25.1



