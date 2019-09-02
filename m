Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D05C9E00D8A; Sun,  1 Sep 2019 20:36:45 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9EFFE00D4E
	for <meta-virtualization@yoctoproject.org>;
	Sun,  1 Sep 2019 20:36:44 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,457,1559491200"; d="scan'208";a="74682153"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Sep 2019 11:36:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 139AB4CE14E3
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Sep 2019 11:36:41 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 2 Sep 2019 11:36:44 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 2 Sep 2019 11:36:07 +0800
Message-ID: <20190902033607.30770-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 139AB4CE14E3.AC1E3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-posix-ipc: Add python3 version
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
X-List-Received-Date: Mon, 02 Sep 2019 03:36:45 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-posix-ipc.inc   | 25 ++++++++++++++++++++
 .../python/python-posix-ipc_1.0.4.bb               | 27 ++--------------------
 .../python/python3-posix-ipc_1.0.4.bb              |  2 ++
 3 files changed, 29 insertions(+), 25 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-posix-ipc.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-posix-ipc_1.0.4.bb

diff --git a/meta-openstack/recipes-devtools/python/python-posix-ipc.inc b/meta-openstack/recipes-devtools/python/python-posix-ipc.inc
new file mode 100644
index 0000000..32557f0
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-posix-ipc.inc
@@ -0,0 +1,25 @@
+DESCRIPTION = "POSIX IPC primitives (semaphores, shared memory and message queues) for Python"
+HOMEPAGE = "http://semanchuk.com/philip/posix_ipc/"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dc089fb2f37e90799a54c19a20c9880f"
+
+PYPI_PACKAGE = "posix_ipc"
+
+# Archived version so we need to overwrite what the pypi class will derive
+PYPI_SRC_URI = "https://pypi.python.org/packages/source/p/${PYPI_PACKAGE}/${PYPI_PACKAGE}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "c4fd0065244ccb2f59cb8ceedf287cf6"
+SRC_URI[sha256sum] = "ff6c9077633fc62a491d6997c43b094d885bb45a7ca1f36c9a0d647c54b74b14"
+
+inherit pypi
+
+# DEPENDS_default: python-pip
+
+DEPENDS += " \
+        ${PYTHON_PN}-pip \
+        "
+
+# RDEPENDS_default: 
+RDEPENDS_${PN} += " \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-posix-ipc_1.0.4.bb b/meta-openstack/recipes-devtools/python/python-posix-ipc_1.0.4.bb
index f1494d1..595af50 100644
--- a/meta-openstack/recipes-devtools/python/python-posix-ipc_1.0.4.bb
+++ b/meta-openstack/recipes-devtools/python/python-posix-ipc_1.0.4.bb
@@ -1,25 +1,2 @@
-DESCRIPTION = "POSIX IPC primitives (semaphores, shared memory and message queues) for Python"
-HOMEPAGE = "http://semanchuk.com/philip/posix_ipc/"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dc089fb2f37e90799a54c19a20c9880f"
-
-PYPI_PACKAGE = "posix_ipc"
-
-# Archived version so we need to overwrite what the pypi class will derive
-PYPI_SRC_URI = "https://pypi.python.org/packages/source/p/${PYPI_PACKAGE}/${PYPI_PACKAGE}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "c4fd0065244ccb2f59cb8ceedf287cf6"
-SRC_URI[sha256sum] = "ff6c9077633fc62a491d6997c43b094d885bb45a7ca1f36c9a0d647c54b74b14"
-
-inherit setuptools pypi
-
-# DEPENDS_default: python-pip
-
-DEPENDS += " \
-        python-pip \
-        "
-
-# RDEPENDS_default: 
-RDEPENDS_${PN} += " \
-        "
+inherit setuptools
+require python-posix-ipc.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-posix-ipc_1.0.4.bb b/meta-openstack/recipes-devtools/python/python3-posix-ipc_1.0.4.bb
new file mode 100644
index 0000000..9e79b1c
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-posix-ipc_1.0.4.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-posix-ipc.inc
-- 
2.7.4




