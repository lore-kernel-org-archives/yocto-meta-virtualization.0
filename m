Return-Path: <B28495@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe001.messaging.microsoft.com [216.32.180.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36CE0E01483
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jun 2013 19:35:49 -0700 (PDT)
Received: from mail131-va3-R.bigfish.com (10.7.14.254) by
	VA3EHSOBE007.bigfish.com (10.7.40.11) with Microsoft SMTP Server id
	14.1.225.23; Tue, 18 Jun 2013 02:35:47 +0000
Received: from mail131-va3 (localhost [127.0.0.1])	by
	mail131-va3-R.bigfish.com (Postfix) with ESMTP id 2EA6C2400B2;
	Tue, 18 Jun 2013 02:35:47 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zz98dI9371I542I1432I4015Izz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz17326ah1954cbh8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dfeh1dffh1e1dhbe9i1155h)
Received: from mail131-va3 (localhost.localdomain [127.0.0.1]) by mail131-va3
	(MessageSwitch) id 1371522945461194_16735;
	Tue, 18 Jun 2013 02:35:45 +0000 (UTC)
Received: from VA3EHSMHS017.bigfish.com (unknown [10.7.14.247])	by
	mail131-va3.bigfish.com (Postfix) with ESMTP id 622E7C0070;
	Tue, 18 Jun 2013 02:35:45 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS017.bigfish.com
	(10.7.99.27) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 18 Jun 2013 02:35:41 +0000
Received: from 039-SN2MPN1-011.039d.mgd.msft.net ([169.254.1.25]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0328.011; Tue, 18 Jun 2013 02:35:41 +0000
From: Liu Ting-B28495 <B28495@freescale.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH] libvirt: use libexecdir instead
	of hard code path
Thread-Index: AQHOZe7nFDYZeQa6N029970WDNBQUJk6zPng
Date: Tue, 18 Jun 2013 02:35:40 +0000
Message-ID: <AF604684617F454390621992F367F16901D15A31@039-SN2MPN1-011.039d.mgd.msft.net>
References: <1370573111-13102-1-git-send-email-b28495@freescale.com>
	<CADkTA4N=H5RUGCp-iL3ge_psPmpDPhbGTn2ywA3SOj6eo4bmwQ@mail.gmail.com>
In-Reply-To: <CADkTA4N=H5RUGCp-iL3ge_psPmpDPhbGTn2ywA3SOj6eo4bmwQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.99]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: Re: [PATCH] libvirt: use libexecdir instead of hard code path
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
X-List-Received-Date: Tue, 18 Jun 2013 02:35:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
> Sent: Monday, June 10, 2013 11:25 PM
> To: Liu Ting-B28495
> Cc: meta-virtualization@yoctoproject.org; Luo Zhenhua-B19537
> Subject: Re: [meta-virtualization] [PATCH] libvirt: use libexecdir
> instead of hard code path
>=20
> On Thu, Jun 6, 2013 at 10:45 PM,  <b28495@freescale.com> wrote:
> > From: Ting Liu <b28495@freescale.com>
>=20
> Thanks, I've staged the change locally. Will push it out shortly.
>=20

Ping.

> Bruce
>=20
> >
> > Signed-off-by: Ting Liu <b28495@freescale.com>
> > ---
> >  recipes-extended/libvirt/libvirt_1.0.3.bb |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb
> > b/recipes-extended/libvirt/libvirt_1.0.3.bb
> > index b29c055..479ce7e 100644
> > --- a/recipes-extended/libvirt/libvirt_1.0.3.bb
> > +++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
> > @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://libvirt.org"
> >  LICENSE =3D "GPLv2+"
> >  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dfb919cc88dbe06ec0b0bd50e001ccf1f"
> >  SECTION =3D "console/tools"
> > -PR =3D "r5"
> > +PR =3D "r6"
> >
> >  DEPENDS =3D "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpca=
p
> util-linux e2fsprogs pm-utils \
> >            iptables ebtables dnsmasq readline"
> > @@ -149,5 +149,5 @@ do_install_append() {
> >
> >         # This will wind up in the libvirtd package, but will NOT be
> invoked by default.
> >         #
> > -       mv ${D}/usr/libexec/libvirt-guests.sh ${D}/${sysconfdir}/init.d
> > +       mv ${D}/${libexecdir}/libvirt-guests.sh
> > + ${D}/${sysconfdir}/init.d
> >  }
> > --
> > 1.7.9.7
> >
> >
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>=20
>=20
>=20
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"



