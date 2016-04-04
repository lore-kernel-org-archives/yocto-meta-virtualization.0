Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 96C95E00B6F; Sun,  3 Apr 2016 19:24:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E264EE00A9C
	for <meta-virtualization@yoctoproject.org>;
	Sun,  3 Apr 2016 19:24:50 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u342OmJc026579
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sun, 3 Apr 2016 19:24:49 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 3 Apr 2016 19:24:47 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <paul.gortmaker@windriver.com>
Date: Sun, 3 Apr 2016 22:24:47 -0400
Message-ID: <1459736687-21379-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] lxc: uprev to latest stable 1.1.4 -> 1.1.5
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
X-List-Received-Date: Mon, 04 Apr 2016 02:24:52 -0000
Content-Type: text/plain

This is the latest stable release and includes many important bug
fixes as well as CVE fixes such as CVE-2015-1335.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-containers/lxc/lxc_1.1.4.bb | 179 ------------------------------------
 recipes-containers/lxc/lxc_1.1.5.bb | 179 ++++++++++++++++++++++++++++++++++++
 2 files changed, 179 insertions(+), 179 deletions(-)
 delete mode 100644 recipes-containers/lxc/lxc_1.1.4.bb
 create mode 100644 recipes-containers/lxc/lxc_1.1.5.bb

diff --git a/recipes-containers/lxc/lxc_1.1.4.bb b/recipes-containers/lxc/lxc_1.1.4.bb
deleted file mode 100644
index fe7eb34..0000000
--- a/recipes-containers/lxc/lxc_1.1.4.bb
+++ /dev/null
@@ -1,179 +0,0 @@
-DESCRIPTION = "lxc aims to use these new functionnalities to provide an userspace container object"
-SECTION = "console/utils"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-PRIORITY = "optional"
-DEPENDS = "libxml2 libcap"
-RDEPENDS_${PN} = " \
-		rsync \
-		gzip \
-		libcap-bin \
-		bridge-utils \
-		dnsmasq \
-		perl-module-strict \
-		perl-module-getopt-long \
-		perl-module-vars \
-		perl-module-warnings-register \
-		perl-module-exporter \
-		perl-module-constant \
-		perl-module-overload \
-		perl-module-exporter-heavy \
-"
-RDEPENDS_${PN}-ptest += "file make"
-
-SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
-	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
-	file://runtest.patch \
-	file://run-ptest \
-	file://automake-ensure-VPATH-builds-correctly.patch \
-	file://add-lxc.rebootsignal.patch \
-	file://document-lxc.rebootsignal.patch \
-	file://lxc-busybox-use-lxc.rebootsignal-SIGTERM.patch \
-	file://lxc-fix-B-S.patch \
-	file://lxc-busybox-add-OpenSSH-support.patch \
-	file://make-some-OpenSSH-tools-optional.patch \
-	file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
-	file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
-	file://open_without_symlink-Account-when-prefix-is-empty-st.patch \
-	file://lxc_setup_fs-Create-dev-shm-folder-if-it-doesn-t-exi.patch \
-	file://mount_proc_if_needed-only-safe-mount-when-rootfs-is-.patch \
-	file://open_without_symlink-Don-t-SYSERROR-on-something-els.patch \
-	file://lxc-busybox-Touch-etc-fstab-in-the-container-rootfs.patch \
-	file://lxc-busybox-Remove-warning-for-dynamically-linked-Bu.patch \
-	"
-
-SRC_URI[md5sum] = "d33c4bd9c57755c0e2b0e2acbc3f171d"
-SRC_URI[sha256sum] = "8f072ea2001bc94389003d82a91902855edf16b609e06f0486a74e4b8973e5dc"
-
-S = "${WORKDIR}/${BPN}-${PV}"
-
-# Let's not configure for the host distro.
-#
-PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-tests', '', d)}"
-EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
-
-EXTRA_OECONF += "--with-init-script=\
-${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit,', '', d)}\
-${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
-
-EXTRA_OECONF += "--enable-log-src-basename"
-
-PACKAGECONFIG ??= "templates \
-    ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
-"
-PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc --disable-api-docs,,"
-PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
-PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
-PACKAGECONFIG[templates] = ",,, ${PN}-templates"
-PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
-PACKAGECONFIG[seccomp] ="--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
-PACKAGECONFIG[python] = "--enable-python,--disable-python,python3,python3-core"
-
-# required by python3 to run setup.py
-export BUILD_SYS
-export HOST_SYS
-export STAGING_INCDIR
-export STAGING_LIBDIR
-
-inherit autotools pkgconfig ptest update-rc.d systemd
-
-SYSTEMD_PACKAGES = "${PN}-setup"
-SYSTEMD_SERVICE_${PN}-setup = "lxc.service"
-SYSTEMD_AUTO_ENABLE_${PN}-setup = "disable"
-
-INITSCRIPT_PACKAGES = "${PN}-setup"
-INITSCRIPT_NAME_{PN}-setup = "lxc"
-INITSCRIPT_PARAMS_${PN}-setup = "${OS_DEFAULT_INITSCRIPT_PARAMS}"
-
-FILES_${PN}-doc = "${mandir} ${infodir}"
-# For LXC the docdir only contains example configuration files and should be included in the lxc package
-FILES_${PN} += "${docdir}"
-FILES_${PN} += "${libdir}/python3*"
-FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
-PACKAGES =+ "${PN}-templates ${PN}-setup ${PN}-networking"
-FILES_${PN}-templates += "${datadir}/lxc/templates"
-RDEPENDS_${PN}-templates += "bash"
-
-ALLOW_EMPTY_${PN}-networking = "1"
-
-FILES_${PN}-setup += "/etc/tmpfiles.d"
-FILES_${PN}-setup += "/lib/systemd/system"
-FILES_${PN}-setup += "/usr/lib/systemd/system"
-FILES_${PN}-setup += "/etc/init.d"
-
-PRIVATE_LIBS_${PN}-ptest = "liblxc.so.1"
-
-CACHED_CONFIGUREVARS += " \
-    ac_cv_path_PYTHON='${STAGING_BINDIR_NATIVE}/python3-native/python3' \
-    am_cv_python_pyexecdir='${exec_prefix}/${libdir}/python3.5/site-packages' \
-    am_cv_python_pythondir='${prefix}/${libdir}/python3.5/site-packages' \
-"
-
-do_install_append() {
-	# The /var/cache/lxc directory created by the Makefile
-	# is wiped out in volatile, we need to create this at boot.
-	rm -rf ${D}${localstatedir}/cache
-	install -d ${D}${sysconfdir}/default/volatiles
-	echo "d root root 0755 ${localstatedir}/cache/lxc none" \
-	     > ${D}${sysconfdir}/default/volatiles/99_lxc
-
-	for i in `grep -l "#! */bin/bash" ${D}${datadir}/lxc/hooks/*`; do \
-	    sed -e 's|#! */bin/bash|#!/bin/sh|' -i $i; done
-
-	if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-	    install -d ${D}${sysconfdir}/init.d
-	    install -m 755 config/init/sysvinit/lxc* ${D}${sysconfdir}/init.d
-	fi
-
-	# since python3-native is used for install location this will not be
-	# suitable for the target and we will have to correct the package install
-	if ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
-	    if [ -d ${D}${exec_prefix}/lib/python* ]; then mv ${D}${exec_prefix}/lib/python* ${D}${libdir}/; fi
-	    rmdir --ignore-fail-on-non-empty ${D}${exec_prefix}/lib
-	fi
-}
-
-EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
-
-do_install_ptest() {
-	oe_runmake -C src/tests install-ptest
-}
-
-pkg_postinst_${PN}() {
-	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
-		/etc/init.d/populate-volatile.sh update
-	fi
-}
-
-pkg_postinst_${PN}-networking() {
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-
-	# setup for our bridge
-        echo "lxc.network.link=lxcbr0" >> ${sysconfdir}/lxc/default.conf
-
-cat >> /etc/network/interfaces << EOF
-
-auto lxcbr0
-iface lxcbr0 inet dhcp
-	bridge_ports eth0
-	bridge_fd 0
-	bridge_maxwait 0
-EOF
-
-cat<<EOF>/etc/network/if-pre-up.d/lxcbr0
-#! /bin/sh
-
-if test "x\$IFACE" = xlxcbr0 ; then
-        brctl show |grep lxcbr0 > /dev/null 2>/dev/null
-        if [ \$? != 0 ] ; then
-                brctl addbr lxcbr0
-                brctl addif lxcbr0 eth0
-                ip addr flush eth0
-                ifconfig eth0 up
-        fi
-fi
-EOF
-chmod 755 /etc/network/if-pre-up.d/lxcbr0
-}
diff --git a/recipes-containers/lxc/lxc_1.1.5.bb b/recipes-containers/lxc/lxc_1.1.5.bb
new file mode 100644
index 0000000..0f6d0b8
--- /dev/null
+++ b/recipes-containers/lxc/lxc_1.1.5.bb
@@ -0,0 +1,179 @@
+DESCRIPTION = "lxc aims to use these new functionnalities to provide an userspace container object"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+PRIORITY = "optional"
+DEPENDS = "libxml2 libcap"
+RDEPENDS_${PN} = " \
+		rsync \
+		gzip \
+		libcap-bin \
+		bridge-utils \
+		dnsmasq \
+		perl-module-strict \
+		perl-module-getopt-long \
+		perl-module-vars \
+		perl-module-warnings-register \
+		perl-module-exporter \
+		perl-module-constant \
+		perl-module-overload \
+		perl-module-exporter-heavy \
+"
+RDEPENDS_${PN}-ptest += "file make"
+
+SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
+	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
+	file://runtest.patch \
+	file://run-ptest \
+	file://automake-ensure-VPATH-builds-correctly.patch \
+	file://add-lxc.rebootsignal.patch \
+	file://document-lxc.rebootsignal.patch \
+	file://lxc-busybox-use-lxc.rebootsignal-SIGTERM.patch \
+	file://lxc-fix-B-S.patch \
+	file://lxc-busybox-add-OpenSSH-support.patch \
+	file://make-some-OpenSSH-tools-optional.patch \
+	file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
+	file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
+	file://open_without_symlink-Account-when-prefix-is-empty-st.patch \
+	file://lxc_setup_fs-Create-dev-shm-folder-if-it-doesn-t-exi.patch \
+	file://mount_proc_if_needed-only-safe-mount-when-rootfs-is-.patch \
+	file://open_without_symlink-Don-t-SYSERROR-on-something-els.patch \
+	file://lxc-busybox-Touch-etc-fstab-in-the-container-rootfs.patch \
+	file://lxc-busybox-Remove-warning-for-dynamically-linked-Bu.patch \
+	"
+
+SRC_URI[md5sum] = "dd9684dde0a58ed13f4f49c855b79a1a"
+SRC_URI[sha256sum] = "9588ad1b04e114ee7370f690c65131e28098b28d2521d97c73557d11897ed0be"
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+# Let's not configure for the host distro.
+#
+PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-tests', '', d)}"
+EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
+
+EXTRA_OECONF += "--with-init-script=\
+${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit,', '', d)}\
+${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+
+EXTRA_OECONF += "--enable-log-src-basename"
+
+PACKAGECONFIG ??= "templates \
+    ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+"
+PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc --disable-api-docs,,"
+PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
+PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
+PACKAGECONFIG[templates] = ",,, ${PN}-templates"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
+PACKAGECONFIG[seccomp] ="--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
+PACKAGECONFIG[python] = "--enable-python,--disable-python,python3,python3-core"
+
+# required by python3 to run setup.py
+export BUILD_SYS
+export HOST_SYS
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+inherit autotools pkgconfig ptest update-rc.d systemd
+
+SYSTEMD_PACKAGES = "${PN}-setup"
+SYSTEMD_SERVICE_${PN}-setup = "lxc.service"
+SYSTEMD_AUTO_ENABLE_${PN}-setup = "disable"
+
+INITSCRIPT_PACKAGES = "${PN}-setup"
+INITSCRIPT_NAME_{PN}-setup = "lxc"
+INITSCRIPT_PARAMS_${PN}-setup = "${OS_DEFAULT_INITSCRIPT_PARAMS}"
+
+FILES_${PN}-doc = "${mandir} ${infodir}"
+# For LXC the docdir only contains example configuration files and should be included in the lxc package
+FILES_${PN} += "${docdir}"
+FILES_${PN} += "${libdir}/python3*"
+FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
+PACKAGES =+ "${PN}-templates ${PN}-setup ${PN}-networking"
+FILES_${PN}-templates += "${datadir}/lxc/templates"
+RDEPENDS_${PN}-templates += "bash"
+
+ALLOW_EMPTY_${PN}-networking = "1"
+
+FILES_${PN}-setup += "/etc/tmpfiles.d"
+FILES_${PN}-setup += "/lib/systemd/system"
+FILES_${PN}-setup += "/usr/lib/systemd/system"
+FILES_${PN}-setup += "/etc/init.d"
+
+PRIVATE_LIBS_${PN}-ptest = "liblxc.so.1"
+
+CACHED_CONFIGUREVARS += " \
+    ac_cv_path_PYTHON='${STAGING_BINDIR_NATIVE}/python3-native/python3' \
+    am_cv_python_pyexecdir='${exec_prefix}/${libdir}/python3.5/site-packages' \
+    am_cv_python_pythondir='${prefix}/${libdir}/python3.5/site-packages' \
+"
+
+do_install_append() {
+	# The /var/cache/lxc directory created by the Makefile
+	# is wiped out in volatile, we need to create this at boot.
+	rm -rf ${D}${localstatedir}/cache
+	install -d ${D}${sysconfdir}/default/volatiles
+	echo "d root root 0755 ${localstatedir}/cache/lxc none" \
+	     > ${D}${sysconfdir}/default/volatiles/99_lxc
+
+	for i in `grep -l "#! */bin/bash" ${D}${datadir}/lxc/hooks/*`; do \
+	    sed -e 's|#! */bin/bash|#!/bin/sh|' -i $i; done
+
+	if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+	    install -d ${D}${sysconfdir}/init.d
+	    install -m 755 config/init/sysvinit/lxc* ${D}${sysconfdir}/init.d
+	fi
+
+	# since python3-native is used for install location this will not be
+	# suitable for the target and we will have to correct the package install
+	if ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
+	    if [ -d ${D}${exec_prefix}/lib/python* ]; then mv ${D}${exec_prefix}/lib/python* ${D}${libdir}/; fi
+	    rmdir --ignore-fail-on-non-empty ${D}${exec_prefix}/lib
+	fi
+}
+
+EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
+
+do_install_ptest() {
+	oe_runmake -C src/tests install-ptest
+}
+
+pkg_postinst_${PN}() {
+	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
+		/etc/init.d/populate-volatile.sh update
+	fi
+}
+
+pkg_postinst_${PN}-networking() {
+	if [ "x$D" != "x" ]; then
+		exit 1
+	fi
+
+	# setup for our bridge
+        echo "lxc.network.link=lxcbr0" >> ${sysconfdir}/lxc/default.conf
+
+cat >> /etc/network/interfaces << EOF
+
+auto lxcbr0
+iface lxcbr0 inet dhcp
+	bridge_ports eth0
+	bridge_fd 0
+	bridge_maxwait 0
+EOF
+
+cat<<EOF>/etc/network/if-pre-up.d/lxcbr0
+#! /bin/sh
+
+if test "x\$IFACE" = xlxcbr0 ; then
+        brctl show |grep lxcbr0 > /dev/null 2>/dev/null
+        if [ \$? != 0 ] ; then
+                brctl addbr lxcbr0
+                brctl addif lxcbr0 eth0
+                ip addr flush eth0
+                ifconfig eth0 up
+        fi
+fi
+EOF
+chmod 755 /etc/network/if-pre-up.d/lxcbr0
+}
-- 
2.1.4


