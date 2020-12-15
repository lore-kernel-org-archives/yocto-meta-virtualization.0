Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.7788.1608016899351686363
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Dec 2020 23:21:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id D00D038C11E3
	for <meta-virtualization@yoctoproject.org>; Tue, 15 Dec 2020 07:21:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; 
   d="scan'208";a="102408257"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Dec 2020 15:21:38 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id CC01B4CE600B
	for <meta-virtualization@yoctoproject.org>; Tue, 15 Dec 2020 15:21:33 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 15 Dec 2020 15:21:32 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH 3/7] python3-repoze.lru: change RDEPENDS
Date: Tue, 15 Dec 2020 15:21:35 +0800
Message-ID: <1608016895-55720-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: CC01B4CE600B.A8AFD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python3 no longer provides python3-typing package, so modify RDEPENDS.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-repoze.lru_0.7.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python3-repoze.lru_0.7.bb b/meta-openstack/recipes-devtools/python/python3-repoze.lru_0.7.bb
index e709bd71..0f782eea 100644
--- a/meta-openstack/recipes-devtools/python/python3-repoze.lru_0.7.bb
+++ b/meta-openstack/recipes-devtools/python/python3-repoze.lru_0.7.bb
@@ -14,5 +14,5 @@ SRC_URI[sha256sum] = "0429a75e19380e4ed50c0694e26ac8819b4ea7851ee1fc7583c8572db8
 inherit setuptools3 pypi
 
 RDEPENDS_${PN} += " \
-	python3-typing \
+	python3-netclient \
 "
-- 
2.25.1



