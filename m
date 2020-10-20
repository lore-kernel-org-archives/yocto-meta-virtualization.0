Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.1660.1603176270655247243
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 23:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2192638C0694
	for <meta-virtualization@yoctoproject.org>; Mon, 19 Oct 2020 23:44:29 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,396,1596470400"; 
   d="scan'208";a="100322116"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Oct 2020 14:44:29 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 58B5C48990D3
	for <meta-virtualization@yoctoproject.org>; Tue, 20 Oct 2020 14:44:26 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 20 Oct 2020 14:44:23 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-weakrefmethod: Consolidate in a single file
Date: Tue, 20 Oct 2020 14:44:22 +0800
Message-ID: <1603176262-40756-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 58B5C48990D3.A6613
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-weakrefmethod.inc | 10 ----------
 .../python/python3-weakrefmethod_1.0.3.bb            | 12 ++++++++++--
 2 files changed, 10 insertions(+), 12 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-weakrefmethod.inc

diff --git a/meta-openstack/recipes-devtools/python/python-weakrefmethod.inc b/meta-openstack/recipes-devtools/python/python-weakrefmethod.inc
deleted file mode 100644
index 28aee86..0000000
--- a/meta-openstack/recipes-devtools/python/python-weakrefmethod.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "A WeakMethod class for storing bound methods using weak references."
-HOMEPAGE = "https://github.com/twang817/weakrefmethod"
-SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dd98d01d471fac8d8dbdd975229dba03"
-
-SRC_URI[md5sum] = "39e7450191dea0b17a646b929784ac6f"
-SRC_URI[sha256sum] = "37bc1fbb5575acf82172d4eb7b6fc4412d77d5a1d70dff2c1f8a4574301cda66"
-
-inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python3-weakrefmethod_1.0.3.bb b/meta-openstack/recipes-devtools/python/python3-weakrefmethod_1.0.3.bb
index 23dbb54..fd2c918 100644
--- a/meta-openstack/recipes-devtools/python/python3-weakrefmethod_1.0.3.bb
+++ b/meta-openstack/recipes-devtools/python/python3-weakrefmethod_1.0.3.bb
@@ -1,2 +1,10 @@
-require python-weakrefmethod.inc
-inherit setuptools3
+DESCRIPTION = "A WeakMethod class for storing bound methods using weak references."
+HOMEPAGE = "https://github.com/twang817/weakrefmethod"
+SECTION = "devel/python"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dd98d01d471fac8d8dbdd975229dba03"
+
+SRC_URI[md5sum] = "39e7450191dea0b17a646b929784ac6f"
+SRC_URI[sha256sum] = "37bc1fbb5575acf82172d4eb7b6fc4412d77d5a1d70dff2c1f8a4574301cda66"
+
+inherit setuptools3 pypi
-- 
2.25.1



