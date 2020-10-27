Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.9716.1603776495880355160
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 22:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 21B4038C1176
	for <meta-virtualization@yoctoproject.org>; Mon, 26 Oct 2020 22:28:12 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,422,1596470400"; 
   d="scan'208";a="100542256"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Oct 2020 13:28:10 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 3C6F74CE1504
	for <meta-virtualization@yoctoproject.org>; Tue, 27 Oct 2020 13:28:07 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 27 Oct 2020 13:28:05 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-repoze.lru: Consolidate in a single file
Date: Tue, 27 Oct 2020 13:28:00 +0800
Message-ID: <1603776480-96550-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 3C6F74CE1504.A8162
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-repoze.lru.inc                 | 14 --------------
 .../python/python3-repoze.lru_0.7.bb             | 16 ++++++++++++++--
 2 files changed, 14 insertions(+), 16 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-repoze.lru.inc

diff --git a/meta-openstack/recipes-devtools/python/python-repoze.lru.inc b/meta-openstack/recipes-devtools/python/python-repoze.lru.inc
deleted file mode 100644
index d79e864..0000000
--- a/meta-openstack/recipes-devtools/python/python-repoze.lru.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "A tiny LRU cache implementation and decorator"
-DESCRIPTION = "repoze.lru is a LRU (least recently used) cache implementation. \
-Keys and values that are not used frequently will be evicted from the cache faster \
-than keys and values that are used frequently. \
-"
-HOMEPAGE = "https://pypi.python.org/pypi/repoze.lru"
-SECTION = "devel/python"
-LICENSE = "BSD-Modification-copyright"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2c33cdbc6bc9ae6e5d64152fdb754292"
-
-SRC_URI[md5sum] = "c08cc030387e0b1fc53c5c7d964b35e2"
-SRC_URI[sha256sum] = "0429a75e19380e4ed50c0694e26ac8819b4ea7851ee1fc7583c8572db80aff77"
-
-inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python3-repoze.lru_0.7.bb b/meta-openstack/recipes-devtools/python/python3-repoze.lru_0.7.bb
index 88e358d..323ad76 100644
--- a/meta-openstack/recipes-devtools/python/python3-repoze.lru_0.7.bb
+++ b/meta-openstack/recipes-devtools/python/python3-repoze.lru_0.7.bb
@@ -1,2 +1,14 @@
-inherit setuptools3
-require python-repoze.lru.inc
+SUMMARY = "A tiny LRU cache implementation and decorator"
+DESCRIPTION = "repoze.lru is a LRU (least recently used) cache implementation. \
+Keys and values that are not used frequently will be evicted from the cache faster \
+than keys and values that are used frequently. \
+"
+HOMEPAGE = "https://pypi.python.org/pypi/repoze.lru"
+SECTION = "devel/python"
+LICENSE = "BSD-Modification-copyright"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2c33cdbc6bc9ae6e5d64152fdb754292"
+
+SRC_URI[md5sum] = "c08cc030387e0b1fc53c5c7d964b35e2"
+SRC_URI[sha256sum] = "0429a75e19380e4ed50c0694e26ac8819b4ea7851ee1fc7583c8572db80aff77"
+
+inherit setuptools3 pypi
-- 
2.25.1



