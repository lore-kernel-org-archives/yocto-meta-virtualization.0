Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B3D3FE00DD3; Tue,  3 Sep 2019 19:23:53 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ECBC6E00D67
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 19:23:52 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,465,1559491200"; d="scan'208";a="74793900"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Sep 2019 10:23:51 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id C824F4CE14E8
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Sep 2019 10:23:49 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 4 Sep 2019 10:23:52 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 4 Sep 2019 10:23:18 +0800
Message-ID: <20190904022318.615-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: C824F4CE14E8.AC2D5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-logutils: Add python3 version
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
X-List-Received-Date: Wed, 04 Sep 2019 02:23:53 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-logutils.inc        | 16 ++++++++++++++++
 .../recipes-devtools/python/python-logutils_0.3.5.bb   | 18 ++----------------
 .../recipes-devtools/python/python3-logutils_0.3.5.bb  |  2 ++
 3 files changed, 20 insertions(+), 16 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-logutils.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-logutils_0.3.5.bb

diff --git a/meta-openstack/recipes-devtools/python/python-logutils.inc b/meta-openstack/recipes-devtools/python/python-logutils.inc
new file mode 100644
index 0000000..87ab631
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-logutils.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "Set of handlers for the Python standard library's logging package"
+HOMEPAGE = "https://pypi.python.org/pypi/logutils"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=44c35f0b8e2a27a2f33a4e4a5c65d014"
+
+SRC_URI[md5sum] = "fcd2f8e9217bfa0b580f253b35a9d954"
+SRC_URI[sha256sum] = "bc058a25d5c209461f134e1f03cab637d66a7a5ccc12e593db56fbb279899a82"
+
+inherit pypi
+
+# avoid "error: option --single-version-externally-managed not recognized"
+DISTUTILS_INSTALL_ARGS = "--root=${D} \
+    --prefix=${prefix} \
+    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
+    --install-data=${datadir}"
diff --git a/meta-openstack/recipes-devtools/python/python-logutils_0.3.5.bb b/meta-openstack/recipes-devtools/python/python-logutils_0.3.5.bb
index 51177b3..9331a16 100644
--- a/meta-openstack/recipes-devtools/python/python-logutils_0.3.5.bb
+++ b/meta-openstack/recipes-devtools/python/python-logutils_0.3.5.bb
@@ -1,16 +1,2 @@
-DESCRIPTION = "Set of handlers for the Python standard library's logging package"
-HOMEPAGE = "https://pypi.python.org/pypi/logutils"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=44c35f0b8e2a27a2f33a4e4a5c65d014"
-
-SRC_URI[md5sum] = "fcd2f8e9217bfa0b580f253b35a9d954"
-SRC_URI[sha256sum] = "bc058a25d5c209461f134e1f03cab637d66a7a5ccc12e593db56fbb279899a82"
-
-inherit setuptools pypi
-
-# avoid "error: option --single-version-externally-managed not recognized"
-DISTUTILS_INSTALL_ARGS = "--root=${D} \
-    --prefix=${prefix} \
-    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
-    --install-data=${datadir}"
+inherit setuptools
+require python-logutils.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-logutils_0.3.5.bb b/meta-openstack/recipes-devtools/python/python3-logutils_0.3.5.bb
new file mode 100644
index 0000000..4d760e0
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-logutils_0.3.5.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-logutils.inc
-- 
2.7.4




