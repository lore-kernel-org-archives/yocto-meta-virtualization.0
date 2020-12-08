Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.4238.1607403695807264926
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Dec 2020 21:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4F47638C1178
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Dec 2020 05:01:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="102163595"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Dec 2020 13:01:33 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 93D2A4CE6008
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Dec 2020 13:01:28 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Dec 2020 13:01:28 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-dogpile.cache: upgrade 1.0.2 -> 1.1.1
Date: Tue, 8 Dec 2020 13:01:28 +0800
Message-ID: <1607403688-56502-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 93D2A4CE6008.A6564
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...-dogpile.cache_1.0.2.bb => python3-dogpile.cache_1.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-dogpile.cache_1.0.2.bb => python3-dogpile.cache_1.1.1.bb} (73%)

diff --git a/meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.0.2.bb b/meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.1.1.bb
similarity index 73%
rename from meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.0.2.bb
rename to meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.1.1.bb
index 21b596fc..627d7db0 100644
--- a/meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.0.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.1.1.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=46e560ef3e93a33b284504845ea6a11d"
 
-SRC_URI[md5sum] = "a325ec142d690269573a872e24fc1cb6"
-SRC_URI[sha256sum] = "64fda39d25b46486a4876417ca03a4af06f35bfadba9f59613f9b3d748aa21ef"
+SRC_URI[md5sum] = "3cf83a593a1a1bc17b89d14917f66ef0"
+SRC_URI[sha256sum] = "40147b19696f387415a7efaaa4cf8ea0b5d31bdd1b53e5187e75d48ddfee9f0e"
 
 inherit setuptools3 pypi
 
-- 
2.25.1



