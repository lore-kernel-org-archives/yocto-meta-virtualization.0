Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web09.2787.1628243139458545292
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Aug 2021 02:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vfUoJl17;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1628243137; i=@fujitsu.com;
	bh=FBXJCMz/odLdogCjd1G69r9JwIdNBHuSCbo1L7sEC8I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vfUoJl176+mY2GsRdMSfJ+zBnj4Qe7lrbMK6KuvyuQLGixxcJK6Y3bVr8MinaQRCC
	 9XONdUkkYhsud5F4Ij7zc39m5oSRHMt8l637h0gVKcfpzySK2Ctz0zaKZKHx88WuTd
	 Nh6XkRKuP6jU0jkL2s+yPI1MRHab7Ixl4iMBiFVcy+UP8ERssUULH2Ty0QoF0SHzn5
	 pv8GQ7j7sF5e1eEFS8liA3mKaA9PUxmlRmi4TYzB0ywo961gC0jp92sBgwlZust4VF
	 Aq7jUK/xtv0qwWQSsCsj/g8yr1aMGR67h2D8tUDTN+fuO6wiSSlzelzwuzKJ/zEJiP
	 4ZE324BY60CKw==
Received: from [100.113.0.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id B0/CE-15992-0C40D016; Fri, 06 Aug 2021 09:45:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8MRqnuAhTf
  R4ORDdotFX56xOjB6zDz1iDmAMYo1My8pvyKBNaNz6hSmgutXmSq2zjjG1MDYvJipi5GLQ0hg
  NpPExd0L2CGc44wSW/euY+xi5ORgE1CTmH7rBiuILSJgIHHu3HxmEJtZQEXixe8eoAYODmEBV
  4mNJ8NBwixA4e9vFrKB2LwCjhLdzR1g5RICChJTHr5nhogLSpyc+YQFYoyExMEXL6BqFCVmX2
  5mgbArJGbNamOawMg7C0nLLCQtCxiZVjFaJBVlpmeU5CZm5ugaGhjoGhoa6xrqmhrqJVbpJuq
  lluomp+aVFCUCJfUSy4v1iitzk3NS9PJSSzYxAkMspZDReAfjwdcf9A4xSnIwKYnyNp/jSRTi
  S8pPqcxILM6ILyrNSS0+xCjDwaEkwcvMxJsoJFiUmp5akZaZAwx3mLQEB4+SCC8TSJq3uCAxt
  zgzHSJ1itGb4/L1eYuYOXaeXgwkT65aAiSvgMkHV++tYuY4//bTZmYhlrz8vFQpcd4CZqARAi
  AjMkrz4BbA4vYSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeQZBDeDLzSuDueAV0IhPQiRd
  iOUFOLElESEk1MPmKZU7/djxh4Z1ZshydC/8q7nl+4dLu8sSleU4sciwZf0SYZn9r3XWJhTG4
  tFfuQH31wrZY0bWTNk+2rz79457X55vhkj9q5uw4ViL3z+mY2+xNJnUXi4t7kt4bxV/0WVpkv
  v9ZZvTRq0/O63v0pVoYNFzh/Nfl6LRI4M3PtKXpzkk1lzg5Krt2Ne3ujMjfaLCu+3KPprsBe8
  marp8nDpa4RV94LvvBXeBwom/I5d0Ct49qZrbXvpqYYukSYMfZeEfy/6G2jwdqTT89ftgfo1s
  nd6S46s2zF/uyunnXfM88vnG9ytmtyerN8rqCxR9f+KzaIZbgHsh9+mG6sd5svoijrG6zm5LO
  pchvXRDzWImlOCPRUIu5qDgRABc9q+JWAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-232.messagelabs.com!1628243135!255059!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8762 invoked from network); 6 Aug 2021 09:45:35 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-5.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Aug 2021 09:45:35 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1769jUmP021494
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 6 Aug 2021 10:45:35 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 6 Aug 2021 10:45:27 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization] [PATCH] Convert to new override syntax
Date: Fri, 6 Aug 2021 17:45:17 +0800
Message-ID: <1628243117-8646-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

    This is the result of automated script (0.9.1) conversion:

    oe-core/scripts/contrib/convert-overrides.py .

    converting the metadata to use ":" as the override character instead of "_".

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 README                                        |   2 +-
 classes/cni_networking.bbclass                |   8 +-
 classes/qemuboot-xen-defaults.bbclass         |   2 +-
 conf/distro/include/meta-virt-xen.inc         |   6 +-
 conf/layer.conf                               |   8 +-
 recipes-containers/lxc/lxc_4.0.9.bb           |  36 ++--
 recipes-extended/libvirt/libvirt_7.2.0.bb     |  48 ++---
 .../nagios/nagios-plugins_2.2.1.bb            |   6 +-
 recipes-extended/seabios/seabios_1.14.0.bb    |   2 +-
 recipes-extended/upx/upx_git.bb               |   2 +-
 recipes-extended/vgabios/biossums_0.7a.bb     |   2 +-
 recipes-extended/vgabios/vgabios_0.7a.bb      |   4 +-
 recipes-extended/xen/xen-blktap.inc           |  16 +-
 recipes-extended/xen/xen-hypervisor.inc       |   6 +-
 recipes-extended/xen/xen-tools.inc            | 164 +++++++++---------
 recipes-extended/xen/xen.inc                  |  10 +-
 recipes-extended/xen/xtf_git.bb               |   2 +-
 recipes-extended/xvisor/xvisor_git.bb         |   6 +-
 .../xorg-xserver/xserver-xorg_xen.inc         |   2 +-
 recipes-kernel/dtc/python3-dtc_1.6.1.bb       |   2 +-
 .../linux/linux-yocto_virtualization.inc      |   8 +-
 recipes-kernel/lopper/lopper.bb               |   2 +-
 recipes-networking/cni/cni_git.bb             |   4 +-
 .../openvswitch/openvswitch.inc               |  42 ++---
 .../openvswitch/openvswitch_git.bb            |   8 +-
 25 files changed, 199 insertions(+), 199 deletions(-)

diff --git a/README b/README
index a0fb466..1c75f4a 100644
--- a/README
+++ b/README
@@ -8,7 +8,7 @@ The bbappend files for some recipes (e.g. linux-yocto) in this layer need to
 have 'virtualization' in DISTRO_FEATURES to have effect. To enable them, add
 in configuration file the following line.
 
-  DISTRO_FEATURES_append = " virtualization"
+  DISTRO_FEATURES:append = " virtualization"
 
 If meta-virtualization is included, but virtualization is not enabled as a
 distro feature a warning is printed at parse time:
diff --git a/classes/cni_networking.bbclass b/classes/cni_networking.bbclass
index 9df02b8..054c0ae 100644
--- a/classes/cni_networking.bbclass
+++ b/classes/cni_networking.bbclass
@@ -1,12 +1,12 @@
-DEPENDS_append_class-target = " cni"
+DEPENDS:append:class-target = " cni"
 
-PACKAGES_prepend = "${PN}-cni "
+PACKAGES:prepend = "${PN}-cni "
 
-FILES_${PN}-cni = "${sysconfdir}/cni/net.d/*"
+FILES:${PN}-cni = "${sysconfdir}/cni/net.d/*"
 
 RDEPENDS_${PN}-cni = "cni"
 
-do_install_append() {
+do_install:append() {
     if [ -z "${CNI_NETWORKING_FILES}" ]; then
 	bbfatal "cni-networking was inherited, but no networking configuration was provided via CNI_NETWORKING_FILES"
     fi
diff --git a/classes/qemuboot-xen-defaults.bbclass b/classes/qemuboot-xen-defaults.bbclass
index 67751d3..591b452 100644
--- a/classes/qemuboot-xen-defaults.bbclass
+++ b/classes/qemuboot-xen-defaults.bbclass
@@ -12,7 +12,7 @@ QB_XEN_DOMAIN_MODULES ??= "${DOM0_KERNEL}:${DOM0_KERNEL_LOAD_ADDR}:multiboot,ker
 
 # Qemuboot for 64-bit Arm uses the QB_DEFAULT_KERNEL method to load Xen
 # and the device loader option for the dom0 kernel:
-QB_OPT_APPEND_append_aarch64 = " \
+QB_OPT_APPEND:append:aarch64 = " \
     -device loader,file=${DOM0_KERNEL},addr=${DOM0_KERNEL_LOAD_ADDR} \
     "
 QB_DEFAULT_KERNEL_aarch64 = "xen-${MACHINE}"
diff --git a/conf/distro/include/meta-virt-xen.inc b/conf/distro/include/meta-virt-xen.inc
index 2becba1..744f3fe 100644
--- a/conf/distro/include/meta-virt-xen.inc
+++ b/conf/distro/include/meta-virt-xen.inc
@@ -1,9 +1,9 @@
 # Make sure Xen mode is enabled in qemu
-PACKAGECONFIG_append_pn-qemu = " xen"
+PACKAGECONFIG:append:pn-qemu = " xen"
 
 # For builds for ARM platforms, enable fdt
-PACKAGECONFIG_append_pn-qemu_arm = " fdt"
-PACKAGECONFIG_append_pn-qemu_aarch64 = " fdt"
+PACKAGECONFIG:append:pn-qemu_arm = " fdt"
+PACKAGECONFIG:append:pn-qemu_aarch64 = " fdt"
 
 # Xen on Raspberry Pi 4 64-bit support
 XEN_RPI4_64_CONFIG_PATH ??= \
diff --git a/conf/layer.conf b/conf/layer.conf
index 43873c2..7cf7084 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -22,7 +22,7 @@ BBFILES_DYNAMIC += " \
 # cause compatibility issues with other layers
 LAYERVERSION_virtualization-layer = "1"
 LAYERSERIES_COMPAT_virtualization-layer = "hardknott honister"
-LAYERDEPENDS_virtualization-layer = " \
+LAYERDEPENDS:virtualization-layer = " \
     core \
     openembedded-layer \
     networking-layer \
@@ -54,8 +54,8 @@ INHERIT += "sanity-meta-virt"
 META_VIRT_CONFIG_PATH = "${LAYERDIR}/conf/distro/include/meta-virt-default-versions.inc"
 META_VIRT_XEN_CONFIG_PATH = "${LAYERDIR}/conf/distro/include/meta-virt-xen.inc"
 K8S_CONFIG_PATH = "${LAYERDIR}/conf/distro/include/k8s-versions.inc"
-USER_CLASSES_append = " meta-virt-cfg"
-USER_CLASSES_append = " meta-virt-k8s-cfg"
-USER_CLASSES_append = " meta-virt-xen-cfg"
+USER_CLASSES:append = " meta-virt-cfg"
+USER_CLASSES:append = " meta-virt-k8s-cfg"
+USER_CLASSES:append = " meta-virt-xen-cfg"
 
 HOSTTOOLS_NONFATAL += "getent"
diff --git a/recipes-containers/lxc/lxc_4.0.9.bb b/recipes-containers/lxc/lxc_4.0.9.bb
index 7907291..22bf45e 100644
--- a/recipes-containers/lxc/lxc_4.0.9.bb
+++ b/recipes-containers/lxc/lxc_4.0.9.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c
 "
 
 DEPENDS = "libxml2 libcap"
-RDEPENDS_${PN} = " \
+RDEPENDS:${PN} = " \
 		rsync \
 		curl \
 		gzip \
@@ -30,11 +30,11 @@ RDEPENDS_${PN} = " \
 		util-linux-getopt \
 "
 
-RDEPENDS_${PN}_append_libc-glibc = " glibc-utils"
+RDEPENDS:${PN}:append:libc-glibc = " glibc-utils"
 
-RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls bash libgcc"
+RDEPENDS:${PN}-ptest += "file make gmp nettle gnutls bash libgcc"
 
-RDEPENDS_${PN}-networking += "iptables"
+RDEPENDS:${PN}-networking += "iptables"
 
 SRC_URI = "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
 	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
@@ -96,25 +96,25 @@ SYSTEMD_SERVICE_${PN}-networking = "lxc-net.service"
 SYSTEMD_AUTO_ENABLE_${PN}-networking = "enable"
 
 INITSCRIPT_PACKAGES = "${PN} ${PN}-networking"
-INITSCRIPT_NAME_${PN} = "lxc-containers"
-INITSCRIPT_PARAMS_${PN} = "defaults"
-INITSCRIPT_NAME_${PN}-networking = "lxc-net"
-INITSCRIPT_PARAMS_${PN}-networking = "defaults"
+INITSCRIPT_NAME:${PN} = "lxc-containers"
+INITSCRIPT_PARAMS:${PN} = "defaults"
+INITSCRIPT_NAME:${PN}-networking = "lxc-net"
+INITSCRIPT_PARAMS:${PN}-networking = "defaults"
 
-FILES_${PN}-doc = "${mandir} ${infodir}"
+FILES:${PN}-doc = "${mandir} ${infodir}"
 # For LXC the docdir only contains example configuration files and should be included in the lxc package
-FILES_${PN} += "${docdir}"
-FILES_${PN} += "${libdir}/python3*"
-FILES_${PN} += "${datadir}/bash-completion"
-FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
-FILES_${PN}-dbg += "${libexecdir}/lxc/hooks/.debug"
+FILES:${PN} += "${docdir}"
+FILES:${PN} += "${libdir}/python3*"
+FILES:${PN} += "${datadir}/bash-completion"
+FILES:${PN}-dbg += "${libexecdir}/lxc/.debug"
+FILES:${PN}-dbg += "${libexecdir}/lxc/hooks/.debug"
 PACKAGES =+ "${PN}-templates ${PN}-networking ${PN}-lua"
 FILES_lua-${PN} = "${datadir}/lua ${libdir}/lua"
 FILES_lua-${PN}-dbg += "${libdir}/lua/lxc/.debug"
-FILES_${PN}-templates += "${datadir}/lxc/templates"
-RDEPENDS_${PN}-templates += "bash"
+FILES:${PN}-templates += "${datadir}/lxc/templates"
+RDEPENDS:${PN}-templates += "bash"
 
-FILES_${PN}-networking += " \
+FILES:${PN}-networking += " \
     ${sysconfdir}/init.d/lxc-net \
     ${sysconfdir}/default/lxc-net \
 "
@@ -125,7 +125,7 @@ CACHED_CONFIGUREVARS += " \
     am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
 "
 
-do_install_append() {
+do_install:append() {
 	# The /var/cache/lxc directory created by the Makefile
 	# is wiped out in volatile, we need to create this at boot.
 	rm -rf ${D}${localstatedir}/cache
diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb b/recipes-extended/libvirt/libvirt_7.2.0.bb
index 19662a7..d86b0a0 100644
--- a/recipes-extended/libvirt/libvirt_7.2.0.bb
+++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
@@ -13,11 +13,11 @@ DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux
 
 # libvirt-guests.sh needs gettext.sh
 #
-RDEPENDS_${PN} = "gettext-runtime"
+RDEPENDS:${PN} = "gettext-runtime"
 
-RDEPENDS_libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq netcat-openbsd ebtables"
-RDEPENDS_libvirt-libvirtd_append_x86-64 = " dmidecode"
-RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
+RDEPENDS:libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq netcat-openbsd ebtables"
+RDEPENDS:libvirt-libvirtd:append:x86-64 = " dmidecode"
+RDEPENDS:libvirt-libvirtd:append:x86 = " dmidecode"
 
 #connman blocks the 53 port and libvirtd can't start its DNS service
 RCONFLICTS_${PN}_libvirtd = "connman"
@@ -36,12 +36,12 @@ SRC_URI[libvirt.sha256sum] = "01f459d0c7ba5009622a628dba1a026200e8f4a299fea783b9
 
 inherit meson gettext update-rc.d pkgconfig systemd useradd perlnative
 USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM_${PN} = "-r qemu; -r kvm"
-USERADD_PARAM_${PN} = "-r -g qemu -G kvm qemu"
+GROUPADD_PARAM:${PN} = "-r qemu; -r kvm"
+USERADD_PARAM:${PN} = "-r -g qemu -G kvm qemu"
 
 
 EXTRA_OEMESON += "--cross-file ${WORKDIR}/meson-${PN}.cross"
-do_write_config_append() {
+do_write_config:append() {
     cat >${WORKDIR}/meson-${PN}.cross <<EOF
 [binaries]
 iptables = '/usr/sbin/iptables'
@@ -58,7 +58,7 @@ PACKAGES =+ "${PN}-libvirtd ${PN}-virsh"
 
 ALLOW_EMPTY_${PN}-libvirtd = "1"
 
-FILES_${PN}-libvirtd = " \
+FILES:${PN}-libvirtd = " \
 	${sysconfdir}/init.d \
 	${sysconfdir}/sysctl.d \
 	${sysconfdir}/logrotate.d \
@@ -70,12 +70,12 @@ FILES_${PN}-libvirtd = " \
 	${@bb.utils.contains('PACKAGECONFIG', 'gnutls', '${sysconfdir}/pki/libvirt/* ${sysconfdir}/pki/CA/*', '', d)} \
         "
 
-FILES_${PN}-virsh = " \
+FILES:${PN}-virsh = " \
     ${bindir}/virsh \
     ${datadir}/bash-completion/completions/virsh \
 "
 
-FILES_${PN} += "${libdir}/libvirt/connection-driver \
+FILES:${PN} += "${libdir}/libvirt/connection-driver \
 	    ${datadir}/augeas \
 	    ${@bb.utils.contains('PACKAGECONFIG', 'polkit', '${datadir}/polkit-1', '', d)} \
 	    ${datadir}/bash-completion/completions/vsh \
@@ -83,24 +83,24 @@ FILES_${PN} += "${libdir}/libvirt/connection-driver \
 	    /usr/lib/firewalld/zones/libvirt.xml \
 	    "
 
-FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug ${libdir}/libvirt/lock-driver/.debug"
-FILES_${PN}-staticdev += "${libdir}/*.a ${libdir}/libvirt/connection-driver/*.a ${libdir}/libvirt/lock-driver/*.a"
+FILES:${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug ${libdir}/libvirt/lock-driver/.debug"
+FILES:${PN}-staticdev += "${libdir}/*.a ${libdir}/libvirt/connection-driver/*.a ${libdir}/libvirt/lock-driver/*.a"
 
-CONFFILES_${PN} += "${sysconfdir}/libvirt/libvirt.conf \
+CONFFILES:${PN} += "${sysconfdir}/libvirt/libvirt.conf \
                     ${sysconfdir}/libvirt/lxc.conf \
                     ${sysconfdir}/libvirt/qemu-lockd.conf \
                     ${sysconfdir}/libvirt/qemu.conf \
                     ${sysconfdir}/libvirt/virt-login-shell.conf \
                     ${sysconfdir}/libvirt/virtlockd.conf"
 
-CONFFILES_${PN}-libvirtd = "${sysconfdir}/logrotate.d/libvirt ${sysconfdir}/logrotate.d/libvirt.lxc \
+CONFFILES:${PN}-libvirtd = "${sysconfdir}/logrotate.d/libvirt ${sysconfdir}/logrotate.d/libvirt.lxc \
                             ${sysconfdir}/logrotate.d/libvirt.qemu ${sysconfdir}/logrotate.d/libvirt.uml \
                             ${sysconfdir}/libvirt/libvirtd.conf \
                             /usr/lib/sysctl.d/libvirtd.conf"
 
 INITSCRIPT_PACKAGES = "${PN}-libvirtd"
-INITSCRIPT_NAME_${PN}-libvirtd = "libvirtd"
-INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
+INITSCRIPT_NAME:${PN}-libvirtd = "libvirtd"
+INITSCRIPT_PARAMS:${PN}-libvirtd = "defaults 72"
 
 SYSTEMD_PACKAGES = "${PN}-libvirtd"
 SYSTEMD_SERVICE_${PN}-libvirtd = " \
@@ -122,12 +122,12 @@ PACKAGECONFIG ??= "gnutls qemu yajl openvz vmware vbox esx lxc test remote \
                   "
 
 # qemu is NOT compatible with mips64
-PACKAGECONFIG_remove_mipsarchn32 = "qemu"
-PACKAGECONFIG_remove_mipsarchn64 = "qemu"
+PACKAGECONFIG:remove_mipsarchn32 = "qemu"
+PACKAGECONFIG:remove_mipsarchn64 = "qemu"
 
 # numactl is NOT compatible with arm
-PACKAGECONFIG_remove_arm = "numactl"
-PACKAGECONFIG_remove_armeb = "numactl"
+PACKAGECONFIG:remove_arm = "numactl"
+PACKAGECONFIG:remove_armeb = "numactl"
 
 # enable,disable,depends,rdepends
 #
@@ -179,12 +179,12 @@ do_compile() {
 	ninja all
 }
 
-do_install_prepend() {
+do_install:prepend() {
 	# so the install routines can find the libvirt.pc in the source dir
 	export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:${B}/src:"
 }
 
-do_install_append() {
+do_install:append() {
 	install -d ${D}/etc/init.d
 	install -d ${D}/etc/libvirt
 	install -d ${D}/etc/dnsmasq.d
@@ -313,8 +313,8 @@ EXTRA_OEMESON += " \
 
 # gcc9 end up mis-compiling qemuxml2argvtest.o with Og which then
 # crashes on target, so remove -Og and use -O2 as workaround
-SELECTED_OPTIMIZATION_remove_virtclass-multilib-lib32_mipsarch = "-Og"
-SELECTED_OPTIMIZATION_append_virtclass-multilib-lib32_mipsarch = " -O2"
+SELECTED_OPTIMIZATION:remove_virtclass-multilib-lib32_mipsarch = "-Og"
+SELECTED_OPTIMIZATION:append:virtclass-multilib-lib32_mipsarch = " -O2"
 
 pkg_postinst_${PN}() {
         if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
diff --git a/recipes-extended/nagios/nagios-plugins_2.2.1.bb b/recipes-extended/nagios/nagios-plugins_2.2.1.bb
index b97d80c..f61262e 100644
--- a/recipes-extended/nagios/nagios-plugins_2.2.1.bb
+++ b/recipes-extended/nagios/nagios-plugins_2.2.1.bb
@@ -59,17 +59,17 @@ do_configure() {
     oe_runconf || die "make failed"
 }
 
-do_install_append() {
+do_install:append() {
      sed -i '1s,#! /usr/bin/perl -w.*,#! ${bindir}/env perl,' ${D}${libdir}/nagios/plugins/*
 }
 
-RDEPENDS_${PN} += "\
+RDEPENDS:${PN} += "\
     iputils \
     nagios-base \
     perl \
     bash \
 "
 
-FILES_${PN} += "${datadir} \
+FILES:${PN} += "${datadir} \
                 ${NAGIOS_PLUGIN_DIR} \
 "
diff --git a/recipes-extended/seabios/seabios_1.14.0.bb b/recipes-extended/seabios/seabios_1.14.0.bb
index 1591cb6..c13592f 100644
--- a/recipes-extended/seabios/seabios_1.14.0.bb
+++ b/recipes-extended/seabios/seabios_1.14.0.bb
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504
 SRC_URI[md5sum] = "9df3b7de6376850d09161137e7a9b61f"
 SRC_URI[sha256sum] = "eb70cc62b29aa83e10a653233acebf4bb154d00d0c87dc2a2c6e2da75e5e81fd"
 
-FILES_${PN} = "/usr/share/firmware"
+FILES:${PN} = "/usr/share/firmware"
 
 DEPENDS += "util-linux-native file-native bison-native flex-native gettext-native acpica-native"
 
diff --git a/recipes-extended/upx/upx_git.bb b/recipes-extended/upx/upx_git.bb
index 96d2e99..8b13b17 100644
--- a/recipes-extended/upx/upx_git.bb
+++ b/recipes-extended/upx/upx_git.bb
@@ -27,7 +27,7 @@ do_compile() {
     oe_runmake -C src all
 }
 
-do_install_append() {
+do_install:append() {
     install -d ${D}${bindir}
     install -m 755 ${B}/src/upx.out ${D}${bindir}/upx
 }
diff --git a/recipes-extended/vgabios/biossums_0.7a.bb b/recipes-extended/vgabios/biossums_0.7a.bb
index e66bade..ef0ef45 100644
--- a/recipes-extended/vgabios/biossums_0.7a.bb
+++ b/recipes-extended/vgabios/biossums_0.7a.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "9d24c33d4bfb7831e2069cf3644936a53ef3de21d467872b54ce2ea308
 
 BBCLASSEXTEND = "native"
 
-FILES_${PN} = "${bindir}/biossums"
+FILES:${PN} = "${bindir}/biossums"
 
 S = "${WORKDIR}/vgabios-${PV}"
 
diff --git a/recipes-extended/vgabios/vgabios_0.7a.bb b/recipes-extended/vgabios/vgabios_0.7a.bb
index 3394173..48a7835 100644
--- a/recipes-extended/vgabios/vgabios_0.7a.bb
+++ b/recipes-extended/vgabios/vgabios_0.7a.bb
@@ -14,8 +14,8 @@ SRC_URI[sha256sum] = "9d24c33d4bfb7831e2069cf3644936a53ef3de21d467872b54ce2ea308
 
 PR = "r0"
 
-FILES_${PN} = "/usr/share/firmware/${PN}-${PV}*.bin"
-FILES_${PN}-dbg = "/usr/share/firmware/${PN}-${PV}*.debug.bin"
+FILES:${PN} = "/usr/share/firmware/${PN}-${PV}*.bin"
+FILES:${PN}-dbg = "/usr/share/firmware/${PN}-${PV}*.debug.bin"
 
 S = "${WORKDIR}/${PN}-${PV}"
 
diff --git a/recipes-extended/xen/xen-blktap.inc b/recipes-extended/xen/xen-blktap.inc
index 5f385dd..7fec159 100644
--- a/recipes-extended/xen/xen-blktap.inc
+++ b/recipes-extended/xen/xen-blktap.inc
@@ -31,34 +31,34 @@ RPROVIDES_${PN}-libblktap = "virtual/libblktap"
 RPROVIDES_${PN}-libblktapctl = "virtual/libblktapctl"
 RPROVIDES_${PN}-libvhd = "virtual/libvhd"
 
-FILES_${PN}-blktap-staticdev += "\
+FILES:${PN}-blktap-staticdev += "\
     ${libdir}/libblktapctl.a \
     ${libdir}/libvhd.a \
     ${libdir}/libblktap.a \
     "
 
-FILES_${PN}-libblktapctl = "${libdir}/libblktapctl.so.*"
-FILES_${PN}-libblktapctl-dev = " \
+FILES:${PN}-libblktapctl = "${libdir}/libblktapctl.so.*"
+FILES:${PN}-libblktapctl-dev = " \
     ${libdir}/libblktapctl.so \
     ${libdir}/pkgconfig/xenblktapctl.pc \
     ${datadir}/pkgconfig/xenblktapctl.pc \
     "
 
-FILES_${PN}-libvhd = "${libdir}/libvhd.so.*"
-FILES_${PN}-libvhd-dev = " \
+FILES:${PN}-libvhd = "${libdir}/libvhd.so.*"
+FILES:${PN}-libvhd-dev = " \
     ${libdir}/libvhd.so \
     ${libdir}/pkgconfig/vhd.pc \
     ${datadir}/pkgconfig/vhd.pc \
     "
 
-FILES_${PN}-libblktap = "${libdir}/libblktap.so.*"
-FILES_${PN}-libblktap-dev = " \
+FILES:${PN}-libblktap = "${libdir}/libblktap.so.*"
+FILES:${PN}-libblktap-dev = " \
     ${libdir}/libblktap.so \
     ${libdir}/pkgconfig/blktap.pc \
     ${datadir}/pkgconfig/blktap.pc \
     "
 
-FILES_${PN}-blktap = "\
+FILES:${PN}-blktap = "\
     ${sbindir}/blktapctrl \
     ${sbindir}/img2qcow \
     ${sbindir}/lock-util \
diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
index 9b96d91..cffd491 100644
--- a/recipes-extended/xen/xen-hypervisor.inc
+++ b/recipes-extended/xen/xen-hypervisor.inc
@@ -17,7 +17,7 @@ PACKAGES = " \
     ${PN}-efi \
     "
 
-FILES_${PN} = " \
+FILES:${PN} = " \
     /boot/xen-* \
     /boot/xen \
     /boot/xen-*.gz \
@@ -25,9 +25,9 @@ FILES_${PN} = " \
     /boot/xen-syms-* \
     "
 
-FILES_${PN}-dbg += "${libdir}/debug/*"
+FILES:${PN}-dbg += "${libdir}/debug/*"
 
-FILES_${PN}-efi = " \
+FILES:${PN}-efi = " \
     /boot/xen.efi \
     ${exec_prefix}/lib64/efi/xen* \
     "
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index 2930097..ba4f2e7 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -224,7 +224,7 @@ PROVIDES =+ " \
 # virtual package to allow for substitution.
 RPROVIDES_${PN}-xenstored = "virtual/xenstored"
 
-FILES_${PN}-dbg += "\
+FILES:${PN}-dbg += "\
     ${libdir}/xen/bin/.debug \
     ${nonarch_libdir}/${PYTHON_DIR}/site-packages/.debug \
     ${nonarch_libdir}/${PYTHON_DIR}/site-packages/xen/lowlevel/.debug \
@@ -244,18 +244,18 @@ FILES_${PN}-dbg += "\
     ${nonarch_libdir}/${PYTHON_DIR}/dist-packages/xen/lowlevel/.debug \
     "
 
-FILES_${PN}-dev = "\
+FILES:${PN}-dev = "\
     ${includedir} \
     "
 
-FILES_${PN}-doc = "\
+FILES:${PN}-doc = "\
     ${sysconfdir}/xen/README \
     ${sysconfdir}/xen/README.incompatibilities \
     ${datadir}/doc \
     ${datadir}/man \
     "
 
-FILES_${PN}-staticdev += "\
+FILES:${PN}-staticdev += "\
     ${libdir}/libxenguest.a \
     ${libdir}/libxenlight.a \
     ${libdir}/libxenvchan.a \
@@ -265,122 +265,122 @@ FILES_${PN}-staticdev += "\
     ${libdir}/libxenstore.a \
     "
 
-FILES_${PN}-libxencall = "${libdir}/libxencall.so.*"
-FILES_${PN}-libxencall-dev = " \
+FILES:${PN}-libxencall = "${libdir}/libxencall.so.*"
+FILES:${PN}-libxencall-dev = " \
     ${libdir}/libxencall.so \
     ${libdir}/pkgconfig/xencall.pc \
     ${datadir}/pkgconfig/xencall.pc \
     "
 
-FILES_${PN}-libxenctrl = "${libdir}/libxenctrl.so.*"
-FILES_${PN}-libxenctrl-dev = " \
+FILES:${PN}-libxenctrl = "${libdir}/libxenctrl.so.*"
+FILES:${PN}-libxenctrl-dev = " \
     ${libdir}/libxenctrl.so \
     ${libdir}/pkgconfig/xencontrol.pc \
     ${datadir}/pkgconfig/xencontrol.pc \
     "
 
-FILES_${PN}-libxendevicemodel = "${libdir}/libxendevicemodel.so.*"
-FILES_${PN}-libxendevicemodel-dev = " \
+FILES:${PN}-libxendevicemodel = "${libdir}/libxendevicemodel.so.*"
+FILES:${PN}-libxendevicemodel-dev = " \
     ${libdir}/libxendevicemodel.so \
     ${libdir}/pkgconfig/xendevicemodel.pc \
     ${datadir}/pkgconfig/xendevicemodel.pc \
     "
 
-FILES_${PN}-libxenevtchn = "${libdir}/libxenevtchn.so.*"
-FILES_${PN}-libxenevtchn-dev = " \
+FILES:${PN}-libxenevtchn = "${libdir}/libxenevtchn.so.*"
+FILES:${PN}-libxenevtchn-dev = " \
     ${libdir}/libxenevtchn.so \
     ${libdir}/pkgconfig/xenevtchn.pc \
     ${datadir}/pkgconfig/xenevtchn.pc \
     "
 
-FILES_${PN}-libxenforeignmemory = "${libdir}/libxenforeignmemory.so.*"
-FILES_${PN}-libxenforeignmemory-dev = " \
+FILES:${PN}-libxenforeignmemory = "${libdir}/libxenforeignmemory.so.*"
+FILES:${PN}-libxenforeignmemory-dev = " \
     ${libdir}/libxenforeignmemory.so \
     ${libdir}/pkgconfig/xenforeignmemory.pc \
     ${datadir}/pkgconfig/xenforeignmemory.pc \
     "
 
-FILES_${PN}-libxengnttab = "${libdir}/libxengnttab.so.*"
-FILES_${PN}-libxengnttab-dev = " \
+FILES:${PN}-libxengnttab = "${libdir}/libxengnttab.so.*"
+FILES:${PN}-libxengnttab-dev = " \
     ${libdir}/libxengnttab.so \
     ${libdir}/pkgconfig/xengnttab.pc \
     ${datadir}/pkgconfig/xengnttab.pc \
     "
 
-FILES_${PN}-libxenguest = "${libdir}/libxenguest.so.*"
-FILES_${PN}-libxenguest-dev = " \
+FILES:${PN}-libxenguest = "${libdir}/libxenguest.so.*"
+FILES:${PN}-libxenguest-dev = " \
     ${libdir}/libxenguest.so \
     ${libdir}/pkgconfig/xenguest.pc \
     ${datadir}/pkgconfig/xenguest.pc \
     "
 
-FILES_${PN}-libxenhypfs = "${libdir}/libxenhypfs.so.*"
-FILES_${PN}-libxenhypfs-dev = " \
+FILES:${PN}-libxenhypfs = "${libdir}/libxenhypfs.so.*"
+FILES:${PN}-libxenhypfs-dev = " \
     ${libdir}/libxenhypfs.so \
     ${libdir}/pkgconfig/xenhypfs.pc \
     "
 
-FILES_${PN}-libxenlight = "${libdir}/libxenlight.so.*"
-FILES_${PN}-libxenlight-dev = " \
+FILES:${PN}-libxenlight = "${libdir}/libxenlight.so.*"
+FILES:${PN}-libxenlight-dev = " \
     ${libdir}/libxenlight.so \
     ${libdir}/pkgconfig/xenlight.pc \
     ${datadir}/pkgconfig/xenlight.pc \
     "
 
-FILES_${PN}-libxenstat = "${libdir}/libxenstat.so.*"
-FILES_${PN}-libxenstat-dev = " \
+FILES:${PN}-libxenstat = "${libdir}/libxenstat.so.*"
+FILES:${PN}-libxenstat-dev = " \
     ${libdir}/libxenstat.so \
     ${libdir}/pkgconfig/xenstat.pc \
     ${datadir}/pkgconfig/xenstat.pc \
     "
 
-FILES_${PN}-libxenstore = "${libdir}/libxenstore.so.*"
-FILES_${PN}-libxenstore-dev = " \
+FILES:${PN}-libxenstore = "${libdir}/libxenstore.so.*"
+FILES:${PN}-libxenstore-dev = " \
     ${libdir}/libxenstore.so \
     ${libdir}/pkgconfig/xenstore.pc \
     ${datadir}/pkgconfig/xenstore.pc \
     "
 
-FILES_${PN}-libxentoolcore = "${libdir}/libxentoolcore.so.*"
-FILES_${PN}-libxentoolcore-dev = " \
+FILES:${PN}-libxentoolcore = "${libdir}/libxentoolcore.so.*"
+FILES:${PN}-libxentoolcore-dev = " \
     ${libdir}/libxentoolcore.so \
     ${libdir}/pkgconfig/xentoolcore.pc \
     ${datadir}/pkgconfig/xentoolcore.pc \
     "
 
-FILES_${PN}-libxentoollog = "${libdir}/libxentoollog.so.*"
-FILES_${PN}-libxentoollog-dev = " \
+FILES:${PN}-libxentoollog = "${libdir}/libxentoollog.so.*"
+FILES:${PN}-libxentoollog-dev = " \
     ${libdir}/libxentoollog.so \
     ${libdir}/pkgconfig/xentoollog.pc \
     ${datadir}/pkgconfig/xentoollog.pc \
     "
 
-FILES_${PN}-libxenvchan = "${libdir}/libxenvchan.so.*"
-FILES_${PN}-libxenvchan-dev = " \
+FILES:${PN}-libxenvchan = "${libdir}/libxenvchan.so.*"
+FILES:${PN}-libxenvchan-dev = " \
     ${libdir}/libxenvchan.so \
     ${libdir}/pkgconfig/xenvchan.pc \
     ${datadir}/pkgconfig/xenvchan.pc \
     "
 
-FILES_${PN}-libxlutil = "${libdir}/libxlutil.so.*"
-FILES_${PN}-libxlutil-dev = " \
+FILES:${PN}-libxlutil = "${libdir}/libxlutil.so.*"
+FILES:${PN}-libxlutil-dev = " \
     ${libdir}/libxlutil.so \
     ${libdir}/pkgconfig/xlutil.pc \
     ${datadir}/pkgconfig/xlutil.pc \
     "
-FILES_${PN}-libvhd = "${libdir}/libvhd.so.*"
-FILES_${PN}-libvhd-dev = " \
+FILES:${PN}-libvhd = "${libdir}/libvhd.so.*"
+FILES:${PN}-libvhd-dev = " \
     ${libdir}/libvhd.so \
     ${libdir}/pkgconfig/vhd.pc \
     ${datadir}/pkgconfig/vhd.pc \
     "
 
-FILES_${PN}-libfsimage = " \
+FILES:${PN}-libfsimage = " \
     ${libdir}/libfsimage.so.* \
     ${libdir}/libxenfsimage.so.* \
     "
 
-FILES_${PN}-libfsimage-dev = " \
+FILES:${PN}-libfsimage-dev = " \
     ${libdir}/libfsimage.so \
     ${libdir}/libxenfsimage.so \
     ${libdir}/pkgconfig/fsimage.pc \
@@ -389,38 +389,38 @@ FILES_${PN}-libfsimage-dev = " \
     ${datadir}/pkgconfig/xenfsimage.pc \
     "
 
-FILES_${PN}-fsimage = " \
+FILES:${PN}-fsimage = " \
     ${libdir}/fs/**/[a-z]*fsimage.so \
     ${libdir}/xenfsimage/**/fsimage.so \
     "
 
-FILES_${PN}-init-xenstore-dom = "${libdir}/xen/bin/init-xenstore-domain"
+FILES:${PN}-init-xenstore-dom = "${libdir}/xen/bin/init-xenstore-domain"
 
-FILES_${PN} = "\
+FILES:${PN} = "\
     ${sysconfdir}/xen/auto \
     ${sysconfdir}/xen/cpupool \
     ${localstatedir}/xen/dump \
     "
 
-FILES_${PN}-console = "\
+FILES:${PN}-console = "\
     ${libdir}/xen/bin/xenconsole \
     ${sbindir}/xenconsoled \
     "
 
-FILES_${PN}-cpuid = "\
+FILES:${PN}-cpuid = "\
     ${bindir}/xen-cpuid \
     "
 
-FILES_${PN}-devd = "\
+FILES:${PN}-devd = "\
     ${sysconfdir}/init.d/xendriverdomain \
     ${systemd_unitdir}/system/xendriverdomain.service \
     "
 
-FILES_${PN}-flask = "\
+FILES:${PN}-flask = "\
     /boot/xenpolicy-* \
     "
 
-FILES_${PN}-flask-tools = "\
+FILES:${PN}-flask-tools = "\
     ${sbindir}/flask-get-bool \
     ${sbindir}/flask-getenforce \
     ${sbindir}/flask-label-pci \
@@ -429,25 +429,25 @@ FILES_${PN}-flask-tools = "\
     ${sbindir}/flask-setenforce \
     "
 
-FILES_${PN}-gdbsx = "\
+FILES:${PN}-gdbsx = "\
     ${sbindir}/gdbsx \
     "
 
 INSANE_SKIP_${PN}-hvmloader = "arch"
-FILES_${PN}-hvmloader = "\
+FILES:${PN}-hvmloader = "\
     ${libdir}/xen/boot/hvmloader \
     "
 
-FILES_${PN}-kdd = "\
+FILES:${PN}-kdd = "\
     ${sbindir}/kdd \
     ${sbindir}/xen-kdd \
     "
 
-FILES_${PN}-livepatch += " \
+FILES:${PN}-livepatch += " \
     ${sbindir}/xen-livepatch \
     "
 
-FILES_${PN}-misc = "\
+FILES:${PN}-misc = "\
     ${bindir}/xen-detect \
     ${libdir}/xen/bin/depriv-fd-checker \
     ${sbindir}/gtracestat \
@@ -470,22 +470,22 @@ FILES_${PN}-misc = "\
     ${libdir}/xen/bin/convert-legacy-stream \
     "
 
-FILES_${PN}-pygrub = "\
+FILES:${PN}-pygrub = "\
     ${bindir}/pygrub \
     ${libdir}/xen/bin/pygrub \
     "
 
 # Depending on the version of Xen libdir or nonarch libdir is used
-FILES_${PN}-python = "\
+FILES:${PN}-python = "\
     ${libdir}/${PYTHON_DIR} \
     ${nonarch_libdir}/${PYTHON_DIR} \
     "
 
-FILES_${PN}-remus = "\
+FILES:${PN}-remus = "\
     ${sysconfdir}/xen/scripts/remus-netbuf-setup \
     "
 
-FILES_${PN}-scripts-network = " \
+FILES:${PN}-scripts-network = " \
     ${sysconfdir}/xen/scripts/colo-proxy-setup \
     ${sysconfdir}/xen/scripts/network-bridge \
     ${sysconfdir}/xen/scripts/network-nat \
@@ -500,7 +500,7 @@ FILES_${PN}-scripts-network = " \
     ${sysconfdir}/xen/scripts/vif-setup \
     "
 
-FILES_${PN}-scripts-block = " \
+FILES:${PN}-scripts-block = " \
     ${sysconfdir}/xen/scripts/blktap \
     ${sysconfdir}/xen/scripts/block \
     ${sysconfdir}/xen/scripts/block-common.sh \
@@ -513,7 +513,7 @@ FILES_${PN}-scripts-block = " \
     ${sysconfdir}/xen/scripts/vscsi \
     "
 
-FILES_${PN}-scripts-common = " \
+FILES:${PN}-scripts-common = " \
     ${sysconfdir}/xen/scripts/external-device-migrate \
     ${sysconfdir}/xen/scripts/hotplugpath.sh \
     ${sysconfdir}/xen/scripts/locking.sh \
@@ -525,58 +525,58 @@ FILES_${PN}-scripts-common = " \
     "
 
 INSANE_SKIP_${PN}-shim = "arch"
-FILES_${PN}-shim = " \
+FILES:${PN}-shim = " \
     ${libdir}/xen/boot/xen-shim \
     "
 
-FILES_${PN}-ucode = "\
+FILES:${PN}-ucode = "\
     ${sbindir}/xen-ucode \
     "
 
-FILES_${PN}-vchan = "\
+FILES:${PN}-vchan = "\
     ${bindir}/vchan-socket-proxy \
     "
 
-FILES_${PN}-volatiles = "\
+FILES:${PN}-volatiles = "\
     ${sysconfdir}/default/volatiles/99_xen \
     ${sysconfdir}/tmpfiles.d/xen.conf \
     "
 
-FILES_${PN}-xcutils = "\
+FILES:${PN}-xcutils = "\
     ${libdir}/xen/bin/lsevtchn \
     ${libdir}/xen/bin/readnotes \
     ${libdir}/xen/bin/xc_restore \
     ${libdir}/xen/bin/xc_save \
     "
 
-FILES_${PN}-xencov = "\
+FILES:${PN}-xencov = "\
     ${sbindir}/xencov \
     "
 
-FILES_${PN}-xend-examples = "\
+FILES:${PN}-xend-examples = "\
     ${sysconfdir}/xen/xend-config.sxp \
     ${sysconfdir}/xen/xend-pci-permissive.sxp \
     ${sysconfdir}/xen/xend-pci-quirks.sxp \
     "
 
-FILES_${PN}-xenhypfs = "\
+FILES:${PN}-xenhypfs = "\
     ${sbindir}/xenhypfs \
     "
 
-FILES_${PN}-xenpaging = "\
+FILES:${PN}-xenpaging = "\
     ${libdir}/xen/bin/xenpaging \
     ${localstatedir}/lib/xen/xenpaging \
     "
 
-FILES_${PN}-xenpmd = "\
+FILES:${PN}-xenpmd = "\
     ${sbindir}/xenpmd \
     "
 
-FILES_${PN}-xenstat = "\
+FILES:${PN}-xenstat = "\
     ${sbindir}/xentop \
     "
 
-FILES_${PN}-xenstore = "\
+FILES:${PN}-xenstore = "\
     ${bindir}/xenstore \
     ${bindir}/xenstore-chmod \
     ${bindir}/xenstore-control \
@@ -589,12 +589,12 @@ FILES_${PN}-xenstore = "\
     ${bindir}/xenstore-write \
     "
 
-FILES_${PN}-xenstored = "\
+FILES:${PN}-xenstored = "\
     ${sbindir}/xenstored \
     ${localstatedir}/lib/xenstored \
     "
 
-FILES_${PN}-xentrace = "\
+FILES:${PN}-xentrace = "\
     ${bindir}/xentrace \
     ${bindir}/xentrace_setsize \
     ${libdir}/xen/bin/xenctx \
@@ -604,13 +604,13 @@ FILES_${PN}-xentrace = "\
     ${sbindir}/xentrace_setmask \
     "
 
-FILES_${PN}-xen-watchdog = "\
+FILES:${PN}-xen-watchdog = "\
     ${sbindir}/xenwatchdogd \
     ${sysconfdir}/init.d/xen-watchdog \
     ${systemd_unitdir}/system/xen-watchdog.service \
     "
 
-FILES_${PN}-xl = "\
+FILES:${PN}-xl = "\
     ${sysconfdir}/bash_completion.d/xl.sh \
     ${sysconfdir}/bash_completion.d/xl \
     ${sysconfdir}/xen/xl.conf \
@@ -619,13 +619,13 @@ FILES_${PN}-xl = "\
     ${libdir}/xen/bin/xen-init-dom0 \
     "
 
-FILES_${PN}-xl-examples = "\
+FILES:${PN}-xl-examples = "\
     ${sysconfdir}/xen/xlexample.hvm \
     ${sysconfdir}/xen/xlexample.pvlinux \
     ${sysconfdir}/xen/xlexample.pvhlinux \
     "
 
-FILES_${PN}-xm-examples = "\
+FILES:${PN}-xm-examples = "\
     ${sysconfdir}/xen/xmexample1 \
     ${sysconfdir}/xen/xmexample2 \
     ${sysconfdir}/xen/xmexample3 \
@@ -636,19 +636,19 @@ FILES_${PN}-xm-examples = "\
     ${sysconfdir}/xen/xmexample.vti \
     "
 
-FILES_${PN}-xenmon = "\
+FILES:${PN}-xenmon = "\
     ${sbindir}/xenbaked \
     ${sbindir}/xenmon.py \
     ${sbindir}/xenmon \
     "
 
-FILES_${PN}-xm = "\
+FILES:${PN}-xm = "\
     ${sysconfdir}/xen/xm-config.xml \
     ${datadir}/xen/create.dtd \
     ${sbindir}/xm \
     "
 
-FILES_${PN}-xencommons += "\
+FILES:${PN}-xencommons += "\
     ${sysconfdir}/default/xencommons \
     ${sysconfdir}/init.d/xencommons \
     ${sysconfdir}/xen/scripts/launch-xenstore \
@@ -661,23 +661,23 @@ FILES_${PN}-xencommons += "\
     ${systemd_unitdir}/system/var-lib-xenstored.mount \
     "
 
-FILES_${PN}-xend += " \
+FILES:${PN}-xend += " \
     ${sysconfdir}/init.d/xend \
     ${sbindir}/xend \
     "
 
-FILES_${PN}-xendomains += "\
+FILES:${PN}-xendomains += "\
     ${libdir}/xen/bin/xendomains \
     ${sysconfdir}/default/xendomains \
     ${sysconfdir}/init.d/xendomains \
     ${sysconfdir}/sysconfig/xendomains \
     ${systemd_unitdir}/system/xendomains.service \
     "
-FILES_${PN}-xen-access += "\
+FILES:${PN}-xen-access += "\
     ${sbindir}/xen-access \
     "
 
-FILES_${PN}-xen-memshare += "\
+FILES:${PN}-xen-memshare += "\
     ${sbindir}/xen-memshare \
     "
 
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 3438034..277c8f4 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -118,8 +118,8 @@ EXTRA_CFLAGS_XEN_TOOLS="${HOST_CC_ARCH} ${CFLAGS}"
 CC_arm="${CCACHE}${HOST_PREFIX}gcc ${TUNE_CCARGS} ${TOOLCHAIN_OPTIONS} ${CC_REPRODUCIBLE_OPTIONS}"
 
 # There are no Xen-provided variables for C++, so append to the tool variables:
-CPP_append = " ${CPPFLAGS}"
-CXX_append = " ${CXXFLAGS}"
+CPP:append = " ${CPPFLAGS}"
+CXX:append = " ${CXXFLAGS}"
 
 EXTRA_OECONF += " \
     --exec-prefix=${prefix} \
@@ -193,7 +193,7 @@ do_post_patch() {
     fi
 }
 
-do_post_patch_append_arm()  {
+do_post_patch:append:arm()  {
     # The hypervisor binary must not be built with the hard floating point ABI.
     echo "CC := \$(filter-out ${TUNE_CCARGS},\$(CC))" >> ${S}/xen/arch/arm/Rules.mk
     echo "CPP := \$(filter-out ${TUNE_CCARGS},\$(CPP))" >> ${S}/xen/arch/arm/Rules.mk
@@ -229,13 +229,13 @@ do_configure_common() {
                PYTHON="${PYTHON}"
 }
 
-do_compile_prepend() {
+do_compile:prepend() {
     # workaround for build bug when CFLAGS is exported
     # https://www.mail-archive.com/xen-devel@lists.xen.org/msg67822.html
     unset CFLAGS
 }
 
-do_install_prepend() {
+do_install:prepend() {
     # CFLAGS is used to set PY_CFLAGS which affects the pygrub install
     # so also need to unset CFLAGS here:
     unset CFLAGS
diff --git a/recipes-extended/xen/xtf_git.bb b/recipes-extended/xen/xtf_git.bb
index bf7470e..9a669e3 100644
--- a/recipes-extended/xen/xtf_git.bb
+++ b/recipes-extended/xen/xtf_git.bb
@@ -20,7 +20,7 @@ inherit python3native
 
 PACKAGES = "${PN}"
 
-FILES_${PN} = " \
+FILES:${PN} = " \
     ${libexecdir}/* \
     "
 
diff --git a/recipes-extended/xvisor/xvisor_git.bb b/recipes-extended/xvisor/xvisor_git.bb
index 831c943..130b0d5 100644
--- a/recipes-extended/xvisor/xvisor_git.bb
+++ b/recipes-extended/xvisor/xvisor_git.bb
@@ -25,7 +25,7 @@ do_configure() {
     oe_runmake ${CONFIG}
 }
 
-do_install_append() {
+do_install:append() {
     install -d ${D}
     install -m 755 ${B}/build/vmm.* ${D}/
 
@@ -44,8 +44,8 @@ do_deploy () {
 
 addtask deploy after do_install
 
-FILES_${PN} += "/vmm.*"
-FILES_${PN} += "/*.dtb"
+FILES:${PN} += "/vmm.*"
+FILES:${PN} += "/*.dtb"
 
 COMPATIBLE_HOST = "(aarch64|riscv64|riscv32).*"
 INHIBIT_PACKAGE_STRIP = "1"
diff --git a/recipes-graphics/xorg-xserver/xserver-xorg_xen.inc b/recipes-graphics/xorg-xserver/xserver-xorg_xen.inc
index 9503404..a2d913e 100644
--- a/recipes-graphics/xorg-xserver/xserver-xorg_xen.inc
+++ b/recipes-graphics/xorg-xserver/xserver-xorg_xen.inc
@@ -10,4 +10,4 @@ XEN_REMOVED_OPENGL_PKGCONFIGS_x86-64 = ""
 
 REMOVED_OPENGL_PKGCONFIGS ?= "${@bb.utils.contains('DISTRO_FEATURES', 'xen', "${XEN_REMOVED_OPENGL_PKGCONFIGS}", '', d)}"
 
-OPENGL_PKGCONFIGS_remove = "${REMOVED_OPENGL_PKGCONFIGS}"
+OPENGL_PKGCONFIGS:remove = "${REMOVED_OPENGL_PKGCONFIGS}"
diff --git a/recipes-kernel/dtc/python3-dtc_1.6.1.bb b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
index 9088931..3929565 100644
--- a/recipes-kernel/dtc/python3-dtc_1.6.1.bb
+++ b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
@@ -20,7 +20,7 @@ inherit distutils3
 
 DISTUTILS_SETUP_PATH = "${S}/pylibfdt"
 
-do_configure_prepend() {
+do_configure:prepend() {
     oe_runmake -C "${S}" version_gen.h
     mv "${S}/version_gen.h" "${DISTUTILS_SETUP_PATH}/"
 }
diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/recipes-kernel/linux/linux-yocto_virtualization.inc
index 321dda2..d2227ea 100644
--- a/recipes-kernel/linux/linux-yocto_virtualization.inc
+++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/linux-yocto:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/linux-yocto:"
 
 SRC_URI += "file://xt-checksum.scc \
             file://ebtables.scc \
@@ -7,15 +7,15 @@ SRC_URI += "file://xt-checksum.scc \
             file://docker.scc \
 	    file://cgroup-hugetlb.scc \
 	    "
-KERNEL_FEATURES_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'kvm', 'features/kvm/qemu-kvm-enable.scc', '', d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'kvm', 'features/kvm/qemu-kvm-enable.scc', '', d)}"
 
 KERNEL_MODULE_AUTOLOAD += "nf_conntrack_ipv6 openvswitch"
 KERNEL_MODULE_AUTOLOAD += "${@bb.utils.contains('DISTRO_FEATURES', 'kvm', 'kvm', '', d)}"
 
 # aufs kernel support required for xen-image-minimal
-KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
+KERNEL_FEATURES:append += "${@bb.utils.contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
 
-KERNEL_FEATURES_append = " cfg/virtio.scc"
+KERNEL_FEATURES:append = " cfg/virtio.scc"
 
 # xen kernel support
 SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
diff --git a/recipes-kernel/lopper/lopper.bb b/recipes-kernel/lopper/lopper.bb
index 274d5b9..ae280ee 100644
--- a/recipes-kernel/lopper/lopper.bb
+++ b/recipes-kernel/lopper/lopper.bb
@@ -9,7 +9,7 @@ S = "${WORKDIR}/git"
 
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=8e5f5f691f01c9fdfa7a7f2d535be619"
 
-RDEPENDS_${PN} = " \
+RDEPENDS:${PN} = " \
     python3-core \
     python3-dtc \
     python3-humanfriendly \
diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index ece5142..62523bc 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -65,10 +65,10 @@ do_install() {
     ln -sf ${libexecdir}/cni/ ${D}/opt/cni/bin
 }
 
-FILES_${PN} += "${libexecdir}/cni/* /opt/cni/bin"
+FILES:${PN} += "${libexecdir}/cni/* /opt/cni/bin"
 
 INSANE_SKIP_${PN} += "ldflags already-stripped"
 
 deltask compile_ptest_base
 
-RDEPENDS_${PN} += " ca-certificates"
+RDEPENDS:${PN} += " ca-certificates"
diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
index 37fbe5a..52cc58e 100644
--- a/recipes-networking/openvswitch/openvswitch.inc
+++ b/recipes-networking/openvswitch/openvswitch.inc
@@ -13,18 +13,18 @@ LICENSE = "Apache-2"
 
 DEPENDS += "bridge-utils openssl python3 perl python3-six-native coreutils-native"
 
-RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid coreutils \
+RDEPENDS:${PN} += "util-linux-uuidgen util-linux-libuuid coreutils \
         python3 perl perl-module-strict ${PN}-switch \
         bash python3-twisted python3-six"
-RDEPENDS_${PN}-testcontroller = "${PN} ${PN}-pki"
-RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
-RDEPENDS_${PN}-pki = "${PN}"
-RDEPENDS_${PN}-brcompat = "${PN} ${PN}-switch"
+RDEPENDS:${PN}-testcontroller = "${PN} ${PN}-pki"
+RDEPENDS:${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
+RDEPENDS:${PN}-pki = "${PN}"
+RDEPENDS:${PN}-brcompat = "${PN} ${PN}-switch"
 
 # Some installers will fail because of an install order based on
 # rdeps.  E.g. ovs-pki calls sed in the postinstall.  sed may be
 # queued for install later.
-RDEPENDS_${PN} += "sed gawk grep"
+RDEPENDS:${PN} += "sed gawk grep"
 
 SRC_URI = "\
 	file://openvswitch-switch \
@@ -48,16 +48,16 @@ CONFIGUREOPT_DEPTRACK = ""
 ALLOW_EMPTY_${PN}-pki = "1"
 PACKAGES =+ "${PN}-testcontroller ${PN}-switch ${PN}-brcompat ${PN}-pki"
 
-FILES_${PN}-testcontroller = "\
+FILES:${PN}-testcontroller = "\
 	${sysconfdir}/init.d/openvswitch-testcontroller \
 	${sysconfdir}/default/openvswitch-testcontroller \
 	${sysconfdir}/openvswitch-testcontroller \
 	${bindir}/ovs-testcontroller \
 	"
 
-FILES_${PN}-brcompat = "${sbindir}/ovs-brcompatd"
+FILES:${PN}-brcompat = "${sbindir}/ovs-brcompatd"
 
-FILES_${PN}-switch = "\
+FILES:${PN}-switch = "\
 	${sysconfdir}/init.d/openvswitch-switch \
 	${sysconfdir}/default/openvswitch-switch \
 	${systemd_unitdir}/system/ovs-vswitchd.service \
@@ -68,10 +68,10 @@ FILES_${PN}-switch = "\
 	"
 
 # silence a warning
-FILES_${PN} += "${datadir}/ovsdbmonitor"
-FILES_${PN} += "/run"
+FILES:${PN} += "${datadir}/ovsdbmonitor"
+FILES:${PN} += "/run"
 
-FILES_${PN} += "${libdir}/python${PYTHON_BASEVERSION}/"
+FILES:${PN} += "${libdir}/python${PYTHON_BASEVERSION}/"
 inherit autotools update-rc.d systemd python3native
 
 SYSTEMD_PACKAGES = "${PN}-switch"
@@ -82,19 +82,19 @@ SYSTEMD_SERVICE_${PN}-switch = " \
 "
 
 INITSCRIPT_PACKAGES = "${PN}-switch ${PN}-testcontroller"
-INITSCRIPT_NAME_${PN}-switch = "openvswitch-switch"
-INITSCRIPT_PARAMS_${PN}-switch = "defaults 71"
+INITSCRIPT_NAME:${PN}-switch = "openvswitch-switch"
+INITSCRIPT_PARAMS:${PN}-switch = "defaults 71"
 
-INITSCRIPT_NAME_${PN}-testcontroller = "openvswitch-testcontroller"
-INITSCRIPT_PARAMS_${PN}-testcontroller = "defaults 72"
+INITSCRIPT_NAME:${PN}-testcontroller = "openvswitch-testcontroller"
+INITSCRIPT_PARAMS:${PN}-testcontroller = "defaults 72"
 
-do_configure_prepend() {
+do_configure:prepend() {
 	# Work around the for Makefile CC=$(if ....) by swapping out any
 	# "-Wa," assembly directives with "-Xassembler
 	CC=`echo '${CC}' | sed 's/-Wa,/-Xassembler /g'`
 }
 
-do_install_prepend() {
+do_install:prepend() {
 	SERVICE_FILE="${S}/rhel/usr_lib_systemd_system_ovs-vswitchd.service"
 	${S}/build-aux/dpdkstrip.py \
 	    ${@bb.utils.contains('PACKAGECONFIG','dpdk','--dpdk','--nodpdk',d)} \
@@ -102,7 +102,7 @@ do_install_prepend() {
 	    > ${SERVICE_FILE}
 }
 
-do_install_append() {
+do_install:append() {
 	install -d ${D}/${sysconfdir}/default/
 	install -m 660 ${WORKDIR}/openvswitch-switch-setup ${D}/${sysconfdir}/default/openvswitch-switch
 	install -d ${D}/${sysconfdir}/openvswitch-testcontroller
@@ -137,13 +137,13 @@ do_install_append() {
 	cp -r ${S}/python/ovstest/ ${D}${libdir}/python${PYTHON_BASEVERSION}/site-packages/
 }
 
-pkg_postinst_ontarget_${PN}-pki () {
+pkg_postinst_ontarget:${PN}-pki () {
 	if test ! -d $D/${datadir}/${PN}/pki; then
 		ovs-pki init --dir=$D/${datadir}/${PN}/pki
 	fi
 }
 
-pkg_postinst_ontarget_${PN}-testcontroller () {
+pkg_postinst_ontarget:${PN}-testcontroller () {
 	if test ! -d $D/${datadir}/${PN}/pki; then
 		ovs-pki init --dir=$D/${datadir}/${PN}/pki
 	fi
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 616bc27..412a707 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -4,7 +4,7 @@ DEPENDS += "virtual/kernel"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-RDEPENDS_${PN}-ptest += "\
+RDEPENDS:${PN}-ptest += "\
 	python3-logging python3-syslog python3-io python3-core \
 	python3-fcntl python3-shell python3-xml python3-math \
 	python3-datetime python3-netclient python3 sed \
@@ -17,7 +17,7 @@ S = "${WORKDIR}/git"
 PV = "2.15+${SRCPV}"
 CVE_VERSION = "2.13.0"
 
-FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
+FILESEXTRAPATHS:append := "${THISDIR}/${PN}-git:"
 
 SRCREV = "8dc1733eaea866dce033b3c44853e1b09bf59fc7"
 SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.15 \
@@ -45,7 +45,7 @@ PACKAGECONFIG[ssl] = ",--disable-ssl,openssl,"
 # EXTRA_OECONF += "--with-linux=${STAGING_KERNEL_BUILDDIR} --with-linux-source=${STAGING_KERNEL_DIR} KARCH=${TARGET_ARCH}"
 
 # silence a warning
-FILES_${PN} += "/lib/modules"
+FILES:${PN} += "/lib/modules"
 
 inherit ptest
 
@@ -55,6 +55,6 @@ do_install_ptest() {
 	oe_runmake test-install
 }
 
-do_install_append() {
+do_install:append() {
 	oe_runmake modules_install INSTALL_MOD_PATH=${D}
 }
-- 
2.25.1

