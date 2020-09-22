Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.4612.1600741600865548644
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Sep 2020 19:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6AB8438C0848
	for <meta-virtualization@yoctoproject.org>; Mon, 21 Sep 2020 19:26:39 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,288,1596470400"; 
   d="scan'208";a="99488964"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Sep 2020 10:26:34 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id E6CB448990D3
	for <meta-virtualization@yoctoproject.org>; Tue, 22 Sep 2020 10:26:32 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 22 Sep 2020 10:26:30 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-keystoneauth1: upgrade 3.18.0 -> 4.2.1
Date: Tue, 22 Sep 2020 10:26:16 +0800
Message-ID: <1600741576-124087-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: E6CB448990D3.A7154
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-keystoneauth1_3.18.0.bb | 2 --
 ...hon-keystoneauth1.inc => python3-keystoneauth1_4.2.1.bb} | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.18.0.bb
 rename meta-openstack/recipes-devtools/python/{python-keystoneauth1.inc => python3-keystoneauth1_4.2.1.bb} (77%)

diff --git a/meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.18.0.bb b/meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.18.0.bb
deleted file mode 100644
index 75adf3d..0000000
--- a/meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.18.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-keystoneauth1.inc
diff --git a/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc b/meta-openstack/recipes-devtools/python/python3-keystoneauth1_4.2.1.bb
similarity index 77%
rename from meta-openstack/recipes-devtools/python/python-keystoneauth1.inc
rename to meta-openstack/recipes-devtools/python/python3-keystoneauth1_4.2.1.bb
index bca6ce9..6c046d9 100644
--- a/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc
+++ b/meta-openstack/recipes-devtools/python/python3-keystoneauth1_4.2.1.bb
@@ -4,10 +4,10 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=96f840d59b245a1c817fbcb901afc574"
 
-SRC_URI[md5sum] = "6104205044175fa8aac659582fdd0260"
-SRC_URI[sha256sum] = "3ae67c6542ed66a37cddcd26a35457c1ff5cd14b20f5490973273cf9eb555a52"
+SRC_URI[md5sum] = "3c65181cb3cf6a8690e1c65de030e3fb"
+SRC_URI[sha256sum] = "9496bfcc27eff3d05271e10aa64684b7c1fd12a4d96f58511f2286312d9c89a1"
 
-inherit pypi
+inherit setuptools3 pypi
 
 DEPENDS += " \
         ${PYTHON_PN}-pbr \
-- 
2.25.1



