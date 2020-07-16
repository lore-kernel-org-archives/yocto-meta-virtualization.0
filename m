Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.11234.1594887324273661711
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Jul 2020 01:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 265C2E01E8D; Thu, 16 Jul 2020 01:15:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C7FCE01E8B
	for <meta-virtualization@yoctoproject.org>; Thu, 16 Jul 2020 01:15:23 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,358,1589212800"; 
   d="scan'208";a="96427907"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 16 Jul 2020 16:15:21 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 100B34CE2808
	for <meta-virtualization@yoctoproject.org>; Thu, 16 Jul 2020 16:15:20 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 16 Jul 2020 16:15:21 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-cephclient: Consolidate in a single file
Date: Fri, 17 Jul 2020 03:42:02 +0800
Message-ID: <1594928524-4453-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 100B34CE2808.A0754
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-cephclient.inc              | 26 -----------------
 .../python/python3-cephclient_0.1.0.5.bb      | 28 +++++++++++++++++--
 2 files changed, 26 insertions(+), 28 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-cephclient.inc

diff --git a/meta-openstack/recipes-devtools/python/python-cephclient.inc b/meta-openstack/recipes-devtools/python/python-cephclient.inc
deleted file mode 100644
index e8e0d0a..0000000
--- a/meta-openstack/recipes-devtools/python/python-cephclient.inc
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "A client library in python for the Ceph REST API."
-HOMEPAGE = "https://github.com/dmsimard/python-cephclient"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
-
-PYPI_PACKAGE = "python-cephclient"
-PYPI_SRC_URI = "https://pypi.python.org/packages/source/p/${PYPI_PACKAGE}/${PYPI_PACKAGE}-v${PV}.tar.gz"
-
-SRC_URI[md5sum] = "e3746607f1af1573a241b4995c10c938"
-SRC_URI[sha256sum] = "9776b786da2aebdc0439ea2f809cc8923f52bc0cf610f77a9c1348466961134b"
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
-        ${PYTHON_PN}-lxml \
-        ${PYTHON_PN}-requests \
-        ${PYTHON_PN}-cython \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-cephclient_0.1.0.5.bb b/meta-openstack/recipes-devtools/python/python3-cephclient_0.1.0.5.bb
index e05c1d5..65e84bf 100644
--- a/meta-openstack/recipes-devtools/python/python3-cephclient_0.1.0.5.bb
+++ b/meta-openstack/recipes-devtools/python/python3-cephclient_0.1.0.5.bb
@@ -1,2 +1,26 @@
-require python-cephclient.inc
-inherit setuptools3
+DESCRIPTION = "A client library in python for the Ceph REST API."
+HOMEPAGE = "https://github.com/dmsimard/python-cephclient"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
+
+PYPI_PACKAGE = "python-cephclient"
+PYPI_SRC_URI = "https://pypi.python.org/packages/source/p/${PYPI_PACKAGE}/${PYPI_PACKAGE}-v${PV}.tar.gz"
+
+SRC_URI[md5sum] = "e3746607f1af1573a241b4995c10c938"
+SRC_URI[sha256sum] = "9776b786da2aebdc0439ea2f809cc8923f52bc0cf610f77a9c1348466961134b"
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
+        ${PYTHON_PN}-lxml \
+        ${PYTHON_PN}-requests \
+        ${PYTHON_PN}-cython \
+        "
-- 
2.25.1



