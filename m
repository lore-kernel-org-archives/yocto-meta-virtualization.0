Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.2833.1612492199997080074
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 Feb 2021 18:30:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: wangmy@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 82BE038C0868
	for <meta-virtualization@yoctoproject.org>; Fri,  5 Feb 2021 02:29:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; 
   d="scan'208";a="104222154"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Feb 2021 10:29:58 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 703434CE6D8A
	for <meta-virtualization@yoctoproject.org>; Fri,  5 Feb 2021 10:29:53 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 5 Feb 2021 10:29:54 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization] [PATCH] python3-designateclient: upgrade 4.1.0 -> 4.2.0
Date: Fri, 5 Feb 2021 10:29:41 +0800
Message-ID: <1612492185-33353-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612492185-33353-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1612492185-33353-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 703434CE6D8A.A1F20
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...ignateclient_4.1.0.bb => python3-designateclient_4.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-designateclient_4.1.0.bb => python3-designateclient_4.2.0.bb} (84%)

diff --git a/meta-openstack/recipes-devtools/python/python3-designateclient_4.1.0.bb b/meta-openstack/recipes-devtools/python/python3-designateclient_4.2.0.bb
similarity index 84%
rename from meta-openstack/recipes-devtools/python/python3-designateclient_4.1.0.bb
rename to meta-openstack/recipes-devtools/python/python3-designateclient_4.2.0.bb
index 83ebd97f..153429b4 100644
--- a/meta-openstack/recipes-devtools/python/python3-designateclient_4.1.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-designateclient_4.2.0.bb
@@ -13,8 +13,8 @@ DEPENDS += " \
 DEPENDS += " \
         python3-pbr-native \
         "
-SRC_URI[md5sum] = "29f1ebf4352162e4e8d3a6d6f9ab1eb4"
-SRC_URI[sha256sum] = "a5b800d767d6626057e1cefd0c6a35936ba5009e822d5b0df05aaa6ae7efaab9"
+SRC_URI[md5sum] = "51e6aaf70e253c999824c7bc29009f5e"
+SRC_URI[sha256sum] = "cf0e76540530491a6100164c514e1c60b55efa25c8db4c18f4902c988d7c1080"
 
 RDEPENDS_${PN} += " \
         python3-cliff \
-- 
2.25.1



