Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.62507.1597743705443902152
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Aug 2020 02:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 507C4E02034; Tue, 18 Aug 2020 02:41:45 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 736D7E02031
	for <meta-virtualization@yoctoproject.org>; Tue, 18 Aug 2020 02:41:44 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,326,1592841600"; 
   d="scan'208";a="98222554"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Aug 2020 17:41:44 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id A64B34CE34E2
	for <meta-virtualization@yoctoproject.org>; Tue, 18 Aug 2020 17:41:40 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 18 Aug 2020 17:41:39 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-xstatic-mdi: upgrade 1.4.57.0 -> 1.6.50.2
Date: Wed, 19 Aug 2020 02:41:44 +0800
Message-ID: <1597776104-10786-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: A64B34CE34E2.A8942
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

-License-Update: Update PKG-INFO.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
---
 ...ic-mdi_1.4.57.0.bb => python3-xstatic-mdi_1.6.50.2.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-mdi_1.4.57.0.bb => python3-xstatic-mdi_1.6.50.2.bb} (56%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-mdi_1.4.57.0.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-mdi_1.6.50.2.bb
similarity index 56%
rename from meta-openstack/recipes-devtools/python/python-xstatic-mdi_1.4.57.0.bb
rename to meta-openstack/recipes-devtools/python/python3-xstatic-mdi_1.6.50.2.bb
index 9ea1473..3354f47 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-mdi_1.4.57.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-mdi_1.6.50.2.bb
@@ -2,17 +2,17 @@ DESCRIPTION = "mdi javascript library packaged for setuptools3 (easy_install) /
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-mdi"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=898ae9ca7b59edc4521f10be07c6b622"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=af9320964a0ddf3bd33eccd79c29f964"
 
 PYPI_PACKAGE = "XStatic-mdi"
 
-SRC_URI[md5sum] = "f3d3d58603178e5898ee1ea4737826ee"
-SRC_URI[sha256sum] = "19b4d522f8fa62fee2893b39147fcf45ebaba8b95d63f3708ebdf34e130a8a53"
+SRC_URI[md5sum] = "aa720e603fce607681cc69989fbd41a9"
+SRC_URI[sha256sum] = "be1005af7a593b0b3a349aadb05e4160ea65894248a47b246c6658345e2f10c1"
 
 inherit setuptools3 pypi
 
 DEPENDS += " \
-        python-pip \
+        python3-pip \
         "
 
 RDEPENDS_${PN} += " \
-- 
2.25.1



