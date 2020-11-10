Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.24248.1604990825572683343
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 22:47:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 115A038C06E0
	for <meta-virtualization@yoctoproject.org>; Mon,  9 Nov 2020 22:47:04 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.77,465,1596470400"; 
   d="scan'208";a="101136624"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 10 Nov 2020 14:47:04 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 6DEDE4CE3A70
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Nov 2020 14:47:02 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 10 Nov 2020 14:47:01 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-keyring: upgrade 21.4.0 -> 21.5.0
Date: Tue, 10 Nov 2020 14:46:44 +0800
Message-ID: <1604990804-96864-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 6DEDE4CE3A70.AACF6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{python3-keyring_21.4.0.bb => python3-keyring_21.5.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-keyring_21.4.0.bb => python3-keyring_21.5.0.bb} (72%)

diff --git a/meta-openstack/recipes-devtools/python/python3-keyring_21.4.0.bb b/meta-openstack/recipes-devtools/python/python3-keyring_21.5.0.bb
similarity index 72%
rename from meta-openstack/recipes-devtools/python/python3-keyring_21.4.0.bb
rename to meta-openstack/recipes-devtools/python/python3-keyring_21.5.0.bb
index 569a546c..59e6dbf1 100644
--- a/meta-openstack/recipes-devtools/python/python3-keyring_21.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-keyring_21.5.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[md5sum] = "c9691de646eced3b15e888e5b410d6a1"
-SRC_URI[sha256sum] = "9aeadd006a852b78f4b4ef7c7556c2774d2432bbef8ee538a3e9089ac8b11466"
+SRC_URI[md5sum] = "1609e4804bfc08ca0adf43f9d9c90de6"
+SRC_URI[sha256sum] = "207bd66f2a9881c835dad653da04e196c678bf104f8252141d2d3c4f31051579"
 
 inherit setuptools3 pypi
 
@@ -18,4 +18,5 @@ DEPENDS += " \
 RDEPENDS_${PN} = " \
 	python3-logging \
 	python3-importlib-metadata \
+	python3-typing \
 "
-- 
2.25.1



