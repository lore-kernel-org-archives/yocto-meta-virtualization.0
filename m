Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.4701.1600741761303632938
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Sep 2020 19:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id C2D6E38C1314
	for <meta-virtualization@yoctoproject.org>; Mon, 21 Sep 2020 19:29:20 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,288,1596470400"; 
   d="scan'208";a="99489075"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Sep 2020 10:29:19 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id A16C748990CB
	for <meta-virtualization@yoctoproject.org>; Tue, 22 Sep 2020 10:29:15 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 22 Sep 2020 10:29:13 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-mock: Remove recipe
Date: Tue, 22 Sep 2020 10:29:17 +0800
Message-ID: <1600741757-124408-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: A16C748990CB.A6BEF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Remove this recipe, because a higher version of the recipe exists in:
meta-openembedded/meta-python/recipes-devtools/python/python3-mock_4.0.2.bb

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-mock.inc        | 14 --------------
 .../recipes-devtools/python/python3-mock_4.0.1.bb  |  5 -----
 2 files changed, 19 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-mock.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-mock_4.0.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-mock.inc b/meta-openstack/recipes-devtools/python/python-mock.inc
deleted file mode 100644
index f05061f..0000000
--- a/meta-openstack/recipes-devtools/python/python-mock.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "A Python Mocking and Patching Library for Testing"
-HOMEPAGE = "https://pypi.python.org/pypi/mock"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=de9dfbf780446b18aab11f00baaf5b7e"
-
-inherit pypi
-
-RDEPENDS_${PN} += "${PYTHON_PN}-prettytable \
-            ${PYTHON_PN}-cmd2 \
-            ${PYTHON_PN}-pyparsing \
-            ${PYTHON_PN}-mccabe \
-            ${PYTHON_PN}-pep8 \
-            ${PYTHON_PN}-pyflakes"
diff --git a/meta-openstack/recipes-devtools/python/python3-mock_4.0.1.bb b/meta-openstack/recipes-devtools/python/python3-mock_4.0.1.bb
deleted file mode 100644
index 3dcb028..0000000
--- a/meta-openstack/recipes-devtools/python/python3-mock_4.0.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-mock.inc
-inherit setuptools3
-
-SRC_URI[md5sum] = "8f48ba3fd059e7cfad92f8354064adfd"
-SRC_URI[sha256sum] = "2a572b715f09dd2f0a583d8aeb5bb67d7ed7a8fd31d193cf1227a99c16a67bc3"
\ No newline at end of file
-- 
2.25.1



