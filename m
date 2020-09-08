Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.12088.1599532953663148194
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Sep 2020 19:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 31A7838C0894
	for <meta-virtualization@yoctoproject.org>; Mon,  7 Sep 2020 19:42:33 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,404,1592841600"; 
   d="scan'208";a="98988927"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Sep 2020 10:42:32 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 2673048990F5
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Sep 2020 10:42:32 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Sep 2020 10:42:30 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-funcsigs: Consolidate in a single file
Date: Tue, 8 Sep 2020 10:42:32 +0800
Message-ID: <1599532952-124380-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 2673048990F5.A640B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-funcsigs.inc    | 12 ------------
 .../python/python3-funcsigs_1.0.2.bb               | 14 ++++++++++++--
 2 files changed, 12 insertions(+), 14 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-funcsigs.inc

diff --git a/meta-openstack/recipes-devtools/python/python-funcsigs.inc b/meta-openstack/recipes-devtools/python/python-funcsigs.inc
deleted file mode 100644
index 24c4894..0000000
--- a/meta-openstack/recipes-devtools/python/python-funcsigs.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Python function signatures from PEP362 for Python 2.6, 2.7 and 3.2+"
-HOMEPAGE = "http://funcsigs.readthedocs.org"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d6bc91dc8e5793892189fe7481a2d354"
-
-SRC_URI[md5sum] = "7e583285b1fb8a76305d6d68f4ccc14e"
-SRC_URI[sha256sum] = "a7bb0f2cf3a3fd1ab2732cb49eba4252c2af4240442415b4abce3b87022a8f50"
-
-inherit pypi
-
-CLEANBROKEN = "1"
diff --git a/meta-openstack/recipes-devtools/python/python3-funcsigs_1.0.2.bb b/meta-openstack/recipes-devtools/python/python3-funcsigs_1.0.2.bb
index 617ebf9..1b4966b 100644
--- a/meta-openstack/recipes-devtools/python/python3-funcsigs_1.0.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-funcsigs_1.0.2.bb
@@ -1,2 +1,12 @@
-require python-funcsigs.inc
-inherit setuptools3
+DESCRIPTION = "Python function signatures from PEP362 for Python 2.6, 2.7 and 3.2+"
+HOMEPAGE = "http://funcsigs.readthedocs.org"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d6bc91dc8e5793892189fe7481a2d354"
+
+SRC_URI[md5sum] = "7e583285b1fb8a76305d6d68f4ccc14e"
+SRC_URI[sha256sum] = "a7bb0f2cf3a3fd1ab2732cb49eba4252c2af4240442415b4abce3b87022a8f50"
+
+inherit setuptools3 pypi
+
+CLEANBROKEN = "1"
-- 
2.25.1



