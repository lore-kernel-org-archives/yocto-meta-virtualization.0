Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.9802.1603776609889017379
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 22:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 32E8338C1176
	for <meta-virtualization@yoctoproject.org>; Mon, 26 Oct 2020 22:30:08 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,422,1596470400"; 
   d="scan'208";a="100542324"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Oct 2020 13:30:07 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 069634CE1A08
	for <meta-virtualization@yoctoproject.org>; Tue, 27 Oct 2020 13:30:05 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 27 Oct 2020 13:30:02 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-rfc3986: upgrade 1.3.2 -> 1.4.0
Date: Tue, 27 Oct 2020 13:30:02 +0800
Message-ID: <1603776602-96732-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 069634CE1A08.A65E4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-rfc3986_1.3.2.bb        | 2 --
 .../python/{python-rfc3986.inc => python3-rfc3986_1.4.0.bb} | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-rfc3986_1.3.2.bb
 rename meta-openstack/recipes-devtools/python/{python-rfc3986.inc => python3-rfc3986_1.4.0.bb} (67%)

diff --git a/meta-openstack/recipes-devtools/python/python3-rfc3986_1.3.2.bb b/meta-openstack/recipes-devtools/python/python3-rfc3986_1.3.2.bb
deleted file mode 100644
index 5e91d48..0000000
--- a/meta-openstack/recipes-devtools/python/python3-rfc3986_1.3.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-rfc3986.inc
diff --git a/meta-openstack/recipes-devtools/python/python-rfc3986.inc b/meta-openstack/recipes-devtools/python/python3-rfc3986_1.4.0.bb
similarity index 67%
rename from meta-openstack/recipes-devtools/python/python-rfc3986.inc
rename to meta-openstack/recipes-devtools/python/python3-rfc3986_1.4.0.bb
index d930fd9..e5ac0e6 100644
--- a/meta-openstack/recipes-devtools/python/python-rfc3986.inc
+++ b/meta-openstack/recipes-devtools/python/python3-rfc3986_1.4.0.bb
@@ -4,10 +4,10 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=03731a0e7dbcb30cecdcec77cc93ec29"
 
-SRC_URI[md5sum] = "5b6d009806a94d418c82d48219a256de"
-SRC_URI[sha256sum] = "0344d0bd428126ce554e7ca2b61787b6a28d2bbd19fc70ed2dd85efe31176405"
+SRC_URI[md5sum] = "1b03ad2853e33d47eea698571255247c"
+SRC_URI[sha256sum] = "112398da31a3344dc25dbf477d8df6cb34f9278a94fee2625d89e4514be8bb9d"
 
-inherit pypi
+inherit setuptools3 pypi
 
 # DEPENDS_default: python-pip
 
-- 
2.25.1



