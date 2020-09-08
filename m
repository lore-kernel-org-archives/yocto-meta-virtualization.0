Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.13870.1599542505297470933
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Sep 2020 22:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id C64F538C0894
	for <meta-virtualization@yoctoproject.org>; Mon,  7 Sep 2020 22:21:44 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,404,1592841600"; 
   d="scan'208";a="98993005"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Sep 2020 13:21:41 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id CB9F448990F6
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Sep 2020 13:21:40 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Sep 2020 13:21:39 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-google-api-python-client: Remove the recipe
Date: Wed, 9 Sep 2020 01:21:38 +0800
Message-ID: <1599585700-88354-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: CB9F448990F6.A3251
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Since python2 is no longer maintained, the recipe of python2 is removed.
The version of python3 is located at:
meta-openembedded/meta-python/recipes-devtools/python/python3-google-api-python-client_1.11.0.bb

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python-google-api-python-client_1.6.6.bb     | 16 ----------------
 1 file changed, 16 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-google-api-python-client_1.6.6.bb

diff --git a/meta-openstack/recipes-devtools/python/python-google-api-python-client_1.6.6.bb b/meta-openstack/recipes-devtools/python/python-google-api-python-client_1.6.6.bb
deleted file mode 100644
index 8aec8ce..0000000
--- a/meta-openstack/recipes-devtools/python/python-google-api-python-client_1.6.6.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Client library for accessing the Plus, Moderator, and many other Google APIs."
-AUTHOR = "Google Inc."
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
-
-inherit setuptools3 pypi
-
-SRC_URI[md5sum] = "3059dce9c0308852e177c7d99d3f9ac2"
-SRC_URI[sha256sum] = "ec72991f95201996a4edcea44a079cae0292798086beaadb054d91921632fe1b"
-
-RDEPENDS_${PN} += " \
-        python-httplib2 \
-        python-oauth2client \
-        python-six \
-        python-uritemplate \
-        "
-- 
2.25.1



