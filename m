Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A75E9E00DE2; Tue,  3 Sep 2019 19:39:00 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C7623E003E1
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 19:38:59 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,465,1559491200"; d="scan'208";a="74794648"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Sep 2019 10:38:58 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A942E4CE14E1
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Sep 2019 10:38:53 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 4 Sep 2019 10:38:56 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 4 Sep 2019 10:38:22 +0800
Message-ID: <20190904023822.1788-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: A942E4CE14E1.AA4CE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-fasteners: Add python3 version
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
X-List-Received-Date: Wed, 04 Sep 2019 02:39:00 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-fasteners.inc   | 24 ++++++++++++++++++++
 .../python/python-fasteners_git.bb                 | 26 +---------------------
 .../python/python3-fasteners_git.bb                |  2 ++
 3 files changed, 27 insertions(+), 25 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-fasteners.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-fasteners_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-fasteners.inc b/meta-openstack/recipes-devtools/python/python-fasteners.inc
new file mode 100644
index 0000000..6e5e5f0
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-fasteners.inc
@@ -0,0 +1,24 @@
+DESCRIPTION = "A python package that provides useful locks."
+HOMEPAGE = "https://github.com/harlowja/fasteners"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4476c4be31402271e101d9a4a3430d52"
+
+SRCNAME = "fasteners"
+
+PV = "0.15+git${SRCPV}"
+SRCREV = "75148cb679c351966cd4ad5e9d177048a0ea8380"
+
+SRC_URI = "git://github.com/harlowja/${SRCNAME}.git"
+
+S = "${WORKDIR}/git"
+
+DEPENDS += " \
+        ${PYTHON_PN}-pip \
+        ${PYTHON_PN}-pbr \
+        "
+
+# RDEPENDS_default:
+RDEPENDS_${PN} += " \
+        ${PYTHON_PN}-pbr \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-fasteners_git.bb b/meta-openstack/recipes-devtools/python/python-fasteners_git.bb
index 2dd3698..3a7326b 100644
--- a/meta-openstack/recipes-devtools/python/python-fasteners_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-fasteners_git.bb
@@ -1,26 +1,2 @@
-DESCRIPTION = "A python package that provides useful locks."
-HOMEPAGE = "https://github.com/harlowja/fasteners"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4476c4be31402271e101d9a4a3430d52"
-
-SRCNAME = "fasteners"
-
-PV = "0.15+git${SRCPV}"
-SRCREV = "75148cb679c351966cd4ad5e9d177048a0ea8380"
-
-SRC_URI = "git://github.com/harlowja/${SRCNAME}.git"
-
-S = "${WORKDIR}/git"
-
 inherit setuptools
-
-DEPENDS += " \
-        python-pip \
-        python-pbr \
-        "
-
-# RDEPENDS_default:
-RDEPENDS_${PN} += " \
-        python-pbr \
-        "
+require python-fasteners.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-fasteners_git.bb b/meta-openstack/recipes-devtools/python/python3-fasteners_git.bb
new file mode 100644
index 0000000..9b2053c
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-fasteners_git.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-fasteners.inc
-- 
2.7.4




