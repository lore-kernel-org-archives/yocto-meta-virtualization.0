Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 47418E00B31; Mon, 12 Aug 2019 01:11:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8624CE00B31
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 01:11:46 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,376,1559491200"; d="scan'208";a="73497226"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Aug 2019 16:11:45 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id C94DF4CDDAE4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 16:11:43 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 12 Aug 2019 16:11:47 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 12 Aug 2019 16:10:57 +0800
Message-ID: <1565597457-78893-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: C94DF4CDDAE4.AB933
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-webtest: Add python3 version
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
X-List-Received-Date: Mon, 12 Aug 2019 08:11:47 -0000
Content-Type: text/plain

Providing a python3 version of python-webtest.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-webtest.inc     | 12 ++++++++++++
 .../python/python-webtest_2.0.33.bb                | 14 +-------------
 .../python/python3-webtest_2.0.33.bb               |  2 ++
 3 files changed, 15 insertions(+), 13 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-webtest.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-webtest_2.0.33.bb

diff --git a/meta-openstack/recipes-devtools/python/python-webtest.inc b/meta-openstack/recipes-devtools/python/python-webtest.inc
new file mode 100644
index 0000000..d4e9e07
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-webtest.inc
@@ -0,0 +1,12 @@
+DESCRIPTION = "Helper to test WSGI applications"
+HOMEPAGE = "https://pypi.python.org/pypi/WebTest/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README.rst;md5=e3e00192f000e33de99fd5a3cb32a8fc"
+
+PYPI_PACKAGE = "WebTest"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-beautifulsoup4"
+
+SRC_URI[md5sum] = "dd0385c725b85ac1e8079f38d2acd7b1"
+SRC_URI[sha256sum] = "41348efe4323a647a239c31cde84e5e440d726ca4f449859264e538d39037fd0"
diff --git a/meta-openstack/recipes-devtools/python/python-webtest_2.0.33.bb b/meta-openstack/recipes-devtools/python/python-webtest_2.0.33.bb
index 527f5c7..3a1fe90 100644
--- a/meta-openstack/recipes-devtools/python/python-webtest_2.0.33.bb
+++ b/meta-openstack/recipes-devtools/python/python-webtest_2.0.33.bb
@@ -1,14 +1,2 @@
-DESCRIPTION = "Helper to test WSGI applications"
-HOMEPAGE = "https://pypi.python.org/pypi/WebTest/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=e3e00192f000e33de99fd5a3cb32a8fc"
-
-PYPI_PACKAGE = "WebTest"
-
-RDEPENDS_${PN} += "python-beautifulsoup4"
-
-SRC_URI[md5sum] = "dd0385c725b85ac1e8079f38d2acd7b1"
-SRC_URI[sha256sum] = "41348efe4323a647a239c31cde84e5e440d726ca4f449859264e538d39037fd0"
-
 inherit setuptools pypi
+require python-webtest.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-webtest_2.0.33.bb b/meta-openstack/recipes-devtools/python/python3-webtest_2.0.33.bb
new file mode 100644
index 0000000..aaf0b42
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-webtest_2.0.33.bb
@@ -0,0 +1,2 @@
+inherit setuptools3 pypi
+require python-webtest.inc
-- 
2.17.1




