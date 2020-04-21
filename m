Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.5392.1587460560762335832
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Apr 2020 02:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 03L9FxZO001855
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Apr 2020 02:16:00 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Tue, 21 Apr 2020 02:15:59 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] lxc: Upgrade to 4.0.2
Date: Tue, 21 Apr 2020 17:15:58 +0800
Message-ID: <1587460558-189310-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 recipes-containers/lxc/lxc_4.0.1.bb | 200 ------------------------------------
 recipes-containers/lxc/lxc_4.0.2.bb | 200 ++++++++++++++++++++++++++++++++++++
 2 files changed, 200 insertions(+), 200 deletions(-)
 delete mode 100644 recipes-containers/lxc/lxc_4.0.1.bb
 create mode 100644 recipes-containers/lxc/lxc_4.0.2.bb

diff --git a/recipes-containers/lxc/lxc_4.0.1.bb b/recipes-containers/lxc/lxc_4.0.1.bb
deleted file mode 100644
index bfe003c..0000000
--- a/recipes-containers/lxc/lxc_4.0.1.bb
+++ /dev/null
@@ -1,200 +0,0 @@
-DESCRIPTION = "lxc aims to use these new functionnalities to provide an userspace container object"
-SECTION = "console/utils"
-LICENSE = "LGPLv2.1 & GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
-                    file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
-"
-
-DEPENDS = "libxml2 libcap"
-RDEPENDS_${PN} = " \
-		rsync \
-		curl \
-		gzip \
-		xz \
-		tar \
-		libcap-bin \
-		bridge-utils \
-		dnsmasq \
-		perl-module-strict \
-		perl-module-getopt-long \
-		perl-module-vars \
-		perl-module-exporter \
-		perl-module-constant \
-		perl-module-overload \
-		perl-module-exporter-heavy \
-		gmp \
-		libidn \
-		gnutls \
-		nettle \
-		util-linux-mountpoint \
-		util-linux-getopt \
-"
-
-RDEPENDS_${PN}_append_libc-glibc = " glibc-utils"
-
-RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls bash libgcc"
-
-RDEPENDS_${PN}-networking += "iptables"
-
-SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
-	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
-	file://run-ptest \
-	file://lxc-fix-B-S.patch \
-	file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
-	file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
-	file://templates-actually-create-DOWNLOAD_TEMP-directory.patch \
-	file://template-make-busybox-template-compatible-with-core-.patch \
-	file://templates-use-curl-instead-of-wget.patch \
-	file://tests-our-init-is-not-busybox.patch \
-	file://tests-add-no-validate-when-using-download-template.patch \
-	file://dnsmasq.conf \
-	file://lxc-net \
-	"
-
-SRC_URI[md5sum] = "5f19f13eafdde24c75ba459fc6c28156"
-SRC_URI[sha256sum] = "70bbaac1df097f32ee5493a5e67a52365f7cdda28529f40197d6160bbec4139d"
-
-S = "${WORKDIR}/${BPN}-${PV}"
-
-# Let's not configure for the host distro.
-#
-PTEST_CONF = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '--enable-tests', '', d)}"
-EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
-
-EXTRA_OECONF += "--with-init-script=\
-${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit,', '', d)}\
-${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
-
-EXTRA_OECONF += "--enable-log-src-basename"
-
-CFLAGS_append = " -Wno-error=deprecated-declarations"
-
-PACKAGECONFIG ??= "templates \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
-"
-PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc --disable-api-docs,,"
-PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
-PACKAGECONFIG[apparmor] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
-PACKAGECONFIG[templates] = ",,, ${PN}-templates"
-PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
-PACKAGECONFIG[seccomp] ="--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
-PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd,"
-
-# required by python3 to run setup.py
-export BUILD_SYS
-export HOST_SYS
-export STAGING_INCDIR
-export STAGING_LIBDIR
-
-inherit autotools pkgconfig ptest update-rc.d systemd python3native
-
-SYSTEMD_PACKAGES = "${PN} ${PN}-networking"
-SYSTEMD_SERVICE_${PN} = "lxc.service"
-SYSTEMD_AUTO_ENABLE_${PN} = "disable"
-SYSTEMD_SERVICE_${PN}-networking = "lxc-net.service"
-SYSTEMD_AUTO_ENABLE_${PN}-networking = "enable"
-
-INITSCRIPT_PACKAGES = "${PN} ${PN}-networking"
-INITSCRIPT_NAME_${PN} = "lxc-containers"
-INITSCRIPT_PARAMS_${PN} = "defaults"
-INITSCRIPT_NAME_${PN}-networking = "lxc-net"
-INITSCRIPT_PARAMS_${PN}-networking = "defaults"
-
-FILES_${PN}-doc = "${mandir} ${infodir}"
-# For LXC the docdir only contains example configuration files and should be included in the lxc package
-FILES_${PN} += "${docdir}"
-FILES_${PN} += "${libdir}/python3*"
-FILES_${PN} += "${datadir}/bash-completion"
-FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
-FILES_${PN}-dbg += "${libexecdir}/lxc/hooks/.debug"
-PACKAGES =+ "${PN}-templates ${PN}-networking ${PN}-lua"
-FILES_lua-${PN} = "${datadir}/lua ${libdir}/lua"
-FILES_lua-${PN}-dbg += "${libdir}/lua/lxc/.debug"
-FILES_${PN}-templates += "${datadir}/lxc/templates"
-RDEPENDS_${PN}-templates += "bash"
-
-FILES_${PN}-networking += " \
-    ${sysconfdir}/init.d/lxc-net \
-    ${sysconfdir}/default/lxc-net \
-"
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
-	install -d ${D}${sysconfdir}/init.d
-	install -m 755 config/init/sysvinit/lxc* ${D}${sysconfdir}/init.d
-
-	# since python3-native is used for install location this will not be
-	# suitable for the target and we will have to correct the package install
-	if ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
-	    if [ -d ${D}${exec_prefix}/lib/python* ]; then mv ${D}${exec_prefix}/lib/python* ${D}${libdir}/; fi
-	    rmdir --ignore-fail-on-non-empty ${D}${exec_prefix}/lib
-	fi
-
-	# /etc/default/lxc sources lxc-net, this allows lxc bridge when lxc-networking
-	# is not installed this results in no lxcbr0, but when lxc-networking is installed
-	# lxcbr0 will be fully configured.
-	install -m 644 ${WORKDIR}/lxc-net ${D}${sysconfdir}/default/
-
-	# Force the main dnsmasq instance to bind only to specified interfaces and
-	# to not bind to virbr0. Libvirt will run its own instance on this interface.
-	install -d ${D}/${sysconfdir}/dnsmasq.d
-	install -m 644 ${WORKDIR}/dnsmasq.conf ${D}/${sysconfdir}/dnsmasq.d/lxc
-}
-
-EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
-
-do_install_ptest() {
-	# Move tests to the "ptest directory"
-	install -d ${D}/${PTEST_PATH}/tests
-	mv ${D}/usr/bin/lxc-test-* ${D}/${PTEST_PATH}/tests/.
-}
-
-pkg_postinst_${PN}() {
-	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
-		/etc/init.d/populate-volatile.sh update
-	fi
-}
-
-pkg_postinst_ontarget_${PN}-networking() {
-if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
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
-fi
-}
diff --git a/recipes-containers/lxc/lxc_4.0.2.bb b/recipes-containers/lxc/lxc_4.0.2.bb
new file mode 100644
index 0000000..bc7f88b
--- /dev/null
+++ b/recipes-containers/lxc/lxc_4.0.2.bb
@@ -0,0 +1,200 @@
+DESCRIPTION = "lxc aims to use these new functionnalities to provide an userspace container object"
+SECTION = "console/utils"
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
+                    file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
+"
+
+DEPENDS = "libxml2 libcap"
+RDEPENDS_${PN} = " \
+		rsync \
+		curl \
+		gzip \
+		xz \
+		tar \
+		libcap-bin \
+		bridge-utils \
+		dnsmasq \
+		perl-module-strict \
+		perl-module-getopt-long \
+		perl-module-vars \
+		perl-module-exporter \
+		perl-module-constant \
+		perl-module-overload \
+		perl-module-exporter-heavy \
+		gmp \
+		libidn \
+		gnutls \
+		nettle \
+		util-linux-mountpoint \
+		util-linux-getopt \
+"
+
+RDEPENDS_${PN}_append_libc-glibc = " glibc-utils"
+
+RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls bash libgcc"
+
+RDEPENDS_${PN}-networking += "iptables"
+
+SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
+	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
+	file://run-ptest \
+	file://lxc-fix-B-S.patch \
+	file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
+	file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
+	file://templates-actually-create-DOWNLOAD_TEMP-directory.patch \
+	file://template-make-busybox-template-compatible-with-core-.patch \
+	file://templates-use-curl-instead-of-wget.patch \
+	file://tests-our-init-is-not-busybox.patch \
+	file://tests-add-no-validate-when-using-download-template.patch \
+	file://dnsmasq.conf \
+	file://lxc-net \
+	"
+
+SRC_URI[md5sum] = "cc62e734c900f39d770f0de51c868aac"
+SRC_URI[sha256sum] = "ca336dcdf303fea5ff231d89a9b6278b061c4cffb14f0db0a71a15bdd95a5cb0"
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+# Let's not configure for the host distro.
+#
+PTEST_CONF = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '--enable-tests', '', d)}"
+EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
+
+EXTRA_OECONF += "--with-init-script=\
+${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit,', '', d)}\
+${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+
+EXTRA_OECONF += "--enable-log-src-basename"
+
+CFLAGS_append = " -Wno-error=deprecated-declarations"
+
+PACKAGECONFIG ??= "templates \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+"
+PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc --disable-api-docs,,"
+PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
+PACKAGECONFIG[apparmor] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
+PACKAGECONFIG[templates] = ",,, ${PN}-templates"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
+PACKAGECONFIG[seccomp] ="--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd,"
+
+# required by python3 to run setup.py
+export BUILD_SYS
+export HOST_SYS
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+inherit autotools pkgconfig ptest update-rc.d systemd python3native
+
+SYSTEMD_PACKAGES = "${PN} ${PN}-networking"
+SYSTEMD_SERVICE_${PN} = "lxc.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "disable"
+SYSTEMD_SERVICE_${PN}-networking = "lxc-net.service"
+SYSTEMD_AUTO_ENABLE_${PN}-networking = "enable"
+
+INITSCRIPT_PACKAGES = "${PN} ${PN}-networking"
+INITSCRIPT_NAME_${PN} = "lxc-containers"
+INITSCRIPT_PARAMS_${PN} = "defaults"
+INITSCRIPT_NAME_${PN}-networking = "lxc-net"
+INITSCRIPT_PARAMS_${PN}-networking = "defaults"
+
+FILES_${PN}-doc = "${mandir} ${infodir}"
+# For LXC the docdir only contains example configuration files and should be included in the lxc package
+FILES_${PN} += "${docdir}"
+FILES_${PN} += "${libdir}/python3*"
+FILES_${PN} += "${datadir}/bash-completion"
+FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
+FILES_${PN}-dbg += "${libexecdir}/lxc/hooks/.debug"
+PACKAGES =+ "${PN}-templates ${PN}-networking ${PN}-lua"
+FILES_lua-${PN} = "${datadir}/lua ${libdir}/lua"
+FILES_lua-${PN}-dbg += "${libdir}/lua/lxc/.debug"
+FILES_${PN}-templates += "${datadir}/lxc/templates"
+RDEPENDS_${PN}-templates += "bash"
+
+FILES_${PN}-networking += " \
+    ${sysconfdir}/init.d/lxc-net \
+    ${sysconfdir}/default/lxc-net \
+"
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
+	install -d ${D}${sysconfdir}/init.d
+	install -m 755 config/init/sysvinit/lxc* ${D}${sysconfdir}/init.d
+
+	# since python3-native is used for install location this will not be
+	# suitable for the target and we will have to correct the package install
+	if ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
+	    if [ -d ${D}${exec_prefix}/lib/python* ]; then mv ${D}${exec_prefix}/lib/python* ${D}${libdir}/; fi
+	    rmdir --ignore-fail-on-non-empty ${D}${exec_prefix}/lib
+	fi
+
+	# /etc/default/lxc sources lxc-net, this allows lxc bridge when lxc-networking
+	# is not installed this results in no lxcbr0, but when lxc-networking is installed
+	# lxcbr0 will be fully configured.
+	install -m 644 ${WORKDIR}/lxc-net ${D}${sysconfdir}/default/
+
+	# Force the main dnsmasq instance to bind only to specified interfaces and
+	# to not bind to virbr0. Libvirt will run its own instance on this interface.
+	install -d ${D}/${sysconfdir}/dnsmasq.d
+	install -m 644 ${WORKDIR}/dnsmasq.conf ${D}/${sysconfdir}/dnsmasq.d/lxc
+}
+
+EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
+
+do_install_ptest() {
+	# Move tests to the "ptest directory"
+	install -d ${D}/${PTEST_PATH}/tests
+	mv ${D}/usr/bin/lxc-test-* ${D}/${PTEST_PATH}/tests/.
+}
+
+pkg_postinst_${PN}() {
+	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
+		/etc/init.d/populate-volatile.sh update
+	fi
+}
+
+pkg_postinst_ontarget_${PN}-networking() {
+if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
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
+fi
+}
-- 
2.7.4

