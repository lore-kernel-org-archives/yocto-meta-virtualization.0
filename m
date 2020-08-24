Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.190481.1598257658968866289
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 01:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D1E2AE02087; Mon, 24 Aug 2020 01:27:38 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2AF67E0203E
	for <meta-virtualization@yoctoproject.org>; Mon, 24 Aug 2020 01:27:37 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,347,1592841600"; 
   d="scan'208";a="98453362"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Aug 2020 16:27:37 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id B332F48990D6
	for <meta-virtualization@yoctoproject.org>; Mon, 24 Aug 2020 16:27:35 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 24 Aug 2020 16:27:36 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-xstatic-angular-gettext: upgrade 2.3.8.0 -> 2.4.1.0
Date: Tue, 25 Aug 2020 01:27:41 +0800
Message-ID: <1598290061-121886-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: B332F48990D6.A80A8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
---
 .../python/python-xstatic-angular-gettext_2.3.8.0.bb        | 2 --
 .../python/python3-xstatic-angular-gettext_2.3.8.0.bb       | 2 --
 ...ttext.inc => python3-xstatic-angular-gettext_2.4.1.0.bb} | 6 +++---
 3 files changed, 3 insertions(+), 7 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-gettext_2.3.8.0.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-xstatic-angular-gettext_2.3.8.0.bb
 rename meta-openstack/recipes-devtools/python/{python-xstatic-angular-gettext.inc => python3-xstatic-angular-gettext_2.4.1.0.bb} (71%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-gettext_2.3.8.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-angular-gettext_2.3.8.0.bb
deleted file mode 100644
index 48b75aa..0000000
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-gettext_2.3.8.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-xstatic-angular-gettext.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-angular-gettext_2.3.8.0.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-gettext_2.3.8.0.bb
deleted file mode 100644
index 48b75aa..0000000
--- a/meta-openstack/recipes-devtools/python/python3-xstatic-angular-gettext_2.3.8.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-xstatic-angular-gettext.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-gettext.inc b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-gettext_2.4.1.0.bb
similarity index 71%
rename from meta-openstack/recipes-devtools/python/python-xstatic-angular-gettext.inc
rename to meta-openstack/recipes-devtools/python/python3-xstatic-angular-gettext_2.4.1.0.bb
index be9cce3..670891a 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-gettext.inc
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-gettext_2.4.1.0.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 PYPI_PACKAGE = "XStatic-Angular-Gettext"
 
-SRC_URI[md5sum] = "de55242cf5dc5fa712ac7e4a53aeb12b"
-SRC_URI[sha256sum] = "18db14dccaae5d64a9b66d08d0134b6c154fc1fb1e216964bba8e403e03c870e"
+SRC_URI[md5sum] = "6552973138d37609c776d2d8a049aabe"
+SRC_URI[sha256sum] = "883192c9273b2d1b8dc69e605845f0d3a267698955e55dcde0e3a4defeae385b"
 
-inherit pypi
+inherit setuptools3 pypi
 
 DEPENDS += " \
         ${PYTHON_PN}-pip \
-- 
2.25.1



