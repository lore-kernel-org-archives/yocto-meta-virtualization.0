Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.12087.1599532948301664803
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Sep 2020 19:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id D414D38C0894
	for <meta-virtualization@yoctoproject.org>; Mon,  7 Sep 2020 19:42:27 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,404,1592841600"; 
   d="scan'208";a="98988919"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Sep 2020 10:42:26 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id CD3D348990E2
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Sep 2020 10:42:22 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Sep 2020 10:42:21 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-extras: Consolidate in a single file
Date: Tue, 8 Sep 2020 10:42:24 +0800
Message-ID: <1599532944-124344-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: CD3D348990E2.A9017
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-extras.inc        | 10 ----------
 .../recipes-devtools/python/python3-extras_1.0.0.bb  | 12 ++++++++++--
 2 files changed, 10 insertions(+), 12 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-extras.inc

diff --git a/meta-openstack/recipes-devtools/python/python-extras.inc b/meta-openstack/recipes-devtools/python/python-extras.inc
deleted file mode 100644
index 45d57bb..0000000
--- a/meta-openstack/recipes-devtools/python/python-extras.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "Useful extra bits for Python - things that should be in the standard library"
-HOMEPAGE = "https://pypi.python.org/pypi/extras/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6d108f338b2f68fe48ac366c4650bd8b"
-
-SRC_URI[md5sum] = "3a63ad60cf8f0186c9e3a02f55ec5b14"
-SRC_URI[sha256sum] = "132e36de10b9c91d5d4cc620160a476e0468a88f16c9431817a6729611a81b4e"
-
-inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python3-extras_1.0.0.bb b/meta-openstack/recipes-devtools/python/python3-extras_1.0.0.bb
index 76f87f2..a7ed407 100644
--- a/meta-openstack/recipes-devtools/python/python3-extras_1.0.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-extras_1.0.0.bb
@@ -1,2 +1,10 @@
-inherit setuptools3
-require python-extras.inc
+DESCRIPTION = "Useful extra bits for Python - things that should be in the standard library"
+HOMEPAGE = "https://pypi.python.org/pypi/extras/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6d108f338b2f68fe48ac366c4650bd8b"
+
+SRC_URI[md5sum] = "3a63ad60cf8f0186c9e3a02f55ec5b14"
+SRC_URI[sha256sum] = "132e36de10b9c91d5d4cc620160a476e0468a88f16c9431817a6729611a81b4e"
+
+inherit setuptools3 pypi
-- 
2.25.1



