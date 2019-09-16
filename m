Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 86109E00D33; Sun, 15 Sep 2019 20:12:49 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 911E3E00790
	for <meta-virtualization@yoctoproject.org>;
	Sun, 15 Sep 2019 20:12:48 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,510,1559491200"; d="scan'208";a="75503376"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Sep 2019 11:12:45 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 23C2B4CE14E1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Sep 2019 11:12:28 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 16 Sep 2019 11:12:52 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Sep 2019 11:12:34 +0800
Message-ID: <20190916031234.2983-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 23C2B4CE14E1.A83EA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-pecan: Add python3 version
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
X-List-Received-Date: Mon, 16 Sep 2019 03:12:49 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-pecan.inc           | 16 ++++++++++++++++
 .../recipes-devtools/python/python-pecan_1.3.3.bb      | 18 ++----------------
 .../recipes-devtools/python/python3-pecan_1.3.3.bb     |  2 ++
 3 files changed, 20 insertions(+), 16 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-pecan.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-pecan_1.3.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pecan.inc b/meta-openstack/recipes-devtools/python/python-pecan.inc
new file mode 100644
index 0000000..884ce75
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-pecan.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "WSGI object-dispatching web framework"
+HOMEPAGE = "https://pypi.python.org/pypi/pecan/"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d846877d24bbb3d7a00a985c90378e8c"
+
+SRC_URI[md5sum] = "8f006ed860f7fbdf0c0bf5ad0cf2f3b4"
+SRC_URI[sha256sum] = "b5461add4e3f35a7ee377b3d7f72ff13e93f40f3823b3208ab978b29bde936ff"
+
+inherit pypi
+
+RDEPENDS_${PN} = "${PYTHON_PN}-mako \
+                  ${PYTHON_PN}-webtest \
+                  ${PYTHON_PN}-six \
+                  ${PYTHON_PN}-logutils \
+"
diff --git a/meta-openstack/recipes-devtools/python/python-pecan_1.3.3.bb b/meta-openstack/recipes-devtools/python/python-pecan_1.3.3.bb
index 62f29fa..6fa052e 100644
--- a/meta-openstack/recipes-devtools/python/python-pecan_1.3.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-pecan_1.3.3.bb
@@ -1,16 +1,2 @@
-DESCRIPTION = "WSGI object-dispatching web framework"
-HOMEPAGE = "https://pypi.python.org/pypi/pecan/"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d846877d24bbb3d7a00a985c90378e8c"
-
-SRC_URI[md5sum] = "8f006ed860f7fbdf0c0bf5ad0cf2f3b4"
-SRC_URI[sha256sum] = "b5461add4e3f35a7ee377b3d7f72ff13e93f40f3823b3208ab978b29bde936ff"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN} = "python-mako \
-                  python-webtest \
-                  python-six \
-                  python-logutils \
-"
+inherit setuptools
+require python-pecan.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-pecan_1.3.3.bb b/meta-openstack/recipes-devtools/python/python3-pecan_1.3.3.bb
new file mode 100644
index 0000000..2e6a223
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-pecan_1.3.3.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pecan.inc
-- 
2.7.4




