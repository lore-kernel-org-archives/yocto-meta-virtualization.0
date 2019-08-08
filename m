Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 54F9FE00D9F; Wed,  7 Aug 2019 18:53:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00, DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 13CDEE00D67
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Aug 2019 18:53:38 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,358,1559491200"; d="scan'208";a="73180356"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Aug 2019 09:53:27 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 9B8884CDFCEE
	for <meta-virtualization@yoctoproject.org>;
	Thu,  8 Aug 2019 09:53:28 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 8 Aug 2019 09:53:35 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 8 Aug 2019 18:53:08 +0800
Message-ID: <1565261588-52140-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 9B8884CDFCEE.A9BAB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-osc-lib: Add python3 version
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
X-List-Received-Date: Thu, 08 Aug 2019 01:53:40 -0000
Content-Type: text/plain

Providing a python3 version of python-osc-lib.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-osc-lib.inc                 | 23 +++++++++++++++++
 .../python/python-osc-lib_1.13.0.bb           | 25 +------------------
 .../python/python3-osc-lib_1.13.0.bb          |  8 ++++++
 3 files changed, 32 insertions(+), 24 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-osc-lib.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-osc-lib_1.13.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-osc-lib.inc b/meta-openstack/recipes-devtools/python/python-osc-lib.inc
new file mode 100644
index 0000000..58e994c
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-osc-lib.inc
@@ -0,0 +1,23 @@
+DESCRIPTION = "OpenStackClient Library"
+HOMEPAGE = "http://opensource.perlig.de/rcssmin/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRC_URI[md5sum] = "5e91028524b50a72f9913ccd2994cf77"
+SRC_URI[sha256sum] = "9dcd3b55bd887525a7020a8adbabb661a340fc4a4a707950dc1c6f0b286cce77"
+
+RDEPENDS_${PN} += " \
+        python-pbr \
+        python-six \
+        python-babel \
+        python-cliff \
+        python-keystoneauth1 \
+        python-os-client-config \
+        python-oslo.i18n \
+        python-oslo.utils \
+        python-simplejson \
+        python-stevedore \
+        "
+
+CLEANBROKEN = "1"
diff --git a/meta-openstack/recipes-devtools/python/python-osc-lib_1.13.0.bb b/meta-openstack/recipes-devtools/python/python-osc-lib_1.13.0.bb
index 7540e79..4ea2de2 100644
--- a/meta-openstack/recipes-devtools/python/python-osc-lib_1.13.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-osc-lib_1.13.0.bb
@@ -1,30 +1,7 @@
-DESCRIPTION = "OpenStackClient Library"
-HOMEPAGE = "http://opensource.perlig.de/rcssmin/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
-
-SRC_URI[md5sum] = "5e91028524b50a72f9913ccd2994cf77"
-SRC_URI[sha256sum] = "9dcd3b55bd887525a7020a8adbabb661a340fc4a4a707950dc1c6f0b286cce77"
-
 inherit setuptools pypi
+require python-osc-lib.inc
 
 # Satisfy setup.py 'setup_requires'
 DEPENDS += " \
         python-pbr-native \
         "
-
-RDEPENDS_${PN} += " \
-        python-pbr \
-        python-six \
-        python-babel \
-        python-cliff \
-        python-keystoneauth1 \
-        python-os-client-config \
-        python-oslo.i18n \
-        python-oslo.utils \
-        python-simplejson \
-        python-stevedore \
-        "
-
-CLEANBROKEN = "1"
diff --git a/meta-openstack/recipes-devtools/python/python3-osc-lib_1.13.0.bb b/meta-openstack/recipes-devtools/python/python3-osc-lib_1.13.0.bb
new file mode 100644
index 0000000..63265d9
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-osc-lib_1.13.0.bb
@@ -0,0 +1,8 @@
+inherit setuptools3 pypi
+require python-osc-lib.inc
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python3-pbr-native \
+        "
+
-- 
2.17.1




