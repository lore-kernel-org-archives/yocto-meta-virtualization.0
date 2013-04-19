Return-Path: <mihai.prica@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6476E014AD
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Apr 2013 02:36:17 -0700 (PDT)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Apr 2013 02:36:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,507,1363158000"; d="scan'208";a="320811577"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by orsmga002.jf.intel.com with ESMTP; 19 Apr 2013 02:36:16 -0700
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Fri, 19 Apr 2013 10:36:13 +0100
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.73]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.245]) with mapi id
	14.01.0355.002; Fri, 19 Apr 2013 10:36:12 +0100
From: "Prica, Mihai" <mihai.prica@intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH 2/2] libvirt: Changed python
	bindings install location
Thread-Index: AQHOPEwKj4Cdx+SMBk2tOvv0yuKtCZjdSYKw
Date: Fri, 19 Apr 2013 09:36:13 +0000
Message-ID: <97BD068FB200C44AA73C2B641F162ECF985E61@IRSMSX101.ger.corp.intel.com>
References: <1366297842-10846-1-git-send-email-mihai.prica@intel.com>
	<1366297842-10846-2-git-send-email-mihai.prica@intel.com>
	<CADkTA4N87FqdCv2SS9va3xw-n4eEyxB0PqmWKhGQuLo_qs0m_Q@mail.gmail.com>
In-Reply-To: <CADkTA4N87FqdCv2SS9va3xw-n4eEyxB0PqmWKhGQuLo_qs0m_Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] libvirt: Changed python bindings install location
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
X-List-Received-Date: Fri, 19 Apr 2013 09:36:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
> Sent: Thursday, April 18, 2013 6:47 PM
> To: Prica, Mihai
> Cc: meta-virtualization@yoctoproject.org
> Subject: Re: [meta-virtualization] [PATCH 2/2] libvirt: Changed python bi=
ndings
> install location
>=20
> On Thu, Apr 18, 2013 at 11:10 AM, Mihai Prica <mihai.prica@intel.com> wro=
te:
> > The libvirt-python files were installed to dist-packages and this is
> > not part of sys.path in yocto so they were not detected. Changed this
> > to site-packages.
>=20
> By detected, you mean python couldn't import and use them at runtime on t=
he
> target ?

Yes. I got an error when trying to load the module. From what I saw, In yoc=
to all=20
python packages are installed In site-packages.=20

Mihai

>=20
> Bruce
>=20
> >
> > Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> > ---
> >  recipes-extended/libvirt/libvirt-python.inc        |    4 ++--
> >  .../libvirt/libvirt/python_incdir.patch            |   15 +++++++++---=
---
> >  2 files changed, 11 insertions(+), 8 deletions(-)
> >
> > diff --git a/recipes-extended/libvirt/libvirt-python.inc
> > b/recipes-extended/libvirt/libvirt-python.inc
> > index 49d15fb..297e90c 100644
> > --- a/recipes-extended/libvirt/libvirt-python.inc
> > +++ b/recipes-extended/libvirt/libvirt-python.inc
> > @@ -10,5 +10,5 @@ RDEPENDS_${PN}-python +=3D "python"
> >  PACKAGECONFIG_${PN}-python[xen] =3D ",,,xen-python"
> >
> >  PACKAGES +=3D "${PN}-python-dbg ${PN}-python"
> > -FILES_${PN}-python-dbg +=3D "${libdir}/${PYTHON_DIR}/dist-packages/.de=
bug/"
> > -FILES_${PN}-python +=3D "${libdir}/${PYTHON_DIR}/dist-packages"
> > +FILES_${PN}-python-dbg +=3D "${libdir}/${PYTHON_DIR}/site-
> packages/.debug/"
> > +FILES_${PN}-python +=3D "${libdir}/${PYTHON_DIR}/site-packages"
> > diff --git a/recipes-extended/libvirt/libvirt/python_incdir.patch
> > b/recipes-extended/libvirt/libvirt/python_incdir.patch
> > index 6c77b09..5b78c13 100644
> > --- a/recipes-extended/libvirt/libvirt/python_incdir.patch
> > +++ b/recipes-extended/libvirt/libvirt/python_incdir.patch
> > @@ -1,8 +1,8 @@
> > -Index: libvirt-0.10.2/configure.ac
> > +Index: libvirt-1.0.3/configure.ac
> >
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D
> > ---- libvirt-0.10.2.orig/configure.ac   2012-10-29 11:59:27.091615491 +=
0200
> > -+++ libvirt-0.10.2/configure.ac        2012-10-29 12:09:50.067603647 +=
0200
> > -@@ -2397,6 +2397,11 @@
> > +--- libvirt-1.0.3.orig/configure.ac
> > ++++ libvirt-1.0.3/configure.ac
> > +@@ -1878,6 +1878,11 @@ fi
> >
> >   PYTHON_VERSION=3D
> >   PYTHON_INCLUDES=3D
> > @@ -14,9 +14,12 @@ Index: libvirt-0.10.2/configure.ac
> >   if test "$with_python" !=3D "no" ; then
> >       if test -x "$with_python/bin/python"
> >       then
> > -@@ -2422,29 +2427,30 @@
> > -         AM_PATH_PYTHON(,, [:])
> > +@@ -1901,31 +1906,32 @@ if test "$with_python" !=3D "no" ; then
> >
> > +     if test "$with_python" =3D "yes" ; then
> > +         AM_PATH_PYTHON(,, [:])
> > +-
> > ++        pyexecdir=3D$prefix/lib/python$PYTHON_VERSION/site-packages
> >           if test "$PYTHON" !=3D : ; then
> >  -            PYTHON_CONFIG=3D"$PYTHON-config"
> >  -
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>=20
>=20
>=20
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at its
> end"

