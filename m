Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.4250.1607403085413757532
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Dec 2020 20:51:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id E8D6138C1178
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Dec 2020 04:51:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="102163231"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Dec 2020 12:51:18 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A05954CE600B
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Dec 2020 12:51:17 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Dec 2020 12:51:16 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-keystoneauth1: upgrade 4.2.1 -> 4.3.0
Date: Tue, 8 Dec 2020 12:51:16 +0800
Message-ID: <1607403076-8810-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A05954CE600B.A0E25
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...-keystoneauth1_4.2.1.bb => python3-keystoneauth1_4.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-keystoneauth1_4.2.1.bb => python3-keystoneauth1_4.3.0.bb} (80%)

diff --git a/meta-openstack/recipes-devtools/python/python3-keystoneauth1_4.2.1.bb b/meta-openstack/recipes-devtools/python/python3-keystoneauth1_4.3.0.bb
similarity index 80%
rename from meta-openstack/recipes-devtools/python/python3-keystoneauth1_4.2.1.bb
rename to meta-openstack/recipes-devtools/python/python3-keystoneauth1_4.3.0.bb
index 6c046d91..972668c2 100644
--- a/meta-openstack/recipes-devtools/python/python3-keystoneauth1_4.2.1.bb
+++ b/meta-openstack/recipes-devtools/python/python3-keystoneauth1_4.3.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=96f840d59b245a1c817fbcb901afc574"
 
-SRC_URI[md5sum] = "3c65181cb3cf6a8690e1c65de030e3fb"
-SRC_URI[sha256sum] = "9496bfcc27eff3d05271e10aa64684b7c1fd12a4d96f58511f2286312d9c89a1"
+SRC_URI[md5sum] = "455ff39860b21e924305f4db3d74e293"
+SRC_URI[sha256sum] = "e3fa55b58f082e4d753ae3fe599f3d74c591fd9cb8286879ff532a78955163f1"
 
 inherit setuptools3 pypi
 
-- 
2.25.1



