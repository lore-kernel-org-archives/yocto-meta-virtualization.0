Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.4585.1598317735324378687
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 18:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D7DEFE02092; Mon, 24 Aug 2020 18:08:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	*  1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 796E0E0204B
	for <meta-virtualization@yoctoproject.org>; Mon, 24 Aug 2020 18:08:52 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,350,1592841600"; 
   d="scan'208";a="98493799"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Aug 2020 09:08:49 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id F069048990D8
	for <meta-virtualization@yoctoproject.org>; Tue, 25 Aug 2020 09:08:41 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 25 Aug 2020 09:08:40 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCHv2] python3-xstatic-bootstrap-datepicker: Remove python recipe
Date: Tue, 25 Aug 2020 21:08:34 +0800
Message-ID: <1598360914-77104-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: F069048990D8.A0FFE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

Because python is no longer maintained, delete the python2 version of the recipe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python-xstatic-bootstrap-datepicker.inc   | 19 -----------------
 ...on-xstatic-bootstrap-datepicker_1.3.1.0.bb |  2 --
 ...n3-xstatic-bootstrap-datepicker_1.4.0.0.bb | 21 +++++++++++++++++--
 3 files changed, 19 insertions(+), 23 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker_1.3.1.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker.inc b/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker.inc
deleted file mode 100644
index f1d19f3..0000000
--- a/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Bootstrap-Datepicker JavaScript library packaged for setuptools (easy_install) / pip."
-HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Bootstrap-Datepicker"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=717661446a83183e303f3f8e0a1ea277"
-
-PYPI_PACKAGE = "XStatic-Bootstrap-Datepicker"
-
-SRC_URI[md5sum] = "68375e81274159874ab5fd6d85ea405c"
-SRC_URI[sha256sum] = "df33add9f5e785fa884ac4b182601af6aac9e1eeef7cfe62dbbcb0654d0f2d6e"
-
-inherit pypi
-
-DEPENDS += " \
-        ${PYTHON_PN}-pip \
-        "
-
-RDEPENDS_${PN} += " \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker_1.3.1.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker_1.3.1.0.bb
deleted file mode 100644
index 9e9db89..0000000
--- a/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker_1.3.1.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-xstatic-bootstrap-datepicker.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-bootstrap-datepicker_1.4.0.0.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-bootstrap-datepicker_1.4.0.0.bb
index 9e9db89..6ecaf8a 100644
--- a/meta-openstack/recipes-devtools/python/python3-xstatic-bootstrap-datepicker_1.4.0.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-bootstrap-datepicker_1.4.0.0.bb
@@ -1,2 +1,19 @@
-require python-xstatic-bootstrap-datepicker.inc
-inherit setuptools3
+DESCRIPTION = "Bootstrap-Datepicker JavaScript library packaged for setuptools (easy_install) / pip."
+HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Bootstrap-Datepicker"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=717661446a83183e303f3f8e0a1ea277"
+
+PYPI_PACKAGE = "XStatic-Bootstrap-Datepicker"
+
+SRC_URI[md5sum] = "68375e81274159874ab5fd6d85ea405c"
+SRC_URI[sha256sum] = "df33add9f5e785fa884ac4b182601af6aac9e1eeef7cfe62dbbcb0654d0f2d6e"
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



