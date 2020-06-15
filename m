Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.9857.1592190512526262085
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 14 Jun 2020 20:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,513,1583164800"; 
   d="scan'208";a="94485655"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Jun 2020 11:08:25 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 0619D4CE2E6B
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Jun 2020 11:08:21 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 15 Jun 2020 11:08:23 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH] python3-fixtures: Change python to python3
Date: Mon, 15 Jun 2020 11:07:49 +0800
Message-ID: <1592190472-47315-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 0619D4CE2E6B.A55C6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...python-fixtures_3.0.0.bb => python3-fixtures_3.0.0.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-fixtures_3.0.0.bb => python3-fixtures_3.0.0.bb} (86%)

diff --git a/meta-openstack/recipes-devtools/python/python-fixtures_3.0.0.bb b/meta-openstack/recipes-devtools/python/python3-fixtures_3.0.0.bb
similarity index 86%
rename from meta-openstack/recipes-devtools/python/python-fixtures_3.0.0.bb
rename to meta-openstack/recipes-devtools/python/python3-fixtures_3.0.0.bb
index c8883be..c2e098f 100644
--- a/meta-openstack/recipes-devtools/python/python-fixtures_3.0.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-fixtures_3.0.0.bb
@@ -15,14 +15,14 @@ DISTUTILS_INSTALL_ARGS = "--root=${D} \
     --install-data=${datadir}"
 
 DEPENDS += " \
-	python-pbr \
+	python3-pbr \
 	"
 
 # Satisfy setup.py 'setup_requires'
 DEPENDS += " \
-        python-pbr-native \
+        python3-pbr-native \
         "
 
-RDEPENDS_${PN} += "python-testtools \
-	python-pbr \
+RDEPENDS_${PN} += "python3-testtools \
+	python3-pbr \
 	"
-- 
2.17.1



