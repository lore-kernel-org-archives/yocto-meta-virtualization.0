Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.12591.1601349575969131622
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Sep 2020 20:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id F1C5F38C06F7
	for <meta-virtualization@yoctoproject.org>; Mon, 28 Sep 2020 20:19:34 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,316,1596470400"; 
   d="scan'208";a="99698497"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Sep 2020 11:19:33 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 6A0F748990F6
	for <meta-virtualization@yoctoproject.org>; Tue, 29 Sep 2020 11:19:31 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 29 Sep 2020 11:19:28 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-pam: Consolidate in a single file
Date: Tue, 29 Sep 2020 11:19:26 +0800
Message-ID: <1601349566-108443-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 6A0F748990F6.A6CFE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-pam.inc           | 10 ----------
 .../recipes-devtools/python/python3-pam_0.1.4.bb     | 12 ++++++++++--
 2 files changed, 10 insertions(+), 12 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pam.inc

diff --git a/meta-openstack/recipes-devtools/python/python-pam.inc b/meta-openstack/recipes-devtools/python/python-pam.inc
deleted file mode 100644
index 4fddfbc..0000000
--- a/meta-openstack/recipes-devtools/python/python-pam.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "PAM interface using ctypes"
-HOMEPAGE = "http://atlee.ca/software/pam"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=13;endline=13;md5=8ecc573c355c5eb26b2a4a4f3f62684d"
-
-SRC_URI[md5sum] = "4c5247af579352bb6882dac64be10a33"
-SRC_URI[sha256sum] = "35e88575afc37a2a5f96e20b22fa55d3e3213370d4ce640af1597c2a1dde226b"
-
-inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python3-pam_0.1.4.bb b/meta-openstack/recipes-devtools/python/python3-pam_0.1.4.bb
index e62079f..c6f6be9 100644
--- a/meta-openstack/recipes-devtools/python/python3-pam_0.1.4.bb
+++ b/meta-openstack/recipes-devtools/python/python3-pam_0.1.4.bb
@@ -1,2 +1,10 @@
-require python-pam.inc
-inherit setuptools3
+DESCRIPTION = "PAM interface using ctypes"
+HOMEPAGE = "http://atlee.ca/software/pam"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=13;endline=13;md5=8ecc573c355c5eb26b2a4a4f3f62684d"
+
+SRC_URI[md5sum] = "4c5247af579352bb6882dac64be10a33"
+SRC_URI[sha256sum] = "35e88575afc37a2a5f96e20b22fa55d3e3213370d4ce640af1597c2a1dde226b"
+
+inherit setuptools3 pypi
-- 
2.25.1



