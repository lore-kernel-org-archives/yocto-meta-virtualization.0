Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.9011.1600420904526768662
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Sep 2020 02:21:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 09DA838C084A
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 02:21:43 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,274,1596470400"; 
   d="scan'208";a="99403847"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Sep 2020 17:21:43 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id AECDA48990D9
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 17:21:41 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Sep 2020 17:21:41 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-xstatic-jsencrypt: Change to python3
Date: Sat, 19 Sep 2020 05:21:44 +0800
Message-ID: <1600464104-31619-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: AECDA48990D9.A1534
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python2 is no longer maintained, bb file is changed to python3 version.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...sencrypt_2.3.1.1.bb => python3-xstatic-jsencrypt_2.3.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-jsencrypt_2.3.1.1.bb => python3-xstatic-jsencrypt_2.3.1.1.bb} (96%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jsencrypt_2.3.1.1.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-jsencrypt_2.3.1.1.bb
similarity index 96%
rename from meta-openstack/recipes-devtools/python/python-xstatic-jsencrypt_2.3.1.1.bb
rename to meta-openstack/recipes-devtools/python/python3-xstatic-jsencrypt_2.3.1.1.bb
index 5c21816..05b3dba 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-jsencrypt_2.3.1.1.bb
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-jsencrypt_2.3.1.1.bb
@@ -14,7 +14,7 @@ inherit setuptools3 pypi
 # DEPENDS_default: python-pip
 
 DEPENDS += " \
-        python-pip \
+        python3-pip \
         "
 
 # RDEPENDS_default: 
-- 
2.25.1



