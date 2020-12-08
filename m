Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.4366.1607403694491938888
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Dec 2020 21:01:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id EBD9538C0858
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Dec 2020 05:01:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="102163582"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Dec 2020 13:01:20 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id D6A6D4CE6000
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Dec 2020 13:01:14 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Dec 2020 13:01:14 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-designateclient: upgrade 4.0.0 -> 4.1.0
Date: Tue, 8 Dec 2020 13:01:11 +0800
Message-ID: <1607403671-56404-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: D6A6D4CE6000.A7412
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...ignateclient_4.0.0.bb => python3-designateclient_4.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-designateclient_4.0.0.bb => python3-designateclient_4.1.0.bb} (84%)

diff --git a/meta-openstack/recipes-devtools/python/python3-designateclient_4.0.0.bb b/meta-openstack/recipes-devtools/python/python3-designateclient_4.1.0.bb
similarity index 84%
rename from meta-openstack/recipes-devtools/python/python3-designateclient_4.0.0.bb
rename to meta-openstack/recipes-devtools/python/python3-designateclient_4.1.0.bb
index 891f0481..83ebd97f 100644
--- a/meta-openstack/recipes-devtools/python/python3-designateclient_4.0.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-designateclient_4.1.0.bb
@@ -13,8 +13,8 @@ DEPENDS += " \
 DEPENDS += " \
         python3-pbr-native \
         "
-SRC_URI[md5sum] = "ad4ca221c5209261cf0eaf2824b07b55"
-SRC_URI[sha256sum] = "d61e7999f0cbb55d2b6e7dec7a6232389d3034de27c1e80b7d5c69d60dd58dbf"
+SRC_URI[md5sum] = "29f1ebf4352162e4e8d3a6d6f9ab1eb4"
+SRC_URI[sha256sum] = "a5b800d767d6626057e1cefd0c6a35936ba5009e822d5b0df05aaa6ae7efaab9"
 
 RDEPENDS_${PN} += " \
         python3-cliff \
-- 
2.25.1



