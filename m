Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A1E95E00874; Tue,  2 Dec 2014 19:34:14 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3C02E00521
	for <meta-virtualization@yoctoproject.org>;
	Tue,  2 Dec 2014 19:34:04 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB33Y1UI012544
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 2 Dec 2014 19:34:02 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 2 Dec 2014 19:34:01 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@gmail.com>
Date: Tue, 2 Dec 2014 22:33:31 -0500
Message-ID: <1417577611-13242-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-Originating-IP: [128.224.56.18]
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] openvswitch: uprev to latest stable update - v2.1.3
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
X-List-Received-Date: Wed, 03 Dec 2014 03:34:14 -0000
Content-Type: text/plain

v2.1.3 is listed upstream as "contains only bug fixes for the 2.1.2
release". The only update to the recipe is updated checksums.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

Bruce,

I notice that upstream has released v2.3.0 as well. I will look to
creating a recipe for that shortly so folks can have it available to
try out while we continue to make this v2.1.x release stream
available.

Mark


 .../openvswitch/openvswitch_2.1.2.bb               | 130 ---------------------
 .../openvswitch/openvswitch_2.1.3.bb               | 130 +++++++++++++++++++++
 2 files changed, 130 insertions(+), 130 deletions(-)
 delete mode 100644 recipes-networking/openvswitch/openvswitch_2.1.2.bb
 create mode 100644 recipes-networking/openvswitch/openvswitch_2.1.3.bb

diff --git a/recipes-networking/openvswitch/openvswitch_2.1.2.bb b/recipes-networking/openvswitch/openvswitch_2.1.2.bb
deleted file mode 100644
index 3f092af..0000000
--- a/recipes-networking/openvswitch/openvswitch_2.1.2.bb
+++ /dev/null
@@ -1,130 +0,0 @@
-SUMMARY = "OpenvSwitch"
-DESCRIPTION = "Open vSwitch is a production quality, multilayer virtual switch licensed under the open source Apache 2.0 license. It is designed to enable massive network automation through programmatic extension, while still supporting standard management interfaces and protocols (e.g. NetFlow, sFlow, SPAN, RSPAN, CLI, LACP, 802.1ag)"
-HOMEPAGE = "http://openvswitch.org/"
-SECTION = "networking"
-LICENSE = "Apache-2"
-
-DEPENDS += "bridge-utils openssl python perl"
-
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
-
-SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
-	file://openvswitch-switch \
-	file://openvswitch-switch-setup \
-	file://openvswitch-controller \
-	file://openvswitch-controller-setup \
-	file://openvswitch-add-target-python-handling.patch \
-	file://openvswitch-add-target-perl-handling.patch \
-	file://openvswitch-add-more-target-python-substitutions.patch \
-	file://openvswitch-add-ptest.patch \
-	file://run-ptest \
-	"
-
-SRC_URI[md5sum] = "430ff6d1e1fc81e9c5ebc2e641cfc953"
-SRC_URI[sha256sum] = "875429b052c4001815b6cb38616c7a6cb212df4bba74602164ee0a99b172079b"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=e03b0d9c4115c44518594e5618e653f8"
-
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
-
-EXTRA_OEMAKE += "TEST_DEST=${D}${PTEST_PATH} TEST_ROOT=${PTEST_PATH}"
-
-do_install_ptest() {
-	oe_runmake test-install
-}
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
diff --git a/recipes-networking/openvswitch/openvswitch_2.1.3.bb b/recipes-networking/openvswitch/openvswitch_2.1.3.bb
new file mode 100644
index 0000000..c3a29aa
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch_2.1.3.bb
@@ -0,0 +1,130 @@
+SUMMARY = "OpenvSwitch"
+DESCRIPTION = "Open vSwitch is a production quality, multilayer virtual switch licensed under the open source Apache 2.0 license. It is designed to enable massive network automation through programmatic extension, while still supporting standard management interfaces and protocols (e.g. NetFlow, sFlow, SPAN, RSPAN, CLI, LACP, 802.1ag)"
+HOMEPAGE = "http://openvswitch.org/"
+SECTION = "networking"
+LICENSE = "Apache-2"
+
+DEPENDS += "bridge-utils openssl python perl"
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
+SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
+	file://openvswitch-switch \
+	file://openvswitch-switch-setup \
+	file://openvswitch-controller \
+	file://openvswitch-controller-setup \
+	file://openvswitch-add-target-python-handling.patch \
+	file://openvswitch-add-target-perl-handling.patch \
+	file://openvswitch-add-more-target-python-substitutions.patch \
+	file://openvswitch-add-ptest.patch \
+	file://run-ptest \
+	"
+
+SRC_URI[md5sum] = "d3c8a69df3d1b1a9eaef5a896576fd2a"
+SRC_URI[sha256sum] = "43a2562fe5e8e48e997bfdb04691ffaaaefe73069b5699654538bf2f16ebfb1a"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=e03b0d9c4115c44518594e5618e653f8"
+
+# Don't compile kernel modules by default since it heavily depends on
+# kernel version. Use the in-kernel module for now.
+# distro layers can enable with EXTRA_OECONF_pn_openvswitch += ""
+# EXTRA_OECONF = "--with-linux=${STAGING_KERNEL_DIR} KARCH=${TARGET_ARCH}"
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
1.8.3.2


