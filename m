Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.12618.1601349617105359801
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Sep 2020 20:20:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 9D82E38C06F7
	for <meta-virtualization@yoctoproject.org>; Mon, 28 Sep 2020 20:20:16 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,316,1596470400"; 
   d="scan'208";a="99698529"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Sep 2020 11:20:15 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 80E3B48990F2
	for <meta-virtualization@yoctoproject.org>; Tue, 29 Sep 2020 11:20:14 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 29 Sep 2020 11:20:11 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-paste: upgrade 2.0.2 -> 3.4.6
Date: Tue, 29 Sep 2020 11:20:11 +0800
Message-ID: <1601349611-108532-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 80E3B48990F2.A677E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-paste_2.0.2.bb          | 2 --
 .../python/{python-paste.inc => python3-paste_3.4.6.bb}     | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-paste_2.0.2.bb
 rename meta-openstack/recipes-devtools/python/{python-paste.inc => python3-paste_3.4.6.bb} (60%)

diff --git a/meta-openstack/recipes-devtools/python/python3-paste_2.0.2.bb b/meta-openstack/recipes-devtools/python/python3-paste_2.0.2.bb
deleted file mode 100644
index c35d59e..0000000
--- a/meta-openstack/recipes-devtools/python/python3-paste_2.0.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-paste.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python-paste.inc b/meta-openstack/recipes-devtools/python/python3-paste_3.4.6.bb
similarity index 60%
rename from meta-openstack/recipes-devtools/python/python-paste.inc
rename to meta-openstack/recipes-devtools/python/python3-paste_3.4.6.bb
index 64ebc27..efb3abf 100644
--- a/meta-openstack/recipes-devtools/python/python-paste.inc
+++ b/meta-openstack/recipes-devtools/python/python3-paste_3.4.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://docs/license.txt;md5=1798f29d55080c60365e6283cb49779c
 
 PYPI_PACKAGE = "Paste"
 
-SRC_URI[md5sum] = "4bfc8a7eaf858f6309d2ac0f40fc951c"
-SRC_URI[sha256sum] = "adac3ac893a2dac6b8ffd49901377dd6819e05be3436b374d698641071daba99"
+SRC_URI[md5sum] = "4690566403fd89b01ae70a64245441b7"
+SRC_URI[sha256sum] = "001370f4fcc7446006b52a39ed386341fce626605af711e0ec18ddb0b4912cb7"
 
-inherit pypi
+inherit setuptools3 pypi
-- 
2.25.1



