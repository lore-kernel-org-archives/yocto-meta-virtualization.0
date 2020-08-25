Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.4890.1598318999791379622
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 18:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4D3D8E02092; Mon, 24 Aug 2020 18:29:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F97DE0204B
	for <meta-virtualization@yoctoproject.org>; Mon, 24 Aug 2020 18:29:58 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,350,1592841600"; 
   d="scan'208";a="98494784"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Aug 2020 09:29:56 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id DC61D48990D6
	for <meta-virtualization@yoctoproject.org>; Tue, 25 Aug 2020 09:29:51 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 25 Aug 2020 09:29:51 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH v2] python3-xstatic-angular-fileupload: Remove python recipe
Date: Tue, 25 Aug 2020 09:29:48 +0800
Message-ID: <1598318988-123302-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: DC61D48990D6.A93D5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Because python is no longer maintained, delete the python2 version of
the recipe.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python-xstatic-angular-fileupload.inc     | 22 -----------------
 ...hon-xstatic-angular-fileupload_12.0.4.0.bb |  2 --
 ...on3-xstatic-angular-fileupload_12.0.4.0.bb | 24 +++++++++++++++++--
 3 files changed, 22 insertions(+), 26 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-fileupload.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-fileupload_12.0.4.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-fileupload.inc b/meta-openstack/recipes-devtools/python/python-xstatic-angular-fileupload.inc
deleted file mode 100644
index a845453..0000000
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-fileupload.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Angular Fileupload packaged for setuptools (easy_install) / pip."
-HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-FileUpload"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e634b82c14383ecefd736caa40ed2222"
-
-PYPI_PACKAGE = "XStatic-Angular-FileUpload"
-
-SRC_URI[md5sum] = "1cf48c0204783da2f71efe79039a8468"
-SRC_URI[sha256sum] = "68e66efc4f2ed81438553a54646d5cc67487b05764c0003ff25ae5beb8dae21f"
-
-inherit pypi
-
-# DEPENDS_default: python-pip
-
-DEPENDS += " \
-        ${PYTHON_PN}-pip \
-        "
-
-# RDEPENDS_default: 
-RDEPENDS_${PN} += " \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-fileupload_12.0.4.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-angular-fileupload_12.0.4.0.bb
deleted file mode 100644
index 644a631..0000000
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-fileupload_12.0.4.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-xstatic-angular-fileupload.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-angular-fileupload_12.0.4.0.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-fileupload_12.0.4.0.bb
index 644a631..2fc8f88 100644
--- a/meta-openstack/recipes-devtools/python/python3-xstatic-angular-fileupload_12.0.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-fileupload_12.0.4.0.bb
@@ -1,2 +1,22 @@
-require python-xstatic-angular-fileupload.inc
-inherit setuptools3
+DESCRIPTION = "Angular Fileupload packaged for setuptools (easy_install) / pip."
+HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-FileUpload"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e634b82c14383ecefd736caa40ed2222"
+
+PYPI_PACKAGE = "XStatic-Angular-FileUpload"
+
+SRC_URI[md5sum] = "1cf48c0204783da2f71efe79039a8468"
+SRC_URI[sha256sum] = "68e66efc4f2ed81438553a54646d5cc67487b05764c0003ff25ae5beb8dae21f"
+
+inherit setuptools3 pypi
+
+# DEPENDS_default: python-pip
+
+DEPENDS += " \
+        ${PYTHON_PN}-pip \
+        "
+
+# RDEPENDS_default: 
+RDEPENDS_${PN} += " \
+        "
-- 
2.25.1



