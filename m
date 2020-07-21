Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.13366.1595311096457903718
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2020 22:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,377,1589212800"; 
   d="scan'208";a="96683130"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Jul 2020 13:58:12 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id C3DFB4CE4B09
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jul 2020 13:58:11 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Jul 2020 13:58:11 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][PATCH] python3-sqlalchemy-migrate: Change python to python3
Date: Tue, 21 Jul 2020 13:58:11 +0800
Message-ID: <1595311098-1934-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595311098-1934-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1595311098-1934-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: C3DFB4CE4B09.A5895
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...3.0.bb => python3-sqlalchemy-migrate_0.13.0.bb} | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-sqlalchemy-migrate_0.13.0.bb => python3-sqlalchemy-migrate_0.13.0.bb} (74%)

diff --git a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.13.0.bb b/meta-openstack/recipes-devtools/python/python3-sqlalchemy-migrate_0.13.0.bb
similarity index 74%
rename from meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.13.0.bb
rename to meta-openstack/recipes-devtools/python/python3-sqlalchemy-migrate_0.13.0.bb
index d99f638..5142e13 100644
--- a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.13.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-sqlalchemy-migrate_0.13.0.bb
@@ -13,15 +13,15 @@ inherit setuptools3
 
 # Satisfy setup.py 'setup_requires'
 DEPENDS += " \
-        python-pbr-native \
+        python3-pbr-native \
         "
 
 RDEPENDS_${PN} += " \
-        python-pbr \
-        python-sqlalchemy \
-        python-decorator \
-        python-six \
-        python-sqlparse \
-        python-tempita \
+        python3-pbr \
+        python3-sqlalchemy \
+        python3-decorator \
+        python3-six \
+        python3-sqlparse \
+        python3-tempita \
         "
 	
-- 
2.17.1



