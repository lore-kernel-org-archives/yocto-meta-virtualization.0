Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.7679.1608016871080889023
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Dec 2020 23:21:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id AAE4D38C09BD
	for <meta-virtualization@yoctoproject.org>; Tue, 15 Dec 2020 07:21:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; 
   d="scan'208";a="102408227"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Dec 2020 15:21:05 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 3905F4CE5CCA
	for <meta-virtualization@yoctoproject.org>; Tue, 15 Dec 2020 15:21:04 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 15 Dec 2020 15:21:03 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH 1/7] python3-pyscss: Change to python3
Date: Tue, 15 Dec 2020 15:20:48 +0800
Message-ID: <1608016848-55637-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 3905F4CE5CCA.A867C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...thon-pyscss_1.3.4.bb => python3-pyscss_1.3.7.bb} | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-pyscss_1.3.4.bb => python3-pyscss_1.3.7.bb} (61%)

diff --git a/meta-openstack/recipes-devtools/python/python-pyscss_1.3.4.bb b/meta-openstack/recipes-devtools/python/python3-pyscss_1.3.7.bb
similarity index 61%
rename from meta-openstack/recipes-devtools/python/python-pyscss_1.3.4.bb
rename to meta-openstack/recipes-devtools/python/python3-pyscss_1.3.7.bb
index 60e300de..0c7528a5 100644
--- a/meta-openstack/recipes-devtools/python/python-pyscss_1.3.4.bb
+++ b/meta-openstack/recipes-devtools/python/python3-pyscss_1.3.7.bb
@@ -6,22 +6,25 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=28155276e8df3f75bbd327335f66f2fa"
 
 PYPI_PACKAGE = "pyScss"
 
-SRC_URI[md5sum] = "9527b4864cd6023f77a8277e6fb773d7"
-SRC_URI[sha256sum] = "d0323110ecc7d3ead6b99cfec31301306928130e4d0a9eb13226bf390aba8c0e"
+SRC_URI[md5sum] = "c75fa4ea88d3c9df57a11679f337a939"
+SRC_URI[sha256sum] = "f1df571569021a23941a538eb154405dde80bed35dc1ea7c5f3e18e0144746bf"
 
 inherit setuptools3 pypi
 
 # DEPENDS_default: python-pip
 
 DEPENDS += " \
-        python-pip \
+        python3-pip \
         libpcre \
-        python-six \
+        python3-six \
         "
 
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
-        python-enum \
+	python3-logging \
+	python3-six \
+	python3-numbers \
+	python3-image \
         "
 
 CLEANBROKEN = "1"
-- 
2.25.1



