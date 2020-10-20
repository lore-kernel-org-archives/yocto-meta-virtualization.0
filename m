Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.1609.1603176709296633386
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 23:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id CD38038C0694
	for <meta-virtualization@yoctoproject.org>; Mon, 19 Oct 2020 23:51:48 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,396,1596470400"; 
   d="scan'208";a="100322405"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Oct 2020 14:51:48 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 2A45A48990CC
	for <meta-virtualization@yoctoproject.org>; Tue, 20 Oct 2020 14:51:48 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 20 Oct 2020 14:51:46 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-simplegeneric: Consolidate in a single file
Date: Tue, 20 Oct 2020 14:51:46 +0800
Message-ID: <1603176706-40928-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2A45A48990CC.A2499
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-simplegeneric.inc                | 12 ------------
 .../python/python3-simplegeneric_0.8.1.bb          | 14 ++++++++++++--
 2 files changed, 12 insertions(+), 14 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-simplegeneric.inc

diff --git a/meta-openstack/recipes-devtools/python/python-simplegeneric.inc b/meta-openstack/recipes-devtools/python/python-simplegeneric.inc
deleted file mode 100644
index 2cd9fc0..0000000
--- a/meta-openstack/recipes-devtools/python/python-simplegeneric.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Simple generic functions"
-HOMEPAGE = "https://pypi.python.org/pypi/simplegeneric/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.txt;md5=2085f2c228ed80422edf70e52e86c34b"
-
-PYPI_PACKAGE_EXT = "zip"
-
-SRC_URI[md5sum] = "f9c1fab00fd981be588fc32759f474e3"
-SRC_URI[sha256sum] = "dc972e06094b9af5b855b3df4a646395e43d1c9d0d39ed345b7393560d0b9173"
-
-inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python3-simplegeneric_0.8.1.bb b/meta-openstack/recipes-devtools/python/python3-simplegeneric_0.8.1.bb
index 56ad221..a960926 100644
--- a/meta-openstack/recipes-devtools/python/python3-simplegeneric_0.8.1.bb
+++ b/meta-openstack/recipes-devtools/python/python3-simplegeneric_0.8.1.bb
@@ -1,2 +1,12 @@
-inherit setuptools3
-require python-simplegeneric.inc 
+DESCRIPTION = "Simple generic functions"
+HOMEPAGE = "https://pypi.python.org/pypi/simplegeneric/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README.txt;md5=2085f2c228ed80422edf70e52e86c34b"
+
+PYPI_PACKAGE_EXT = "zip"
+
+SRC_URI[md5sum] = "f9c1fab00fd981be588fc32759f474e3"
+SRC_URI[sha256sum] = "dc972e06094b9af5b855b3df4a646395e43d1c9d0d39ed345b7393560d0b9173"
+
+inherit setuptools3 pypi
-- 
2.25.1



