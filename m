Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66E49E00D99; Mon, 26 Aug 2019 20:53:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AC9BAE00CDF
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Aug 2019 20:53:34 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,435,1559491200"; d="scan'208";a="74321500"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Aug 2019 11:53:33 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9DC424CDFCE4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Aug 2019 11:53:22 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 27 Aug 2019 11:53:30 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 27 Aug 2019 11:52:54 +0800
Message-ID: <20190827035254.7969-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 9DC424CDFCE4.AC09A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-croniter: Add python3 version
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
X-List-Received-Date: Tue, 27 Aug 2019 03:53:35 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-croniter.inc     | 19 +++++++++++++++++++
 .../python/python-croniter_0.3.30.bb                | 21 +--------------------
 .../python/python3-croniter_0.3.30.bb               |  2 ++
 3 files changed, 22 insertions(+), 20 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-croniter.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-croniter_0.3.30.bb

diff --git a/meta-openstack/recipes-devtools/python/python-croniter.inc b/meta-openstack/recipes-devtools/python/python-croniter.inc
new file mode 100644
index 0000000..885aa9e
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-croniter.inc
@@ -0,0 +1,19 @@
+DESCRIPTION = "croniter provides iteration for datetime object with cron like format"
+HOMEPAGE = "https://pypi.python.org/pypi/croniter/0.3.4"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
+
+# Archived version so we have to overwrite what the pypi class will derive
+PYPI_SRC_URI = "https://pypi.python.org/packages/source/c/croniter/croniter-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "e4a8987521b144c4c2149d4adde8f55c"
+SRC_URI[sha256sum] = "538adeb3a7f7816c3cdec6db974c441620d764c25ff4ed0146ee7296b8a50590"
+
+DEPENDS += " \
+        ${PYTHON_PN}-pip \
+        "
+
+RDEPENDS_${PN} += " \
+        ${PYTHON_PN}-dateutil \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-croniter_0.3.30.bb b/meta-openstack/recipes-devtools/python/python-croniter_0.3.30.bb
index 2859441..c5cb414 100644
--- a/meta-openstack/recipes-devtools/python/python-croniter_0.3.30.bb
+++ b/meta-openstack/recipes-devtools/python/python-croniter_0.3.30.bb
@@ -1,21 +1,2 @@
-DESCRIPTION = "croniter provides iteration for datetime object with cron like format"
-HOMEPAGE = "https://pypi.python.org/pypi/croniter/0.3.4"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
-
-# Archived version so we have to overwrite what the pypi class will derive
-PYPI_SRC_URI = "https://pypi.python.org/packages/source/c/croniter/croniter-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "e4a8987521b144c4c2149d4adde8f55c"
-SRC_URI[sha256sum] = "538adeb3a7f7816c3cdec6db974c441620d764c25ff4ed0146ee7296b8a50590"
-
 inherit setuptools pypi
-
-DEPENDS += " \
-        python-pip \
-        "
-
-RDEPENDS_${PN} += " \
-        python-dateutil \
-        "
+require python-croniter.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-croniter_0.3.30.bb b/meta-openstack/recipes-devtools/python/python3-croniter_0.3.30.bb
new file mode 100644
index 0000000..6ec5a00
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-croniter_0.3.30.bb
@@ -0,0 +1,2 @@
+inherit setuptools3 pypi
+require python-croniter.inc
-- 
2.7.4




