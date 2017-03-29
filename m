Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0CAACE007B5; Wed, 29 Mar 2017 08:26:29 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A287DE0050B
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 Mar 2017 08:26:21 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2TFQKti017838
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 Mar 2017 08:26:20 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 29 Mar 2017 08:26:20 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 29 Mar 2017 11:26:15 -0400
Message-ID: <1490801175-27419-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] openvswitch: uprev to the recently released v2.7.0
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
X-List-Received-Date: Wed, 29 Mar 2017 15:26:29 -0000
Content-Type: text/plain

This version of OVS was released on Feb. 21. Bringing our recipe up to
date with the latest release ensure we have all the latest CVE fixes
as well as any new functionality that folks might be looking
for. Additionally we are better situated to support up to date
releases of DPDK (v16.11 in this case). No surprises with the uprev,
it passes all usecase tests (meta-overc) and ptest results are much
the same as the results we had in v2.6.1. While completing the uprev I
took the opportunity to do some cleanup of patches that were no longer
used or required.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...itch-add-more-target-python-substitutions.patch |  50 ---------
 ...on-make-remaining-scripts-use-usr-bin-env.patch | 113 +++++++++++++++++++--
 ...-c298ef781c2d35d939fe163cbc2f41ea7b1cb8d1.patch | 110 ++++++++++++++++++++
 ...-f4b0e64cffb4777ff03d48621c3eadcf1d8c19f3.patch | 110 --------------------
 .../openvswitch-ptest-Fix-python-path.patch        |  30 ------
 recipes-networking/openvswitch/openvswitch_git.bb  |   7 +-
 6 files changed, 219 insertions(+), 201 deletions(-)
 delete mode 100644 recipes-networking/openvswitch/files/openvswitch-add-more-target-python-substitutions.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-c298ef781c2d35d939fe163cbc2f41ea7b1cb8d1.patch
 delete mode 100644 recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-f4b0e64cffb4777ff03d48621c3eadcf1d8c19f3.patch
 delete mode 100644 recipes-networking/openvswitch/openvswitch-git/openvswitch-ptest-Fix-python-path.patch

diff --git a/recipes-networking/openvswitch/files/openvswitch-add-more-target-python-substitutions.patch b/recipes-networking/openvswitch/files/openvswitch-add-more-target-python-substitutions.patch
deleted file mode 100644
index 2b87a11..0000000
--- a/recipes-networking/openvswitch/files/openvswitch-add-more-target-python-substitutions.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From d1ab2f62a03c2c977de6fed5fca8de63e328a870 Mon Sep 17 00:00:00 2001
-Message-Id: <d1ab2f62a03c2c977de6fed5fca8de63e328a870.1391527986.git.Jim.Somerville@windriver.com>
-From: Jim Somerville <Jim.Somerville@windriver.com>
-Date: Tue, 4 Feb 2014 15:30:41 +0000
-Subject: [PATCH 1/1] openvswitch: add more target python substitutions
-
-The TARGET_PYTHON variable is used for script
-substitutions to ensure the scripts will be able to properly execute
-if the target system has a different path for the python.
-
-Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
----
- ovsdb/ovsdb-dot.in         | 2 +-
- ovsdb/ovsdb-idlc.in        | 2 +-
- utilities/ovs-dpctl-top.in | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/ovsdb/ovsdb-dot.in b/ovsdb/ovsdb-dot.in
-index 85c126d..402a77c 100755
---- a/ovsdb/ovsdb-dot.in
-+++ b/ovsdb/ovsdb-dot.in
-@@ -1,4 +1,4 @@
--#! @PYTHON@
-+#! @TARGET_PYTHON@
- 
- from datetime import date
- import ovs.db.error
-diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
-index ec1c655..f5c135f 100755
---- a/ovsdb/ovsdb-idlc.in
-+++ b/ovsdb/ovsdb-idlc.in
-@@ -1,4 +1,4 @@
--#! @PYTHON@
-+#! @TARGET_PYTHON@
- 
- import getopt
- import os
-diff --git a/utilities/ovs-dpctl-top.in b/utilities/ovs-dpctl-top.in
-index f43fdeb..8475118 100755
---- a/utilities/ovs-dpctl-top.in
-+++ b/utilities/ovs-dpctl-top.in
-@@ -1,4 +1,4 @@
--#! @PYTHON@
-+#! @TARGET_PYTHON@
- #
- # Copyright (c) 2013 Nicira, Inc.
- #
--- 
-1.8.3.4
-
diff --git a/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch b/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch
index 6091930..68f46ff 100644
--- a/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch
+++ b/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch
@@ -1,4 +1,4 @@
-From 33769657e951da855b9258eb91fa9838373023ad Mon Sep 17 00:00:00 2001
+From 04ad1c3d9f47cfdf4ad9b5d685e953ec094326ff Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Fri, 13 Jan 2017 16:12:55 -0500
 Subject: [PATCH] python: make remaining scripts use /usr/bin/env
@@ -13,11 +13,110 @@ make use of /usr/bin/env to increase the chances of finding python.
 
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
 ---
- ovsdb/ovsdb-dot.in               | 2 +-
- ovsdb/ovsdb-idlc.in              | 2 +-
- utilities/bugtool/ovs-bugtool.in | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
+ build-aux/check-structs                  | 2 +-
+ build-aux/extract-ofp-actions            | 2 +-
+ build-aux/extract-ofp-errors             | 2 +-
+ build-aux/extract-ofp-fields             | 2 +-
+ build-aux/extract-ofp-msgs               | 2 +-
+ build-aux/xml2nroff                      | 2 +-
+ ovn/utilities/ovn-docker-overlay-driver  | 2 +-
+ ovn/utilities/ovn-docker-underlay-driver | 2 +-
+ ovsdb/ovsdb-doc                          | 2 +-
+ ovsdb/ovsdb-dot.in                       | 2 +-
+ ovsdb/ovsdb-idlc.in                      | 2 +-
+ utilities/bugtool/ovs-bugtool.in         | 2 +-
+ 12 files changed, 12 insertions(+), 12 deletions(-)
 
+diff --git a/build-aux/check-structs b/build-aux/check-structs
+index f79f235..c7b8730 100755
+--- a/build-aux/check-structs
++++ b/build-aux/check-structs
+@@ -1,4 +1,4 @@
+-#! /usr/bin/python
++#! /usr/bin/env python
+ 
+ import os.path
+ import sys
+diff --git a/build-aux/extract-ofp-actions b/build-aux/extract-ofp-actions
+index 184447b..92ea18d 100755
+--- a/build-aux/extract-ofp-actions
++++ b/build-aux/extract-ofp-actions
+@@ -1,4 +1,4 @@
+-#! /usr/bin/python
++#! /usr/bin/env python
+ 
+ import sys
+ import os.path
+diff --git a/build-aux/extract-ofp-errors b/build-aux/extract-ofp-errors
+index 9642593..11e6de7 100755
+--- a/build-aux/extract-ofp-errors
++++ b/build-aux/extract-ofp-errors
+@@ -1,4 +1,4 @@
+-#! /usr/bin/python
++#! /usr/bin/env python
+ 
+ import sys
+ import os.path
+diff --git a/build-aux/extract-ofp-fields b/build-aux/extract-ofp-fields
+index 498b887..5d6bcec 100755
+--- a/build-aux/extract-ofp-fields
++++ b/build-aux/extract-ofp-fields
+@@ -1,4 +1,4 @@
+-#! /usr/bin/python
++#! /usr/bin/env python
+ 
+ import getopt
+ import sys
+diff --git a/build-aux/extract-ofp-msgs b/build-aux/extract-ofp-msgs
+index 1813638..e9e3c25 100755
+--- a/build-aux/extract-ofp-msgs
++++ b/build-aux/extract-ofp-msgs
+@@ -1,4 +1,4 @@
+-#! /usr/bin/python
++#! /usr/bin/env python
+ 
+ import sys
+ import os.path
+diff --git a/build-aux/xml2nroff b/build-aux/xml2nroff
+index bd4e879..9d81503 100755
+--- a/build-aux/xml2nroff
++++ b/build-aux/xml2nroff
+@@ -1,4 +1,4 @@
+-#! /usr/bin/python
++#! /usr/bin/env python
+ 
+ # Copyright (c) 2010, 2011, 2012, 2013, 2014, 2015, 2016 Nicira, Inc.
+ #
+diff --git a/ovn/utilities/ovn-docker-overlay-driver b/ovn/utilities/ovn-docker-overlay-driver
+index 52de3db..c90f02b 100755
+--- a/ovn/utilities/ovn-docker-overlay-driver
++++ b/ovn/utilities/ovn-docker-overlay-driver
+@@ -1,4 +1,4 @@
+-#! /usr/bin/python
++#! /usr/bin/env python
+ # Copyright (C) 2015 Nicira, Inc.
+ #
+ # Licensed under the Apache License, Version 2.0 (the "License");
+diff --git a/ovn/utilities/ovn-docker-underlay-driver b/ovn/utilities/ovn-docker-underlay-driver
+index 2c9c4b6..89b804c 100755
+--- a/ovn/utilities/ovn-docker-underlay-driver
++++ b/ovn/utilities/ovn-docker-underlay-driver
+@@ -1,4 +1,4 @@
+-#! /usr/bin/python
++#! /usr/bin/env python
+ # Copyright (C) 2015 Nicira, Inc.
+ #
+ # Licensed under the Apache License, Version 2.0 (the "License");
+diff --git a/ovsdb/ovsdb-doc b/ovsdb/ovsdb-doc
+index 5cf26ee..f76f4bd 100755
+--- a/ovsdb/ovsdb-doc
++++ b/ovsdb/ovsdb-doc
+@@ -1,4 +1,4 @@
+-#! /usr/bin/python
++#! /usr/bin/env python
+ 
+ # Copyright (c) 2010, 2011, 2012, 2013, 2014, 2015 Nicira, Inc.
+ #
 diff --git a/ovsdb/ovsdb-dot.in b/ovsdb/ovsdb-dot.in
 index 134ce22..893c408 100755
 --- a/ovsdb/ovsdb-dot.in
@@ -29,7 +128,7 @@ index 134ce22..893c408 100755
  from datetime import date
  import ovs.db.error
 diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
-index cd4532e..dceb02f 100755
+index 721ab50..bfbcf23 100755
 --- a/ovsdb/ovsdb-idlc.in
 +++ b/ovsdb/ovsdb-idlc.in
 @@ -1,4 +1,4 @@
@@ -39,7 +138,7 @@ index cd4532e..dceb02f 100755
  import getopt
  import os
 diff --git a/utilities/bugtool/ovs-bugtool.in b/utilities/bugtool/ovs-bugtool.in
-index bb771b0..152d171 100755
+index 963c50c..c84d7c2 100755
 --- a/utilities/bugtool/ovs-bugtool.in
 +++ b/utilities/bugtool/ovs-bugtool.in
 @@ -1,4 +1,4 @@
diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-c298ef781c2d35d939fe163cbc2f41ea7b1cb8d1.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-c298ef781c2d35d939fe163cbc2f41ea7b1cb8d1.patch
new file mode 100644
index 0000000..47c81dd
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-c298ef781c2d35d939fe163cbc2f41ea7b1cb8d1.patch
@@ -0,0 +1,110 @@
+From a2a656e6976a60e5df3ade0d17a40b4ebdc2b41a Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Wed, 30 Mar 2016 06:23:45 -0400
+Subject: [PATCH] openvswitch: Add test-install rule to support ptest execution
+
+Signed-off-by: Radu Patriu <radu.patriu@enea.com>
+
+Fix ptest for v2.5
+ - Copy certain files from srcdir since it has been different from
+   build directory.
+ - Copy more necessary files for new added test cases.
+ - Modify config files for running on target.
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ Makefile.am |  1 +
+ test.mk     | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 73 insertions(+)
+ create mode 100644 test.mk
+
+diff --git a/Makefile.am b/Makefile.am
+index a4dd7b8..0bd32c7 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -429,3 +429,4 @@ include windows/automake.mk
+ include ovn/automake.mk
+ include selinux/automake.mk
+ include build-aux/automake.mk
++include test.mk
+diff --git a/test.mk b/test.mk
+new file mode 100644
+index 0000000..b10a581
+--- /dev/null
++++ b/test.mk
+@@ -0,0 +1,72 @@
++TEST_DEST ?= ${prefix}/lib/openvswitch
++TEST_ROOT ?= ${prefix}/lib/openvswitch
++TEST_DEPEND =
++
++if HAVE_OPENSSL
++TEST_DEPEND += $(TESTPKI_FILES)
++endif
++
++test-install: $(TEST_DEPEND)
++	@list='$(noinst_PROGRAMS) $(EXTRA_DIST) $(dist_check_SCRIPTS) $(TEST_DEPEND) tests/atlocal tests/atconfig' ;\
++	install -d $(TEST_DEST)/tests ;\
++	install $(srcdir)/vtep/ovs-vtep $(TEST_DEST)/tests ;\
++	install -d $(TEST_DEST)/python ;\
++	install -d $(TEST_DEST)/python/ovs ;\
++	install -d $(TEST_DEST)/python/ovs/db ;\
++	install -d $(TEST_DEST)/python/ovs/unixctl ;\
++	install -d $(TEST_DEST)/vswitchd ;\
++	install $(srcdir)/vswitchd/vswitch.ovsschema $(TEST_DEST)/vswitchd ;\
++	install vswitchd/ovs-vswitchd $(TEST_DEST)/vswitchd ;\
++	install -d $(TEST_DEST)/debian ;\
++	install $(srcdir)/debian/ovs-monitor-ipsec $(TEST_DEST)/debian ;\
++	install -d $(TEST_DEST)/build-aux ;\
++	install $(srcdir)/build-aux/check-structs $(TEST_DEST)/build-aux ;\
++	install -d $(TEST_DEST)/xenserver ;\
++	install $(srcdir)/xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync $(TEST_DEST)/xenserver ;\
++	install $(srcdir)/xenserver/opt_xensource_libexec_interface-reconfigure $(TEST_DEST)/xenserver ;\
++	install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigure.py $(TEST_DEST)/xenserver ;\
++	install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigureBridge.py $(TEST_DEST)/xenserver ;\
++	install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigureVswitch.py $(TEST_DEST)/xenserver ;\
++	install -d $(TEST_DEST)/vtep ;\
++	install $(srcdir)/vtep/vtep.ovsschema $(TEST_DEST)/vtep ;\
++	install -d $(TEST_DEST)/ovn ;\
++	install $(srcdir)/ovn/ovn-nb.ovsschema $(TEST_DEST)/ovn ;\
++	install $(srcdir)/ovn/ovn-sb.ovsschema $(TEST_DEST)/ovn ;\
++	install -d $(TEST_DEST)/utilities ;\
++	install $(srcdir)/utilities/ovs-pcap.in $(TEST_DEST)/utilities ;\
++	install $(srcdir)/utilities/ovs-pki.in $(TEST_DEST)/utilities ;\
++	for p in $$list ; do \
++	  echo $$p ;\
++	  p=$${p#../git/} ;\
++	  pre=$${p#tests\/} ;\
++	  if test $$pre != $$p ; then \
++	    echo installing $$p to $(TEST_DEST)/tests/$$pre ;\
++	    if test -f $$p ; then \
++	      install $$p $(TEST_DEST)/tests/$$pre ;\
++	    else \
++	      install $(srcdir)/$$p $(TEST_DEST)/tests/$$pre ;\
++	    fi ;\
++	    continue ;\
++	  fi ;\
++	  pre=$${p#python\/ovs\/} ;\
++	  if test $$pre != $$p ; then \
++	    echo installing $$p to $(TEST_DEST)/python/ovs/$$pre ;\
++	    if test -f $$p ; then \
++	      install $$p $(TEST_DEST)/python/ovs/$$pre ;\
++	    else \
++	      install $(srcdir)/$$p $(TEST_DEST)/python/ovs/$$pre ;\
++	    fi ;\
++	    continue ;\
++	  fi; \
++	done ;\
++	sed -i 's|abs_builddir=.*|abs_builddir='"'"'$(TEST_ROOT)/tests'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|abs_srcdir=.*|abs_srcdir='"'"'$(TEST_ROOT)/tests'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|abs_top_srcdir=.*|abs_top_srcdir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|abs_top_builddir=.*|abs_top_builddir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|at_srcdir=.*|at_srcdir='"'"'.'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|at_top_srcdir=.*|at_top_srcdir='"'"'..'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|at_top_build_prefix=.*|at_top_build_prefix='"'"'../'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|^\(.*config\.log.*\)|#\1|g' $(TEST_DEST)/tests/testsuite
++	sed -i 's|$$srcdir|$$abs_srcdir|g' $(TEST_DEST)/tests/testsuite
++	sed -i 's|ovs-appctl-bashcomp\.bash|/etc/bash_completion.d/ovs-appctl-bashcomp\.bash|g' $(TEST_DEST)/tests/testsuite
++	sed -i 's|ovs-vsctl-bashcomp\.bash|/etc/bash_completion.d/ovs-vsctl-bashcomp\.bash|g' $(TEST_DEST)/tests/testsuite
+-- 
+2.7.4
+
diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-f4b0e64cffb4777ff03d48621c3eadcf1d8c19f3.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-f4b0e64cffb4777ff03d48621c3eadcf1d8c19f3.patch
deleted file mode 100644
index 7e74044..0000000
--- a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-f4b0e64cffb4777ff03d48621c3eadcf1d8c19f3.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From e20556d7cf0fc8258db77c1f3e0a160cf9fd4514 Mon Sep 17 00:00:00 2001
-From: He Zhe <zhe.he@windriver.com>
-Date: Wed, 30 Mar 2016 06:23:45 -0400
-Subject: [PATCH] openvswitch: Add test-install rule to support ptest execution
-
-Signed-off-by: Radu Patriu <radu.patriu@enea.com>
-
-Fix ptest for v2.5
- - Copy certain files from srcdir since it has been different from
-   build directory.
- - Copy more necessary files for new added test cases.
- - Modify config files for running on target.
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- Makefile.am |  1 +
- test.mk     | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 73 insertions(+)
- create mode 100644 test.mk
-
-diff --git a/Makefile.am b/Makefile.am
-index ed43c2f..f38d278 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -401,3 +401,4 @@ include datapath-windows/include/automake.mk
- include windows/automake.mk
- include ovn/automake.mk
- include selinux/automake.mk
-+include test.mk
-diff --git a/test.mk b/test.mk
-new file mode 100644
-index 0000000..b10a581
---- /dev/null
-+++ b/test.mk
-@@ -0,0 +1,72 @@
-+TEST_DEST ?= ${prefix}/lib/openvswitch
-+TEST_ROOT ?= ${prefix}/lib/openvswitch
-+TEST_DEPEND =
-+
-+if HAVE_OPENSSL
-+TEST_DEPEND += $(TESTPKI_FILES)
-+endif
-+
-+test-install: $(TEST_DEPEND)
-+	@list='$(noinst_PROGRAMS) $(EXTRA_DIST) $(dist_check_SCRIPTS) $(TEST_DEPEND) tests/atlocal tests/atconfig' ;\
-+	install -d $(TEST_DEST)/tests ;\
-+	install $(srcdir)/vtep/ovs-vtep $(TEST_DEST)/tests ;\
-+	install -d $(TEST_DEST)/python ;\
-+	install -d $(TEST_DEST)/python/ovs ;\
-+	install -d $(TEST_DEST)/python/ovs/db ;\
-+	install -d $(TEST_DEST)/python/ovs/unixctl ;\
-+	install -d $(TEST_DEST)/vswitchd ;\
-+	install $(srcdir)/vswitchd/vswitch.ovsschema $(TEST_DEST)/vswitchd ;\
-+	install vswitchd/ovs-vswitchd $(TEST_DEST)/vswitchd ;\
-+	install -d $(TEST_DEST)/debian ;\
-+	install $(srcdir)/debian/ovs-monitor-ipsec $(TEST_DEST)/debian ;\
-+	install -d $(TEST_DEST)/build-aux ;\
-+	install $(srcdir)/build-aux/check-structs $(TEST_DEST)/build-aux ;\
-+	install -d $(TEST_DEST)/xenserver ;\
-+	install $(srcdir)/xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync $(TEST_DEST)/xenserver ;\
-+	install $(srcdir)/xenserver/opt_xensource_libexec_interface-reconfigure $(TEST_DEST)/xenserver ;\
-+	install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigure.py $(TEST_DEST)/xenserver ;\
-+	install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigureBridge.py $(TEST_DEST)/xenserver ;\
-+	install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigureVswitch.py $(TEST_DEST)/xenserver ;\
-+	install -d $(TEST_DEST)/vtep ;\
-+	install $(srcdir)/vtep/vtep.ovsschema $(TEST_DEST)/vtep ;\
-+	install -d $(TEST_DEST)/ovn ;\
-+	install $(srcdir)/ovn/ovn-nb.ovsschema $(TEST_DEST)/ovn ;\
-+	install $(srcdir)/ovn/ovn-sb.ovsschema $(TEST_DEST)/ovn ;\
-+	install -d $(TEST_DEST)/utilities ;\
-+	install $(srcdir)/utilities/ovs-pcap.in $(TEST_DEST)/utilities ;\
-+	install $(srcdir)/utilities/ovs-pki.in $(TEST_DEST)/utilities ;\
-+	for p in $$list ; do \
-+	  echo $$p ;\
-+	  p=$${p#../git/} ;\
-+	  pre=$${p#tests\/} ;\
-+	  if test $$pre != $$p ; then \
-+	    echo installing $$p to $(TEST_DEST)/tests/$$pre ;\
-+	    if test -f $$p ; then \
-+	      install $$p $(TEST_DEST)/tests/$$pre ;\
-+	    else \
-+	      install $(srcdir)/$$p $(TEST_DEST)/tests/$$pre ;\
-+	    fi ;\
-+	    continue ;\
-+	  fi ;\
-+	  pre=$${p#python\/ovs\/} ;\
-+	  if test $$pre != $$p ; then \
-+	    echo installing $$p to $(TEST_DEST)/python/ovs/$$pre ;\
-+	    if test -f $$p ; then \
-+	      install $$p $(TEST_DEST)/python/ovs/$$pre ;\
-+	    else \
-+	      install $(srcdir)/$$p $(TEST_DEST)/python/ovs/$$pre ;\
-+	    fi ;\
-+	    continue ;\
-+	  fi; \
-+	done ;\
-+	sed -i 's|abs_builddir=.*|abs_builddir='"'"'$(TEST_ROOT)/tests'"'"'|g' $(TEST_DEST)/tests/atconfig
-+	sed -i 's|abs_srcdir=.*|abs_srcdir='"'"'$(TEST_ROOT)/tests'"'"'|g' $(TEST_DEST)/tests/atconfig
-+	sed -i 's|abs_top_srcdir=.*|abs_top_srcdir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
-+	sed -i 's|abs_top_builddir=.*|abs_top_builddir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
-+	sed -i 's|at_srcdir=.*|at_srcdir='"'"'.'"'"'|g' $(TEST_DEST)/tests/atconfig
-+	sed -i 's|at_top_srcdir=.*|at_top_srcdir='"'"'..'"'"'|g' $(TEST_DEST)/tests/atconfig
-+	sed -i 's|at_top_build_prefix=.*|at_top_build_prefix='"'"'../'"'"'|g' $(TEST_DEST)/tests/atconfig
-+	sed -i 's|^\(.*config\.log.*\)|#\1|g' $(TEST_DEST)/tests/testsuite
-+	sed -i 's|$$srcdir|$$abs_srcdir|g' $(TEST_DEST)/tests/testsuite
-+	sed -i 's|ovs-appctl-bashcomp\.bash|/etc/bash_completion.d/ovs-appctl-bashcomp\.bash|g' $(TEST_DEST)/tests/testsuite
-+	sed -i 's|ovs-vsctl-bashcomp\.bash|/etc/bash_completion.d/ovs-vsctl-bashcomp\.bash|g' $(TEST_DEST)/tests/testsuite
--- 
-1.9.1
-
diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-ptest-Fix-python-path.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-ptest-Fix-python-path.patch
deleted file mode 100644
index c75ebc5..0000000
--- a/recipes-networking/openvswitch/openvswitch-git/openvswitch-ptest-Fix-python-path.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 2a78bddb865e0d3377f437428ed6825195af0a14 Mon Sep 17 00:00:00 2001
-From: He Zhe <zhe.he@windriver.com>
-Date: Wed, 13 Apr 2016 03:13:01 -0400
-Subject: [PATCH] openvswitch: ptest: Fix python path
-
-For now PYTHON just happens to be the same as TARGET_PYTHON so we get the right
-python binary. This patch sets PYTHON to TARGET_PYTHON since ptest is going to
-be run on target.
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- tests/atlocal.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/atlocal.in b/tests/atlocal.in
-index 5815c6c..db2d2c9 100644
---- a/tests/atlocal.in
-+++ b/tests/atlocal.in
-@@ -5,7 +5,7 @@ EGREP='@EGREP@'
- PERL='@PERL@'
- 
- if test x"$PYTHON" = x; then
--    PYTHON='@PYTHON@'
-+    PYTHON='@TARGET_PYTHON@'
- fi
- 
- PYTHONPATH=$abs_top_srcdir/python:$abs_top_builddir/tests:$PYTHONPATH
--- 
-1.9.1
-
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 0ead302..1fb82ae 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -12,21 +12,20 @@ RDEPENDS_${PN}-ptest += "\
 	"
 
 S = "${WORKDIR}/git"
-PV = "2.6.1+${SRCREV}"
+PV = "2.7.0+${SRCREV}"
 
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
 
-SRCREV = "f4b0e64cffb4777ff03d48621c3eadcf1d8c19f3"
+SRCREV = "c298ef781c2d35d939fe163cbc2f41ea7b1cb8d1"
 SRC_URI = "file://openvswitch-switch \
            file://openvswitch-switch-setup \
            file://openvswitch-testcontroller \
            file://openvswitch-testcontroller-setup \
-           git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.6 \
+           git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.7 \
            file://openvswitch-add-ptest-${SRCREV}.patch \
            file://run-ptest \
            file://disable_m4_check.patch \
            file://kernel_module.patch \
-           file://openvswitch-ptest-Fix-python-path.patch \
            file://python-make-remaining-scripts-use-usr-bin-env.patch \
            file://0001-use-the-linux-if_packet.h-Interface-directly.patch \
            file://0002-Define-WAIT_ANY-if-not-provided-by-system.patch \
-- 
2.7.4


