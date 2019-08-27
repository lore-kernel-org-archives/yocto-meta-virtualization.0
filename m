Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0C23E00C22; Mon, 26 Aug 2019 20:45:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E82A0E0097C
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Aug 2019 20:45:37 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,435,1559491200"; d="scan'208";a="74321210"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Aug 2019 11:45:35 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 99CBF4CDFCE4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Aug 2019 11:45:24 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 27 Aug 2019 11:45:33 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 27 Aug 2019 11:44:56 +0800
Message-ID: <20190827034456.7837-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 99CBF4CDFCE4.AD4A0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-contextlib2: Add python3 version
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
X-List-Received-Date: Tue, 27 Aug 2019 03:45:38 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-contextlib2.inc      | 16 ++++++++++++++++
 .../recipes-devtools/python/python-contextlib2_0.5.5.bb | 17 +----------------
 .../python/python3-contextlib2_0.5.5.bb                 |  3 +++
 3 files changed, 20 insertions(+), 16 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-contextlib2.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-contextlib2_0.5.5.bb

diff --git a/meta-openstack/recipes-devtools/python/python-contextlib2.inc b/meta-openstack/recipes-devtools/python/python-contextlib2.inc
new file mode 100644
index 0000000..0a45008
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-contextlib2.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "Backports and enhancements for the contextlib module"
+HOMEPAGE = "http://contextlib2.readthedocs.org/"
+SECTION = "devel/python"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=43d1c7827e8fad6454b553caf0e1d734"
+
+SRC_URI[md5sum] = "95fe420941ebc64951cd9d89edc41870"
+SRC_URI[sha256sum] = "509f9419ee91cdd00ba34443217d5ca51f5a364a404e1dce9e8979cea969ca48"
+
+DEPENDS += " \
+        ${PYTHON_PN}-pip \
+        "
+
+RDEPENDS_${PN} += " \
+        "
+
diff --git a/meta-openstack/recipes-devtools/python/python-contextlib2_0.5.5.bb b/meta-openstack/recipes-devtools/python/python-contextlib2_0.5.5.bb
index af9270e..c6a5c9b 100644
--- a/meta-openstack/recipes-devtools/python/python-contextlib2_0.5.5.bb
+++ b/meta-openstack/recipes-devtools/python/python-contextlib2_0.5.5.bb
@@ -1,18 +1,3 @@
-DESCRIPTION = "Backports and enhancements for the contextlib module"
-HOMEPAGE = "http://contextlib2.readthedocs.org/"
-SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=43d1c7827e8fad6454b553caf0e1d734"
-
-SRC_URI[md5sum] = "95fe420941ebc64951cd9d89edc41870"
-SRC_URI[sha256sum] = "509f9419ee91cdd00ba34443217d5ca51f5a364a404e1dce9e8979cea969ca48"
-
 inherit setuptools pypi
-
-DEPENDS += " \
-        python-pip \
-        "
-
-RDEPENDS_${PN} += " \
-        "
+require python-contextlib2.inc
 
diff --git a/meta-openstack/recipes-devtools/python/python3-contextlib2_0.5.5.bb b/meta-openstack/recipes-devtools/python/python3-contextlib2_0.5.5.bb
new file mode 100644
index 0000000..db5fa53
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-contextlib2_0.5.5.bb
@@ -0,0 +1,3 @@
+inherit setuptools3 pypi
+require python-contextlib2.inc
+
-- 
2.7.4




