Return-Path: <B29882@freescale.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe004.messaging.microsoft.com [216.32.180.187])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25063E006CC
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Jan 2013 23:04:30 -0800 (PST)
Received: from mail97-co1-R.bigfish.com (10.243.78.197) by
	CO1EHSOBE012.bigfish.com (10.243.66.75) with Microsoft SMTP Server id
	14.1.225.23; Thu, 31 Jan 2013 07:04:29 +0000
Received: from mail97-co1 (localhost [127.0.0.1])	by mail97-co1-R.bigfish.com
	(Postfix) with ESMTP id 7FB91480133;
	Thu, 31 Jan 2013 07:04:29 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 8
X-BigFish: VS8(zz98dI9371I1432Izz1ee6h1de0h1202h1e76h1d1ah1d2ahzz17326ah8275dh8275bh1835farz2dh2a8h668h839h8e2h8e3h947hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bh15d0h162dh1631h1758h18e1h1946hbe9i1155h)
Received: from mail97-co1 (localhost.localdomain [127.0.0.1]) by mail97-co1
	(MessageSwitch) id 1359615867387048_27792;
	Thu, 31 Jan 2013 07:04:27 +0000 (UTC)
Received: from CO1EHSMHS023.bigfish.com (unknown [10.243.78.217])	by
	mail97-co1.bigfish.com (Postfix) with ESMTP id 5276658004B;
	Thu, 31 Jan 2013 07:04:27 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS023.bigfish.com
	(10.243.66.33) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 31 Jan 2013 07:04:27 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.50]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0318.003; Thu, 31 Jan 2013 07:04:22 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "lei.yang@windriver.com" <lei.yang@windriver.com>
Thread-Topic: [meta-virtualization] [PATCH] This package provides: -
	multipath: scans the system for multipathed devices,
	assembles - multipathd:
	waits for maps events then execs multipath - kpartx: maps linear
	devmaps to device partitions, which makes multipath...
Thread-Index: AQHN/4Eygni0nhEDIU6bzGMELhsXWQ==
Date: Thu, 31 Jan 2013 07:04:22 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A866F23@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1358910962-6960-1-git-send-email-lei.yang@windriver.com>
In-Reply-To: <1358910962-6960-1-git-send-email-lei.yang@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] This package provides: - multipath: scans the system for multipathed devices, assembles - multipathd: waits for maps events then execs multipath - kpartx: maps linear devmaps to device partitions, which makes multipath...
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jan 2013 07:04:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B63C2E60C305A24BB9FC1ECD3B411375@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 22, 2013 at 9:16 PM,  <lei.yang@windriver.com> wrote:
> From: Lei Yang <lei.yang@windriver.com>
>
> Now,It can be used for kvm disk img partion mounting for me.

Looks like the first subject line is way to long.... ;)

-M

>
> Signed-off-by: Lei Yang <lei.yang@windriver.com>
> ---
>  .../multipath-tools/multipath-tools_git.bb         |   46 ++++++++++++++=
++++++
>  1 files changed, 46 insertions(+), 0 deletions(-)
>  create mode 100644 recipes-extended/multipath-tools/multipath-tools_git.=
bb
>
> diff --git a/recipes-extended/multipath-tools/multipath-tools_git.bb b/re=
cipes-extended/multipath-tools/multipath-tools_git.bb
> new file mode 100644
> index 0000000..633b9f2
> --- /dev/null
> +++ b/recipes-extended/multipath-tools/multipath-tools_git.bb
> @@ -0,0 +1,46 @@
> +SUMMARY =3D "Tools to Manage Multipathed Devices with the device-mapper"
> +DESCRIPTION =3D "This package provides the tools to manage multipathed d=
evices by \
> +instructing the device-mapper multipath module what to do"
> +
> +HOMEPAGE =3D "http://christophe.varoqui.free.fr/"
> +DEPENDS =3D "readline libaio lvm2"
> +LICENSE =3D "GPLv2"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7be2873b6270e45abacc503abbe2a=
a3d"
> +S=3D"${WORKDIR}/git"
> +
> +
> +SRC_URI =3D "git://git.opensvc.com/multipath-tools/.git;protocol=3Dhttp"
> +
> +SRCREV =3D "d3683ab18b386e9b3b54b59a122c689e9ebdf5cf"
> +PV =3D "0.4.9+gitr${SRCPV}"
> +
> +inherit autotools
> +
> +EXTRA_OEMAKE=3D"LIB=3D${libdir} exec_prefix=3D${exec_prefix} libdir=3D${=
libdir}"
> +
> +PACKAGES =3D+ "libmpathpersist mpathpersist kpartx libmultipath multipat=
h multipathd libmultipath-dev libmpathpersist-dev"
> +
> +
> +RDEPENDS_${PN} +=3D "libmpathpersist mpathpersist kpartx libmultipath mu=
ltipath multipathd udev"
> +
> +do_install_append () {
> +       ln -sf libmpathpersist.so.0 ${D}${libdir}/libmpathpersist.so
> +       ln -sf libmultipath.so.0 ${D}${libdir}/libmultipath.so
> +}
> +
> +ALLOW_EMPTY_${PN} =3D "1"
> +FILES_${PN}     =3D ""
> +
> +FILES_libmpathpersist =3D "${libdir}/libmpathpersist*.so.0"
> +FILES_mpathpersist =3D "${sbindir}/mpathpersist"
> +FILES_kpartx =3D "${sbindir}/kpartx ${base_libdir}/udev/"
> +FILES_libmultipath =3D "${libdir}/libcheck*.so ${libdir}/libpri*.so ${li=
bdir}/libmultipath*.so.0"
> +FILES_multipath =3D "${sbindir}/multipath ${sysconfdir}"
> +FILES_multipathd =3D "${sbindir}/multipathd ${base_libdir}"
> +
> +#put the symbol link lib in -dev
> +FILES_libmultipath-dev =3D "${libdir}/libmultipath*.so"
> +FILES_libmpathpersist-dev =3D "${libdir}/libmpathpersist*.so"
> +
> +
> --
> 1.7.1
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization=


