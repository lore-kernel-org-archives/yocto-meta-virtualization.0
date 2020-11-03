Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.1046.1604389523271606748
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 23:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 3BA4638C08E3
	for <meta-virtualization@yoctoproject.org>; Mon,  2 Nov 2020 23:45:22 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.77,447,1596470400"; 
   d="scan'208";a="100859489"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Nov 2020 15:45:21 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 8F30E4CE34E2
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Nov 2020 15:45:15 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 3 Nov 2020 15:45:13 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-cliff: upgrade 3.3.0 -> 3.4.0
Date: Tue, 3 Nov 2020 15:44:53 +0800
Message-ID: <1604389493-98620-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 8F30E4CE34E2.A8183
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/{python3-cliff_3.3.0.bb => python3-cliff_3.4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-cliff_3.3.0.bb => python3-cliff_3.4.0.bb} (82%)

diff --git a/meta-openstack/recipes-devtools/python/python3-cliff_3.3.0.bb b/meta-openstack/recipes-devtools/python/python3-cliff_3.4.0.bb
similarity index 82%
rename from meta-openstack/recipes-devtools/python/python3-cliff_3.3.0.bb
rename to meta-openstack/recipes-devtools/python/python3-cliff_3.4.0.bb
index e30bc6b..040b425 100644
--- a/meta-openstack/recipes-devtools/python/python3-cliff_3.3.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-cliff_3.4.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "0e935a090e19358973fdbcc4dfbcdaab"
-SRC_URI[sha256sum] = "611595ad7b4bdf57aa252027796dac3273ab0f4bc1511e839cce230a351cb710"
+SRC_URI[md5sum] = "62c1f79bd1675febb4d0a36341fab78d"
+SRC_URI[sha256sum] = "49be854582ec4a74240cb72f287846f823cd8cbd2e25f924541d12f27104bda3"
 
 inherit setuptools3 pypi
 
-- 
2.25.1



