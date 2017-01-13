Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 466CFE007AD; Fri, 13 Jan 2017 13:50:06 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 077E3E006D8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Jan 2017 13:50:01 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0DLo0YV029914
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Jan 2017 13:50:00 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 13 Jan 2017 13:49:59 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Fri, 13 Jan 2017 16:49:56 -0500
Message-ID: <1484344196-30775-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] openvswitch: fix build host contamination
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
X-List-Received-Date: Fri, 13 Jan 2017 21:50:06 -0000
Content-Type: text/plain

There is only a single PYTHON variable for configure and yet python is
used for the build as well as scripts installed on the target. If we
set a path in PYTHON as we had we end up using this same path during
the build and since it isn't to the sysroot we end up with host
contamination (as demonstrated by python failing to import 'six' on
build hosts without python-six installed.

The best approach is to set PYTHON to "python" when calling configure,
ie. without a path. This will use 'python' from the path during build
time and by ensuring all the installed scripts use '/usr/bin/env' we
can ensure python will be found on the target when the scripts are
run.

Since 'six' is used as part of the build we have to ensure it is
-native'ly buildable and we set all the required build and runtime
dependencies.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-devtools/python/python-six_1.10.0.bb       |  2 +
 ...on-make-remaining-scripts-use-usr-bin-env.patch | 53 ++++++++++++++++++++++
 recipes-networking/openvswitch/openvswitch.inc     | 10 ++--
 recipes-networking/openvswitch/openvswitch_git.bb  |  1 +
 4 files changed, 61 insertions(+), 5 deletions(-)
 create mode 100644 recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch

diff --git a/recipes-devtools/python/python-six_1.10.0.bb b/recipes-devtools/python/python-six_1.10.0.bb
index a84a4c4..c279f9f 100644
--- a/recipes-devtools/python/python-six_1.10.0.bb
+++ b/recipes-devtools/python/python-six_1.10.0.bb
@@ -15,3 +15,5 @@ SRC_URI[sha256sum] = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
+
+BBCLASSEXTEND = "native"
\ No newline at end of file
diff --git a/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch b/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch
new file mode 100644
index 0000000..6091930
--- /dev/null
+++ b/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch
@@ -0,0 +1,53 @@
+From 33769657e951da855b9258eb91fa9838373023ad Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Fri, 13 Jan 2017 16:12:55 -0500
+Subject: [PATCH] python: make remaining scripts use /usr/bin/env
+
+Unfortunately there is no concept of a host python vs. target python
+to facilitate cross compilation. There is only one PYTHON variable and
+this is used during building and in the header of python scripts after
+installation. The best approach for cross compilation is to thus to
+ensure python is in the path and avoid passing a path as part of
+PYTHON. To make this function smoothly all installed scripts should
+make use of /usr/bin/env to increase the chances of finding python.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ ovsdb/ovsdb-dot.in               | 2 +-
+ ovsdb/ovsdb-idlc.in              | 2 +-
+ utilities/bugtool/ovs-bugtool.in | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/ovsdb/ovsdb-dot.in b/ovsdb/ovsdb-dot.in
+index 134ce22..893c408 100755
+--- a/ovsdb/ovsdb-dot.in
++++ b/ovsdb/ovsdb-dot.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#! /usr/bin/env @PYTHON@
+ 
+ from datetime import date
+ import ovs.db.error
+diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
+index cd4532e..dceb02f 100755
+--- a/ovsdb/ovsdb-idlc.in
++++ b/ovsdb/ovsdb-idlc.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#! /usr/bin/env @PYTHON@
+ 
+ import getopt
+ import os
+diff --git a/utilities/bugtool/ovs-bugtool.in b/utilities/bugtool/ovs-bugtool.in
+index bb771b0..152d171 100755
+--- a/utilities/bugtool/ovs-bugtool.in
++++ b/utilities/bugtool/ovs-bugtool.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#! /usr/bin/env @PYTHON@
+ 
+ # This library is free software; you can redistribute it and/or
+ # modify it under the terms of version 2.1 of the GNU Lesser General Public
+-- 
+2.7.4
+
diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
index ab1f8fe..71c746f 100644
--- a/recipes-networking/openvswitch/openvswitch.inc
+++ b/recipes-networking/openvswitch/openvswitch.inc
@@ -11,11 +11,11 @@ HOMEPAGE = "http://openvswitch.org/"
 SECTION = "networking"
 LICENSE = "Apache-2"
 
-DEPENDS += "bridge-utils openssl python perl"
+DEPENDS += "bridge-utils openssl python perl python-six-native"
 
 RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid coreutils \
 	python perl perl-module-strict ${PN}-switch \
-        bash python-twisted"
+        bash python-twisted python-six"
 RDEPENDS_${PN}-testcontroller = "${PN} lsb ${PN}-pki"
 RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
 RDEPENDS_${PN}-pki = "${PN}"
@@ -34,8 +34,8 @@ SRC_URI = "\
 	"
 
 EXTRA_OECONF += "\
-	PYTHON=${bindir}/python \
-	PYTHON3=${bindir}/python3 \
+	PYTHON=python \
+	PYTHON3=python3 \
 	PERL=${bindir}/perl \
 	"
 CONFIGUREOPT_DEPTRACK = ""
@@ -70,7 +70,7 @@ FILES_${PN} += "${datadir}/ovsdbmonitor"
 FILES_${PN} += "/run"
 
 FILES_${PN} += "${libdir}/python${PYTHON_BASEVERSION}/"
-inherit autotools update-rc.d systemd python-dir
+inherit autotools update-rc.d systemd pythonnative
 
 SYSTEMD_PACKAGES = "${PN}-switch"
 SYSTEMD_SERVICE_${PN}-switch = " \
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 55e3a9a..455fab0 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -24,6 +24,7 @@ SRC_URI += "\
 	file://disable_m4_check.patch \
 	file://kernel_module.patch \
 	file://openvswitch-ptest-Fix-python-path.patch \
+	file://python-make-remaining-scripts-use-usr-bin-env.patch \
 	"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=17b2c9d4c70853a09c0e143137754b35"
-- 
2.7.4


