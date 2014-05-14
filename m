Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 55497E006EF; Wed, 14 May 2014 15:41:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.217.171 listed in list.dnswl.org]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from mail-lb0-f171.google.com (unknown [209.85.217.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5DCFE0053B
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 May 2014 15:41:12 -0700 (PDT)
Received: by mail-lb0-f171.google.com with SMTP id 10so167997lbg.16
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 May 2014 15:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=3X3RSu9DI/sXRDlAE9I4mAFq+GR1ieGUVo1ofwfoTpA=;
	b=ULDr3Pkq9srUgw8YOTj/a/D5XxyITE8gKTADQ85ZVTrOcF4nTgPqeyeqOK9RCDMDiJ
	nODS+ktzacbXBUURm+3QpyorZvox9nyFoqRXAWqk1x1ojPhaBCSTS0teipgJi1gW+kia
	yB96WFhryEcg4l/wlhjJcLqdCbERY71+gAh4QhPfs+liVdw7TM8BaOi8Jje34zK5SjHl
	ZKDAlnb/motUojrzuoZ5wF30rR4gHu0J8CAtSQBdlmQNCy63lCbJxznYi8PW/mB9MGph
	NUCiqEiGMk3dGafZ11S9M2yN1Du2ftU4RqlSRpSo9U+wVbz7OGbNkdUnoHErSNDrq8Ce
	x4CQ==
X-Received: by 10.152.4.1 with SMTP id g1mr4498284lag.20.1400106807536;
	Wed, 14 May 2014 15:33:27 -0700 (PDT)
Received: from localhost.localdomain ([88.131.14.170])
	by mx.google.com with ESMTPSA id bq6sm3302636lbb.34.2014.05.14.15.33.25
	for <meta-virtualization@yoctoproject.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 14 May 2014 15:33:26 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 14 May 2014 18:33:22 -0400
Message-Id: <1400106802-24248-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] openvswitch: uprev to v2.1.2
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
X-List-Received-Date: Wed, 14 May 2014 22:41:16 -0000

Updating to the latest OVS 2.x. Only minor patch refreshes required, and
no regressions were found during sanity testing.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../openvswitch/files/openvswitch-add-ptest.patch  |  17 ++--
 .../openvswitch-add-target-python-handling.patch   | 103 +++++++++------------
 .../{openvswitch_2.0.0.bb => openvswitch_2.1.2.bb} |   6 +-
 3 files changed, 57 insertions(+), 69 deletions(-)
 rename recipes-networking/openvswitch/{openvswitch_2.0.0.bb => openvswitch_2.1.2.bb} (95%)

diff --git a/recipes-networking/openvswitch/files/openvswitch-add-ptest.patch b/recipes-networking/openvswitch/files/openvswitch-add-ptest.patch
index aebb1823fbd6..cb708deae68d 100644
--- a/recipes-networking/openvswitch/files/openvswitch-add-ptest.patch
+++ b/recipes-networking/openvswitch/files/openvswitch-add-ptest.patch
@@ -2,19 +2,20 @@ Add test-install rule to support ptest execution
 
 Signed-off-by: Radu Patriu <radu.patriu@enea.com>
 
-Index: ovs/Makefile.am
+Index: openvswitch-2.1.2/Makefile.am
 ===================================================================
---- ovs.orig/Makefile.am	2014-03-10 16:19:46.000000000 +0200
-+++ ovs/Makefile.am	2014-03-10 16:23:10.481075341 +0200
-@@ -276,3 +276,4 @@
- include python/automake.mk
+--- openvswitch-2.1.2.orig/Makefile.am
++++ openvswitch-2.1.2/Makefile.am
+@@ -300,3 +300,5 @@
  include python/compat/automake.mk
  include tutorial/automake.mk
+ include vtep/automake.mk
 +include test.mk
-Index: ovs/test.mk
++
+Index: openvswitch-2.1.2/test.mk
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ ovs/test.mk	2014-03-10 16:42:41.000000000 +0200
+--- /dev/null
++++ openvswitch-2.1.2/test.mk
 @@ -0,0 +1,49 @@
 +TEST_DEST ?= ${prefix}/lib/openvswitch
 +TEST_ROOT ?= ${prefix}/lib/openvswitch
diff --git a/recipes-networking/openvswitch/files/openvswitch-add-target-python-handling.patch b/recipes-networking/openvswitch/files/openvswitch-add-target-python-handling.patch
index 59607dad900f..97b352cb526f 100644
--- a/recipes-networking/openvswitch/files/openvswitch-add-target-python-handling.patch
+++ b/recipes-networking/openvswitch/files/openvswitch-add-target-python-handling.patch
@@ -24,11 +24,11 @@ Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
  utilities/ovs-vlan-test.in         | 2 +-
  11 files changed, 17 insertions(+), 9 deletions(-)
 
-diff --git a/Makefile.am b/Makefile.am
-index b71ca1f..c4f8341 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -112,6 +112,7 @@ SUFFIXES += .in
+Index: openvswitch-2.1.2/Makefile.am
+===================================================================
+--- openvswitch-2.1.2.orig/Makefile.am
++++ openvswitch-2.1.2/Makefile.am
+@@ -125,6 +125,7 @@
                  -e 's,[@]DBDIR[@],$(DBDIR),g' \
                  -e 's,[@]PERL[@],$(PERL),g' \
                  -e 's,[@]PYTHON[@],$(PYTHON),g' \
@@ -36,11 +36,11 @@ index b71ca1f..c4f8341 100644
                  -e 's,[@]RUNDIR[@],$(RUNDIR),g' \
                  -e 's,[@]VERSION[@],$(VERSION),g' \
                  -e 's,[@]localstatedir[@],$(localstatedir),g' \
-diff --git a/configure.ac b/configure.ac
-index 060b53f..74cb691 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -101,6 +101,13 @@ AC_ARG_VAR(KARCH, [Kernel Architecture String])
+Index: openvswitch-2.1.2/configure.ac
+===================================================================
+--- openvswitch-2.1.2.orig/configure.ac
++++ openvswitch-2.1.2/configure.ac
+@@ -118,6 +118,13 @@
  AC_SUBST(KARCH)
  OVS_CHECK_LINUX
  
@@ -51,99 +51,86 @@ index 060b53f..74cb691 100644
 +fi
 +AC_SUBST(TARGET_PYTHON)
 +
- AC_CONFIG_FILES([Makefile 
- datapath/Makefile 
- datapath/linux/Kbuild
-diff --git a/ovsdb/ovsdbmonitor/ovsdbmonitor.in b/ovsdb/ovsdbmonitor/ovsdbmonitor.in
-index e26130a..aaf1aff 100755
---- a/ovsdb/ovsdbmonitor/ovsdbmonitor.in
-+++ b/ovsdb/ovsdbmonitor/ovsdbmonitor.in
-@@ -1,4 +1,4 @@
--#! @PYTHON@
-+#! @TARGET_PYTHON@
- # Copyright (c) 2010 Citrix Systems, Inc.
- #
- # Licensed under the Apache License, Version 2.0 (the "License");
-diff --git a/utilities/bugtool/ovs-bugtool.in b/utilities/bugtool/ovs-bugtool.in
-index 2074e23..525939e 100755
---- a/utilities/bugtool/ovs-bugtool.in
-+++ b/utilities/bugtool/ovs-bugtool.in
+ AC_CONFIG_FILES(Makefile)
+ AC_CONFIG_FILES(datapath/Makefile)
+ AC_CONFIG_FILES(datapath/linux/Kbuild)
+Index: openvswitch-2.1.2/utilities/bugtool/ovs-bugtool.in
+===================================================================
+--- openvswitch-2.1.2.orig/utilities/bugtool/ovs-bugtool.in
++++ openvswitch-2.1.2/utilities/bugtool/ovs-bugtool.in
 @@ -1,4 +1,4 @@
 -#! @PYTHON@
 +#! @TARGET_PYTHON@
  
  # This library is free software; you can redistribute it and/or
  # modify it under the terms of version 2.1 of the GNU Lesser General Public
-diff --git a/utilities/ovs-check-dead-ifs.in b/utilities/ovs-check-dead-ifs.in
-index 9b806ed..b6f6fcb 100755
---- a/utilities/ovs-check-dead-ifs.in
-+++ b/utilities/ovs-check-dead-ifs.in
+Index: openvswitch-2.1.2/utilities/ovs-check-dead-ifs.in
+===================================================================
+--- openvswitch-2.1.2.orig/utilities/ovs-check-dead-ifs.in
++++ openvswitch-2.1.2/utilities/ovs-check-dead-ifs.in
 @@ -1,4 +1,4 @@
 -#! @PYTHON@
 +#! @TARGET_PYTHON@
  
  import os
  import re
-diff --git a/utilities/ovs-l3ping.in b/utilities/ovs-l3ping.in
-index 1b07972..4fedb6f 100644
---- a/utilities/ovs-l3ping.in
-+++ b/utilities/ovs-l3ping.in
+Index: openvswitch-2.1.2/utilities/ovs-l3ping.in
+===================================================================
+--- openvswitch-2.1.2.orig/utilities/ovs-l3ping.in
++++ openvswitch-2.1.2/utilities/ovs-l3ping.in
 @@ -1,4 +1,4 @@
 -#! @PYTHON@
 +#! @TARGET_PYTHON@
  #
  # Licensed under the Apache License, Version 2.0 (the "License");
  # you may not use this file except in compliance with the License.
-diff --git a/utilities/ovs-parse-backtrace.in b/utilities/ovs-parse-backtrace.in
-index 4f793be..4a07f47 100755
---- a/utilities/ovs-parse-backtrace.in
-+++ b/utilities/ovs-parse-backtrace.in
+Index: openvswitch-2.1.2/utilities/ovs-parse-backtrace.in
+===================================================================
+--- openvswitch-2.1.2.orig/utilities/ovs-parse-backtrace.in
++++ openvswitch-2.1.2/utilities/ovs-parse-backtrace.in
 @@ -1,4 +1,4 @@
 -#! @PYTHON@
 +#! @TARGET_PYTHON@
  #
  # Copyright (c) 2012 Nicira, Inc.
  #
-diff --git a/utilities/ovs-pcap.in b/utilities/ovs-pcap.in
-index 5306480..3221c7c 100755
---- a/utilities/ovs-pcap.in
-+++ b/utilities/ovs-pcap.in
+Index: openvswitch-2.1.2/utilities/ovs-pcap.in
+===================================================================
+--- openvswitch-2.1.2.orig/utilities/ovs-pcap.in
++++ openvswitch-2.1.2/utilities/ovs-pcap.in
 @@ -1,4 +1,4 @@
 -#! @PYTHON@
 +#! @TARGET_PYTHON@
  #
  # Copyright (c) 2010 Nicira, Inc.
  #
-diff --git a/utilities/ovs-tcpundump.in b/utilities/ovs-tcpundump.in
-index 0268c50..dad0bb5 100755
---- a/utilities/ovs-tcpundump.in
-+++ b/utilities/ovs-tcpundump.in
+Index: openvswitch-2.1.2/utilities/ovs-tcpundump.in
+===================================================================
+--- openvswitch-2.1.2.orig/utilities/ovs-tcpundump.in
++++ openvswitch-2.1.2/utilities/ovs-tcpundump.in
 @@ -1,4 +1,4 @@
 -#! @PYTHON@
 +#! @TARGET_PYTHON@
  #
  # Copyright (c) 2010 Nicira, Inc.
  #
-diff --git a/utilities/ovs-test.in b/utilities/ovs-test.in
-index fb1f9ad..bddd327 100644
---- a/utilities/ovs-test.in
-+++ b/utilities/ovs-test.in
+Index: openvswitch-2.1.2/utilities/ovs-test.in
+===================================================================
+--- openvswitch-2.1.2.orig/utilities/ovs-test.in
++++ openvswitch-2.1.2/utilities/ovs-test.in
 @@ -1,4 +1,4 @@
 -#! @PYTHON@
 +#! @TARGET_PYTHON@
  #
  # Licensed under the Apache License, Version 2.0 (the "License");
  # you may not use this file except in compliance with the License.
-diff --git a/utilities/ovs-vlan-test.in b/utilities/ovs-vlan-test.in
-index e229498..da64040 100755
---- a/utilities/ovs-vlan-test.in
-+++ b/utilities/ovs-vlan-test.in
+Index: openvswitch-2.1.2/utilities/ovs-vlan-test.in
+===================================================================
+--- openvswitch-2.1.2.orig/utilities/ovs-vlan-test.in
++++ openvswitch-2.1.2/utilities/ovs-vlan-test.in
 @@ -1,4 +1,4 @@
 -#! @PYTHON@
 +#! @TARGET_PYTHON@
  #
  # Copyright (c) 2010 Nicira, Inc.
  #
--- 
-1.8.1.2
-
diff --git a/recipes-networking/openvswitch/openvswitch_2.0.0.bb b/recipes-networking/openvswitch/openvswitch_2.1.2.bb
similarity index 95%
rename from recipes-networking/openvswitch/openvswitch_2.0.0.bb
rename to recipes-networking/openvswitch/openvswitch_2.1.2.bb
index 01003082ed1b..3f092afb05ec 100644
--- a/recipes-networking/openvswitch/openvswitch_2.0.0.bb
+++ b/recipes-networking/openvswitch/openvswitch_2.1.2.bb
@@ -35,10 +35,10 @@ SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
 	file://run-ptest \
 	"
 
-SRC_URI[md5sum] = "7d7a58350e634e515e0fe43c64d64f44"
-SRC_URI[sha256sum] = "5060e2be69cce01c15f67b481482cb1a0eaa6ef5cbdbed592bac3c3ab2a390f8"
+SRC_URI[md5sum] = "430ff6d1e1fc81e9c5ebc2e641cfc953"
+SRC_URI[sha256sum] = "875429b052c4001815b6cb38616c7a6cb212df4bba74602164ee0a99b172079b"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=49eeb5acb1f5e510f12c44f176c42253"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e03b0d9c4115c44518594e5618e653f8"
 
 # Don't compile kernel modules by default since it heavily depends on
 # kernel version. Use the in-kernel module for now.
-- 
1.8.1.2


