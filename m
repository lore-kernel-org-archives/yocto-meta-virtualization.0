Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.1643.1603176168181021377
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 23:42:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id AFC3C38C06C8
	for <meta-virtualization@yoctoproject.org>; Mon, 19 Oct 2020 23:42:47 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,396,1596470400"; 
   d="scan'208";a="100322005"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Oct 2020 14:42:46 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id AE72E4CE1504
	for <meta-virtualization@yoctoproject.org>; Tue, 20 Oct 2020 14:42:46 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 20 Oct 2020 14:42:44 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-testresources: upgrade 0.2.7 -> 2.0.1
Date: Tue, 20 Oct 2020 14:42:37 +0800
Message-ID: <1603176157-40482-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: AE72E4CE1504.A70AB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

-License-Update: The checked file is changed to PKG-INFO.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-testresources.inc           | 10 ----------
 .../python/python3-testresources_0.2.7.bb     |  2 --
 .../python/python3-testresources_2.0.1.bb     | 19 +++++++++++++++++++
 3 files changed, 19 insertions(+), 12 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-testresources.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-testresources_0.2.7.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-testresources_2.0.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-testresources.inc b/meta-openstack/recipes-devtools/python/python-testresources.inc
deleted file mode 100644
index 67ad6c4..0000000
--- a/meta-openstack/recipes-devtools/python/python-testresources.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "Testresources, a pyunit extension for managing expensive test resources"
-HOMEPAGE = "https://pypi.python.org/pypi/testtools/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README;md5=038679cd2cf27bb2acc70257bfee0f41"
-
-SRC_URI[md5sum] = "db2e774be2a6f5754cbbf4c537f823d0"
-SRC_URI[sha256sum] = "ad0a117383dd463827b199eaa92829b4d6a3147fbd97459820df53bae81d7231"
-
-inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python3-testresources_0.2.7.bb b/meta-openstack/recipes-devtools/python/python3-testresources_0.2.7.bb
deleted file mode 100644
index 79a535c..0000000
--- a/meta-openstack/recipes-devtools/python/python3-testresources_0.2.7.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-testresources.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-testresources_2.0.1.bb b/meta-openstack/recipes-devtools/python/python3-testresources_2.0.1.bb
new file mode 100644
index 0000000..111be3c
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-testresources_2.0.1.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Testresources, a pyunit extension for managing expensive test resources"
+HOMEPAGE = "https://pypi.python.org/pypi/testtools/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=eb75e5ad7c7ff3315ffafae1403e94b2"
+
+SRC_URI[md5sum] = "8873ab443db5569528964f524228a2d7"
+SRC_URI[sha256sum] = "ee9d1982154a1e212d4e4bac6b610800bfb558e4fb853572a827bc14a96e4417"
+
+inherit setuptools3 pypi
+
+DEPENDS += " \
+	python3-pbr-native \
+"
+
+RDEPENDS_${PN} += " \
+	python3-unittest \
+	python3-pbr \
+"
-- 
2.25.1



