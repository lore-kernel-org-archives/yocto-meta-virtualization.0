Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 31280E0086F; Fri, 30 Jan 2015 09:36:34 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC284E002F9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Jan 2015 09:36:32 -0800 (PST)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0UHaVe0014066
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Jan 2015 09:36:32 -0800 (PST)
Received: from afong by yow-dellw-af with local (Exim 4.84)
	(envelope-from <amy.fong@windriver.com>) id 1YHFUT-0002Qi-Lc
	for meta-virtualization@yoctoproject.org;
	Fri, 30 Jan 2015 12:36:21 -0500
Date: Fri, 30 Jan 2015 12:36:21 -0500
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org
Message-ID: <20150130173621.GB9299@windriver.com>
References: <20150130173537.GA9113@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20150130173537.GA9113@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH 2/2] openvswitch restructure recipes
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
X-List-Received-Date: Fri, 30 Jan 2015 17:36:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From fba310bc395a45747d5f40daf6784ea52820ffe0 Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Thu, 29 Jan 2015 13:28:08 -0500
Subject: [PATCH 2/2] openvswitch restructure recipes

Add openvswitch.inc, removing common parts out of openvswitch*.bb

Signed-off-by: Amy Fong <amy.fong@windriver.com>

cleanup

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 recipes-networking/openvswitch/openvswitch.inc     | 127 +++++++++++++++++++++
 .../openvswitch/openvswitch_1.10.0.bb              | 110 +-----------------
 .../openvswitch/openvswitch_2.1.3.bb               | 119 ++-----------------
 recipes-networking/openvswitch/openvswitch_git.bb  | 115 ++-----------------
 4 files changed, 151 insertions(+), 320 deletions(-)
 create mode 100644 recipes-networking/openvswitch/openvswitch.inc

diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
new file mode 100644
index 0000000..ed97920
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch.inc
@@ -0,0 +1,127 @@
+SUMMARY = "OpenvSwitch"
+DESCRIPTION = "\
+	Open vSwitch is a production quality, multilayer virtual switch \
+	licensed under the open source Apache 2.0 license. It is designed \
+	to enable massive network automation through programmatic extension, \
+	while still supporting standard management interfaces and protocols \
+	(e.g. NetFlow, sFlow, SPAN, RSPAN, CLI, LACP, 802.1ag) \
+	"
+
+HOMEPAGE = "http://openvswitch.org/"
+SECTION = "networking"
+LICENSE = "Apache-2"
+
+DEPENDS += "bridge-utils openssl python perl"
+
+RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid coreutils \
+	python perl perl-module-strict ${PN}-switch ${PN}-controller"
+RDEPENDS_${PN}-controller = "${PN} lsb ${PN}-pki"
+RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
+RDEPENDS_${PN}-pki = "${PN}"
+RDEPENDS_${PN}-brcompat = "${PN} ${PN}-switch"
+
+# Some installers will fail because of an install order based on
+# rdeps.  E.g. ovs-pki calls sed in the postinstall.  sed may be
+# queued for install later.
+RDEPENDS_${PN} += "sed gawk grep"
+
+SRC_URI = "\
+	file://openvswitch-switch \
+	file://openvswitch-switch-setup \
+	file://openvswitch-controller \
+	file://openvswitch-controller-setup \
+	file://openvswitch-add-target-python-handling.patch \
+	file://openvswitch-add-target-perl-handling.patch \
+	"
+
+EXTRA_OECONF += "\
+	TARGET_PYTHON=${bindir}/python \
+	TARGET_PERL=${bindir}/perl \
+	"
+
+# Don't compile kernel modules by default since it heavily depends on
+# kernel version. Use the in-kernel module for now.
+# distro layers can enable with EXTRA_OECONF_pn_openvswitch += ""
+# EXTRA_OECONF = "--with-linux=${STAGING_KERNEL_DIR} KARCH=${TARGET_ARCH}"
+
+ALLOW_EMPTY_${PN}-pki = "1"
+PACKAGES =+ "${PN}-controller ${PN}-switch ${PN}-brcompat ${PN}-pki"
+
+FILES_${PN}-controller = "\
+	${sysconfdir}/init.d/openvswitch-controller \
+	${sysconfdir}/default/openvswitch-controller \
+	${sysconfdir}/openvswitch-controller \
+	${bindir}/ovs-controller \
+	"
+
+FILES_${PN}-brcompat = "${sbindir}/ovs-brcompatd"
+
+FILES_${PN}-switch = "\
+	${sysconfdir}/init.d/openvswitch-switch \
+	${sysconfdir}/default/openvswitch-switch \
+	"
+
+# silence a warning
+FILES_${PN} += "${datadir}/ovsdbmonitor"
+FILES_${PN} += "/run"
+
+inherit autotools update-rc.d
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
diff --git a/recipes-networking/openvswitch/openvswitch_1.10.0.bb b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
index 42d4bc4..85b2709 100644
--- a/recipes-networking/openvswitch/openvswitch_1.10.0.bb
+++ b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
@@ -1,32 +1,11 @@
-SUMMARY = "OpenvSwitch"
-DESCRIPTION = "Open vSwitch is a production quality, multilayer virtual switch licensed under the open source Apache 2.0 license. It is designed to enable massive network automation through programmatic extension, while still supporting standard management interfaces and protocols (e.g. NetFlow, sFlow, SPAN, RSPAN, CLI, LACP, 802.1ag)"
-HOMEPAGE = "http://openvswitch.org/"
-SECTION = "networking"
-LICENSE = "Apache-2"
+require openvswitch.inc
 
-DEPENDS += "bridge-utils openssl python perl"
-
-RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid coreutils \
-	       python perl perl-module-strict ${PN}-switch ${PN}-controller"
-RDEPENDS_${PN}-controller = "${PN} lsb ${PN}-pki"
-RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
-RDEPENDS_${PN}-pki = "${PN}"
-RDEPENDS_${PN}-brcompat = "${PN} ${PN}-switch"
 RRECOMMENDS_${PN} += "kernel-module-openvswitch"
 
-# Some installers will fail because of an install order based on
-# rdeps.  E.g. ovs-pki calls sed in the postinstall.  sed may be
-# queued for install later.
-RDEPENDS_${PN} += "sed gawk grep"
 PR = "r4"
 
-SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
-	file://openvswitch-switch \
-	file://openvswitch-switch-setup \
-	file://openvswitch-controller \
-	file://openvswitch-controller-setup \
-	file://openvswitch-add-target-python-handling.patch \
-	file://openvswitch-add-target-perl-handling.patch \
+SRC_URI += "\
+	http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
 	file://configure-Only-link-against-libpcap-on-FreeBSD.patch \
 	"
 
@@ -34,85 +13,4 @@ SRC_URI[md5sum] = "fe8b49efe9f86b57abab00166b971106"
 SRC_URI[sha256sum] = "803966c89d6a5de6d710a2cb4ed73ac8d8111a2c44b12b846dcef8e91ffab167"
 LIC_FILES_CHKSUM = "file://COPYING;md5=49eeb5acb1f5e510f12c44f176c42253"
 
-# Don't compile kernel modules by default since it heavily depends on
-# kernel version. Use the in-kernel module for now.
-# distro layers can enable with EXTRA_OECONF_pn_openvswitch += ""
-# EXTRA_OECONF = "--with-linux=${STAGING_KERNEL_DIR} KARCH=${TARGET_ARCH}"
-
-EXTRA_OECONF += "TARGET_PYTHON=${bindir}/python \
-                 TARGET_PERL=${bindir}/perl \
-                "
-
-ALLOW_EMPTY_${PN}-pki = "1"
-PACKAGES =+ "${PN}-controller ${PN}-switch ${PN}-brcompat ${PN}-pki"
-
-FILES_${PN}-controller = "${sysconfdir}/init.d/openvswitch-controller \
-	${sysconfdir}/default/openvswitch-controller \
-	${sysconfdir}/openvswitch-controller \
-	${bindir}/ovs-controller"
-
-FILES_${PN}-brcompat = "${sbindir}/ovs-brcompatd"
-
-FILES_${PN}-switch = "${sysconfdir}/init.d/openvswitch-switch \
-		   ${sysconfdir}/default/openvswitch-switch \
-		   "
-# silence a warning
-FILES_${PN} += "${datadir}/ovsdbmonitor"
-FILES_${PN} += "/run"
-
-inherit autotools update-rc.d pkgconfig
-
-INITSCRIPT_PACKAGES = "${PN}-switch ${PN}-controller"
-INITSCRIPT_NAME_${PN}-switch = "openvswitch-switch"
-INITSCRIPT_PARAMS_${PN}-switch = "defaults 71"
-
-INITSCRIPT_NAME_${PN}-controller = "openvswitch-controller"
-INITSCRIPT_PARAMS_${PN}-controller = "defaults 72"
-
-do_install_append() {
-	install -d ${D}/${sysconfdir}/default/
-	install -m 660 ${WORKDIR}/openvswitch-switch-setup ${D}/${sysconfdir}/default/openvswitch-switch
-	install -d ${D}/${sysconfdir}/openvswitch-controller
-	install -m 660 ${WORKDIR}/openvswitch-controller-setup ${D}/${sysconfdir}/default/openvswitch-controller
-
-	install -d ${D}/${sysconfdir}/init.d/
-	install -m 755 ${WORKDIR}/openvswitch-controller ${D}/${sysconfdir}/init.d/openvswitch-controller
-	install -m 755 ${WORKDIR}/openvswitch-switch ${D}/${sysconfdir}/init.d/openvswitch-switch
-	true || rm -fr ${D}/${datadir}/${PN}/pki
-}
-
-pkg_postinst_${PN}-pki () {
-	# can't do this offline
-        if [ "x$D" != "x" ]; then
-                exit 1
-        fi
-	if test ! -d $D/${datadir}/${PN}/pki; then
-            ovs-pki init --dir=$D/${datadir}/${PN}/pki
-        fi
-}
-
-pkg_postinst_${PN}-controller () {
-        # can't do this offline
-        if [ "x$D" != "x" ]; then
-                exit 1
-        fi
-
-    if test ! -d $D/${datadir}/${PN}/pki; then
-        ovs-pki init --dir=$D/${datadir}/${PN}/pki
-    fi
-
-	cd $D/${sysconfdir}/openvswitch-controller
-        if ! test -e cacert.pem; then
-            ln -s $D/${datadir}/${PN}/pki/switchca/cacert.pem cacert.pem
-        fi
-        if ! test -e privkey.pem || ! test -e cert.pem; then
-            oldumask=$(umask)
-            umask 077
-            ovs-pki req+sign --dir=$D/${datadir}/${PN}/pki tmp controller >/dev/null
-            mv tmp-privkey.pem privkey.pem
-            mv tmp-cert.pem cert.pem
-            mv tmp-req.pem req.pem
-            chmod go+r cert.pem req.pem
-            umask $oldumask
-        fi
-}
+inherit pkgconfig
diff --git a/recipes-networking/openvswitch/openvswitch_2.1.3.bb b/recipes-networking/openvswitch/openvswitch_2.1.3.bb
index c3a29aa..dc6c7e3 100644
--- a/recipes-networking/openvswitch/openvswitch_2.1.3.bb
+++ b/recipes-networking/openvswitch/openvswitch_2.1.3.bb
@@ -1,35 +1,15 @@
-SUMMARY = "OpenvSwitch"
-DESCRIPTION = "Open vSwitch is a production quality, multilayer virtual switch licensed under the open source Apache 2.0 license. It is designed to enable massive network automation through programmatic extension, while still supporting standard management interfaces and protocols (e.g. NetFlow, sFlow, SPAN, RSPAN, CLI, LACP, 802.1ag)"
-HOMEPAGE = "http://openvswitch.org/"
-SECTION = "networking"
-LICENSE = "Apache-2"
+require openvswitch.inc
 
-DEPENDS += "bridge-utils openssl python perl"
-
-RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid coreutils \
-	       python perl perl-module-strict ${PN}-switch ${PN}-controller"
-RDEPENDS_${PN}-controller = "${PN} lsb ${PN}-pki"
-RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
-RDEPENDS_${PN}-pki = "${PN}"
-RDEPENDS_${PN}-brcompat = "${PN} ${PN}-switch"
 RRECOMMENDS_${PN} += "kernel-module-openvswitch"
 
-RDEPENDS_${PN}-ptest += "python-logging python-syslog python-argparse python-io \
-                     python-fcntl python-shell python-lang python-xml python-math \
-                     python-datetime python-netclient python sed"
-
-# Some installers will fail because of an install order based on
-# rdeps.  E.g. ovs-pki calls sed in the postinstall.  sed may be
-# queued for install later.
-RDEPENDS_${PN} += "sed gawk grep"
+RDEPENDS_${PN}-ptest += "\
+	python-logging python-syslog python-argparse python-io \
+	python-fcntl python-shell python-lang python-xml python-math \
+	python-datetime python-netclient python sed \
+	"
 
-SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
-	file://openvswitch-switch \
-	file://openvswitch-switch-setup \
-	file://openvswitch-controller \
-	file://openvswitch-controller-setup \
-	file://openvswitch-add-target-python-handling.patch \
-	file://openvswitch-add-target-perl-handling.patch \
+SRC_URI += "\
+	http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
 	file://openvswitch-add-more-target-python-substitutions.patch \
 	file://openvswitch-add-ptest.patch \
 	file://run-ptest \
@@ -40,91 +20,10 @@ SRC_URI[sha256sum] = "43a2562fe5e8e48e997bfdb04691ffaaaefe73069b5699654538bf2f16
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e03b0d9c4115c44518594e5618e653f8"
 
-# Don't compile kernel modules by default since it heavily depends on
-# kernel version. Use the in-kernel module for now.
-# distro layers can enable with EXTRA_OECONF_pn_openvswitch += ""
-# EXTRA_OECONF = "--with-linux=${STAGING_KERNEL_DIR} KARCH=${TARGET_ARCH}"
-
-EXTRA_OECONF += "TARGET_PYTHON=${bindir}/python \
-                 TARGET_PERL=${bindir}/perl \
-                "
-
-ALLOW_EMPTY_${PN}-pki = "1"
-PACKAGES =+ "${PN}-controller ${PN}-switch ${PN}-brcompat ${PN}-pki"
-
-FILES_${PN}-controller = "${sysconfdir}/init.d/openvswitch-controller \
-	${sysconfdir}/default/openvswitch-controller \
-	${sysconfdir}/openvswitch-controller \
-	${bindir}/ovs-controller"
-
-FILES_${PN}-brcompat = "${sbindir}/ovs-brcompatd"
-
-FILES_${PN}-switch = "${sysconfdir}/init.d/openvswitch-switch \
-		   ${sysconfdir}/default/openvswitch-switch \
-		   "
-# silence a warning
-FILES_${PN} += "${datadir}/ovsdbmonitor"
-FILES_${PN} += "/run"
-
-inherit autotools update-rc.d ptest
+inherit ptest
 
 EXTRA_OEMAKE += "TEST_DEST=${D}${PTEST_PATH} TEST_ROOT=${PTEST_PATH}"
 
 do_install_ptest() {
 	oe_runmake test-install
 }
-
-INITSCRIPT_PACKAGES = "${PN}-switch ${PN}-controller"
-INITSCRIPT_NAME_${PN}-switch = "openvswitch-switch"
-INITSCRIPT_PARAMS_${PN}-switch = "defaults 71"
-
-INITSCRIPT_NAME_${PN}-controller = "openvswitch-controller"
-INITSCRIPT_PARAMS_${PN}-controller = "defaults 72"
-
-do_install_append() {
-	install -d ${D}/${sysconfdir}/default/
-	install -m 660 ${WORKDIR}/openvswitch-switch-setup ${D}/${sysconfdir}/default/openvswitch-switch
-	install -d ${D}/${sysconfdir}/openvswitch-controller
-	install -m 660 ${WORKDIR}/openvswitch-controller-setup ${D}/${sysconfdir}/default/openvswitch-controller
-
-	install -d ${D}/${sysconfdir}/init.d/
-	install -m 755 ${WORKDIR}/openvswitch-controller ${D}/${sysconfdir}/init.d/openvswitch-controller
-	install -m 755 ${WORKDIR}/openvswitch-switch ${D}/${sysconfdir}/init.d/openvswitch-switch
-	true || rm -fr ${D}/${datadir}/${PN}/pki
-}
-
-pkg_postinst_${PN}-pki () {
-	# can't do this offline
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-	if test ! -d $D/${datadir}/${PN}/pki; then
-		ovs-pki init --dir=$D/${datadir}/${PN}/pki
-	fi
-}
-
-pkg_postinst_${PN}-controller () {
-	# can't do this offline
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-
-	if test ! -d $D/${datadir}/${PN}/pki; then
-		ovs-pki init --dir=$D/${datadir}/${PN}/pki
-	fi
-
-	cd $D/${sysconfdir}/openvswitch-controller
-	if ! test -e cacert.pem; then
-		ln -s $D/${datadir}/${PN}/pki/switchca/cacert.pem cacert.pem
-	fi
-	if ! test -e privkey.pem || ! test -e cert.pem; then
-		oldumask=$(umask)
-		umask 077
-		ovs-pki req+sign --dir=$D/${datadir}/${PN}/pki tmp controller >/dev/null
-		mv tmp-privkey.pem privkey.pem
-		mv tmp-cert.pem cert.pem
-		mv tmp-req.pem req.pem
-		chmod go+r cert.pem req.pem
-		umask $oldumask
-	fi
-}
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 17bebae..5580915 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -1,27 +1,12 @@
-SUMMARY = "OpenvSwitch"
-DESCRIPTION = "Open vSwitch is a production quality, multilayer virtual switch licensed under the open source Apache 2.0 license. It is designed to enable massive network automation through programmatic extension, while still supporting standard management interfaces and protocols (e.g. NetFlow, sFlow, SPAN, RSPAN, CLI, LACP, 802.1ag)"
-HOMEPAGE = "http://openvswitch.org/"
-SECTION = "networking"
-LICENSE = "Apache-2 & GPLv2 & PSF"
+require openvswitch.inc
 
-DEPENDS += "bridge-utils openssl python perl virtual/kernel"
+DEPENDS += "virtual/kernel"
 
-RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid coreutils \
-	       python perl perl-module-strict ${PN}-switch ${PN}-controller"
-RDEPENDS_${PN}-controller = "${PN} lsb ${PN}-pki"
-RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
-RDEPENDS_${PN}-pki = "${PN}"
-RDEPENDS_${PN}-brcompat = "${PN} ${PN}-switch"
-RRECOMMENDS_${PN} += "kernel-module-openvswitch"
-
-RDEPENDS_${PN}-ptest += "python-logging python-syslog python-argparse python-io \
-                     python-fcntl python-shell python-lang python-xml python-math \
-                     python-datetime python-netclient python sed"
-
-# Some installers will fail because of an install order based on
-# rdeps.  E.g. ovs-pki calls sed in the postinstall.  sed may be
-# queued for install later.
-RDEPENDS_${PN} += "sed gawk grep"
+RDEPENDS_${PN}-ptest += "\
+	python-logging python-syslog python-argparse python-io \
+	python-fcntl python-shell python-lang python-xml python-math \
+	python-datetime python-netclient python sed \
+	"
 
 S = "${WORKDIR}/git"
 PV = "2.3.90+${SRCREV}"
@@ -29,12 +14,8 @@ PV = "2.3.90+${SRCREV}"
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
 
 SRCREV = "1667bb34988358aaf1c92d0d21fad4b1c8698780"
-SRC_URI = "git://github.com/openvswitch/ovs.git;protocol=git \
-	file://openvswitch-switch \
-	file://openvswitch-switch-setup \
-	file://openvswitch-controller \
-	file://openvswitch-controller-setup \
-	file://openvswitch-add-target-python-handling.patch \
+SRC_URI += "\
+	git://github.com/openvswitch/ovs.git;protocol=git \
 	file://openvswitch-add-more-target-python-substitutions.patch \
 	file://openvswitch-add-ptest-${SRCREV}.patch \
 	file://run-ptest \
@@ -51,31 +32,12 @@ PACKAGECONFIG[dpdk] = "--with-dpdk=${STAGING_DIR_TARGET}/opt/dpdk/${TARGET_ARCH}
 # Don't compile kernel modules by default since it heavily depends on
 # kernel version. Use the in-kernel module for now.
 # distro layers can enable with EXTRA_OECONF_pn_openvswitch += ""
-EXTRA_OECONF = "--with-linux=${STAGING_KERNEL_DIR} KARCH=${TARGET_ARCH}"
-
-EXTRA_OECONF += "TARGET_PYTHON=${bindir}/python \
-                 TARGET_PERL=${bindir}/perl \
-                "
-
-ALLOW_EMPTY_${PN}-pki = "1"
-PACKAGES =+ "${PN}-controller ${PN}-switch ${PN}-brcompat ${PN}-pki"
+EXTRA_OECONF += "--with-linux=${STAGING_KERNEL_DIR} KARCH=${TARGET_ARCH}"
 
-FILES_${PN}-controller = "${sysconfdir}/init.d/openvswitch-controller \
-	${sysconfdir}/default/openvswitch-controller \
-	${sysconfdir}/openvswitch-controller \
-	${bindir}/ovs-controller"
-
-FILES_${PN}-brcompat = "${sbindir}/ovs-brcompatd"
-
-FILES_${PN}-switch = "${sysconfdir}/init.d/openvswitch-switch \
-		   ${sysconfdir}/default/openvswitch-switch \
-		   "
 # silence a warning
-FILES_${PN} += "${datadir}/ovsdbmonitor"
-FILES_${PN} += "/run"
 FILES_${PN} += "/lib/modules"
 
-inherit autotools update-rc.d ptest
+inherit ptest
 
 EXTRA_OEMAKE += "TEST_DEST=${D}${PTEST_PATH} TEST_ROOT=${PTEST_PATH}"
 
@@ -83,61 +45,6 @@ do_install_ptest() {
 	oe_runmake test-install
 }
 
-INITSCRIPT_PACKAGES = "${PN}-switch ${PN}-controller"
-INITSCRIPT_NAME_${PN}-switch = "openvswitch-switch"
-INITSCRIPT_PARAMS_${PN}-switch = "defaults 71"
-
-INITSCRIPT_NAME_${PN}-controller = "openvswitch-controller"
-INITSCRIPT_PARAMS_${PN}-controller = "defaults 72"
-
 do_install_append() {
-	install -d ${D}/${sysconfdir}/default/
-	install -m 660 ${WORKDIR}/openvswitch-switch-setup ${D}/${sysconfdir}/default/openvswitch-switch
-	install -d ${D}/${sysconfdir}/openvswitch-controller
-	install -m 660 ${WORKDIR}/openvswitch-controller-setup ${D}/${sysconfdir}/default/openvswitch-controller
-
-	install -d ${D}/${sysconfdir}/init.d/
-	install -m 755 ${WORKDIR}/openvswitch-controller ${D}/${sysconfdir}/init.d/openvswitch-controller
-	install -m 755 ${WORKDIR}/openvswitch-switch ${D}/${sysconfdir}/init.d/openvswitch-switch
-	true || rm -fr ${D}/${datadir}/${PN}/pki
-
-	install -d ${D}/${sysconfdir}/init.d/
-
 	oe_runmake modules_install INSTALL_MOD_PATH=${D}
 }
-
-pkg_postinst_${PN}-pki () {
-	# can't do this offline
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-	if test ! -d $D/${datadir}/${PN}/pki; then
-		ovs-pki init --dir=$D/${datadir}/${PN}/pki
-	fi
-}
-
-pkg_postinst_${PN}-controller () {
-	# can't do this offline
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-
-	if test ! -d $D/${datadir}/${PN}/pki; then
-		ovs-pki init --dir=$D/${datadir}/${PN}/pki
-	fi
-
-	cd $D/${sysconfdir}/openvswitch-controller
-	if ! test -e cacert.pem; then
-		ln -s $D/${datadir}/${PN}/pki/switchca/cacert.pem cacert.pem
-	fi
-	if ! test -e privkey.pem || ! test -e cert.pem; then
-		oldumask=$(umask)
-		umask 077
-		ovs-pki req+sign --dir=$D/${datadir}/${PN}/pki tmp controller >/dev/null
-		mv tmp-privkey.pem privkey.pem
-		mv tmp-cert.pem cert.pem
-		mv tmp-req.pem req.pem
-		chmod go+r cert.pem req.pem
-		umask $oldumask
-	fi
-}
-- 
2.1.4


