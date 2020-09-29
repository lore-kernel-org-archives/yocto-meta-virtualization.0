Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.12464.1601349629418977810
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Sep 2020 20:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id EC6F638C06F7
	for <meta-virtualization@yoctoproject.org>; Mon, 28 Sep 2020 20:20:28 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,316,1596470400"; 
   d="scan'208";a="99698540"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Sep 2020 11:20:28 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 8F89348990F2
	for <meta-virtualization@yoctoproject.org>; Tue, 29 Sep 2020 11:20:24 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 29 Sep 2020 11:20:21 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-pathlib: Consolidate in a single file
Date: Tue, 29 Sep 2020 11:20:22 +0800
Message-ID: <1601349622-108579-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 8F89348990F2.A68EF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-pathlib.inc                 | 23 -----------------
 .../python/python3-pathlib_1.0.1.bb           | 25 +++++++++++++++++--
 2 files changed, 23 insertions(+), 25 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pathlib.inc

diff --git a/meta-openstack/recipes-devtools/python/python-pathlib.inc b/meta-openstack/recipes-devtools/python/python-pathlib.inc
deleted file mode 100644
index 1df01f3..0000000
--- a/meta-openstack/recipes-devtools/python/python-pathlib.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Object-oriented filesystem paths"
-DESCRIPTION = "pathlib offers a set of classes to handle filesystem paths. \
-It offers the following advantages over using string objects: \
-- No more cumbersome use of os and os.path functions. \
-- Embodies the semantics of different path types. \
-- Well-defined semantics, eliminating any warts or ambiguities. \
-"
-HOMEPAGE = "https://pypi.python.org/pypi/pathlib"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b6557c860f0fc867aeab30afd649753"
-
-SRC_URI[md5sum] = "5099ed48be9b1ee29b31c82819240537"
-SRC_URI[sha256sum] = "6940718dfc3eff4258203ad5021090933e5c04707d5ca8cc9e73c94a7894ea9f"
-
-inherit pypi
-
-DEPENDS += " \
-        ${PYTHON_PN}-pip \
-"
-
-RDEPENDS_${PN} += " \
-"
diff --git a/meta-openstack/recipes-devtools/python/python3-pathlib_1.0.1.bb b/meta-openstack/recipes-devtools/python/python3-pathlib_1.0.1.bb
index afed21e..059b4ff 100644
--- a/meta-openstack/recipes-devtools/python/python3-pathlib_1.0.1.bb
+++ b/meta-openstack/recipes-devtools/python/python3-pathlib_1.0.1.bb
@@ -1,2 +1,23 @@
-require python-pathlib.inc
-inherit setuptools3
+SUMMARY = "Object-oriented filesystem paths"
+DESCRIPTION = "pathlib offers a set of classes to handle filesystem paths. \
+It offers the following advantages over using string objects: \
+- No more cumbersome use of os and os.path functions. \
+- Embodies the semantics of different path types. \
+- Well-defined semantics, eliminating any warts or ambiguities. \
+"
+HOMEPAGE = "https://pypi.python.org/pypi/pathlib"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b6557c860f0fc867aeab30afd649753"
+
+SRC_URI[md5sum] = "5099ed48be9b1ee29b31c82819240537"
+SRC_URI[sha256sum] = "6940718dfc3eff4258203ad5021090933e5c04707d5ca8cc9e73c94a7894ea9f"
+
+inherit setuptools3 pypi
+
+DEPENDS += " \
+        ${PYTHON_PN}-pip \
+"
+
+RDEPENDS_${PN} += " \
+"
-- 
2.25.1



