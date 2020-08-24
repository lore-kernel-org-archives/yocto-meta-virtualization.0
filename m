Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.191069.1598256511430101248
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 01:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4EE53E02085; Mon, 24 Aug 2020 01:08:31 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 903C4E02085
	for <meta-virtualization@yoctoproject.org>; Mon, 24 Aug 2020 01:08:28 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,347,1592841600"; 
   d="scan'208";a="98452449"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Aug 2020 16:08:20 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id C862C48990DD
	for <meta-virtualization@yoctoproject.org>; Mon, 24 Aug 2020 16:08:18 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 24 Aug 2020 16:08:21 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-xstatic-angular: Change python3 recipe
Date: Tue, 25 Aug 2020 04:08:13 +0800
Message-ID: <1598299693-63275-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598299693-63275-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1598299693-63275-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: C862C48990DD.A4A70
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...ic-angular_1.5.8.0.bb => python3-xstatic-angular_1.5.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-angular_1.5.8.0.bb => python3-xstatic-angular_1.5.8.0.bb} (96%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular_1.5.8.0.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-angular_1.5.8.0.bb
similarity index 96%
rename from meta-openstack/recipes-devtools/python/python-xstatic-angular_1.5.8.0.bb
rename to meta-openstack/recipes-devtools/python/python3-xstatic-angular_1.5.8.0.bb
index 8671b8b..c04c4ea 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular_1.5.8.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-angular_1.5.8.0.bb
@@ -14,7 +14,7 @@ inherit setuptools3 pypi
 # DEPENDS_default: python-pip
 
 DEPENDS += " \
-        python-pip \
+        python3-pip \
         "
 
 # RDEPENDS_default: 
-- 
2.25.1



