Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.24538.1604990856358193546
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 22:47:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id D096638C06E0
	for <meta-virtualization@yoctoproject.org>; Mon,  9 Nov 2020 22:47:35 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.77,465,1596470400"; 
   d="scan'208";a="101136650"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 10 Nov 2020 14:47:35 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 28DCA4CE3A71
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Nov 2020 14:47:30 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 10 Nov 2020 14:47:29 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-paste: upgrade 3.4.6 -> 3.5.0
Date: Tue, 10 Nov 2020 14:47:31 +0800
Message-ID: <1604990851-96918-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 28DCA4CE3A71.A7CBB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{python3-paste_3.4.6.bb => python3-paste_3.5.0.bb}    | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-paste_3.4.6.bb => python3-paste_3.5.0.bb} (60%)

diff --git a/meta-openstack/recipes-devtools/python/python3-paste_3.4.6.bb b/meta-openstack/recipes-devtools/python/python3-paste_3.5.0.bb
similarity index 60%
rename from meta-openstack/recipes-devtools/python/python3-paste_3.4.6.bb
rename to meta-openstack/recipes-devtools/python/python3-paste_3.5.0.bb
index efb3abf9..2be69ea2 100644
--- a/meta-openstack/recipes-devtools/python/python3-paste_3.4.6.bb
+++ b/meta-openstack/recipes-devtools/python/python3-paste_3.5.0.bb
@@ -6,7 +6,11 @@ LIC_FILES_CHKSUM = "file://docs/license.txt;md5=1798f29d55080c60365e6283cb49779c
 
 PYPI_PACKAGE = "Paste"
 
-SRC_URI[md5sum] = "4690566403fd89b01ae70a64245441b7"
-SRC_URI[sha256sum] = "001370f4fcc7446006b52a39ed386341fce626605af711e0ec18ddb0b4912cb7"
+SRC_URI[md5sum] = "90c56e0f84c58ca4841c0df0bcfc11d9"
+SRC_URI[sha256sum] = "1b095c42dc91d426f3ae85101796b14d265887f8f36f3aad143a5f29effdc39d"
 
 inherit setuptools3 pypi
+
+RDEPENDS_${PN} += " \
+	python3-typing \
+"
-- 
2.25.1



