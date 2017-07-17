Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4D6C7E00C3C; Mon, 17 Jul 2017 13:04:19 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1123E00C2E
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jul 2017 13:04:16 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6HK4GhQ001702
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jul 2017 13:04:16 -0700 (PDT)
Received: from yow-bashfiel-d2.wrs.com (128.224.56.49) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 17 Jul 2017 13:04:15 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 17 Jul 2017 16:04:02 -0400
Message-ID: <1500321853-984-2-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.4.0.53.g8440f74
In-Reply-To: <1500321853-984-1-git-send-email-bruce.ashfield@windriver.com>
References: <1500321853-984-1-git-send-email-bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/12] openvswitch: uprev to v2.7.1
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
X-List-Received-Date: Mon, 17 Jul 2017 20:04:19 -0000
Content-Type: text/plain

From: Mark Asselstine <mark.asselstine@windriver.com>

Released at the end of June 2017 this is a bugfix release with no
major functional changes. Surprisingly the patch for CVE-2017-9263 is
still not applied upstream so we continue to carry this change.

The remaining patches were audited and cleaned up as needed.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...gure-Only-link-against-libpcap-on-FreeBSD.patch |  70 -------------
 ...-b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc.patch | 110 +++++++++++++++++++++
 ...-c298ef781c2d35d939fe163cbc2f41ea7b1cb8d1.patch | 110 ---------------------
 recipes-networking/openvswitch/openvswitch_git.bb  |   4 +-
 4 files changed, 112 insertions(+), 182 deletions(-)
 delete mode 100644 recipes-networking/openvswitch/files/configure-Only-link-against-libpcap-on-FreeBSD.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc.patch
 delete mode 100644 recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-c298ef781c2d35d939fe163cbc2f41ea7b1cb8d1.patch

diff --git a/recipes-networking/openvswitch/files/configure-Only-link-against-libpcap-on-FreeBSD.patch b/recipes-networking/openvswitch/files/configure-Only-link-against-libpcap-on-FreeBSD.patch
deleted file mode 100644
index 0a44b85ebf43..000000000000
--- a/recipes-networking/openvswitch/files/configure-Only-link-against-libpcap-on-FreeBSD.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From d30e714ccb9d13caf39d14d5b2fc9523b678ed51 Mon Sep 17 00:00:00 2001
-From: Ben Pfaff <blp@nicira.com>
-Date: Thu, 14 Mar 2013 15:20:55 -0700
-Subject: [PATCH] configure: Only link against libpcap on FreeBSD.
-
-commit d30e714ccb9d13caf39d14d5b2fc9523b678ed51 upstream
-http://git.openvswitch.org/git/openvswitch
-
-On other platforms there is no benefit to linking against libpcap, because
-it is not used.
-
-Signed-off-by: Ben Pfaff <blp@nicira.com>
-CC: Ed Maste <emaste@freebsd.org>
----
- acinclude.m4 | 7 ++++++-
- configure.ac | 3 +--
- 2 files changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index f0610c9..19a47dd 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -1,6 +1,6 @@
- # -*- autoconf -*-
- 
--# Copyright (c) 2008, 2009, 2010, 2011, 2012 Nicira, Inc.
-+# Copyright (c) 2008, 2009, 2010, 2011, 2012, 2013 Nicira, Inc.
- #
- # Licensed under the Apache License, Version 2.0 (the "License");
- # you may not use this file except in compliance with the License.
-@@ -295,6 +295,8 @@ AC_DEFUN([OVS_CHECK_IF_PACKET],
-    fi])
- 
- dnl Checks for net/if_dl.h.
-+dnl
-+dnl (We use this as a proxy for checking whether we're building on FreeBSD.)
- AC_DEFUN([OVS_CHECK_IF_DL],
-   [AC_CHECK_HEADER([net/if_dl.h],
-                    [HAVE_IF_DL=yes],
-@@ -303,6 +305,9 @@ AC_DEFUN([OVS_CHECK_IF_DL],
-    if test "$HAVE_IF_DL" = yes; then
-       AC_DEFINE([HAVE_IF_DL], [1],
-                 [Define to 1 if net/if_dl.h is available.])
-+
-+      # On FreeBSD we use libpcap to access network devices.
-+      AC_SEARCH_LIBS([pcap_open_live], [pcap])
-    fi])
- 
- dnl Checks for buggy strtok_r.
-diff --git a/configure.ac b/configure.ac
-index 1cacd29..bd49179 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1,4 +1,4 @@
--# Copyright (c) 2008, 2009, 2010, 2011, 2012 Nicira, Inc.
-+# Copyright (c) 2008, 2009, 2010, 2011, 2012, 2013 Nicira, Inc.
- #
- # Licensed under the Apache License, Version 2.0 (the "License");
- # you may not use this file except in compliance with the License.
-@@ -44,7 +44,6 @@ AC_SYS_LARGEFILE
- AC_SEARCH_LIBS([pow], [m])
- AC_SEARCH_LIBS([clock_gettime], [rt])
- AC_SEARCH_LIBS([timer_create], [rt])
--AC_SEARCH_LIBS([pcap_open_live], [pcap])
- 
- OVS_CHECK_ESX
- OVS_CHECK_COVERAGE
--- 
-1.8.3.2
-
diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc.patch
new file mode 100644
index 000000000000..47c81dd98c18
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc.patch
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
diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-c298ef781c2d35d939fe163cbc2f41ea7b1cb8d1.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-c298ef781c2d35d939fe163cbc2f41ea7b1cb8d1.patch
deleted file mode 100644
index 47c81dd98c18..000000000000
--- a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-c298ef781c2d35d939fe163cbc2f41ea7b1cb8d1.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From a2a656e6976a60e5df3ade0d17a40b4ebdc2b41a Mon Sep 17 00:00:00 2001
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
-index a4dd7b8..0bd32c7 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -429,3 +429,4 @@ include windows/automake.mk
- include ovn/automake.mk
- include selinux/automake.mk
- include build-aux/automake.mk
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
-2.7.4
-
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index a2893e9da0a5..39726075953e 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -12,11 +12,11 @@ RDEPENDS_${PN}-ptest += "\
 	"
 
 S = "${WORKDIR}/git"
-PV = "2.7.0+${SRCREV}"
+PV = "2.7.1+${SRCREV}"
 
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
 
-SRCREV = "c298ef781c2d35d939fe163cbc2f41ea7b1cb8d1"
+SRCREV = "b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc"
 SRC_URI = "file://openvswitch-switch \
            file://openvswitch-switch-setup \
            file://openvswitch-testcontroller \
-- 
2.4.0.53.g8440f74


