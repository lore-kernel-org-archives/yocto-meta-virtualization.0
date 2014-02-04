Return-Path: <Jim.Somerville@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61564E0074F
	for <meta-virtualization@yoctoproject.org>;
	Tue,  4 Feb 2014 13:18:04 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s14LI3iW005702
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 4 Feb 2014 13:18:03 -0800 (PST)
Received: from localhost.localdomain (128.224.146.122) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Tue, 4 Feb 2014 13:18:02 -0800
From: Jim Somerville <Jim.Somerville@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Tue, 4 Feb 2014 16:17:50 -0500
Message-ID: <ab5caaa3112d7a9392059b992452733114463d0f.1391542885.git.Jim.Somerville@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
X-Originating-IP: [128.224.146.122]
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH 1/1] openvswitch: add more target python substitutions
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
X-List-Received-Date: Tue, 04 Feb 2014 21:18:07 -0000
Content-Type: text/plain

The TARGET_PYTHON variable is used for script
substitutions to ensure the scripts will be able to properly execute
if the target system has a different path for the python.

Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
---
 ...itch-add-more-target-python-substitutions.patch |   50 ++++++++++++++++++++
 .../openvswitch/openvswitch_2.0.0.bb               |    1 +
 2 files changed, 51 insertions(+), 0 deletions(-)
 create mode 100644 recipes-networking/openvswitch/files/openvswitch-add-more-target-python-substitutions.patch

diff --git a/recipes-networking/openvswitch/files/openvswitch-add-more-target-python-substitutions.patch b/recipes-networking/openvswitch/files/openvswitch-add-more-target-python-substitutions.patch
new file mode 100644
index 0000000..2b87a11
--- /dev/null
+++ b/recipes-networking/openvswitch/files/openvswitch-add-more-target-python-substitutions.patch
@@ -0,0 +1,50 @@
+From d1ab2f62a03c2c977de6fed5fca8de63e328a870 Mon Sep 17 00:00:00 2001
+Message-Id: <d1ab2f62a03c2c977de6fed5fca8de63e328a870.1391527986.git.Jim.Somerville@windriver.com>
+From: Jim Somerville <Jim.Somerville@windriver.com>
+Date: Tue, 4 Feb 2014 15:30:41 +0000
+Subject: [PATCH 1/1] openvswitch: add more target python substitutions
+
+The TARGET_PYTHON variable is used for script
+substitutions to ensure the scripts will be able to properly execute
+if the target system has a different path for the python.
+
+Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
+---
+ ovsdb/ovsdb-dot.in         | 2 +-
+ ovsdb/ovsdb-idlc.in        | 2 +-
+ utilities/ovs-dpctl-top.in | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/ovsdb/ovsdb-dot.in b/ovsdb/ovsdb-dot.in
+index 85c126d..402a77c 100755
+--- a/ovsdb/ovsdb-dot.in
++++ b/ovsdb/ovsdb-dot.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#! @TARGET_PYTHON@
+ 
+ from datetime import date
+ import ovs.db.error
+diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
+index ec1c655..f5c135f 100755
+--- a/ovsdb/ovsdb-idlc.in
++++ b/ovsdb/ovsdb-idlc.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#! @TARGET_PYTHON@
+ 
+ import getopt
+ import os
+diff --git a/utilities/ovs-dpctl-top.in b/utilities/ovs-dpctl-top.in
+index f43fdeb..8475118 100755
+--- a/utilities/ovs-dpctl-top.in
++++ b/utilities/ovs-dpctl-top.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#! @TARGET_PYTHON@
+ #
+ # Copyright (c) 2013 Nicira, Inc.
+ #
+-- 
+1.8.3.4
+
diff --git a/recipes-networking/openvswitch/openvswitch_2.0.0.bb b/recipes-networking/openvswitch/openvswitch_2.0.0.bb
index 0ca707e..15c4dca 100644
--- a/recipes-networking/openvswitch/openvswitch_2.0.0.bb
+++ b/recipes-networking/openvswitch/openvswitch_2.0.0.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
 	file://openvswitch-controller-setup \
 	file://openvswitch-add-target-python-handling.patch \
 	file://openvswitch-add-target-perl-handling.patch \
+        file://openvswitch-add-more-target-python-substitutions.patch \
 	"
 
 SRC_URI[md5sum] = "7d7a58350e634e515e0fe43c64d64f44"
-- 
1.7.4.1


