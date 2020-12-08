Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.4367.1607403695237945280
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Dec 2020 21:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id B310538C0858
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Dec 2020 05:01:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="102163584"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Dec 2020 13:01:20 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 934CC4CE6011
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Dec 2020 13:01:20 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Dec 2020 13:01:20 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-django-nose: upgrade 1.4 -> 1.4.7
Date: Tue, 8 Dec 2020 13:01:20 +0800
Message-ID: <1607403680-56464-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 934CC4CE6011.A588A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...thon3-django-nose_1.4.bb => python3-django-nose_1.4.7.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-django-nose_1.4.bb => python3-django-nose_1.4.7.bb} (72%)

diff --git a/meta-openstack/recipes-devtools/python/python3-django-nose_1.4.bb b/meta-openstack/recipes-devtools/python/python3-django-nose_1.4.7.bb
similarity index 72%
rename from meta-openstack/recipes-devtools/python/python3-django-nose_1.4.bb
rename to meta-openstack/recipes-devtools/python/python3-django-nose_1.4.7.bb
index 530332f8..bea4bd7a 100644
--- a/meta-openstack/recipes-devtools/python/python3-django-nose_1.4.bb
+++ b/meta-openstack/recipes-devtools/python/python3-django-nose_1.4.7.bb
@@ -7,8 +7,8 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7f88f52f66738ec7259424ce46e855c2"
 
-SRC_URI[md5sum] = "2713d95286ea49860458a312d2efe653"
-SRC_URI[sha256sum] = "26cef3c6f62df2eee955a25195de6f793881317c0f5fd1a1c6f9e22f351a9313"
+SRC_URI[md5sum] = "fe386c6e218b0f7b353494329c380a79"
+SRC_URI[sha256sum] = "a4885cd002d65fd2de96e2bb2563ef477c3fbe207009360c015fca5c3b5561b7"
 
 inherit setuptools3 pypi
 
@@ -19,5 +19,6 @@ DEPENDS += " \
 RDEPENDS_${PN} += " \
         python3-django \
         python3-nose \
+        python3-misc \
         "
 
-- 
2.25.1



