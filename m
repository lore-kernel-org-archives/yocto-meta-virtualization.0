Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 57BA5E00C46; Mon, 12 Aug 2019 01:10:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B8F87E009EA
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 01:10:43 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,376,1559491200"; d="scan'208";a="73497152"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Aug 2019 16:10:38 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id C2A234CE030F
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 16:10:40 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 12 Aug 2019 16:10:44 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 12 Aug 2019 16:10:30 +0800
Message-ID: <1565597430-78846-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: C2A234CE030F.A838F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-wsme: Add python3 version
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Aug 2019 08:10:45 -0000
Content-Type: text/plain

Providing a python3 version of python-wsme.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-wsme.inc   | 24 +++++++++++++++++
 .../python/python-wsme_0.9.3.bb               | 26 +------------------
 .../python/python3-wsme_0.9.3.bb              |  2 ++
 3 files changed, 27 insertions(+), 25 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-wsme.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-wsme_0.9.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-wsme.inc b/meta-openstack/recipes-devtools/python/python-wsme.inc
new file mode 100644
index 0000000..b402a09
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-wsme.inc
@@ -0,0 +1,24 @@
+DESCRIPTION = "Simplify the writing of REST APIs, and extend them with additional protocols"
+HOMEPAGE = "https://pypi.python.org/pypi/WSME/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5a9126e7f56a0cf3247050de7f10d0f4"
+
+PYPI_PACKAGE = "WSME"
+
+SRC_URI[md5sum] = "e6cb3864bae872acaa0cd0c2efacc94f"
+SRC_URI[sha256sum] = "e24fcff24392a0b176e560ffc6591b1f658342bbc992f84e0e8a3c53fd92580a"
+
+DEPENDS += " \
+        ${PYTHON_PN}-pip \
+        ${PYTHON_PN}-pbr \
+        "
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        ${PYTHON_PN}-pbr-native \
+        "
+
+RDEPENDS_${PN} += "\
+        ${PYTHON_PN}-pbr \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-wsme_0.9.3.bb b/meta-openstack/recipes-devtools/python/python-wsme_0.9.3.bb
index 4e83299..b332f5f 100644
--- a/meta-openstack/recipes-devtools/python/python-wsme_0.9.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-wsme_0.9.3.bb
@@ -1,26 +1,2 @@
-DESCRIPTION = "Simplify the writing of REST APIs, and extend them with additional protocols"
-HOMEPAGE = "https://pypi.python.org/pypi/WSME/"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5a9126e7f56a0cf3247050de7f10d0f4"
-
-PYPI_PACKAGE = "WSME"
-
-SRC_URI[md5sum] = "e6cb3864bae872acaa0cd0c2efacc94f"
-SRC_URI[sha256sum] = "e24fcff24392a0b176e560ffc6591b1f658342bbc992f84e0e8a3c53fd92580a"
-
 inherit setuptools pypi
-
-DEPENDS += " \
-        python-pip \
-        python-pbr \
-        "
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-        python-pbr-native \
-        "
-
-RDEPENDS_${PN} += "\
-        python-pbr \
-        "
+require python-wsme.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-wsme_0.9.3.bb b/meta-openstack/recipes-devtools/python/python3-wsme_0.9.3.bb
new file mode 100644
index 0000000..f792d0e
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-wsme_0.9.3.bb
@@ -0,0 +1,2 @@
+inherit setuptools3 pypi
+require python-wsme.inc
-- 
2.17.1




