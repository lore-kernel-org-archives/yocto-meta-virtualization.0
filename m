Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1E193E007C9; Sun, 15 Sep 2019 19:45:49 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55732E007C9
	for <meta-virtualization@yoctoproject.org>;
	Sun, 15 Sep 2019 19:45:47 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,510,1559491200"; d="scan'208";a="75502306"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Sep 2019 10:45:47 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 3B35F4CE14E7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Sep 2019 10:45:29 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 16 Sep 2019 10:45:50 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Sep 2019 10:45:44 +0800
Message-ID: <1568601944-47504-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 3B35F4CE14E7.A745F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-osc-lib: Python3 version fix
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
X-List-Received-Date: Mon, 16 Sep 2019 02:45:49 -0000
Content-Type: text/plain

Specifies the major Python version being built using PYTHON_PN.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-osc-lib.inc                 | 27 ++++++++++++-------
 .../python/python-osc-lib_1.13.0.bb           |  7 +----
 .../python/python3-osc-lib_1.13.0.bb          |  8 +-----
 3 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-osc-lib.inc b/meta-openstack/recipes-devtools/python/python-osc-lib.inc
index 58e994c..0589137 100644
--- a/meta-openstack/recipes-devtools/python/python-osc-lib.inc
+++ b/meta-openstack/recipes-devtools/python/python-osc-lib.inc
@@ -7,17 +7,24 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 SRC_URI[md5sum] = "5e91028524b50a72f9913ccd2994cf77"
 SRC_URI[sha256sum] = "9dcd3b55bd887525a7020a8adbabb661a340fc4a4a707950dc1c6f0b286cce77"
 
+inherit pypi
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        ${PYTHON_PN}-pbr-native \
+        "
+
 RDEPENDS_${PN} += " \
-        python-pbr \
-        python-six \
-        python-babel \
-        python-cliff \
-        python-keystoneauth1 \
-        python-os-client-config \
-        python-oslo.i18n \
-        python-oslo.utils \
-        python-simplejson \
-        python-stevedore \
+        ${PYTHON_PN}-pbr \
+        ${PYTHON_PN}-six \
+        ${PYTHON_PN}-babel \
+        ${PYTHON_PN}-cliff \
+        ${PYTHON_PN}-keystoneauth1 \
+        ${PYTHON_PN}-os-client-config \
+        ${PYTHON_PN}-oslo.i18n \
+        ${PYTHON_PN}-oslo.utils \
+        ${PYTHON_PN}-simplejson \
+        ${PYTHON_PN}-stevedore \
         "
 
 CLEANBROKEN = "1"
diff --git a/meta-openstack/recipes-devtools/python/python-osc-lib_1.13.0.bb b/meta-openstack/recipes-devtools/python/python-osc-lib_1.13.0.bb
index 4ea2de2..d8c72e7 100644
--- a/meta-openstack/recipes-devtools/python/python-osc-lib_1.13.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-osc-lib_1.13.0.bb
@@ -1,7 +1,2 @@
-inherit setuptools pypi
+inherit setuptools
 require python-osc-lib.inc
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-        python-pbr-native \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-osc-lib_1.13.0.bb b/meta-openstack/recipes-devtools/python/python3-osc-lib_1.13.0.bb
index 63265d9..256c286 100644
--- a/meta-openstack/recipes-devtools/python/python3-osc-lib_1.13.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-osc-lib_1.13.0.bb
@@ -1,8 +1,2 @@
-inherit setuptools3 pypi
+inherit setuptools3
 require python-osc-lib.inc
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-        python3-pbr-native \
-        "
-
-- 
2.17.1




