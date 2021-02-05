Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.2822.1612492199441521752
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 Feb 2021 18:29:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: wangmy@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id E5F3338C0481
	for <meta-virtualization@yoctoproject.org>; Fri,  5 Feb 2021 02:29:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; 
   d="scan'208";a="104222151"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Feb 2021 10:29:58 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 77E914CE6D8D
	for <meta-virtualization@yoctoproject.org>; Fri,  5 Feb 2021 10:29:55 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 5 Feb 2021 10:29:57 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization] [PATCH] python3-dogpile.cache: upgrade 1.1.1 -> 1.1.2
Date: Fri, 5 Feb 2021 10:29:42 +0800
Message-ID: <1612492185-33353-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612492185-33353-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1612492185-33353-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 77E914CE6D8D.A4449
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Copyright year updated to 2021.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...ogpile.cache_1.1.1.bb => python3-dogpile.cache_1.1.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-dogpile.cache_1.1.1.bb => python3-dogpile.cache_1.1.2.bb} (59%)

diff --git a/meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.1.1.bb b/meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.1.2.bb
similarity index 59%
rename from meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.1.1.bb
rename to meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.1.2.bb
index 627d7db0..941e1143 100644
--- a/meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.1.1.bb
+++ b/meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.1.2.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Python Dogpile Cache: A caching front-end based on the Dogpile lo
 HOMEPAGE = "https://pypi.python.org/pypi/dogpile.cache"
 SECTION = "devel/python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=46e560ef3e93a33b284504845ea6a11d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6d830a549d9d8c25362346e0f8fbba53"
 
-SRC_URI[md5sum] = "3cf83a593a1a1bc17b89d14917f66ef0"
-SRC_URI[sha256sum] = "40147b19696f387415a7efaaa4cf8ea0b5d31bdd1b53e5187e75d48ddfee9f0e"
+SRC_URI[md5sum] = "fb9bea726156560d03890599c4cd92e0"
+SRC_URI[sha256sum] = "2134464672a3deb7ef1366a8691726686d8c62540e4208f1a40c9aaa1a0b6a45"
 
 inherit setuptools3 pypi
 
-- 
2.25.1



