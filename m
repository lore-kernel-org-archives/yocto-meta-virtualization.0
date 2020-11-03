Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.1053.1604389485040395849
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 23:44:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7588838C08E3
	for <meta-virtualization@yoctoproject.org>; Mon,  2 Nov 2020 23:44:44 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.77,447,1596470400"; 
   d="scan'208";a="100859443"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Nov 2020 15:44:44 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id D36DA4CE34EF
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Nov 2020 15:44:41 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 3 Nov 2020 15:44:39 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-castellan: upgrade 3.4.0 -> 3.6.0
Date: Tue, 3 Nov 2020 15:44:42 +0800
Message-ID: <1604389482-98584-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: D36DA4CE34EF.A9EF7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{python3-castellan_3.4.0.bb => python3-castellan_3.6.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-openstack/recipes-devtools/python/{python3-castellan_3.4.0.bb => python3-castellan_3.6.0.bb} (89%)

diff --git a/meta-openstack/recipes-devtools/python/python3-castellan_3.4.0.bb b/meta-openstack/recipes-devtools/python/python3-castellan_3.6.0.bb
similarity index 89%
rename from meta-openstack/recipes-devtools/python/python3-castellan_3.4.0.bb
rename to meta-openstack/recipes-devtools/python/python3-castellan_3.6.0.bb
index 062d375..75a57c1 100644
--- a/meta-openstack/recipes-devtools/python/python3-castellan_3.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-castellan_3.6.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI[sha256sum] = "53d39a4ae93c48d26f904f36ae2f3dedde6ad40d34b5f031c23055fff2a1d7f6"
+SRC_URI[sha256sum] = "66c8e02a822e78a8fd58abc928149c559f3d238472690f36e4993a9249b0636d"
 
 inherit setuptools3 pypi
 
-- 
2.25.1



