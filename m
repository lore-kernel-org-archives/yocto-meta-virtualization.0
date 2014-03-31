Return-Path: <Radu.Patriu@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 9DCB5E00BF6
	for <meta-virtualization@yoctoproject.org>;
	Mon, 31 Mar 2014 01:50:12 -0700 (PDT)
Received: from rapa-2.enea.se (192.168.14.124) by SESTOEX03.enea.se
	(172.21.1.38) with Microsoft SMTP Server (TLS) id 14.3.158.1;
	Mon, 31 Mar 2014 10:50:07 +0200
From: Radu Patriu <radu.patriu@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 31 Mar 2014 11:49:58 +0300
Message-ID: <1396255798-12753-1-git-send-email-radu.patriu@enea.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [192.168.14.124]
Subject: [PATCH] openvswitch: add ptest support
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
X-List-Received-Date: Mon, 31 Mar 2014 08:50:16 -0000
Content-Type: text/plain

Install openvswitch test suite and run it as ptest.

Signed-off-by: Radu Patriu <radu.patriu@enea.com>
---
 .../openvswitch/files/openvswitch-add-ptest.patch  |   67 ++++++++++++++++++++
 recipes-networking/openvswitch/files/run-ptest     |    4 ++
 .../openvswitch/openvswitch_2.0.0.bb               |   16 ++++-
 3 files changed, 85 insertions(+), 2 deletions(-)
 create mode 100644 recipes-networking/openvswitch/files/openvswitch-add-ptest.patch
 create mode 100644 recipes-networking/openvswitch/files/run-ptest

diff --git a/recipes-networking/openvswitch/files/openvswitch-add-ptest.patch b/recipes-networking/openvswitch/files/openvswitch-add-ptest.patch
new file mode 100644
index 0000000..aebb182
--- /dev/null
+++ b/recipes-networking/openvswitch/files/openvswitch-add-ptest.patch
@@ -0,0 +1,67 @@
+Add test-install rule to support ptest execution
+
+Signed-off-by: Radu Patriu <radu.patriu@enea.com>
+
+Index: ovs/Makefile.am
+===================================================================
+--- ovs.orig/Makefile.am	2014-03-10 16:19:46.000000000 +0200
++++ ovs/Makefile.am	2014-03-10 16:23:10.481075341 +0200
+@@ -276,3 +276,4 @@
+ include python/automake.mk
+ include python/compat/automake.mk
+ include tutorial/automake.mk
++include test.mk
+Index: ovs/test.mk
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ ovs/test.mk	2014-03-10 16:42:41.000000000 +0200
+@@ -0,0 +1,49 @@
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
++	install -d $(TEST_DEST)/python ;\
++	install -d $(TEST_DEST)/python/ovs ;\
++	install -d $(TEST_DEST)/python/ovs/db ;\
++	install -d $(TEST_DEST)/python/ovs/unixctl ;\
++	install -d $(TEST_DEST)/vswitchd ;\
++	install vswitchd/vswitch.ovsschema $(TEST_DEST)/vswitchd ;\
++	install -d $(TEST_DEST)/debian ;\
++	install debian/ovs-monitor-ipsec $(TEST_DEST)/debian ;\
++	install -d $(TEST_DEST)/build-aux ;\
++	install build-aux/check-structs $(TEST_DEST)/build-aux ;\
++	install -d $(TEST_DEST)/xenserver ;\
++	install xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync $(TEST_DEST)/xenserver ;\
++	install xenserver/opt_xensource_libexec_interface-reconfigure $(TEST_DEST)/xenserver ;\
++	install xenserver/opt_xensource_libexec_InterfaceReconfigure.py $(TEST_DEST)/xenserver ;\
++	install xenserver/opt_xensource_libexec_InterfaceReconfigureBridge.py $(TEST_DEST)/xenserver ;\
++	install xenserver/opt_xensource_libexec_InterfaceReconfigureVswitch.py $(TEST_DEST)/xenserver ;\
++	install -d $(TEST_DEST)/vtep ;\
++	install vtep/vtep.ovsschema $(TEST_DEST)/vtep ;\
++	for p in $$list ; do \
++	  echo $$p ;\
++	  p=$${p#./} ;\
++	  pre=$${p#tests\/} ;\
++	  if test $$pre != $$p ; then \
++	    echo installing $$p to $(TEST_DEST)/tests/$$pre ;\
++	    install $$p $(TEST_DEST)/tests/$$pre ;\
++	    continue ;\
++	  fi ;\
++	  pre=$${p#python\/ovs\/} ;\
++	  if test $$pre != $$p ; then \
++	    echo installing $$p to $(TEST_DEST)/python/ovs/$$pre ;\
++	    install $$p $(TEST_DEST)/python/ovs/$$pre ;\
++	    continue ;\
++	  fi; \
++	done ;\
++	sed -i 's|abs_builddir=.*|abs_builddir='"'"'$(TEST_ROOT)/tests'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|abs_srcdir=.*|abs_srcdir='"'"'$(TEST_ROOT)/tests'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|abs_top_srcdir=.*|abs_top_srcdir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
++	sed -i 's|abs_top_builddir=.*|abs_top_builddir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
diff --git a/recipes-networking/openvswitch/files/run-ptest b/recipes-networking/openvswitch/files/run-ptest
new file mode 100644
index 0000000..dd06707
--- /dev/null
+++ b/recipes-networking/openvswitch/files/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+./tests/testsuite --am-fmt -C tests AUTOTEST_PATH=utilities:vswitchd:ovsdb:tests
+
diff --git a/recipes-networking/openvswitch/openvswitch_2.0.0.bb b/recipes-networking/openvswitch/openvswitch_2.0.0.bb
index 15c4dca..0100308 100644
--- a/recipes-networking/openvswitch/openvswitch_2.0.0.bb
+++ b/recipes-networking/openvswitch/openvswitch_2.0.0.bb
@@ -14,6 +14,10 @@ RDEPENDS_${PN}-pki = "${PN}"
 RDEPENDS_${PN}-brcompat = "${PN} ${PN}-switch"
 RRECOMMENDS_${PN} += "kernel-module-openvswitch"
 
+RDEPENDS_${PN}-ptest += "python-logging python-syslog python-argparse python-io \
+                     python-fcntl python-shell python-lang python-xml python-math \
+                     python-datetime python-netclient python sed"
+
 # Some installers will fail because of an install order based on
 # rdeps.  E.g. ovs-pki calls sed in the postinstall.  sed may be
 # queued for install later.
@@ -26,7 +30,9 @@ SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
 	file://openvswitch-controller-setup \
 	file://openvswitch-add-target-python-handling.patch \
 	file://openvswitch-add-target-perl-handling.patch \
-        file://openvswitch-add-more-target-python-substitutions.patch \
+	file://openvswitch-add-more-target-python-substitutions.patch \
+	file://openvswitch-add-ptest.patch \
+	file://run-ptest \
 	"
 
 SRC_URI[md5sum] = "7d7a58350e634e515e0fe43c64d64f44"
@@ -60,7 +66,13 @@ FILES_${PN}-switch = "${sysconfdir}/init.d/openvswitch-switch \
 FILES_${PN} += "${datadir}/ovsdbmonitor"
 FILES_${PN} += "/run"
 
-inherit autotools update-rc.d
+inherit autotools update-rc.d ptest
+
+EXTRA_OEMAKE += "TEST_DEST=${D}${PTEST_PATH} TEST_ROOT=${PTEST_PATH}"
+
+do_install_ptest() {
+	oe_runmake test-install
+}
 
 INITSCRIPT_PACKAGES = "${PN}-switch ${PN}-controller"
 INITSCRIPT_NAME_${PN}-switch = "openvswitch-switch"
-- 
1.7.9.5


