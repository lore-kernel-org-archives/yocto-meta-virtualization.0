Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.9712.1603776629205947281
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 22:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2F46F38C1176
	for <meta-virtualization@yoctoproject.org>; Mon, 26 Oct 2020 22:30:27 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,422,1596470400"; 
   d="scan'208";a="100542338"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Oct 2020 13:30:26 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 45EC14CE1A08
	for <meta-virtualization@yoctoproject.org>; Tue, 27 Oct 2020 13:30:22 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 27 Oct 2020 13:30:20 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-rjsmin: upgrade 1.0.12 -> 1.1.0
Date: Tue, 27 Oct 2020 13:30:11 +0800
Message-ID: <1603776611-96772-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 45EC14CE1A08.A7ABF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-rjsmin_1.0.12.bb        | 2 --
 .../python/{python-rjsmin.inc => python3-rjsmin_1.1.0.bb}   | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-rjsmin_1.0.12.bb
 rename meta-openstack/recipes-devtools/python/{python-rjsmin.inc => python3-rjsmin_1.1.0.bb} (63%)

diff --git a/meta-openstack/recipes-devtools/python/python3-rjsmin_1.0.12.bb b/meta-openstack/recipes-devtools/python/python3-rjsmin_1.0.12.bb
deleted file mode 100644
index 9890e14..0000000
--- a/meta-openstack/recipes-devtools/python/python3-rjsmin_1.0.12.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-rjsmin.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python-rjsmin.inc b/meta-openstack/recipes-devtools/python/python3-rjsmin_1.1.0.bb
similarity index 63%
rename from meta-openstack/recipes-devtools/python/python-rjsmin.inc
rename to meta-openstack/recipes-devtools/python/python3-rjsmin_1.1.0.bb
index 0305a33..6c3b55b 100644
--- a/meta-openstack/recipes-devtools/python/python-rjsmin.inc
+++ b/meta-openstack/recipes-devtools/python/python3-rjsmin_1.1.0.bb
@@ -4,10 +4,10 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[md5sum] = "9f67e133c88df5497d3da847603da9bf"
-SRC_URI[sha256sum] = "dd9591aa73500b08b7db24367f8d32c6470021f39d5ab4e50c7c02e4401386f1"
+SRC_URI[md5sum] = "ff73482370832bcc8e75571c35b7a79b"
+SRC_URI[sha256sum] = "b15dc75c71f65d9493a8c7fa233fdcec823e3f1b88ad84a843ffef49b338ac32"
 
-inherit pypi
+inherit setuptools3 pypi
 
 RDEPENDS_${PN} += " \
         "
-- 
2.25.1



