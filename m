Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.1232.1575448998870634344
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Dec 2019 00:43:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: wangmy@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3AF19E010B0; Wed,  4 Dec 2019 00:43:18 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9367EE00ED3
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 00:43:17 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,276,1571673600"; 
   d="scan'208";a="79573806"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2019 16:43:15 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 47A4F4CE1A0C
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 16:34:43 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 4 Dec 2019 16:43:12 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization] [PATCH] python-futurist: 1.9.0 -> 1.10.0
Date: Wed, 4 Dec 2019 07:04:08 -0800
Message-ID: <1575471849-11822-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 47A4F4CE1A0C.A8E18
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/{python-futurist_1.9.0.bb => python-futurist_1.10.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-futurist_1.9.0.bb => python-futurist_1.10.0.bb} (78%)

diff --git a/meta-openstack/recipes-devtools/python/python-futurist_1.9.0.bb b/meta-openstack/recipes-devtools/python/python-futurist_1.10.0.bb
similarity index 78%
rename from meta-openstack/recipes-devtools/python/python-futurist_1.9.0.bb
rename to meta-openstack/recipes-devtools/python/python-futurist_1.10.0.bb
index 06624c1..3571c77 100644
--- a/meta-openstack/recipes-devtools/python/python-futurist_1.9.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-futurist_1.10.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI[md5sum] = "cbfa47202a5724215edc83cc91bdf0ac"
-SRC_URI[sha256sum] = "0c58c359d0fa09852841efc587870db4c186c7a9175768176f69013c8acd83a6"
+SRC_URI[md5sum] = "d7f98e9a5cb09fe9706e4afcbeab1552"
+SRC_URI[sha256sum] = "139d223503d47275636285ae98e7b470085b2b3b6fb2fc9a0d04a76de4b3d30e"
 
 inherit setuptools pypi
 
-- 
2.7.4



