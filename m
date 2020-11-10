Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.21724.1604971338091184524
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 17:22:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4310538C0706
	for <meta-virtualization@yoctoproject.org>; Mon,  9 Nov 2020 17:22:17 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.77,464,1596470400"; 
   d="scan'208";a="101121896"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 10 Nov 2020 09:22:15 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 2CC2A4CE4B23
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Nov 2020 09:22:15 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 10 Nov 2020 09:22:14 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-repoze.lru: Add RDEPENDS
Date: Tue, 10 Nov 2020 09:22:14 +0800
Message-ID: <1604971334-79950-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2CC2A4CE4B23.A3C07
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-repoze.lru_0.7.bb         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python3-repoze.lru_0.7.bb b/meta-openstack/recipes-devtools/python/python3-repoze.lru_0.7.bb
index 323ad767..e709bd71 100644
--- a/meta-openstack/recipes-devtools/python/python3-repoze.lru_0.7.bb
+++ b/meta-openstack/recipes-devtools/python/python3-repoze.lru_0.7.bb
@@ -12,3 +12,7 @@ SRC_URI[md5sum] = "c08cc030387e0b1fc53c5c7d964b35e2"
 SRC_URI[sha256sum] = "0429a75e19380e4ed50c0694e26ac8819b4ea7851ee1fc7583c8572db80aff77"
 
 inherit setuptools3 pypi
+
+RDEPENDS_${PN} += " \
+	python3-typing \
+"
-- 
2.25.1



