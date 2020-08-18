Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.63090.1597743683691918562
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Aug 2020 02:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9002DE02034; Tue, 18 Aug 2020 02:41:23 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76218E02031
	for <meta-virtualization@yoctoproject.org>; Tue, 18 Aug 2020 02:41:20 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,326,1592841600"; 
   d="scan'208";a="98222508"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Aug 2020 17:41:19 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 4A7E24CE34F9
	for <meta-virtualization@yoctoproject.org>; Tue, 18 Aug 2020 17:41:13 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 18 Aug 2020 17:41:12 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [PATCH] [meta-virtualization] [PATCH] python3-xstatic-angular-lrdragndrop: upgrade 1.0.2.2 -> 1.0.2.4
Date: Wed, 19 Aug 2020 02:41:17 +0800
Message-ID: <1597776077-10674-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 4A7E24CE34F9.A9BBF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

-License-Update: Update PKG-INFO.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
---
 ....bb => python3-xstatic-angular-lrdragndrop_1.0.2.4.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-angular-lrdragndrop_1.0.2.2.bb => python3-xstatic-angular-lrdragndrop_1.0.2.4.bb} (57%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-lrdragndrop_1.0.2.2.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-lrdragndrop_1.0.2.4.bb
similarity index 57%
rename from meta-openstack/recipes-devtools/python/python-xstatic-angular-lrdragndrop_1.0.2.2.bb
rename to meta-openstack/recipes-devtools/python/python3-xstatic-angular-lrdragndrop_1.0.2.4.bb
index c754ef4..4946357 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-lrdragndrop_1.0.2.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-lrdragndrop_1.0.2.4.bb
@@ -2,17 +2,17 @@ DESCRIPTION = "LrDragNDrop javascript library packaged for setuptools3"
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-lrdragndrop"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=92d5d5d8e51c0c2f4f6db4a084a59173"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a1d98e7268455ffeb218786128e982dd"
 
 PYPI_PACKAGE = "XStatic-Angular-lrdragndrop"
 
-SRC_URI[md5sum] = "afd682cab9f436cf22b025dfcabaa225"
-SRC_URI[sha256sum] = "1cf04495981db5dfd5536441e17ec69bb18d624f847ddc203f3259d81b10a77e"
+SRC_URI[md5sum] = "6c6c7969bfa89701db2b316162b36291"
+SRC_URI[sha256sum] = "5d3cce15a6342814811ddc372c6035bf4026253664c0b72a660b481cb183ae1b"
 
 inherit setuptools3 pypi
 
 DEPENDS += " \
-        python-pip \
+        python3-pip \
         "
 
 RDEPENDS_${PN} += " \
-- 
2.25.1



