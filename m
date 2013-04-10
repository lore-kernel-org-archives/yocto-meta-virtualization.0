Return-Path: <B43198@freescale.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe001.messaging.microsoft.com [65.55.88.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A475FE014EA
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Apr 2013 06:12:35 -0700 (PDT)
Received: from mail31-tx2-R.bigfish.com (10.9.14.243) by
	TX2EHSOBE014.bigfish.com (10.9.40.34) with Microsoft SMTP Server id
	14.1.225.23; Wed, 10 Apr 2013 13:12:35 +0000
Received: from mail31-tx2 (localhost [127.0.0.1])	by mail31-tx2-R.bigfish.com
	(Postfix) with ESMTP id EA9EE440142;
	Wed, 10 Apr 2013 13:12:34 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I542I1432Izz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz17326ah8275bh8275dh8275chz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ahbe9i1155h)
Received: from mail31-tx2 (localhost.localdomain [127.0.0.1]) by mail31-tx2
	(MessageSwitch) id 1365599548781030_12428;
	Wed, 10 Apr 2013 13:12:28 +0000 (UTC)
Received: from TX2EHSMHS022.bigfish.com (unknown [10.9.14.249])	by
	mail31-tx2.bigfish.com (Postfix) with ESMTP id AC5761740049;
	Wed, 10 Apr 2013 13:12:28 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS022.bigfish.com
	(10.9.99.122) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 10 Apr 2013 13:12:27 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.128]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0328.011; Wed, 10 Apr 2013 13:12:27 +0000
From: Purcareata Bogdan-B43198 <B43198@freescale.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH] Add disable udhcp patch to LXC
	recipe
Thread-Index: AQHONeqVB+Iq6farDkmPLDm4sFnxn5jPbJLA
Message-ID: <E7E317BD5B5D764682EEAC13B01676E264D3F8@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1365586806-8155-1-git-send-email-bogdan.purcareata@freescale.com>
	<1365592743-24488-1-git-send-email-bogdan.purcareata@freescale.com>
	<CADkTA4OTJH-deN7=zRkgSm9O=krEAhVHsAAmM2YYYFmO+iUkLw@mail.gmail.com>
In-Reply-To: <CADkTA4OTJH-deN7=zRkgSm9O=krEAhVHsAAmM2YYYFmO+iUkLw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.171.74.6]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-Mailman-Approved-At: Thu, 29 Aug 2013 06:02:43 -0700
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Add disable udhcp patch to LXC recipe
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
Date: Wed, 10 Apr 2013 13:12:35 -0000
X-Original-Date: Wed, 10 Apr 2013 13:12:26 +0000
X-List-Received-Date: Wed, 10 Apr 2013 13:12:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

The patch makes a modification to the LXC busybox template - the one that c=
reates a minimal container with Busybox.

This container will start the udhcpc service - the DHCP client - on init. F=
or an embedded Linux image, can we assume that most containers will have ma=
nual / static networking configuration on start? If so, starting the udhcpc=
 service by default is useless, since the service will then have to be kill=
ed. If there are still containers that use DHCP for networking, they can st=
art udhcpc after container boot.

The patch deactivates default start of the DHCP client on a Busybox contain=
er init.

Best regards,
Bogdan P.


> -----Original Message-----
> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
> Sent: Wednesday, April 10, 2013 3:55 PM
> To: Purcareata Bogdan-B43198
> Cc: meta-virtualization@yoctoproject.org
> Subject: Re: [meta-virtualization] [PATCH] Add disable udhcp patch to LXC=
 recipe
>=20
> Can we get a long log here ? Why would we need to do this, and when ? Wha=
t
> is this trying to fix ? This is unconditionally applied, so it will
> always be off .. that
> alone warrants and explanation in the long log.
>=20
> Bruce
>=20
> On Wed, Apr 10, 2013 at 7:19 AM, Bogdan Purcareata
> <bogdan.purcareata@freescale.com> wrote:
> > Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> > ---
> >  ...0.9.0-disable-udhcp-from-busybox-template.patch | 24 ++++++++++++++=
++++++++
> >  recipes-containers/lxc/lxc_0.9.0.bb                |  1 +
> >  2 files changed, 25 insertions(+)
> >  create mode 100644 recipes-containers/lxc/files/lxc-0.9.0-disable-udhc=
p-from-busybox-template.patch
> >
> > diff --git a/recipes-containers/lxc/files/lxc-0.9.0-disable-udhcp-from-=
busybox-template.patch
> b/recipes-containers/lxc/files/lxc-0.9.0-disable-udhcp-from-busybox-templ=
ate.patch
> > new file mode 100644
> > index 0000000..723be27
> > --- /dev/null
> > +++ b/recipes-containers/lxc/files/lxc-0.9.0-disable-udhcp-from-busybox=
-template.patch
> > @@ -0,0 +1,24 @@
> > +From d7e07e7acb1cbad33806f49143a2a30b4468c369 Mon Sep 17 00:00:00 2001
> > +From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> > +Date: Mon, 8 Apr 2013 18:30:19 +0300
> > +Subject: [PATCH] lxc-0.9.0-disable-udhcp-from-busybox-template
> > +
> > +---
> > + templates/lxc-busybox.in | 1 -
> > + 1 file changed, 1 deletion(-)
> > +
> > +diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
> > +index cb425ec..bb8c951 100644
> > +--- a/templates/lxc-busybox.in
> > ++++ b/templates/lxc-busybox.in
> > +@@ -84,7 +84,6 @@ EOF
> > + #!/bin/sh
> > + /bin/syslogd
> > + /bin/mount -a
> > +-/bin/udhcpc
> > + EOF
> > +
> > +     # executable
> > +--
> > +1.7.11.7
> > +
> > diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/l=
xc/lxc_0.9.0.bb
> > index 292285d..1d6ce71 100644
> > --- a/recipes-containers/lxc/lxc_0.9.0.bb
> > +++ b/recipes-containers/lxc/lxc_0.9.0.bb
> > @@ -22,6 +22,7 @@ RDEPENDS_${PN} =3D " \
> >  "
> >
> >  SRC_URI =3D "http://lxc.sourceforge.net/download/lxc/${PN}-${PV}.tar.g=
z \
> > +       file://lxc-0.9.0-disable-udhcp-from-busybox-template.patch \
> >         "
> >  SRC_URI[md5sum] =3D "8552a4479090616f4bc04d8473765fc9"
> >  SRC_URI[sha256sum] =3D "1e1767eae6cc5fbf892c0e193d25da420ba19f2db20371=
6c38f7cdea3b654120"
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



