Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.7859.1608016924360232110
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Dec 2020 23:22:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id D50F538C09BD
	for <meta-virtualization@yoctoproject.org>; Tue, 15 Dec 2020 07:22:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; 
   d="scan'208";a="102408282"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Dec 2020 15:22:03 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id E8F724CE546D
	for <meta-virtualization@yoctoproject.org>; Tue, 15 Dec 2020 15:21:56 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 15 Dec 2020 15:21:55 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH 4/7] python3-paste: remove RDEPENDS
Date: Tue, 15 Dec 2020 15:21:42 +0800
Message-ID: <1608016902-55756-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: E8F724CE546D.A922C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python3 no longer provides python3-typing package, it is removed from RDEPENDS.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python3-paste_3.5.0.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python3-paste_3.5.0.bb b/meta-openstack/recipes-devtools/python/python3-paste_3.5.0.bb
index 2be69ea2..086766d4 100644
--- a/meta-openstack/recipes-devtools/python/python3-paste_3.5.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-paste_3.5.0.bb
@@ -10,7 +10,3 @@ SRC_URI[md5sum] = "90c56e0f84c58ca4841c0df0bcfc11d9"
 SRC_URI[sha256sum] = "1b095c42dc91d426f3ae85101796b14d265887f8f36f3aad143a5f29effdc39d"
 
 inherit setuptools3 pypi
-
-RDEPENDS_${PN} += " \
-	python3-typing \
-"
-- 
2.25.1



