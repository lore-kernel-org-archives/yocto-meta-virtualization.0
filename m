Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 467E8E00DDC; Sun,  1 Sep 2019 21:25:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63953E00E49
	for <meta-virtualization@yoctoproject.org>;
	Sun,  1 Sep 2019 21:25:14 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,457,1559491200"; d="scan'208";a="74683713"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Sep 2019 12:25:12 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 3B9424CDFCE9
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Sep 2019 12:25:11 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 2 Sep 2019 12:25:15 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 2 Sep 2019 12:24:30 +0800
Message-ID: <1567398270-112839-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 3B9424CDFCE9.A9DC4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-os-client-config: Add python3 version
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
X-List-Received-Date: Mon, 02 Sep 2019 04:25:26 -0000
Content-Type: text/plain

Providing a python3 version of python-os-client-config.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-os-client-config.inc        | 29 +++++++++++++++++
 .../python/python-os-client-config_git.bb     | 31 +------------------
 .../python/python3-os-client-config_git.bb    |  2 ++
 3 files changed, 32 insertions(+), 30 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-os-client-config.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-os-client-config_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-os-client-config.inc b/meta-openstack/recipes-devtools/python/python-os-client-config.inc
new file mode 100644
index 0000000..d549ea6
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-os-client-config.inc
@@ -0,0 +1,29 @@
+DESCRIPTION = "OpenStack Client Configuation Library"
+HOMEPAGE = "https://pypi.python.org/pypi/os-client-config"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+
+PV = "1.28.0"
+SRCREV = "261c05f0057d556a8910457f1e22ca4d81801081"
+
+SRCNAME = "os-client-config"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
+
+S = "${WORKDIR}/git"
+
+DEPENDS += " \
+        ${PYTHON_PN}-pbr \
+        "
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        ${PYTHON_PN}-pbr-native \
+        "
+
+RDEPENDS_${PN} += " \
+        ${PYTHON_PN}-pbr \
+        ${PYTHON_PN}-pyyaml \
+        ${PYTHON_PN}-appdirs \
+        ${PYTHON_PN}-keystoneauth1 \
+        ${PYTHON_PN}-requestsexceptions \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-os-client-config_git.bb b/meta-openstack/recipes-devtools/python/python-os-client-config_git.bb
index a48f2c4..3f42bdc 100644
--- a/meta-openstack/recipes-devtools/python/python-os-client-config_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-os-client-config_git.bb
@@ -1,31 +1,2 @@
-DESCRIPTION = "OpenStack Client Configuation Library"
-HOMEPAGE = "https://pypi.python.org/pypi/os-client-config"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
-
-PV = "1.28.0"
-SRCREV = "261c05f0057d556a8910457f1e22ca4d81801081"
-
-SRCNAME = "os-client-config"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
-
-S = "${WORKDIR}/git"
-
 inherit setuptools
-
-DEPENDS += " \
-        python-pbr \
-        "
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-        python-pbr-native \
-        "
-
-RDEPENDS_${PN} += " \
-        python-pbr \
-        python-pyyaml \
-        python-appdirs \
-        python-keystoneauth1 \
-        python-requestsexceptions \
-        "
+require python-os-client-config.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-os-client-config_git.bb b/meta-openstack/recipes-devtools/python/python3-os-client-config_git.bb
new file mode 100644
index 0000000..207d559
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-os-client-config_git.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-os-client-config.inc
-- 
2.17.1




