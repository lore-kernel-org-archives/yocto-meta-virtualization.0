Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.16158.1593586810165156319
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 00:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,299,1589212800"; 
   d="scan'208";a="95616569"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Jul 2020 14:59:58 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 751544CE506F
	for <meta-virtualization@lists.yoctoproject.org>; Wed,  1 Jul 2020 14:49:28 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 1 Jul 2020 14:59:57 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH] python3-kazoo: Change python to python3
Date: Wed, 1 Jul 2020 14:59:51 +0800
Message-ID: <1593586793-23074-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593586793-23074-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1593586793-23074-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 751544CE506F.A385F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

upgrade 2.0 -> 2.7.0

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{python-kazoo_2.0.bb => python3-kazoo_2.7.0.bb}  | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-kazoo_2.0.bb => python3-kazoo_2.7.0.bb} (65%)

diff --git a/meta-openstack/recipes-devtools/python/python-kazoo_2.0.bb b/meta-openstack/recipes-devtools/python/python3-kazoo_2.7.0.bb
similarity index 65%
rename from meta-openstack/recipes-devtools/python/python-kazoo_2.0.bb
rename to meta-openstack/recipes-devtools/python/python3-kazoo_2.7.0.bb
index db7c023..adfec92 100644
--- a/meta-openstack/recipes-devtools/python/python-kazoo_2.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-kazoo_2.7.0.bb
@@ -5,17 +5,19 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
 # Archived version so we have to overwrite what the pypi class will derive
-PYPI_SRC_URI = "https://pypi.python.org/packages/source/k/${SRCNAME}/kazoo-${PV}.zip"
+SRCNAME = "kazoo"
 
-SRC_URI[md5sum] = "4b172de456c102b0e33f661e7e2b3583"
-SRC_URI[sha256sum] = "f0c42cc7752a331ba59269827bd19cb271210399a9dcab32b6a91465b4431a18"
+PYPI_SRC_URI = "https://pypi.python.org/packages/source/k/${SRCNAME}/kazoo-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "073445f65d71520de2b6275530d88c4e"
+SRC_URI[sha256sum] = "6883f6dd3e8d4e1741076dd3b23b0861592f13759072e3835f035bcb72b077cb"
 
 inherit setuptools3 pypi
 
-# DEPENDS_default: python-pip
+# DEPENDS_default: python3-pip
 
 DEPENDS += " \
-        python-pip \
+        python3-pip \
         "
 
 # RDEPENDS_default: 
-- 
2.17.1



