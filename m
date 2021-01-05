Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.2266.1609832086711361628
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 04 Jan 2021 23:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 80A7C38C0554
	for <meta-virtualization@yoctoproject.org>; Tue,  5 Jan 2021 07:34:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,476,1599494400"; 
   d="scan'208";a="103193018"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Jan 2021 15:34:27 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id CA7E04CE601E
	for <meta-virtualization@yoctoproject.org>; Tue,  5 Jan 2021 15:34:22 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 5 Jan 2021 15:34:23 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-httpretty: upgrade 1.0.2 -> 1.0.3
Date: Tue, 5 Jan 2021 15:34:21 +0800
Message-ID: <1609832061-107932-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: CA7E04CE601E.A7951
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...{python3-httpretty_1.0.2.bb => python3-httpretty_1.0.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-httpretty_1.0.2.bb => python3-httpretty_1.0.3.bb} (76%)

diff --git a/meta-openstack/recipes-devtools/python/python3-httpretty_1.0.2.bb b/meta-openstack/recipes-devtools/python/python3-httpretty_1.0.3.bb
similarity index 76%
rename from meta-openstack/recipes-devtools/python/python3-httpretty_1.0.2.bb
rename to meta-openstack/recipes-devtools/python/python3-httpretty_1.0.3.bb
index 07427460..e288c8e5 100644
--- a/meta-openstack/recipes-devtools/python/python3-httpretty_1.0.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-httpretty_1.0.3.bb
@@ -7,8 +7,8 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d87f7868a62b8d598eab40164594d21b"
 
-SRC_URI[md5sum] = "1f6b9b64818837134b93839e5c7051bb"
-SRC_URI[sha256sum] = "24a6fd2fe1c76e94801b74db8f52c0fb42718dc4a199a861b305b1a492b9d868"
+SRC_URI[md5sum] = "f42d7dcee7efa3b4aa842494abb23cac"
+SRC_URI[sha256sum] = "9335cbd8f38745e0e2dc4755d8932a77d378d93e15804969504b1e6b568d613c"
 
 inherit setuptools3 pypi
 
-- 
2.25.1



