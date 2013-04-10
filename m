Return-Path: <B43198@freescale.com>
Received: from am1outboundpool.messaging.microsoft.com
	(am1ehsobe006.messaging.microsoft.com [213.199.154.209])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 204B7E014C1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Apr 2013 06:06:08 -0700 (PDT)
Received: from mail58-am1-R.bigfish.com (10.3.201.245) by
	AM1EHSOBE018.bigfish.com (10.3.207.140) with Microsoft SMTP Server id
	14.1.225.23; Wed, 10 Apr 2013 13:06:06 +0000
Received: from mail58-am1 (localhost [127.0.0.1])	by mail58-am1-R.bigfish.com
	(Postfix) with ESMTP id 8474D60193;
	Wed, 10 Apr 2013 13:06:06 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371Ic89bh542I1432Izz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz17326ah8275bh8275dh8275chz2dh2a8h668h839h8e2h8e3h947hd25hf0ah1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ahbe9i1155h)
Received: from mail58-am1 (localhost.localdomain [127.0.0.1]) by mail58-am1
	(MessageSwitch) id 1365599164360935_21591;
	Wed, 10 Apr 2013 13:06:04 +0000 (UTC)
Received: from AM1EHSMHS011.bigfish.com (unknown [10.3.201.253])	by
	mail58-am1.bigfish.com (Postfix) with ESMTP id 553C92E0051;
	Wed, 10 Apr 2013 13:06:04 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS011.bigfish.com
	(10.3.207.111) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 10 Apr 2013 13:06:01 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.128]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0328.011;
	Wed, 10 Apr 2013 13:05:59 +0000
From: Purcareata Bogdan-B43198 <B43198@freescale.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH] Add LXC 0.9.0 recipe
Thread-Index: AQHONepkoHspFQJsx0Gh7KuBtEEdX5jPa1TQ
Message-ID: <E7E317BD5B5D764682EEAC13B01676E264D3E6@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1365587401-8284-1-git-send-email-bogdan.purcareata@freescale.com>
	<CADkTA4NmLke-mcwgVUXgcYacH0Bfy5Nn_ndLCqw7Ub-bGvdNbA@mail.gmail.com>
In-Reply-To: <CADkTA4NmLke-mcwgVUXgcYacH0Bfy5Nn_ndLCqw7Ub-bGvdNbA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.171.74.6]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-Mailman-Approved-At: Thu, 29 Aug 2013 06:02:43 -0700
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Add LXC 0.9.0 recipe
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
Date: Wed, 10 Apr 2013 13:06:08 -0000
X-Original-Date: Wed, 10 Apr 2013 13:05:59 +0000
X-List-Received-Date: Wed, 10 Apr 2013 13:06:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I can provide a log summing up the logs submitted by the LXC maintainers on=
 the lxc-devel mainling list on the intermediate releases between 0.8 and 0=
.9.

They look something like this:
> -----Original Message-----
> From: St=E9phane Graber [mailto:stgraber@ubuntu.com]
> Sent: Tuesday, April 02, 2013 4:39 AM
> To: Daniel Lezcano
> Cc: Lxc development list
> Subject: [lxc-devel] LXC 0.9 final pull request
>=20
> Hi Daniel,
>=20
> You'll find the 0.9 pull request below.
>=20
> Based on what you did last time, the following should do the trick:
>  - Review the pull request
>  - Use "git pull --edit --no-ff --stat git://github.com/lxc/lxc.git",
>    that should do a real merge, letting you do a proper Sign-off of the
>    changes.
>  - Update the version number to 0.9
>  - Commit and tag
>=20
> Feature changes include:
>  - Support for ephemeral containers in lxc-clone
>  - --clear-env/--keep-env support in lxc-attach
>  - -n option to lxc-start-ephemeral
>=20
> Everything else is bugfixes on top of rc1.
>=20
>=20
> Before sending this pull request I've done the following tests:
>  - Test build on my machine (up to date Ubuntu 13.04)
>  - Test build on Launchpad (Ubuntu 12.04, 12.10 and 13.04)
>  - Test build on an armhf board running Ubuntu 13.04
>  - Test build for Android cross-compiling on my laptop
>  - Ran our test suite on the x86 binaries
>  - Ran a quick test (start/stop/info/wait) on Android
>  - Tested the API and tools on ARM
>  - Rebuilt all my local templates (~20 containers) on a variety of
>    architectures (i386, amd64, armel and armhf)

Is this ok? How should I submit the log?

Best regards,
Bogdan P.


> -----Original Message-----
> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
> Sent: Wednesday, April 10, 2013 3:53 PM
> To: Purcareata Bogdan-B43198
> Cc: meta-virtualization@yoctoproject.org
> Subject: Re: [meta-virtualization] [PATCH] Add LXC 0.9.0 recipe
>=20
> Can we get a bit of a long log that describes how this was testing ? Or
> an entry in the meta-virtualization/docs directory ?
>=20
> There's no reason to keep this the existing recipe around, so the 0.8.0
> recipe should be removed, and we can see the differences between the
> two and ensure that functionality drops and adds are understood.
>=20
> Cheers,
>=20
> Bruce
>=20
> On Wed, Apr 10, 2013 at 5:50 AM, Bogdan Purcareata
> <bogdan.purcareata@freescale.com> wrote:
> > ---
> >  recipes-containers/lxc/lxc_0.9.0.bb | 38 +++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 38 insertions(+)
> >  create mode 100644 recipes-containers/lxc/lxc_0.9.0.bb
> >
> > diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/l=
xc/lxc_0.9.0.bb
> > new file mode 100644
> > index 0000000..292285d
> > --- /dev/null
> > +++ b/recipes-containers/lxc/lxc_0.9.0.bb
> > @@ -0,0 +1,38 @@
> > +DESCRIPTION =3D "lxc aims to use these new functionnalities to provide=
 an userspace container object"
> > +SECTION =3D "console/utils"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b36=
4516c"
> > +PRIORITY =3D "optional"
> > +PR =3D "r1"
> > +DEPENDS =3D "libxml2 libcap"
> > +RDEPENDS_${PN} =3D " \
> > +               rsync \
> > +               gzip \
> > +               libcap-bin \
> > +               bridge-utils \
> > +               dnsmasq \
> > +               perl-module-strict \
> > +               perl-module-getopt-long \
> > +               perl-module-vars \
> > +               perl-module-warnings-register \
> > +               perl-module-exporter \
> > +               perl-module-constant \
> > +               perl-module-overload \
> > +               perl-module-exporter-heavy \
> > +"
> > +
> > +SRC_URI =3D "http://lxc.sourceforge.net/download/lxc/${PN}-${PV}.tar.g=
z \
> > +       "
> > +SRC_URI[md5sum] =3D "8552a4479090616f4bc04d8473765fc9"
> > +SRC_URI[sha256sum] =3D "1e1767eae6cc5fbf892c0e193d25da420ba19f2db20371=
6c38f7cdea3b654120"
> > +
> > +S =3D "${WORKDIR}/${PN}-${PV}"
> > +
> > +PACKAGECONFIG ??=3D ""
> > +PACKAGECONFIG[doc] =3D "--enable-doc,--disable-doc"
> > +PACKAGECONFIG[rpath] =3D "--enable-rpath,--disable-rpath"
> > +PACKAGECONFIG[apparmour] =3D "--enable-apparmor,--disable-apparmor,app=
armor,apparmor"
> > +
> > +inherit autotools
> > +
> > +FILES_${PN}-dbg +=3D "${libexecdir}/lxc/.debug"
> > --
> > 1.7.11.7
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
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



