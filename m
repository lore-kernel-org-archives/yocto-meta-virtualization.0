Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.12610.1601349647500875319
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Sep 2020 20:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 054F838C06F7
	for <meta-virtualization@yoctoproject.org>; Mon, 28 Sep 2020 20:20:46 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,316,1596470400"; 
   d="scan'208";a="99698558"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Sep 2020 11:20:46 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 0680948990D4
	for <meta-virtualization@yoctoproject.org>; Tue, 29 Sep 2020 11:20:41 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 29 Sep 2020 11:20:38 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-xstatic-objectpath: change to python3
Date: Tue, 29 Sep 2020 11:20:38 +0800
Message-ID: <1601349638-108654-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 0680948990D4.A1FC7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python2 is no longer maintained, bb file is changed to python3 version.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...ectpath_1.2.1.0.bb => python3-xstatic-objectpath_1.2.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-objectpath_1.2.1.0.bb => python3-xstatic-objectpath_1.2.1.0.bb} (96%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-objectpath_1.2.1.0.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-objectpath_1.2.1.0.bb
similarity index 96%
rename from meta-openstack/recipes-devtools/python/python-xstatic-objectpath_1.2.1.0.bb
rename to meta-openstack/recipes-devtools/python/python3-xstatic-objectpath_1.2.1.0.bb
index bd2eefa..faf2858 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-objectpath_1.2.1.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-objectpath_1.2.1.0.bb
@@ -14,7 +14,7 @@ inherit setuptools3 pypi
 # DEPENDS_default: python-pip
 
 DEPENDS += " \
-        python-pip \
+        python3-pip \
         "
 
 # RDEPENDS_default: 
-- 
2.25.1



