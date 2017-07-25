Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2398AE00C2B; Tue, 25 Jul 2017 05:44:07 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EB5BEE00C1C
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Jul 2017 05:44:05 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6PCi4jQ015956
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Jul 2017 05:44:04 -0700 (PDT)
Received: from yow-masselst-lx1.localnet (128.224.60.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Tue, 25 Jul 2017 05:44:03 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Yi Zhao <yi.zhao@windriver.com>
Date: Tue, 25 Jul 2017 08:44:02 -0400
Message-ID: <5891948.Vm2DIDaPVG@yow-masselst-lx1>
Organization: Wind River
User-Agent: KMail/5.2.3 (Linux/4.10.0-26-generic; KDE/5.31.0; x86_64; ; )
In-Reply-To: <b5250488-6970-f6f8-3cbf-5666313b5fd9@windriver.com>
References: <1500873264-24606-1-git-send-email-yi.zhao@windriver.com>
	<CAPuovEKujQt1p+5+03X30p0NVQSOUxh1RXtAi+pjdywZZsgA1Q@mail.gmail.com>
	<b5250488-6970-f6f8-3cbf-5666313b5fd9@windriver.com>
MIME-Version: 1.0
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH 1/3] libibverbs: add new recpie
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
X-List-Received-Date: Tue, 25 Jul 2017 12:44:07 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Tuesday, July 25, 2017 3:38:24 PM EDT Yi Zhao wrote:
> =E5=9C=A8 2017=E5=B9=B407=E6=9C=8825=E6=97=A5 03:29, Mark Asselstine =E5=
=86=99=E9=81=93:
> > On Mon, Jul 24, 2017 at 1:14 AM, Yi Zhao <yi.zhao@windriver.com> wrote:
> >> Libibverbs is a library that allows userspace processes to use
> >> InfiniBand/RDMA 'verbs' directly.
> >>=20
> >> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> >> ---
> >>=20
> >>   recipes-extended/libibverbs/libibverbs_1.1.7.bb | 27
> >>   +++++++++++++++++++++++++ 1 file changed, 27 insertions(+)
> >>   create mode 100644 recipes-extended/libibverbs/libibverbs_1.1.7.bb
> >>=20
> >> diff --git a/recipes-extended/libibverbs/libibverbs_1.1.7.bb
> >> b/recipes-extended/libibverbs/libibverbs_1.1.7.bb new file mode 100644
> >> index 0000000..e75f90d
> >> --- /dev/null
> >> +++ b/recipes-extended/libibverbs/libibverbs_1.1.7.bb
> >> @@ -0,0 +1,27 @@
> >> +SUMMARY =3D "Support InfiniBand verbs"
> >> +DESCRIPTION =3D "Libibverbs is a library that allows userspace proces=
ses
> >> to use InfiniBand/RDMA 'verbs' directly." +HOMEPAGE =3D
> >> "http://www.openfabrics.org/downloads/verbs/"
> >=20
> > I am fine with this series overall. It is nice to see an uprev to
> > gluster and an effort to get it working again. I only have one
> > request. The page above basically indicates that software which used
> > libibverbs should transition to rdma_core and that this software is
> > basically deprecated. Are we using this instead of rdma_core because
> > Gluster has yet to make this transition? We need to capture whatever
> > the reasons are in the commit log.
>=20
> I checked the commit log for glusterfs, there is no explicit message
> said it only depend on old libibverbs.
> For rdma-core, it is a collection including libibverbs and librdmacm. I
> did a quick test that glusterfs can be built when depending on it.
> So maybe we could using rdma-core instead of libibverbs and librdmacm ?

I am fine with the current approach but please add the above to the commit =
log=20
for the libibverbs commit. Something like

"libibverbs is now part of rdma-core and the standalone libibverbs project =
has=20
been deprecated. Rough testing shows that we can move to use rdma-core howe=
ver=20
we have yet to perform extensive testing with this change. We therefor will=
=20
continue to use the standalone libibverbs at this point in time. This is al=
so=20
inline with the upstream glusterfs project that still lists libibverbs as a=
=20
dependency."

MarkA

>=20
> Regards,
> Yi
>=20
> > Regards,
> > Mark
> >=20
> >> +SECTION =3D "libs/devel"
> >> +
> >> +LICENSE =3D "BSD"
> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7c557f27dd795ba77cc419dddc=
656b51"
> >> +
> >> +# Official repo is at
> >> git://git.kernel.org/pub/scm/libs/infiniband/libibverbs.git +SRC_URI =
=3D
> >> "http://www.openfabrics.org/downloads/verbs/${BPN}-${PV}.tar.gz" +
> >> +SRC_URI[md5sum] =3D "5aea59e4766ae4548419010ac84032ff"
> >> +SRC_URI[sha256sum] =3D
> >> "31b4114bf32d41c9fc81a862ec5febed1e982975f21fa177ea9c7516c9064690" +
> >> +inherit autotools
> >> +
> >> +PACKAGES +=3D "${PN}-utils"
> >> +FILES_${PN} =3D "${sysconfdir} ${libdir}/*.so.*"
> >> +FILES_${PN}-utils =3D "${bindir}"
> >> +
> >> +PACKAGECONFIG ??=3D ""
> >> +PACKAGECONFIG[valgrind] =3D "--with-valgrind,--without-valgrind,valgr=
ind,"
> >> +
> >> +do_install_append() {
> >> +        mkdir -p ${D}${sysconfdir}/libibverbs.d
> >> +        rm -f ${D}${libdir}/libibverbs.la
> >> +}
> >> --
> >> 2.7.4
> >>=20
> >> --
> >> _______________________________________________
> >> meta-virtualization mailing list
> >> meta-virtualization@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-virtualization



