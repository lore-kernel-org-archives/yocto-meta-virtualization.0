Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.1125.1596528661600584827
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Aug 2020 01:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 751C1E01F80; Tue,  4 Aug 2020 01:11:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A25EDE01F7C
	for <meta-virtualization@yoctoproject.org>; Tue,  4 Aug 2020 01:11:00 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,433,1589212800"; 
   d="scan'208";a="97579839"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Aug 2020 16:10:59 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 60DD94CE5447
	for <meta-virtualization@yoctoproject.org>; Tue,  4 Aug 2020 16:10:53 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 4 Aug 2020 16:10:53 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-subunit: upgrade 1.1.0 -> 1.4.0
Date: Wed, 5 Aug 2020 01:10:46 +0800
Message-ID: <1596561046-7768-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 60DD94CE5447.A8746
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

-License-Update: Change to PKG-INFO containing licenses information.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
---
 .../{python-subunit_1.1.0.bb => python3-subunit_1.4.0.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-subunit_1.1.0.bb => python3-subunit_1.4.0.bb} (52%)

diff --git a/meta-openstack/recipes-devtools/python/python-subunit_1.1.0.bb b/meta-openstack/recipes-devtools/python/python3-subunit_1.4.0.bb
similarity index 52%
rename from meta-openstack/recipes-devtools/python/python-subunit_1.1.0.bb
rename to meta-openstack/recipes-devtools/python/python3-subunit_1.4.0.bb
index c18d1c4..02a6b2e 100644
--- a/meta-openstack/recipes-devtools/python/python-subunit_1.1.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-subunit_1.4.0.bb
@@ -2,11 +2,11 @@ DESCRIPTION = "Python implementation of subunit test streaming protocol"
 HOMEPAGE = "https://pypi.python.org/pypi/python-subunit/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README;md5=e5b524e1b2c67c88fc64439ee4a850aa"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=b5969d1df4dc7ff4882889baa132a694"
 
 PYPI_PACKAGE = "python-subunit"
 
-SRC_URI[md5sum] = "d2c09c93346077ced675c9f718e6a0f1"
-SRC_URI[sha256sum] = "d9a7606e9610828d68c1d2f0f5abbb421e34e518b8f4882c8b2e08176281bf88"
+SRC_URI[md5sum] = "30f1ab20651d94442dd9a7f8c9e8d633"
+SRC_URI[sha256sum] = "042039928120fbf392e8c983d60f3d8ae1b88f90a9f8fd7188ddd9c26cad1e48"
 
 inherit setuptools3 pypi
-- 
2.25.1



