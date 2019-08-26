Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AB439E00D59; Sun, 25 Aug 2019 22:47:25 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F0B8CE00CDF
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Aug 2019 22:47:24 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,431,1559491200"; d="scan'208";a="74278189"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Aug 2019 13:47:24 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 3EA434CE0457
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Aug 2019 13:47:16 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 26 Aug 2019 13:47:27 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 26 Aug 2019 13:46:59 +0800
Message-ID: <1566798419-114849-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 3EA434CE0457.A7041
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-keystoneauth1: Add python3 version
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
X-List-Received-Date: Mon, 26 Aug 2019 05:47:25 -0000
Content-Type: text/plain

Providing a python3 version of python-keystoneauth1.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-keystoneauth1.inc           | 27 +++++++++++++++++
 .../python/python-keystoneauth1_3.17.0.bb     | 29 ++-----------------
 .../python/python3-keystoneauth1_3.17.0.bb    |  2 ++
 3 files changed, 31 insertions(+), 27 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-keystoneauth1.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.17.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc b/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc
new file mode 100644
index 0000000..3d6309d
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc
@@ -0,0 +1,27 @@
+DESCRIPTION = "Authentication Library for OpenStack Identity"
+HOMEPAGE = "https://pypi.python.org/pypi/keystoneauth1"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=96f840d59b245a1c817fbcb901afc574"
+
+SRC_URI[md5sum] = "599340c2b3ccbcf9996870478abb5407"
+SRC_URI[sha256sum] = "59a4488ceae0c1210cba468945013b875b2ce09d99c54c9fcc9c926aea55dfd7"
+
+inherit pypi
+
+DEPENDS += " \
+        ${PYTHON_PN}-pbr \
+        "
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        ${PYTHON_PN}-pbr-native \
+        "
+
+RDEPENDS_${PN} += " \
+        ${PYTHON_PN}-pbr \
+        ${PYTHON_PN}-iso8601 \
+        ${PYTHON_PN}-requests \
+        ${PYTHON_PN}-six \
+        ${PYTHON_PN}-stevedore \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.0.bb b/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.0.bb
index 18115b2..f244f7d 100644
--- a/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.0.bb
@@ -1,27 +1,2 @@
-DESCRIPTION = "Authentication Library for OpenStack Identity"
-HOMEPAGE = "https://pypi.python.org/pypi/keystoneauth1"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=96f840d59b245a1c817fbcb901afc574"
-
-SRC_URI[md5sum] = "599340c2b3ccbcf9996870478abb5407"
-SRC_URI[sha256sum] = "59a4488ceae0c1210cba468945013b875b2ce09d99c54c9fcc9c926aea55dfd7"
-
-inherit setuptools pypi
-
-DEPENDS += " \
-        python-pbr \
-        "
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-        python-pbr-native \
-        "
-
-RDEPENDS_${PN} += " \
-        python-pbr \
-        python-iso8601 \
-        python-requests \
-        python-six \
-        python-stevedore \
-        "
+inherit setuptools
+require python-keystoneauth1.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.17.0.bb b/meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.17.0.bb
new file mode 100644
index 0000000..75adf3d
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.17.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-keystoneauth1.inc
-- 
2.17.1




