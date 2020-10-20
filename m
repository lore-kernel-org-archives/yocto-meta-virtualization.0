Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.1651.1603176216787013026
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 23:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4CF2138C06C8
	for <meta-virtualization@yoctoproject.org>; Mon, 19 Oct 2020 23:43:36 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,396,1596470400"; 
   d="scan'208";a="100322061"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Oct 2020 14:43:35 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 0E14A48990D3
	for <meta-virtualization@yoctoproject.org>; Tue, 20 Oct 2020 14:43:35 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 20 Oct 2020 14:43:33 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-thrift: Consolidate in a single file
Date: Tue, 20 Oct 2020 14:43:27 +0800
Message-ID: <1603176207-40601-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 0E14A48990D3.A40FC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-thrift.inc        | 10 ----------
 .../recipes-devtools/python/python3-thrift_0.9.2.bb  | 12 ++++++++++--
 2 files changed, 10 insertions(+), 12 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-thrift.inc

diff --git a/meta-openstack/recipes-devtools/python/python-thrift.inc b/meta-openstack/recipes-devtools/python/python-thrift.inc
deleted file mode 100644
index 019d7c8..0000000
--- a/meta-openstack/recipes-devtools/python/python-thrift.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "Python bindings for the Apache Thrift RPC system"
-HOMEPAGE = "https://pypi.python.org/pypi/amqp/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=df17a59cc9e1327ec49c2285e13ac477"
-
-SRC_URI[md5sum] = "91f1c224c46a257bb428431943387dfd"
-SRC_URI[sha256sum] = "08f665e4b033c9d2d0b6174d869273104362c80e77ee4c01054a74141e378afa"
-
-inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python3-thrift_0.9.2.bb b/meta-openstack/recipes-devtools/python/python3-thrift_0.9.2.bb
index 095dcba..ec76885 100644
--- a/meta-openstack/recipes-devtools/python/python3-thrift_0.9.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-thrift_0.9.2.bb
@@ -1,2 +1,10 @@
-require python-thrift.inc
-inherit setuptools3
+DESCRIPTION = "Python bindings for the Apache Thrift RPC system"
+HOMEPAGE = "https://pypi.python.org/pypi/amqp/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=df17a59cc9e1327ec49c2285e13ac477"
+
+SRC_URI[md5sum] = "91f1c224c46a257bb428431943387dfd"
+SRC_URI[sha256sum] = "08f665e4b033c9d2d0b6174d869273104362c80e77ee4c01054a74141e378afa"
+
+inherit setuptools3 pypi
-- 
2.25.1



