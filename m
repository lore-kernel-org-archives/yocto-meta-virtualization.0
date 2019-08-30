Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E6356E00C78; Thu, 29 Aug 2019 22:47:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45BC7E00B65
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 22:47:02 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,445,1559491200"; d="scan'208";a="74569766"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Aug 2019 13:47:01 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 16F834CE0897
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Aug 2019 13:47:01 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 30 Aug 2019 13:47:04 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 30 Aug 2019 13:46:27 +0800
Message-ID: <20190830054627.18366-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 16F834CE0897.AA29C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-happybase: Add python3 version
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
X-List-Received-Date: Fri, 30 Aug 2019 05:47:04 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-happybase.inc     | 18 ++++++++++++++++++
 .../python/python-happybase_1.2.0.bb                 | 20 ++------------------
 .../python/python3-happybase_1.2.0.bb                |  2 ++
 3 files changed, 22 insertions(+), 18 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-happybase.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-happybase_1.2.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-happybase.inc b/meta-openstack/recipes-devtools/python/python-happybase.inc
new file mode 100644
index 0000000..325b2d1
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-happybase.inc
@@ -0,0 +1,18 @@
+DESCRIPTION = "Python library to interact with Apache HBase"
+HOMEPAGE = "https://pypi.python.org/pypi/happybase/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=41f55ae3d7000e4323e84c468d8b42ee"
+
+SRC_URI[md5sum] = "96cb7ea8163f531907fabd0dddc8b87e"
+SRC_URI[sha256sum] = "850b4ee651128588a57e1e152dd1252e5ec39776a5d3d14ee892b8bac0fa9e1a"
+
+inherit pypi
+
+do_install_append() {
+	perm_files=$(find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt")
+	perm_files="$perm_files "$(find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "PKG-INFO")
+	for f in $perm_files; do
+		chmod 644 "${f}"
+	done
+}
diff --git a/meta-openstack/recipes-devtools/python/python-happybase_1.2.0.bb b/meta-openstack/recipes-devtools/python/python-happybase_1.2.0.bb
index a8066b6..26e39a8 100644
--- a/meta-openstack/recipes-devtools/python/python-happybase_1.2.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-happybase_1.2.0.bb
@@ -1,18 +1,2 @@
-DESCRIPTION = "Python library to interact with Apache HBase"
-HOMEPAGE = "https://pypi.python.org/pypi/happybase/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=41f55ae3d7000e4323e84c468d8b42ee"
-
-SRC_URI[md5sum] = "96cb7ea8163f531907fabd0dddc8b87e"
-SRC_URI[sha256sum] = "850b4ee651128588a57e1e152dd1252e5ec39776a5d3d14ee892b8bac0fa9e1a"
-
-inherit setuptools pypi
-
-do_install_append() {
-	perm_files=$(find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt")
-	perm_files="$perm_files "$(find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "PKG-INFO")
-	for f in $perm_files; do
-		chmod 644 "${f}"
-	done
-}
+inherit setuptools
+require python-happybase.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-happybase_1.2.0.bb b/meta-openstack/recipes-devtools/python/python3-happybase_1.2.0.bb
new file mode 100644
index 0000000..8b5571b
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-happybase_1.2.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-happybase.inc
-- 
2.7.4




