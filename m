Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.3911.1605589931720248373
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Nov 2020 21:12:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 3B5E138C051C
	for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 05:12:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.77,484,1596470400"; 
   d="scan'208";a="101445922"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 17 Nov 2020 13:12:10 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id E57B74CE5455
	for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 13:12:07 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 17 Nov 2020 13:12:06 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH 5/7] python3-django-pyscss: Change to python3
Date: Tue, 17 Nov 2020 22:12:06 +0800
Message-ID: <1605622326-3580-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: E57B74CE5455.A8EBD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...ngo-pyscss_2.0.2.bb => python3-django-pyscss_2.0.2.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-django-pyscss_2.0.2.bb => python3-django-pyscss_2.0.2.bb} (82%)

diff --git a/meta-openstack/recipes-devtools/python/python-django-pyscss_2.0.2.bb b/meta-openstack/recipes-devtools/python/python3-django-pyscss_2.0.2.bb
similarity index 82%
rename from meta-openstack/recipes-devtools/python/python-django-pyscss_2.0.2.bb
rename to meta-openstack/recipes-devtools/python/python3-django-pyscss_2.0.2.bb
index 7438327b..0d6cc417 100644
--- a/meta-openstack/recipes-devtools/python/python-django-pyscss_2.0.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-django-pyscss_2.0.2.bb
@@ -12,12 +12,12 @@ inherit setuptools3 pypi
 # DEPENDS_default: python-pip
 
 DEPENDS += " \
-        python-pip \
+        python3-pip \
         "
 
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
-        python-django \
-        python-pyscss \        
-        python-pathlib \
+        python3-django \
+        python3-pyscss \        
+        python3-pathlib \
         "
-- 
2.25.1



