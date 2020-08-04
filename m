Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.1119.1596528779935270771
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Aug 2020 01:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C9601E01F7C; Tue,  4 Aug 2020 01:12:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A745E01F7C
	for <meta-virtualization@yoctoproject.org>; Tue,  4 Aug 2020 01:12:51 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,433,1589212800"; 
   d="scan'208";a="97579941"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Aug 2020 16:12:50 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id D2BB24CE5455
	for <meta-virtualization@yoctoproject.org>; Tue,  4 Aug 2020 16:12:48 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 4 Aug 2020 16:12:48 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-termcolor: Change to python3
Date: Wed, 5 Aug 2020 01:12:35 +0800
Message-ID: <1596561155-7900-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: D2BB24CE5455.AAA95
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
---
 .../{python-termcolor_1.1.0.bb => python3-termcolor_1.1.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-openstack/recipes-devtools/python/{python-termcolor_1.1.0.bb => python3-termcolor_1.1.0.bb} (95%)

diff --git a/meta-openstack/recipes-devtools/python/python-termcolor_1.1.0.bb b/meta-openstack/recipes-devtools/python/python3-termcolor_1.1.0.bb
similarity index 95%
rename from meta-openstack/recipes-devtools/python/python-termcolor_1.1.0.bb
rename to meta-openstack/recipes-devtools/python/python3-termcolor_1.1.0.bb
index 8c59049..a8d5009 100644
--- a/meta-openstack/recipes-devtools/python/python-termcolor_1.1.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-termcolor_1.1.0.bb
@@ -13,6 +13,6 @@ SRC_URI[sha256sum] = "1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02
 inherit distutils3 pypi
 
 DEPENDS += " \
-        python-pip \
+        python3-pip \
         "
 
-- 
2.25.1



