Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.3143.1595900074526128903
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jul 2020 18:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1672BE01F26; Mon, 27 Jul 2020 18:34:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F375E01F22
	for <meta-virtualization@yoctoproject.org>; Mon, 27 Jul 2020 18:34:32 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,404,1589212800"; 
   d="scan'208";a="96962851"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jul 2020 09:34:31 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 3C2D14CE38CB
	for <meta-virtualization@yoctoproject.org>; Tue, 28 Jul 2020 09:34:29 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 28 Jul 2020 09:34:29 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-gevent-websocket: Remove python2 recipe
Date: Tue, 28 Jul 2020 09:33:46 +0800
Message-ID: <1595900026-54536-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 3C2D14CE38CB.A8FB4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
---
 .../python/python-gevent-websocket.inc           | 14 --------------
 .../python/python-gevent-websocket_0.10.1.bb     |  2 --
 .../python/python3-gevent-websocket_0.10.1.bb    | 16 ++++++++++++++--
 3 files changed, 14 insertions(+), 18 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-gevent-websocket.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-gevent-websocket_0.10.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-gevent-websocket.inc b/meta-openstack/recipes-devtools/python/python-gevent-websocket.inc
deleted file mode 100644
index 011c23e..0000000
--- a/meta-openstack/recipes-devtools/python/python-gevent-websocket.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "Websocket handler for the gevent pywsgi server, a Python network library"
-HOMEPAGE = "https://gitlab.com/noppo/gevent-websocket"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5aa2f1d4ea55d60497aa8c3debf29ab2"
-
-SRC_URI[md5sum] = "e095bf3358175489a956949c1b4de9ff"
-SRC_URI[sha256sum] = "7eaef32968290c9121f7c35b973e2cc302ffb076d018c9068d2f5ca8b2d85fb0"
-
-inherit pypi
-
-RDEPENDS_${PN} += " \
-        ${PYTHON_PN}-gevent \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python-gevent-websocket_0.10.1.bb b/meta-openstack/recipes-devtools/python/python-gevent-websocket_0.10.1.bb
deleted file mode 100644
index 99e4946..0000000
--- a/meta-openstack/recipes-devtools/python/python-gevent-websocket_0.10.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-gevent-websocket.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-gevent-websocket_0.10.1.bb b/meta-openstack/recipes-devtools/python/python3-gevent-websocket_0.10.1.bb
index 99e4946..dc6435f 100644
--- a/meta-openstack/recipes-devtools/python/python3-gevent-websocket_0.10.1.bb
+++ b/meta-openstack/recipes-devtools/python/python3-gevent-websocket_0.10.1.bb
@@ -1,2 +1,14 @@
-require python-gevent-websocket.inc
-inherit setuptools3
+DESCRIPTION = "Websocket handler for the gevent pywsgi server, a Python network library"
+HOMEPAGE = "https://gitlab.com/noppo/gevent-websocket"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5aa2f1d4ea55d60497aa8c3debf29ab2"
+
+SRC_URI[md5sum] = "e095bf3358175489a956949c1b4de9ff"
+SRC_URI[sha256sum] = "7eaef32968290c9121f7c35b973e2cc302ffb076d018c9068d2f5ca8b2d85fb0"
+
+inherit setuptools3 pypi
+
+RDEPENDS_${PN} += " \
+        python3-gevent \
+        "
-- 
2.25.1



