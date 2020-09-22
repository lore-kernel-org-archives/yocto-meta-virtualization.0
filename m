Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.4586.1600741718556664672
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Sep 2020 19:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 135DD38C0848
	for <meta-virtualization@yoctoproject.org>; Mon, 21 Sep 2020 19:28:37 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,288,1596470400"; 
   d="scan'208";a="99489051"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Sep 2020 10:28:37 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id DA49A48990E9
	for <meta-virtualization@yoctoproject.org>; Tue, 22 Sep 2020 10:28:36 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 22 Sep 2020 10:28:34 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-mimeparse: upgrade 0.1.4 -> 1.6.0
Date: Tue, 22 Sep 2020 10:28:28 +0800
Message-ID: <1600741708-124363-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: DA49A48990E9.A7276
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python2 is no longer maintained, bb file is changed to python3 version.
-License-Update:Because README file does not exist in the latest version, choose PKG-INFO file to verify.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...mimeparse_0.1.4.bb => python3-mimeparse_1.6.0.bb} | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-mimeparse_0.1.4.bb => python3-mimeparse_1.6.0.bb} (55%)

diff --git a/meta-openstack/recipes-devtools/python/python-mimeparse_0.1.4.bb b/meta-openstack/recipes-devtools/python/python3-mimeparse_1.6.0.bb
similarity index 55%
rename from meta-openstack/recipes-devtools/python/python-mimeparse_0.1.4.bb
rename to meta-openstack/recipes-devtools/python/python3-mimeparse_1.6.0.bb
index c9b17ff..9d8f9e2 100644
--- a/meta-openstack/recipes-devtools/python/python-mimeparse_0.1.4.bb
+++ b/meta-openstack/recipes-devtools/python/python3-mimeparse_1.6.0.bb
@@ -2,16 +2,20 @@ DESCRIPTION = "basic functions for parsing mime-type names and matching "
 HOMEPAGE = "https://pypi.python.org/pypi/python-mimeparse/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README;md5=07e6feb820fbca7eb99538badb3cd8e2"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1f333cc431fd2aaf1a80b1b7212a6086"
 
 PYPI_PACKAGE = "python-mimeparse"
 
-SRC_URI[md5sum] = "1d2816a16f17dcfe0c613da611fe7e13"
-SRC_URI[sha256sum] = "3c69a21e37e77f754e6fc09ebda70acd92c90d8a58f29a41cc0248351378ddc3"
+SRC_URI[md5sum] = "a32ae1df93be1ddb581d1c0fa124bab4"
+SRC_URI[sha256sum] = "76e4b03d700a641fd7761d3cd4fdbbdcd787eade1ebfac43f877016328334f78"
 
-inherit distutils3 pypi
+inherit distutils3 pypi setuptools3
 
 DISTUTILS_INSTALL_ARGS = "--root=${D} \
     --prefix=${prefix} \
     --install-lib=${PYTHON_SITEPACKAGES_DIR} \
     --install-data=${datadir}"
+
+RDEPENDS_${PN} += " \
+	python3-netserver \
+"
-- 
2.25.1



