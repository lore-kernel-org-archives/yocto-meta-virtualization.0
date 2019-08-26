Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 265C3E00D59; Mon, 26 Aug 2019 00:39:57 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A81BE009D8
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Aug 2019 00:39:54 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,431,1559491200"; d="scan'208";a="74283090"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Aug 2019 15:39:53 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id AD8B74CE0327
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Aug 2019 15:39:42 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 26 Aug 2019 15:39:54 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 26 Aug 2019 15:39:43 +0800
Message-ID: <1566805183-116675-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: AD8B74CE0327.A7075
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-debtcollector: Add python3 version
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
X-List-Received-Date: Mon, 26 Aug 2019 07:39:57 -0000
Content-Type: text/plain

Providing a python3 version of python-debtcollector.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-debtcollector.inc           | 25 +++++++++++++++++++
 .../python/python-debtcollector_1.21.0.bb     | 25 +++----------------
 .../python/python3-debtcollector_1.21.0.bb    |  2 ++
 3 files changed, 30 insertions(+), 22 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-debtcollector.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-debtcollector_1.21.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-debtcollector.inc b/meta-openstack/recipes-devtools/python/python-debtcollector.inc
new file mode 100644
index 0000000..629a059
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-debtcollector.inc
@@ -0,0 +1,25 @@
+DESCRIPTION = "A collection of Python deprecation patterns and strategies that help you collect your technical debt in a non-destructive manner."
+HOMEPAGE = "http://docs.openstack.org/developer/debtcollector/"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI[md5sum] = "ec899623b37fdee65b888243f0a46735"
+SRC_URI[sha256sum] = "f6ce5a383ad73c23e1138dbb69bf45d33f4a4bdec38f02dbf2b89477ec5e55bc"
+
+inherit pypi
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
+# RDEPENDS_default:
+RDEPENDS_${PN} += " \
+        ${PYTHON_PN}-pbr \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-debtcollector_1.21.0.bb b/meta-openstack/recipes-devtools/python/python-debtcollector_1.21.0.bb
index 18b910b..1cdfc3a 100644
--- a/meta-openstack/recipes-devtools/python/python-debtcollector_1.21.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-debtcollector_1.21.0.bb
@@ -1,26 +1,7 @@
-DESCRIPTION = "A collection of Python deprecation patterns and strategies that help you collect your technical debt in a non-destructive manner."
-HOMEPAGE = "http://docs.openstack.org/developer/debtcollector/"
-SECTION = "devel/python"
-LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+inherit setuptools
+require python-debtcollector.inc
 
-SRC_URI[md5sum] = "ec899623b37fdee65b888243f0a46735"
-SRC_URI[sha256sum] = "f6ce5a383ad73c23e1138dbb69bf45d33f4a4bdec38f02dbf2b89477ec5e55bc"
-
-inherit setuptools pypi
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
-# RDEPENDS_default:
+# Only for Python2 depends on funcsigs
 RDEPENDS_${PN} += " \
-        python-pbr \
         python-funcsigs \
         "
diff --git a/meta-openstack/recipes-devtools/python/python3-debtcollector_1.21.0.bb b/meta-openstack/recipes-devtools/python/python3-debtcollector_1.21.0.bb
new file mode 100644
index 0000000..7947185
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-debtcollector_1.21.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-debtcollector.inc
-- 
2.17.1




