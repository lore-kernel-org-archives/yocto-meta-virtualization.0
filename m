Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.190483.1598257669422868408
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 01:27:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4777CE02087; Mon, 24 Aug 2020 01:27:49 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8168E0203E
	for <meta-virtualization@yoctoproject.org>; Mon, 24 Aug 2020 01:27:47 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,347,1592841600"; 
   d="scan'208";a="98453367"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Aug 2020 16:27:43 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 4124548990CE
	for <meta-virtualization@yoctoproject.org>; Mon, 24 Aug 2020 16:27:43 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 24 Aug 2020 16:27:43 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-xstatic-angular-irdragndrop: Remove python recipe
Date: Tue, 25 Aug 2020 01:27:48 +0800
Message-ID: <1598290068-121922-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 4124548990CE.A6D4B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
---
 .../python-xstatic-angular-irdragndrop.inc    | 19 -----------------
 ...hon-xstatic-angular-irdragndrop_1.0.2.2.bb |  2 --
 ...on3-xstatic-angular-irdragndrop_1.0.2.2.bb | 21 +++++++++++++++++--
 3 files changed, 19 insertions(+), 23 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop_1.0.2.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop.inc b/meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop.inc
deleted file mode 100644
index 90331a9..0000000
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "IrDragNDrop javascript library packaged for setuptools"
-HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-IrDragNDrop"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9acc2dfc3a0345c175df08104bd22298"
-
-PYPI_PACKAGE = "XStatic-Angular-IrDragNDrop"
-
-SRC_URI[md5sum] = "6ea8809bae94014aef699d58836dba84"
-SRC_URI[sha256sum] = "5595f4a98ac8f8468f7e56dc916e10c0fc5f0197567899a75755f99fe8b5bd6d"
-
-inherit pypi
-
-DEPENDS += " \
-        ${PYTHON_PN}-pip \
-        "
-
-RDEPENDS_${PN} += " \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop_1.0.2.2.bb b/meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop_1.0.2.2.bb
deleted file mode 100644
index 72c8781..0000000
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop_1.0.2.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-xstatic-angular-irdragndrop.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-angular-irdragndrop_1.0.2.2.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-irdragndrop_1.0.2.2.bb
index 72c8781..b50fe20 100644
--- a/meta-openstack/recipes-devtools/python/python3-xstatic-angular-irdragndrop_1.0.2.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-irdragndrop_1.0.2.2.bb
@@ -1,2 +1,19 @@
-require python-xstatic-angular-irdragndrop.inc
-inherit setuptools3
+DESCRIPTION = "IrDragNDrop javascript library packaged for setuptools"
+HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-IrDragNDrop"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9acc2dfc3a0345c175df08104bd22298"
+
+PYPI_PACKAGE = "XStatic-Angular-IrDragNDrop"
+
+SRC_URI[md5sum] = "6ea8809bae94014aef699d58836dba84"
+SRC_URI[sha256sum] = "5595f4a98ac8f8468f7e56dc916e10c0fc5f0197567899a75755f99fe8b5bd6d"
+
+inherit setuptools3 pypi
+
+DEPENDS += " \
+        ${PYTHON_PN}-pip \
+        "
+
+RDEPENDS_${PN} += " \
+        "
-- 
2.25.1



