Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.30273.1606108211055624723
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Nov 2020 21:10:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8804A38C0532
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 05:10:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,361,1599494400"; 
   d="scan'208";a="101644464"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Nov 2020 13:10:03 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 86A954CE1505
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 13:09:57 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 23 Nov 2020 13:09:59 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH 1/5] python3-dogpile.cache: ADD RDEPENDS
Date: Mon, 23 Nov 2020 22:51:03 +0800
Message-ID: <1606143063-96608-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 86A954CE1505.A0FE1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-dogpile.cache_1.0.2.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.0.2.bb b/meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.0.2.bb
index 82057a6c..21b596fc 100644
--- a/meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.0.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.0.2.bb
@@ -9,6 +9,11 @@ SRC_URI[sha256sum] = "64fda39d25b46486a4876417ca03a4af06f35bfadba9f59613f9b3d748
 
 inherit setuptools3 pypi
 
-RDEPENDS_${PN} += "python3-decorator"
+RDEPENDS_${PN} += " \
+	python3-decorator \
+	python3-logging \
+	python3-numbers \
+	python3-stevedore \
+"
 
 
-- 
2.25.1



