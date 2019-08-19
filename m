Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 64E55E00C46; Sun, 18 Aug 2019 22:46:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F0D5E00798
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Aug 2019 22:46:36 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,403,1559491200"; d="scan'208";a="73868462"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Aug 2019 13:46:34 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id CFFE14CE03CB
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Aug 2019 13:46:34 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 19 Aug 2019 13:46:40 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 19 Aug 2019 13:45:54 +0800
Message-ID: <1566193554-76760-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: CFFE14CE03CB.AC0D5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-oslo.i18n: Add python3 version
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
X-List-Received-Date: Mon, 19 Aug 2019 05:46:40 -0000
Content-Type: text/plain

Providing a python3 version of python-oslo.i18n.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-oslo.i18n.inc               | 32 +++++++++++++++++
 .../python/python-oslo.i18n_git.bb            | 34 +------------------
 .../python/python3-oslo.i18n_git.bb           |  2 ++
 3 files changed, 35 insertions(+), 33 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.i18n.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-oslo.i18n_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.i18n.inc b/meta-openstack/recipes-devtools/python/python-oslo.i18n.inc
new file mode 100644
index 0000000..3c0e74c
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-oslo.i18n.inc
@@ -0,0 +1,32 @@
+DESCRIPTION = "oslo.i18n library"
+HOMEPAGE = "http://launchpad.net/oslo"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+
+PV = "3.17.0+git${SRCPV}"
+SRCREV = "f2729cd36f8694a6ec53a0e700599ddf4427440d"
+
+SRCNAME = "oslo.i18n"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
+
+S = "${WORKDIR}/git"
+
+# DEPENDS_default: python-pip
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
+        ${PYTHON_PN}-babel \
+        ${PYTHON_PN}-pbr \
+        ${PYTHON_PN}-six \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
index 9f7ddc5..b990e67 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
@@ -1,34 +1,2 @@
-DESCRIPTION = "oslo.i18n library"
-HOMEPAGE = "http://launchpad.net/oslo"
-SECTION = "devel/python"
-LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
-
-PV = "3.17.0+git${SRCPV}"
-SRCREV = "f2729cd36f8694a6ec53a0e700599ddf4427440d"
-
-SRCNAME = "oslo.i18n"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
-
-S = "${WORKDIR}/git"
-
 inherit setuptools
-
-# DEPENDS_default: python-pip
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
-RDEPENDS_${PN} += " \
-        python-babel \
-        python-pbr \
-        python-six \
-        "
+require python-oslo.i18n.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-oslo.i18n_git.bb b/meta-openstack/recipes-devtools/python/python3-oslo.i18n_git.bb
new file mode 100644
index 0000000..5a06622
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-oslo.i18n_git.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-oslo.i18n.inc
-- 
2.17.1




