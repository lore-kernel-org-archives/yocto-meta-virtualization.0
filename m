Return-Path: <misn@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 12A6CE00BAA
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Apr 2014 06:26:27 -0700 (PDT)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 14 Apr 2014 15:26:22 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4351)	id A8E08288419;
	Mon, 14 Apr 2014 15:26:22 +0200 (CEST)
From: Mihaela Sendrea <mihaela.sendrea@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 14 Apr 2014 15:26:19 +0200
Message-ID: <1397481980-65447-2-git-send-email-mihaela.sendrea@enea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1397481980-65447-1-git-send-email-mihaela.sendrea@enea.com>
References: <1397481980-65447-1-git-send-email-mihaela.sendrea@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: mihaela.sendrea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 1/2] lxc: Add ptest support
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
X-List-Received-Date: Mon, 14 Apr 2014 13:26:28 -0000
Content-Type: text/plain

Install lxc test suite and run it as ptest.

Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
---
 recipes-containers/lxc/files/run-ptest     |  4 ++++
 recipes-containers/lxc/files/runtest.patch | 32 ++++++++++++++++++++++++++++++
 recipes-containers/lxc/lxc_1.0.0.bb        | 17 ++++++++++++++--
 3 files changed, 51 insertions(+), 2 deletions(-)
 create mode 100644 recipes-containers/lxc/files/run-ptest
 create mode 100644 recipes-containers/lxc/files/runtest.patch

diff --git a/recipes-containers/lxc/files/run-ptest b/recipes-containers/lxc/files/run-ptest
new file mode 100644
index 0000000..23a6256
--- /dev/null
+++ b/recipes-containers/lxc/files/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+make -C src/tests -k check-TESTS
+
diff --git a/recipes-containers/lxc/files/runtest.patch b/recipes-containers/lxc/files/runtest.patch
new file mode 100644
index 0000000..e4e034b
--- /dev/null
+++ b/recipes-containers/lxc/files/runtest.patch
@@ -0,0 +1,32 @@
+Add install-ptest rule.
+
+Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
+Upstream-status: Pending
+
+diff -uNr a/src/tests/Makefile.am b/src/tests/Makefile.am
+--- a/src/tests/Makefile.am	2014-04-07 16:25:59.246238815 +0300
++++ b/src/tests/Makefile.am	2014-04-10 18:09:43.195772467 +0300
+@@ -54,6 +54,23 @@
+ 
+ endif
+ 
++TESTS = lxc-test-containertests lxc-test-locktests \
++        lxc-test-getkeys lxc-test-lxcpath lxc-test-cgpath lxc-test-console \
++        lxc-test-snapshot lxc-test-concurrent lxc-test-may-control \
++        lxc-test-reboot lxc-test-list lxc-test-attach lxc-test-device-add-remove
++
++buildtest-TESTS: $(TESTS)
++
++install-ptest:
++	install -d $(TEST_DIR)
++	install -D ../lxc/liblxc.so $(TEST_DIR)/../lxc/liblxc.so
++	install -D ../../config/test-driver $(TEST_DIR)/../../config/test-driver
++	cp Makefile $(TEST_DIR)
++	@(for file in $(TESTS); do install $$file $(TEST_DIR);  done;)
++	sed -i 's|^Makefile:|_Makefile:|' $(TEST_DIR)/Makefile
++	sed -i 's|^all-am:|_all-am:|' $(TEST_DIR)/Makefile
++	sed -i -e 's|^\(.*\.log:\) \(.*EXEEXT.*\)|\1|g' $(TEST_DIR)/Makefile
++
+ EXTRA_DIST = \
+ 	cgpath.c \
+ 	clonetest.c \
diff --git a/recipes-containers/lxc/lxc_1.0.0.bb b/recipes-containers/lxc/lxc_1.0.0.bb
index d5fc680..5a35177 100644
--- a/recipes-containers/lxc/lxc_1.0.0.bb
+++ b/recipes-containers/lxc/lxc_1.0.0.bb
@@ -20,12 +20,15 @@ RDEPENDS_${PN} = " \
 		perl-module-overload \
 		perl-module-exporter-heavy \
 "
+RDEPENDS_${PN}-ptest += "file make"
 
 SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
 	file://config_network_type-set-macvlan-default-mode-to-priv.patch \
 	file://lxc-busybox-follow-symlinks-when-inspecting-busybox-.patch \
 	file://network.c-Add-missing-LXC_NET_NONE-option-refactor.patch \
+	file://runtest.patch \
+	file://run-ptest \
 	"
 SRC_URI[md5sum] = "87a9d168a6e55326303cce3b2cb7f82e"
 SRC_URI[sha256sum] = "0992212ddaad01dfe8c048e130566b73dd5f34191585f36bdac07a4f8a91f3bd"
@@ -34,20 +37,23 @@ S = "${WORKDIR}/${BPN}-${PV}"
 
 # Let's not configure for the host distro.
 #
-EXTRA_OECONF += "--with-distro=${DISTRO}"
+PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-tests', '', d)}"
+EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[doc] = "--enable-doc,--disable-doc,,"
 PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
 PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
 
 FILES_${PN}-doc = "${mandir} ${infodir}"
 # For LXC the docdir only contains example configuration files and should be included in the lxc package
 FILES_${PN} += "${docdir}"
 FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
 
+PRIVATE_LIBS_${PN}-ptest = "liblxc.so.1"
+
 do_install_append() {
 	# The /var/cache/lxc directory created by the Makefile
 	# is wiped out in volatile, we need to create this at boot.
@@ -58,8 +64,15 @@ do_install_append() {
 
 }
 
+EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
+
+do_install_ptest() {
+	oe_runmake -C src/tests install-ptest
+}
+
 pkg_postinst_${PN}() {
 	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
 		/etc/init.d/populate-volatile.sh update
 	fi
 }
+
-- 
1.8.5.3


