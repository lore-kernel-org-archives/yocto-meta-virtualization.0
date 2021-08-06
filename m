Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web09.3109.1628245628300416520
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Aug 2021 03:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hbJ2KykY;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id hw6so14340853ejc.10
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Aug 2021 03:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mrIaipjRfwmZW7GCEXADU6kSVpSBUcid7/iv3qqHqPk=;
        b=hbJ2KykYhFQnGDSy/8QIE2vq+XbAs8O1ro2kNuM15tzL+NmsPJzmzGCAy6mCqXEa5n
         9s3rPFlSzIqtGTirYNXKhra+RmMp6lVhvpw0HYUg5fO+aiI8k9/nLhHyLkVuuTFUDHse
         mhMRgGVsDC2e2bYbN2/EGFahLLyMiTj26NIQCbXX99zLrKNO0WQXDToQIG376a7jhaAi
         DNRRgwFoh4ER6aHc+RxGWKKM67o2tRPDZvhSF629bMv/Bb3AEXAnyAgA6aNu6qvI1L+I
         2sVpGYxT5Er9CsOBBndxoJZ3OLP95Jc4RclrQq96oesHOSLtgoSEW2iGii/sfkp+TXHP
         7IBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mrIaipjRfwmZW7GCEXADU6kSVpSBUcid7/iv3qqHqPk=;
        b=HUsZTDBDu7XEPZHiqSZXQSAVtCdVdzUKn2ZUU9eP6FjWvFLYvGR6Uxx+dD9D4wnoHN
         heNTL6PRFQITw+c6aDJl8Z7/N2D6u3+pikHPvDtTtxEe+R4FubMgmvbuor6jf7jaGtyM
         q4PBrVl5MR9/n7uiXhbjKFdQ0TKhhRSLbWfyLjpcsgX6szQuYCvg2NnP0DuUS/5gOAwu
         MHG/CRgPfvzZTPBIpfzOtoXcIWU9TSahgZDELv6sagLLYkQyXTmvdqgEjZIrzMKtu/KE
         u5JsCUmpONfdtk9KD9VAAYtHGkVamLpR05mVnSaav+W4FVoQsihh8XzezRBNbOLUQMVD
         Mjfg==
X-Gm-Message-State: AOAM530ydh2TuypepfAkDydyXUT22mXO36Iy7m8NvBfrA4JvxJvcgUng
	mDsRqoQYcP6RkmMCK4PbiBqLw001r5yhqGeePqQ=
X-Google-Smtp-Source: ABdhPJzECsvgd4d/llCv0wLGn/PyEjOtq3OvG8oUofWS1c8nv3KYF290I94WKvevWOjFEm38u0JpPFkiH0SWY/dqO7A=
X-Received: by 2002:a17:907:990d:: with SMTP id ka13mr9192308ejc.392.1628245626629;
 Fri, 06 Aug 2021 03:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <1628243117-8646-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1628243117-8646-1-git-send-email-wangmy@fujitsu.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 6 Aug 2021 12:26:55 +0200
Message-ID: <CA+chaQeL1w7MOteT_7qdd0sO-BynfQugciuiQNsNze82qaAnfQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] Convert to new override syntax
To: wangmy <wangmy@fujitsu.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000002eb10405c8e17ac8"

--0000000000002eb10405c8e17ac8
Content-Type: text/plain; charset="UTF-8"

See master-next branch which already contains most of these changes (if not
all).

On Fri, Aug 6, 2021 at 11:45 AM wangmy <wangmy@fujitsu.com> wrote:

>     This is the result of automated script (0.9.1) conversion:
>
>     oe-core/scripts/contrib/convert-overrides.py .
>
>     converting the metadata to use ":" as the override character instead
> of "_".
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  README                                        |   2 +-
>  classes/cni_networking.bbclass                |   8 +-
>  classes/qemuboot-xen-defaults.bbclass         |   2 +-
>  conf/distro/include/meta-virt-xen.inc         |   6 +-
>  conf/layer.conf                               |   8 +-
>  recipes-containers/lxc/lxc_4.0.9.bb           |  36 ++--
>  recipes-extended/libvirt/libvirt_7.2.0.bb     |  48 ++---
>  .../nagios/nagios-plugins_2.2.1.bb            |   6 +-
>  recipes-extended/seabios/seabios_1.14.0.bb    |   2 +-
>  recipes-extended/upx/upx_git.bb               |   2 +-
>  recipes-extended/vgabios/biossums_0.7a.bb     |   2 +-
>  recipes-extended/vgabios/vgabios_0.7a.bb      |   4 +-
>  recipes-extended/xen/xen-blktap.inc           |  16 +-
>  recipes-extended/xen/xen-hypervisor.inc       |   6 +-
>  recipes-extended/xen/xen-tools.inc            | 164 +++++++++---------
>  recipes-extended/xen/xen.inc                  |  10 +-
>  recipes-extended/xen/xtf_git.bb               |   2 +-
>  recipes-extended/xvisor/xvisor_git.bb         |   6 +-
>  .../xorg-xserver/xserver-xorg_xen.inc         |   2 +-
>  recipes-kernel/dtc/python3-dtc_1.6.1.bb       |   2 +-
>  .../linux/linux-yocto_virtualization.inc      |   8 +-
>  recipes-kernel/lopper/lopper.bb               |   2 +-
>  recipes-networking/cni/cni_git.bb             |   4 +-
>  .../openvswitch/openvswitch.inc               |  42 ++---
>  .../openvswitch/openvswitch_git.bb            |   8 +-
>  25 files changed, 199 insertions(+), 199 deletions(-)
>
> diff --git a/README b/README
> index a0fb466..1c75f4a 100644
> --- a/README
> +++ b/README
> @@ -8,7 +8,7 @@ The bbappend files for some recipes (e.g. linux-yocto) in
> this layer need to
>  have 'virtualization' in DISTRO_FEATURES to have effect. To enable them,
> add
>  in configuration file the following line.
>
> -  DISTRO_FEATURES_append = " virtualization"
> +  DISTRO_FEATURES:append = " virtualization"
>
>  If meta-virtualization is included, but virtualization is not enabled as a
>  distro feature a warning is printed at parse time:
> diff --git a/classes/cni_networking.bbclass
> b/classes/cni_networking.bbclass
> index 9df02b8..054c0ae 100644
> --- a/classes/cni_networking.bbclass
> +++ b/classes/cni_networking.bbclass
> @@ -1,12 +1,12 @@
> -DEPENDS_append_class-target = " cni"
> +DEPENDS:append:class-target = " cni"
>
> -PACKAGES_prepend = "${PN}-cni "
> +PACKAGES:prepend = "${PN}-cni "
>
> -FILES_${PN}-cni = "${sysconfdir}/cni/net.d/*"
> +FILES:${PN}-cni = "${sysconfdir}/cni/net.d/*"
>
>  RDEPENDS_${PN}-cni = "cni"
>
> -do_install_append() {
> +do_install:append() {
>      if [ -z "${CNI_NETWORKING_FILES}" ]; then
>         bbfatal "cni-networking was inherited, but no networking
> configuration was provided via CNI_NETWORKING_FILES"
>      fi
> diff --git a/classes/qemuboot-xen-defaults.bbclass
> b/classes/qemuboot-xen-defaults.bbclass
> index 67751d3..591b452 100644
> --- a/classes/qemuboot-xen-defaults.bbclass
> +++ b/classes/qemuboot-xen-defaults.bbclass
> @@ -12,7 +12,7 @@ QB_XEN_DOMAIN_MODULES ??=
> "${DOM0_KERNEL}:${DOM0_KERNEL_LOAD_ADDR}:multiboot,ker
>
>  # Qemuboot for 64-bit Arm uses the QB_DEFAULT_KERNEL method to load Xen
>  # and the device loader option for the dom0 kernel:
> -QB_OPT_APPEND_append_aarch64 = " \
> +QB_OPT_APPEND:append:aarch64 = " \
>      -device loader,file=${DOM0_KERNEL},addr=${DOM0_KERNEL_LOAD_ADDR} \
>      "
>  QB_DEFAULT_KERNEL_aarch64 = "xen-${MACHINE}"
> diff --git a/conf/distro/include/meta-virt-xen.inc
> b/conf/distro/include/meta-virt-xen.inc
> index 2becba1..744f3fe 100644
> --- a/conf/distro/include/meta-virt-xen.inc
> +++ b/conf/distro/include/meta-virt-xen.inc
> @@ -1,9 +1,9 @@
>  # Make sure Xen mode is enabled in qemu
> -PACKAGECONFIG_append_pn-qemu = " xen"
> +PACKAGECONFIG:append:pn-qemu = " xen"
>
>  # For builds for ARM platforms, enable fdt
> -PACKAGECONFIG_append_pn-qemu_arm = " fdt"
> -PACKAGECONFIG_append_pn-qemu_aarch64 = " fdt"
> +PACKAGECONFIG:append:pn-qemu_arm = " fdt"
> +PACKAGECONFIG:append:pn-qemu_aarch64 = " fdt"
>
>  # Xen on Raspberry Pi 4 64-bit support
>  XEN_RPI4_64_CONFIG_PATH ??= \
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 43873c2..7cf7084 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -22,7 +22,7 @@ BBFILES_DYNAMIC += " \
>  # cause compatibility issues with other layers
>  LAYERVERSION_virtualization-layer = "1"
>  LAYERSERIES_COMPAT_virtualization-layer = "hardknott honister"
> -LAYERDEPENDS_virtualization-layer = " \
> +LAYERDEPENDS:virtualization-layer = " \
>      core \
>      openembedded-layer \
>      networking-layer \
> @@ -54,8 +54,8 @@ INHERIT += "sanity-meta-virt"
>  META_VIRT_CONFIG_PATH =
> "${LAYERDIR}/conf/distro/include/meta-virt-default-versions.inc"
>  META_VIRT_XEN_CONFIG_PATH =
> "${LAYERDIR}/conf/distro/include/meta-virt-xen.inc"
>  K8S_CONFIG_PATH = "${LAYERDIR}/conf/distro/include/k8s-versions.inc"
> -USER_CLASSES_append = " meta-virt-cfg"
> -USER_CLASSES_append = " meta-virt-k8s-cfg"
> -USER_CLASSES_append = " meta-virt-xen-cfg"
> +USER_CLASSES:append = " meta-virt-cfg"
> +USER_CLASSES:append = " meta-virt-k8s-cfg"
> +USER_CLASSES:append = " meta-virt-xen-cfg"
>
>  HOSTTOOLS_NONFATAL += "getent"
> diff --git a/recipes-containers/lxc/lxc_4.0.9.bb b/recipes-containers/lxc/
> lxc_4.0.9.bb
> index 7907291..22bf45e 100644
> --- a/recipes-containers/lxc/lxc_4.0.9.bb
> +++ b/recipes-containers/lxc/lxc_4.0.9.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =
> "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c
>  "
>
>  DEPENDS = "libxml2 libcap"
> -RDEPENDS_${PN} = " \
> +RDEPENDS:${PN} = " \
>                 rsync \
>                 curl \
>                 gzip \
> @@ -30,11 +30,11 @@ RDEPENDS_${PN} = " \
>                 util-linux-getopt \
>  "
>
> -RDEPENDS_${PN}_append_libc-glibc = " glibc-utils"
> +RDEPENDS:${PN}:append:libc-glibc = " glibc-utils"
>
> -RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls bash libgcc"
> +RDEPENDS:${PN}-ptest += "file make gmp nettle gnutls bash libgcc"
>
> -RDEPENDS_${PN}-networking += "iptables"
> +RDEPENDS:${PN}-networking += "iptables"
>
>  SRC_URI = "
> http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
>         file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
> @@ -96,25 +96,25 @@ SYSTEMD_SERVICE_${PN}-networking = "lxc-net.service"
>  SYSTEMD_AUTO_ENABLE_${PN}-networking = "enable"
>
>  INITSCRIPT_PACKAGES = "${PN} ${PN}-networking"
> -INITSCRIPT_NAME_${PN} = "lxc-containers"
> -INITSCRIPT_PARAMS_${PN} = "defaults"
> -INITSCRIPT_NAME_${PN}-networking = "lxc-net"
> -INITSCRIPT_PARAMS_${PN}-networking = "defaults"
> +INITSCRIPT_NAME:${PN} = "lxc-containers"
> +INITSCRIPT_PARAMS:${PN} = "defaults"
> +INITSCRIPT_NAME:${PN}-networking = "lxc-net"
> +INITSCRIPT_PARAMS:${PN}-networking = "defaults"
>
> -FILES_${PN}-doc = "${mandir} ${infodir}"
> +FILES:${PN}-doc = "${mandir} ${infodir}"
>  # For LXC the docdir only contains example configuration files and should
> be included in the lxc package
> -FILES_${PN} += "${docdir}"
> -FILES_${PN} += "${libdir}/python3*"
> -FILES_${PN} += "${datadir}/bash-completion"
> -FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
> -FILES_${PN}-dbg += "${libexecdir}/lxc/hooks/.debug"
> +FILES:${PN} += "${docdir}"
> +FILES:${PN} += "${libdir}/python3*"
> +FILES:${PN} += "${datadir}/bash-completion"
> +FILES:${PN}-dbg += "${libexecdir}/lxc/.debug"
> +FILES:${PN}-dbg += "${libexecdir}/lxc/hooks/.debug"
>  PACKAGES =+ "${PN}-templates ${PN}-networking ${PN}-lua"
>  FILES_lua-${PN} = "${datadir}/lua ${libdir}/lua"
>  FILES_lua-${PN}-dbg += "${libdir}/lua/lxc/.debug"
> -FILES_${PN}-templates += "${datadir}/lxc/templates"
> -RDEPENDS_${PN}-templates += "bash"
> +FILES:${PN}-templates += "${datadir}/lxc/templates"
> +RDEPENDS:${PN}-templates += "bash"
>
> -FILES_${PN}-networking += " \
> +FILES:${PN}-networking += " \
>      ${sysconfdir}/init.d/lxc-net \
>      ${sysconfdir}/default/lxc-net \
>  "
> @@ -125,7 +125,7 @@ CACHED_CONFIGUREVARS += " \
>      am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
>  "
>
> -do_install_append() {
> +do_install:append() {
>         # The /var/cache/lxc directory created by the Makefile
>         # is wiped out in volatile, we need to create this at boot.
>         rm -rf ${D}${localstatedir}/cache
> diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb
> b/recipes-extended/libvirt/libvirt_7.2.0.bb
> index 19662a7..d86b0a0 100644
> --- a/recipes-extended/libvirt/libvirt_7.2.0.bb
> +++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
> @@ -13,11 +13,11 @@ DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi
> parted curl libpcap util-linux
>
>  # libvirt-guests.sh needs gettext.sh
>  #
> -RDEPENDS_${PN} = "gettext-runtime"
> +RDEPENDS:${PN} = "gettext-runtime"
>
> -RDEPENDS_libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq
> netcat-openbsd ebtables"
> -RDEPENDS_libvirt-libvirtd_append_x86-64 = " dmidecode"
> -RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
> +RDEPENDS:libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq
> netcat-openbsd ebtables"
> +RDEPENDS:libvirt-libvirtd:append:x86-64 = " dmidecode"
> +RDEPENDS:libvirt-libvirtd:append:x86 = " dmidecode"
>
>  #connman blocks the 53 port and libvirtd can't start its DNS service
>  RCONFLICTS_${PN}_libvirtd = "connman"
> @@ -36,12 +36,12 @@ SRC_URI[libvirt.sha256sum] =
> "01f459d0c7ba5009622a628dba1a026200e8f4a299fea783b9
>
>  inherit meson gettext update-rc.d pkgconfig systemd useradd perlnative
>  USERADD_PACKAGES = "${PN}"
> -GROUPADD_PARAM_${PN} = "-r qemu; -r kvm"
> -USERADD_PARAM_${PN} = "-r -g qemu -G kvm qemu"
> +GROUPADD_PARAM:${PN} = "-r qemu; -r kvm"
> +USERADD_PARAM:${PN} = "-r -g qemu -G kvm qemu"
>
>
>  EXTRA_OEMESON += "--cross-file ${WORKDIR}/meson-${PN}.cross"
> -do_write_config_append() {
> +do_write_config:append() {
>      cat >${WORKDIR}/meson-${PN}.cross <<EOF
>  [binaries]
>  iptables = '/usr/sbin/iptables'
> @@ -58,7 +58,7 @@ PACKAGES =+ "${PN}-libvirtd ${PN}-virsh"
>
>  ALLOW_EMPTY_${PN}-libvirtd = "1"
>
> -FILES_${PN}-libvirtd = " \
> +FILES:${PN}-libvirtd = " \
>         ${sysconfdir}/init.d \
>         ${sysconfdir}/sysctl.d \
>         ${sysconfdir}/logrotate.d \
> @@ -70,12 +70,12 @@ FILES_${PN}-libvirtd = " \
>         ${@bb.utils.contains('PACKAGECONFIG', 'gnutls',
> '${sysconfdir}/pki/libvirt/* ${sysconfdir}/pki/CA/*', '', d)} \
>          "
>
> -FILES_${PN}-virsh = " \
> +FILES:${PN}-virsh = " \
>      ${bindir}/virsh \
>      ${datadir}/bash-completion/completions/virsh \
>  "
>
> -FILES_${PN} += "${libdir}/libvirt/connection-driver \
> +FILES:${PN} += "${libdir}/libvirt/connection-driver \
>             ${datadir}/augeas \
>             ${@bb.utils.contains('PACKAGECONFIG', 'polkit',
> '${datadir}/polkit-1', '', d)} \
>             ${datadir}/bash-completion/completions/vsh \
> @@ -83,24 +83,24 @@ FILES_${PN} += "${libdir}/libvirt/connection-driver \
>             /usr/lib/firewalld/zones/libvirt.xml \
>             "
>
> -FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug
> ${libdir}/libvirt/lock-driver/.debug"
> -FILES_${PN}-staticdev += "${libdir}/*.a
> ${libdir}/libvirt/connection-driver/*.a ${libdir}/libvirt/lock-driver/*.a"
> +FILES:${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug
> ${libdir}/libvirt/lock-driver/.debug"
> +FILES:${PN}-staticdev += "${libdir}/*.a
> ${libdir}/libvirt/connection-driver/*.a ${libdir}/libvirt/lock-driver/*.a"
>
> -CONFFILES_${PN} += "${sysconfdir}/libvirt/libvirt.conf \
> +CONFFILES:${PN} += "${sysconfdir}/libvirt/libvirt.conf \
>                      ${sysconfdir}/libvirt/lxc.conf \
>                      ${sysconfdir}/libvirt/qemu-lockd.conf \
>                      ${sysconfdir}/libvirt/qemu.conf \
>                      ${sysconfdir}/libvirt/virt-login-shell.conf \
>                      ${sysconfdir}/libvirt/virtlockd.conf"
>
> -CONFFILES_${PN}-libvirtd = "${sysconfdir}/logrotate.d/libvirt
> ${sysconfdir}/logrotate.d/libvirt.lxc \
> +CONFFILES:${PN}-libvirtd = "${sysconfdir}/logrotate.d/libvirt
> ${sysconfdir}/logrotate.d/libvirt.lxc \
>                              ${sysconfdir}/logrotate.d/libvirt.qemu
> ${sysconfdir}/logrotate.d/libvirt.uml \
>                              ${sysconfdir}/libvirt/libvirtd.conf \
>                              /usr/lib/sysctl.d/libvirtd.conf"
>
>  INITSCRIPT_PACKAGES = "${PN}-libvirtd"
> -INITSCRIPT_NAME_${PN}-libvirtd = "libvirtd"
> -INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
> +INITSCRIPT_NAME:${PN}-libvirtd = "libvirtd"
> +INITSCRIPT_PARAMS:${PN}-libvirtd = "defaults 72"
>
>  SYSTEMD_PACKAGES = "${PN}-libvirtd"
>  SYSTEMD_SERVICE_${PN}-libvirtd = " \
> @@ -122,12 +122,12 @@ PACKAGECONFIG ??= "gnutls qemu yajl openvz vmware
> vbox esx lxc test remote \
>                    "
>
>  # qemu is NOT compatible with mips64
> -PACKAGECONFIG_remove_mipsarchn32 = "qemu"
> -PACKAGECONFIG_remove_mipsarchn64 = "qemu"
> +PACKAGECONFIG:remove_mipsarchn32 = "qemu"
> +PACKAGECONFIG:remove_mipsarchn64 = "qemu"
>
>  # numactl is NOT compatible with arm
> -PACKAGECONFIG_remove_arm = "numactl"
> -PACKAGECONFIG_remove_armeb = "numactl"
> +PACKAGECONFIG:remove_arm = "numactl"
> +PACKAGECONFIG:remove_armeb = "numactl"
>
>  # enable,disable,depends,rdepends
>  #
> @@ -179,12 +179,12 @@ do_compile() {
>         ninja all
>  }
>
> -do_install_prepend() {
> +do_install:prepend() {
>         # so the install routines can find the libvirt.pc in the source dir
>         export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:${B}/src:"
>  }
>
> -do_install_append() {
> +do_install:append() {
>         install -d ${D}/etc/init.d
>         install -d ${D}/etc/libvirt
>         install -d ${D}/etc/dnsmasq.d
> @@ -313,8 +313,8 @@ EXTRA_OEMESON += " \
>
>  # gcc9 end up mis-compiling qemuxml2argvtest.o with Og which then
>  # crashes on target, so remove -Og and use -O2 as workaround
> -SELECTED_OPTIMIZATION_remove_virtclass-multilib-lib32_mipsarch = "-Og"
> -SELECTED_OPTIMIZATION_append_virtclass-multilib-lib32_mipsarch = " -O2"
> +SELECTED_OPTIMIZATION:remove_virtclass-multilib-lib32_mipsarch = "-Og"
> +SELECTED_OPTIMIZATION:append:virtclass-multilib-lib32_mipsarch = " -O2"
>
>  pkg_postinst_${PN}() {
>          if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
> diff --git a/recipes-extended/nagios/nagios-plugins_2.2.1.bb
> b/recipes-extended/nagios/nagios-plugins_2.2.1.bb
> index b97d80c..f61262e 100644
> --- a/recipes-extended/nagios/nagios-plugins_2.2.1.bb
> +++ b/recipes-extended/nagios/nagios-plugins_2.2.1.bb
> @@ -59,17 +59,17 @@ do_configure() {
>      oe_runconf || die "make failed"
>  }
>
> -do_install_append() {
> +do_install:append() {
>       sed -i '1s,#! /usr/bin/perl -w.*,#! ${bindir}/env perl,'
> ${D}${libdir}/nagios/plugins/*
>  }
>
> -RDEPENDS_${PN} += "\
> +RDEPENDS:${PN} += "\
>      iputils \
>      nagios-base \
>      perl \
>      bash \
>  "
>
> -FILES_${PN} += "${datadir} \
> +FILES:${PN} += "${datadir} \
>                  ${NAGIOS_PLUGIN_DIR} \
>  "
> diff --git a/recipes-extended/seabios/seabios_1.14.0.bb
> b/recipes-extended/seabios/seabios_1.14.0.bb
> index 1591cb6..c13592f 100644
> --- a/recipes-extended/seabios/seabios_1.14.0.bb
> +++ b/recipes-extended/seabios/seabios_1.14.0.bb
> @@ -19,7 +19,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504
>  SRC_URI[md5sum] = "9df3b7de6376850d09161137e7a9b61f"
>  SRC_URI[sha256sum] =
> "eb70cc62b29aa83e10a653233acebf4bb154d00d0c87dc2a2c6e2da75e5e81fd"
>
> -FILES_${PN} = "/usr/share/firmware"
> +FILES:${PN} = "/usr/share/firmware"
>
>  DEPENDS += "util-linux-native file-native bison-native flex-native
> gettext-native acpica-native"
>
> diff --git a/recipes-extended/upx/upx_git.bb b/recipes-extended/upx/
> upx_git.bb
> index 96d2e99..8b13b17 100644
> --- a/recipes-extended/upx/upx_git.bb
> +++ b/recipes-extended/upx/upx_git.bb
> @@ -27,7 +27,7 @@ do_compile() {
>      oe_runmake -C src all
>  }
>
> -do_install_append() {
> +do_install:append() {
>      install -d ${D}${bindir}
>      install -m 755 ${B}/src/upx.out ${D}${bindir}/upx
>  }
> diff --git a/recipes-extended/vgabios/biossums_0.7a.bb
> b/recipes-extended/vgabios/biossums_0.7a.bb
> index e66bade..ef0ef45 100644
> --- a/recipes-extended/vgabios/biossums_0.7a.bb
> +++ b/recipes-extended/vgabios/biossums_0.7a.bb
> @@ -12,7 +12,7 @@ SRC_URI[sha256sum] =
> "9d24c33d4bfb7831e2069cf3644936a53ef3de21d467872b54ce2ea308
>
>  BBCLASSEXTEND = "native"
>
> -FILES_${PN} = "${bindir}/biossums"
> +FILES:${PN} = "${bindir}/biossums"
>
>  S = "${WORKDIR}/vgabios-${PV}"
>
> diff --git a/recipes-extended/vgabios/vgabios_0.7a.bb
> b/recipes-extended/vgabios/vgabios_0.7a.bb
> index 3394173..48a7835 100644
> --- a/recipes-extended/vgabios/vgabios_0.7a.bb
> +++ b/recipes-extended/vgabios/vgabios_0.7a.bb
> @@ -14,8 +14,8 @@ SRC_URI[sha256sum] =
> "9d24c33d4bfb7831e2069cf3644936a53ef3de21d467872b54ce2ea308
>
>  PR = "r0"
>
> -FILES_${PN} = "/usr/share/firmware/${PN}-${PV}*.bin"
> -FILES_${PN}-dbg = "/usr/share/firmware/${PN}-${PV}*.debug.bin"
> +FILES:${PN} = "/usr/share/firmware/${PN}-${PV}*.bin"
> +FILES:${PN}-dbg = "/usr/share/firmware/${PN}-${PV}*.debug.bin"
>
>  S = "${WORKDIR}/${PN}-${PV}"
>
> diff --git a/recipes-extended/xen/xen-blktap.inc
> b/recipes-extended/xen/xen-blktap.inc
> index 5f385dd..7fec159 100644
> --- a/recipes-extended/xen/xen-blktap.inc
> +++ b/recipes-extended/xen/xen-blktap.inc
> @@ -31,34 +31,34 @@ RPROVIDES_${PN}-libblktap = "virtual/libblktap"
>  RPROVIDES_${PN}-libblktapctl = "virtual/libblktapctl"
>  RPROVIDES_${PN}-libvhd = "virtual/libvhd"
>
> -FILES_${PN}-blktap-staticdev += "\
> +FILES:${PN}-blktap-staticdev += "\
>      ${libdir}/libblktapctl.a \
>      ${libdir}/libvhd.a \
>      ${libdir}/libblktap.a \
>      "
>
> -FILES_${PN}-libblktapctl = "${libdir}/libblktapctl.so.*"
> -FILES_${PN}-libblktapctl-dev = " \
> +FILES:${PN}-libblktapctl = "${libdir}/libblktapctl.so.*"
> +FILES:${PN}-libblktapctl-dev = " \
>      ${libdir}/libblktapctl.so \
>      ${libdir}/pkgconfig/xenblktapctl.pc \
>      ${datadir}/pkgconfig/xenblktapctl.pc \
>      "
>
> -FILES_${PN}-libvhd = "${libdir}/libvhd.so.*"
> -FILES_${PN}-libvhd-dev = " \
> +FILES:${PN}-libvhd = "${libdir}/libvhd.so.*"
> +FILES:${PN}-libvhd-dev = " \
>      ${libdir}/libvhd.so \
>      ${libdir}/pkgconfig/vhd.pc \
>      ${datadir}/pkgconfig/vhd.pc \
>      "
>
> -FILES_${PN}-libblktap = "${libdir}/libblktap.so.*"
> -FILES_${PN}-libblktap-dev = " \
> +FILES:${PN}-libblktap = "${libdir}/libblktap.so.*"
> +FILES:${PN}-libblktap-dev = " \
>      ${libdir}/libblktap.so \
>      ${libdir}/pkgconfig/blktap.pc \
>      ${datadir}/pkgconfig/blktap.pc \
>      "
>
> -FILES_${PN}-blktap = "\
> +FILES:${PN}-blktap = "\
>      ${sbindir}/blktapctrl \
>      ${sbindir}/img2qcow \
>      ${sbindir}/lock-util \
> diff --git a/recipes-extended/xen/xen-hypervisor.inc
> b/recipes-extended/xen/xen-hypervisor.inc
> index 9b96d91..cffd491 100644
> --- a/recipes-extended/xen/xen-hypervisor.inc
> +++ b/recipes-extended/xen/xen-hypervisor.inc
> @@ -17,7 +17,7 @@ PACKAGES = " \
>      ${PN}-efi \
>      "
>
> -FILES_${PN} = " \
> +FILES:${PN} = " \
>      /boot/xen-* \
>      /boot/xen \
>      /boot/xen-*.gz \
> @@ -25,9 +25,9 @@ FILES_${PN} = " \
>      /boot/xen-syms-* \
>      "
>
> -FILES_${PN}-dbg += "${libdir}/debug/*"
> +FILES:${PN}-dbg += "${libdir}/debug/*"
>
> -FILES_${PN}-efi = " \
> +FILES:${PN}-efi = " \
>      /boot/xen.efi \
>      ${exec_prefix}/lib64/efi/xen* \
>      "
> diff --git a/recipes-extended/xen/xen-tools.inc
> b/recipes-extended/xen/xen-tools.inc
> index 2930097..ba4f2e7 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -224,7 +224,7 @@ PROVIDES =+ " \
>  # virtual package to allow for substitution.
>  RPROVIDES_${PN}-xenstored = "virtual/xenstored"
>
> -FILES_${PN}-dbg += "\
> +FILES:${PN}-dbg += "\
>      ${libdir}/xen/bin/.debug \
>      ${nonarch_libdir}/${PYTHON_DIR}/site-packages/.debug \
>      ${nonarch_libdir}/${PYTHON_DIR}/site-packages/xen/lowlevel/.debug \
> @@ -244,18 +244,18 @@ FILES_${PN}-dbg += "\
>      ${nonarch_libdir}/${PYTHON_DIR}/dist-packages/xen/lowlevel/.debug \
>      "
>
> -FILES_${PN}-dev = "\
> +FILES:${PN}-dev = "\
>      ${includedir} \
>      "
>
> -FILES_${PN}-doc = "\
> +FILES:${PN}-doc = "\
>      ${sysconfdir}/xen/README \
>      ${sysconfdir}/xen/README.incompatibilities \
>      ${datadir}/doc \
>      ${datadir}/man \
>      "
>
> -FILES_${PN}-staticdev += "\
> +FILES:${PN}-staticdev += "\
>      ${libdir}/libxenguest.a \
>      ${libdir}/libxenlight.a \
>      ${libdir}/libxenvchan.a \
> @@ -265,122 +265,122 @@ FILES_${PN}-staticdev += "\
>      ${libdir}/libxenstore.a \
>      "
>
> -FILES_${PN}-libxencall = "${libdir}/libxencall.so.*"
> -FILES_${PN}-libxencall-dev = " \
> +FILES:${PN}-libxencall = "${libdir}/libxencall.so.*"
> +FILES:${PN}-libxencall-dev = " \
>      ${libdir}/libxencall.so \
>      ${libdir}/pkgconfig/xencall.pc \
>      ${datadir}/pkgconfig/xencall.pc \
>      "
>
> -FILES_${PN}-libxenctrl = "${libdir}/libxenctrl.so.*"
> -FILES_${PN}-libxenctrl-dev = " \
> +FILES:${PN}-libxenctrl = "${libdir}/libxenctrl.so.*"
> +FILES:${PN}-libxenctrl-dev = " \
>      ${libdir}/libxenctrl.so \
>      ${libdir}/pkgconfig/xencontrol.pc \
>      ${datadir}/pkgconfig/xencontrol.pc \
>      "
>
> -FILES_${PN}-libxendevicemodel = "${libdir}/libxendevicemodel.so.*"
> -FILES_${PN}-libxendevicemodel-dev = " \
> +FILES:${PN}-libxendevicemodel = "${libdir}/libxendevicemodel.so.*"
> +FILES:${PN}-libxendevicemodel-dev = " \
>      ${libdir}/libxendevicemodel.so \
>      ${libdir}/pkgconfig/xendevicemodel.pc \
>      ${datadir}/pkgconfig/xendevicemodel.pc \
>      "
>
> -FILES_${PN}-libxenevtchn = "${libdir}/libxenevtchn.so.*"
> -FILES_${PN}-libxenevtchn-dev = " \
> +FILES:${PN}-libxenevtchn = "${libdir}/libxenevtchn.so.*"
> +FILES:${PN}-libxenevtchn-dev = " \
>      ${libdir}/libxenevtchn.so \
>      ${libdir}/pkgconfig/xenevtchn.pc \
>      ${datadir}/pkgconfig/xenevtchn.pc \
>      "
>
> -FILES_${PN}-libxenforeignmemory = "${libdir}/libxenforeignmemory.so.*"
> -FILES_${PN}-libxenforeignmemory-dev = " \
> +FILES:${PN}-libxenforeignmemory = "${libdir}/libxenforeignmemory.so.*"
> +FILES:${PN}-libxenforeignmemory-dev = " \
>      ${libdir}/libxenforeignmemory.so \
>      ${libdir}/pkgconfig/xenforeignmemory.pc \
>      ${datadir}/pkgconfig/xenforeignmemory.pc \
>      "
>
> -FILES_${PN}-libxengnttab = "${libdir}/libxengnttab.so.*"
> -FILES_${PN}-libxengnttab-dev = " \
> +FILES:${PN}-libxengnttab = "${libdir}/libxengnttab.so.*"
> +FILES:${PN}-libxengnttab-dev = " \
>      ${libdir}/libxengnttab.so \
>      ${libdir}/pkgconfig/xengnttab.pc \
>      ${datadir}/pkgconfig/xengnttab.pc \
>      "
>
> -FILES_${PN}-libxenguest = "${libdir}/libxenguest.so.*"
> -FILES_${PN}-libxenguest-dev = " \
> +FILES:${PN}-libxenguest = "${libdir}/libxenguest.so.*"
> +FILES:${PN}-libxenguest-dev = " \
>      ${libdir}/libxenguest.so \
>      ${libdir}/pkgconfig/xenguest.pc \
>      ${datadir}/pkgconfig/xenguest.pc \
>      "
>
> -FILES_${PN}-libxenhypfs = "${libdir}/libxenhypfs.so.*"
> -FILES_${PN}-libxenhypfs-dev = " \
> +FILES:${PN}-libxenhypfs = "${libdir}/libxenhypfs.so.*"
> +FILES:${PN}-libxenhypfs-dev = " \
>      ${libdir}/libxenhypfs.so \
>      ${libdir}/pkgconfig/xenhypfs.pc \
>      "
>
> -FILES_${PN}-libxenlight = "${libdir}/libxenlight.so.*"
> -FILES_${PN}-libxenlight-dev = " \
> +FILES:${PN}-libxenlight = "${libdir}/libxenlight.so.*"
> +FILES:${PN}-libxenlight-dev = " \
>      ${libdir}/libxenlight.so \
>      ${libdir}/pkgconfig/xenlight.pc \
>      ${datadir}/pkgconfig/xenlight.pc \
>      "
>
> -FILES_${PN}-libxenstat = "${libdir}/libxenstat.so.*"
> -FILES_${PN}-libxenstat-dev = " \
> +FILES:${PN}-libxenstat = "${libdir}/libxenstat.so.*"
> +FILES:${PN}-libxenstat-dev = " \
>      ${libdir}/libxenstat.so \
>      ${libdir}/pkgconfig/xenstat.pc \
>      ${datadir}/pkgconfig/xenstat.pc \
>      "
>
> -FILES_${PN}-libxenstore = "${libdir}/libxenstore.so.*"
> -FILES_${PN}-libxenstore-dev = " \
> +FILES:${PN}-libxenstore = "${libdir}/libxenstore.so.*"
> +FILES:${PN}-libxenstore-dev = " \
>      ${libdir}/libxenstore.so \
>      ${libdir}/pkgconfig/xenstore.pc \
>      ${datadir}/pkgconfig/xenstore.pc \
>      "
>
> -FILES_${PN}-libxentoolcore = "${libdir}/libxentoolcore.so.*"
> -FILES_${PN}-libxentoolcore-dev = " \
> +FILES:${PN}-libxentoolcore = "${libdir}/libxentoolcore.so.*"
> +FILES:${PN}-libxentoolcore-dev = " \
>      ${libdir}/libxentoolcore.so \
>      ${libdir}/pkgconfig/xentoolcore.pc \
>      ${datadir}/pkgconfig/xentoolcore.pc \
>      "
>
> -FILES_${PN}-libxentoollog = "${libdir}/libxentoollog.so.*"
> -FILES_${PN}-libxentoollog-dev = " \
> +FILES:${PN}-libxentoollog = "${libdir}/libxentoollog.so.*"
> +FILES:${PN}-libxentoollog-dev = " \
>      ${libdir}/libxentoollog.so \
>      ${libdir}/pkgconfig/xentoollog.pc \
>      ${datadir}/pkgconfig/xentoollog.pc \
>      "
>
> -FILES_${PN}-libxenvchan = "${libdir}/libxenvchan.so.*"
> -FILES_${PN}-libxenvchan-dev = " \
> +FILES:${PN}-libxenvchan = "${libdir}/libxenvchan.so.*"
> +FILES:${PN}-libxenvchan-dev = " \
>      ${libdir}/libxenvchan.so \
>      ${libdir}/pkgconfig/xenvchan.pc \
>      ${datadir}/pkgconfig/xenvchan.pc \
>      "
>
> -FILES_${PN}-libxlutil = "${libdir}/libxlutil.so.*"
> -FILES_${PN}-libxlutil-dev = " \
> +FILES:${PN}-libxlutil = "${libdir}/libxlutil.so.*"
> +FILES:${PN}-libxlutil-dev = " \
>      ${libdir}/libxlutil.so \
>      ${libdir}/pkgconfig/xlutil.pc \
>      ${datadir}/pkgconfig/xlutil.pc \
>      "
> -FILES_${PN}-libvhd = "${libdir}/libvhd.so.*"
> -FILES_${PN}-libvhd-dev = " \
> +FILES:${PN}-libvhd = "${libdir}/libvhd.so.*"
> +FILES:${PN}-libvhd-dev = " \
>      ${libdir}/libvhd.so \
>      ${libdir}/pkgconfig/vhd.pc \
>      ${datadir}/pkgconfig/vhd.pc \
>      "
>
> -FILES_${PN}-libfsimage = " \
> +FILES:${PN}-libfsimage = " \
>      ${libdir}/libfsimage.so.* \
>      ${libdir}/libxenfsimage.so.* \
>      "
>
> -FILES_${PN}-libfsimage-dev = " \
> +FILES:${PN}-libfsimage-dev = " \
>      ${libdir}/libfsimage.so \
>      ${libdir}/libxenfsimage.so \
>      ${libdir}/pkgconfig/fsimage.pc \
> @@ -389,38 +389,38 @@ FILES_${PN}-libfsimage-dev = " \
>      ${datadir}/pkgconfig/xenfsimage.pc \
>      "
>
> -FILES_${PN}-fsimage = " \
> +FILES:${PN}-fsimage = " \
>      ${libdir}/fs/**/[a-z]*fsimage.so \
>      ${libdir}/xenfsimage/**/fsimage.so \
>      "
>
> -FILES_${PN}-init-xenstore-dom = "${libdir}/xen/bin/init-xenstore-domain"
> +FILES:${PN}-init-xenstore-dom = "${libdir}/xen/bin/init-xenstore-domain"
>
> -FILES_${PN} = "\
> +FILES:${PN} = "\
>      ${sysconfdir}/xen/auto \
>      ${sysconfdir}/xen/cpupool \
>      ${localstatedir}/xen/dump \
>      "
>
> -FILES_${PN}-console = "\
> +FILES:${PN}-console = "\
>      ${libdir}/xen/bin/xenconsole \
>      ${sbindir}/xenconsoled \
>      "
>
> -FILES_${PN}-cpuid = "\
> +FILES:${PN}-cpuid = "\
>      ${bindir}/xen-cpuid \
>      "
>
> -FILES_${PN}-devd = "\
> +FILES:${PN}-devd = "\
>      ${sysconfdir}/init.d/xendriverdomain \
>      ${systemd_unitdir}/system/xendriverdomain.service \
>      "
>
> -FILES_${PN}-flask = "\
> +FILES:${PN}-flask = "\
>      /boot/xenpolicy-* \
>      "
>
> -FILES_${PN}-flask-tools = "\
> +FILES:${PN}-flask-tools = "\
>      ${sbindir}/flask-get-bool \
>      ${sbindir}/flask-getenforce \
>      ${sbindir}/flask-label-pci \
> @@ -429,25 +429,25 @@ FILES_${PN}-flask-tools = "\
>      ${sbindir}/flask-setenforce \
>      "
>
> -FILES_${PN}-gdbsx = "\
> +FILES:${PN}-gdbsx = "\
>      ${sbindir}/gdbsx \
>      "
>
>  INSANE_SKIP_${PN}-hvmloader = "arch"
> -FILES_${PN}-hvmloader = "\
> +FILES:${PN}-hvmloader = "\
>      ${libdir}/xen/boot/hvmloader \
>      "
>
> -FILES_${PN}-kdd = "\
> +FILES:${PN}-kdd = "\
>      ${sbindir}/kdd \
>      ${sbindir}/xen-kdd \
>      "
>
> -FILES_${PN}-livepatch += " \
> +FILES:${PN}-livepatch += " \
>      ${sbindir}/xen-livepatch \
>      "
>
> -FILES_${PN}-misc = "\
> +FILES:${PN}-misc = "\
>      ${bindir}/xen-detect \
>      ${libdir}/xen/bin/depriv-fd-checker \
>      ${sbindir}/gtracestat \
> @@ -470,22 +470,22 @@ FILES_${PN}-misc = "\
>      ${libdir}/xen/bin/convert-legacy-stream \
>      "
>
> -FILES_${PN}-pygrub = "\
> +FILES:${PN}-pygrub = "\
>      ${bindir}/pygrub \
>      ${libdir}/xen/bin/pygrub \
>      "
>
>  # Depending on the version of Xen libdir or nonarch libdir is used
> -FILES_${PN}-python = "\
> +FILES:${PN}-python = "\
>      ${libdir}/${PYTHON_DIR} \
>      ${nonarch_libdir}/${PYTHON_DIR} \
>      "
>
> -FILES_${PN}-remus = "\
> +FILES:${PN}-remus = "\
>      ${sysconfdir}/xen/scripts/remus-netbuf-setup \
>      "
>
> -FILES_${PN}-scripts-network = " \
> +FILES:${PN}-scripts-network = " \
>      ${sysconfdir}/xen/scripts/colo-proxy-setup \
>      ${sysconfdir}/xen/scripts/network-bridge \
>      ${sysconfdir}/xen/scripts/network-nat \
> @@ -500,7 +500,7 @@ FILES_${PN}-scripts-network = " \
>      ${sysconfdir}/xen/scripts/vif-setup \
>      "
>
> -FILES_${PN}-scripts-block = " \
> +FILES:${PN}-scripts-block = " \
>      ${sysconfdir}/xen/scripts/blktap \
>      ${sysconfdir}/xen/scripts/block \
>      ${sysconfdir}/xen/scripts/block-common.sh \
> @@ -513,7 +513,7 @@ FILES_${PN}-scripts-block = " \
>      ${sysconfdir}/xen/scripts/vscsi \
>      "
>
> -FILES_${PN}-scripts-common = " \
> +FILES:${PN}-scripts-common = " \
>      ${sysconfdir}/xen/scripts/external-device-migrate \
>      ${sysconfdir}/xen/scripts/hotplugpath.sh \
>      ${sysconfdir}/xen/scripts/locking.sh \
> @@ -525,58 +525,58 @@ FILES_${PN}-scripts-common = " \
>      "
>
>  INSANE_SKIP_${PN}-shim = "arch"
> -FILES_${PN}-shim = " \
> +FILES:${PN}-shim = " \
>      ${libdir}/xen/boot/xen-shim \
>      "
>
> -FILES_${PN}-ucode = "\
> +FILES:${PN}-ucode = "\
>      ${sbindir}/xen-ucode \
>      "
>
> -FILES_${PN}-vchan = "\
> +FILES:${PN}-vchan = "\
>      ${bindir}/vchan-socket-proxy \
>      "
>
> -FILES_${PN}-volatiles = "\
> +FILES:${PN}-volatiles = "\
>      ${sysconfdir}/default/volatiles/99_xen \
>      ${sysconfdir}/tmpfiles.d/xen.conf \
>      "
>
> -FILES_${PN}-xcutils = "\
> +FILES:${PN}-xcutils = "\
>      ${libdir}/xen/bin/lsevtchn \
>      ${libdir}/xen/bin/readnotes \
>      ${libdir}/xen/bin/xc_restore \
>      ${libdir}/xen/bin/xc_save \
>      "
>
> -FILES_${PN}-xencov = "\
> +FILES:${PN}-xencov = "\
>      ${sbindir}/xencov \
>      "
>
> -FILES_${PN}-xend-examples = "\
> +FILES:${PN}-xend-examples = "\
>      ${sysconfdir}/xen/xend-config.sxp \
>      ${sysconfdir}/xen/xend-pci-permissive.sxp \
>      ${sysconfdir}/xen/xend-pci-quirks.sxp \
>      "
>
> -FILES_${PN}-xenhypfs = "\
> +FILES:${PN}-xenhypfs = "\
>      ${sbindir}/xenhypfs \
>      "
>
> -FILES_${PN}-xenpaging = "\
> +FILES:${PN}-xenpaging = "\
>      ${libdir}/xen/bin/xenpaging \
>      ${localstatedir}/lib/xen/xenpaging \
>      "
>
> -FILES_${PN}-xenpmd = "\
> +FILES:${PN}-xenpmd = "\
>      ${sbindir}/xenpmd \
>      "
>
> -FILES_${PN}-xenstat = "\
> +FILES:${PN}-xenstat = "\
>      ${sbindir}/xentop \
>      "
>
> -FILES_${PN}-xenstore = "\
> +FILES:${PN}-xenstore = "\
>      ${bindir}/xenstore \
>      ${bindir}/xenstore-chmod \
>      ${bindir}/xenstore-control \
> @@ -589,12 +589,12 @@ FILES_${PN}-xenstore = "\
>      ${bindir}/xenstore-write \
>      "
>
> -FILES_${PN}-xenstored = "\
> +FILES:${PN}-xenstored = "\
>      ${sbindir}/xenstored \
>      ${localstatedir}/lib/xenstored \
>      "
>
> -FILES_${PN}-xentrace = "\
> +FILES:${PN}-xentrace = "\
>      ${bindir}/xentrace \
>      ${bindir}/xentrace_setsize \
>      ${libdir}/xen/bin/xenctx \
> @@ -604,13 +604,13 @@ FILES_${PN}-xentrace = "\
>      ${sbindir}/xentrace_setmask \
>      "
>
> -FILES_${PN}-xen-watchdog = "\
> +FILES:${PN}-xen-watchdog = "\
>      ${sbindir}/xenwatchdogd \
>      ${sysconfdir}/init.d/xen-watchdog \
>      ${systemd_unitdir}/system/xen-watchdog.service \
>      "
>
> -FILES_${PN}-xl = "\
> +FILES:${PN}-xl = "\
>      ${sysconfdir}/bash_completion.d/xl.sh \
>      ${sysconfdir}/bash_completion.d/xl \
>      ${sysconfdir}/xen/xl.conf \
> @@ -619,13 +619,13 @@ FILES_${PN}-xl = "\
>      ${libdir}/xen/bin/xen-init-dom0 \
>      "
>
> -FILES_${PN}-xl-examples = "\
> +FILES:${PN}-xl-examples = "\
>      ${sysconfdir}/xen/xlexample.hvm \
>      ${sysconfdir}/xen/xlexample.pvlinux \
>      ${sysconfdir}/xen/xlexample.pvhlinux \
>      "
>
> -FILES_${PN}-xm-examples = "\
> +FILES:${PN}-xm-examples = "\
>      ${sysconfdir}/xen/xmexample1 \
>      ${sysconfdir}/xen/xmexample2 \
>      ${sysconfdir}/xen/xmexample3 \
> @@ -636,19 +636,19 @@ FILES_${PN}-xm-examples = "\
>      ${sysconfdir}/xen/xmexample.vti \
>      "
>
> -FILES_${PN}-xenmon = "\
> +FILES:${PN}-xenmon = "\
>      ${sbindir}/xenbaked \
>      ${sbindir}/xenmon.py \
>      ${sbindir}/xenmon \
>      "
>
> -FILES_${PN}-xm = "\
> +FILES:${PN}-xm = "\
>      ${sysconfdir}/xen/xm-config.xml \
>      ${datadir}/xen/create.dtd \
>      ${sbindir}/xm \
>      "
>
> -FILES_${PN}-xencommons += "\
> +FILES:${PN}-xencommons += "\
>      ${sysconfdir}/default/xencommons \
>      ${sysconfdir}/init.d/xencommons \
>      ${sysconfdir}/xen/scripts/launch-xenstore \
> @@ -661,23 +661,23 @@ FILES_${PN}-xencommons += "\
>      ${systemd_unitdir}/system/var-lib-xenstored.mount \
>      "
>
> -FILES_${PN}-xend += " \
> +FILES:${PN}-xend += " \
>      ${sysconfdir}/init.d/xend \
>      ${sbindir}/xend \
>      "
>
> -FILES_${PN}-xendomains += "\
> +FILES:${PN}-xendomains += "\
>      ${libdir}/xen/bin/xendomains \
>      ${sysconfdir}/default/xendomains \
>      ${sysconfdir}/init.d/xendomains \
>      ${sysconfdir}/sysconfig/xendomains \
>      ${systemd_unitdir}/system/xendomains.service \
>      "
> -FILES_${PN}-xen-access += "\
> +FILES:${PN}-xen-access += "\
>      ${sbindir}/xen-access \
>      "
>
> -FILES_${PN}-xen-memshare += "\
> +FILES:${PN}-xen-memshare += "\
>      ${sbindir}/xen-memshare \
>      "
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 3438034..277c8f4 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -118,8 +118,8 @@ EXTRA_CFLAGS_XEN_TOOLS="${HOST_CC_ARCH} ${CFLAGS}"
>  CC_arm="${CCACHE}${HOST_PREFIX}gcc ${TUNE_CCARGS} ${TOOLCHAIN_OPTIONS}
> ${CC_REPRODUCIBLE_OPTIONS}"
>
>  # There are no Xen-provided variables for C++, so append to the tool
> variables:
> -CPP_append = " ${CPPFLAGS}"
> -CXX_append = " ${CXXFLAGS}"
> +CPP:append = " ${CPPFLAGS}"
> +CXX:append = " ${CXXFLAGS}"
>
>  EXTRA_OECONF += " \
>      --exec-prefix=${prefix} \
> @@ -193,7 +193,7 @@ do_post_patch() {
>      fi
>  }
>
> -do_post_patch_append_arm()  {
> +do_post_patch:append:arm()  {
>      # The hypervisor binary must not be built with the hard floating
> point ABI.
>      echo "CC := \$(filter-out ${TUNE_CCARGS},\$(CC))" >>
> ${S}/xen/arch/arm/Rules.mk
>      echo "CPP := \$(filter-out ${TUNE_CCARGS},\$(CPP))" >>
> ${S}/xen/arch/arm/Rules.mk
> @@ -229,13 +229,13 @@ do_configure_common() {
>                 PYTHON="${PYTHON}"
>  }
>
> -do_compile_prepend() {
> +do_compile:prepend() {
>      # workaround for build bug when CFLAGS is exported
>      # https://www.mail-archive.com/xen-devel@lists.xen.org/msg67822.html
>      unset CFLAGS
>  }
>
> -do_install_prepend() {
> +do_install:prepend() {
>      # CFLAGS is used to set PY_CFLAGS which affects the pygrub install
>      # so also need to unset CFLAGS here:
>      unset CFLAGS
> diff --git a/recipes-extended/xen/xtf_git.bb b/recipes-extended/xen/
> xtf_git.bb
> index bf7470e..9a669e3 100644
> --- a/recipes-extended/xen/xtf_git.bb
> +++ b/recipes-extended/xen/xtf_git.bb
> @@ -20,7 +20,7 @@ inherit python3native
>
>  PACKAGES = "${PN}"
>
> -FILES_${PN} = " \
> +FILES:${PN} = " \
>      ${libexecdir}/* \
>      "
>
> diff --git a/recipes-extended/xvisor/xvisor_git.bb
> b/recipes-extended/xvisor/xvisor_git.bb
> index 831c943..130b0d5 100644
> --- a/recipes-extended/xvisor/xvisor_git.bb
> +++ b/recipes-extended/xvisor/xvisor_git.bb
> @@ -25,7 +25,7 @@ do_configure() {
>      oe_runmake ${CONFIG}
>  }
>
> -do_install_append() {
> +do_install:append() {
>      install -d ${D}
>      install -m 755 ${B}/build/vmm.* ${D}/
>
> @@ -44,8 +44,8 @@ do_deploy () {
>
>  addtask deploy after do_install
>
> -FILES_${PN} += "/vmm.*"
> -FILES_${PN} += "/*.dtb"
> +FILES:${PN} += "/vmm.*"
> +FILES:${PN} += "/*.dtb"
>
>  COMPATIBLE_HOST = "(aarch64|riscv64|riscv32).*"
>  INHIBIT_PACKAGE_STRIP = "1"
> diff --git a/recipes-graphics/xorg-xserver/xserver-xorg_xen.inc
> b/recipes-graphics/xorg-xserver/xserver-xorg_xen.inc
> index 9503404..a2d913e 100644
> --- a/recipes-graphics/xorg-xserver/xserver-xorg_xen.inc
> +++ b/recipes-graphics/xorg-xserver/xserver-xorg_xen.inc
> @@ -10,4 +10,4 @@ XEN_REMOVED_OPENGL_PKGCONFIGS_x86-64 = ""
>
>  REMOVED_OPENGL_PKGCONFIGS ?= "${@bb.utils.contains('DISTRO_FEATURES',
> 'xen', "${XEN_REMOVED_OPENGL_PKGCONFIGS}", '', d)}"
>
> -OPENGL_PKGCONFIGS_remove = "${REMOVED_OPENGL_PKGCONFIGS}"
> +OPENGL_PKGCONFIGS:remove = "${REMOVED_OPENGL_PKGCONFIGS}"
> diff --git a/recipes-kernel/dtc/python3-dtc_1.6.1.bb b/recipes-kernel/dtc/
> python3-dtc_1.6.1.bb
> index 9088931..3929565 100644
> --- a/recipes-kernel/dtc/python3-dtc_1.6.1.bb
> +++ b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
> @@ -20,7 +20,7 @@ inherit distutils3
>
>  DISTUTILS_SETUP_PATH = "${S}/pylibfdt"
>
> -do_configure_prepend() {
> +do_configure:prepend() {
>      oe_runmake -C "${S}" version_gen.h
>      mv "${S}/version_gen.h" "${DISTUTILS_SETUP_PATH}/"
>  }
> diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc
> b/recipes-kernel/linux/linux-yocto_virtualization.inc
> index 321dda2..d2227ea 100644
> --- a/recipes-kernel/linux/linux-yocto_virtualization.inc
> +++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
> @@ -1,4 +1,4 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/linux-yocto:"
> +FILESEXTRAPATHS:prepend := "${THISDIR}/linux-yocto:"
>
>  SRC_URI += "file://xt-checksum.scc \
>              file://ebtables.scc \
> @@ -7,15 +7,15 @@ SRC_URI += "file://xt-checksum.scc \
>              file://docker.scc \
>             file://cgroup-hugetlb.scc \
>             "
> -KERNEL_FEATURES_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'kvm',
> 'features/kvm/qemu-kvm-enable.scc', '', d)}"
> +KERNEL_FEATURES:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'kvm',
> 'features/kvm/qemu-kvm-enable.scc', '', d)}"
>
>  KERNEL_MODULE_AUTOLOAD += "nf_conntrack_ipv6 openvswitch"
>  KERNEL_MODULE_AUTOLOAD += "${@bb.utils.contains('DISTRO_FEATURES', 'kvm',
> 'kvm', '', d)}"
>
>  # aufs kernel support required for xen-image-minimal
> -KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES',
> 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
> +KERNEL_FEATURES:append += "${@bb.utils.contains('DISTRO_FEATURES',
> 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
>
> -KERNEL_FEATURES_append = " cfg/virtio.scc"
> +KERNEL_FEATURES:append = " cfg/virtio.scc"
>
>  # xen kernel support
>  SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '
> file://xen.scc', '', d)}"
> diff --git a/recipes-kernel/lopper/lopper.bb b/recipes-kernel/lopper/
> lopper.bb
> index 274d5b9..ae280ee 100644
> --- a/recipes-kernel/lopper/lopper.bb
> +++ b/recipes-kernel/lopper/lopper.bb
> @@ -9,7 +9,7 @@ S = "${WORKDIR}/git"
>
>  LIC_FILES_CHKSUM =
> "file://LICENSE.md;md5=8e5f5f691f01c9fdfa7a7f2d535be619"
>
> -RDEPENDS_${PN} = " \
> +RDEPENDS:${PN} = " \
>      python3-core \
>      python3-dtc \
>      python3-humanfriendly \
> diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/
> cni_git.bb
> index ece5142..62523bc 100644
> --- a/recipes-networking/cni/cni_git.bb
> +++ b/recipes-networking/cni/cni_git.bb
> @@ -65,10 +65,10 @@ do_install() {
>      ln -sf ${libexecdir}/cni/ ${D}/opt/cni/bin
>  }
>
> -FILES_${PN} += "${libexecdir}/cni/* /opt/cni/bin"
> +FILES:${PN} += "${libexecdir}/cni/* /opt/cni/bin"
>
>  INSANE_SKIP_${PN} += "ldflags already-stripped"
>
>  deltask compile_ptest_base
>
> -RDEPENDS_${PN} += " ca-certificates"
> +RDEPENDS:${PN} += " ca-certificates"
> diff --git a/recipes-networking/openvswitch/openvswitch.inc
> b/recipes-networking/openvswitch/openvswitch.inc
> index 37fbe5a..52cc58e 100644
> --- a/recipes-networking/openvswitch/openvswitch.inc
> +++ b/recipes-networking/openvswitch/openvswitch.inc
> @@ -13,18 +13,18 @@ LICENSE = "Apache-2"
>
>  DEPENDS += "bridge-utils openssl python3 perl python3-six-native
> coreutils-native"
>
> -RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid coreutils \
> +RDEPENDS:${PN} += "util-linux-uuidgen util-linux-libuuid coreutils \
>          python3 perl perl-module-strict ${PN}-switch \
>          bash python3-twisted python3-six"
> -RDEPENDS_${PN}-testcontroller = "${PN} ${PN}-pki"
> -RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
> -RDEPENDS_${PN}-pki = "${PN}"
> -RDEPENDS_${PN}-brcompat = "${PN} ${PN}-switch"
> +RDEPENDS:${PN}-testcontroller = "${PN} ${PN}-pki"
> +RDEPENDS:${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
> +RDEPENDS:${PN}-pki = "${PN}"
> +RDEPENDS:${PN}-brcompat = "${PN} ${PN}-switch"
>
>  # Some installers will fail because of an install order based on
>  # rdeps.  E.g. ovs-pki calls sed in the postinstall.  sed may be
>  # queued for install later.
> -RDEPENDS_${PN} += "sed gawk grep"
> +RDEPENDS:${PN} += "sed gawk grep"
>
>  SRC_URI = "\
>         file://openvswitch-switch \
> @@ -48,16 +48,16 @@ CONFIGUREOPT_DEPTRACK = ""
>  ALLOW_EMPTY_${PN}-pki = "1"
>  PACKAGES =+ "${PN}-testcontroller ${PN}-switch ${PN}-brcompat ${PN}-pki"
>
> -FILES_${PN}-testcontroller = "\
> +FILES:${PN}-testcontroller = "\
>         ${sysconfdir}/init.d/openvswitch-testcontroller \
>         ${sysconfdir}/default/openvswitch-testcontroller \
>         ${sysconfdir}/openvswitch-testcontroller \
>         ${bindir}/ovs-testcontroller \
>         "
>
> -FILES_${PN}-brcompat = "${sbindir}/ovs-brcompatd"
> +FILES:${PN}-brcompat = "${sbindir}/ovs-brcompatd"
>
> -FILES_${PN}-switch = "\
> +FILES:${PN}-switch = "\
>         ${sysconfdir}/init.d/openvswitch-switch \
>         ${sysconfdir}/default/openvswitch-switch \
>         ${systemd_unitdir}/system/ovs-vswitchd.service \
> @@ -68,10 +68,10 @@ FILES_${PN}-switch = "\
>         "
>
>  # silence a warning
> -FILES_${PN} += "${datadir}/ovsdbmonitor"
> -FILES_${PN} += "/run"
> +FILES:${PN} += "${datadir}/ovsdbmonitor"
> +FILES:${PN} += "/run"
>
> -FILES_${PN} += "${libdir}/python${PYTHON_BASEVERSION}/"
> +FILES:${PN} += "${libdir}/python${PYTHON_BASEVERSION}/"
>  inherit autotools update-rc.d systemd python3native
>
>  SYSTEMD_PACKAGES = "${PN}-switch"
> @@ -82,19 +82,19 @@ SYSTEMD_SERVICE_${PN}-switch = " \
>  "
>
>  INITSCRIPT_PACKAGES = "${PN}-switch ${PN}-testcontroller"
> -INITSCRIPT_NAME_${PN}-switch = "openvswitch-switch"
> -INITSCRIPT_PARAMS_${PN}-switch = "defaults 71"
> +INITSCRIPT_NAME:${PN}-switch = "openvswitch-switch"
> +INITSCRIPT_PARAMS:${PN}-switch = "defaults 71"
>
> -INITSCRIPT_NAME_${PN}-testcontroller = "openvswitch-testcontroller"
> -INITSCRIPT_PARAMS_${PN}-testcontroller = "defaults 72"
> +INITSCRIPT_NAME:${PN}-testcontroller = "openvswitch-testcontroller"
> +INITSCRIPT_PARAMS:${PN}-testcontroller = "defaults 72"
>
> -do_configure_prepend() {
> +do_configure:prepend() {
>         # Work around the for Makefile CC=$(if ....) by swapping out any
>         # "-Wa," assembly directives with "-Xassembler
>         CC=`echo '${CC}' | sed 's/-Wa,/-Xassembler /g'`
>  }
>
> -do_install_prepend() {
> +do_install:prepend() {
>
> SERVICE_FILE="${S}/rhel/usr_lib_systemd_system_ovs-vswitchd.service"
>         ${S}/build-aux/dpdkstrip.py \
>
> ${@bb.utils.contains('PACKAGECONFIG','dpdk','--dpdk','--nodpdk',d)} \
> @@ -102,7 +102,7 @@ do_install_prepend() {
>             > ${SERVICE_FILE}
>  }
>
> -do_install_append() {
> +do_install:append() {
>         install -d ${D}/${sysconfdir}/default/
>         install -m 660 ${WORKDIR}/openvswitch-switch-setup
> ${D}/${sysconfdir}/default/openvswitch-switch
>         install -d ${D}/${sysconfdir}/openvswitch-testcontroller
> @@ -137,13 +137,13 @@ do_install_append() {
>         cp -r ${S}/python/ovstest/
> ${D}${libdir}/python${PYTHON_BASEVERSION}/site-packages/
>  }
>
> -pkg_postinst_ontarget_${PN}-pki () {
> +pkg_postinst_ontarget:${PN}-pki () {
>         if test ! -d $D/${datadir}/${PN}/pki; then
>                 ovs-pki init --dir=$D/${datadir}/${PN}/pki
>         fi
>  }
>
> -pkg_postinst_ontarget_${PN}-testcontroller () {
> +pkg_postinst_ontarget:${PN}-testcontroller () {
>         if test ! -d $D/${datadir}/${PN}/pki; then
>                 ovs-pki init --dir=$D/${datadir}/${PN}/pki
>         fi
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb
> b/recipes-networking/openvswitch/openvswitch_git.bb
> index 616bc27..412a707 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -4,7 +4,7 @@ DEPENDS += "virtual/kernel"
>
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> -RDEPENDS_${PN}-ptest += "\
> +RDEPENDS:${PN}-ptest += "\
>         python3-logging python3-syslog python3-io python3-core \
>         python3-fcntl python3-shell python3-xml python3-math \
>         python3-datetime python3-netclient python3 sed \
> @@ -17,7 +17,7 @@ S = "${WORKDIR}/git"
>  PV = "2.15+${SRCPV}"
>  CVE_VERSION = "2.13.0"
>
> -FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
> +FILESEXTRAPATHS:append := "${THISDIR}/${PN}-git:"
>
>  SRCREV = "8dc1733eaea866dce033b3c44853e1b09bf59fc7"
>  SRC_URI += "git://
> github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.15 \
> @@ -45,7 +45,7 @@ PACKAGECONFIG[ssl] = ",--disable-ssl,openssl,"
>  # EXTRA_OECONF += "--with-linux=${STAGING_KERNEL_BUILDDIR}
> --with-linux-source=${STAGING_KERNEL_DIR} KARCH=${TARGET_ARCH}"
>
>  # silence a warning
> -FILES_${PN} += "/lib/modules"
> +FILES:${PN} += "/lib/modules"
>
>  inherit ptest
>
> @@ -55,6 +55,6 @@ do_install_ptest() {
>         oe_runmake test-install
>  }
>
> -do_install_append() {
> +do_install:append() {
>         oe_runmake modules_install INSTALL_MOD_PATH=${D}
>  }
> --
> 2.25.1
>
>
> 
>
>

--0000000000002eb10405c8e17ac8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">See master-next branch which already contains most of thes=
e changes (if not all).</div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Fri, Aug 6, 2021 at 11:45 AM wangmy &lt;<a href=
=3D"mailto:wangmy@fujitsu.com">wangmy@fujitsu.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 =C2=A0 This is the =
result of automated script (0.9.1) conversion:<br>
<br>
=C2=A0 =C2=A0 oe-core/scripts/contrib/convert-overrides.py .<br>
<br>
=C2=A0 =C2=A0 converting the metadata to use &quot;:&quot; as the override =
character instead of &quot;_&quot;.<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0README=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0classes/cni_networking.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0classes/qemuboot-xen-defaults.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0conf/distro/include/meta-virt-xen.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 =
+-<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_4.0.9.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_4.0.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 36 ++--<br>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_7.2.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_7.2.0.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 48 ++---<br>
=C2=A0.../nagios/<a href=3D"http://nagios-plugins_2.2.1.bb" rel=3D"noreferr=
er" target=3D"_blank">nagios-plugins_2.2.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0recipes-extended/seabios/<a href=3D"http://seabios_1.14.0.bb" rel=3D"=
noreferrer" target=3D"_blank">seabios_1.14.0.bb</a>=C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +-<br>
=C2=A0recipes-extended/upx/<a href=3D"http://upx_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">upx_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0recipes-extended/vgabios/<a href=3D"http://biossums_0.7a.bb" rel=3D"n=
oreferrer" target=3D"_blank">biossums_0.7a.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A02 +-<br>
=C2=A0recipes-extended/vgabios/<a href=3D"http://vgabios_0.7a.bb" rel=3D"no=
referrer" target=3D"_blank">vgabios_0.7a.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A04 +-<br>
=C2=A0recipes-extended/xen/xen-blktap.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 16 +-<br>
=C2=A0recipes-extended/xen/xen-hypervisor.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A06 +-<br>
=C2=A0recipes-extended/xen/xen-tools.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 164 +++++++++---------<br>
=C2=A0recipes-extended/xen/xen.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +-<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xtf_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">xtf_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0recipes-extended/xvisor/<a href=3D"http://xvisor_git.bb" rel=3D"noref=
errer" target=3D"_blank">xvisor_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0.../xorg-xserver/xserver-xorg_xen.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0recipes-kernel/dtc/<a href=3D"http://python3-dtc_1.6.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-dtc_1.6.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../linux/linux-yocto_virtualization.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A08 +-<br>
=C2=A0recipes-kernel/lopper/<a href=3D"http://lopper.bb" rel=3D"noreferrer"=
 target=3D"_blank">lopper.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cni_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0.../openvswitch/openvswitch.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 42 ++---<br>
=C2=A0.../openvswitch/<a href=3D"http://openvswitch_git.bb" rel=3D"noreferr=
er" target=3D"_blank">openvswitch_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A025 files changed, 199 insertions(+), 199 deletions(-)<br>
<br>
diff --git a/README b/README<br>
index a0fb466..1c75f4a 100644<br>
--- a/README<br>
+++ b/README<br>
@@ -8,7 +8,7 @@ The bbappend files for some recipes (e.g. linux-yocto) in t=
his layer need to<br>
=C2=A0have &#39;virtualization&#39; in DISTRO_FEATURES to have effect. To e=
nable them, add<br>
=C2=A0in configuration file the following line.<br>
<br>
-=C2=A0 DISTRO_FEATURES_append =3D &quot; virtualization&quot;<br>
+=C2=A0 DISTRO_FEATURES:append =3D &quot; virtualization&quot;<br>
<br>
=C2=A0If meta-virtualization is included, but virtualization is not enabled=
 as a<br>
=C2=A0distro feature a warning is printed at parse time:<br>
diff --git a/classes/cni_networking.bbclass b/classes/cni_networking.bbclas=
s<br>
index 9df02b8..054c0ae 100644<br>
--- a/classes/cni_networking.bbclass<br>
+++ b/classes/cni_networking.bbclass<br>
@@ -1,12 +1,12 @@<br>
-DEPENDS_append_class-target =3D &quot; cni&quot;<br>
+DEPENDS:append:class-target =3D &quot; cni&quot;<br>
<br>
-PACKAGES_prepend =3D &quot;${PN}-cni &quot;<br>
+PACKAGES:prepend =3D &quot;${PN}-cni &quot;<br>
<br>
-FILES_${PN}-cni =3D &quot;${sysconfdir}/cni/net.d/*&quot;<br>
+FILES:${PN}-cni =3D &quot;${sysconfdir}/cni/net.d/*&quot;<br>
<br>
=C2=A0RDEPENDS_${PN}-cni =3D &quot;cni&quot;<br>
<br>
-do_install_append() {<br>
+do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0if [ -z &quot;${CNI_NETWORKING_FILES}&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal &quot;cni-networking was inherited, but=
 no networking configuration was provided via CNI_NETWORKING_FILES&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0fi<br>
diff --git a/classes/qemuboot-xen-defaults.bbclass b/classes/qemuboot-xen-d=
efaults.bbclass<br>
index 67751d3..591b452 100644<br>
--- a/classes/qemuboot-xen-defaults.bbclass<br>
+++ b/classes/qemuboot-xen-defaults.bbclass<br>
@@ -12,7 +12,7 @@ QB_XEN_DOMAIN_MODULES ??=3D &quot;${DOM0_KERNEL}:${DOM0_K=
ERNEL_LOAD_ADDR}:multiboot,ker<br>
<br>
=C2=A0# Qemuboot for 64-bit Arm uses the QB_DEFAULT_KERNEL method to load X=
en<br>
=C2=A0# and the device loader option for the dom0 kernel:<br>
-QB_OPT_APPEND_append_aarch64 =3D &quot; \<br>
+QB_OPT_APPEND:append:aarch64 =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0-device loader,file=3D${DOM0_KERNEL},addr=3D${DOM0_KERN=
EL_LOAD_ADDR} \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0QB_DEFAULT_KERNEL_aarch64 =3D &quot;xen-${MACHINE}&quot;<br>
diff --git a/conf/distro/include/meta-virt-xen.inc b/conf/distro/include/me=
ta-virt-xen.inc<br>
index 2becba1..744f3fe 100644<br>
--- a/conf/distro/include/meta-virt-xen.inc<br>
+++ b/conf/distro/include/meta-virt-xen.inc<br>
@@ -1,9 +1,9 @@<br>
=C2=A0# Make sure Xen mode is enabled in qemu<br>
-PACKAGECONFIG_append_pn-qemu =3D &quot; xen&quot;<br>
+PACKAGECONFIG:append:pn-qemu =3D &quot; xen&quot;<br>
<br>
=C2=A0# For builds for ARM platforms, enable fdt<br>
-PACKAGECONFIG_append_pn-qemu_arm =3D &quot; fdt&quot;<br>
-PACKAGECONFIG_append_pn-qemu_aarch64 =3D &quot; fdt&quot;<br>
+PACKAGECONFIG:append:pn-qemu_arm =3D &quot; fdt&quot;<br>
+PACKAGECONFIG:append:pn-qemu_aarch64 =3D &quot; fdt&quot;<br>
<br>
=C2=A0# Xen on Raspberry Pi 4 64-bit support<br>
=C2=A0XEN_RPI4_64_CONFIG_PATH ??=3D \<br>
diff --git a/conf/layer.conf b/conf/layer.conf<br>
index 43873c2..7cf7084 100644<br>
--- a/conf/layer.conf<br>
+++ b/conf/layer.conf<br>
@@ -22,7 +22,7 @@ BBFILES_DYNAMIC +=3D &quot; \<br>
=C2=A0# cause compatibility issues with other layers<br>
=C2=A0LAYERVERSION_virtualization-layer =3D &quot;1&quot;<br>
=C2=A0LAYERSERIES_COMPAT_virtualization-layer =3D &quot;hardknott honister&=
quot;<br>
-LAYERDEPENDS_virtualization-layer =3D &quot; \<br>
+LAYERDEPENDS:virtualization-layer =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0core \<br>
=C2=A0 =C2=A0 =C2=A0openembedded-layer \<br>
=C2=A0 =C2=A0 =C2=A0networking-layer \<br>
@@ -54,8 +54,8 @@ INHERIT +=3D &quot;sanity-meta-virt&quot;<br>
=C2=A0META_VIRT_CONFIG_PATH =3D &quot;${LAYERDIR}/conf/distro/include/meta-=
virt-default-versions.inc&quot;<br>
=C2=A0META_VIRT_XEN_CONFIG_PATH =3D &quot;${LAYERDIR}/conf/distro/include/m=
eta-virt-xen.inc&quot;<br>
=C2=A0K8S_CONFIG_PATH =3D &quot;${LAYERDIR}/conf/distro/include/k8s-version=
s.inc&quot;<br>
-USER_CLASSES_append =3D &quot; meta-virt-cfg&quot;<br>
-USER_CLASSES_append =3D &quot; meta-virt-k8s-cfg&quot;<br>
-USER_CLASSES_append =3D &quot; meta-virt-xen-cfg&quot;<br>
+USER_CLASSES:append =3D &quot; meta-virt-cfg&quot;<br>
+USER_CLASSES:append =3D &quot; meta-virt-k8s-cfg&quot;<br>
+USER_CLASSES:append =3D &quot; meta-virt-xen-cfg&quot;<br>
<br>
=C2=A0HOSTTOOLS_NONFATAL +=3D &quot;getent&quot;<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_4.0.9.bb" rel=3D"=
noreferrer" target=3D"_blank">lxc_4.0.9.bb</a> b/recipes-containers/lxc/<a =
href=3D"http://lxc_4.0.9.bb" rel=3D"noreferrer" target=3D"_blank">lxc_4.0.9=
.bb</a><br>
index 7907291..22bf45e 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_4.0.9.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_4.0.9.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_4.0.9.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_4.0.9.bb</a><br>
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.LGPL2.1;md5=3D4fb=
d65380cdd255951079008b364516c<br>
=C2=A0&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;libxml2 libcap&quot;<br>
-RDEPENDS_${PN} =3D &quot; \<br>
+RDEPENDS:${PN} =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rsync \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curl \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gzip \<br>
@@ -30,11 +30,11 @@ RDEPENDS_${PN} =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 util-linux-getopt \=
<br>
=C2=A0&quot;<br>
<br>
-RDEPENDS_${PN}_append_libc-glibc =3D &quot; glibc-utils&quot;<br>
+RDEPENDS:${PN}:append:libc-glibc =3D &quot; glibc-utils&quot;<br>
<br>
-RDEPENDS_${PN}-ptest +=3D &quot;file make gmp nettle gnutls bash libgcc&qu=
ot;<br>
+RDEPENDS:${PN}-ptest +=3D &quot;file make gmp nettle gnutls bash libgcc&qu=
ot;<br>
<br>
-RDEPENDS_${PN}-networking +=3D &quot;iptables&quot;<br>
+RDEPENDS:${PN}-networking +=3D &quot;iptables&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://linuxcontainers.org/downloads/$%7=
BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">h=
ttp://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-1.0.0-disable-udhcp-from-busybox-tem=
plate.patch \<br>
@@ -96,25 +96,25 @@ SYSTEMD_SERVICE_${PN}-networking =3D &quot;lxc-net.serv=
ice&quot;<br>
=C2=A0SYSTEMD_AUTO_ENABLE_${PN}-networking =3D &quot;enable&quot;<br>
<br>
=C2=A0INITSCRIPT_PACKAGES =3D &quot;${PN} ${PN}-networking&quot;<br>
-INITSCRIPT_NAME_${PN} =3D &quot;lxc-containers&quot;<br>
-INITSCRIPT_PARAMS_${PN} =3D &quot;defaults&quot;<br>
-INITSCRIPT_NAME_${PN}-networking =3D &quot;lxc-net&quot;<br>
-INITSCRIPT_PARAMS_${PN}-networking =3D &quot;defaults&quot;<br>
+INITSCRIPT_NAME:${PN} =3D &quot;lxc-containers&quot;<br>
+INITSCRIPT_PARAMS:${PN} =3D &quot;defaults&quot;<br>
+INITSCRIPT_NAME:${PN}-networking =3D &quot;lxc-net&quot;<br>
+INITSCRIPT_PARAMS:${PN}-networking =3D &quot;defaults&quot;<br>
<br>
-FILES_${PN}-doc =3D &quot;${mandir} ${infodir}&quot;<br>
+FILES:${PN}-doc =3D &quot;${mandir} ${infodir}&quot;<br>
=C2=A0# For LXC the docdir only contains example configuration files and sh=
ould be included in the lxc package<br>
-FILES_${PN} +=3D &quot;${docdir}&quot;<br>
-FILES_${PN} +=3D &quot;${libdir}/python3*&quot;<br>
-FILES_${PN} +=3D &quot;${datadir}/bash-completion&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libexecdir}/lxc/.debug&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libexecdir}/lxc/hooks/.debug&quot;<br>
+FILES:${PN} +=3D &quot;${docdir}&quot;<br>
+FILES:${PN} +=3D &quot;${libdir}/python3*&quot;<br>
+FILES:${PN} +=3D &quot;${datadir}/bash-completion&quot;<br>
+FILES:${PN}-dbg +=3D &quot;${libexecdir}/lxc/.debug&quot;<br>
+FILES:${PN}-dbg +=3D &quot;${libexecdir}/lxc/hooks/.debug&quot;<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-templates ${PN}-networking ${PN}-lua&quot;<=
br>
=C2=A0FILES_lua-${PN} =3D &quot;${datadir}/lua ${libdir}/lua&quot;<br>
=C2=A0FILES_lua-${PN}-dbg +=3D &quot;${libdir}/lua/lxc/.debug&quot;<br>
-FILES_${PN}-templates +=3D &quot;${datadir}/lxc/templates&quot;<br>
-RDEPENDS_${PN}-templates +=3D &quot;bash&quot;<br>
+FILES:${PN}-templates +=3D &quot;${datadir}/lxc/templates&quot;<br>
+RDEPENDS:${PN}-templates +=3D &quot;bash&quot;<br>
<br>
-FILES_${PN}-networking +=3D &quot; \<br>
+FILES:${PN}-networking +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/init.d/lxc-net \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/default/lxc-net \<br>
=C2=A0&quot;<br>
@@ -125,7 +125,7 @@ CACHED_CONFIGUREVARS +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0am_cv_python_pythondir=3D&#39;${PYTHON_SITEPACKAGES_DIR=
}&#39; \<br>
=C2=A0&quot;<br>
<br>
-do_install_append() {<br>
+do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # The /var/cache/lxc directory created by the M=
akefile<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # is wiped out in volatile, we need to create t=
his at boot.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${localstatedir}/cache<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_7.2.0.bb" r=
el=3D"noreferrer" target=3D"_blank">libvirt_7.2.0.bb</a> b/recipes-extended=
/libvirt/<a href=3D"http://libvirt_7.2.0.bb" rel=3D"noreferrer" target=3D"_=
blank">libvirt_7.2.0.bb</a><br>
index 19662a7..d86b0a0 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_7.2.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_7.2.0.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_7.2.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_7.2.0.bb</a><br>
@@ -13,11 +13,11 @@ DEPENDS =3D &quot;bridge-utils gnutls libxml2 lvm2 avah=
i parted curl libpcap util-linux<br>
<br>
=C2=A0# libvirt-guests.sh needs gettext.sh<br>
=C2=A0#<br>
-RDEPENDS_${PN} =3D &quot;gettext-runtime&quot;<br>
+RDEPENDS:${PN} =3D &quot;gettext-runtime&quot;<br>
<br>
-RDEPENDS_libvirt-libvirtd +=3D &quot;bridge-utils iptables pm-utils dnsmas=
q netcat-openbsd ebtables&quot;<br>
-RDEPENDS_libvirt-libvirtd_append_x86-64 =3D &quot; dmidecode&quot;<br>
-RDEPENDS_libvirt-libvirtd_append_x86 =3D &quot; dmidecode&quot;<br>
+RDEPENDS:libvirt-libvirtd +=3D &quot;bridge-utils iptables pm-utils dnsmas=
q netcat-openbsd ebtables&quot;<br>
+RDEPENDS:libvirt-libvirtd:append:x86-64 =3D &quot; dmidecode&quot;<br>
+RDEPENDS:libvirt-libvirtd:append:x86 =3D &quot; dmidecode&quot;<br>
<br>
=C2=A0#connman blocks the 53 port and libvirtd can&#39;t start its DNS serv=
ice<br>
=C2=A0RCONFLICTS_${PN}_libvirtd =3D &quot;connman&quot;<br>
@@ -36,12 +36,12 @@ SRC_URI[libvirt.sha256sum] =3D &quot;01f459d0c7ba500962=
2a628dba1a026200e8f4a299fea783b9<br>
<br>
=C2=A0inherit meson gettext update-rc.d pkgconfig systemd useradd perlnativ=
e<br>
=C2=A0USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
-GROUPADD_PARAM_${PN} =3D &quot;-r qemu; -r kvm&quot;<br>
-USERADD_PARAM_${PN} =3D &quot;-r -g qemu -G kvm qemu&quot;<br>
+GROUPADD_PARAM:${PN} =3D &quot;-r qemu; -r kvm&quot;<br>
+USERADD_PARAM:${PN} =3D &quot;-r -g qemu -G kvm qemu&quot;<br>
<br>
<br>
=C2=A0EXTRA_OEMESON +=3D &quot;--cross-file ${WORKDIR}/meson-${PN}.cross&qu=
ot;<br>
-do_write_config_append() {<br>
+do_write_config:append() {<br>
=C2=A0 =C2=A0 =C2=A0cat &gt;${WORKDIR}/meson-${PN}.cross &lt;&lt;EOF<br>
=C2=A0[binaries]<br>
=C2=A0iptables =3D &#39;/usr/sbin/iptables&#39;<br>
@@ -58,7 +58,7 @@ PACKAGES =3D+ &quot;${PN}-libvirtd ${PN}-virsh&quot;<br>
<br>
=C2=A0ALLOW_EMPTY_${PN}-libvirtd =3D &quot;1&quot;<br>
<br>
-FILES_${PN}-libvirtd =3D &quot; \<br>
+FILES:${PN}-libvirtd =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/init.d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/sysctl.d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/logrotate.d \<br>
@@ -70,12 +70,12 @@ FILES_${PN}-libvirtd =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &=
#39;gnutls&#39;, &#39;${sysconfdir}/pki/libvirt/* ${sysconfdir}/pki/CA/*&#3=
9;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-virsh =3D &quot; \<br>
+FILES:${PN}-virsh =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${bindir}/virsh \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/bash-completion/completions/virsh \<br>
=C2=A0&quot;<br>
<br>
-FILES_${PN} +=3D &quot;${libdir}/libvirt/connection-driver \<br>
+FILES:${PN} +=3D &quot;${libdir}/libvirt/connection-driver \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/augeas \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;, &#39;polkit&#39;, &#39;${datadir}/polkit-1&#39;, &#39;&#39;, d=
)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/bash-completion/comple=
tions/vsh \<br>
@@ -83,24 +83,24 @@ FILES_${PN} +=3D &quot;${libdir}/libvirt/connection-dri=
ver \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/firewalld/zones/libvirt.=
xml \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/libvirt/connection-driver/.debug ${li=
bdir}/libvirt/lock-driver/.debug&quot;<br>
-FILES_${PN}-staticdev +=3D &quot;${libdir}/*.a ${libdir}/libvirt/connectio=
n-driver/*.a ${libdir}/libvirt/lock-driver/*.a&quot;<br>
+FILES:${PN}-dbg +=3D &quot;${libdir}/libvirt/connection-driver/.debug ${li=
bdir}/libvirt/lock-driver/.debug&quot;<br>
+FILES:${PN}-staticdev +=3D &quot;${libdir}/*.a ${libdir}/libvirt/connectio=
n-driver/*.a ${libdir}/libvirt/lock-driver/*.a&quot;<br>
<br>
-CONFFILES_${PN} +=3D &quot;${sysconfdir}/libvirt/libvirt.conf \<br>
+CONFFILES:${PN} +=3D &quot;${sysconfdir}/libvirt/libvirt.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${sysconfdir}/libvirt/lxc.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${sysconfdir}/libvirt/qemu-lockd.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${sysconfdir}/libvirt/qemu.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${sysconfdir}/libvirt/virt-login-shell.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${sysconfdir}/libvirt/virtlockd.conf&quot;<br>
<br>
-CONFFILES_${PN}-libvirtd =3D &quot;${sysconfdir}/logrotate.d/libvirt ${sys=
confdir}/logrotate.d/libvirt.lxc \<br>
+CONFFILES:${PN}-libvirtd =3D &quot;${sysconfdir}/logrotate.d/libvirt ${sys=
confdir}/logrotate.d/libvirt.lxc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}/logrotate.d/libvirt.qemu ${sys=
confdir}/logrotate.d/libvirt.uml \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}/libvirt/libvirtd.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/lib/sysctl.d/libvirtd.conf&quot;<br>
<br>
=C2=A0INITSCRIPT_PACKAGES =3D &quot;${PN}-libvirtd&quot;<br>
-INITSCRIPT_NAME_${PN}-libvirtd =3D &quot;libvirtd&quot;<br>
-INITSCRIPT_PARAMS_${PN}-libvirtd =3D &quot;defaults 72&quot;<br>
+INITSCRIPT_NAME:${PN}-libvirtd =3D &quot;libvirtd&quot;<br>
+INITSCRIPT_PARAMS:${PN}-libvirtd =3D &quot;defaults 72&quot;<br>
<br>
=C2=A0SYSTEMD_PACKAGES =3D &quot;${PN}-libvirtd&quot;<br>
=C2=A0SYSTEMD_SERVICE_${PN}-libvirtd =3D &quot; \<br>
@@ -122,12 +122,12 @@ PACKAGECONFIG ??=3D &quot;gnutls qemu yajl openvz vmw=
are vbox esx lxc test remote \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
<br>
<br>
=C2=A0# qemu is NOT compatible with mips64<br>
-PACKAGECONFIG_remove_mipsarchn32 =3D &quot;qemu&quot;<br>
-PACKAGECONFIG_remove_mipsarchn64 =3D &quot;qemu&quot;<br>
+PACKAGECONFIG:remove_mipsarchn32 =3D &quot;qemu&quot;<br>
+PACKAGECONFIG:remove_mipsarchn64 =3D &quot;qemu&quot;<br>
<br>
=C2=A0# numactl is NOT compatible with arm<br>
-PACKAGECONFIG_remove_arm =3D &quot;numactl&quot;<br>
-PACKAGECONFIG_remove_armeb =3D &quot;numactl&quot;<br>
+PACKAGECONFIG:remove_arm =3D &quot;numactl&quot;<br>
+PACKAGECONFIG:remove_armeb =3D &quot;numactl&quot;<br>
<br>
=C2=A0# enable,disable,depends,rdepends<br>
=C2=A0#<br>
@@ -179,12 +179,12 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ninja all<br>
=C2=A0}<br>
<br>
-do_install_prepend() {<br>
+do_install:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # so the install routines can find the libvirt.=
pc in the source dir<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export PKG_CONFIG_PATH=3D&quot;$PKG_CONFIG_PATH=
:${B}/src:&quot;<br>
=C2=A0}<br>
<br>
-do_install_append() {<br>
+do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/etc/init.d<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/etc/libvirt<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/etc/dnsmasq.d<br>
@@ -313,8 +313,8 @@ EXTRA_OEMESON +=3D &quot; \<br>
<br>
=C2=A0# gcc9 end up mis-compiling qemuxml2argvtest.o with Og which then<br>
=C2=A0# crashes on target, so remove -Og and use -O2 as workaround<br>
-SELECTED_OPTIMIZATION_remove_virtclass-multilib-lib32_mipsarch =3D &quot;-=
Og&quot;<br>
-SELECTED_OPTIMIZATION_append_virtclass-multilib-lib32_mipsarch =3D &quot; =
-O2&quot;<br>
+SELECTED_OPTIMIZATION:remove_virtclass-multilib-lib32_mipsarch =3D &quot;-=
Og&quot;<br>
+SELECTED_OPTIMIZATION:append:virtclass-multilib-lib32_mipsarch =3D &quot; =
-O2&quot;<br>
<br>
=C2=A0pkg_postinst_${PN}() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$D&quot; ] &amp;&amp; [ -e =
/etc/init.d/populate-volatile.sh ] ; then<br>
diff --git a/recipes-extended/nagios/<a href=3D"http://nagios-plugins_2.2.1=
.bb" rel=3D"noreferrer" target=3D"_blank">nagios-plugins_2.2.1.bb</a> b/rec=
ipes-extended/nagios/<a href=3D"http://nagios-plugins_2.2.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">nagios-plugins_2.2.1.bb</a><br>
index b97d80c..f61262e 100644<br>
--- a/recipes-extended/nagios/<a href=3D"http://nagios-plugins_2.2.1.bb" re=
l=3D"noreferrer" target=3D"_blank">nagios-plugins_2.2.1.bb</a><br>
+++ b/recipes-extended/nagios/<a href=3D"http://nagios-plugins_2.2.1.bb" re=
l=3D"noreferrer" target=3D"_blank">nagios-plugins_2.2.1.bb</a><br>
@@ -59,17 +59,17 @@ do_configure() {<br>
=C2=A0 =C2=A0 =C2=A0oe_runconf || die &quot;make failed&quot;<br>
=C2=A0}<br>
<br>
-do_install_append() {<br>
+do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 sed -i &#39;1s,#! /usr/bin/perl -w.*,#! ${bindir}/env =
perl,&#39; ${D}${libdir}/nagios/plugins/*<br>
=C2=A0}<br>
<br>
-RDEPENDS_${PN} +=3D &quot;\<br>
+RDEPENDS:${PN} +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0iputils \<br>
=C2=A0 =C2=A0 =C2=A0nagios-base \<br>
=C2=A0 =C2=A0 =C2=A0perl \<br>
=C2=A0 =C2=A0 =C2=A0bash \<br>
=C2=A0&quot;<br>
<br>
-FILES_${PN} +=3D &quot;${datadir} \<br>
+FILES:${PN} +=3D &quot;${datadir} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${NAGIOS_PLUG=
IN_DIR} \<br>
=C2=A0&quot;<br>
diff --git a/recipes-extended/seabios/<a href=3D"http://seabios_1.14.0.bb" =
rel=3D"noreferrer" target=3D"_blank">seabios_1.14.0.bb</a> b/recipes-extend=
ed/seabios/<a href=3D"http://seabios_1.14.0.bb" rel=3D"noreferrer" target=
=3D"_blank">seabios_1.14.0.bb</a><br>
index 1591cb6..c13592f 100644<br>
--- a/recipes-extended/seabios/<a href=3D"http://seabios_1.14.0.bb" rel=3D"=
noreferrer" target=3D"_blank">seabios_1.14.0.bb</a><br>
+++ b/recipes-extended/seabios/<a href=3D"http://seabios_1.14.0.bb" rel=3D"=
noreferrer" target=3D"_blank">seabios_1.14.0.bb</a><br>
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb=
673463ab874e80d47fae504<br>
=C2=A0SRC_URI[md5sum] =3D &quot;9df3b7de6376850d09161137e7a9b61f&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;eb70cc62b29aa83e10a653233acebf4bb154d00d=
0c87dc2a2c6e2da75e5e81fd&quot;<br>
<br>
-FILES_${PN} =3D &quot;/usr/share/firmware&quot;<br>
+FILES:${PN} =3D &quot;/usr/share/firmware&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;util-linux-native file-native bison-native flex-na=
tive gettext-native acpica-native&quot;<br>
<br>
diff --git a/recipes-extended/upx/<a href=3D"http://upx_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">upx_git.bb</a> b/recipes-extended/upx/<a href=3D"=
http://upx_git.bb" rel=3D"noreferrer" target=3D"_blank">upx_git.bb</a><br>
index 96d2e99..8b13b17 100644<br>
--- a/recipes-extended/upx/<a href=3D"http://upx_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">upx_git.bb</a><br>
+++ b/recipes-extended/upx/<a href=3D"http://upx_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">upx_git.bb</a><br>
@@ -27,7 +27,7 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0oe_runmake -C src all<br>
=C2=A0}<br>
<br>
-do_install_append() {<br>
+do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}<br>
=C2=A0 =C2=A0 =C2=A0install -m 755 ${B}/src/upx.out ${D}${bindir}/upx<br>
=C2=A0}<br>
diff --git a/recipes-extended/vgabios/<a href=3D"http://biossums_0.7a.bb" r=
el=3D"noreferrer" target=3D"_blank">biossums_0.7a.bb</a> b/recipes-extended=
/vgabios/<a href=3D"http://biossums_0.7a.bb" rel=3D"noreferrer" target=3D"_=
blank">biossums_0.7a.bb</a><br>
index e66bade..ef0ef45 100644<br>
--- a/recipes-extended/vgabios/<a href=3D"http://biossums_0.7a.bb" rel=3D"n=
oreferrer" target=3D"_blank">biossums_0.7a.bb</a><br>
+++ b/recipes-extended/vgabios/<a href=3D"http://biossums_0.7a.bb" rel=3D"n=
oreferrer" target=3D"_blank">biossums_0.7a.bb</a><br>
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] =3D &quot;9d24c33d4bfb7831e2069cf36449=
36a53ef3de21d467872b54ce2ea308<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
<br>
-FILES_${PN} =3D &quot;${bindir}/biossums&quot;<br>
+FILES:${PN} =3D &quot;${bindir}/biossums&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/vgabios-${PV}&quot;<br>
<br>
diff --git a/recipes-extended/vgabios/<a href=3D"http://vgabios_0.7a.bb" re=
l=3D"noreferrer" target=3D"_blank">vgabios_0.7a.bb</a> b/recipes-extended/v=
gabios/<a href=3D"http://vgabios_0.7a.bb" rel=3D"noreferrer" target=3D"_bla=
nk">vgabios_0.7a.bb</a><br>
index 3394173..48a7835 100644<br>
--- a/recipes-extended/vgabios/<a href=3D"http://vgabios_0.7a.bb" rel=3D"no=
referrer" target=3D"_blank">vgabios_0.7a.bb</a><br>
+++ b/recipes-extended/vgabios/<a href=3D"http://vgabios_0.7a.bb" rel=3D"no=
referrer" target=3D"_blank">vgabios_0.7a.bb</a><br>
@@ -14,8 +14,8 @@ SRC_URI[sha256sum] =3D &quot;9d24c33d4bfb7831e2069cf36449=
36a53ef3de21d467872b54ce2ea308<br>
<br>
=C2=A0PR =3D &quot;r0&quot;<br>
<br>
-FILES_${PN} =3D &quot;/usr/share/firmware/${PN}-${PV}*.bin&quot;<br>
-FILES_${PN}-dbg =3D &quot;/usr/share/firmware/${PN}-${PV}*.debug.bin&quot;=
<br>
+FILES:${PN} =3D &quot;/usr/share/firmware/${PN}-${PV}*.bin&quot;<br>
+FILES:${PN}-dbg =3D &quot;/usr/share/firmware/${PN}-${PV}*.debug.bin&quot;=
<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/${PN}-${PV}&quot;<br>
<br>
diff --git a/recipes-extended/xen/xen-blktap.inc b/recipes-extended/xen/xen=
-blktap.inc<br>
index 5f385dd..7fec159 100644<br>
--- a/recipes-extended/xen/xen-blktap.inc<br>
+++ b/recipes-extended/xen/xen-blktap.inc<br>
@@ -31,34 +31,34 @@ RPROVIDES_${PN}-libblktap =3D &quot;virtual/libblktap&q=
uot;<br>
=C2=A0RPROVIDES_${PN}-libblktapctl =3D &quot;virtual/libblktapctl&quot;<br>
=C2=A0RPROVIDES_${PN}-libvhd =3D &quot;virtual/libvhd&quot;<br>
<br>
-FILES_${PN}-blktap-staticdev +=3D &quot;\<br>
+FILES:${PN}-blktap-staticdev +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libblktapctl.a \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libvhd.a \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libblktap.a \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-libblktapctl =3D &quot;${libdir}/libblktapctl.so.*&quot;<br>
-FILES_${PN}-libblktapctl-dev =3D &quot; \<br>
+FILES:${PN}-libblktapctl =3D &quot;${libdir}/libblktapctl.so.*&quot;<br>
+FILES:${PN}-libblktapctl-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libblktapctl.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/pkgconfig/xenblktapctl.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xenblktapctl.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-libvhd =3D &quot;${libdir}/libvhd.so.*&quot;<br>
-FILES_${PN}-libvhd-dev =3D &quot; \<br>
+FILES:${PN}-libvhd =3D &quot;${libdir}/libvhd.so.*&quot;<br>
+FILES:${PN}-libvhd-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libvhd.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/pkgconfig/vhd.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/vhd.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-libblktap =3D &quot;${libdir}/libblktap.so.*&quot;<br>
-FILES_${PN}-libblktap-dev =3D &quot; \<br>
+FILES:${PN}-libblktap =3D &quot;${libdir}/libblktap.so.*&quot;<br>
+FILES:${PN}-libblktap-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libblktap.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/pkgconfig/blktap.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/blktap.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-blktap =3D &quot;\<br>
+FILES:${PN}-blktap =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/blktapctrl \<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/img2qcow \<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/lock-util \<br>
diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen=
/xen-hypervisor.inc<br>
index 9b96d91..cffd491 100644<br>
--- a/recipes-extended/xen/xen-hypervisor.inc<br>
+++ b/recipes-extended/xen/xen-hypervisor.inc<br>
@@ -17,7 +17,7 @@ PACKAGES =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-efi \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN} =3D &quot; \<br>
+FILES:${PN} =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0/boot/xen-* \<br>
=C2=A0 =C2=A0 =C2=A0/boot/xen \<br>
=C2=A0 =C2=A0 =C2=A0/boot/xen-*.gz \<br>
@@ -25,9 +25,9 @@ FILES_${PN} =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0/boot/xen-syms-* \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/debug/*&quot;<br>
+FILES:${PN}-dbg +=3D &quot;${libdir}/debug/*&quot;<br>
<br>
-FILES_${PN}-efi =3D &quot; \<br>
+FILES:${PN}-efi =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0/boot/xen.efi \<br>
=C2=A0 =C2=A0 =C2=A0${exec_prefix}/lib64/efi/xen* \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-=
tools.inc<br>
index 2930097..ba4f2e7 100644<br>
--- a/recipes-extended/xen/xen-tools.inc<br>
+++ b/recipes-extended/xen/xen-tools.inc<br>
@@ -224,7 +224,7 @@ PROVIDES =3D+ &quot; \<br>
=C2=A0# virtual package to allow for substitution.<br>
=C2=A0RPROVIDES_${PN}-xenstored =3D &quot;virtual/xenstored&quot;<br>
<br>
-FILES_${PN}-dbg +=3D &quot;\<br>
+FILES:${PN}-dbg +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/.debug \<br>
=C2=A0 =C2=A0 =C2=A0${nonarch_libdir}/${PYTHON_DIR}/site-packages/.debug \<=
br>
=C2=A0 =C2=A0 =C2=A0${nonarch_libdir}/${PYTHON_DIR}/site-packages/xen/lowle=
vel/.debug \<br>
@@ -244,18 +244,18 @@ FILES_${PN}-dbg +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${nonarch_libdir}/${PYTHON_DIR}/dist-packages/xen/lowle=
vel/.debug \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-dev =3D &quot;\<br>
+FILES:${PN}-dev =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${includedir} \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-doc =3D &quot;\<br>
+FILES:${PN}-doc =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/README \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/README.incompatibilities \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/doc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/man \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-staticdev +=3D &quot;\<br>
+FILES:${PN}-staticdev +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenguest.a \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenlight.a \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenvchan.a \<br>
@@ -265,122 +265,122 @@ FILES_${PN}-staticdev +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenstore.a \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-libxencall =3D &quot;${libdir}/libxencall.so.*&quot;<br>
-FILES_${PN}-libxencall-dev =3D &quot; \<br>
+FILES:${PN}-libxencall =3D &quot;${libdir}/libxencall.so.*&quot;<br>
+FILES:${PN}-libxencall-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxencall.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/pkgconfig/xencall.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xencall.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-libxenctrl =3D &quot;${libdir}/libxenctrl.so.*&quot;<br>
-FILES_${PN}-libxenctrl-dev =3D &quot; \<br>
+FILES:${PN}-libxenctrl =3D &quot;${libdir}/libxenctrl.so.*&quot;<br>
+FILES:${PN}-libxenctrl-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenctrl.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/pkgconfig/xencontrol.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xencontrol.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-libxendevicemodel =3D &quot;${libdir}/libxendevicemodel.so.*&q=
uot;<br>
-FILES_${PN}-libxendevicemodel-dev =3D &quot; \<br>
+FILES:${PN}-libxendevicemodel =3D &quot;${libdir}/libxendevicemodel.so.*&q=
uot;<br>
+FILES:${PN}-libxendevicemodel-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxendevicemodel.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/pkgconfig/xendevicemodel.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xendevicemodel.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-libxenevtchn =3D &quot;${libdir}/libxenevtchn.so.*&quot;<br>
-FILES_${PN}-libxenevtchn-dev =3D &quot; \<br>
+FILES:${PN}-libxenevtchn =3D &quot;${libdir}/libxenevtchn.so.*&quot;<br>
+FILES:${PN}-libxenevtchn-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenevtchn.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/pkgconfig/xenevtchn.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xenevtchn.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-libxenforeignmemory =3D &quot;${libdir}/libxenforeignmemory.so=
.*&quot;<br>
-FILES_${PN}-libxenforeignmemory-dev =3D &quot; \<br>
+FILES:${PN}-libxenforeignmemory =3D &quot;${libdir}/libxenforeignmemory.so=
.*&quot;<br>
+FILES:${PN}-libxenforeignmemory-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenforeignmemory.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/pkgconfig/xenforeignmemory.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xenforeignmemory.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-libxengnttab =3D &quot;${libdir}/libxengnttab.so.*&quot;<br>
-FILES_${PN}-libxengnttab-dev =3D &quot; \<br>
+FILES:${PN}-libxengnttab =3D &quot;${libdir}/libxengnttab.so.*&quot;<br>
+FILES:${PN}-libxengnttab-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxengnttab.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/pkgconfig/xengnttab.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xengnttab.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-libxenguest =3D &quot;${libdir}/libxenguest.so.*&quot;<br>
-FILES_${PN}-libxenguest-dev =3D &quot; \<br>
+FILES:${PN}-libxenguest =3D &quot;${libdir}/libxenguest.so.*&quot;<br>
+FILES:${PN}-libxenguest-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenguest.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/pkgconfig/xenguest.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xenguest.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-libxenhypfs =3D &quot;${libdir}/libxenhypfs.so.*&quot;<br>
-FILES_${PN}-libxenhypfs-dev =3D &quot; \<br>
+FILES:${PN}-libxenhypfs =3D &quot;${libdir}/libxenhypfs.so.*&quot;<br>
+FILES:${PN}-libxenhypfs-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenhypfs.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/pkgconfig/xenhypfs.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-libxenlight =3D &quot;${libdir}/libxenlight.so.*&quot;<br>
-FILES_${PN}-libxenlight-dev =3D &quot; \<br>
+FILES:${PN}-libxenlight =3D &quot;${libdir}/libxenlight.so.*&quot;<br>
+FILES:${PN}-libxenlight-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenlight.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/pkgconfig/xenlight.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xenlight.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-libxenstat =3D &quot;${libdir}/libxenstat.so.*&quot;<br>
-FILES_${PN}-libxenstat-dev =3D &quot; \<br>
+FILES:${PN}-libxenstat =3D &quot;${libdir}/libxenstat.so.*&quot;<br>
+FILES:${PN}-libxenstat-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenstat.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/pkgconfig/xenstat.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xenstat.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-libxenstore =3D &quot;${libdir}/libxenstore.so.*&quot;<br>
-FILES_${PN}-libxenstore-dev =3D &quot; \<br>
+FILES:${PN}-libxenstore =3D &quot;${libdir}/libxenstore.so.*&quot;<br>
+FILES:${PN}-libxenstore-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenstore.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/pkgconfig/xenstore.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xenstore.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-libxentoolcore =3D &quot;${libdir}/libxentoolcore.so.*&quot;<b=
r>
-FILES_${PN}-libxentoolcore-dev =3D &quot; \<br>
+FILES:${PN}-libxentoolcore =3D &quot;${libdir}/libxentoolcore.so.*&quot;<b=
r>
+FILES:${PN}-libxentoolcore-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxentoolcore.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/pkgconfig/xentoolcore.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xentoolcore.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-libxentoollog =3D &quot;${libdir}/libxentoollog.so.*&quot;<br>
-FILES_${PN}-libxentoollog-dev =3D &quot; \<br>
+FILES:${PN}-libxentoollog =3D &quot;${libdir}/libxentoollog.so.*&quot;<br>
+FILES:${PN}-libxentoollog-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxentoollog.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/pkgconfig/xentoollog.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xentoollog.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-libxenvchan =3D &quot;${libdir}/libxenvchan.so.*&quot;<br>
-FILES_${PN}-libxenvchan-dev =3D &quot; \<br>
+FILES:${PN}-libxenvchan =3D &quot;${libdir}/libxenvchan.so.*&quot;<br>
+FILES:${PN}-libxenvchan-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenvchan.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/pkgconfig/xenvchan.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xenvchan.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-libxlutil =3D &quot;${libdir}/libxlutil.so.*&quot;<br>
-FILES_${PN}-libxlutil-dev =3D &quot; \<br>
+FILES:${PN}-libxlutil =3D &quot;${libdir}/libxlutil.so.*&quot;<br>
+FILES:${PN}-libxlutil-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxlutil.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/pkgconfig/xlutil.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xlutil.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
-FILES_${PN}-libvhd =3D &quot;${libdir}/libvhd.so.*&quot;<br>
-FILES_${PN}-libvhd-dev =3D &quot; \<br>
+FILES:${PN}-libvhd =3D &quot;${libdir}/libvhd.so.*&quot;<br>
+FILES:${PN}-libvhd-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libvhd.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/pkgconfig/vhd.pc \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/vhd.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-libfsimage =3D &quot; \<br>
+FILES:${PN}-libfsimage =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libfsimage.so.* \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenfsimage.so.* \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-libfsimage-dev =3D &quot; \<br>
+FILES:${PN}-libfsimage-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libfsimage.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libxenfsimage.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/pkgconfig/fsimage.pc \<br>
@@ -389,38 +389,38 @@ FILES_${PN}-libfsimage-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/pkgconfig/xenfsimage.pc \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-fsimage =3D &quot; \<br>
+FILES:${PN}-fsimage =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/fs/**/[a-z]*fsimage.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xenfsimage/**/fsimage.so \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-init-xenstore-dom =3D &quot;${libdir}/xen/bin/init-xenstore-do=
main&quot;<br>
+FILES:${PN}-init-xenstore-dom =3D &quot;${libdir}/xen/bin/init-xenstore-do=
main&quot;<br>
<br>
-FILES_${PN} =3D &quot;\<br>
+FILES:${PN} =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/auto \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/cpupool \<br>
=C2=A0 =C2=A0 =C2=A0${localstatedir}/xen/dump \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-console =3D &quot;\<br>
+FILES:${PN}-console =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/xenconsole \<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/xenconsoled \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-cpuid =3D &quot;\<br>
+FILES:${PN}-cpuid =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${bindir}/xen-cpuid \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-devd =3D &quot;\<br>
+FILES:${PN}-devd =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/init.d/xendriverdomain \<br>
=C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system/xendriverdomain.service \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-flask =3D &quot;\<br>
+FILES:${PN}-flask =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0/boot/xenpolicy-* \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-flask-tools =3D &quot;\<br>
+FILES:${PN}-flask-tools =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/flask-get-bool \<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/flask-getenforce \<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/flask-label-pci \<br>
@@ -429,25 +429,25 @@ FILES_${PN}-flask-tools =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/flask-setenforce \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-gdbsx =3D &quot;\<br>
+FILES:${PN}-gdbsx =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/gdbsx \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0INSANE_SKIP_${PN}-hvmloader =3D &quot;arch&quot;<br>
-FILES_${PN}-hvmloader =3D &quot;\<br>
+FILES:${PN}-hvmloader =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xen/boot/hvmloader \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-kdd =3D &quot;\<br>
+FILES:${PN}-kdd =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/kdd \<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/xen-kdd \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-livepatch +=3D &quot; \<br>
+FILES:${PN}-livepatch +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/xen-livepatch \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-misc =3D &quot;\<br>
+FILES:${PN}-misc =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${bindir}/xen-detect \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/depriv-fd-checker \<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/gtracestat \<br>
@@ -470,22 +470,22 @@ FILES_${PN}-misc =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/convert-legacy-stream \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-pygrub =3D &quot;\<br>
+FILES:${PN}-pygrub =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${bindir}/pygrub \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/pygrub \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0# Depending on the version of Xen libdir or nonarch libdir is used<br=
>
-FILES_${PN}-python =3D &quot;\<br>
+FILES:${PN}-python =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/${PYTHON_DIR} \<br>
=C2=A0 =C2=A0 =C2=A0${nonarch_libdir}/${PYTHON_DIR} \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-remus =3D &quot;\<br>
+FILES:${PN}-remus =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/remus-netbuf-setup \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-scripts-network =3D &quot; \<br>
+FILES:${PN}-scripts-network =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/colo-proxy-setup \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/network-bridge \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/network-nat \<br>
@@ -500,7 +500,7 @@ FILES_${PN}-scripts-network =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/vif-setup \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-scripts-block =3D &quot; \<br>
+FILES:${PN}-scripts-block =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/blktap \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/block \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/block-common.sh \<br>
@@ -513,7 +513,7 @@ FILES_${PN}-scripts-block =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/vscsi \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-scripts-common =3D &quot; \<br>
+FILES:${PN}-scripts-common =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/external-device-migrate \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/hotplugpath.sh \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/locking.sh \<br>
@@ -525,58 +525,58 @@ FILES_${PN}-scripts-common =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0INSANE_SKIP_${PN}-shim =3D &quot;arch&quot;<br>
-FILES_${PN}-shim =3D &quot; \<br>
+FILES:${PN}-shim =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xen/boot/xen-shim \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-ucode =3D &quot;\<br>
+FILES:${PN}-ucode =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/xen-ucode \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-vchan =3D &quot;\<br>
+FILES:${PN}-vchan =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${bindir}/vchan-socket-proxy \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-volatiles =3D &quot;\<br>
+FILES:${PN}-volatiles =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/default/volatiles/99_xen \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/tmpfiles.d/xen.conf \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-xcutils =3D &quot;\<br>
+FILES:${PN}-xcutils =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/lsevtchn \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/readnotes \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/xc_restore \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/xc_save \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-xencov =3D &quot;\<br>
+FILES:${PN}-xencov =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/xencov \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-xend-examples =3D &quot;\<br>
+FILES:${PN}-xend-examples =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/xend-config.sxp \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/xend-pci-permissive.sxp \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/xend-pci-quirks.sxp \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-xenhypfs =3D &quot;\<br>
+FILES:${PN}-xenhypfs =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/xenhypfs \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-xenpaging =3D &quot;\<br>
+FILES:${PN}-xenpaging =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/xenpaging \<br>
=C2=A0 =C2=A0 =C2=A0${localstatedir}/lib/xen/xenpaging \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-xenpmd =3D &quot;\<br>
+FILES:${PN}-xenpmd =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/xenpmd \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-xenstat =3D &quot;\<br>
+FILES:${PN}-xenstat =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/xentop \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-xenstore =3D &quot;\<br>
+FILES:${PN}-xenstore =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${bindir}/xenstore \<br>
=C2=A0 =C2=A0 =C2=A0${bindir}/xenstore-chmod \<br>
=C2=A0 =C2=A0 =C2=A0${bindir}/xenstore-control \<br>
@@ -589,12 +589,12 @@ FILES_${PN}-xenstore =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${bindir}/xenstore-write \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-xenstored =3D &quot;\<br>
+FILES:${PN}-xenstored =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/xenstored \<br>
=C2=A0 =C2=A0 =C2=A0${localstatedir}/lib/xenstored \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-xentrace =3D &quot;\<br>
+FILES:${PN}-xentrace =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${bindir}/xentrace \<br>
=C2=A0 =C2=A0 =C2=A0${bindir}/xentrace_setsize \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/xenctx \<br>
@@ -604,13 +604,13 @@ FILES_${PN}-xentrace =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/xentrace_setmask \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-xen-watchdog =3D &quot;\<br>
+FILES:${PN}-xen-watchdog =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/xenwatchdogd \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/init.d/xen-watchdog \<br>
=C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system/xen-watchdog.service \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-xl =3D &quot;\<br>
+FILES:${PN}-xl =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/bash_completion.d/xl.sh \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/bash_completion.d/xl \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/xl.conf \<br>
@@ -619,13 +619,13 @@ FILES_${PN}-xl =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/xen-init-dom0 \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-xl-examples =3D &quot;\<br>
+FILES:${PN}-xl-examples =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/xlexample.hvm \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/xlexample.pvlinux \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/xlexample.pvhlinux \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-xm-examples =3D &quot;\<br>
+FILES:${PN}-xm-examples =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/xmexample1 \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/xmexample2 \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/xmexample3 \<br>
@@ -636,19 +636,19 @@ FILES_${PN}-xm-examples =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/xmexample.vti \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-xenmon =3D &quot;\<br>
+FILES:${PN}-xenmon =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/xenbaked \<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/xenmon.py \<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/xenmon \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-xm =3D &quot;\<br>
+FILES:${PN}-xm =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/xm-config.xml \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/xen/create.dtd \<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/xm \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-xencommons +=3D &quot;\<br>
+FILES:${PN}-xencommons +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/default/xencommons \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/init.d/xencommons \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/launch-xenstore \<br>
@@ -661,23 +661,23 @@ FILES_${PN}-xencommons +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system/var-lib-xenstored.mount \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-xend +=3D &quot; \<br>
+FILES:${PN}-xend +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/init.d/xend \<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/xend \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-xendomains +=3D &quot;\<br>
+FILES:${PN}-xendomains +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/xendomains \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/default/xendomains \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/init.d/xendomains \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/sysconfig/xendomains \<br>
=C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system/xendomains.service \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
-FILES_${PN}-xen-access +=3D &quot;\<br>
+FILES:${PN}-xen-access +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/xen-access \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-FILES_${PN}-xen-memshare +=3D &quot;\<br>
+FILES:${PN}-xen-memshare +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/xen-memshare \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index 3438034..277c8f4 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -118,8 +118,8 @@ EXTRA_CFLAGS_XEN_TOOLS=3D&quot;${HOST_CC_ARCH} ${CFLAGS=
}&quot;<br>
=C2=A0CC_arm=3D&quot;${CCACHE}${HOST_PREFIX}gcc ${TUNE_CCARGS} ${TOOLCHAIN_=
OPTIONS} ${CC_REPRODUCIBLE_OPTIONS}&quot;<br>
<br>
=C2=A0# There are no Xen-provided variables for C++, so append to the tool =
variables:<br>
-CPP_append =3D &quot; ${CPPFLAGS}&quot;<br>
-CXX_append =3D &quot; ${CXXFLAGS}&quot;<br>
+CPP:append =3D &quot; ${CPPFLAGS}&quot;<br>
+CXX:append =3D &quot; ${CXXFLAGS}&quot;<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0--exec-prefix=3D${prefix} \<br>
@@ -193,7 +193,7 @@ do_post_patch() {<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
-do_post_patch_append_arm()=C2=A0 {<br>
+do_post_patch:append:arm()=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0# The hypervisor binary must not be built with the hard=
 floating point ABI.<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;CC :=3D \$(filter-out ${TUNE_CCARGS},\$(CC))=
&quot; &gt;&gt; ${S}/xen/arch/arm/Rules.mk<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;CPP :=3D \$(filter-out ${TUNE_CCARGS},\$(CPP=
))&quot; &gt;&gt; ${S}/xen/arch/arm/Rules.mk<br>
@@ -229,13 +229,13 @@ do_configure_common() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PYTHON=3D&quot;${PY=
THON}&quot;<br>
=C2=A0}<br>
<br>
-do_compile_prepend() {<br>
+do_compile:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0# workaround for build bug when CFLAGS is exported<br>
=C2=A0 =C2=A0 =C2=A0# <a href=3D"https://www.mail-archive.com/xen-devel@lis=
ts.xen.org/msg67822.html" rel=3D"noreferrer" target=3D"_blank">https://www.=
mail-archive.com/xen-devel@lists.xen.org/msg67822.html</a><br>
=C2=A0 =C2=A0 =C2=A0unset CFLAGS<br>
=C2=A0}<br>
<br>
-do_install_prepend() {<br>
+do_install:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0# CFLAGS is used to set PY_CFLAGS which affects the pyg=
rub install<br>
=C2=A0 =C2=A0 =C2=A0# so also need to unset CFLAGS here:<br>
=C2=A0 =C2=A0 =C2=A0unset CFLAGS<br>
diff --git a/recipes-extended/xen/<a href=3D"http://xtf_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">xtf_git.bb</a> b/recipes-extended/xen/<a href=3D"=
http://xtf_git.bb" rel=3D"noreferrer" target=3D"_blank">xtf_git.bb</a><br>
index bf7470e..9a669e3 100644<br>
--- a/recipes-extended/xen/<a href=3D"http://xtf_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">xtf_git.bb</a><br>
+++ b/recipes-extended/xen/<a href=3D"http://xtf_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">xtf_git.bb</a><br>
@@ -20,7 +20,7 @@ inherit python3native<br>
<br>
=C2=A0PACKAGES =3D &quot;${PN}&quot;<br>
<br>
-FILES_${PN} =3D &quot; \<br>
+FILES:${PN} =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libexecdir}/* \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
diff --git a/recipes-extended/xvisor/<a href=3D"http://xvisor_git.bb" rel=
=3D"noreferrer" target=3D"_blank">xvisor_git.bb</a> b/recipes-extended/xvis=
or/<a href=3D"http://xvisor_git.bb" rel=3D"noreferrer" target=3D"_blank">xv=
isor_git.bb</a><br>
index 831c943..130b0d5 100644<br>
--- a/recipes-extended/xvisor/<a href=3D"http://xvisor_git.bb" rel=3D"noref=
errer" target=3D"_blank">xvisor_git.bb</a><br>
+++ b/recipes-extended/xvisor/<a href=3D"http://xvisor_git.bb" rel=3D"noref=
errer" target=3D"_blank">xvisor_git.bb</a><br>
@@ -25,7 +25,7 @@ do_configure() {<br>
=C2=A0 =C2=A0 =C2=A0oe_runmake ${CONFIG}<br>
=C2=A0}<br>
<br>
-do_install_append() {<br>
+do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}<br>
=C2=A0 =C2=A0 =C2=A0install -m 755 ${B}/build/vmm.* ${D}/<br>
<br>
@@ -44,8 +44,8 @@ do_deploy () {<br>
<br>
=C2=A0addtask deploy after do_install<br>
<br>
-FILES_${PN} +=3D &quot;/vmm.*&quot;<br>
-FILES_${PN} +=3D &quot;/*.dtb&quot;<br>
+FILES:${PN} +=3D &quot;/vmm.*&quot;<br>
+FILES:${PN} +=3D &quot;/*.dtb&quot;<br>
<br>
=C2=A0COMPATIBLE_HOST =3D &quot;(aarch64|riscv64|riscv32).*&quot;<br>
=C2=A0INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
diff --git a/recipes-graphics/xorg-xserver/xserver-xorg_xen.inc b/recipes-g=
raphics/xorg-xserver/xserver-xorg_xen.inc<br>
index 9503404..a2d913e 100644<br>
--- a/recipes-graphics/xorg-xserver/xserver-xorg_xen.inc<br>
+++ b/recipes-graphics/xorg-xserver/xserver-xorg_xen.inc<br>
@@ -10,4 +10,4 @@ XEN_REMOVED_OPENGL_PKGCONFIGS_x86-64 =3D &quot;&quot;<br>
<br>
=C2=A0REMOVED_OPENGL_PKGCONFIGS ?=3D &quot;${@bb.utils.contains(&#39;DISTRO=
_FEATURES&#39;, &#39;xen&#39;, &quot;${XEN_REMOVED_OPENGL_PKGCONFIGS}&quot;=
, &#39;&#39;, d)}&quot;<br>
<br>
-OPENGL_PKGCONFIGS_remove =3D &quot;${REMOVED_OPENGL_PKGCONFIGS}&quot;<br>
+OPENGL_PKGCONFIGS:remove =3D &quot;${REMOVED_OPENGL_PKGCONFIGS}&quot;<br>
diff --git a/recipes-kernel/dtc/<a href=3D"http://python3-dtc_1.6.1.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-dtc_1.6.1.bb</a> b/recipes-kernel=
/dtc/<a href=3D"http://python3-dtc_1.6.1.bb" rel=3D"noreferrer" target=3D"_=
blank">python3-dtc_1.6.1.bb</a><br>
index 9088931..3929565 100644<br>
--- a/recipes-kernel/dtc/<a href=3D"http://python3-dtc_1.6.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-dtc_1.6.1.bb</a><br>
+++ b/recipes-kernel/dtc/<a href=3D"http://python3-dtc_1.6.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-dtc_1.6.1.bb</a><br>
@@ -20,7 +20,7 @@ inherit distutils3<br>
<br>
=C2=A0DISTUTILS_SETUP_PATH =3D &quot;${S}/pylibfdt&quot;<br>
<br>
-do_configure_prepend() {<br>
+do_configure:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0oe_runmake -C &quot;${S}&quot; version_gen.h<br>
=C2=A0 =C2=A0 =C2=A0mv &quot;${S}/version_gen.h&quot; &quot;${DISTUTILS_SET=
UP_PATH}/&quot;<br>
=C2=A0}<br>
diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/recipes-=
kernel/linux/linux-yocto_virtualization.inc<br>
index 321dda2..d2227ea 100644<br>
--- a/recipes-kernel/linux/linux-yocto_virtualization.inc<br>
+++ b/recipes-kernel/linux/linux-yocto_virtualization.inc<br>
@@ -1,4 +1,4 @@<br>
-FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/linux-yocto:&quot;<br>
+FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/linux-yocto:&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ebtables.scc \<br>
@@ -7,15 +7,15 @@ SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://docker.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://cgroup-hugetlb.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-KERNEL_FEATURES_append =3D &quot; ${@bb.utils.contains(&#39;DISTRO_FEATURE=
S&#39;, &#39;kvm&#39;, &#39;features/kvm/qemu-kvm-enable.scc&#39;, &#39;&#3=
9;, d)}&quot;<br>
+KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&#39;DISTRO_FEATURE=
S&#39;, &#39;kvm&#39;, &#39;features/kvm/qemu-kvm-enable.scc&#39;, &#39;&#3=
9;, d)}&quot;<br>
<br>
=C2=A0KERNEL_MODULE_AUTOLOAD +=3D &quot;nf_conntrack_ipv6 openvswitch&quot;=
<br>
=C2=A0KERNEL_MODULE_AUTOLOAD +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FE=
ATURES&#39;, &#39;kvm&#39;, &#39;kvm&#39;, &#39;&#39;, d)}&quot;<br>
<br>
=C2=A0# aufs kernel support required for xen-image-minimal<br>
-KERNEL_FEATURES_append +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURE=
S&#39;, &#39;aufs&#39;, &#39; features/aufs/aufs-enable.scc&#39;, &#39;&#39=
;, d)}&quot;<br>
+KERNEL_FEATURES:append +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURE=
S&#39;, &#39;aufs&#39;, &#39; features/aufs/aufs-enable.scc&#39;, &#39;&#39=
;, d)}&quot;<br>
<br>
-KERNEL_FEATURES_append =3D &quot; cfg/virtio.scc&quot;<br>
+KERNEL_FEATURES:append =3D &quot; cfg/virtio.scc&quot;<br>
<br>
=C2=A0# xen kernel support<br>
=C2=A0SRC_URI +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#=
39;xen&#39;, &#39; file://xen.scc&#39;, &#39;&#39;, d)}&quot;<br>
diff --git a/recipes-kernel/lopper/<a href=3D"http://lopper.bb" rel=3D"nore=
ferrer" target=3D"_blank">lopper.bb</a> b/recipes-kernel/lopper/<a href=3D"=
http://lopper.bb" rel=3D"noreferrer" target=3D"_blank">lopper.bb</a><br>
index 274d5b9..ae280ee 100644<br>
--- a/recipes-kernel/lopper/<a href=3D"http://lopper.bb" rel=3D"noreferrer"=
 target=3D"_blank">lopper.bb</a><br>
+++ b/recipes-kernel/lopper/<a href=3D"http://lopper.bb" rel=3D"noreferrer"=
 target=3D"_blank">lopper.bb</a><br>
@@ -9,7 +9,7 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.md;md5=3D8e5f5f691f01c9fdfa=
7a7f2d535be619&quot;<br>
<br>
-RDEPENDS_${PN} =3D &quot; \<br>
+RDEPENDS:${PN} =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-core \<br>
=C2=A0 =C2=A0 =C2=A0python3-dtc \<br>
=C2=A0 =C2=A0 =C2=A0python3-humanfriendly \<br>
diff --git a/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"no=
referrer" target=3D"_blank">cni_git.bb</a> b/recipes-networking/cni/<a href=
=3D"http://cni_git.bb" rel=3D"noreferrer" target=3D"_blank">cni_git.bb</a><=
br>
index ece5142..62523bc 100644<br>
--- a/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cni_git.bb</a><br>
+++ b/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cni_git.bb</a><br>
@@ -65,10 +65,10 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0ln -sf ${libexecdir}/cni/ ${D}/opt/cni/bin<br>
=C2=A0}<br>
<br>
-FILES_${PN} +=3D &quot;${libexecdir}/cni/* /opt/cni/bin&quot;<br>
+FILES:${PN} +=3D &quot;${libexecdir}/cni/* /opt/cni/bin&quot;<br>
<br>
=C2=A0INSANE_SKIP_${PN} +=3D &quot;ldflags already-stripped&quot;<br>
<br>
=C2=A0deltask compile_ptest_base<br>
<br>
-RDEPENDS_${PN} +=3D &quot; ca-certificates&quot;<br>
+RDEPENDS:${PN} +=3D &quot; ca-certificates&quot;<br>
diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-netwo=
rking/openvswitch/openvswitch.inc<br>
index 37fbe5a..52cc58e 100644<br>
--- a/recipes-networking/openvswitch/openvswitch.inc<br>
+++ b/recipes-networking/openvswitch/openvswitch.inc<br>
@@ -13,18 +13,18 @@ LICENSE =3D &quot;Apache-2&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;bridge-utils openssl python3 perl python3-six-nati=
ve coreutils-native&quot;<br>
<br>
-RDEPENDS_${PN} +=3D &quot;util-linux-uuidgen util-linux-libuuid coreutils =
\<br>
+RDEPENDS:${PN} +=3D &quot;util-linux-uuidgen util-linux-libuuid coreutils =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3 perl perl-module-strict ${PN}-swi=
tch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bash python3-twisted python3-six&quot;<br=
>
-RDEPENDS_${PN}-testcontroller =3D &quot;${PN} ${PN}-pki&quot;<br>
-RDEPENDS_${PN}-switch =3D &quot;${PN} openssl procps util-linux-uuidgen&qu=
ot;<br>
-RDEPENDS_${PN}-pki =3D &quot;${PN}&quot;<br>
-RDEPENDS_${PN}-brcompat =3D &quot;${PN} ${PN}-switch&quot;<br>
+RDEPENDS:${PN}-testcontroller =3D &quot;${PN} ${PN}-pki&quot;<br>
+RDEPENDS:${PN}-switch =3D &quot;${PN} openssl procps util-linux-uuidgen&qu=
ot;<br>
+RDEPENDS:${PN}-pki =3D &quot;${PN}&quot;<br>
+RDEPENDS:${PN}-brcompat =3D &quot;${PN} ${PN}-switch&quot;<br>
<br>
=C2=A0# Some installers will fail because of an install order based on<br>
=C2=A0# rdeps.=C2=A0 E.g. ovs-pki calls sed in the postinstall.=C2=A0 sed m=
ay be<br>
=C2=A0# queued for install later.<br>
-RDEPENDS_${PN} +=3D &quot;sed gawk grep&quot;<br>
+RDEPENDS:${PN} +=3D &quot;sed gawk grep&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://openvswitch-switch \<br>
@@ -48,16 +48,16 @@ CONFIGUREOPT_DEPTRACK =3D &quot;&quot;<br>
=C2=A0ALLOW_EMPTY_${PN}-pki =3D &quot;1&quot;<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-testcontroller ${PN}-switch ${PN}-brcompat =
${PN}-pki&quot;<br>
<br>
-FILES_${PN}-testcontroller =3D &quot;\<br>
+FILES:${PN}-testcontroller =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/init.d/openvswitch-testcontroller=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/default/openvswitch-testcontrolle=
r \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/openvswitch-testcontroller \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${bindir}/ovs-testcontroller \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-FILES_${PN}-brcompat =3D &quot;${sbindir}/ovs-brcompatd&quot;<br>
+FILES:${PN}-brcompat =3D &quot;${sbindir}/ovs-brcompatd&quot;<br>
<br>
-FILES_${PN}-switch =3D &quot;\<br>
+FILES:${PN}-switch =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/init.d/openvswitch-switch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/default/openvswitch-switch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${systemd_unitdir}/system/ovs-vswitchd.service =
\<br>
@@ -68,10 +68,10 @@ FILES_${PN}-switch =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0# silence a warning<br>
-FILES_${PN} +=3D &quot;${datadir}/ovsdbmonitor&quot;<br>
-FILES_${PN} +=3D &quot;/run&quot;<br>
+FILES:${PN} +=3D &quot;${datadir}/ovsdbmonitor&quot;<br>
+FILES:${PN} +=3D &quot;/run&quot;<br>
<br>
-FILES_${PN} +=3D &quot;${libdir}/python${PYTHON_BASEVERSION}/&quot;<br>
+FILES:${PN} +=3D &quot;${libdir}/python${PYTHON_BASEVERSION}/&quot;<br>
=C2=A0inherit autotools update-rc.d systemd python3native<br>
<br>
=C2=A0SYSTEMD_PACKAGES =3D &quot;${PN}-switch&quot;<br>
@@ -82,19 +82,19 @@ SYSTEMD_SERVICE_${PN}-switch =3D &quot; \<br>
=C2=A0&quot;<br>
<br>
=C2=A0INITSCRIPT_PACKAGES =3D &quot;${PN}-switch ${PN}-testcontroller&quot;=
<br>
-INITSCRIPT_NAME_${PN}-switch =3D &quot;openvswitch-switch&quot;<br>
-INITSCRIPT_PARAMS_${PN}-switch =3D &quot;defaults 71&quot;<br>
+INITSCRIPT_NAME:${PN}-switch =3D &quot;openvswitch-switch&quot;<br>
+INITSCRIPT_PARAMS:${PN}-switch =3D &quot;defaults 71&quot;<br>
<br>
-INITSCRIPT_NAME_${PN}-testcontroller =3D &quot;openvswitch-testcontroller&=
quot;<br>
-INITSCRIPT_PARAMS_${PN}-testcontroller =3D &quot;defaults 72&quot;<br>
+INITSCRIPT_NAME:${PN}-testcontroller =3D &quot;openvswitch-testcontroller&=
quot;<br>
+INITSCRIPT_PARAMS:${PN}-testcontroller =3D &quot;defaults 72&quot;<br>
<br>
-do_configure_prepend() {<br>
+do_configure:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Work around the for Makefile CC=3D$(if ....) =
by swapping out any<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # &quot;-Wa,&quot; assembly directives with &qu=
ot;-Xassembler<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CC=3D`echo &#39;${CC}&#39; | sed &#39;s/-Wa,/-X=
assembler /g&#39;`<br>
=C2=A0}<br>
<br>
-do_install_prepend() {<br>
+do_install:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SERVICE_FILE=3D&quot;${S}/rhel/usr_lib_systemd_=
system_ovs-vswitchd.service&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${S}/build-aux/dpdkstrip.py \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;,&#39;dpdk&#39;,&#39;--dpdk&#39;,&#39;--nodpdk&#39;,d)} \<br>
@@ -102,7 +102,7 @@ do_install_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; ${SERVICE_FILE}<br>
=C2=A0}<br>
<br>
-do_install_append() {<br>
+do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/${sysconfdir}/default/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 660 ${WORKDIR}/openvswitch-switch-se=
tup ${D}/${sysconfdir}/default/openvswitch-switch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/${sysconfdir}/openvswitch-testc=
ontroller<br>
@@ -137,13 +137,13 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -r ${S}/python/ovstest/ ${D}${libdir}/python=
${PYTHON_BASEVERSION}/site-packages/<br>
=C2=A0}<br>
<br>
-pkg_postinst_ontarget_${PN}-pki () {<br>
+pkg_postinst_ontarget:${PN}-pki () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test ! -d $D/${datadir}/${PN}/pki; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ovs-pki init --dir=
=3D$D/${datadir}/${PN}/pki<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
-pkg_postinst_ontarget_${PN}-testcontroller () {<br>
+pkg_postinst_ontarget:${PN}-testcontroller () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test ! -d $D/${datadir}/${PN}/pki; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ovs-pki init --dir=
=3D$D/${datadir}/${PN}/pki<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
diff --git a/recipes-networking/openvswitch/<a href=3D"http://openvswitch_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a> b/recipe=
s-networking/openvswitch/<a href=3D"http://openvswitch_git.bb" rel=3D"noref=
errer" target=3D"_blank">openvswitch_git.bb</a><br>
index 616bc27..412a707 100644<br>
--- a/recipes-networking/openvswitch/<a href=3D"http://openvswitch_git.bb" =
rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
+++ b/recipes-networking/openvswitch/<a href=3D"http://openvswitch_git.bb" =
rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
@@ -4,7 +4,7 @@ DEPENDS +=3D &quot;virtual/kernel&quot;<br>
<br>
=C2=A0PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
<br>
-RDEPENDS_${PN}-ptest +=3D &quot;\<br>
+RDEPENDS:${PN}-ptest +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-logging python3-syslog python3-io pytho=
n3-core \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-fcntl python3-shell python3-xml python3=
-math \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-datetime python3-netclient python3 sed =
\<br>
@@ -17,7 +17,7 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
=C2=A0PV =3D &quot;2.15+${SRCPV}&quot;<br>
=C2=A0CVE_VERSION =3D &quot;2.13.0&quot;<br>
<br>
-FILESEXTRAPATHS_append :=3D &quot;${THISDIR}/${PN}-git:&quot;<br>
+FILESEXTRAPATHS:append :=3D &quot;${THISDIR}/${PN}-git:&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;8dc1733eaea866dce033b3c44853e1b09bf59fc7&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/openvswitch/ovs=
.git;protocol=3Dgit;branch=3Dbranch-2.15" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/openvswitch/ovs.git;protocol=3Dgit;branch=3Dbranch-2.15</a> =
\<br>
@@ -45,7 +45,7 @@ PACKAGECONFIG[ssl] =3D &quot;,--disable-ssl,openssl,&quot=
;<br>
=C2=A0# EXTRA_OECONF +=3D &quot;--with-linux=3D${STAGING_KERNEL_BUILDDIR} -=
-with-linux-source=3D${STAGING_KERNEL_DIR} KARCH=3D${TARGET_ARCH}&quot;<br>
<br>
=C2=A0# silence a warning<br>
-FILES_${PN} +=3D &quot;/lib/modules&quot;<br>
+FILES:${PN} +=3D &quot;/lib/modules&quot;<br>
<br>
=C2=A0inherit ptest<br>
<br>
@@ -55,6 +55,6 @@ do_install_ptest() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake test-install<br>
=C2=A0}<br>
<br>
-do_install_append() {<br>
+do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake modules_install INSTALL_MOD_PATH=3D$=
{D}<br>
=C2=A0}<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000002eb10405c8e17ac8--
