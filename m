Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9A003E00E16; Wed, 11 Sep 2019 19:38:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C75F6E00E14
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Sep 2019 19:37:59 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,495,1559491200"; d="scan'208";a="75334516"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Sep 2019 10:37:57 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 843834CE030A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Sep 2019 10:37:48 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 12 Sep 2019 10:38:08 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 12 Sep 2019 10:36:31 +0800
Message-ID: <1568255791-42428-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 843834CE030A.A674F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-cliff: Add python3 version
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
X-List-Received-Date: Thu, 12 Sep 2019 02:38:00 -0000
Content-Type: text/plain

Providing a python3 version of python-cliff.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-cliff.inc  | 31 +++++++++++++++++++
 .../python/python-cliff_2.16.0.bb             | 31 ++-----------------
 .../python/python3-cliff_2.16.0.bb            |  2 ++
 3 files changed, 36 insertions(+), 28 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-cliff.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-cliff_2.16.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-cliff.inc b/meta-openstack/recipes-devtools/python/python-cliff.inc
new file mode 100644
index 0000000..cc66717
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-cliff.inc
@@ -0,0 +1,31 @@
+DESCRIPTION = "Command Line Interface Formulation Framework"
+HOMEPAGE = "https://github.com/dreamhost/cliff"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[md5sum] = "89e96c6c8c5922832e124ed81c21a55b"
+SRC_URI[sha256sum] = "622e777b8ac2eb479708fe53893c37b2fd5469ce2c6c5b794a658246f05c6b81"
+
+inherit pypi
+
+DEPENDS += "\
+    ${PYTHON_PN}-pbr \
+    "
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+    ${PYTHON_PN}-pbr-native \
+    "
+
+RDEPENDS_${PN} += " \
+            ${PYTHON_PN}-cmd2 \
+            ${PYTHON_PN}-pbr \
+            ${PYTHON_PN}-pyparsing \
+            ${PYTHON_PN}-prettytable \
+            ${PYTHON_PN}-six \
+            ${PYTHON_PN}-stevedore \
+            ${PYTHON_PN}-pyyaml \
+"
+
+CLEANBROKEN = "1"
diff --git a/meta-openstack/recipes-devtools/python/python-cliff_2.16.0.bb b/meta-openstack/recipes-devtools/python/python-cliff_2.16.0.bb
index 0d49f8c..6fadd5b 100644
--- a/meta-openstack/recipes-devtools/python/python-cliff_2.16.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-cliff_2.16.0.bb
@@ -1,32 +1,7 @@
-DESCRIPTION = "Command Line Interface Formulation Framework"
-HOMEPAGE = "https://github.com/dreamhost/cliff"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-SRC_URI[md5sum] = "89e96c6c8c5922832e124ed81c21a55b"
-SRC_URI[sha256sum] = "622e777b8ac2eb479708fe53893c37b2fd5469ce2c6c5b794a658246f05c6b81"
-
-inherit setuptools pypi
-
-DEPENDS += "\
-    python-pbr \
-    "
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-    python-pbr-native \
-    "
+inherit setuptools
+require python-cliff.inc
 
+# RDEPENDS only fot python2
 RDEPENDS_${PN} += " \
-            python-cmd2 \
-            python-pbr \
-            python-pyparsing \
-            python-prettytable \
-            python-six \
-            python-stevedore \
             python-unicodecsv \
-            python-pyyaml \
 "
-
-CLEANBROKEN = "1"
diff --git a/meta-openstack/recipes-devtools/python/python3-cliff_2.16.0.bb b/meta-openstack/recipes-devtools/python/python3-cliff_2.16.0.bb
new file mode 100644
index 0000000..07923ca
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-cliff_2.16.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-cliff.inc
-- 
2.17.1




