Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.61910.1597737043090371836
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Aug 2020 00:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EBB7BE02033; Tue, 18 Aug 2020 00:50:42 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B70CE02031
	for <meta-virtualization@yoctoproject.org>; Tue, 18 Aug 2020 00:50:34 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,326,1592841600"; 
   d="scan'208";a="98217647"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Aug 2020 15:50:33 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 3C9994CE34DE
	for <meta-virtualization@yoctoproject.org>; Tue, 18 Aug 2020 15:50:28 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 18 Aug 2020 15:50:27 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [PATCH] [meta-virtualization] [PATCH] python3-xstatic-jquery.tablesorter: upgrade 2.14.5.1 -> 2.14.5.2
Date: Wed, 19 Aug 2020 03:50:01 +0800
Message-ID: <1597780202-92964-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1597780202-92964-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1597780202-92964-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3C9994CE34DE.A3DC7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

-License-Update: Update PKG-INFO.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ... => python3-xstatic-jquery.tablesorter_2.14.5.2.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-jquery.tablesorter_2.14.5.1.bb => python3-xstatic-jquery.tablesorter_2.14.5.2.bb} (56%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jquery.tablesorter_2.14.5.1.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-jquery.tablesorter_2.14.5.2.bb
similarity index 56%
rename from meta-openstack/recipes-devtools/python/python-xstatic-jquery.tablesorter_2.14.5.1.bb
rename to meta-openstack/recipes-devtools/python/python3-xstatic-jquery.tablesorter_2.14.5.2.bb
index 7ede3bf..6ec6988 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-jquery.tablesorter_2.14.5.1.bb
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-jquery.tablesorter_2.14.5.2.bb
@@ -2,19 +2,19 @@ DESCRIPTION = "JQuery.TableSorter JavaScript library packaged for setuptools3"
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-JQuery.TableSorter"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a9ef3319547ce4563718db4b4657fb94"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e9d3f27b721fc196b019f8afb6f639a0"
 
 PYPI_PACKAGE = "XStatic-JQuery.TableSorter"
 
-SRC_URI[md5sum] = "fc05a6731b6ac3f6489b893f96a5d29a"
-SRC_URI[sha256sum] = "3ba24aecd9a3dc71a79dd4096fa5a8a041c3a7b892c61d05e6e46de0605070f0"
+SRC_URI[md5sum] = "024a8dd83aa173ec0b161e76391ba56c"
+SRC_URI[sha256sum] = "bdd847ca0cde4014fd21134f99e59a99ef488185c745e82646911d2f9de3d762"
 
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



