Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.62988.1597743688835671892
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Aug 2020 02:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AEB48E02034; Tue, 18 Aug 2020 02:41:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 91841E02031
	for <meta-virtualization@yoctoproject.org>; Tue, 18 Aug 2020 02:41:25 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,326,1592841600"; 
   d="scan'208";a="98222523"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Aug 2020 17:41:25 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 9574A4CE34F5
	for <meta-virtualization@yoctoproject.org>; Tue, 18 Aug 2020 17:41:19 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 18 Aug 2020 17:41:19 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-xstatic-angular-mock: change to python3
Date: Wed, 19 Aug 2020 02:41:23 +0800
Message-ID: <1597776083-10713-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 9574A4CE34F5.A958B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
---
 ...ock_1.2.1.1.bb => python3-xstatic-angular-mock_1.2.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-angular-mock_1.2.1.1.bb => python3-xstatic-angular-mock_1.2.1.1.bb} (91%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-mock_1.2.1.1.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-mock_1.2.1.1.bb
similarity index 91%
rename from meta-openstack/recipes-devtools/python/python-xstatic-angular-mock_1.2.1.1.bb
rename to meta-openstack/recipes-devtools/python/python3-xstatic-angular-mock_1.2.1.1.bb
index 727d5b0..505a637 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-mock_1.2.1.1.bb
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-mock_1.2.1.1.bb
@@ -11,10 +11,10 @@ SRC_URI[sha256sum] = "ffee6edfab8276abd8057ddc28c4d8503424c0c61938e787720766862e
 
 inherit setuptools3 pypi
 
-# DEPENDS_default: python-pip
+# DEPENDS_default: python3-pip
 
 DEPENDS += " \
-        python-pip \
+        python3-pip \
         "
 
 # RDEPENDS_default: 
-- 
2.25.1



