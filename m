Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.4672.1600741652400538311
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Sep 2020 19:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7FE9338C0848
	for <meta-virtualization@yoctoproject.org>; Mon, 21 Sep 2020 19:27:31 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,288,1596470400"; 
   d="scan'208";a="99488995"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Sep 2020 10:27:30 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 91D1F48990D3
	for <meta-virtualization@yoctoproject.org>; Tue, 22 Sep 2020 10:27:27 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 22 Sep 2020 10:27:25 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-lesscpy: upgrade 0.10.2 -> 0.14.0
Date: Tue, 22 Sep 2020 10:27:25 +0800
Message-ID: <1600741645-124169-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 91D1F48990D3.A6EB4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-lesscpy_0.10.2.bb       | 2 --
 .../{python-lesscpy.inc => python3-lesscpy_0.14.0.bb}       | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-lesscpy_0.10.2.bb
 rename meta-openstack/recipes-devtools/python/{python-lesscpy.inc => python3-lesscpy_0.14.0.bb} (72%)

diff --git a/meta-openstack/recipes-devtools/python/python3-lesscpy_0.10.2.bb b/meta-openstack/recipes-devtools/python/python3-lesscpy_0.10.2.bb
deleted file mode 100644
index 167b970..0000000
--- a/meta-openstack/recipes-devtools/python/python3-lesscpy_0.10.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-lesscpy.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python-lesscpy.inc b/meta-openstack/recipes-devtools/python/python3-lesscpy_0.14.0.bb
similarity index 72%
rename from meta-openstack/recipes-devtools/python/python-lesscpy.inc
rename to meta-openstack/recipes-devtools/python/python3-lesscpy_0.14.0.bb
index c10b0b8..64417b3 100644
--- a/meta-openstack/recipes-devtools/python/python-lesscpy.inc
+++ b/meta-openstack/recipes-devtools/python/python3-lesscpy_0.14.0.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a01aae31681ac25b4c46f98d627b9b5d"
 DEPENDS += "${PYTHON_PN}-ply"
 RDEPENDS_${PN} += "${PYTHON_PN}-ply"
 
-SRC_URI[md5sum] = "fedbad1f4eb19c3af37f09560156246d"
-SRC_URI[sha256sum] = "ccad1ad2a89ced1875c5ca4e16e5478b791d31fb187fe29f1541859318ed9055"
+SRC_URI[md5sum] = "efe82be479ddb7bdc48b2114dab94b20"
+SRC_URI[sha256sum] = "7b664f60818a16afa8cc9f1dd6d9b17f944e0ce94e50787d76f81bc7a8648cce"
 
-inherit pypi
+inherit setuptools3 pypi
 
 DISTUTILS_INSTALL_ARGS = "--root=${D} \
     --prefix=${prefix} \
-- 
2.25.1



