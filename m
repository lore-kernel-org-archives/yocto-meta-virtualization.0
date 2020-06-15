Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.12959.1592209793696116490
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 01:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,514,1583164800"; 
   d="scan'208";a="94502400"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Jun 2020 16:29:55 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 4607E4CE2E86
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Jun 2020 16:29:51 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 15 Jun 2020 16:29:53 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH] python3-tenacity: Changepython to python3
Date: Mon, 15 Jun 2020 16:29:40 +0800
Message-ID: <1592209781-47932-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1592209781-47932-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1592209781-47932-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 4607E4CE2E86.A43EB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

upgrade 5.1.1 -> 6.2.0

python-futures is only for Python 2, so remove it.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...-tenacity_5.1.1.bb => python3-tenacity_6.2.0.bb} | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-tenacity_5.1.1.bb => python3-tenacity_6.2.0.bb} (55%)

diff --git a/meta-openstack/recipes-devtools/python/python-tenacity_5.1.1.bb b/meta-openstack/recipes-devtools/python/python3-tenacity_6.2.0.bb
similarity index 55%
rename from meta-openstack/recipes-devtools/python/python-tenacity_5.1.1.bb
rename to meta-openstack/recipes-devtools/python/python3-tenacity_6.2.0.bb
index bbe62f5..bcab75a 100644
--- a/meta-openstack/recipes-devtools/python/python-tenacity_5.1.1.bb
+++ b/meta-openstack/recipes-devtools/python/python3-tenacity_6.2.0.bb
@@ -6,19 +6,18 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"
 
 inherit pypi
 
-SRC_URI[md5sum] = "c960e3f0c66207c85bbae72a8232278b"
-SRC_URI[sha256sum] = "a4eb168dbf55ed2cae27e7c6b2bd48ab54dabaf294177d998330cf59f294c112"
+SRC_URI[md5sum] = "41e4e17cdedfa95fa626e528f596e151"
+SRC_URI[sha256sum] = "29ae90e7faf488a8628432154bb34ace1cca58244c6ea399fd33f066ac71339a"
 
 inherit setuptools3
 
 # Satisfy setup.py 'setup_requires'
 DEPENDS += " \
-        python-pbr-native \
- 	 python-setuptools3-scm-native \
+        python3-pbr-native \
+ 	 python3-setuptools-scm-native \
         "
 
 RDEPENDS_${PN} += " \
-        python-six \
-        python-futures \
-        python-monotonic \
+        python3-six \
+        python3-monotonic \
         "
-- 
2.17.1



