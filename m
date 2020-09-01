Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.4662.1598928380507452517
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Aug 2020 19:46:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 00DC3E020F0; Mon, 31 Aug 2020 19:46:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06E0CE020EE
	for <meta-virtualization@yoctoproject.org>; Mon, 31 Aug 2020 19:46:18 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,377,1592841600"; 
   d="scan'208";a="98755749"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Sep 2020 10:46:14 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id A419948990D9
	for <meta-virtualization@yoctoproject.org>; Tue,  1 Sep 2020 10:46:13 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 1 Sep 2020 10:46:12 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-django-nose: Change to python3
Date: Tue, 1 Sep 2020 10:46:03 +0800
Message-ID: <1598928363-124309-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: A419948990D9.A6819
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Because python is no longer maintained, delete the python2 version of the recipe and change to python3.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...python-django-nose_1.4.bb => python3-django-nose_1.4.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-django-nose_1.4.bb => python3-django-nose_1.4.bb} (87%)

diff --git a/meta-openstack/recipes-devtools/python/python-django-nose_1.4.bb b/meta-openstack/recipes-devtools/python/python3-django-nose_1.4.bb
similarity index 87%
rename from meta-openstack/recipes-devtools/python/python-django-nose_1.4.bb
rename to meta-openstack/recipes-devtools/python/python3-django-nose_1.4.bb
index 1e7ccd6..530332f 100644
--- a/meta-openstack/recipes-devtools/python/python-django-nose_1.4.bb
+++ b/meta-openstack/recipes-devtools/python/python3-django-nose_1.4.bb
@@ -13,11 +13,11 @@ SRC_URI[sha256sum] = "26cef3c6f62df2eee955a25195de6f793881317c0f5fd1a1c6f9e22f35
 inherit setuptools3 pypi
 
 DEPENDS += " \
-        python-pip \
+        python3-pip \
         "
 
 RDEPENDS_${PN} += " \
-        python-django \
-        python-nose \
+        python3-django \
+        python3-nose \
         "
 
-- 
2.25.1



