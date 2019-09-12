Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B480CE00DE4; Thu, 12 Sep 2019 00:15:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7A23E00B8F
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Sep 2019 00:15:23 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,495,1559491200"; d="scan'208";a="75349175"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Sep 2019 15:15:21 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 469784CE0C9C
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Sep 2019 15:15:06 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 12 Sep 2019 15:15:20 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 12 Sep 2019 15:15:05 +0800
Message-ID: <20190912071505.1140-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 469784CE0C9C.A927E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-suds-jurko: Add python3 version
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
X-List-Received-Date: Thu, 12 Sep 2019 07:15:24 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-suds-jurko.inc   | 20 ++++++++++++++++++++
 .../python/python-suds-jurko_0.6.bb                 | 21 ++-------------------
 .../python/python3-suds-jurko_0.6.bb                |  3 +++
 3 files changed, 25 insertions(+), 19 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-suds-jurko.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-suds-jurko_0.6.bb

diff --git a/meta-openstack/recipes-devtools/python/python-suds-jurko.inc b/meta-openstack/recipes-devtools/python/python-suds-jurko.inc
new file mode 100644
index 0000000..579212a
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-suds-jurko.inc
@@ -0,0 +1,20 @@
+DESCRIPTION = "Lightweight SOAP client (Jurko's fork)"
+HOMEPAGE = "https://bitbucket.org/jurko/suds"
+SECTION = "devel/python"
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=847e96bce86d8774f491a92924343a29"
+
+PYPI_PACKAGE_EXT = "tar.bz2"
+
+SRC_URI[md5sum] = "1309e9bc2454aa3434041f0a24ae4e11"
+SRC_URI[sha256sum] = "29edb72fd21e3044093d86f33c66cf847c5aaab26d64cb90e69e528ef014e57f"
+
+inherit pypi
+
+DEPENDS += " \
+        ${PYTHON_PN}-pip \
+        "
+
+RDEPENDS_${PN} += " \
+        "
+
diff --git a/meta-openstack/recipes-devtools/python/python-suds-jurko_0.6.bb b/meta-openstack/recipes-devtools/python/python-suds-jurko_0.6.bb
index a4a436f..52bb6d8 100644
--- a/meta-openstack/recipes-devtools/python/python-suds-jurko_0.6.bb
+++ b/meta-openstack/recipes-devtools/python/python-suds-jurko_0.6.bb
@@ -1,20 +1,3 @@
-DESCRIPTION = "Lightweight SOAP client (Jurko's fork)"
-HOMEPAGE = "https://bitbucket.org/jurko/suds"
-SECTION = "devel/python"
-LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=847e96bce86d8774f491a92924343a29"
-
-PYPI_PACKAGE_EXT = "tar.bz2"
-
-SRC_URI[md5sum] = "1309e9bc2454aa3434041f0a24ae4e11"
-SRC_URI[sha256sum] = "29edb72fd21e3044093d86f33c66cf847c5aaab26d64cb90e69e528ef014e57f"
-
-inherit setuptools pypi
-
-DEPENDS += " \
-        python-pip \
-        "
-
-RDEPENDS_${PN} += " \
-        "
+inherit setuptools
+require python-suds-jurko.inc
 
diff --git a/meta-openstack/recipes-devtools/python/python3-suds-jurko_0.6.bb b/meta-openstack/recipes-devtools/python/python3-suds-jurko_0.6.bb
new file mode 100644
index 0000000..d230c8d
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-suds-jurko_0.6.bb
@@ -0,0 +1,3 @@
+inherit setuptools3
+require python-suds-jurko.inc
+
-- 
2.7.4




