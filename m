Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85F6FE00DCE; Mon,  9 Sep 2019 19:36:17 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99E3DE00DA7
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 19:36:16 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,487,1559491200"; d="scan'208";a="75195491"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Sep 2019 10:36:13 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 288444CE14E4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Sep 2019 10:36:03 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 10 Sep 2019 10:36:12 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 10 Sep 2019 10:35:38 +0800
Message-ID: <20190910023538.23354-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 288444CE14E4.A88B6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-sqlparse: Add python3 version
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
X-List-Received-Date: Tue, 10 Sep 2019 02:36:17 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-sqlparse.inc    | 22 ++++++++++++++++++++
 .../python/python-sqlparse_0.3.0.bb                | 24 ++--------------------
 .../python/python3-sqlparse_0.3.0.bb               |  2 ++
 3 files changed, 26 insertions(+), 22 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-sqlparse.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-sqlparse_0.3.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-sqlparse.inc b/meta-openstack/recipes-devtools/python/python-sqlparse.inc
new file mode 100644
index 0000000..cc55ff7
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-sqlparse.inc
@@ -0,0 +1,22 @@
+DESCRIPTION = "Non-validating SQL parser module"
+HOMEPAGE = "http://pypi.python.org/pypi/sqlparse"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
+
+SRC_URI[md5sum] = "2ce34181d6b7b234c9f3c0ecd1ffb93e"
+SRC_URI[sha256sum] = "7c3dca29c022744e95b547e867cee89f4fce4373f3549ccd8797d8eb52cdb873"
+
+export BUILD_SYS
+export HOST_SYS
+
+inherit pypi
+
+# DEPENDS_default: python-pip
+
+DEPENDS += " \
+        "
+
+# RDEPENDS_default: 
+RDEPENDS_${PN} += " \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-sqlparse_0.3.0.bb b/meta-openstack/recipes-devtools/python/python-sqlparse_0.3.0.bb
index 88a0e8c..2b7773f 100644
--- a/meta-openstack/recipes-devtools/python/python-sqlparse_0.3.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-sqlparse_0.3.0.bb
@@ -1,22 +1,2 @@
-DESCRIPTION = "Non-validating SQL parser module"
-HOMEPAGE = "http://pypi.python.org/pypi/sqlparse"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
-
-SRC_URI[md5sum] = "2ce34181d6b7b234c9f3c0ecd1ffb93e"
-SRC_URI[sha256sum] = "7c3dca29c022744e95b547e867cee89f4fce4373f3549ccd8797d8eb52cdb873"
-
-export BUILD_SYS
-export HOST_SYS
-
-inherit setuptools pypi
-
-# DEPENDS_default: python-pip
-
-DEPENDS += " \
-        "
-
-# RDEPENDS_default: 
-RDEPENDS_${PN} += " \
-        "
+inherit setuptools
+require python-sqlparse.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-sqlparse_0.3.0.bb b/meta-openstack/recipes-devtools/python/python3-sqlparse_0.3.0.bb
new file mode 100644
index 0000000..7b3bcf6
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-sqlparse_0.3.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-sqlparse.inc
-- 
2.7.4




