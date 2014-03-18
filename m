Return-Path: <misn@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 893C9E00AC5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Mar 2014 03:34:19 -0700 (PDT)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 18 Mar 2014 11:34:14 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4351)	id 989892800CD;
	Tue, 18 Mar 2014 11:34:14 +0100 (CET)
From: Mihaela Sendrea <mihaela.sendrea@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 18 Mar 2014 11:34:11 +0100
Message-ID: <1395138852-21444-2-git-send-email-mihaela.sendrea@enea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395138852-21444-1-git-send-email-mihaela.sendrea@enea.com>
References: <1395138852-21444-1-git-send-email-mihaela.sendrea@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: mihaela.sendrea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 1/2] libvirt: Add ptest support
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
X-List-Received-Date: Tue, 18 Mar 2014 10:34:23 -0000
Content-Type: text/plain

Install libvirt test suite and run it as ptest.

Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
---
 recipes-extended/libvirt/libvirt/run-ptest      |   3 +
 recipes-extended/libvirt/libvirt/runptest.patch | 112 ++++++++++++++++++++++++
 recipes-extended/libvirt/libvirt_1.2.1.bb       |  39 ++++++++-
 3 files changed, 151 insertions(+), 3 deletions(-)
 create mode 100644 recipes-extended/libvirt/libvirt/run-ptest
 create mode 100644 recipes-extended/libvirt/libvirt/runptest.patch

diff --git a/recipes-extended/libvirt/libvirt/run-ptest b/recipes-extended/libvirt/libvirt/run-ptest
new file mode 100644
index 0000000..a434b18
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+make -C tests -k check-TESTS
diff --git a/recipes-extended/libvirt/libvirt/runptest.patch b/recipes-extended/libvirt/libvirt/runptest.patch
new file mode 100644
index 0000000..0c01975
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/runptest.patch
@@ -0,0 +1,112 @@
+Add 'install-ptest' rule.
+Change TESTS_ENVIRONMENT to allow running outside build dir.
+
+Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
+Upstream-status: Pending
+
+diff -uNr a/tests/Makefile.am b/tests/Makefile.am
+--- a/tests/Makefile.am	2014-03-11 11:37:31.497605736 +0200
++++ b/tests/Makefile.am	2014-03-17 15:57:35.515268399 +0200
+@@ -27,9 +27,11 @@
+ 	-I$(top_srcdir)/src/conf \
+ 	$(GETTEXT_CPPFLAGS)
+ 
++PTEST_DIR ?= /usr/lib/libvirt/ptest
++
+ AM_CFLAGS = \
+-	-Dabs_builddir="\"`pwd`\"" \
+-	-Dabs_srcdir="\"`cd '$(srcdir)'; pwd`\"" \
++	-Dabs_builddir="\"$(PTEST_DIR)/tests\"" \
++	-Dabs_srcdir="\"$(PTEST_DIR)/tests\"" \
+ 	$(LIBXML_CFLAGS) \
+ 	$(GNUTLS_CFLAGS) \
+ 	$(SASL_CFLAGS) \
+@@ -41,7 +43,7 @@
+ 
+ if WITH_DRIVER_MODULES
+ INCLUDES += \
+-	-DTEST_DRIVER_DIR=\"$(top_builddir)/src/.libs\"
++	-DTEST_DRIVER_DIR=\"$(PTEST_DIR)/src/.libs\"
+ endif WITH_DRIVER_MODULES
+ 
+ PROBES_O =
+@@ -344,20 +346,19 @@
+ # Also, BSD sh doesn't like 'a=b b=$$a', so we can't use an
+ # intermediate shell variable, but must do all the expansion in make
+ 
+-lv_abs_top_builddir=`cd '$(top_builddir)'; pwd`
+ path_add = $(subst :,$(PATH_SEPARATOR),\
+-	$(subst !,$(lv_abs_top_builddir)/,!daemon:!tools:!tests))
++	$(subst !,$(PTEST_DIR)/,!daemon:!tools:!tests))
+ 
+ VIR_TEST_EXPENSIVE ?= $(VIR_TEST_EXPENSIVE_DEFAULT)
+ TESTS_ENVIRONMENT =				\
+-  abs_top_builddir=$(lv_abs_top_builddir)	\
+-  abs_top_srcdir=`cd '$(top_srcdir)'; pwd`	\
+-  abs_builddir=`pwd`				\
+-  abs_srcdir=`cd '$(srcdir)'; pwd`		\
+-  CONFIG_HEADER="`cd '$(top_builddir)'; pwd`/config.h"	\
++  abs_top_builddir="$(PTEST_DIR)"             \
++  abs_top_srcdir="$(PTEST_DIR)"               \
++  abs_builddir="$(PTEST_DIR)/tests"           \
++  abs_srcdir="$(PTEST_DIR)/tests"             \
++  CONFIG_HEADER="$(PTEST_DIR)/config.h"       \
+   PATH="$(path_add)$(PATH_SEPARATOR)$$PATH"	\
+   SHELL="$(SHELL)"				\
+-  LIBVIRT_DRIVER_DIR="$(lv_abs_top_builddir)/src/.libs" \
++  LIBVIRT_DRIVER_DIR="$(PTEST_DIR)/src/.libs" \
+   LIBVIRT_AUTOSTART=0				\
+   LC_ALL=C					\
+   VIR_TEST_EXPENSIVE=$(VIR_TEST_EXPENSIVE)	\
+@@ -933,5 +934,51 @@
+ EXTRA_DIST += object-locking.ml
+ endif ! WITH_CIL
+ 
++buildtest-TESTS: $(TESTS) $(test_libraries) $(test_helpers)
++
++PTESTS = $(TESTS) $(test_helpers) test-lib.sh schematestutils.sh
++
++install-ptest:
++	list='$(TESTS) $(test_helpers) test-lib.sh schematestutils.sh'
++	install -d $(DEST_DIR)/tools
++	@(if [ -d ../tools/.libs ] ; then cd ../tools/.libs; fi; \
++	install * $(DEST_DIR)/tools)
++	install -d $(DEST_DIR)/src/network
++	cp ../src/network/*.xml $(DEST_DIR)/src/network
++	install -d $(DEST_DIR)/src/cpu
++	cp ../src/cpu/*.xml $(DEST_DIR)/src/cpu
++	install ../src/libvirt_iohelper $(DEST_DIR)/src
++	install -D ../daemon/libvirtd $(DEST_DIR)/daemon/libvirtd
++	install -D ../daemon/libvirtd.conf $(DEST_DIR)/daemon/libvirtd.conf
++	@(if [ -d ../daemon/.libs ] ; then cd ../daemon/.libs; fi; \
++	install * $(DEST_DIR)/daemon)
++	install -d $(DEST_DIR)/src/.libs
++	@(if [ -d ../src/.libs ] ; then cd ../src/.libs; fi; \
++	install * $(DEST_DIR)/src/.libs)
++	install -d $(DEST_DIR)/docs/schemas
++	cp ../docs/schemas/*.rng $(DEST_DIR)/docs/schemas
++	cp -r ../build-aux $(DEST_DIR)
++	install -d $(DEST_DIR)/examples/xml
++	cp -r ../examples/xml/test $(DEST_DIR)/examples/xml
++	install -d $(DEST_DIR)/tests/.libs
++	find . -type d -name "*xml2xml*" -exec cp -r {} $(DEST_DIR)/tests \;
++	find . -type d -name "*data" -exec cp -r {} $(DEST_DIR)/tests \;
++	@(for file in $(PTESTS); do \
++		if [ -f .libs/$$file ]; then \
++			install .libs/$$file $(DEST_DIR)/tests; \
++		else \
++			install $$file $(DEST_DIR)/tests; \
++		fi; \
++	done;)
++	@(if [ -d .libs ]; then install .libs/*.so $(DEST_DIR)/tests/.libs; fi;)
++	cp ../config.h $(DEST_DIR)
++	cp Makefile $(DEST_DIR)/tests
++	sed -i -e 's/^Makefile:/_Makefile:/' $(DEST_DIR)/tests/Makefile
++	cp ../Makefile $(DEST_DIR)
++	sed -i -e 's|^Makefile:|_Makefile:|' $(DEST_DIR)/Makefile
++	sed -i -e 's|$(BUILD_DIR)|$(PTEST_DIR)|g' $(DEST_DIR)/tests/Makefile
++	sed -i -e 's|$(BUILD_DIR)|$(PTEST_DIR)|g' $(DEST_DIR)/Makefile
++	sed -i -e 's|^\(.*\.log:\) \(.*EXEEXT.*\)|\1|g' $(DEST_DIR)/tests/Makefile
++
+ CLEANFILES = *.cov *.gcov .libs/*.gcda .libs/*.gcno *.gcno *.gcda *.cmi *.cmx \
+ 	object-locking-files.txt
diff --git a/recipes-extended/libvirt/libvirt_1.2.1.bb b/recipes-extended/libvirt/libvirt_1.2.1.bb
index 4c9cf36..e2c0f99 100644
--- a/recipes-extended/libvirt/libvirt_1.2.1.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.1.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "A toolkit to interact with the virtualization capabilities of recent versions of Linux." 
 HOMEPAGE = "http://libvirt.org"
 LICENSE = "LGPLv2.1+"
+LICENSE_${PN}-ptest = "GPLv2+ & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "console/tools"
@@ -13,6 +14,8 @@ DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux
 #
 RDEPENDS_${PN} = "gettext-runtime"
 
+RDEPENDS_${PN}-ptest += "make gawk"
+
 RDEPENDS_libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq netcat-openbsd"
 RDEPENDS_libvirt-libvirtd_append_x86-64 = " dmidecode"
 RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
@@ -22,13 +25,16 @@ RCONFLICTS_${PN}_libvirtd = "connman"
 
 SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
            file://tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch \
-	   file://libvirtd.sh \
-	   file://libvirtd.conf"
+           file://libvirtd.sh \
+           file://libvirtd.conf \
+           file://runptest.patch \
+           file://run-ptest \
+          "
 
 SRC_URI[libvirt.md5sum] = "cce374220f67895afb6331bd2ddedbfd"
 SRC_URI[libvirt.sha256sum] = "bc29b5751bf36753c17e2fdbb75e70c7b07df3d9527586d3426e90f5f4abb898"
 
-inherit autotools gettext update-rc.d pkgconfig
+inherit autotools gettext update-rc.d pkgconfig ptest
 
 CACHED_CONFIGUREVARS += "\
 ac_cv_path_XMLLINT=/usr/bin/xmllint \
@@ -105,6 +111,23 @@ INITSCRIPT_PACKAGES = "${PN}-libvirtd"
 INITSCRIPT_NAME_${PN}-libvirtd = "libvirtd"
 INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
 
+PRIVATE_LIBS_${PN}-ptest = " \
+	libvirt-lxc.so.0 \
+	libvirt.so.0 \
+	libvirt-qemu.so.0 \
+	lockd.so \
+	libvirt_driver_secret.so \
+	libvirt_driver_nodedev.so \
+	libvirt_driver_vbox.so \
+	libvirt_driver_interface.so \
+	libvirt_driver_uml.so \
+	libvirt_driver_network.so \
+	libvirt_driver_nwfilter.so \
+	libvirt_driver_qemu.so \
+	libvirt_driver_storage.so \
+	libvirt_driver_lxc.so \
+    "
+
 # xen-minimal config
 #PACKAGECONFIG ??= "xen libxl xen-inotify test remote libvirtd"
 
@@ -176,6 +199,16 @@ do_install_append() {
 	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
 }
 
+EXTRA_OEMAKE = "BUILD_DIR=${B} DEST_DIR=${D}${PTEST_PATH} PTEST_DIR=${PTEST_PATH}"
+
+do_compile_ptest() {
+	oe_runmake -C tests buildtest-TESTS
+}
+
+do_install_ptest() {
+	oe_runmake -C tests install-ptest
+}
+
 pkg_postinst_libvirt() {
         if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
                 /etc/init.d/populate-volatile.sh update
-- 
1.8.5.3


