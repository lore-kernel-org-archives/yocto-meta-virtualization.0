Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 54E60E00E0D; Fri, 16 Aug 2019 03:28:44 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57DDCE00D89
	for <meta-virtualization@yoctoproject.org>;
	Fri, 16 Aug 2019 03:28:42 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,391,1559491200"; d="scan'208";a="73765259"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Aug 2019 18:28:41 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id AB8984CE0338
	for <meta-virtualization@yoctoproject.org>;
	Fri, 16 Aug 2019 18:28:38 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 16 Aug 2019 18:28:40 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 16 Aug 2019 18:28:13 +0800
Message-ID: <1565951293-24335-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: AB8984CE0338.A62D9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-vine: Add python3 version
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
X-List-Received-Date: Fri, 16 Aug 2019 10:28:44 -0000
Content-Type: text/plain

Providing a python3 version of python-vine.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-vine.inc        | 13 +++++++++++++
 .../recipes-devtools/python/python-vine_1.1.4.bb   | 14 ++------------
 .../recipes-devtools/python/python3-vine_1.1.4.bb  |  3 +++
 3 files changed, 18 insertions(+), 12 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-vine.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-vine_1.1.4.bb

diff --git a/meta-openstack/recipes-devtools/python/python-vine.inc b/meta-openstack/recipes-devtools/python/python-vine.inc
new file mode 100644
index 0000000..f098a9d
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-vine.inc
@@ -0,0 +1,13 @@
+DESCRIPTION = "Python promises"
+HOMEPAGE = "https://pypi.python.org/pypi/vine"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6fadb0e48ceb84b571372dd706ed76a0"
+
+SRC_URI[md5sum] = "9fdb971e7fd15b181b84f3bfcf20d11c"
+SRC_URI[sha256sum] = "52116d59bc45392af9fdd3b75ed98ae48a93e822cee21e5fda249105c59a7a72"
+
+inherit pypi
+
+RDEPENDS_${PN} += " \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-vine_1.1.4.bb b/meta-openstack/recipes-devtools/python/python-vine_1.1.4.bb
index 268675d..01c2a95 100644
--- a/meta-openstack/recipes-devtools/python/python-vine_1.1.4.bb
+++ b/meta-openstack/recipes-devtools/python/python-vine_1.1.4.bb
@@ -1,13 +1,3 @@
-DESCRIPTION = "Python promises"
-HOMEPAGE = "https://pypi.python.org/pypi/vine"
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6fadb0e48ceb84b571372dd706ed76a0"
+inherit setuptools
+require python-vine.inc
 
-SRC_URI[md5sum] = "9fdb971e7fd15b181b84f3bfcf20d11c"
-SRC_URI[sha256sum] = "52116d59bc45392af9fdd3b75ed98ae48a93e822cee21e5fda249105c59a7a72"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN} += " \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-vine_1.1.4.bb b/meta-openstack/recipes-devtools/python/python3-vine_1.1.4.bb
new file mode 100644
index 0000000..5926702
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-vine_1.1.4.bb
@@ -0,0 +1,3 @@
+inherit setuptools3
+require python-vine.inc
+
-- 
2.17.1




