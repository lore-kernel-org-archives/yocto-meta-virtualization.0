Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 14693E00D8A; Sun,  1 Sep 2019 20:24:10 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56647E00D4E
	for <meta-virtualization@yoctoproject.org>;
	Sun,  1 Sep 2019 20:24:09 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,457,1559491200"; d="scan'208";a="74681652"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Sep 2019 11:24:07 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 72F334CE14E6
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Sep 2019 11:24:06 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 2 Sep 2019 11:24:09 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 2 Sep 2019 11:23:32 +0800
Message-ID: <20190902032332.30539-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 72F334CE14E6.A8C9B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-positional: Add python3 version
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
X-List-Received-Date: Mon, 02 Sep 2019 03:24:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-positional.inc  | 21 ++++++++++++++++++++
 .../python/python-positional_1.2.1.bb              | 23 ++--------------------
 .../python/python3-positional_1.2.1.bb             |  2 ++
 3 files changed, 25 insertions(+), 21 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-positional.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-positional_1.2.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-positional.inc b/meta-openstack/recipes-devtools/python/python-positional.inc
new file mode 100644
index 0000000..736e691
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-positional.inc
@@ -0,0 +1,21 @@
+DESCRIPTION = "Library to enforce positional or key-word arguments"
+HOMEPAGE = "https://github.com/morganfainberg/positional"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5335066555b14d832335aa4660d6c376"
+
+SRC_URI[md5sum] = "4afcffd8e2ba733fd7a50f137a2ee893"
+SRC_URI[sha256sum] = "cf48ea169f6c39486d5efa0ce7126a97bed979a52af6261cf255a41f9a74453a"
+
+inherit pypi
+
+CLEANBROKEN = "1"
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        ${PYTHON_PN}-pbr-native \
+        "
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-wrapt \
+"
diff --git a/meta-openstack/recipes-devtools/python/python-positional_1.2.1.bb b/meta-openstack/recipes-devtools/python/python-positional_1.2.1.bb
index 93eb6e1..14f0187 100644
--- a/meta-openstack/recipes-devtools/python/python-positional_1.2.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-positional_1.2.1.bb
@@ -1,21 +1,2 @@
-DESCRIPTION = "Library to enforce positional or key-word arguments"
-HOMEPAGE = "https://github.com/morganfainberg/positional"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5335066555b14d832335aa4660d6c376"
-
-SRC_URI[md5sum] = "4afcffd8e2ba733fd7a50f137a2ee893"
-SRC_URI[sha256sum] = "cf48ea169f6c39486d5efa0ce7126a97bed979a52af6261cf255a41f9a74453a"
-
-inherit setuptools pypi
-
-CLEANBROKEN = "1"
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-        python-pbr-native \
-        "
-
-RDEPENDS_${PN} += " \
-    python-wrapt \
-"
+inherit setuptools
+require python-positional.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-positional_1.2.1.bb b/meta-openstack/recipes-devtools/python/python3-positional_1.2.1.bb
new file mode 100644
index 0000000..3081cd2
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-positional_1.2.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-positional.inc
-- 
2.7.4




