Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.190928.1598257691423825926
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 01:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E852E02087; Mon, 24 Aug 2020 01:28:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D1F74E0203E
	for <meta-virtualization@yoctoproject.org>; Mon, 24 Aug 2020 01:28:08 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,347,1592841600"; 
   d="scan'208";a="98453381"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Aug 2020 16:28:07 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id DBDBB48990CA
	for <meta-virtualization@yoctoproject.org>; Mon, 24 Aug 2020 16:28:01 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 24 Aug 2020 16:28:01 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-xstatic-angular-schema-form: Remove python recipe
Date: Tue, 25 Aug 2020 01:28:02 +0800
Message-ID: <1598290082-121960-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: DBDBB48990CA.AB001
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
---
 .../python-xstatic-angular-schema-form.inc    | 22 -----------------
 ...on-xstatic-angular-schema-form_0.8.13.0.bb |  2 --
 ...n3-xstatic-angular-schema-form_0.8.13.0.bb | 24 +++++++++++++++++--
 3 files changed, 22 insertions(+), 26 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form_0.8.13.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form.inc b/meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form.inc
deleted file mode 100644
index 7bfa957..0000000
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Angular Schema Form packaged for setuptools (easy_install) / pip."
-HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-Schema-Form"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0e4430cb0dfdb98d3008c66d8339f31a"
-
-PYPI_PACKAGE = "XStatic-Angular-Schema-Form"
-
-SRC_URI[md5sum] = "d0faab81c36f4cfc03e092fedc30018d"
-SRC_URI[sha256sum] = "7c08634901751267fe26d266fc027cf6ed2e5f422696985cec750594b3f4e300"
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
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form_0.8.13.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form_0.8.13.0.bb
deleted file mode 100644
index eae97b2..0000000
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form_0.8.13.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-xstatic-angular-schema-form.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-angular-schema-form_0.8.13.0.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-schema-form_0.8.13.0.bb
index eae97b2..aa49f61 100644
--- a/meta-openstack/recipes-devtools/python/python3-xstatic-angular-schema-form_0.8.13.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-schema-form_0.8.13.0.bb
@@ -1,2 +1,22 @@
-require python-xstatic-angular-schema-form.inc
-inherit setuptools3
+DESCRIPTION = "Angular Schema Form packaged for setuptools (easy_install) / pip."
+HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-Schema-Form"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0e4430cb0dfdb98d3008c66d8339f31a"
+
+PYPI_PACKAGE = "XStatic-Angular-Schema-Form"
+
+SRC_URI[md5sum] = "d0faab81c36f4cfc03e092fedc30018d"
+SRC_URI[sha256sum] = "7c08634901751267fe26d266fc027cf6ed2e5f422696985cec750594b3f4e300"
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



