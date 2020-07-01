Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.15977.1593586815721975371
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 00:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,299,1589212800"; 
   d="scan'208";a="95616576"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Jul 2020 15:00:04 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id CAA664CE4BD0
	for <meta-virtualization@lists.yoctoproject.org>; Wed,  1 Jul 2020 14:49:29 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 1 Jul 2020 14:59:59 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH] python3-lockfile: Change python to python3
Date: Wed, 1 Jul 2020 14:59:52 +0800
Message-ID: <1593586793-23074-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593586793-23074-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1593586793-23074-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: CAA664CE4BD0.A69CD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...python-lockfile_0.12.2.bb => python3-lockfile_0.12.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-lockfile_0.12.2.bb => python3-lockfile_0.12.2.bb} (89%)

diff --git a/meta-openstack/recipes-devtools/python/python-lockfile_0.12.2.bb b/meta-openstack/recipes-devtools/python/python3-lockfile_0.12.2.bb
similarity index 89%
rename from meta-openstack/recipes-devtools/python/python-lockfile_0.12.2.bb
rename to meta-openstack/recipes-devtools/python/python3-lockfile_0.12.2.bb
index e573090..8009060 100644
--- a/meta-openstack/recipes-devtools/python/python-lockfile_0.12.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-lockfile_0.12.2.bb
@@ -10,14 +10,14 @@ SRC_URI[sha256sum] = "6aed02de03cba24efabcd600b30540140634fc06cfa603822d508d5361
 inherit distutils3 pypi
 
 DEPENDS += "\
-    python-pbr \
+    python3-pbr \
     "
 
 # Satisfy setup.py 'setup_requires'
 DEPENDS += " \
-    python-pbr-native \
+    python3-pbr-native \
     "
 
 RDEPENDS_${PN} += "\
-    python-pbr \
+    python3-pbr \
     "
-- 
2.17.1



