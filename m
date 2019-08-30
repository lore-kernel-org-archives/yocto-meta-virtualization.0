Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3926AE00C78; Thu, 29 Aug 2019 22:58:44 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7376DE00B65
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 22:58:43 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,445,1559491200"; d="scan'208";a="74570083"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Aug 2019 13:58:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 083FB4CE0884
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Aug 2019 13:58:39 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 30 Aug 2019 13:58:41 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 30 Aug 2019 13:58:05 +0800
Message-ID: <20190830055805.18650-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 083FB4CE0884.ACFCB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-httpretty: Add python3 version
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
X-List-Received-Date: Fri, 30 Aug 2019 05:58:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-httpretty.inc      | 18 ++++++++++++++++++
 .../recipes-devtools/python/python-httpretty_0.9.6.bb | 19 ++-----------------
 .../python/python3-httpretty_0.9.6.bb                 |  3 +++
 3 files changed, 23 insertions(+), 17 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-httpretty.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-httpretty_0.9.6.bb

diff --git a/meta-openstack/recipes-devtools/python/python-httpretty.inc b/meta-openstack/recipes-devtools/python/python-httpretty.inc
new file mode 100644
index 0000000..f39e283
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-httpretty.inc
@@ -0,0 +1,18 @@
+#
+# Copyright (C) 2014 Wind River Systems, Inc.
+#
+DESCRIPTION = "HTTP client mock for Python"
+HOMEPAGE = "https://pypi.python.org/pypi/httpretty"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=113a91608a1d89039af9393c39bcaa2c"
+
+SRC_URI[md5sum] = "3b881b519e0f405caaf8aaa63f3508c0"
+SRC_URI[sha256sum] = "01b52d45077e702eda491f4fe75328d3468fd886aed5dcc530003e7b2b5939dc"
+
+inherit pypi
+
+DEPENDS += " \
+        ${PYTHON_PN}-pip \
+        "
+
diff --git a/meta-openstack/recipes-devtools/python/python-httpretty_0.9.6.bb b/meta-openstack/recipes-devtools/python/python-httpretty_0.9.6.bb
index 68d79f3..8993807 100644
--- a/meta-openstack/recipes-devtools/python/python-httpretty_0.9.6.bb
+++ b/meta-openstack/recipes-devtools/python/python-httpretty_0.9.6.bb
@@ -1,18 +1,3 @@
-#
-# Copyright (C) 2014 Wind River Systems, Inc.
-#
-DESCRIPTION = "HTTP client mock for Python"
-HOMEPAGE = "https://pypi.python.org/pypi/httpretty"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=113a91608a1d89039af9393c39bcaa2c"
-
-SRC_URI[md5sum] = "3b881b519e0f405caaf8aaa63f3508c0"
-SRC_URI[sha256sum] = "01b52d45077e702eda491f4fe75328d3468fd886aed5dcc530003e7b2b5939dc"
-
-inherit setuptools pypi
-
-DEPENDS += " \
-        python-pip \
-        "
+inherit setuptools
+require python-httpretty.inc
 
diff --git a/meta-openstack/recipes-devtools/python/python3-httpretty_0.9.6.bb b/meta-openstack/recipes-devtools/python/python3-httpretty_0.9.6.bb
new file mode 100644
index 0000000..b9f7699
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-httpretty_0.9.6.bb
@@ -0,0 +1,3 @@
+inherit setuptools3
+require python-httpretty.inc
+
-- 
2.7.4




