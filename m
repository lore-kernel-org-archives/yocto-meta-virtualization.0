Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D355CE002AB
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 07:14:31 -0800 (PST)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Dec 2012 07:14:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,230,1355126400"; d="scan'208";a="258187989"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.117])
	by fmsmga001.fm.intel.com with ESMTP; 06 Dec 2012 07:14:13 -0800
Message-ID: <50C0B645.1040008@linux.intel.com>
Date: Thu, 06 Dec 2012 07:14:13 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
References: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
	<1354802601-10840-14-git-send-email-david.c.nystrom@gmail.com>
	<CADkTA4NrbWtbBB-0oqHPC1VHMbvxkJnKKfbYD9p68cD_jwX02A@mail.gmail.com>
	<50C0B185.9050807@enea.com>
In-Reply-To: <50C0B185.9050807@enea.com>
Cc: meta-virtualization@yoctoproject.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCHv3 13/14] Upgraded to libvirt 1.0.0, and added a more detailed packageconfig
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
X-List-Received-Date: Thu, 06 Dec 2012 15:14:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 12/06/2012 06:53 AM, David Nyström wrote:
>
>
> On 12/06/2012 03:26 PM, Bruce Ashfield wrote:
>> On Thu, Dec 6, 2012 at 9:03 AM, <david.c.nystrom@gmail.com> wrote:
>>
>>> From: David Nyström <david.nystrom@enea.com>
>>>
>>> ---
>>>   recipes-extended/libvirt/libvirt_1.0.0.bb |  139
>>> +++++++++++++++++++++++++++++
>>>   1 file changed, 139 insertions(+)
>>>   create mode 100644 recipes-extended/libvirt/libvirt_1.0.0.bb
>>>
>>> diff --git
>>> a/recipes-extended/libvirt/libvirt_1.0.0.bbb/recipes-extended/libvirt/
>>> libvirt_1.0.0.bb
>>> new file mode 100644
>>> index 0000000..45b460a
>>> --- /dev/null
>>> +++ b/recipes-extended/libvirt/libvirt_1.0.0.bb
>>> @@ -0,0 +1,139 @@
>>> +DESCRIPTION = "A toolkit to interact with the virtualization
>>> capabilities
>>> of recent versions of Linux."
>>> +HOMEPAGE = "http://libvirt.org"
>>> +LICENSE = "GPLv2+"
>>> +LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
>>> +SECTION = "console/tools"
>>> +PR = "r2"
>>> +
>>> +DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap
>>> util-linux e2fsprogs pm-utils \
>>> +          iptables ebtables dnsmasq readline"
>>> +
>>> +# These might be included by PACKAGECONFIG
>>> +#RRECOMMENDS+= "polkit qemu yajl libnl lxc netcf"
>>> +
>>> +RDEPENDS_libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq
>>> openbsd-netcat"
>>> +RDEPENDS_libvirt-libvirtd_append_x86-64 = " dmidecode"
>>> +RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
>>> +
>>> +#connman blocks the 53 port and libvirtd can't start its DNS service
>>> +RCONFLICTS_${PN}_libvirtd = "connman"
>>> +
>>> +SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
>>> +       file://libvirtd.sh \
>>> +       file://libvirtd.conf"
>>> +
>>> +SRC_URI[md5sum] = "7c8b006de7338e30866bb56738803b21"
>>> +SRC_URI[sha256sum] =
>>> "14c8a30ebfb939c82cab5f759a95d09646b43b4210e45490e92459ae65123076"
>>> +
>>> +inherit autotools gettext update-rc.d
>>> +
>>> +CACHED_CONFIGUREVARS += "\
>>> +ac_cv_path_XMLLINT=/usr/bin/xmllint \
>>> +ac_cv_path_XMLCATLOG=/usr/bin/xmlcatalog \
>>> +ac_cv_path_AUGPARSE=/usr/bin/augparse \
>>> +ac_cv_path_DNSMASQ=/usr/bin/dnsmasq \
>>> +ac_cv_path_BRCTL=/usr/sbin/brctl \
>>> +ac_cv_path_TC=/sbin/tc \
>>> +ac_cv_path_UDEVADM=/sbin/udevadm \
>>> +ac_cv_path_MODPROBE=/sbin/modprobe \
>>> +ac_cv_path_IP_PATH=/bin/ip \
>>> +ac_cv_path_IPTABLES_PATH=/usr/sbin/iptables \
>>> +ac_cv_path_IP6TABLES_PATH=/usr/sbin/ip6tables \
>>> +ac_cv_path_MOUNT=/bin/mount \
>>> +ac_cv_path_UMOUNT=/bin/umount \
>>> +ac_cv_path_MKFS=/usr/sbin/mkfs \
>>> +ac_cv_path_SHOWMOUNT=/usr/sbin/showmount \
>>> +ac_cv_path_PVCREATE=/usr/sbin/pvcreate \
>>> +ac_cv_path_VGCREATE=/usr/sbin/vgcreate \
>>> +ac_cv_path_LVCREATE=/usr/sbin/lvcreate \
>>> +ac_cv_path_PVREMOVE=/usr/sbin/pvremove \
>>> +ac_cv_path_VGREMOVE=/usr/sbin/vgremove \
>>> +ac_cv_path_LVREMOVE=/usr/sbin/lvremove \
>>> +ac_cv_path_LVCHANGE=/usr/sbin/lvchange \
>>> +ac_cv_path_VGCHANGE=/usr/sbin/vgchange \
>>> +ac_cv_path_VGSCAN=/usr/sbin/vgscan \
>>> +ac_cv_path_PVS=/usr/sbin/pvs \
>>> +ac_cv_path_VGS=/usr/sbin/vgs \
>>> +ac_cv_path_LVS=/usr/sbin/lvs \
>>> +ac_cv_path_PARTED=/usr/sbin/parted \
>>> +ac_cv_path_DMSETUP=/usr/sbin/dmsetup"
>>> +
>>> +# Some other possible paths we are not yet setting
>>> +#ac_cv_path_RPCGEN=
>>> +#ac_cv_path_XSLTPROC=
>>> +#ac_cv_path_RADVD=
>>> +#ac_cv_path_UDEVSETTLE=
>>> +#ac_cv_path_EBTABLES_PATH=
>>> +#ac_cv_path_PKG_CONFIG=
>>> +#ac_cv_path_ac_pt_PKG_CONFIG
>>> +#ac_cv_path_PKCHECK_PATH=
>>> +#ac_cv_path_POLKIT_AUTH=
>>> +#ac_cv_path_DTRACE=
>>> +#ac_cv_path_ISCSIADM=
>>> +#ac_cv_path_MSGFMT=
>>> +#ac_cv_path_GMSGFMT=
>>> +#ac_cv_path_XGETTEXT=
>>> +#ac_cv_path_MSGMERGE=
>>> +#ac_cv_path_SCRUB=
>>> +#ac_cv_path_PYTHON=
>>> +
>>> +ALLOW_EMPTY_${PN} = "1"
>>> +
>>> +PACKAGES =+ "${PN}-libvirtd ${PN}-virsh"
>>> +
>>> +FILES_${PN}-libvirtd = "${sysconfdir}/init.d \
>>> +       ${sysconfdir}/sysctl.d \
>>> +       ${sysconfdir}/logrotate.d \
>>> +       ${sysconfdir}/libvirt/libvirtd.conf \
>>> +       ${sbindir}/libvirtd"
>>>
>>
>> What happens if libvirtd is disabled via:
>>
>>   PACKAGECONFIG[libvirtd] = "--with-libvirtd,--without-libvirtd"
>>
>> I haven't tried it to see, but on a glance, it looks like some missing
>> files
>> and packaging issues.
>>
>> Cheers,
>>
>> Bruce
>
> I assume your suggested solution for this would be to
> ALLOW_EMPTY_${PN}-libvirtd = "1".
> Not good for QA, but do we have any other options ?
>
>>
>> +
>>> +FILES_${PN}-virsh = "${bindir}/virsh"
>>> +FILES_${PN} += "${libdir}/libvirt/connection-driver \
>>> +           ${datadir}/augeas \
>>> +           ${datadir}/polkit-1"
>>> +
>>> +FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug"
>>> +FILES_${PN}-staticdev += "${libdir}/*.a
>>> ${libdir}/libvirt/connection-driver/*.a"
>>> +
>>> +INITSCRIPT_PACKAGES = "${PN}-libvirtd"
>>> +INITSCRIPT_NAME_${PN}-libvirtd = "libvirtd"
>>> +INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
>>> +
>>> +# xen-minimal config
>>> +#PACKAGECONFIG ??= "xen libxl xen-inotify test remote libvirtd"
>>> +
>>> +# full config
>>> +PACKAGECONFIG ??= "qemu yajl xen libxl xen-inotify uml openvz vmware
>>> vbox
>>> esx \
>>> +                  polkit lxc test remote macvtap libvirtd netcf"
>>> +
>>> +PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu"
>>> +PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
>>> +PACKAGECONFIG[xen] = "--with-xen,--without-xen,xen"
>>> +PACKAGECONFIG[xenapi] = "--with-xenapi,--without-xenapi"
>>> +PACKAGECONFIG[libxl] =
>>> "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,xen"
>>> +PACKAGECONFIG[xen-inotify] =
>>> "--with-xen-inotify,--without-xen-inotify,xen"
>>> +PACKAGECONFIG[uml] = "--with-uml, --without-uml"
>>> +PACKAGECONFIG[openvz] = "--with-openvz,--without-openvz"
>>> +PACKAGECONFIG[vmware] = "--with-vmware,--without-vmware"
>>> +PACKAGECONFIG[phyp] = "--with-phyp,--without-phyp"
>>> +PACKAGECONFIG[vbox] = "--with-vbox,--without-vbox"
>>> +PACKAGECONFIG[esx] = "--with-esx,--without-esx"
>>> +PACKAGECONFIG[hyperv] = "--with-hyperv,--without-hyperv"
>>> +PACKAGECONFIG[polkit] = "--with-polkit,--without-polkit,polkit,polkit"
>>> +PACKAGECONFIG[lxc] = "--with-lxc,--without-lxc, lxc"
>>> +PACKAGECONFIG[test] = "--with-test=yes,--with-test=no"
>>> +PACKAGECONFIG[remote] = "--with-remote,--without-remote"
>>> +PACKAGECONFIG[macvtap] =
>>> "--with-macvtap=yes,--with-macvtap=no,libnl,libnl"
>>> +PACKAGECONFIG[libvirtd] = "--with-libvirtd,--without-libvirtd"
>>> +PACKAGECONFIG[netcf] = "--with-netcf,--without-netcf,netcf,netcf"
>>>
>>
>> Another random questions. I've got some other libvirt recipes kicking
>> around, and
>> is it generally frowned upon to trigger options via DISTRO_FEATURES vs
>> PACKAGECONFIG ? I'm thinking of bigger scale features like selinux, which
>> are
>> decided on a distro basis.
>>
>> Cheers,
>>
>> Bruce
>
> Thats a good question, CC:ing RP who added the feature in 1.3.
>
> Don't know whats generally frowned upon by the community, I see
> PACKAGECONFIG as a more fine granular way of doing this.
> Alot of packages in oe-core do a R/DEPENDS split with:
>
> DEPENDS += ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11
> libxtst libice libsm libxcb gtk+', '', d)}"
>
> I see no reason for why DISTRO_FEATURES can't select a PACKAGECONFIG
> setup instead. I'm guessing that's why it was added. i.e.
>
> PACKAGECONFIG += ${@base_contains('DISTRO_FEATURES', 'kvm', 'qemu yajl',
> '', d)}"
>
Exactly, DISTRO_FEATURES can enable local PACKAGECONFIG items, 
DISTRO_FEAUTRES is more of a GLOBAL (DISTRO) setting.

On a different note, will there be plans to remove the older libvirt 
recipe?  Is there a reason it needs to be kept around?

In the Yocto Project, we try not to keep older versions of recipes 
unless required because of license changes from GPLv2 -> GPLv3.

Sau!

>
>>
>>
>>> +
>>> +# Enable the Python tool support
>>> +require libvirt-python.inc
>>> +
>>> +do_install_append() {
>>> +       install -d ${D}/etc/init.d
>>> +       install -d ${D}/etc/libvirt
>>> +
>>> +       install -m 0755 ${WORKDIR}/libvirtd.sh ${D}/etc/init.d/libvirtd
>>> +       install -m 0644 ${WORKDIR}/libvirtd.conf
>>> ${D}/etc/libvirt/libvirtd.conf
>>> +}
>>> --
>>> 1.7.9.5
>>>
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>
>>
>>
>>
>>
>>
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

