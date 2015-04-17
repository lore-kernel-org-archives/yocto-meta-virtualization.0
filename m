Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9BDAFE009C2; Thu, 16 Apr 2015 19:09:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0405E00965
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 Apr 2015 19:09:38 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3H29Xq8024406
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Apr 2015 19:09:33 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.14]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0224.002;
	Thu, 16 Apr 2015 19:09:33 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Lei Maohui
	<leimaohui@cn.fujitsu.com>
Thread-Topic: [meta-virtualization] [PATCH] python-psycopg2_2.5: The license
	should be GPLv3+
Thread-Index: AQHQeHmB2j7PWL9Y90OiGabhzM9bnZ1QdWIg
Date: Fri, 17 Apr 2015 02:09:42 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAF0D27342@ALA-MBA.corp.ad.wrs.com>
References: <1429156721-39898-1-git-send-email-leimaohui@cn.fujitsu.com>
	<CADkTA4N7oqyy1-=WhcCTF+vULC3pXFoiLwXMNhHiOOi-7jXeZg@mail.gmail.com>
In-Reply-To: <CADkTA4N7oqyy1-=WhcCTF+vULC3pXFoiLwXMNhHiOOi-7jXeZg@mail.gmail.com>
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
X-List-Received-Date: Fri, 17 Apr 2015 02:09:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-virtualization-bounces@yoctoproject.org [mailto:meta-virtualiz=
ation-
> bounces@yoctoproject.org] On Behalf Of Bruce Ashfield
> Sent: Friday, April 17, 2015 3:14 AM
> To: Lei Maohui
> Cc: meta-virtualization@yoctoproject.org
> Subject: Re: [meta-virtualization] [PATCH] python-psycopg2_2.5: The licen=
se should be GPLv3+
>=20
> On Wed, Apr 15, 2015 at 11:58 PM, Lei Maohui <leimaohui@cn.fujitsu.com> w=
rote:
> > Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
>=20
> Thanks! I've merged the change.
>=20
> Bruce
>=20
> > ---
> >  meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git
> > a/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
> > b/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
> > index c93e62b..ab4fe1f 100644
> > --- a/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
> > +++ b/meta-openstack/recipes-devtools/python/python-psycopg2_2.5.bb
> > @@ -1,7 +1,7 @@
> >  DESCRIPTION =3D "Python-PostgreSQL Database Adapter"
> >  HOMEPAGE =3D "http://initd.org/psycopg/"
> >  SECTION =3D "devel/python"
> > -LICENSE =3D "GPLv2"
> > +LICENSE =3D "GPLv3+

The right quotation mark is missing, which cause parsing error.

Thanks,
Jackie


> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2c9872d13fa571e7ba6de95055d=
a1fe2"
> >  DEPENDS =3D "postgresql"
> >
> > --
> > 1.8.4.2
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>=20
>=20
>=20
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at its end"
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

