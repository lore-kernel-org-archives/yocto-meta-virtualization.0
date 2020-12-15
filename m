Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.7783.1608016930993307650
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Dec 2020 23:22:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 735AF38C09BD
	for <meta-virtualization@yoctoproject.org>; Tue, 15 Dec 2020 07:22:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; 
   d="scan'208";a="102408289"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Dec 2020 15:22:09 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id EB7274CE546D
	for <meta-virtualization@yoctoproject.org>; Tue, 15 Dec 2020 15:22:04 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 15 Dec 2020 15:22:04 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH 5/7] python3-django-pyscss: Change to python3
Date: Tue, 15 Dec 2020 15:22:06 +0800
Message-ID: <1608016926-55793-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: EB7274CE546D.A7186
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



