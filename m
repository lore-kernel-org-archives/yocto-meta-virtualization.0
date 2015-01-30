Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8CAD8E0086F; Fri, 30 Jan 2015 09:36:20 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 571AEE002F9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Jan 2015 09:36:17 -0800 (PST)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0UHaGDn014054
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Jan 2015 09:36:17 -0800 (PST)
Received: from afong by yow-dellw-af with local (Exim 4.84)
	(envelope-from <amy.fong@windriver.com>) id 1YHFUE-0002QP-82
	for meta-virtualization@yoctoproject.org;
	Fri, 30 Jan 2015 12:36:06 -0500
Date: Fri, 30 Jan 2015 12:36:06 -0500
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org
Message-ID: <20150130173606.GA9299@windriver.com>
References: <20150130173537.GA9113@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20150130173537.GA9113@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH 1/2] Package openvswitch git
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
X-List-Received-Date: Fri, 30 Jan 2015 17:36:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From 52c210a8d61f9aacb2630197e984efafd54d96f3 Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Thu, 29 Jan 2015 09:56:03 -0500
Subject: [PATCH 1/2] Package openvswitch git

This revision corresponds to git rev 1667bb34988358aaf1c92d0d21fad4b1c8698780
(based on 2.3.90)

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 .../openvswitch-git/disable_m4_check.patch         |  18 +++
 .../openvswitch-git/kernel_module.patch            |  20 +++
 .../non_reproducible_builds_cleanup.patch          |  18 +++
 ...-1667bb34988358aaf1c92d0d21fad4b1c8698780.patch |  69 ++++++++++
 recipes-networking/openvswitch/openvswitch_git.bb  | 143 +++++++++++++++++++++
 5 files changed, 268 insertions(+)
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/disable_m4_check.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/kernel_module.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/non_reproducible_builds_cleanup.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-1667bb34988358aaf1c92d0d21fad4b1c8698780.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch_git.bb

diff --git a/recipes-networking/openvswitch/openvswitch-git/disable_m4_check.patch b/recipes-networking/openvswitch/openvswitch-git/disable_m4_check.patch
new file mode 100644
index 0000000..1ad5d6f
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/disable_m4_check.patch
@@ -0,0 +1,18 @@
+Disable m4 file test where sources are built from git.
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+---
+ Makefile.am |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -185,7 +185,7 @@
+ # Makefile in datapath/linux, needed to get the list of files to
+ # distribute, requires GNU make extensions.
+ if GNU_MAKE
+-ALL_LOCAL += dist-hook-git
++# ALL_LOCAL += dist-hook-git
+ dist-hook-git: distfiles
+ 	@if test -e $(srcdir)/.git && (git --version) >/dev/null 2>&1; then \
+ 	  (cd datapath && $(MAKE) distfiles);				    \
diff --git a/recipes-networking/openvswitch/openvswitch-git/kernel_module.patch b/recipes-networking/openvswitch/openvswitch-git/kernel_module.patch
new file mode 100644
index 0000000..033cfb8
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/kernel_module.patch
@@ -0,0 +1,20 @@
+Specify install path for kernel module
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+---
+ datapath/linux/Makefile.main.in |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+--- a/datapath/linux/Makefile.main.in
++++ b/datapath/linux/Makefile.main.in
+@@ -71,8 +71,8 @@
+ 	$(MAKE) -C $(KSRC) M=$(builddir) modules
+ 
+ modules_install:
+-	$(MAKE) -C $(KSRC) M=$(builddir) modules_install
+-	depmod `sed -n 's/#define UTS_RELEASE "\([^"]*\)"/\1/p' $(KSRC)/include/generated/utsrelease.h`
++	$(MAKE) -C $(KSRC) M=$(builddir) modules_install INSTALL_MOD_PATH=${INSTALL_MOD_PATH}
++	# depmod `sed -n 's/#define UTS_RELEASE "\([^"]*\)"/\1/p' $(KSRC)/include/generated/utsrelease.h`
+ endif
+ 
+ # Much of the kernel build system in this file is derived from Intel's
diff --git a/recipes-networking/openvswitch/openvswitch-git/non_reproducible_builds_cleanup.patch b/recipes-networking/openvswitch/openvswitch-git/non_reproducible_builds_cleanup.patch
new file mode 100644
index 0000000..999f2ea
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/non_reproducible_builds_cleanup.patch
@@ -0,0 +1,18 @@
+Remove __DATE__, __TIME__ - error messages on non-reproducible builds
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+---
+ datapath/datapath.c             |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+--- a/datapath/datapath.c
++++ b/datapath/datapath.c
+@@ -2142,7 +2142,7 @@
+ 
+ 	BUILD_BUG_ON(sizeof(struct ovs_skb_cb) > FIELD_SIZEOF(struct sk_buff, cb));
+ 
+-	pr_info("Open vSwitch switching datapath %s, built "__DATE__" "__TIME__"\n",
++	pr_info("Open vSwitch switching datapath %s\n",
+ 		VERSION);
+ 
+ 	err = action_fifos_init();
diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-1667bb34988358aaf1c92d0d21fad4b1c8698780.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-1667bb34988358aaf1c92d0d21fad4b1c8698780.patch
new file mode 100644
index 0000000..76e312c
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-1667bb34988358aaf1c92d0d21fad4b1c8698780.patch
@@ -0,0 +1,69 @@
+Add test-install rule to support ptest execution
+
+Signed-off-by: Radu Patriu <radu.patriu@enea.com>
+
+---
+ Makefile.am |    2 ++
+ test.mk     |   49 +++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 51 insertions(+)
+
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -369,3 +369,5 @@
+ include vtep/automake.mk
+ include datapath-windows/automake.mk
+ include datapath-windows/include/automake.mk
++include test.mk
++
+--- /dev/null
++++ b/test.mk
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
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
new file mode 100644
index 0000000..17bebae
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -0,0 +1,143 @@
+SUMMARY = "OpenvSwitch"
+DESCRIPTION = "Open vSwitch is a production quality, multilayer virtual switch licensed under the open source Apache 2.0 license. It is designed to enable massive network automation through programmatic extension, while still supporting standard management interfaces and protocols (e.g. NetFlow, sFlow, SPAN, RSPAN, CLI, LACP, 802.1ag)"
+HOMEPAGE = "http://openvswitch.org/"
+SECTION = "networking"
+LICENSE = "Apache-2 & GPLv2 & PSF"
+
+DEPENDS += "bridge-utils openssl python perl virtual/kernel"
+
+RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid coreutils \
+	       python perl perl-module-strict ${PN}-switch ${PN}-controller"
+RDEPENDS_${PN}-controller = "${PN} lsb ${PN}-pki"
+RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
+RDEPENDS_${PN}-pki = "${PN}"
+RDEPENDS_${PN}-brcompat = "${PN} ${PN}-switch"
+RRECOMMENDS_${PN} += "kernel-module-openvswitch"
+
+RDEPENDS_${PN}-ptest += "python-logging python-syslog python-argparse python-io \
+                     python-fcntl python-shell python-lang python-xml python-math \
+                     python-datetime python-netclient python sed"
+
+# Some installers will fail because of an install order based on
+# rdeps.  E.g. ovs-pki calls sed in the postinstall.  sed may be
+# queued for install later.
+RDEPENDS_${PN} += "sed gawk grep"
+
+S = "${WORKDIR}/git"
+PV = "2.3.90+${SRCREV}"
+
+FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
+
+SRCREV = "1667bb34988358aaf1c92d0d21fad4b1c8698780"
+SRC_URI = "git://github.com/openvswitch/ovs.git;protocol=git \
+	file://openvswitch-switch \
+	file://openvswitch-switch-setup \
+	file://openvswitch-controller \
+	file://openvswitch-controller-setup \
+	file://openvswitch-add-target-python-handling.patch \
+	file://openvswitch-add-more-target-python-substitutions.patch \
+	file://openvswitch-add-ptest-${SRCREV}.patch \
+	file://run-ptest \
+	file://disable_m4_check.patch \
+	file://kernel_module.patch \
+	file://non_reproducible_builds_cleanup.patch \
+	"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=5973c953e3c8a767cf0808ff8a0bac1b"
+
+PACKAGECONFIG ?= "dpdk"
+PACKAGECONFIG[dpdk] = "--with-dpdk=${STAGING_DIR_TARGET}/opt/dpdk/${TARGET_ARCH}-native-linuxapp-gcc,,dpdk,"
+
+# Don't compile kernel modules by default since it heavily depends on
+# kernel version. Use the in-kernel module for now.
+# distro layers can enable with EXTRA_OECONF_pn_openvswitch += ""
+EXTRA_OECONF = "--with-linux=${STAGING_KERNEL_DIR} KARCH=${TARGET_ARCH}"
+
+EXTRA_OECONF += "TARGET_PYTHON=${bindir}/python \
+                 TARGET_PERL=${bindir}/perl \
+                "
+
+ALLOW_EMPTY_${PN}-pki = "1"
+PACKAGES =+ "${PN}-controller ${PN}-switch ${PN}-brcompat ${PN}-pki"
+
+FILES_${PN}-controller = "${sysconfdir}/init.d/openvswitch-controller \
+	${sysconfdir}/default/openvswitch-controller \
+	${sysconfdir}/openvswitch-controller \
+	${bindir}/ovs-controller"
+
+FILES_${PN}-brcompat = "${sbindir}/ovs-brcompatd"
+
+FILES_${PN}-switch = "${sysconfdir}/init.d/openvswitch-switch \
+		   ${sysconfdir}/default/openvswitch-switch \
+		   "
+# silence a warning
+FILES_${PN} += "${datadir}/ovsdbmonitor"
+FILES_${PN} += "/run"
+FILES_${PN} += "/lib/modules"
+
+inherit autotools update-rc.d ptest
+
+EXTRA_OEMAKE += "TEST_DEST=${D}${PTEST_PATH} TEST_ROOT=${PTEST_PATH}"
+
+do_install_ptest() {
+	oe_runmake test-install
+}
+
+INITSCRIPT_PACKAGES = "${PN}-switch ${PN}-controller"
+INITSCRIPT_NAME_${PN}-switch = "openvswitch-switch"
+INITSCRIPT_PARAMS_${PN}-switch = "defaults 71"
+
+INITSCRIPT_NAME_${PN}-controller = "openvswitch-controller"
+INITSCRIPT_PARAMS_${PN}-controller = "defaults 72"
+
+do_install_append() {
+	install -d ${D}/${sysconfdir}/default/
+	install -m 660 ${WORKDIR}/openvswitch-switch-setup ${D}/${sysconfdir}/default/openvswitch-switch
+	install -d ${D}/${sysconfdir}/openvswitch-controller
+	install -m 660 ${WORKDIR}/openvswitch-controller-setup ${D}/${sysconfdir}/default/openvswitch-controller
+
+	install -d ${D}/${sysconfdir}/init.d/
+	install -m 755 ${WORKDIR}/openvswitch-controller ${D}/${sysconfdir}/init.d/openvswitch-controller
+	install -m 755 ${WORKDIR}/openvswitch-switch ${D}/${sysconfdir}/init.d/openvswitch-switch
+	true || rm -fr ${D}/${datadir}/${PN}/pki
+
+	install -d ${D}/${sysconfdir}/init.d/
+
+	oe_runmake modules_install INSTALL_MOD_PATH=${D}
+}
+
+pkg_postinst_${PN}-pki () {
+	# can't do this offline
+	if [ "x$D" != "x" ]; then
+		exit 1
+	fi
+	if test ! -d $D/${datadir}/${PN}/pki; then
+		ovs-pki init --dir=$D/${datadir}/${PN}/pki
+	fi
+}
+
+pkg_postinst_${PN}-controller () {
+	# can't do this offline
+	if [ "x$D" != "x" ]; then
+		exit 1
+	fi
+
+	if test ! -d $D/${datadir}/${PN}/pki; then
+		ovs-pki init --dir=$D/${datadir}/${PN}/pki
+	fi
+
+	cd $D/${sysconfdir}/openvswitch-controller
+	if ! test -e cacert.pem; then
+		ln -s $D/${datadir}/${PN}/pki/switchca/cacert.pem cacert.pem
+	fi
+	if ! test -e privkey.pem || ! test -e cert.pem; then
+		oldumask=$(umask)
+		umask 077
+		ovs-pki req+sign --dir=$D/${datadir}/${PN}/pki tmp controller >/dev/null
+		mv tmp-privkey.pem privkey.pem
+		mv tmp-cert.pem cert.pem
+		mv tmp-req.pem req.pem
+		chmod go+r cert.pem req.pem
+		umask $oldumask
+	fi
+}
-- 
2.1.4


