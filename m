Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 00FC1E00D8A; Mon,  2 Sep 2019 04:52:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4700CE008D3
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Sep 2019 04:52:56 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,459,1559491200"; d="scan'208";a="74700854"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Sep 2019 19:52:55 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 4BC704CE0C9C
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Sep 2019 19:52:57 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 2 Sep 2019 19:53:00 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 2 Sep 2019 19:52:16 +0800
Message-ID: <1567425136-118789-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 4BC704CE0C9C.A8943
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-rfc3986: Add python3 version
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
X-List-Received-Date: Mon, 02 Sep 2019 11:52:58 -0000
Content-Type: text/plain

Providing a python3 version of python-rfc3986.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-rfc3986.inc                 | 20 +++++++++++++++++
 .../python/python-rfc3986_1.3.2.bb            | 22 ++-----------------
 .../python/python3-rfc3986_1.3.2.bb           |  2 ++
 3 files changed, 24 insertions(+), 20 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-rfc3986.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-rfc3986_1.3.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-rfc3986.inc b/meta-openstack/recipes-devtools/python/python-rfc3986.inc
new file mode 100644
index 0000000..d930fd9
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-rfc3986.inc
@@ -0,0 +1,20 @@
+DESCRIPTION = "Validating URI References per RFC 3986"
+HOMEPAGE = "https://rfc3986.rtfd.org"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=03731a0e7dbcb30cecdcec77cc93ec29"
+
+SRC_URI[md5sum] = "5b6d009806a94d418c82d48219a256de"
+SRC_URI[sha256sum] = "0344d0bd428126ce554e7ca2b61787b6a28d2bbd19fc70ed2dd85efe31176405"
+
+inherit pypi
+
+# DEPENDS_default: python-pip
+
+DEPENDS += " \
+        ${PYTHON_PN}-pip \
+        "
+
+# RDEPENDS_default: 
+RDEPENDS_${PN} += " \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-rfc3986_1.3.2.bb b/meta-openstack/recipes-devtools/python/python-rfc3986_1.3.2.bb
index e32f903..003f6e1 100644
--- a/meta-openstack/recipes-devtools/python/python-rfc3986_1.3.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-rfc3986_1.3.2.bb
@@ -1,20 +1,2 @@
-DESCRIPTION = "Validating URI References per RFC 3986"
-HOMEPAGE = "https://rfc3986.rtfd.org"
-SECTION = "devel/python"
-LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=03731a0e7dbcb30cecdcec77cc93ec29"
-
-SRC_URI[md5sum] = "5b6d009806a94d418c82d48219a256de"
-SRC_URI[sha256sum] = "0344d0bd428126ce554e7ca2b61787b6a28d2bbd19fc70ed2dd85efe31176405"
-
-inherit setuptools pypi
-
-# DEPENDS_default: python-pip
-
-DEPENDS += " \
-        python-pip \
-        "
-
-# RDEPENDS_default: 
-RDEPENDS_${PN} += " \
-        "
+inherit setuptools
+require python-rfc3986.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-rfc3986_1.3.2.bb b/meta-openstack/recipes-devtools/python/python3-rfc3986_1.3.2.bb
new file mode 100644
index 0000000..5e91d48
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-rfc3986_1.3.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-rfc3986.inc
-- 
2.17.1




