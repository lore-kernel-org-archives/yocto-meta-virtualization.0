Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 125B2E00DDC; Mon,  9 Sep 2019 00:08:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54065E00DAA
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 00:08:05 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,483,1559491200"; d="scan'208";a="75155550"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Sep 2019 15:08:04 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 617004CE03E8
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 15:07:56 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 9 Sep 2019 15:08:16 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 9 Sep 2019 15:07:30 +0800
Message-ID: <20190909070730.12568-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 617004CE03E8.A8F7A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-testtools: Add python3 version
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
X-List-Received-Date: Mon, 09 Sep 2019 07:08:07 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-testtools.inc   | 23 ++++++++++++++++++++
 .../python/python-testtools_2.3.0.bb               | 25 ++--------------------
 .../python/python3-testtools_2.3.0.bb              |  2 ++
 3 files changed, 27 insertions(+), 23 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-testtools.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-testtools_2.3.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-testtools.inc b/meta-openstack/recipes-devtools/python/python-testtools.inc
new file mode 100644
index 0000000..7cc63f4
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-testtools.inc
@@ -0,0 +1,23 @@
+DESCRIPTION = "Extensions to the Python standard library unit testing framework"
+HOMEPAGE = "https://pypi.python.org/pypi/testtools/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c9d3e8ba7141c83bfef190e0b9379a"
+
+SRC_URI[md5sum] = "0f0feb915497816cb99e39437494217e"
+SRC_URI[sha256sum] = "5827ec6cf8233e0f29f51025addd713ca010061204fdea77484a2934690a0559"
+
+inherit pypi
+DEPENDS += " \
+    ${PYTHON_PN}-pbr \
+    "
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+    ${PYTHON_PN}-pbr-native \
+    "
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-extras \
+    ${PYTHON_PN}-pbr \
+    "
diff --git a/meta-openstack/recipes-devtools/python/python-testtools_2.3.0.bb b/meta-openstack/recipes-devtools/python/python-testtools_2.3.0.bb
index bbf1d01..56ff9de 100644
--- a/meta-openstack/recipes-devtools/python/python-testtools_2.3.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-testtools_2.3.0.bb
@@ -1,23 +1,2 @@
-DESCRIPTION = "Extensions to the Python standard library unit testing framework"
-HOMEPAGE = "https://pypi.python.org/pypi/testtools/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c9d3e8ba7141c83bfef190e0b9379a"
-
-SRC_URI[md5sum] = "0f0feb915497816cb99e39437494217e"
-SRC_URI[sha256sum] = "5827ec6cf8233e0f29f51025addd713ca010061204fdea77484a2934690a0559"
-
-inherit setuptools pypi
-DEPENDS += " \
-    python-pbr \
-    "
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-    python-pbr-native \
-    "
-
-RDEPENDS_${PN} += "\
-    python-extras \
-    python-pbr \
-    "
+inherit setuptools
+require python-testtools.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-testtools_2.3.0.bb b/meta-openstack/recipes-devtools/python/python3-testtools_2.3.0.bb
new file mode 100644
index 0000000..896ecee
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-testtools_2.3.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-testtools.inc
-- 
2.7.4




