Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.7689.1608016186130490687
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Dec 2020 23:09:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8501238C09BD
	for <meta-virtualization@yoctoproject.org>; Tue, 15 Dec 2020 07:09:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; 
   d="scan'208";a="102407696"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Dec 2020 15:09:20 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 56CA24CE601E
	for <meta-virtualization@yoctoproject.org>; Tue, 15 Dec 2020 15:09:20 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 15 Dec 2020 15:09:19 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-pysqlite: Remove recipe
Date: Tue, 15 Dec 2020 15:09:13 +0800
Message-ID: <1608016153-57351-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 56CA24CE601E.A0FE2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

When I tried to change it to python3, it reported the following error:
| pysqlite is not supported on Python 3. When using Python 3, use the sqlite3 module from the standard library.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-pysqlite_2.6.3.bb           | 22 -------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pysqlite_2.6.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pysqlite_2.6.3.bb b/meta-openstack/recipes-devtools/python/python-pysqlite_2.6.3.bb
deleted file mode 100644
index 6b8de00e..00000000
--- a/meta-openstack/recipes-devtools/python/python-pysqlite_2.6.3.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "DB-API 2.0 interface for SQLite 3.x"
-HOMEPAGE = "http://github.com/ghaering/pysqlite"
-SECTION = "devel/python"
-LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a85bd923e5c830f8eb89db354ff72f38"
-
-SRC_URI[md5sum] = "7ff1cedee74646b50117acff87aa1cfa"
-SRC_URI[sha256sum] = "fe9c35216bf56c858b34c4b4c8be7e34566ddef29670e5a5b43f9cb8ecfbb28d"
-
-inherit setuptools3 pypi
-
-FILES_${PN} += "${datadir}/*"
-
-# DEPENDS_default: python-pip
-
-DEPENDS += " \
-        python-pip \
-        "
-
-# RDEPENDS_default: 
-RDEPENDS_${PN} += " \
-        "
-- 
2.25.1



