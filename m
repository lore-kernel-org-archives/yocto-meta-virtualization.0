Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 196CFE00D47; Mon, 23 Sep 2019 01:44:42 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3CE6DE00D38
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Sep 2019 01:44:40 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,539,1559491200"; d="scan'208";a="75879826"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Sep 2019 16:44:39 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6581B4CE14FB
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Sep 2019 16:44:36 +0800 (CST)
Received: from localhost.localdomain (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 23 Sep 2019 16:44:40 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 23 Sep 2019 16:44:22 +0800
Message-ID: <20190923084422.27655-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 6581B4CE14FB.AA5EB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-testscenarios: Add python3 version
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
X-List-Received-Date: Mon, 23 Sep 2019 08:44:42 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-testscenarios.inc                | 24 ++++++++++++++++++++
 .../python/python-testscenarios_0.5.0.bb           | 26 ++--------------------
 .../python/python3-testscenarios_0.5.0.bb          |  2 ++
 3 files changed, 28 insertions(+), 24 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-testscenarios.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-testscenarios_0.5.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-testscenarios.inc b/meta-openstack/recipes-devtools/python/python-testscenarios.inc
new file mode 100644
index 0000000..1008f11
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-testscenarios.inc
@@ -0,0 +1,24 @@
+DESCRIPTION = "testscenarios: a pyunit extension for dependency injection"
+HOMEPAGE = "https://pypi.python.org/pypi/testscenarios"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://BSD;md5=0805e4f024d089a52dca0671a65b8b66"
+
+SRC_URI[md5sum] = "859073d9e7b049aee2e6704c51f6001a"
+SRC_URI[sha256sum] = "c257cb6b90ea7e6f8fef3158121d430543412c9a87df30b5dde6ec8b9b57a2b6"
+
+inherit pypi
+
+DEPENDS += "\
+    ${PYTHON_PN}-pbr \
+    "
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+    ${PYTHON_PN}-pbr-native \
+    "
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-testtools \
+    ${PYTHON_PN}-pbr \
+    "
diff --git a/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb b/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb
index 18971d6..868a5b9 100644
--- a/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb
@@ -1,24 +1,2 @@
-DESCRIPTION = "testscenarios: a pyunit extension for dependency injection"
-HOMEPAGE = "https://pypi.python.org/pypi/testscenarios"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://BSD;md5=0805e4f024d089a52dca0671a65b8b66"
-
-SRC_URI[md5sum] = "859073d9e7b049aee2e6704c51f6001a"
-SRC_URI[sha256sum] = "c257cb6b90ea7e6f8fef3158121d430543412c9a87df30b5dde6ec8b9b57a2b6"
-
-inherit setuptools pypi
-
-DEPENDS += "\
-    python-pbr \
-    "
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-    python-pbr-native \
-    "
-
-RDEPENDS_${PN} += "\
-    python-testtools \
-    python-pbr \
-    "
+inherit setuptools
+require python-testscenarios.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-testscenarios_0.5.0.bb b/meta-openstack/recipes-devtools/python/python3-testscenarios_0.5.0.bb
new file mode 100644
index 0000000..6f7d418
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-testscenarios_0.5.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-testscenarios.inc
-- 
2.7.4




