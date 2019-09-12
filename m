Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0D920E00E07; Thu, 12 Sep 2019 00:57:34 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0ECF6E00782
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Sep 2019 00:57:32 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,495,1559491200"; d="scan'208";a="75357727"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Sep 2019 15:57:29 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3CFEF4CE0C9C
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Sep 2019 15:57:19 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 12 Sep 2019 15:57:32 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 12 Sep 2019 15:57:18 +0800
Message-ID: <20190912075718.1652-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 3CFEF4CE0C9C.AC909
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-simplegeneric: Add python3 version
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
X-List-Received-Date: Thu, 12 Sep 2019 07:57:34 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-simplegeneric.inc       | 12 ++++++++++++
 .../recipes-devtools/python/python-simplegeneric_0.8.1.bb  | 14 ++------------
 .../recipes-devtools/python/python3-simplegeneric_0.8.1.bb |  2 ++
 3 files changed, 16 insertions(+), 12 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-simplegeneric.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-simplegeneric_0.8.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-simplegeneric.inc b/meta-openstack/recipes-devtools/python/python-simplegeneric.inc
new file mode 100644
index 0000000..2cd9fc0
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-simplegeneric.inc
@@ -0,0 +1,12 @@
+DESCRIPTION = "Simple generic functions"
+HOMEPAGE = "https://pypi.python.org/pypi/simplegeneric/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README.txt;md5=2085f2c228ed80422edf70e52e86c34b"
+
+PYPI_PACKAGE_EXT = "zip"
+
+SRC_URI[md5sum] = "f9c1fab00fd981be588fc32759f474e3"
+SRC_URI[sha256sum] = "dc972e06094b9af5b855b3df4a646395e43d1c9d0d39ed345b7393560d0b9173"
+
+inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python-simplegeneric_0.8.1.bb b/meta-openstack/recipes-devtools/python/python-simplegeneric_0.8.1.bb
index 35c0555..5a1cc6a 100644
--- a/meta-openstack/recipes-devtools/python/python-simplegeneric_0.8.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-simplegeneric_0.8.1.bb
@@ -1,12 +1,2 @@
-DESCRIPTION = "Simple generic functions"
-HOMEPAGE = "https://pypi.python.org/pypi/simplegeneric/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.txt;md5=2085f2c228ed80422edf70e52e86c34b"
-
-PYPI_PACKAGE_EXT = "zip"
-
-SRC_URI[md5sum] = "f9c1fab00fd981be588fc32759f474e3"
-SRC_URI[sha256sum] = "dc972e06094b9af5b855b3df4a646395e43d1c9d0d39ed345b7393560d0b9173"
-
-inherit setuptools pypi
+inherit setuptools
+require python-simplegeneric.inc 
diff --git a/meta-openstack/recipes-devtools/python/python3-simplegeneric_0.8.1.bb b/meta-openstack/recipes-devtools/python/python3-simplegeneric_0.8.1.bb
new file mode 100644
index 0000000..56ad221
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-simplegeneric_0.8.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-simplegeneric.inc 
-- 
2.7.4




