Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C4E22E009C2; Thu, 16 Apr 2015 23:23:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 394BBE0085D
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 Apr 2015 23:23:31 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3H6NMFk019435
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Apr 2015 23:23:23 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.14]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0224.002;
	Thu, 16 Apr 2015 23:23:22 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "Lei, Maohui" <leimaohui@cn.fujitsu.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH] python-psycopg2_2.5: The license
	should be GPLv3+
Thread-Index: AQHQeHmB2j7PWL9Y90OiGabhzM9bnZ1QdWIggACP1ID//7WCgA==
Date: Fri, 17 Apr 2015 06:23:32 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAF0D276D2@ALA-MBA.corp.ad.wrs.com>
References: <1429156721-39898-1-git-send-email-leimaohui@cn.fujitsu.com>
	<CADkTA4N7oqyy1-=WhcCTF+vULC3pXFoiLwXMNhHiOOi-7jXeZg@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AAF0D27342@ALA-MBA.corp.ad.wrs.com>
	<1B56A49860EB2D45ADE3731B15C959FDAF8060@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FDAF8060@G08CNEXMBPEKD01.g08.fujitsu.local>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.132]
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
X-List-Received-Date: Fri, 17 Apr 2015 06:23:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Lei, Maohui [mailto:leimaohui@cn.fujitsu.com]
> Sent: Friday, April 17, 2015 11:42 AM
> To: Huang, Jie (Jackie); Bruce Ashfield
> Cc: meta-virtualization@yoctoproject.org
> Subject: RE: [meta-virtualization] [PATCH] python-psycopg2_2.5: The licen=
se should be GPLv3+
>=20
> On April 17, 2015 10:10 AM, Huang, Jie (Jackie) [mailto:Jackie.Huang@wind=
river.com] wrote:
>=20
> > > > -LICENSE =3D "GPLv2"
> > > > +LICENSE =3D "GPLv3+
> >
> > The right quotation mark is missing, which cause parsing error.
>=20
> Sorry.That's my fault. Should I re-submit this patch again ?

Yes, I think you should, and I check that the license should be LGPLv3+, co=
uld you check again
and re-send the patch? Thanks!

Thanks,
Jackie

>=20
>=20
> Best Regards,
> Lei
>=20
>=20
> > -----Original Message-----
> > From: Huang, Jie (Jackie) [mailto:Jackie.Huang@windriver.com]
> > Sent: Friday, April 17, 2015 10:10 AM
> > To: Bruce Ashfield; Lei, Maohui
> > Cc: meta-virtualization@yoctoproject.org
> > Subject: RE: [meta-virtualization] [PATCH] python-psycopg2_2.5: The
> > license should be GPLv3+
> >
> >
> >
> > > -----Original Message-----
> > > From: meta-virtualization-bounces@yoctoproject.org
> > > [mailto:meta-virtualization- bounces@yoctoproject.org] On Behalf Of
> > > Bruce Ashfield
> > > Sent: Friday, April 17, 2015 3:14 AM
> > > To: Lei Maohui
> > > Cc: meta-virtualization@yoctoproject.org
> > > Subject: Re: [meta-virtualization] [PATCH] python-psycopg2_2.5: The
> > > license should be GPLv3+
> > >
> > > On Wed, Apr 15, 2015 at 11:58 PM, Lei Maohui <leimaohui@cn.fujitsu.co=
m> wrote:
> > > > Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> > >
> > > Thanks! I've merged the change.
> > >
> > > Bruce
> > >
> > > > ---
> > > >  meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb | 2
> > > > +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git
> > > > a/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
> > > > b/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
> > > > index c93e62b..ab4fe1f 100644
> > > > ---
> > > > a/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
> > > > +++ b/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.b
> > > > +++ b
> > > > @@ -1,7 +1,7 @@
> > > >  DESCRIPTION =3D "Python-PostgreSQL Database Adapter"
> > > >  HOMEPAGE =3D "http://initd.org/psycopg/"
> > > >  SECTION =3D "devel/python"
> > > > -LICENSE =3D "GPLv2"
> > > > +LICENSE =3D "GPLv3+
> >
> > The right quotation mark is missing, which cause parsing error.
> >
> > Thanks,
> > Jackie
> >
> >
> > > >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2c9872d13fa571e7ba6de95=
055da1fe2"
> > > >  DEPENDS =3D "postgresql"
> > > >
> > > > --
> > > > 1.8.4.2
> > > >
> > > > --
> > > > _______________________________________________
> > > > meta-virtualization mailing list
> > > > meta-virtualization@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-virtualization
> > >
> > >
> > >
> > > --
> > > "Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at
> > its end"
> > > --
> > > _______________________________________________
> > > meta-virtualization mailing list
> > > meta-virtualization@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-virtualization

