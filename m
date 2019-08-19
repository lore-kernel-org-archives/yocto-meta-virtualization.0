Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 44D7DE00DA5; Sun, 18 Aug 2019 21:36:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37F88E00D9B
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Aug 2019 21:36:22 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,403,1559491200"; d="scan'208";a="73865444"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Aug 2019 12:36:16 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 3261F4CE03C7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Aug 2019 12:36:16 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 19 Aug 2019 12:36:20 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 19 Aug 2019 12:35:34 +0800
Message-ID: <1566189334-75782-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 3261F4CE03C7.A77A3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-amqp: Add python3 version
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
X-List-Received-Date: Mon, 19 Aug 2019 04:36:24 -0000
Content-Type: text/plain

Providing a python3 version of python-amqp.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-amqp.inc      | 14 ++++++++++++++
 .../recipes-devtools/python/python-amqp_2.4.1.bb | 16 ++--------------
 .../python/python3-amqp_2.4.1.bb                 |  2 ++
 3 files changed, 18 insertions(+), 14 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-amqp.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-amqp_2.4.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-amqp.inc b/meta-openstack/recipes-devtools/python/python-amqp.inc
new file mode 100644
index 0000000..8863ac2
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-amqp.inc
@@ -0,0 +1,14 @@
+DESCRIPTION = "Low-level AMQP client for Python"
+HOMEPAGE = "https://pypi.python.org/pypi/amqp/"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9d6ba772ac59c08a25a12ce15bd5f27b"
+
+SRC_URI[md5sum] = "9e3d5f1f69d2106c2b3f77d275a79924"
+SRC_URI[sha256sum] = "6816eed27521293ee03aa9ace300a07215b11fee4e845588a9b863a7ba30addb"
+
+inherit pypi
+
+RDEPENDS_${PN} += " \
+        ${PYTHON_PN}-vine \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-amqp_2.4.1.bb b/meta-openstack/recipes-devtools/python/python-amqp_2.4.1.bb
index dee95db..9d52062 100644
--- a/meta-openstack/recipes-devtools/python/python-amqp_2.4.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-amqp_2.4.1.bb
@@ -1,14 +1,2 @@
-DESCRIPTION = "Low-level AMQP client for Python"
-HOMEPAGE = "https://pypi.python.org/pypi/amqp/"
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9d6ba772ac59c08a25a12ce15bd5f27b"
-
-SRC_URI[md5sum] = "9e3d5f1f69d2106c2b3f77d275a79924"
-SRC_URI[sha256sum] = "6816eed27521293ee03aa9ace300a07215b11fee4e845588a9b863a7ba30addb"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN} += " \
-        python-vine \
-        "
+inherit setuptools
+require python-amqp.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-amqp_2.4.1.bb b/meta-openstack/recipes-devtools/python/python3-amqp_2.4.1.bb
new file mode 100644
index 0000000..c2710da
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-amqp_2.4.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-amqp.inc
-- 
2.17.1




