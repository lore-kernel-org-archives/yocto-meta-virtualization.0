Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 39E9DE0143A
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 06:09:20 -0800 (PST)
Received: from [172.16.140.28] (172.16.140.28) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.2.318.1;
	Thu, 6 Dec 2012 15:09:17 +0100
Message-ID: <50C0A70D.2090800@enea.com>
Date: Thu, 6 Dec 2012 15:09:17 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Raymond Danks <ray.danks@se-eng.com>
References: <1354799626-6911-1-git-send-email-david.nystrom@enea.com>
	<1354799626-6911-14-git-send-email-david.nystrom@enea.com>
	<50C0A4F9.3020203@se-eng.com>
In-Reply-To: <50C0A4F9.3020203@se-eng.com>
X-Originating-IP: [172.16.140.28]
Cc: meta-virtualization@yoctoproject.org
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
X-List-Received-Date: Thu, 06 Dec 2012 14:10:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

Will do,

Sorry for patch spam, I thought I had some postfix issues.
The patches are all the same, not changes in between. I thought they did=20
not get sent.

Will the list not forward to emails on Cc: or To: ?

Br,
David


On 12/06/2012 03:00 PM, Raymond Danks wrote:
> David,
>
> At a quick glance these all look good.  I probably won't be able to run
> a build, but I will look at these throughout the day.  On this one in
> particular, though, would you mind to either apply the changes to the
> existing version first or simply perform the rename operation in git?
> With that we can see more specifically what is being changed in the bb
> file(s).
>
> Thanks,
> Ray
>
> On 12/06/2012 06:13 AM, David Nystr=F6m wrote:
>> ---
>>   recipes-extended/libvirt/libvirt_1.0.0.bb |  139
>> +++++++++++++++++++++++++++++
>>   1 file changed, 139 insertions(+)
>>   create mode 100644 recipes-extended/libvirt/libvirt_1.0.0.bb
>>
>> diff --git a/recipes-extended/libvirt/libvirt_1.0.0.bb
>> b/recipes-extended/libvirt/libvirt_1.0.0.bb
>> new file mode 100644
>> index 0000000..45b460a
>> --- /dev/null
>> +++ b/recipes-extended/libvirt/libvirt_1.0.0.bb
>> @@ -0,0 +1,139 @@
>> +DESCRIPTION =3D "A toolkit to interact with the virtualization
>> capabilities of recent versions of Linux."
>> +HOMEPAGE =3D "http://libvirt.org"
>> +LICENSE =3D "GPLv2+"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfb919cc88dbe06ec0b0bd50e001c=
cf1f"
>> +SECTION =3D "console/tools"
>> +PR =3D "r2"
>> +
>> +DEPENDS =3D "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap
>> util-linux e2fsprogs pm-utils \
>> +       iptables ebtables dnsmasq readline"
>> +
>> +# These might be included by PACKAGECONFIG
>> +#RRECOMMENDS+=3D "polkit qemu yajl libnl lxc netcf"
>> +
>> +RDEPENDS_libvirt-libvirtd +=3D "bridge-utils iptables pm-utils dnsmasq
>> openbsd-netcat"
>> +RDEPENDS_libvirt-libvirtd_append_x86-64 =3D " dmidecode"
>> +RDEPENDS_libvirt-libvirtd_append_x86 =3D " dmidecode"
>> +
>> +#connman blocks the 53 port and libvirtd can't start its DNS service
>> +RCONFLICTS_${PN}_libvirtd =3D "connman"
>> +
>> +SRC_URI =3D "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
>> +    file://libvirtd.sh \
>> +    file://libvirtd.conf"
>> +
>> +SRC_URI[md5sum] =3D "7c8b006de7338e30866bb56738803b21"
>> +SRC_URI[sha256sum] =3D
>> "14c8a30ebfb939c82cab5f759a95d09646b43b4210e45490e92459ae65123076"
>> +
>> +inherit autotools gettext update-rc.d
>> +
>> +CACHED_CONFIGUREVARS +=3D "\
>> +ac_cv_path_XMLLINT=3D/usr/bin/xmllint \
>> +ac_cv_path_XMLCATLOG=3D/usr/bin/xmlcatalog \
>> +ac_cv_path_AUGPARSE=3D/usr/bin/augparse \
>> +ac_cv_path_DNSMASQ=3D/usr/bin/dnsmasq \
>> +ac_cv_path_BRCTL=3D/usr/sbin/brctl \
>> +ac_cv_path_TC=3D/sbin/tc \
>> +ac_cv_path_UDEVADM=3D/sbin/udevadm \
>> +ac_cv_path_MODPROBE=3D/sbin/modprobe \
>> +ac_cv_path_IP_PATH=3D/bin/ip \
>> +ac_cv_path_IPTABLES_PATH=3D/usr/sbin/iptables \
>> +ac_cv_path_IP6TABLES_PATH=3D/usr/sbin/ip6tables \
>> +ac_cv_path_MOUNT=3D/bin/mount \
>> +ac_cv_path_UMOUNT=3D/bin/umount \
>> +ac_cv_path_MKFS=3D/usr/sbin/mkfs \
>> +ac_cv_path_SHOWMOUNT=3D/usr/sbin/showmount \
>> +ac_cv_path_PVCREATE=3D/usr/sbin/pvcreate \
>> +ac_cv_path_VGCREATE=3D/usr/sbin/vgcreate \
>> +ac_cv_path_LVCREATE=3D/usr/sbin/lvcreate \
>> +ac_cv_path_PVREMOVE=3D/usr/sbin/pvremove \
>> +ac_cv_path_VGREMOVE=3D/usr/sbin/vgremove \
>> +ac_cv_path_LVREMOVE=3D/usr/sbin/lvremove \
>> +ac_cv_path_LVCHANGE=3D/usr/sbin/lvchange \
>> +ac_cv_path_VGCHANGE=3D/usr/sbin/vgchange \
>> +ac_cv_path_VGSCAN=3D/usr/sbin/vgscan \
>> +ac_cv_path_PVS=3D/usr/sbin/pvs \
>> +ac_cv_path_VGS=3D/usr/sbin/vgs \
>> +ac_cv_path_LVS=3D/usr/sbin/lvs \
>> +ac_cv_path_PARTED=3D/usr/sbin/parted \
>> +ac_cv_path_DMSETUP=3D/usr/sbin/dmsetup"
>> +
>> +# Some other possible paths we are not yet setting
>> +#ac_cv_path_RPCGEN=3D
>> +#ac_cv_path_XSLTPROC=3D
>> +#ac_cv_path_RADVD=3D
>> +#ac_cv_path_UDEVSETTLE=3D
>> +#ac_cv_path_EBTABLES_PATH=3D
>> +#ac_cv_path_PKG_CONFIG=3D
>> +#ac_cv_path_ac_pt_PKG_CONFIG
>> +#ac_cv_path_PKCHECK_PATH=3D
>> +#ac_cv_path_POLKIT_AUTH=3D
>> +#ac_cv_path_DTRACE=3D
>> +#ac_cv_path_ISCSIADM=3D
>> +#ac_cv_path_MSGFMT=3D
>> +#ac_cv_path_GMSGFMT=3D
>> +#ac_cv_path_XGETTEXT=3D
>> +#ac_cv_path_MSGMERGE=3D
>> +#ac_cv_path_SCRUB=3D
>> +#ac_cv_path_PYTHON=3D
>> +
>> +ALLOW_EMPTY_${PN} =3D "1"
>> +
>> +PACKAGES =3D+ "${PN}-libvirtd ${PN}-virsh"
>> +
>> +FILES_${PN}-libvirtd =3D "${sysconfdir}/init.d \
>> +    ${sysconfdir}/sysctl.d \
>> +    ${sysconfdir}/logrotate.d \
>> +    ${sysconfdir}/libvirt/libvirtd.conf \
>> +    ${sbindir}/libvirtd"
>> +
>> +FILES_${PN}-virsh =3D "${bindir}/virsh"
>> +FILES_${PN} +=3D "${libdir}/libvirt/connection-driver \
>> +        ${datadir}/augeas \
>> +        ${datadir}/polkit-1"
>> +
>> +FILES_${PN}-dbg +=3D "${libdir}/libvirt/connection-driver/.debug"
>> +FILES_${PN}-staticdev +=3D "${libdir}/*.a
>> ${libdir}/libvirt/connection-driver/*.a"
>> +
>> +INITSCRIPT_PACKAGES =3D "${PN}-libvirtd"
>> +INITSCRIPT_NAME_${PN}-libvirtd =3D "libvirtd"
>> +INITSCRIPT_PARAMS_${PN}-libvirtd =3D "defaults 72"
>> +
>> +# xen-minimal config
>> +#PACKAGECONFIG ??=3D "xen libxl xen-inotify test remote libvirtd"
>> +
>> +# full config
>> +PACKAGECONFIG ??=3D "qemu yajl xen libxl xen-inotify uml openvz vmware
>> vbox esx \
>> +               polkit lxc test remote macvtap libvirtd netcf"
>> +
>> +PACKAGECONFIG[qemu] =3D "--with-qemu,--without-qemu,qemu"
>> +PACKAGECONFIG[yajl] =3D "--with-yajl,--without-yajl,yajl,yajl"
>> +PACKAGECONFIG[xen] =3D "--with-xen,--without-xen,xen"
>> +PACKAGECONFIG[xenapi] =3D "--with-xenapi,--without-xenapi"
>> +PACKAGECONFIG[libxl] =3D
>> "--with-libxl=3D${STAGING_DIR_TARGET}/lib,--without-libxl,xen"
>> +PACKAGECONFIG[xen-inotify] =3D
>> "--with-xen-inotify,--without-xen-inotify,xen"
>> +PACKAGECONFIG[uml] =3D "--with-uml, --without-uml"
>> +PACKAGECONFIG[openvz] =3D "--with-openvz,--without-openvz"
>> +PACKAGECONFIG[vmware] =3D "--with-vmware,--without-vmware"
>> +PACKAGECONFIG[phyp] =3D "--with-phyp,--without-phyp"
>> +PACKAGECONFIG[vbox] =3D "--with-vbox,--without-vbox"
>> +PACKAGECONFIG[esx] =3D "--with-esx,--without-esx"
>> +PACKAGECONFIG[hyperv] =3D "--with-hyperv,--without-hyperv"
>> +PACKAGECONFIG[polkit] =3D "--with-polkit,--without-polkit,polkit,polkit=
"
>> +PACKAGECONFIG[lxc] =3D "--with-lxc,--without-lxc, lxc"
>> +PACKAGECONFIG[test] =3D "--with-test=3Dyes,--with-test=3Dno"
>> +PACKAGECONFIG[remote] =3D "--with-remote,--without-remote"
>> +PACKAGECONFIG[macvtap] =3D
>> "--with-macvtap=3Dyes,--with-macvtap=3Dno,libnl,libnl"
>> +PACKAGECONFIG[libvirtd] =3D "--with-libvirtd,--without-libvirtd"
>> +PACKAGECONFIG[netcf] =3D "--with-netcf,--without-netcf,netcf,netcf"
>> +
>> +# Enable the Python tool support
>> +require libvirt-python.inc
>> +
>> +do_install_append() {
>> +    install -d ${D}/etc/init.d
>> +    install -d ${D}/etc/libvirt
>> +
>> +    install -m 0755 ${WORKDIR}/libvirtd.sh ${D}/etc/init.d/libvirtd
>> +    install -m 0644 ${WORKDIR}/libvirtd.conf
>> ${D}/etc/libvirt/libvirtd.conf
>> +}
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

