Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.2879.1612492195497889116
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 Feb 2021 18:29:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: wangmy@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 49AB838C0481
	for <meta-virtualization@yoctoproject.org>; Fri,  5 Feb 2021 02:29:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; 
   d="scan'208";a="104222147"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Feb 2021 10:29:52 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 1AE814CE6033
	for <meta-virtualization@yoctoproject.org>; Fri,  5 Feb 2021 10:29:51 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 5 Feb 2021 10:29:52 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization] [PATCH] python3-cliff: upgrade 3.5.0 -> 3.6.0
Date: Fri, 5 Feb 2021 10:29:40 +0800
Message-ID: <1612492185-33353-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 1AE814CE6033.A1569
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/{python3-cliff_3.5.0.bb => python3-cliff_3.6.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-cliff_3.5.0.bb => python3-cliff_3.6.0.bb} (82%)

diff --git a/meta-openstack/recipes-devtools/python/python3-cliff_3.5.0.bb b/meta-openstack/recipes-devtools/python/python3-cliff_3.6.0.bb
similarity index 82%
rename from meta-openstack/recipes-devtools/python/python3-cliff_3.5.0.bb
rename to meta-openstack/recipes-devtools/python/python3-cliff_3.6.0.bb
index 5ba0894a..29d38e06 100644
--- a/meta-openstack/recipes-devtools/python/python3-cliff_3.5.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-cliff_3.6.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "45a7f6f6e9e392ad8dbf79f802930047"
-SRC_URI[sha256sum] = "5bfb684b5fcdff0afaaccd1298a376c0e62e644c46b7e9abc034595b41fe1759"
+SRC_URI[md5sum] = "8dbf43ad5486186eb80e985ddb38fdec"
+SRC_URI[sha256sum] = "a3f4fa67eeafbcfa7cf9fe4b1755d410876528e1d0d115740db00b50a1250272"
 
 inherit setuptools3 pypi
 
-- 
2.25.1



