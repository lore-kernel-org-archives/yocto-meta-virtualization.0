Return-Path: <asselsm@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A367E01405
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Aug 2013 07:00:49 -0700 (PDT)
Received: by mail-oa0-f41.google.com with SMTP id j6so1147534oag.14
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Aug 2013 07:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=x43qjyg+NZanscBuN2cIbzZWGQUjTe5QG84CklJKrd8=;
	b=d/nuMFmCdyfPf+gdYquDpqzzNJR6KkVy4lwd5nbtOpTnXayWv1RRverkCEA6QmF+Gg
	tFcHbRcqogTCVazBUpjQkNa65op4fBKb2MsB3MfQi4SJZjasBWmiAQ4cwNHxjoSRQAQJ
	6P2vAwvvommi0KFrRi0N/l99P5l2EZSFwCEDcmfnvUyxP6IsKmktQlwx4Ag71eriYvze
	UFxo2v0uRV7SK86SHY5CPwS/2lcSYtaYa5MDFGs9lSBc5BPfVqA8QIVij/ncVY2CGBBi
	BU89FXMIBAfmL2irTR3IcCvWhK9fCuVnYEh4dJOSat9Stu+TtlEnC4M2lIajDZw2C8FL
	TcjA==
MIME-Version: 1.0
X-Received: by 10.50.138.165 with SMTP id qr5mr3667768igb.25.1376920849095;
	Mon, 19 Aug 2013 07:00:49 -0700 (PDT)
Sender: asselsm@gmail.com
Received: by 10.43.53.212 with HTTP; Mon, 19 Aug 2013 07:00:49 -0700 (PDT)
In-Reply-To: <1376194618-25627-2-git-send-email-bruce.ashfield@windriver.com>
References: <1376194618-25627-1-git-send-email-bruce.ashfield@windriver.com>
	<1376194618-25627-2-git-send-email-bruce.ashfield@windriver.com>
Date: Mon, 19 Aug 2013 10:00:49 -0400
X-Google-Sender-Auth: HN7dUAKBhkmfjkvIDIJ95YGRE5M
Message-ID: <CAPuovEK=seoN3sutnP112NtshRv5gaSfnVUcU+zqNds=BFzG9A@mail.gmail.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/2] libvirt: update to 1.1.1
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
X-List-Received-Date: Mon, 19 Aug 2013 14:00:50 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 11, 2013 at 12:16 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> Updating to the 1.1.1 libvirt release. Changes from the 1.0.3 recipe include
> a fix/workaround for the:
>
>  ../src/.libs/libvirt.so: undefined reference to `virNetTLSInit'
>
> That is seen on some machines. The current fix is to explicilty link against
> the library which provides the definition. A smarter fix via libtool may
> be possible, but was elusive at the time of writing this patch.
>

Bruce,

I have looked it to this, more than I really should have. As soon as
'remote' or 'lxc' or a few other possibly options are enabled via
PACKAGECONFIG libvirt-net-rpc.la ends up being linked in to libvirt.so
and thus virNetTLSInit no longer undefined. The fix you have is fine,
another approach is to add libvirt-net-rpc.la to one of the Makefile
vars, when GNUTLS is enabled, such that it is linked into libvirt.so.
Also using any sane config will ensure this is the case anyway and
your change can be dropped.

Mark


> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  ...ibvirt-net-rpc-to-virt-host-validate-when.patch |  127 ++++++++++++++
>  recipes-extended/libvirt/libvirt_1.1.1.bb          |  180 ++++++++++++++++++++
>  2 files changed, 307 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch
>  create mode 100644 recipes-extended/libvirt/libvirt_1.1.1.bb
>
> diff --git a/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch b/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch
> new file mode 100644
> index 0000000..821af90
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch
> @@ -0,0 +1,127 @@
> +From 70700ad6bf2db2ba8e169168f225458743b90f86 Mon Sep 17 00:00:00 2001
> +From: Bruce Ashfield <bruce.ashfield@windriver.com>
> +Date: Fri, 2 Aug 2013 11:38:43 -0400
> +Subject: [PATCH] tools: add libvirt-net-rpc to virt-host-validate when TLS is
> + enabled
> +
> +When gnu-tls is enabled for libvirt references to virNetTLSInit are
> +generated in libvirt. Any binaries linking against libvirt, must also
> +link against libvirt-net-rpc which provides the implementation.
> +
> +Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> +---
> + examples/domain-events/events-c/Makefile.am |    6 ++++++
> + examples/dominfo/Makefile.am                |    7 +++++++
> + examples/domsuspend/Makefile.am             |    7 +++++++
> + examples/hellolibvirt/Makefile.am           |    7 +++++++
> + examples/openauth/Makefile.am               |    6 ++++++
> + tools/Makefile.am                           |   13 +++++++++++++
> + 6 files changed, 46 insertions(+)
> +
> +diff --git a/examples/domain-events/events-c/Makefile.am b/examples/domain-events/events-c/Makefile.am
> +index 0646aee..6b2f5bd 100644
> +--- a/examples/domain-events/events-c/Makefile.am
> ++++ b/examples/domain-events/events-c/Makefile.am
> +@@ -21,3 +21,9 @@ event_test_CFLAGS = $(WARN_CFLAGS)
> + event_test_SOURCES = event-test.c
> + event_test_LDADD = $(top_builddir)/src/libvirt.la \
> +                $(top_builddir)/gnulib/lib/libgnu.la
> ++
> ++if WITH_GNUTLS
> ++event_test_LDADD += ../../../src/libvirt-net-rpc.la \
> ++                    ../../../gnulib/lib/libgnu.la
> ++endif
> ++
> +diff --git a/examples/dominfo/Makefile.am b/examples/dominfo/Makefile.am
> +index 4a30c77..99b3e17 100644
> +--- a/examples/dominfo/Makefile.am
> ++++ b/examples/dominfo/Makefile.am
> +@@ -23,3 +23,10 @@ noinst_PROGRAMS=info1
> + info1_SOURCES=info1.c
> + info1_LDFLAGS=
> + info1_LDADD= $(LDADDS)
> ++
> ++if WITH_GNUTLS
> ++info1_LDADD += $(top_builddir)/src/libvirt-net-rpc.la  \
> ++               $(top_builddir)/gnulib/lib/libgnu.la    \
> ++               $(NULL)
> ++endif
> ++
> +diff --git a/examples/domsuspend/Makefile.am b/examples/domsuspend/Makefile.am
> +index d0d9368..e368ffa 100644
> +--- a/examples/domsuspend/Makefile.am
> ++++ b/examples/domsuspend/Makefile.am
> +@@ -23,3 +23,10 @@ noinst_PROGRAMS=suspend
> + suspend_SOURCES=suspend.c
> + suspend_LDFLAGS=
> + suspend_LDADD= $(LDADDS)
> ++
> ++if WITH_GNUTLS
> ++suspend_LDADD += $(top_builddir)/src/libvirt-net-rpc.la  \
> ++                 $(top_builddir)/gnulib/lib/libgnu.la    \
> ++                 $(NULL)
> ++endif
> ++
> +diff --git a/examples/hellolibvirt/Makefile.am b/examples/hellolibvirt/Makefile.am
> +index 060cc71..d6ff30a 100644
> +--- a/examples/hellolibvirt/Makefile.am
> ++++ b/examples/hellolibvirt/Makefile.am
> +@@ -19,3 +19,10 @@ noinst_PROGRAMS = hellolibvirt
> + hellolibvirt_CFLAGS = $(WARN_CFLAGS)
> + hellolibvirt_SOURCES = hellolibvirt.c
> + hellolibvirt_LDADD = $(top_builddir)/src/libvirt.la
> ++
> ++if WITH_GNUTLS
> ++hellolibvirt_LDADD += $(top_builddir)/src/libvirt-net-rpc.la  \
> ++                      $(top_builddir)/gnulib/lib/libgnu.la    \
> ++                      $(NULL)
> ++endif
> ++
> +diff --git a/examples/openauth/Makefile.am b/examples/openauth/Makefile.am
> +index 1eb23fc..4d076f1 100644
> +--- a/examples/openauth/Makefile.am
> ++++ b/examples/openauth/Makefile.am
> +@@ -19,3 +19,9 @@ noinst_PROGRAMS = openauth
> + openauth_CFLAGS = $(WARN_CFLAGS)
> + openauth_SOURCES = openauth.c
> + openauth_LDADD = $(top_builddir)/src/libvirt.la
> ++if WITH_GNUTLS
> ++openauth_LDADD += $(top_builddir)/src/libvirt-net-rpc.la  \
> ++                  $(top_builddir)/gnulib/lib/libgnu.la    \
> ++                  $(NULL)
> ++endif
> ++
> +diff --git a/tools/Makefile.am b/tools/Makefile.am
> +index 1dac7c1..c4c6f72 100644
> +--- a/tools/Makefile.am
> ++++ b/tools/Makefile.am
> +@@ -121,6 +121,13 @@ virt_host_validate_LDADD = \
> +               ../gnulib/lib/libgnu.la                         \
> +               $(NULL)
> +
> ++if WITH_GNUTLS
> ++virt_host_validate_LDADD += ../src/libvirt-net-rpc.la \
> ++                            ../gnulib/lib/libgnu.la   \
> ++                            $(NULL)
> ++endif
> ++
> ++
> + virt_host_validate_CFLAGS = \
> +               $(WARN_CFLAGS)                                  \
> +               $(PIE_CFLAGS)                                   \
> +@@ -162,6 +169,12 @@ virsh_CFLAGS =                                                    \
> +               $(READLINE_CFLAGS)
> + BUILT_SOURCES =
> +
> ++if WITH_GNUTLS
> ++virsh_LDADD += ../src/libvirt-net-rpc.la \
> ++               ../gnulib/lib/libgnu.la   \
> ++               $(NULL)
> ++endif
> ++
> + if WITH_WIN_ICON
> + virsh_LDADD += virsh_win_icon.$(OBJEXT)
> +
> +--
> +1.7.10.4
> +
> diff --git a/recipes-extended/libvirt/libvirt_1.1.1.bb b/recipes-extended/libvirt/libvirt_1.1.1.bb
> new file mode 100644
> index 0000000..4502e85
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt_1.1.1.bb
> @@ -0,0 +1,180 @@
> +DESCRIPTION = "A toolkit to interact with the virtualization capabilities of recent versions of Linux."
> +HOMEPAGE = "http://libvirt.org"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +SECTION = "console/tools"
> +PR = "r0"
> +
> +DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
> +          iptables dnsmasq readline"
> +
> +# These might be included by PACKAGECONFIG
> +#RRECOMMENDS+= "polkit qemu yajl libnl lxc netcf"
> +
> +# libvirt-guests.sh needs gettext.sh
> +#
> +RDEPENDS_${PN} = "gettext-runtime"
> +
> +RDEPENDS_libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq netcat-openbsd"
> +RDEPENDS_libvirt-libvirtd_append_x86-64 = " dmidecode"
> +RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
> +
> +#connman blocks the 53 port and libvirtd can't start its DNS service
> +RCONFLICTS_${PN}_libvirtd = "connman"
> +
> +SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
> +           file://tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch \
> +          file://libvirtd.sh \
> +          file://libvirtd.conf"
> +
> +SRC_URI[md5sum] = "632f30a2f22fbb404b8e10702d7f55ca"
> +SRC_URI[sha256sum] = "dc6f1e1e15b9b190eaa706e76edabcfc94b239c012f5afc22b22357a4b3b22c2"
> +
> +inherit autotools gettext update-rc.d
> +
> +CACHED_CONFIGUREVARS += "\
> +ac_cv_path_XMLLINT=/usr/bin/xmllint \
> +ac_cv_path_XMLCATLOG=/usr/bin/xmlcatalog \
> +ac_cv_path_AUGPARSE=/usr/bin/augparse \
> +ac_cv_path_DNSMASQ=/usr/bin/dnsmasq \
> +ac_cv_path_BRCTL=/usr/sbin/brctl \
> +ac_cv_path_TC=/sbin/tc \
> +ac_cv_path_UDEVADM=/sbin/udevadm \
> +ac_cv_path_MODPROBE=/sbin/modprobe \
> +ac_cv_path_IP_PATH=/bin/ip \
> +ac_cv_path_IPTABLES_PATH=/usr/sbin/iptables \
> +ac_cv_path_IP6TABLES_PATH=/usr/sbin/ip6tables \
> +ac_cv_path_MOUNT=/bin/mount \
> +ac_cv_path_UMOUNT=/bin/umount \
> +ac_cv_path_MKFS=/usr/sbin/mkfs \
> +ac_cv_path_SHOWMOUNT=/usr/sbin/showmount \
> +ac_cv_path_PVCREATE=/usr/sbin/pvcreate \
> +ac_cv_path_VGCREATE=/usr/sbin/vgcreate \
> +ac_cv_path_LVCREATE=/usr/sbin/lvcreate \
> +ac_cv_path_PVREMOVE=/usr/sbin/pvremove \
> +ac_cv_path_VGREMOVE=/usr/sbin/vgremove \
> +ac_cv_path_LVREMOVE=/usr/sbin/lvremove \
> +ac_cv_path_LVCHANGE=/usr/sbin/lvchange \
> +ac_cv_path_VGCHANGE=/usr/sbin/vgchange \
> +ac_cv_path_VGSCAN=/usr/sbin/vgscan \
> +ac_cv_path_PVS=/usr/sbin/pvs \
> +ac_cv_path_VGS=/usr/sbin/vgs \
> +ac_cv_path_LVS=/usr/sbin/lvs \
> +ac_cv_path_PARTED=/usr/sbin/parted \
> +ac_cv_path_DMSETUP=/usr/sbin/dmsetup"
> +
> +# Some other possible paths we are not yet setting
> +#ac_cv_path_RPCGEN=
> +#ac_cv_path_XSLTPROC=
> +#ac_cv_path_RADVD=
> +#ac_cv_path_UDEVSETTLE=
> +#ac_cv_path_EBTABLES_PATH=
> +#ac_cv_path_PKG_CONFIG=
> +#ac_cv_path_ac_pt_PKG_CONFIG
> +#ac_cv_path_PKCHECK_PATH=
> +#ac_cv_path_POLKIT_AUTH=
> +#ac_cv_path_DTRACE=
> +#ac_cv_path_ISCSIADM=
> +#ac_cv_path_MSGFMT=
> +#ac_cv_path_GMSGFMT=
> +#ac_cv_path_XGETTEXT=
> +#ac_cv_path_MSGMERGE=
> +#ac_cv_path_SCRUB=
> +#ac_cv_path_PYTHON=
> +
> +ALLOW_EMPTY_${PN} = "1"
> +
> +PACKAGES =+ "${PN}-libvirtd ${PN}-virsh"
> +
> +ALLOW_EMPTY_${PN}-libvirtd = "1"
> +
> +FILES_${PN}-libvirtd = "${sysconfdir}/init.d \
> +       ${sysconfdir}/sysctl.d \
> +       ${sysconfdir}/logrotate.d \
> +       ${sysconfdir}/libvirt/libvirtd.conf \
> +        /usr/lib/sysctl.d/libvirtd.conf \
> +       ${sbindir}/libvirtd"
> +
> +FILES_${PN}-virsh = "${bindir}/virsh"
> +FILES_${PN} += "${libdir}/libvirt/connection-driver \
> +           ${datadir}/augeas \
> +           ${datadir}/polkit-1"
> +
> +FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug ${libdir}/libvirt/lock-driver/.debug"
> +FILES_${PN}-staticdev += "${libdir}/libvirt ${libdir}/*.a ${libdir}/libvirt/connection-driver/*.a ${libdir}/libvirt/lock-driver/*.a"
> +
> +INITSCRIPT_PACKAGES = "${PN}-libvirtd"
> +INITSCRIPT_NAME_${PN}-libvirtd = "libvirtd"
> +INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
> +
> +# xen-minimal config
> +#PACKAGECONFIG ??= "xen libxl xen-inotify test remote libvirtd"
> +
> +# full config
> +PACKAGECONFIG ??= "qemu yajl xen libxl xen-inotify uml openvz vmware vbox esx \
> +                 polkit lxc test remote macvtap libvirtd netcf udev python \
> +                 ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
> +                 ebtables"
> +
> +# enable,disable,depends,rdepends
> +#
> +PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu,"
> +PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
> +PACKAGECONFIG[xen] = "--with-xen,--without-xen,xen,"
> +PACKAGECONFIG[xenapi] = "--with-xenapi,--without-xenapi,,"
> +PACKAGECONFIG[libxl] = "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,xen,"
> +PACKAGECONFIG[xen-inotify] = "--with-xen-inotify,--without-xen-inotify,xen,"
> +PACKAGECONFIG[uml] = "--with-uml, --without-uml,,"
> +PACKAGECONFIG[openvz] = "--with-openvz,--without-openvz,,"
> +PACKAGECONFIG[vmware] = "--with-vmware,--without-vmware,,"
> +PACKAGECONFIG[phyp] = "--with-phyp,--without-phyp,,"
> +PACKAGECONFIG[vbox] = "--with-vbox,--without-vbox,,"
> +PACKAGECONFIG[esx] = "--with-esx,--without-esx,,"
> +PACKAGECONFIG[hyperv] = "--with-hyperv,--without-hyperv,,"
> +PACKAGECONFIG[polkit] = "--with-polkit,--without-polkit,polkit,polkit"
> +PACKAGECONFIG[lxc] = "--with-lxc,--without-lxc, lxc,"
> +PACKAGECONFIG[test] = "--with-test=yes,--with-test=no,,"
> +PACKAGECONFIG[remote] = "--with-remote,--without-remote,,"
> +PACKAGECONFIG[macvtap] = "--with-macvtap=yes,--with-macvtap=no,libnl,libnl"
> +PACKAGECONFIG[libvirtd] = "--with-libvirtd,--without-libvirtd,,"
> +PACKAGECONFIG[netcf] = "--with-netcf,--without-netcf,netcf,netcf"
> +PACKAGECONFIG[dtrace] = "--with-dtrace,--without-dtrace,,"
> +PACKAGECONFIG[udev] = "--with-udev --with-pciaccess,--without-udev,udev libpciaccess,"
> +PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux,"
> +PACKAGECONFIG[ebtables] = "ac_cv_path_EBTABLES_PATH=/sbin/ebtables,ac_cv_path_EBTABLES_PATH=,ebtables,ebtables"
> +
> +# Enable the Python tool support
> +require libvirt-python.inc
> +
> +do_install_append() {
> +       install -d ${D}/etc/init.d
> +       install -d ${D}/etc/libvirt
> +
> +       install -m 0755 ${WORKDIR}/libvirtd.sh ${D}/etc/init.d/libvirtd
> +       install -m 0644 ${WORKDIR}/libvirtd.conf ${D}/etc/libvirt/libvirtd.conf
> +
> +       # This will wind up in the libvirtd package, but will NOT be invoked by default.
> +       #
> +       mv ${D}/${libexecdir}/libvirt-guests.sh ${D}/${sysconfdir}/init.d
> +
> +       # The /var/run/libvirt directories created by the Makefile
> +       # are wiped out in volatile, we need to create these at boot.
> +       rm -rf ${D}${localstatedir}/run
> +       install -d ${D}${sysconfdir}/default/volatiles
> +       echo "d root root 0755 ${localstatedir}/run/libvirt none" \
> +            > ${D}${sysconfdir}/default/volatiles/99_libvirt
> +       echo "d root root 0755 ${localstatedir}/run/libvirt/lockd none" \
> +            >> ${D}${sysconfdir}/default/volatiles/99_libvirt
> +       echo "d root root 0755 ${localstatedir}/run/libvirt/lxc none" \
> +            >> ${D}${sysconfdir}/default/volatiles/99_libvirt
> +       echo "d root root 0755 ${localstatedir}/run/libvirt/network none" \
> +            >> ${D}${sysconfdir}/default/volatiles/99_libvirt
> +       echo "d root root 0755 ${localstatedir}/run/libvirt/qemu none" \
> +            >> ${D}${sysconfdir}/default/volatiles/99_libvirt
> +}
> +
> +pkg_postinst_libvirt() {
> +        if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
> +                /etc/init.d/populate-volatile.sh update
> +        fi
> +}
> --
> 1.7.10.4
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

