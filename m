Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE650E01403
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Jun 2013 08:21:43 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5QFLhjS021462
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Jun 2013 08:21:43 -0700 (PDT)
Received: from yow-masselst-d1.wrs.com (128.224.146.23) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 26 Jun 2013 08:21:43 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 26 Jun 2013 11:21:54 -0400
Message-ID: <1372260114-28857-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.146.23]
Subject: [PATCH] openvswitch: add split between host and target python and perl paths
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
X-List-Received-Date: Wed, 26 Jun 2013 15:21:44 -0000
Content-Type: text/plain

Openvswitch is built with the assumption that the PYTHON and PERL
variables are common between the host and target. This can result in
improper paths used for script substitutions which in turn causes
scripts which will fail to run on the target and the generated
packages to have improper REQUIRES, making them impossible to
install. These are usually not an issue since python and perl are
found in the same location on the host and target, but there is no
guarantee of this so the possibility of failure exists. By explicitly
defining the location of the python and perl on the target we can
avoid these assumptions and possibility of failure.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../openvswitch-add-target-perl-handling.patch     |  61 +++++++++
 .../openvswitch-add-target-python-handling.patch   | 149 +++++++++++++++++++++
 .../openvswitch/openvswitch_1.10.0.bb              |   6 +
 3 files changed, 216 insertions(+)
 create mode 100644 recipes-networking/openvswitch/files/openvswitch-add-target-perl-handling.patch
 create mode 100644 recipes-networking/openvswitch/files/openvswitch-add-target-python-handling.patch

diff --git a/recipes-networking/openvswitch/files/openvswitch-add-target-perl-handling.patch b/recipes-networking/openvswitch/files/openvswitch-add-target-perl-handling.patch
new file mode 100644
index 0000000..35a3d5b
--- /dev/null
+++ b/recipes-networking/openvswitch/files/openvswitch-add-target-perl-handling.patch
@@ -0,0 +1,61 @@
+From 569ac1066cd3046b8ac899153df9f07908d45145 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Fri, 21 Jun 2013 11:16:00 -0400
+Subject: [PATCH] openvswitch: add target perl handling
+
+Allow the build to specify a path for the perl instead of reusing
+the PERL variable which can lead to inconsistencies if we are cross
+compiling. The TARGET_PERL variable will be used for script
+substitutions to ensure the scripts will be able to properly execute
+if the target system has a different path for the perl.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ Makefile.am                  | 1 +
+ configure.ac                 | 7 +++++++
+ utilities/ovs-parse-leaks.in | 2 +-
+ 3 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index c4f8341..45488f2 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -111,6 +111,7 @@ SUFFIXES += .in
+                 -e 's,[@]LOGDIR[@],$(LOGDIR),g' \
+                 -e 's,[@]DBDIR[@],$(DBDIR),g' \
+                 -e 's,[@]PERL[@],$(PERL),g' \
++                -e 's,[@]TARGET_PERL[@],$(TARGET_PERL),g' \
+                 -e 's,[@]PYTHON[@],$(PYTHON),g' \
+                 -e 's,[@]TARGET_PYTHON[@],$(TARGET_PYTHON),g' \
+                 -e 's,[@]RUNDIR[@],$(RUNDIR),g' \
+diff --git a/configure.ac b/configure.ac
+index 74cb691..5e39893 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -101,6 +101,13 @@ AC_ARG_VAR(KARCH, [Kernel Architecture String])
+ AC_SUBST(KARCH)
+ OVS_CHECK_LINUX
+ 
++if test "$TARGET_PERL"; then
++    TARGET_PERL=$TARGET_PERL
++else
++    TARGET_PERL=$PERL
++fi
++AC_SUBST(TARGET_PERL)
++
+ if test "$TARGET_PYTHON"; then
+     TARGET_PYTHON=$TARGET_PYTHON
+ else
+diff --git a/utilities/ovs-parse-leaks.in b/utilities/ovs-parse-leaks.in
+index 72417e5..7c9436c 100755
+--- a/utilities/ovs-parse-leaks.in
++++ b/utilities/ovs-parse-leaks.in
+@@ -1,4 +1,4 @@
+-#! @PERL@
++#! @TARGET_PERL@
+ 
+ # Copyright (c) 2009, 2010 Nicira, Inc.
+ #
+-- 
+1.8.1.2
+
diff --git a/recipes-networking/openvswitch/files/openvswitch-add-target-python-handling.patch b/recipes-networking/openvswitch/files/openvswitch-add-target-python-handling.patch
new file mode 100644
index 0000000..59607da
--- /dev/null
+++ b/recipes-networking/openvswitch/files/openvswitch-add-target-python-handling.patch
@@ -0,0 +1,149 @@
+From e8a5d34885c5fdba7d951fb1bb85131cbafca432 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Wed, 19 Jun 2013 17:25:56 -0400
+Subject: [PATCH] openvswitch: add target python handling
+
+Allow the build to specify a path for the python instead of reusing
+the PYTHON variable which can lead to inconsistencies if we are cross
+compiling. The TARGET_PYTHON variable will be used for script
+substitutions to ensure the scripts will be able to properly execute
+if the target system has a different path for the python.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ Makefile.am                        | 1 +
+ configure.ac                       | 7 +++++++
+ ovsdb/ovsdbmonitor/ovsdbmonitor.in | 2 +-
+ utilities/bugtool/ovs-bugtool.in   | 2 +-
+ utilities/ovs-check-dead-ifs.in    | 2 +-
+ utilities/ovs-l3ping.in            | 2 +-
+ utilities/ovs-parse-backtrace.in   | 2 +-
+ utilities/ovs-pcap.in              | 2 +-
+ utilities/ovs-tcpundump.in         | 2 +-
+ utilities/ovs-test.in              | 2 +-
+ utilities/ovs-vlan-test.in         | 2 +-
+ 11 files changed, 17 insertions(+), 9 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index b71ca1f..c4f8341 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -112,6 +112,7 @@ SUFFIXES += .in
+                 -e 's,[@]DBDIR[@],$(DBDIR),g' \
+                 -e 's,[@]PERL[@],$(PERL),g' \
+                 -e 's,[@]PYTHON[@],$(PYTHON),g' \
++                -e 's,[@]TARGET_PYTHON[@],$(TARGET_PYTHON),g' \
+                 -e 's,[@]RUNDIR[@],$(RUNDIR),g' \
+                 -e 's,[@]VERSION[@],$(VERSION),g' \
+                 -e 's,[@]localstatedir[@],$(localstatedir),g' \
+diff --git a/configure.ac b/configure.ac
+index 060b53f..74cb691 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -101,6 +101,13 @@ AC_ARG_VAR(KARCH, [Kernel Architecture String])
+ AC_SUBST(KARCH)
+ OVS_CHECK_LINUX
+ 
++if test "$TARGET_PYTHON"; then
++    TARGET_PYTHON=$TARGET_PYTHON
++else
++    TARGET_PYTHON=$PYTHON
++fi
++AC_SUBST(TARGET_PYTHON)
++
+ AC_CONFIG_FILES([Makefile 
+ datapath/Makefile 
+ datapath/linux/Kbuild
+diff --git a/ovsdb/ovsdbmonitor/ovsdbmonitor.in b/ovsdb/ovsdbmonitor/ovsdbmonitor.in
+index e26130a..aaf1aff 100755
+--- a/ovsdb/ovsdbmonitor/ovsdbmonitor.in
++++ b/ovsdb/ovsdbmonitor/ovsdbmonitor.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#! @TARGET_PYTHON@
+ # Copyright (c) 2010 Citrix Systems, Inc.
+ #
+ # Licensed under the Apache License, Version 2.0 (the "License");
+diff --git a/utilities/bugtool/ovs-bugtool.in b/utilities/bugtool/ovs-bugtool.in
+index 2074e23..525939e 100755
+--- a/utilities/bugtool/ovs-bugtool.in
++++ b/utilities/bugtool/ovs-bugtool.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#! @TARGET_PYTHON@
+ 
+ # This library is free software; you can redistribute it and/or
+ # modify it under the terms of version 2.1 of the GNU Lesser General Public
+diff --git a/utilities/ovs-check-dead-ifs.in b/utilities/ovs-check-dead-ifs.in
+index 9b806ed..b6f6fcb 100755
+--- a/utilities/ovs-check-dead-ifs.in
++++ b/utilities/ovs-check-dead-ifs.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#! @TARGET_PYTHON@
+ 
+ import os
+ import re
+diff --git a/utilities/ovs-l3ping.in b/utilities/ovs-l3ping.in
+index 1b07972..4fedb6f 100644
+--- a/utilities/ovs-l3ping.in
++++ b/utilities/ovs-l3ping.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#! @TARGET_PYTHON@
+ #
+ # Licensed under the Apache License, Version 2.0 (the "License");
+ # you may not use this file except in compliance with the License.
+diff --git a/utilities/ovs-parse-backtrace.in b/utilities/ovs-parse-backtrace.in
+index 4f793be..4a07f47 100755
+--- a/utilities/ovs-parse-backtrace.in
++++ b/utilities/ovs-parse-backtrace.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#! @TARGET_PYTHON@
+ #
+ # Copyright (c) 2012 Nicira, Inc.
+ #
+diff --git a/utilities/ovs-pcap.in b/utilities/ovs-pcap.in
+index 5306480..3221c7c 100755
+--- a/utilities/ovs-pcap.in
++++ b/utilities/ovs-pcap.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#! @TARGET_PYTHON@
+ #
+ # Copyright (c) 2010 Nicira, Inc.
+ #
+diff --git a/utilities/ovs-tcpundump.in b/utilities/ovs-tcpundump.in
+index 0268c50..dad0bb5 100755
+--- a/utilities/ovs-tcpundump.in
++++ b/utilities/ovs-tcpundump.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#! @TARGET_PYTHON@
+ #
+ # Copyright (c) 2010 Nicira, Inc.
+ #
+diff --git a/utilities/ovs-test.in b/utilities/ovs-test.in
+index fb1f9ad..bddd327 100644
+--- a/utilities/ovs-test.in
++++ b/utilities/ovs-test.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#! @TARGET_PYTHON@
+ #
+ # Licensed under the Apache License, Version 2.0 (the "License");
+ # you may not use this file except in compliance with the License.
+diff --git a/utilities/ovs-vlan-test.in b/utilities/ovs-vlan-test.in
+index e229498..da64040 100755
+--- a/utilities/ovs-vlan-test.in
++++ b/utilities/ovs-vlan-test.in
+@@ -1,4 +1,4 @@
+-#! @PYTHON@
++#! @TARGET_PYTHON@
+ #
+ # Copyright (c) 2010 Nicira, Inc.
+ #
+-- 
+1.8.1.2
+
diff --git a/recipes-networking/openvswitch/openvswitch_1.10.0.bb b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
index fe112f2..2e9506f 100644
--- a/recipes-networking/openvswitch/openvswitch_1.10.0.bb
+++ b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
@@ -21,6 +21,8 @@ SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
 	file://openvswitch-switch-setup \
 	file://openvswitch-controller \
 	file://openvswitch-controller-setup \
+	file://openvswitch-add-target-python-handling.patch \
+	file://openvswitch-add-target-perl-handling.patch \
 	"
 
 SRC_URI[md5sum] = "fe8b49efe9f86b57abab00166b971106"
@@ -32,6 +34,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=49eeb5acb1f5e510f12c44f176c42253"
 # distro layers can enable with EXTRA_OECONF_pn_openvswitch += ""
 # EXTRA_OECONF = "--with-linux=${STAGING_KERNEL_DIR} KARCH=${TARGET_ARCH}"
 
+EXTRA_OECONF += "TARGET_PYTHON=${bindir}/python \
+                 TARGET_PERL=${bindir}/perl \
+                "
+
 ALLOW_EMPTY_${PN}-pki = "1"
 PACKAGES =+ "${PN}-controller ${PN}-switch ${PN}-brcompat ${PN}-pki"
 
-- 
1.8.1.2


