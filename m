Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.62992.1597743700866813811
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Aug 2020 02:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B51B1E02034; Tue, 18 Aug 2020 02:41:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63B90E02031
	for <meta-virtualization@yoctoproject.org>; Tue, 18 Aug 2020 02:41:39 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,326,1592841600"; 
   d="scan'208";a="98222550"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Aug 2020 17:41:38 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id D57774CE38AA
	for <meta-virtualization@yoctoproject.org>; Tue, 18 Aug 2020 17:41:34 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 18 Aug 2020 17:41:34 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-xstatic-magic-search: upgrade 0.2.5.1 -> 0.2.5.2
Date: Wed, 19 Aug 2020 02:41:31 +0800
Message-ID: <1597776091-10750-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: D57774CE38AA.AAE98
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

-License-Update: Update PKG-INFO.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
---
 ...h_0.2.5.1.bb => python3-xstatic-magic-search_0.2.5.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-magic-search_0.2.5.1.bb => python3-xstatic-magic-search_0.2.5.2.bb} (61%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-magic-search_0.2.5.1.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-magic-search_0.2.5.2.bb
similarity index 61%
rename from meta-openstack/recipes-devtools/python/python-xstatic-magic-search_0.2.5.1.bb
rename to meta-openstack/recipes-devtools/python/python3-xstatic-magic-search_0.2.5.2.bb
index 06a5ffc..1bc1457 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-magic-search_0.2.5.1.bb
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-magic-search_0.2.5.2.bb
@@ -2,12 +2,12 @@ DESCRIPTION = "An AngularJS directive that provides a UI for both faceted filter
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Magic-Search"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e3d8469611ec04e52d71f2e293d54e9c"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=ed1f7d184ee839074df6b44c744de2c0"
 
 PYPI_PACKAGE = "XStatic-Magic-Search"
 
-SRC_URI[md5sum] = "cfb8a82129fffbe1f5c6339240cb6139"
-SRC_URI[sha256sum] = "9b2f35a5792f4e763e6dc319036e3676f3e18f46153096f3ab5e507177ec007e"
+SRC_URI[md5sum] = "7edce59ce76a326b618f74f797498451"
+SRC_URI[sha256sum] = "e72fcf08e7806b60cb6b120fb712c8d221f3ba53c12a10995da01e16fa5360f5"
 
 inherit setuptools3 pypi
 
-- 
2.25.1



