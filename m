Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.2828.1578015501121403786
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Jan 2020 17:38:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: wangmy@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AA7F0E013E5; Thu,  2 Jan 2020 17:38:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_03_06,
	RCVD_IN_DNSWL_MED autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  3.0 DATE_IN_FUTURE_03_06 Date: is 3 to 6 hours after Received: date
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D95E5E013D6
	for <meta-virtualization@yoctoproject.org>; Thu,  2 Jan 2020 17:38:19 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,388,1571673600"; 
   d="scan'208";a="81257262"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Jan 2020 09:38:17 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 3C7FF49E9315
	for <meta-virtualization@yoctoproject.org>; Fri,  3 Jan 2020 09:29:19 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 3 Jan 2020 09:38:14 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 3 Jan 2020 09:38:16 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization] [PATCH]python-sqlalchemy: Remove the recipe
Date: Thu, 2 Jan 2020 22:08:13 -0800
Message-ID: <1578031693-88286-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 3C7FF49E9315.A41E5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
Content-Type: text/plain

Because they already exist in meta-openembedded, remove the recipe.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/python-sqlalchemy_1.1.5.bb          | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 recipes-devtools/python/python-sqlalchemy_1.1.5.bb

diff --git a/recipes-devtools/python/python-sqlalchemy_1.1.5.bb b/recipes-devtools/python/python-sqlalchemy_1.1.5.bb
deleted file mode 100644
index f22d272..0000000
--- a/recipes-devtools/python/python-sqlalchemy_1.1.5.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
-application developers the full power and flexibility of SQL"
-HOMEPAGE = "http://www.sqlalchemy.org/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
-RDEPENDS_${PN} += "python-numbers"
-
-SRCNAME = "SQLAlchemy"
-SRC_URI = "https://pypi.python.org/packages/da/04/8048a5075d6e29235bbd6f1ea092a38dbe2630c670e73d4aa923a4e5521c/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "50685d97dca4b91945ae6309d03ab8c9"
-SRC_URI[sha256sum] = "68fb40049690e567ebda7b270176f5abf0d53d9fbd515fec4e43326f601119b6"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-DEFAULT_PREFERENCE = "-1"
-
-inherit setuptools
-- 
2.17.1



