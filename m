Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D6F76E00348
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 09:14:33 -0800 (PST)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 06 Dec 2012 09:14:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,230,1355126400"; d="scan'208";a="227577624"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.117])
	by azsmga001.ch.intel.com with ESMTP; 06 Dec 2012 09:14:31 -0800
Message-ID: <50C0D277.2040308@linux.intel.com>
Date: Thu, 06 Dec 2012 09:14:31 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: david.c.nystrom@gmail.com
References: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
	<1354813596-8233-14-git-send-email-david.nystrom@enea.com>
In-Reply-To: <1354813596-8233-14-git-send-email-david.nystrom@enea.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCHv4 13/15] Updated libvirt to 1.0.0, added more details to packageconfig
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
X-List-Received-Date: Thu, 06 Dec 2012 17:14:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 12/06/2012 09:06 AM, david.c.nystrom@gmail.com wrote:
> From: David Nyström <david.nystrom@enea.com>
>
> ---
>   .../{libvirt_0.10.2.bb => libvirt_1.0.0.bb}        |   69 +++++++++++++-------
>   1 file changed, 46 insertions(+), 23 deletions(-)
>   copy recipes-extended/libvirt/{libvirt_0.10.2.bb => libvirt_1.0.0.bb} (61%)
>

You could do a git mv here instead of a copy and remove patch, but 
that's your choice, this way is fine.

Sau!

> diff --git a/recipes-extended/libvirt/libvirt_0.10.2.bb b/recipes-extended/libvirt/libvirt_1.0.0.bb
> similarity index 61%
> copy from recipes-extended/libvirt/libvirt_0.10.2.bb
> copy to recipes-extended/libvirt/libvirt_1.0.0.bb
> index 23cd885..5374237 100644
> --- a/recipes-extended/libvirt/libvirt_0.10.2.bb
> +++ b/recipes-extended/libvirt/libvirt_1.0.0.bb
> @@ -5,9 +5,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
>   SECTION = "console/tools"
>   PR = "r0"
>
> -DEPENDS="bridge-utils gnutls libxml2 lvm2 avahi polkit parted curl libpcap util-linux e2fsprogs pm-utils iptables ebtables dnsmasq"
> +DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
> +	   iptables ebtables dnsmasq readline"
>
> -RDEPENDS_${PN}-libvirtd = "bridge-utils iptables pm-utils dnsmasq ebtables dmidecode "
> +# These might be included by PACKAGECONFIG
> +#RRECOMMENDS+= "polkit qemu yajl libnl lxc netcf"
> +
> +RDEPENDS_libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq openbsd-netcat"
> +RDEPENDS_libvirt-libvirtd_append_x86-64 = " dmidecode"
> +RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
>
>   #connman blocks the 53 port and libvirtd can't start its DNS service
>   RCONFLICTS_${PN}_libvirtd = "connman"
> @@ -16,25 +22,11 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
>   	file://libvirtd.sh \
>   	file://libvirtd.conf"
>
> -SRC_URI[md5sum] = "a5e50860d9da238ba270b528411c4a0d"
> -SRC_URI[sha256sum] = "1fe69ae1268a097cc0cf83563883b51780d528c6493efe3e7d94c4160cc46977"
> +SRC_URI[md5sum] = "7c8b006de7338e30866bb56738803b21"
> +SRC_URI[sha256sum] = "14c8a30ebfb939c82cab5f759a95d09646b43b4210e45490e92459ae65123076"
>
>   inherit autotools gettext update-rc.d
>
> -# Trimmed down version for Xen daemon server
> -EXTRA_OECONF = "--with-libvirtd --with-test=yes --with-remote=yes --with-macvtap=no --with-polkit=no"
> -
> -PACKAGECONFIG ??= "xen"
> -PACKAGECONFIG[qemu] = "--with-qemu --with-yajl,--without-qemu --without-yajl,qemu yajl"
> -PACKAGECONFIG[xen] = "--with-xen --with-xenapi --with-libxl=${STAGING_DIR_TARGET}/lib --with-xen-inotify,--without-xen --without-xenapi --without-libxl --without-xen-inotify,xen"
> -PACKAGECONFIG[uml] = "--with-uml, --without-uml"
> -PACKAGECONFIG[openvz] = "--with-openvz,--without-openvz"
> -PACKAGECONFIG[vmware] = "--with-vmware,--without-vmware"
> -PACKAGECONFIG[phyp] = "--with-phyp,--without-phyp"
> -PACKAGECONFIG[vbox] = "--with-vbox,--without-vbox"
> -PACKAGECONFIG[esx] = "--with-esx,--without-esx"
> -PACKAGECONFIG[hyperv] = "--with-hyperv,--without-hyperv"
> -
>   CACHED_CONFIGUREVARS += "\
>   ac_cv_path_XMLLINT=/usr/bin/xmllint \
>   ac_cv_path_XMLCATLOG=/usr/bin/xmlcatalog \
> @@ -89,6 +81,8 @@ ALLOW_EMPTY_${PN} = "1"
>
>   PACKAGES =+ "${PN}-libvirtd ${PN}-virsh"
>
> +ALLOW_EMPTY_${PN}-libvirtd = "1"
> +
>   FILES_${PN}-libvirtd = "${sysconfdir}/init.d \
>   	${sysconfdir}/sysctl.d \
>   	${sysconfdir}/logrotate.d \
> @@ -96,16 +90,45 @@ FILES_${PN}-libvirtd = "${sysconfdir}/init.d \
>   	${sbindir}/libvirtd"
>
>   FILES_${PN}-virsh = "${bindir}/virsh"
> -FILES_${PN} += "${datadir}/augeas/*"
> -FILES_${PN}-dbg += "${libdir}/${PN}/connection-driver/.debug/*"
> -FILES_${PN}-staticdev += "${libdir}/*.a ${libdir}/${PN}/connection-driver/*.a"
> +FILES_${PN} += "${libdir}/libvirt/connection-driver \
> +	    ${datadir}/augeas \
> +	    ${datadir}/polkit-1"
> +
> +FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug"
> +FILES_${PN}-staticdev += "${libdir}/*.a ${libdir}/libvirt/connection-driver/*.a"
>
>   INITSCRIPT_PACKAGES = "${PN}-libvirtd"
>   INITSCRIPT_NAME_${PN}-libvirtd = "libvirtd"
>   INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
>
> -# Disable the Python tool support
> -#EXTRA_OECONF += " --with-python=no"
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
>   # Enable the Python tool support
>   require libvirt-python.inc
>
>

