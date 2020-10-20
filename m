Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.1685.1603176729033325882
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 23:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7D68238C07D7
	for <meta-virtualization@yoctoproject.org>; Mon, 19 Oct 2020 23:52:08 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,396,1596470400"; 
   d="scan'208";a="100322425"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Oct 2020 14:52:06 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 24AC448990CC
	for <meta-virtualization@yoctoproject.org>; Tue, 20 Oct 2020 14:52:01 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 20 Oct 2020 14:52:00 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-statsd: Consolidate in a single file
Date: Tue, 20 Oct 2020 14:51:59 +0800
Message-ID: <1603176719-41027-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 24AC448990CC.A04DD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-statsd.inc     | 13 -------------
 .../python/python3-statsd_3.3.0.bb                | 15 +++++++++++++--
 2 files changed, 13 insertions(+), 15 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-statsd.inc

diff --git a/meta-openstack/recipes-devtools/python/python-statsd.inc b/meta-openstack/recipes-devtools/python/python-statsd.inc
deleted file mode 100644
index 33257b9..0000000
--- a/meta-openstack/recipes-devtools/python/python-statsd.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "A simple statsd client."
-HOMEPAGE = "https://github.com/jsocol/pystatsd"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4d8aa8ac1dc54b8aee4054bd5e5c61bd"
-
-inherit pypi
-
-SRC_URI[md5sum] = "b397ccf880f37cf099e775907ebf7a46"
-SRC_URI[sha256sum] = "e3e6db4c246f7c59003e51c9720a51a7f39a396541cb9b147ff4b14d15b5dd1f"
-
-RDEPENDS_${PN} += " \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-statsd_3.3.0.bb b/meta-openstack/recipes-devtools/python/python3-statsd_3.3.0.bb
index 3e430a1..0c0cc6a 100644
--- a/meta-openstack/recipes-devtools/python/python3-statsd_3.3.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-statsd_3.3.0.bb
@@ -1,2 +1,13 @@
-inherit setuptools3
-require python-statsd.inc
+DESCRIPTION = "A simple statsd client."
+HOMEPAGE = "https://github.com/jsocol/pystatsd"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4d8aa8ac1dc54b8aee4054bd5e5c61bd"
+
+inherit setuptools3 pypi
+
+SRC_URI[md5sum] = "b397ccf880f37cf099e775907ebf7a46"
+SRC_URI[sha256sum] = "e3e6db4c246f7c59003e51c9720a51a7f39a396541cb9b147ff4b14d15b5dd1f"
+
+RDEPENDS_${PN} += " \
+        "
-- 
2.25.1



