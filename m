Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.4360.1607403663624282741
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Dec 2020 21:01:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 1ED0738C0858
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Dec 2020 05:01:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="102163563"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Dec 2020 13:01:02 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 355F64CE600D
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Dec 2020 13:01:00 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Dec 2020 13:00:59 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-cliff: upgrade 3.4.0 -> 3.5.0
Date: Tue, 8 Dec 2020 13:00:24 +0800
Message-ID: <1607403624-56341-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 355F64CE600D.A5D16
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/{python3-cliff_3.4.0.bb => python3-cliff_3.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-cliff_3.4.0.bb => python3-cliff_3.5.0.bb} (82%)

diff --git a/meta-openstack/recipes-devtools/python/python3-cliff_3.4.0.bb b/meta-openstack/recipes-devtools/python/python3-cliff_3.5.0.bb
similarity index 82%
rename from meta-openstack/recipes-devtools/python/python3-cliff_3.4.0.bb
rename to meta-openstack/recipes-devtools/python/python3-cliff_3.5.0.bb
index 040b425e..5ba0894a 100644
--- a/meta-openstack/recipes-devtools/python/python3-cliff_3.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-cliff_3.5.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "62c1f79bd1675febb4d0a36341fab78d"
-SRC_URI[sha256sum] = "49be854582ec4a74240cb72f287846f823cd8cbd2e25f924541d12f27104bda3"
+SRC_URI[md5sum] = "45a7f6f6e9e392ad8dbf79f802930047"
+SRC_URI[sha256sum] = "5bfb684b5fcdff0afaaccd1298a376c0e62e644c46b7e9abc034595b41fe1759"
 
 inherit setuptools3 pypi
 
-- 
2.25.1



