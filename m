Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1A253E00823; Sun, 22 Jan 2017 19:33:23 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9F9D6E00805
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Jan 2017 19:33:18 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14995155"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jan 2017 11:33:14 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 46BCE47B1502
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 11:33:11 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 23 Jan 2017 11:33:15 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 23 Jan 2017 11:33:14 +0800
Message-ID: <1485142394-5920-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 46BCE47B1502.A69AD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services] [PATCH] python-httpretty: 0.8.10 -> 0.8.14
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
X-List-Received-Date: Mon, 23 Jan 2017 03:33:23 -0000
Content-Type: text/plain

1) Upgrade python-httpretty from 0.8.10 to 0.8.14.
2) License checksum changed,since the version and description were changed.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/python-httpretty_0.8.10.bb              | 26 ----------------------
 .../python/python-httpretty_0.8.14.bb              | 26 ++++++++++++++++++++++
 2 files changed, 26 insertions(+), 26 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-httpretty_0.8.10.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-httpretty_0.8.14.bb

diff --git a/meta-openstack/recipes-devtools/python/python-httpretty_0.8.10.bb b/meta-openstack/recipes-devtools/python/python-httpretty_0.8.10.bb
deleted file mode 100644
index a6d622e..0000000
--- a/meta-openstack/recipes-devtools/python/python-httpretty_0.8.10.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-#
-# Copyright (C) 2014 Wind River Systems, Inc.
-#
-DESCRIPTION = "HTTP client mock for Python"
-HOMEPAGE = "https://pypi.python.org/pypi/httpretty"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fac859f0c7aee8d7f10b1aa5b130d1a7"
-
-PR = "r0"
-SRCNAME = "httpretty"
-
-SRC_URI = "https://pypi.python.org/packages/source/h/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-          "
-
-SRC_URI[md5sum] = "9c130b16726cbf85159574ae5761bce7"
-SRC_URI[sha256sum] = "474a72722d66841f0e59cee285d837e1c6263be5be7bf2f8e824fc849a99adda"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-DEPENDS += " \
-        python-pip \
-        "
-
diff --git a/meta-openstack/recipes-devtools/python/python-httpretty_0.8.14.bb b/meta-openstack/recipes-devtools/python/python-httpretty_0.8.14.bb
new file mode 100644
index 0000000..84419cf
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-httpretty_0.8.14.bb
@@ -0,0 +1,26 @@
+#
+# Copyright (C) 2014 Wind River Systems, Inc.
+#
+DESCRIPTION = "HTTP client mock for Python"
+HOMEPAGE = "https://pypi.python.org/pypi/httpretty"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=88d874c445b42d9bcea5d211bbc6b8bd"
+
+PR = "r0"
+SRCNAME = "httpretty"
+
+SRC_URI = "https://pypi.python.org/packages/7c/7d/fdc08c3ecc0d49cb95cb67fd03034915e0f8d714b18f4d739c062a10a95c/httpretty-0.8.14.tar.gz#md5=2a6bbf270fafc77647b0479d95d0544c/${SRCNAME}-${PV}.tar.gz \
+          "
+
+SRC_URI[md5sum] = "2a6bbf270fafc77647b0479d95d0544c"
+SRC_URI[sha256sum] = "83c176bbac9d68a45a5cca54f2d5be7e6b16a063adf6f334e7fd0eee272e976e"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+DEPENDS += " \
+        python-pip \
+        "
+
-- 
2.7.4




