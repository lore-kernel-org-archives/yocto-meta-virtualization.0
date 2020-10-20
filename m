Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.1659.1603176253350855657
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 23:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id B7CF938C06C8
	for <meta-virtualization@yoctoproject.org>; Mon, 19 Oct 2020 23:44:12 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,396,1596470400"; 
   d="scan'208";a="100322094"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Oct 2020 14:44:11 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 4BFA248990FB
	for <meta-virtualization@yoctoproject.org>; Tue, 20 Oct 2020 14:44:07 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 20 Oct 2020 14:44:05 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-vine: upgrade 1.1.4 -> 5.0.0
Date: Tue, 20 Oct 2020 14:44:03 +0800
Message-ID: <1603176243-40682-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 4BFA248990FB.A7C73
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-vine_1.1.4.bb           | 3 ---
 .../python/{python-vine.inc => python3-vine_5.0.0.bb}       | 6 +++---
 2 files changed, 3 insertions(+), 6 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-vine_1.1.4.bb
 rename meta-openstack/recipes-devtools/python/{python-vine.inc => python3-vine_5.0.0.bb} (58%)

diff --git a/meta-openstack/recipes-devtools/python/python3-vine_1.1.4.bb b/meta-openstack/recipes-devtools/python/python3-vine_1.1.4.bb
deleted file mode 100644
index 5926702..0000000
--- a/meta-openstack/recipes-devtools/python/python3-vine_1.1.4.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit setuptools3
-require python-vine.inc
-
diff --git a/meta-openstack/recipes-devtools/python/python-vine.inc b/meta-openstack/recipes-devtools/python/python3-vine_5.0.0.bb
similarity index 58%
rename from meta-openstack/recipes-devtools/python/python-vine.inc
rename to meta-openstack/recipes-devtools/python/python3-vine_5.0.0.bb
index f098a9d..4695402 100644
--- a/meta-openstack/recipes-devtools/python/python-vine.inc
+++ b/meta-openstack/recipes-devtools/python/python3-vine_5.0.0.bb
@@ -4,10 +4,10 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6fadb0e48ceb84b571372dd706ed76a0"
 
-SRC_URI[md5sum] = "9fdb971e7fd15b181b84f3bfcf20d11c"
-SRC_URI[sha256sum] = "52116d59bc45392af9fdd3b75ed98ae48a93e822cee21e5fda249105c59a7a72"
+SRC_URI[md5sum] = "2fc3270a999cdc9341ba173360d62367"
+SRC_URI[sha256sum] = "7d3b1624a953da82ef63462013bbd271d3eb75751489f9807598e8f340bd637e"
 
-inherit pypi
+inherit setuptools3 pypi
 
 RDEPENDS_${PN} += " \
         "
-- 
2.25.1



