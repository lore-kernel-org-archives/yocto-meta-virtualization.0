Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.4671.1600741639939055366
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Sep 2020 19:27:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6E54D38C0848
	for <meta-virtualization@yoctoproject.org>; Mon, 21 Sep 2020 19:27:19 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,288,1596470400"; 
   d="scan'208";a="99488987"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Sep 2020 10:27:18 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 09C9648990D3
	for <meta-virtualization@yoctoproject.org>; Tue, 22 Sep 2020 10:27:14 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 22 Sep 2020 10:27:10 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-kombu: upgrade 4.6.6 -> 5.0.2
Date: Tue, 22 Sep 2020 10:27:17 +0800
Message-ID: <1600741637-124133-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 09C9648990D3.A5713
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-kombu_4.6.6.bb          | 2 --
 .../python/{python-kombu.inc => python3-kombu_5.0.2.bb}     | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-kombu_4.6.6.bb
 rename meta-openstack/recipes-devtools/python/{python-kombu.inc => python3-kombu_5.0.2.bb} (65%)

diff --git a/meta-openstack/recipes-devtools/python/python3-kombu_4.6.6.bb b/meta-openstack/recipes-devtools/python/python3-kombu_4.6.6.bb
deleted file mode 100644
index 11b0826..0000000
--- a/meta-openstack/recipes-devtools/python/python3-kombu_4.6.6.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-kombu.inc
diff --git a/meta-openstack/recipes-devtools/python/python-kombu.inc b/meta-openstack/recipes-devtools/python/python3-kombu_5.0.2.bb
similarity index 65%
rename from meta-openstack/recipes-devtools/python/python-kombu.inc
rename to meta-openstack/recipes-devtools/python/python3-kombu_5.0.2.bb
index 8029707..dfcde9d 100644
--- a/meta-openstack/recipes-devtools/python/python-kombu.inc
+++ b/meta-openstack/recipes-devtools/python/python3-kombu_5.0.2.bb
@@ -4,10 +4,10 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
 
-SRC_URI[md5sum] = "5f751ea817b1f6a4293d4e3a01040d4f"
-SRC_URI[sha256sum] = "1760b54b1d15a547c9a26d3598a1c8cdaf2436386ac1f5561934bc8a3cbbbd86"
+SRC_URI[md5sum] = "52192e631ac39a443fb1abeb52299f22"
+SRC_URI[sha256sum] = "f4965fba0a4718d47d470beeb5d6446e3357a62402b16c510b6a2f251e05ac3c"
 
-inherit pypi
+inherit setuptools3 pypi
 
 FILES_${PN}-doc += "${datadir}/${SRCNAME}"
 
-- 
2.25.1



