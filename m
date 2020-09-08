Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.12043.1599532943408396789
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Sep 2020 19:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id DB7A238C0894
	for <meta-virtualization@yoctoproject.org>; Mon,  7 Sep 2020 19:42:22 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,404,1592841600"; 
   d="scan'208";a="98988910"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Sep 2020 10:42:20 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 94B5F48990E7
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Sep 2020 10:42:18 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Sep 2020 10:42:17 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-ddjango-compressor: Change to python3
Date: Tue, 8 Sep 2020 10:42:13 +0800
Message-ID: <1599532933-124300-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 94B5F48990E7.A95EC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python2 is no longer maintained, bb file is changed to python3 version.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...o-compressor_2.1.bb => python3-django-compressor_2.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-django-compressor_2.1.bb => python3-django-compressor_2.1.bb} (90%)

diff --git a/meta-openstack/recipes-devtools/python/python-django-compressor_2.1.bb b/meta-openstack/recipes-devtools/python/python3-django-compressor_2.1.bb
similarity index 90%
rename from meta-openstack/recipes-devtools/python/python-django-compressor_2.1.bb
rename to meta-openstack/recipes-devtools/python/python3-django-compressor_2.1.bb
index f6e73dd..40a0133 100644
--- a/meta-openstack/recipes-devtools/python/python-django-compressor_2.1.bb
+++ b/meta-openstack/recipes-devtools/python/python3-django-compressor_2.1.bb
@@ -12,9 +12,9 @@ SRC_URI[sha256sum] = "ae0051bc0c7a0660c93434e68d617553fccdd573293dfd15aa33f78d2b
 inherit setuptools3 pypi
 
 RDEPENDS_${PN} += " \
-        python-django-appconf  \
-        python-rcssmin  \
-        python-rjsmin  \
+        python3-django-appconf  \
+        python3-rcssmin  \
+        python3-rjsmin  \
         "
 
 do_install_append() {
-- 
2.25.1



