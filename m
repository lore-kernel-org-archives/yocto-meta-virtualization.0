Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.3119.1575361431767218438
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Dec 2019 00:23:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: wangmy@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6219AE01104; Tue,  3 Dec 2019 00:23:51 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 068D5E01081
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Dec 2019 00:23:49 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,272,1571673600"; 
   d="scan'208";a="79505690"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Dec 2019 16:23:48 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 2745F4CE1C0F
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Dec 2019 16:15:16 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 3 Dec 2019 16:23:42 +0800
From: wangmy@cn.fujitsu.com
To: <meta-virtualization@yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][PATCH] python-sqlalchemy-migrate: 0.12.0 -> 0.13.0
Date: Tue, 3 Dec 2019 06:48:28 -0800
Message-ID: <1575384511-121432-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 2745F4CE1C0F.A7BBA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...lalchemy-migrate_0.12.0.bb => python-sqlalchemy-migrate_0.13.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-sqlalchemy-migrate_0.12.0.bb => python-sqlalchemy-migrate_0.13.0.bb} (80%)

diff --git a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.12.0.bb b/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.13.0.bb
similarity index 80%
rename from meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.12.0.bb
rename to meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.13.0.bb
index dcb6d9d..ce9ccac 100644
--- a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.12.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.13.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=32;endline=32;md5=d41d8cd98f00b204
 
 inherit pypi
 
-SRC_URI[md5sum] = "6a4920f2a2e07d193e95cf712d762b08"
-SRC_URI[sha256sum] = "8cfada30bbcf79a83b3a2d1bcd637de7e1f43e390d54de33e4f3249fd9aacfae"
+SRC_URI[md5sum] = "86572c92ae84334907f5e3a2cecc92a6"
+SRC_URI[sha256sum] = "0bc02e292a040ade5e35a01d3ea744119e1309cdddb704fdb99bac13236614f8"
 
 inherit setuptools
 
-- 
2.7.4



