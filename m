Return-Path: <zhenhua.luo@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0242.outbound.protection.outlook.com [207.46.163.242])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 901C0E00B84
	for <meta-virtualization@yoctoproject.org>;
	Sun, 13 Apr 2014 23:06:17 -0700 (PDT)
Received: from DM2PR03MB399.namprd03.prod.outlook.com (10.141.84.148) by
	DM2PR03MB400.namprd03.prod.outlook.com (10.141.84.153) with Microsoft
	SMTP Server (TLS) id 15.0.913.9; Mon, 14 Apr 2014 06:06:14 +0000
Received: from DM2PR03MB399.namprd03.prod.outlook.com ([10.141.84.148]) by
	DM2PR03MB399.namprd03.prod.outlook.com ([10.141.84.148]) with mapi id
	15.00.0913.002; Mon, 14 Apr 2014 06:06:14 +0000
From: "zhenhua.luo@freescale.com" <zhenhua.luo@freescale.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: [meta-cloud-services][PATCH] Fix the path of header files check
Thread-Index: AQHPVG6AtpYt8ItAA0OSGUUQZNeA3psQpgWQ
Date: Mon, 14 Apr 2014 06:06:13 +0000
Message-ID: <2dd2330ee67a4322911583f42eef9670@DM2PR03MB399.namprd03.prod.outlook.com>
References: <1397101240-26311-1-git-send-email-zhenhua.luo@freescale.com>
In-Reply-To: <1397101240-26311-1-git-send-email-zhenhua.luo@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.50]
x-forefront-prvs: 0181F4652A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(428001)(13464003)(51704005)(377454003)(189002)(199002)(92566001)(86362001)(74662001)(4396001)(87936001)(74316001)(85852003)(83072002)(2656002)(80022001)(50986999)(54356999)(76176999)(77096999)(76576001)(99286001)(31966008)(66066001)(46102001)(77982001)(19580405001)(83322001)(33646001)(76482001)(74502001)(19580395003)(99396002)(80976001)(79102001)(81542001)(81342001)(20776003)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR03MB400;
	H:DM2PR03MB399.namprd03.prod.outlook.com;
	FPR:30DF78FA.B24DAE9.7A4F739E.9CDDF08B.20399; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
received-spf: None (: freescale.com does not designate permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-cloud-services][PATCH] Fix the path of header files check
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
X-List-Received-Date: Mon, 14 Apr 2014 06:06:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

Can you please review the patch?


Best Regards,

Zhenhua

> -----Original Message-----
> From: Zhenhua Luo [mailto:zhenhua.luo@freescale.com]
> Sent: Thursday, April 10, 2014 11:41 AM
> To: meta-virtualization@yoctoproject.org
> Cc: Luo Zhenhua-B19537
> Subject: [meta-cloud-services][PATCH] Fix the path of header files check
>=20
> Current Makefile will check headers on host instead of Yocto sysroot,
> following error appears. Change the path of header check.
> | bs_aio.c:34:20: fatal error: libaio.h: No such file or directory
> | #include <libaio.h>
> |                     ^
> | compilation terminated.
>=20
> Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> ---
>  ...-path-of-header-files-check-in-Yocto-buil.patch | 48
> ++++++++++++++++++++++
>  meta-openstack/recipes-support/tgt/tgt_git.bb      |  6 ++-
>  2 files changed, 52 insertions(+), 2 deletions(-)  create mode 100644
> meta-openstack/recipes-support/tgt/files/0001-Correct-the-path-of-header-
> files-check-in-Yocto-buil.patch
>=20
> diff --git a/meta-openstack/recipes-support/tgt/files/0001-Correct-the-
> path-of-header-files-check-in-Yocto-buil.patch b/meta-openstack/recipes-
> support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-
> buil.patch
> new file mode 100644
> index 0000000..6106b90
> --- /dev/null
> +++ b/meta-openstack/recipes-support/tgt/files/0001-Correct-the-path-of-
> +++ header-files-check-in-Yocto-buil.patch
> @@ -0,0 +1,48 @@
> +From 5f6a261e44fec387e66d8b89d69f9602de5d5c53 Mon Sep 17 00:00:00 2001
> +From: Zhenhua Luo <zhenhua.luo@freescale.com>
> +Date: Thu, 10 Apr 2014 11:26:39 +0800
> +Subject: [PATCH] Correct the path of header files check in Yocto build
> +env
> +
> +Upstream-Status: Inappropriate [the fix is specific to Yocto build env]
> +
> +Current Makefile will check headers on host instead of Yocto sysroot,
> +following error appears. Change the path of header check.
> +| bs_aio.c:34:20: fatal error: libaio.h: No such file or directory
> +| #include <libaio.h>
> +|                     ^
> +| compilation terminated.
> +
> +Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> +---
> + usr/Makefile | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/usr/Makefile b/usr/Makefile index 453eb1a..191503d 100644
> +--- a/usr/Makefile
> ++++ b/usr/Makefile
> +@@ -1,10 +1,10 @@
> + sbindir ?=3D $(PREFIX)/sbin
> +
> +-ifneq ($(shell test -e /usr/include/linux/signalfd.h && echo 1),)
> ++ifneq ($(shell test -e $(SYSROOT)/usr/include/linux/signalfd.h && echo
> ++1),)
> + CFLAGS +=3D -DUSE_SIGNALFD
> + endif
> +
> +-ifneq ($(shell test -e /usr/include/sys/timerfd.h && echo 1),)
> ++ifneq ($(shell test -e $(SYSROOT)/usr/include/sys/timerfd.h && echo
> ++1),)
> + CFLAGS +=3D -DUSE_TIMERFD
> + endif
> +
> +@@ -18,7 +18,7 @@ TGTD_OBJS +=3D bs_rbd.o  LIBS +=3D -lrados -lrbd  endi=
f
> +
> +-ifneq ($(shell test -e /usr/include/sys/eventfd.h && test -e
> +/usr/include/libaio.h && echo 1),)
> ++ifneq ($(shell test -e $(SYSROOT)/usr/include/sys/eventfd.h && test -e
> ++$(SYSROOT)/usr/include/libaio.h && echo 1),)
> + CFLAGS +=3D -DUSE_EVENTFD
> + TGTD_OBJS +=3D bs_aio.o
> + LIBS +=3D -laio
> +--
> +1.9.1
> +
> diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb b/meta-
> openstack/recipes-support/tgt/tgt_git.bb
> index db4f56b..8be9fe4 100644
> --- a/meta-openstack/recipes-support/tgt/tgt_git.bb
> +++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
> @@ -8,7 +8,9 @@ SRCREV =3D "0ee382bab57a8ecd9ece18d511bd098298478409"
>  PV =3D "1.0.36+git${SRCPV}"
>  PR =3D "r0"
>=20
> -SRC_URI =3D "git://github.com/fujita/tgt.git"
> +SRC_URI =3D "git://github.com/fujita/tgt.git \
> +	file://0001-Correct-the-path-of-header-files-check-in-Yocto-
> buil.patch
> +\ "
>  SRC_URI +=3D "file://tgtd.init"
>=20
>  S =3D "${WORKDIR}/git"
> @@ -16,7 +18,7 @@ S =3D "${WORKDIR}/git"
>  inherit update-rc.d
>=20
>  do_compile() {
> -    oe_runmake -e programs conf scripts
> +    oe_runmake SYSROOT=3D"${STAGING_DIR_TARGET}" -e programs conf script=
s
>  }
>=20
>  do_install() {
> --
> 1.9.1
>=20


