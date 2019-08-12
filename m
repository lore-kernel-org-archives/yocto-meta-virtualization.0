Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9E8FCE00D77; Mon, 12 Aug 2019 01:49:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B3E2E00B8F
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 01:49:03 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,376,1559491200"; d="scan'208";a="73500072"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Aug 2019 16:49:00 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id DD3B14CE030F
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 16:48:58 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 12 Aug 2019 16:49:02 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 12 Aug 2019 16:48:48 +0800
Message-ID: <1565599728-79421-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: DD3B14CE030F.A9A8C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-oslo.utils: Add python3 version
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
X-List-Received-Date: Mon, 12 Aug 2019 08:49:04 -0000
Content-Type: text/plain

Providing a python3 version of python-oslo.utils.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-oslo.utils.inc              | 41 +++++++++++++++++++
 .../python/python-oslo.utils_git.bb           | 41 +------------------
 .../python/python3-oslo.utils_git.bb          |  2 +
 3 files changed, 44 insertions(+), 40 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.utils.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-oslo.utils_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.utils.inc b/meta-openstack/recipes-devtools/python/python-oslo.utils.inc
new file mode 100644
index 0000000..04aa24a
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-oslo.utils.inc
@@ -0,0 +1,41 @@
+DESCRIPTION = "Oslo utils"
+HOMEPAGE = "https://launchpad.net/oslo"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+
+SRCNAME = "oslo.utils"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
+
+PV = "3.28.0+git${SRCPV}"
+SRCREV = "8b3965b9bbe1e31a4939f2f69c5239d6d5c7f72c"
+S = "${WORKDIR}/git"
+
+inherit setuptools
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
+        ${PYTHON_PN}-pbr \
+        ${PYTHON_PN}-six \
+        ${PYTHON_PN}-iso8601 \
+        ${PYTHON_PN}-oslo.i18n \
+        ${PYTHON_PN}-monotonic \
+        ${PYTHON_PN}-pytz \
+        ${PYTHON_PN}-netaddr \
+        ${PYTHON_PN}-netifaces \
+        ${PYTHON_PN}-debtcollector \
+        ${PYTHON_PN}-funcsigs \
+        ${PYTHON_PN}-pyparsing \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb
index e73bf53..fea3c85 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb
@@ -1,41 +1,2 @@
-DESCRIPTION = "Oslo utils"
-HOMEPAGE = "https://launchpad.net/oslo"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
-
-SRCNAME = "oslo.utils"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
-
-PV = "3.28.0+git${SRCPV}"
-SRCREV = "8b3965b9bbe1e31a4939f2f69c5239d6d5c7f72c"
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
-        python-pbr \
-        python-six \
-        python-iso8601 \
-        python-oslo.i18n \
-        python-monotonic \
-        python-pytz \
-        python-netaddr \
-        python-netifaces \
-        python-debtcollector \
-        python-funcsigs \
-        python-pyparsing \
-        "
+require python-oslo.utils.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-oslo.utils_git.bb b/meta-openstack/recipes-devtools/python/python3-oslo.utils_git.bb
new file mode 100644
index 0000000..3b4636a
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-oslo.utils_git.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-oslo.utils.inc
-- 
2.17.1




