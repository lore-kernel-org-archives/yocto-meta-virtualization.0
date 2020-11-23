Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.30886.1606110074377018506
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Nov 2020 21:41:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 20FFD38C0532
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 05:41:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,361,1599494400"; 
   d="scan'208";a="101645240"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Nov 2020 13:40:51 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 8BDC24CE1505
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 13:40:46 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 23 Nov 2020 13:40:44 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-keyring: Remove RDEPENDS
Date: Mon, 23 Nov 2020 22:40:44 +0800
Message-ID: <1606142444-3585-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 8BDC24CE1505.A591B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python3 no longer provides python3-typing package, it is removed from RDEPENDS.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python3-keyring_21.5.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python3-keyring_21.5.0.bb b/meta-openstack/recipes-devtools/python/python3-keyring_21.5.0.bb
index 59e6dbf1..d7565fd6 100644
--- a/meta-openstack/recipes-devtools/python/python3-keyring_21.5.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-keyring_21.5.0.bb
@@ -18,5 +18,4 @@ DEPENDS += " \
 RDEPENDS_${PN} = " \
 	python3-logging \
 	python3-importlib-metadata \
-	python3-typing \
 "
-- 
2.25.1



