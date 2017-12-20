Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5FFD4E00D81; Tue, 19 Dec 2017 20:02:48 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA77CE00D6B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Dec 2017 20:02:47 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBK42kMH007306
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Dec 2017 20:02:47 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 19 Dec 2017 20:02:46 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 19 Dec 2017 23:02:35 -0500
Message-ID: <1513742555-7870-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] python3-websocket-client: make py2 version available
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
X-List-Received-Date: Wed, 20 Dec 2017 04:02:48 -0000
Content-Type: text/plain

Allow a py2 version of the python-websocket-client package to be
built. This is required to support updates in meta-cloud-services.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-devtools/python/python-websocket-client.inc        | 11 +++++++++++
 recipes-devtools/python/python-websocket-client_0.44.0.bb  |  2 ++
 recipes-devtools/python/python3-websocket-client_0.44.0.bb | 13 ++-----------
 3 files changed, 15 insertions(+), 11 deletions(-)
 create mode 100644 recipes-devtools/python/python-websocket-client.inc
 create mode 100644 recipes-devtools/python/python-websocket-client_0.44.0.bb

diff --git a/recipes-devtools/python/python-websocket-client.inc b/recipes-devtools/python/python-websocket-client.inc
new file mode 100644
index 0000000..31778c6
--- /dev/null
+++ b/recipes-devtools/python/python-websocket-client.inc
@@ -0,0 +1,11 @@
+SUMMARY = "WebSocket client for python. hybi13 is supported."
+HOMEPAGE = "https://github.com/websocket-client/websocket-client.git"
+LICENSE = "LGPL-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=18b09a20dd186af4fd60f1a08311628c"
+
+inherit pypi
+
+PYPI_PACKAGE = "websocket_client"
+
+SRC_URI[md5sum] = "73d87aa16a2212da448b30aca9c5bf3b"
+SRC_URI[sha256sum] = "15f585566e2ea7459136a632b9785aa081093064391878a448c382415e948d72"
diff --git a/recipes-devtools/python/python-websocket-client_0.44.0.bb b/recipes-devtools/python/python-websocket-client_0.44.0.bb
new file mode 100644
index 0000000..11eeb04
--- /dev/null
+++ b/recipes-devtools/python/python-websocket-client_0.44.0.bb
@@ -0,0 +1,2 @@
+require python-websocket-client.inc
+inherit setuptools
\ No newline at end of file
diff --git a/recipes-devtools/python/python3-websocket-client_0.44.0.bb b/recipes-devtools/python/python3-websocket-client_0.44.0.bb
index 8dfc95f..473e31f 100644
--- a/recipes-devtools/python/python3-websocket-client_0.44.0.bb
+++ b/recipes-devtools/python/python3-websocket-client_0.44.0.bb
@@ -1,11 +1,2 @@
-SUMMARY = "WebSocket client for python. hybi13 is supported."
-HOMEPAGE = "https://github.com/websocket-client/websocket-client.git"
-LICENSE = "LGPL-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=18b09a20dd186af4fd60f1a08311628c"
-
-inherit pypi setuptools3
-
-PYPI_PACKAGE = "websocket_client"
-
-SRC_URI[md5sum] = "73d87aa16a2212da448b30aca9c5bf3b"
-SRC_URI[sha256sum] = "15f585566e2ea7459136a632b9785aa081093064391878a448c382415e948d72"
+require python-websocket-client.inc
+inherit setuptools3
\ No newline at end of file
-- 
2.7.4


