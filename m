Return-Path: <ray.danks@se-eng.com>
Received: from judge.camp.se-eng.com
	(75-148-42-21-Colorado.hfc.comcastbusiness.net [75.148.42.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66F39E0143A
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 06:00:50 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id 39216138081
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 07:00:49 -0700 (MST)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id I3-KVzuCStGP for <meta-virtualization@yoctoproject.org>; 
	Thu,  6 Dec 2012 07:00:45 -0700 (MST)
Received: from [192.168.1.104] (host-209-169-196-2.beyondbb.com
	[209.169.196.2])
	by judge.camp.se-eng.com (Postfix) with ESMTPSA id 44421138080
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 07:00:45 -0700 (MST)
Message-ID: <50C0A4F9.3020203@se-eng.com>
Date: Thu, 06 Dec 2012 07:00:25 -0700
From: Raymond Danks <ray.danks@se-eng.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: meta-virtualization@yoctoproject.org
References: <1354799626-6911-1-git-send-email-david.nystrom@enea.com>
	<1354799626-6911-14-git-send-email-david.nystrom@enea.com>
In-Reply-To: <1354799626-6911-14-git-send-email-david.nystrom@enea.com>
Subject: Re: [PATCH 13/14] Upgraded to libvirt 1.0.0, and added a more detailed packageconfig
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
X-List-Received-Date: Thu, 06 Dec 2012 14:00:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

David,

At a quick glance these all look good.  I probably won't be able to run 
a build, but I will look at these throughout the day.  On this one in 
particular, though, would you mind to either apply the changes to the 
existing version first or simply perform the rename operation in git?  
With that we can see more specifically what is being changed in the bb 
file(s).

Thanks,
Ray

On 12/06/2012 06:13 AM, David Nyström wrote:
> ---
>   recipes-extended/libvirt/libvirt_1.0.0.bb |  139 +++++++++++++++++++++++++++++
>   1 file changed, 139 insertions(+)
>   create mode 100644 recipes-extended/libvirt/libvirt_1.0.0.bb
>
> diff --git a/recipes-extended/libvirt/libvirt_1.0.0.bb b/recipes-extended/libvirt/libvirt_1.0.0.bb
> new file mode 100644
> index 0000000..45b460a
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt_1.0.0.bb
> @@ -0,0 +1,139 @@
> +DESCRIPTION = "A toolkit to interact with the virtualization capabilities of recent versions of Linux."
> +HOMEPAGE = "http://libvirt.org"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
> +SECTION = "console/tools"
> +PR = "r2"
> +
> +DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
> +	   iptables ebtables dnsmasq readline"
> +
> +# These might be included by PACKAGECONFIG
> +#RRECOMMENDS+= "polkit qemu yajl libnl lxc netcf"
> +
> +RDEPENDS_libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq openbsd-netcat"
> +RDEPENDS_libvirt-libvirtd_append_x86-64 = " dmidecode"
> +RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
> +
> +#connman blocks the 53 port and libvirtd can't start its DNS service
> +RCONFLICTS_${PN}_libvirtd = "connman"
> +
> +SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
> +	file://libvirtd.sh \
> +	file://libvirtd.conf"
> +
> +SRC_URI[md5sum] = "7c8b006de7338e30866bb56738803b21"
> +SRC_URI[sha256sum] = "14c8a30ebfb939c82cab5f759a95d09646b43b4210e45490e92459ae65123076"
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
> +FILES_${PN}-libvirtd = "${sysconfdir}/init.d \
> +	${sysconfdir}/sysctl.d \
> +	${sysconfdir}/logrotate.d \
> +	${sysconfdir}/libvirt/libvirtd.conf \
> +	${sbindir}/libvirtd"
> +
> +FILES_${PN}-virsh = "${bindir}/virsh"
> +FILES_${PN} += "${libdir}/libvirt/connection-driver \
> +	    ${datadir}/augeas \
> +	    ${datadir}/polkit-1"
> +
> +FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug"
> +FILES_${PN}-staticdev += "${libdir}/*.a ${libdir}/libvirt/connection-driver/*.a"
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
> +	           polkit lxc test remote macvtap libvirtd netcf"
> +
> +PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu"
> +PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
> +PACKAGECONFIG[xen] = "--with-xen,--without-xen,xen"
> +PACKAGECONFIG[xenapi] = "--with-xenapi,--without-xenapi"
> +PACKAGECONFIG[libxl] = "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,xen"
> +PACKAGECONFIG[xen-inotify] = "--with-xen-inotify,--without-xen-inotify,xen"
> +PACKAGECONFIG[uml] = "--with-uml, --without-uml"
> +PACKAGECONFIG[openvz] = "--with-openvz,--without-openvz"
> +PACKAGECONFIG[vmware] = "--with-vmware,--without-vmware"
> +PACKAGECONFIG[phyp] = "--with-phyp,--without-phyp"
> +PACKAGECONFIG[vbox] = "--with-vbox,--without-vbox"
> +PACKAGECONFIG[esx] = "--with-esx,--without-esx"
> +PACKAGECONFIG[hyperv] = "--with-hyperv,--without-hyperv"
> +PACKAGECONFIG[polkit] = "--with-polkit,--without-polkit,polkit,polkit"
> +PACKAGECONFIG[lxc] = "--with-lxc,--without-lxc, lxc"
> +PACKAGECONFIG[test] = "--with-test=yes,--with-test=no"
> +PACKAGECONFIG[remote] = "--with-remote,--without-remote"
> +PACKAGECONFIG[macvtap] = "--with-macvtap=yes,--with-macvtap=no,libnl,libnl"
> +PACKAGECONFIG[libvirtd] = "--with-libvirtd,--without-libvirtd"
> +PACKAGECONFIG[netcf] = "--with-netcf,--without-netcf,netcf,netcf"
> +
> +# Enable the Python tool support
> +require libvirt-python.inc
> +
> +do_install_append() {
> +	install -d ${D}/etc/init.d
> +	install -d ${D}/etc/libvirt
> +
> +	install -m 0755 ${WORKDIR}/libvirtd.sh ${D}/etc/init.d/libvirtd
> +	install -m 0644 ${WORKDIR}/libvirtd.conf ${D}/etc/libvirt/libvirtd.conf
> +}


