Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 995A0E0143A
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 06:26:23 -0800 (PST)
Received: by mail-la0-f48.google.com with SMTP id m13so5610758lah.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 06:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Yo4VOFOOth76VuRMQihg0Czv5jIh4AputWYVgZzmEBg=;
	b=M+OYSeNyHKbb37dUSVftNb+0TGpblL0WWi6SlNPdICnA0R7AFepygSJidd7g7wCmtg
	4P6KXKB4ef4RJg0HLeiheEWwInHbPdnkS0WXRPcOQ5QHMMIFv/sgyGupkPNZK2SUCRIk
	e/xvvyDn5rPO5LvbQTJe6aQS61v/qEBe8JCAdQNnCnyUhM5nD2PtuIOk/lmU/Qx+3L6b
	D9UBAbwrTCA0IqKTZeOdGUUIp6Bne1W7Lh1dJLdOcvc4LPQ70Dbwvm7N0ivjN8Bp/Cj/
	7ST/m4ip3CQilYelq2kcWL/2EhMNnK+jMgDiMo3Jm/q0pYTzgr7KjtKWqJnkOimPSQvf
	8Ssg==
MIME-Version: 1.0
Received: by 10.112.47.38 with SMTP id a6mr1002289lbn.93.1354803981951; Thu,
	06 Dec 2012 06:26:21 -0800 (PST)
Received: by 10.114.77.164 with HTTP; Thu, 6 Dec 2012 06:26:21 -0800 (PST)
In-Reply-To: <1354802601-10840-14-git-send-email-david.c.nystrom@gmail.com>
References: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
	<1354802601-10840-14-git-send-email-david.c.nystrom@gmail.com>
Date: Thu, 6 Dec 2012 09:26:21 -0500
Message-ID: <CADkTA4NrbWtbBB-0oqHPC1VHMbvxkJnKKfbYD9p68cD_jwX02A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: David Nystrom <david.c.nystrom@gmail.com>
Cc: meta-virtualization@yoctoproject.org
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
X-List-Received-Date: Thu, 06 Dec 2012 14:26:24 -0000
Content-Type: multipart/alternative; boundary=bcaec554da0415a29204d02fe205

--bcaec554da0415a29204d02fe205
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 6, 2012 at 9:03 AM, <david.c.nystrom@gmail.com> wrote:

> From: David Nystr=F6m <david.nystrom@enea.com>
>
> ---
>  recipes-extended/libvirt/libvirt_1.0.0.bb |  139
> +++++++++++++++++++++++++++++
>  1 file changed, 139 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt_1.0.0.bb
>
> diff --git a/recipes-extended/libvirt/libvirt_1.0.0.bbb/recipes-extended/=
libvirt/
> libvirt_1.0.0.bb
> new file mode 100644
> index 0000000..45b460a
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt_1.0.0.bb
> @@ -0,0 +1,139 @@
> +DESCRIPTION =3D "A toolkit to interact with the virtualization capabilit=
ies
> of recent versions of Linux."
> +HOMEPAGE =3D "http://libvirt.org"
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfb919cc88dbe06ec0b0bd50e001cc=
f1f"
> +SECTION =3D "console/tools"
> +PR =3D "r2"
> +
> +DEPENDS =3D "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap
> util-linux e2fsprogs pm-utils \
> +          iptables ebtables dnsmasq readline"
> +
> +# These might be included by PACKAGECONFIG
> +#RRECOMMENDS+=3D "polkit qemu yajl libnl lxc netcf"
> +
> +RDEPENDS_libvirt-libvirtd +=3D "bridge-utils iptables pm-utils dnsmasq
> openbsd-netcat"
> +RDEPENDS_libvirt-libvirtd_append_x86-64 =3D " dmidecode"
> +RDEPENDS_libvirt-libvirtd_append_x86 =3D " dmidecode"
> +
> +#connman blocks the 53 port and libvirtd can't start its DNS service
> +RCONFLICTS_${PN}_libvirtd =3D "connman"
> +
> +SRC_URI =3D "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
> +       file://libvirtd.sh \
> +       file://libvirtd.conf"
> +
> +SRC_URI[md5sum] =3D "7c8b006de7338e30866bb56738803b21"
> +SRC_URI[sha256sum] =3D
> "14c8a30ebfb939c82cab5f759a95d09646b43b4210e45490e92459ae65123076"
> +
> +inherit autotools gettext update-rc.d
> +
> +CACHED_CONFIGUREVARS +=3D "\
> +ac_cv_path_XMLLINT=3D/usr/bin/xmllint \
> +ac_cv_path_XMLCATLOG=3D/usr/bin/xmlcatalog \
> +ac_cv_path_AUGPARSE=3D/usr/bin/augparse \
> +ac_cv_path_DNSMASQ=3D/usr/bin/dnsmasq \
> +ac_cv_path_BRCTL=3D/usr/sbin/brctl \
> +ac_cv_path_TC=3D/sbin/tc \
> +ac_cv_path_UDEVADM=3D/sbin/udevadm \
> +ac_cv_path_MODPROBE=3D/sbin/modprobe \
> +ac_cv_path_IP_PATH=3D/bin/ip \
> +ac_cv_path_IPTABLES_PATH=3D/usr/sbin/iptables \
> +ac_cv_path_IP6TABLES_PATH=3D/usr/sbin/ip6tables \
> +ac_cv_path_MOUNT=3D/bin/mount \
> +ac_cv_path_UMOUNT=3D/bin/umount \
> +ac_cv_path_MKFS=3D/usr/sbin/mkfs \
> +ac_cv_path_SHOWMOUNT=3D/usr/sbin/showmount \
> +ac_cv_path_PVCREATE=3D/usr/sbin/pvcreate \
> +ac_cv_path_VGCREATE=3D/usr/sbin/vgcreate \
> +ac_cv_path_LVCREATE=3D/usr/sbin/lvcreate \
> +ac_cv_path_PVREMOVE=3D/usr/sbin/pvremove \
> +ac_cv_path_VGREMOVE=3D/usr/sbin/vgremove \
> +ac_cv_path_LVREMOVE=3D/usr/sbin/lvremove \
> +ac_cv_path_LVCHANGE=3D/usr/sbin/lvchange \
> +ac_cv_path_VGCHANGE=3D/usr/sbin/vgchange \
> +ac_cv_path_VGSCAN=3D/usr/sbin/vgscan \
> +ac_cv_path_PVS=3D/usr/sbin/pvs \
> +ac_cv_path_VGS=3D/usr/sbin/vgs \
> +ac_cv_path_LVS=3D/usr/sbin/lvs \
> +ac_cv_path_PARTED=3D/usr/sbin/parted \
> +ac_cv_path_DMSETUP=3D/usr/sbin/dmsetup"
> +
> +# Some other possible paths we are not yet setting
> +#ac_cv_path_RPCGEN=3D
> +#ac_cv_path_XSLTPROC=3D
> +#ac_cv_path_RADVD=3D
> +#ac_cv_path_UDEVSETTLE=3D
> +#ac_cv_path_EBTABLES_PATH=3D
> +#ac_cv_path_PKG_CONFIG=3D
> +#ac_cv_path_ac_pt_PKG_CONFIG
> +#ac_cv_path_PKCHECK_PATH=3D
> +#ac_cv_path_POLKIT_AUTH=3D
> +#ac_cv_path_DTRACE=3D
> +#ac_cv_path_ISCSIADM=3D
> +#ac_cv_path_MSGFMT=3D
> +#ac_cv_path_GMSGFMT=3D
> +#ac_cv_path_XGETTEXT=3D
> +#ac_cv_path_MSGMERGE=3D
> +#ac_cv_path_SCRUB=3D
> +#ac_cv_path_PYTHON=3D
> +
> +ALLOW_EMPTY_${PN} =3D "1"
> +
> +PACKAGES =3D+ "${PN}-libvirtd ${PN}-virsh"
> +
> +FILES_${PN}-libvirtd =3D "${sysconfdir}/init.d \
> +       ${sysconfdir}/sysctl.d \
> +       ${sysconfdir}/logrotate.d \
> +       ${sysconfdir}/libvirt/libvirtd.conf \
> +       ${sbindir}/libvirtd"
>

What happens if libvirtd is disabled via:

 PACKAGECONFIG[libvirtd] =3D "--with-libvirtd,--without-libvirtd"

I haven't tried it to see, but on a glance, it looks like some missing file=
s
and packaging issues.

Cheers,

Bruce

+
> +FILES_${PN}-virsh =3D "${bindir}/virsh"
> +FILES_${PN} +=3D "${libdir}/libvirt/connection-driver \
> +           ${datadir}/augeas \
> +           ${datadir}/polkit-1"
> +
> +FILES_${PN}-dbg +=3D "${libdir}/libvirt/connection-driver/.debug"
> +FILES_${PN}-staticdev +=3D "${libdir}/*.a
> ${libdir}/libvirt/connection-driver/*.a"
> +
> +INITSCRIPT_PACKAGES =3D "${PN}-libvirtd"
> +INITSCRIPT_NAME_${PN}-libvirtd =3D "libvirtd"
> +INITSCRIPT_PARAMS_${PN}-libvirtd =3D "defaults 72"
> +
> +# xen-minimal config
> +#PACKAGECONFIG ??=3D "xen libxl xen-inotify test remote libvirtd"
> +
> +# full config
> +PACKAGECONFIG ??=3D "qemu yajl xen libxl xen-inotify uml openvz vmware v=
box
> esx \
> +                  polkit lxc test remote macvtap libvirtd netcf"
> +
> +PACKAGECONFIG[qemu] =3D "--with-qemu,--without-qemu,qemu"
> +PACKAGECONFIG[yajl] =3D "--with-yajl,--without-yajl,yajl,yajl"
> +PACKAGECONFIG[xen] =3D "--with-xen,--without-xen,xen"
> +PACKAGECONFIG[xenapi] =3D "--with-xenapi,--without-xenapi"
> +PACKAGECONFIG[libxl] =3D
> "--with-libxl=3D${STAGING_DIR_TARGET}/lib,--without-libxl,xen"
> +PACKAGECONFIG[xen-inotify] =3D
> "--with-xen-inotify,--without-xen-inotify,xen"
> +PACKAGECONFIG[uml] =3D "--with-uml, --without-uml"
> +PACKAGECONFIG[openvz] =3D "--with-openvz,--without-openvz"
> +PACKAGECONFIG[vmware] =3D "--with-vmware,--without-vmware"
> +PACKAGECONFIG[phyp] =3D "--with-phyp,--without-phyp"
> +PACKAGECONFIG[vbox] =3D "--with-vbox,--without-vbox"
> +PACKAGECONFIG[esx] =3D "--with-esx,--without-esx"
> +PACKAGECONFIG[hyperv] =3D "--with-hyperv,--without-hyperv"
> +PACKAGECONFIG[polkit] =3D "--with-polkit,--without-polkit,polkit,polkit"
> +PACKAGECONFIG[lxc] =3D "--with-lxc,--without-lxc, lxc"
> +PACKAGECONFIG[test] =3D "--with-test=3Dyes,--with-test=3Dno"
> +PACKAGECONFIG[remote] =3D "--with-remote,--without-remote"
> +PACKAGECONFIG[macvtap] =3D
> "--with-macvtap=3Dyes,--with-macvtap=3Dno,libnl,libnl"
> +PACKAGECONFIG[libvirtd] =3D "--with-libvirtd,--without-libvirtd"
> +PACKAGECONFIG[netcf] =3D "--with-netcf,--without-netcf,netcf,netcf"
>

Another random questions. I've got some other libvirt recipes kicking
around, and
is it generally frowned upon to trigger options via DISTRO_FEATURES vs
PACKAGECONFIG ? I'm thinking of bigger scale features like selinux, which
are
decided on a distro basis.

Cheers,

Bruce


> +
> +# Enable the Python tool support
> +require libvirt-python.inc
> +
> +do_install_append() {
> +       install -d ${D}/etc/init.d
> +       install -d ${D}/etc/libvirt
> +
> +       install -m 0755 ${WORKDIR}/libvirtd.sh ${D}/etc/init.d/libvirtd
> +       install -m 0644 ${WORKDIR}/libvirtd.conf
> ${D}/etc/libvirt/libvirtd.conf
> +}
> --
> 1.7.9.5
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--bcaec554da0415a29204d02fe205
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Thu, D=
ec 6, 2012 at 9:03 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:david.c.nys=
trom@gmail.com" target=3D"_blank">david.c.nystrom@gmail.com</a>&gt;</span> =
wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">From: David Nystr=F6m &lt;<a href=3D"mailto:david.nystrom@=
enea.com">david.nystrom@enea.com</a>&gt;<br>

<br>
---<br>
=A0recipes-extended/libvirt/<a href=3D"http://libvirt_1.0.0.bb" target=3D"_=
blank">libvirt_1.0.0.bb</a> | =A0139 +++++++++++++++++++++++++++++<br>
=A01 file changed, 139 insertions(+)<br>
=A0create mode 100644 recipes-extended/libvirt/<a href=3D"http://libvirt_1.=
0.0.bb" target=3D"_blank">libvirt_1.0.0.bb</a><br>
<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.0.0.bb" t=
arget=3D"_blank">libvirt_1.0.0.bb</a> b/recipes-extended/libvirt/<a href=3D=
"http://libvirt_1.0.0.bb" target=3D"_blank">libvirt_1.0.0.bb</a><br>
new file mode 100644<br>
index 0000000..45b460a<br>
--- /dev/null<br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_1.0.0.bb" target=
=3D"_blank">libvirt_1.0.0.bb</a><br>
@@ -0,0 +1,139 @@<br>
+DESCRIPTION =3D &quot;A toolkit to interact with the virtualization capabi=
lities of recent versions of Linux.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://libvirt.org" target=3D"_blank">http:/=
/libvirt.org</a>&quot;<br>
+LICENSE =3D &quot;GPLv2+&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dfb919cc88dbe06ec0b0bd50e00=
1ccf1f&quot;<br>
+SECTION =3D &quot;console/tools&quot;<br>
+PR =3D &quot;r2&quot;<br>
+<br>
+DEPENDS =3D &quot;bridge-utils gnutls libxml2 lvm2 avahi parted curl libpc=
ap util-linux e2fsprogs pm-utils \<br>
+ =A0 =A0 =A0 =A0 =A0iptables ebtables dnsmasq readline&quot;<br>
+<br>
+# These might be included by PACKAGECONFIG<br>
+#RRECOMMENDS+=3D &quot;polkit qemu yajl libnl lxc netcf&quot;<br>
+<br>
+RDEPENDS_libvirt-libvirtd +=3D &quot;bridge-utils iptables pm-utils dnsmas=
q openbsd-netcat&quot;<br>
+RDEPENDS_libvirt-libvirtd_append_x86-64 =3D &quot; dmidecode&quot;<br>
+RDEPENDS_libvirt-libvirtd_append_x86 =3D &quot; dmidecode&quot;<br>
+<br>
+#connman blocks the 53 port and libvirtd can&#39;t start its DNS service<b=
r>
+RCONFLICTS_${PN}_libvirtd =3D &quot;connman&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"http://libvirt.org/sources/libvirt-${PV}.tar.=
gz" target=3D"_blank">http://libvirt.org/sources/libvirt-${PV}.tar.gz</a> \=
<br>
+ =A0 =A0 =A0 file://libvirtd.sh \<br>
+ =A0 =A0 =A0 file://libvirtd.conf&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;7c8b006de7338e30866bb56738803b21&quot;<br>
+SRC_URI[sha256sum] =3D &quot;14c8a30ebfb939c82cab5f759a95d09646b43b4210e45=
490e92459ae65123076&quot;<br>
+<br>
+inherit autotools gettext update-rc.d<br>
+<br>
+CACHED_CONFIGUREVARS +=3D &quot;\<br>
+ac_cv_path_XMLLINT=3D/usr/bin/xmllint \<br>
+ac_cv_path_XMLCATLOG=3D/usr/bin/xmlcatalog \<br>
+ac_cv_path_AUGPARSE=3D/usr/bin/augparse \<br>
+ac_cv_path_DNSMASQ=3D/usr/bin/dnsmasq \<br>
+ac_cv_path_BRCTL=3D/usr/sbin/brctl \<br>
+ac_cv_path_TC=3D/sbin/tc \<br>
+ac_cv_path_UDEVADM=3D/sbin/udevadm \<br>
+ac_cv_path_MODPROBE=3D/sbin/modprobe \<br>
+ac_cv_path_IP_PATH=3D/bin/ip \<br>
+ac_cv_path_IPTABLES_PATH=3D/usr/sbin/iptables \<br>
+ac_cv_path_IP6TABLES_PATH=3D/usr/sbin/ip6tables \<br>
+ac_cv_path_MOUNT=3D/bin/mount \<br>
+ac_cv_path_UMOUNT=3D/bin/umount \<br>
+ac_cv_path_MKFS=3D/usr/sbin/mkfs \<br>
+ac_cv_path_SHOWMOUNT=3D/usr/sbin/showmount \<br>
+ac_cv_path_PVCREATE=3D/usr/sbin/pvcreate \<br>
+ac_cv_path_VGCREATE=3D/usr/sbin/vgcreate \<br>
+ac_cv_path_LVCREATE=3D/usr/sbin/lvcreate \<br>
+ac_cv_path_PVREMOVE=3D/usr/sbin/pvremove \<br>
+ac_cv_path_VGREMOVE=3D/usr/sbin/vgremove \<br>
+ac_cv_path_LVREMOVE=3D/usr/sbin/lvremove \<br>
+ac_cv_path_LVCHANGE=3D/usr/sbin/lvchange \<br>
+ac_cv_path_VGCHANGE=3D/usr/sbin/vgchange \<br>
+ac_cv_path_VGSCAN=3D/usr/sbin/vgscan \<br>
+ac_cv_path_PVS=3D/usr/sbin/pvs \<br>
+ac_cv_path_VGS=3D/usr/sbin/vgs \<br>
+ac_cv_path_LVS=3D/usr/sbin/lvs \<br>
+ac_cv_path_PARTED=3D/usr/sbin/parted \<br>
+ac_cv_path_DMSETUP=3D/usr/sbin/dmsetup&quot;<br>
+<br>
+# Some other possible paths we are not yet setting<br>
+#ac_cv_path_RPCGEN=3D<br>
+#ac_cv_path_XSLTPROC=3D<br>
+#ac_cv_path_RADVD=3D<br>
+#ac_cv_path_UDEVSETTLE=3D<br>
+#ac_cv_path_EBTABLES_PATH=3D<br>
+#ac_cv_path_PKG_CONFIG=3D<br>
+#ac_cv_path_ac_pt_PKG_CONFIG<br>
+#ac_cv_path_PKCHECK_PATH=3D<br>
+#ac_cv_path_POLKIT_AUTH=3D<br>
+#ac_cv_path_DTRACE=3D<br>
+#ac_cv_path_ISCSIADM=3D<br>
+#ac_cv_path_MSGFMT=3D<br>
+#ac_cv_path_GMSGFMT=3D<br>
+#ac_cv_path_XGETTEXT=3D<br>
+#ac_cv_path_MSGMERGE=3D<br>
+#ac_cv_path_SCRUB=3D<br>
+#ac_cv_path_PYTHON=3D<br>
+<br>
+ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
+<br>
+PACKAGES =3D+ &quot;${PN}-libvirtd ${PN}-virsh&quot;<br>
+<br>
+FILES_${PN}-libvirtd =3D &quot;${sysconfdir}/init.d \<br>
+ =A0 =A0 =A0 ${sysconfdir}/sysctl.d \<br>
+ =A0 =A0 =A0 ${sysconfdir}/logrotate.d \<br>
+ =A0 =A0 =A0 ${sysconfdir}/libvirt/libvirtd.conf \<br>
+ =A0 =A0 =A0 ${sbindir}/libvirtd&quot;<br></blockquote><div><br></div><div=
>What happens if libvirtd is disabled via:</div><div><br></div><div>=A0PACK=
AGECONFIG[libvirtd] =3D &quot;--with-libvirtd,--without-libvirtd&quot;</div=
><div>
<br></div><div>I haven&#39;t tried it to see, but on a glance, it looks lik=
e some missing files</div><div>and packaging issues.</div><div><br></div><d=
iv>Cheers,</div><div><br></div><div>Bruce</div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1p=
x;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1=
ex">

+<br>
+FILES_${PN}-virsh =3D &quot;${bindir}/virsh&quot;<br>
+FILES_${PN} +=3D &quot;${libdir}/libvirt/connection-driver \<br>
+ =A0 =A0 =A0 =A0 =A0 ${datadir}/augeas \<br>
+ =A0 =A0 =A0 =A0 =A0 ${datadir}/polkit-1&quot;<br>
+<br>
+FILES_${PN}-dbg +=3D &quot;${libdir}/libvirt/connection-driver/.debug&quot=
;<br>
+FILES_${PN}-staticdev +=3D &quot;${libdir}/*.a ${libdir}/libvirt/connectio=
n-driver/*.a&quot;<br>
+<br>
+INITSCRIPT_PACKAGES =3D &quot;${PN}-libvirtd&quot;<br>
+INITSCRIPT_NAME_${PN}-libvirtd =3D &quot;libvirtd&quot;<br>
+INITSCRIPT_PARAMS_${PN}-libvirtd =3D &quot;defaults 72&quot;<br>
+<br>
+# xen-minimal config<br>
+#PACKAGECONFIG ??=3D &quot;xen libxl xen-inotify test remote libvirtd&quot=
;<br>
+<br>
+# full config<br>
+PACKAGECONFIG ??=3D &quot;qemu yajl xen libxl xen-inotify uml openvz vmwar=
e vbox esx \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0polkit lxc test remote macvtap libvirt=
d netcf&quot;<br>
+<br>
+PACKAGECONFIG[qemu] =3D &quot;--with-qemu,--without-qemu,qemu&quot;<br>
+PACKAGECONFIG[yajl] =3D &quot;--with-yajl,--without-yajl,yajl,yajl&quot;<b=
r>
+PACKAGECONFIG[xen] =3D &quot;--with-xen,--without-xen,xen&quot;<br>
+PACKAGECONFIG[xenapi] =3D &quot;--with-xenapi,--without-xenapi&quot;<br>
+PACKAGECONFIG[libxl] =3D &quot;--with-libxl=3D${STAGING_DIR_TARGET}/lib,--=
without-libxl,xen&quot;<br>
+PACKAGECONFIG[xen-inotify] =3D &quot;--with-xen-inotify,--without-xen-inot=
ify,xen&quot;<br>
+PACKAGECONFIG[uml] =3D &quot;--with-uml, --without-uml&quot;<br>
+PACKAGECONFIG[openvz] =3D &quot;--with-openvz,--without-openvz&quot;<br>
+PACKAGECONFIG[vmware] =3D &quot;--with-vmware,--without-vmware&quot;<br>
+PACKAGECONFIG[phyp] =3D &quot;--with-phyp,--without-phyp&quot;<br>
+PACKAGECONFIG[vbox] =3D &quot;--with-vbox,--without-vbox&quot;<br>
+PACKAGECONFIG[esx] =3D &quot;--with-esx,--without-esx&quot;<br>
+PACKAGECONFIG[hyperv] =3D &quot;--with-hyperv,--without-hyperv&quot;<br>
+PACKAGECONFIG[polkit] =3D &quot;--with-polkit,--without-polkit,polkit,polk=
it&quot;<br>
+PACKAGECONFIG[lxc] =3D &quot;--with-lxc,--without-lxc, lxc&quot;<br>
+PACKAGECONFIG[test] =3D &quot;--with-test=3Dyes,--with-test=3Dno&quot;<br>
+PACKAGECONFIG[remote] =3D &quot;--with-remote,--without-remote&quot;<br>
+PACKAGECONFIG[macvtap] =3D &quot;--with-macvtap=3Dyes,--with-macvtap=3Dno,=
libnl,libnl&quot;<br>
+PACKAGECONFIG[libvirtd] =3D &quot;--with-libvirtd,--without-libvirtd&quot;=
<br>
+PACKAGECONFIG[netcf] =3D &quot;--with-netcf,--without-netcf,netcf,netcf&qu=
ot;<br></blockquote><div><br></div><div>Another random questions. I&#39;ve =
got some other libvirt recipes kicking around, and</div><div>is it generall=
y frowned upon to trigger options via DISTRO_FEATURES vs</div>
<div>PACKAGECONFIG ? I&#39;m thinking of bigger scale features like selinux=
, which are</div><div>decided on a distro basis.</div><div><br></div><div>C=
heers,</div><div><br></div><div>Bruce</div><div>=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">

+<br>
+# Enable the Python tool support<br>
+require libvirt-python.inc<br>
+<br>
+do_install_append() {<br>
+ =A0 =A0 =A0 install -d ${D}/etc/init.d<br>
+ =A0 =A0 =A0 install -d ${D}/etc/libvirt<br>
+<br>
+ =A0 =A0 =A0 install -m 0755 ${WORKDIR}/libvirtd.sh ${D}/etc/init.d/libvir=
td<br>
+ =A0 =A0 =A0 install -m 0644 ${WORKDIR}/libvirtd.conf ${D}/etc/libvirt/lib=
virtd.conf<br>
+}<br>
<span class=3D""><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>&quot;Thou shalt not follow the NULL pointer, for chaos and madness await=
 thee at its end&quot;<br>
</div>

--bcaec554da0415a29204d02fe205--
