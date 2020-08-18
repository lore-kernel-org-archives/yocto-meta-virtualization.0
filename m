Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.61973.1597737037567102628
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Aug 2020 00:50:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6FDF7E02034; Tue, 18 Aug 2020 00:50:37 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EBF2EE02033
	for <meta-virtualization@yoctoproject.org>; Tue, 18 Aug 2020 00:50:34 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,326,1592841600"; 
   d="scan'208";a="98217648"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Aug 2020 15:50:33 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 381F94CE34F9
	for <meta-virtualization@yoctoproject.org>; Tue, 18 Aug 2020 15:50:29 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 18 Aug 2020 15:50:28 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-xstatic-jquery: upgrade 1.10.2.1 -> 3.4.1.0
Date: Wed, 19 Aug 2020 03:50:02 +0800
Message-ID: <1597780202-92964-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1597780202-92964-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1597780202-92964-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 381F94CE34F9.A4C0E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-xstatic-jquery_1.10.2.1.bb              | 2 --
 .../python/python3-xstatic-jquery_1.10.2.1.bb             | 2 --
 ...tatic-jquery.inc => python3-xstatic-jquery_3.4.1.0.bb} | 8 ++++----
 3 files changed, 4 insertions(+), 8 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-jquery_1.10.2.1.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-xstatic-jquery_1.10.2.1.bb
 rename meta-openstack/recipes-devtools/python/{python-xstatic-jquery.inc => python3-xstatic-jquery_3.4.1.0.bb} (65%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jquery_1.10.2.1.bb b/meta-openstack/recipes-devtools/python/python-xstatic-jquery_1.10.2.1.bb
deleted file mode 100644
index efbb9e3..0000000
--- a/meta-openstack/recipes-devtools/python/python-xstatic-jquery_1.10.2.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-xstatic-jquery.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-jquery_1.10.2.1.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-jquery_1.10.2.1.bb
deleted file mode 100644
index efbb9e3..0000000
--- a/meta-openstack/recipes-devtools/python/python3-xstatic-jquery_1.10.2.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-xstatic-jquery.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jquery.inc b/meta-openstack/recipes-devtools/python/python3-xstatic-jquery_3.4.1.0.bb
similarity index 65%
rename from meta-openstack/recipes-devtools/python/python-xstatic-jquery.inc
rename to meta-openstack/recipes-devtools/python/python3-xstatic-jquery_3.4.1.0.bb
index db8e2a2..b68654f 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-jquery.inc
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-jquery_3.4.1.0.bb
@@ -6,12 +6,12 @@ LIC_FILES_CHKSUM = "file://README.txt;md5=af1f21066b501c7d9265fab0d5556ece"
 
 PYPI_PACKAGE = "XStatic-jQuery"
 
-SRC_URI[md5sum] = "7a29efeab6961ef00ea2272c923f4503"
-SRC_URI[sha256sum] = "83416a6bb86e8534858c4d1ddca45e881c87639da6f78000c28c3a193fe91305"
+SRC_URI[md5sum] = "8b7ace314d6780e159b2c03cd93a4b5b"
+SRC_URI[sha256sum] = "3fccac7eb265f95430c62eb652cdaeb671785267c77413df926d9facd5825978"
 
-inherit pypi
+inherit setuptools3 pypi
 
-# DEPENDS_default: python-pip
+# DEPENDS_default: python3-pip
 
 DEPENDS += " \
         ${PYTHON_PN}-pip \
-- 
2.25.1



