Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D860CE00E6A; Thu,  5 Sep 2019 05:56:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4FAD1E00E41
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Sep 2019 05:56:28 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x85CuMjr009333
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 Sep 2019 05:56:22 -0700 (PDT)
Received: from yow-masselst-lx1.localnet (128.224.60.192) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Thu, 5 Sep 2019 05:56:22 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Date: Thu, 5 Sep 2019 08:56:21 -0400
Message-ID: <8209043.2KpMlyVhZ9@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF73B5B6D526@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1567425189-118862-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAPuovELN1S+uxOTkdaE=-SohXru1fAdcN1hstGhriTHoTNVb6g@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B5B6D526@G08CNEXMBPEKD01.g08.fujitsu.local>
MIME-Version: 1.0
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-glanceclient: upgrade 2.8.0 -> 2.16.0
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
X-List-Received-Date: Thu, 05 Sep 2019 12:56:30 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Tuesday, September 3, 2019 7:52:55 P.M. EDT Zheng, Ruoqin wrote:
> To Mark
>=20
>=20
> > What's with the extra churn here? Was the moving around of lines
> > deliberate, if
 so it needs to be covered in the long log. If not you
> > should avoid this as it is similar to mixing real changes and non-real
> > changes, it only serves to make the review more difficult.
> >=20
> > MarkA
>=20
>=20
> Sorry=EF=BC=8CI will be careful next time.

np. Thanks for keeping this in mind in the future.

MarkA

>=20
> --------------------------------------------------
> Zheng Ruoqin
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
> ADDR.: No.6 Wenzhu Road, Software Avenue,
>        Nanjing, 210012, China
> MAIL : zhengrq.fnst@cn.fujistu.com
>=20
>=20
>=20
> > -----Original Message-----
> > From: Mark Asselstine [mailto:mark.asselstine@windriver.com]
> > Sent: Wednesday, September 04, 2019 4:46 AM
> > To: Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 <zhengrq.fnst@cn.fujitsu=
=2Ecom>
> > Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
> > Subject: Re: [meta-virtualization] [PATCH] python-glanceclient: upgrade
> > 2.8.0 ->
 2.16.0
> >=20
> > On Mon, Sep 2, 2019 at 7:53 AM Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.co=
m>
> > wrote:
> >=20
> > >
> > >
> > > Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> > > ---
> > >=20
> > >  .../python/python-glanceclient_git.bb          | 18 ++++++++--------=
=2D-
> > >  1 file changed, 8 insertions(+), 10 deletions(-)
> > >
> > >
> > >
> > > diff --git
> > > a/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
> > > b/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
> > > index 00ea2ab..e828cba 100644
> > > ---
> > > a/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
> > > +++ b/meta-openstack/recipes-devtools/python/python-glanceclient_git.b
> > > +++ b
> > > @@ -3,22 +3,20 @@ HOMEPAGE =3D "https://github.com/openstack/python->=
 >=20
> > glanceclient"
> >=20
> > >  SECTION =3D "devel/python"
> > >  LICENSE =3D "Apache-2.0"
> > >  LIC_FILES_CHKSUM =3D
> >=20
> > "file://LICENSE;md5=3D34400b68072d710fecd0a2940a0d1658"
> >=20
> > > +SRC_URI =3D "git://github.com/openstack/python-glanceclient.git \
> > > +           file://glance-api-check.sh \
> > > +        "
> > > +
> > > +PV =3D "2.16.0+git${SRCPV}"
> > > +SRCREV =3D "44a4dbd6ce2642daeaca9f45ac99e2d1b39e805a"
> > > +S =3D "${WORKDIR}/git"
> > > +
> > >=20
> > >  DEPENDS +=3D " \
> > > =20
> > >          gmp \
> > >          python-pip \
> > >          python-pbr \
> > >          "
> > >
> > >
> > >
> > > -SRCREV =3D "13b25ff1fed908cfe7b4e719a97efd7121e3be96"
> > > -PV =3D "2.8.0+git${SRCPV}"
> > > -
> > > -SRC_URI =3D "\
> > > -       git://github.com/openstack/${BPN}.git;branch=3Dstable/pike \
> > > -       file://glance-api-check.sh \
> > > -       "
> > > -
> > > -S =3D "${WORKDIR}/git"
> >=20
> >=20
> > What's with the extra churn here? Was the moving around of lines
> > deliberate, if
 so it needs to be covered in the long log. If not you
> > should avoid this as it is similar to mixing real changes and non-real
> > changes, it only serves to make the review more difficult.
> >=20
> > MarkA
> >=20
> >=20
> > > -
> > >=20
> > >  inherit setuptools monitor rmargparse
> > >
> > >
> > >
> > >  FILES_${PN} +=3D "${datadir}/${SRCNAME}"
> > >=20
> > > --
> > > 2.17.1
> > >
> > >
> > >
> > >
> > >
> > > --
> > > _______________________________________________
> > > meta-virtualization mailing list
> > > meta-virtualization@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-virtualization
> >=20
> >=20
>=20
>=20





