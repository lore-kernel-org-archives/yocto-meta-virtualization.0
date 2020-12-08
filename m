Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.4264.1607403226632463201
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Dec 2020 20:53:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 26D6738C0858
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Dec 2020 04:53:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="102163290"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Dec 2020 12:53:45 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id E57C748990D2
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Dec 2020 12:53:39 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Dec 2020 12:53:39 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-oslo.config: upgrade 8.2.0 -> 8.4.0
Date: Tue, 8 Dec 2020 12:53:38 +0800
Message-ID: <1607403218-8956-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E57C748990D2.A101E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...ython3-oslo.config_8.2.0.bb => python3-oslo.config_8.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-openstack/recipes-devtools/python/{python3-oslo.config_8.2.0.bb => python3-oslo.config_8.4.0.bb} (87%)

diff --git a/meta-openstack/recipes-devtools/python/python3-oslo.config_8.2.0.bb b/meta-openstack/recipes-devtools/python/python3-oslo.config_8.4.0.bb
similarity index 87%
rename from meta-openstack/recipes-devtools/python/python3-oslo.config_8.2.0.bb
rename to meta-openstack/recipes-devtools/python/python3-oslo.config_8.4.0.bb
index 6898a1f0..3b89b51a 100644
--- a/meta-openstack/recipes-devtools/python/python3-oslo.config_8.2.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-oslo.config_8.4.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
 
-SRC_URI[sha256sum] = "116ff3a7b98b0309b083af7906d99f8c6bea67df5ee03a85e2ac02700dd75d30"
+SRC_URI[sha256sum] = "537d62c581de2227aebfc4c71ee6fb455b853be920e0b30b65ebbe8d8128725c"
 
 inherit setuptools3 pypi
 
-- 
2.25.1



