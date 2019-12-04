Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.1233.1575448999249506738
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Dec 2019 00:43:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: wangmy@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 21D0AE010B1; Wed,  4 Dec 2019 00:43:19 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E99BE00ED3
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 00:43:18 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,276,1571673600"; 
   d="scan'208";a="79573807"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2019 16:43:15 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id C4DD44CE1C09
	for <meta-virtualization@yoctoproject.org>; Wed,  4 Dec 2019 16:34:45 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 4 Dec 2019 16:43:14 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][PATCH] python-dogpile.cache: 0.8.0 -> 0.9.0
Date: Wed, 4 Dec 2019 07:04:09 -0800
Message-ID: <1575471849-11822-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575471849-11822-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1575471849-11822-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: C4DD44CE1C09.A9FF4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-dogpile.cache.inc       | 4 ++--
 .../{python-dogpile.cache_0.8.0.bb => python-dogpile.cache_0.9.0.bb}  | 0
 ...{python3-dogpile.cache_0.8.0.bb => python3-dogpile.cache_0.9.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-dogpile.cache_0.8.0.bb => python-dogpile.cache_0.9.0.bb} (100%)
 rename meta-openstack/recipes-devtools/python/{python3-dogpile.cache_0.8.0.bb => python3-dogpile.cache_0.9.0.bb} (100%)

diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc b/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc
index 020b171..5074acf 100644
--- a/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc
+++ b/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e8d5890806254a2648269bb4029f74c6"
 
-SRC_URI[md5sum] = "62512dea6839d2fd1f88532fb573077c"
-SRC_URI[sha256sum] = "70f5eae4aec908f76188a2c287e07105f60c05d879bb9a4efcc5ba44563d8de6"
+SRC_URI[md5sum] = "d48b4752b404e2e2a33f984d261fff7d"
+SRC_URI[sha256sum] = "b348835825c9dcd251d9aad1f89f257277ac198a3e35a61980ab4cb28c75216b"
 
 inherit pypi
 
diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.8.0.bb b/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.9.0.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python-dogpile.cache_0.8.0.bb
rename to meta-openstack/recipes-devtools/python/python-dogpile.cache_0.9.0.bb
diff --git a/meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.8.0.bb b/meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.9.0.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.8.0.bb
rename to meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.9.0.bb
-- 
2.7.4



