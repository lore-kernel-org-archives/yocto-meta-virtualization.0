Return-Path: <leimaohui@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8F313E009C2; Thu, 16 Apr 2015 20:41:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EDF74E00965
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 Apr 2015 20:41:39 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="90813317"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Apr 2015 11:37:48 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t3H3eQYm005912;
	Fri, 17 Apr 2015 11:40:26 +0800
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0181.006; Fri, 17 Apr 2015 11:41:37 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH] python-psycopg2_2.5: The license
	should be GPLv3+
Thread-Index: AQHQeHl3PpUPBdiIY06tOXxryjoj3J1P8BIAgACdmXA=
Date: Fri, 17 Apr 2015 03:41:37 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDAF8060@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1429156721-39898-1-git-send-email-leimaohui@cn.fujitsu.com>
	<CADkTA4N7oqyy1-=WhcCTF+vULC3pXFoiLwXMNhHiOOi-7jXeZg@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AAF0D27342@ALA-MBA.corp.ad.wrs.com>
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AAF0D27342@ALA-MBA.corp.ad.wrs.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.48]
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-psycopg2_2.5: The license should be GPLv3+
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
X-List-Received-Date: Fri, 17 Apr 2015 03:41:44 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

On April 17, 2015 10:10 AM, Huang, Jie (Jackie) [mailto:Jackie.Huang@windri=
ver.com] wrote:

> > > -LICENSE =3D "GPLv2"
> > > +LICENSE =3D "GPLv3+
>=20
> The right quotation mark is missing, which cause parsing error.

Sorry.That's my fault. Should I re-submit this patch again ?=20


Best Regards,
Lei


> -----Original Message-----
> From: Huang, Jie (Jackie) [mailto:Jackie.Huang@windriver.com]
> Sent: Friday, April 17, 2015 10:10 AM
> To: Bruce Ashfield; Lei, Maohui=20
> Cc: meta-virtualization@yoctoproject.org
> Subject: RE: [meta-virtualization] [PATCH] python-psycopg2_2.5: The licen=
se
> should be GPLv3+
>=20
>=20
>=20
> > -----Original Message-----
> > From: meta-virtualization-bounces@yoctoproject.org
> > [mailto:meta-virtualization- bounces@yoctoproject.org] On Behalf Of
> > Bruce Ashfield
> > Sent: Friday, April 17, 2015 3:14 AM
> > To: Lei Maohui
> > Cc: meta-virtualization@yoctoproject.org
> > Subject: Re: [meta-virtualization] [PATCH] python-psycopg2_2.5: The
> > license should be GPLv3+
> >
> > On Wed, Apr 15, 2015 at 11:58 PM, Lei Maohui <leimaohui@cn.fujitsu.com>=
 wrote:
> > > Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> >
> > Thanks! I've merged the change.
> >
> > Bruce
> >
> > > ---
> > >  meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb | 2
> > > +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git
> > > a/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
> > > b/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
> > > index c93e62b..ab4fe1f 100644
> > > --- a/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
> > > +++ b/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
> > > @@ -1,7 +1,7 @@
> > >  DESCRIPTION =3D "Python-PostgreSQL Database Adapter"
> > >  HOMEPAGE =3D "http://initd.org/psycopg/"
> > >  SECTION =3D "devel/python"
> > > -LICENSE =3D "GPLv2"
> > > +LICENSE =3D "GPLv3+
>=20
> The right quotation mark is missing, which cause parsing error.
>=20
> Thanks,
> Jackie
>=20
>=20
> > >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2c9872d13fa571e7ba6de9505=
5da1fe2"
> > >  DEPENDS =3D "postgresql"
> > >
> > > --
> > > 1.8.4.2
> > >
> > > --
> > > _______________________________________________
> > > meta-virtualization mailing list
> > > meta-virtualization@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-virtualization
> >
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await th=
ee at
> its end"
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization

