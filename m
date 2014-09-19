Return-Path: <Alexey_Firago@mentor.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A9B0E00819; Fri, 19 Sep 2014 08:57:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ABA6CE00819
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Sep 2014 08:57:26 -0700 (PDT)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XV0Ym-000745-3q from Alexey_Firago@mentor.com ;
	Fri, 19 Sep 2014 08:57:24 -0700
Received: from EU-MBX-04.mgc.mentorg.com ([169.254.4.147]) by
	SVR-IES-FEM-02.mgc.mentorg.com ([137.202.0.106]) with mapi id
	14.03.0181.006; Fri, 19 Sep 2014 16:57:23 +0100
From: "Firago, Alexey" <Alexey_Firago@mentor.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH] criu: add recipe for v1.2 release
Thread-Index: AQHP1ByTYclXkw8KPUuC9cS/8fORlZwImooP
Date: Fri, 19 Sep 2014 15:57:22 +0000
Message-ID: <1E529F5D1A8F3449B4163CEF4D798CF4C1005FF5@EU-MBX-04.mgc.mentorg.com>
References: <1411045229-3823-1-git-send-email-alexey_firago@mentor.com>,
	<CADkTA4N2EQWUW+AQBiTjSqSbD3jfQJiG3w3SBB8tjrWeXJ4xSg@mail.gmail.com>
In-Reply-To: <CADkTA4N2EQWUW+AQBiTjSqSbD3jfQJiG3w3SBB8tjrWeXJ4xSg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.68]
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] criu: add recipe for v1.2 release
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
X-List-Received-Date: Fri, 19 Sep 2014 15:57:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks!

One side question: CRIU requires number of flags in kernel config enabled, =
is it reasonable to create CRIU-specific .scc file here - http://git.yoctop=
roject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-kernel/linux/linu=
x-yocto ? =20

Regards,
Alexey
________________________________________
From: Bruce Ashfield [bruce.ashfield@gmail.com]
Sent: Friday, September 19, 2014 19:15
To: Firago, Alexey
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] criu: add recipe for v1.2 releas=
e

Looks good to me.

merged!

Bruce

On Thu, Sep 18, 2014 at 9:00 AM, Alexey Firago <alexey_firago@mentor.com> w=
rote:
> Building and basic functionality verified on Wandboard-dual
> with linux-wandboard_3.10.17.
>
> Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
> ---
>  .../criu-1.2/0001-Makefile-Fix-hardcoding.patch    | 42 ++++++++++++++++=
++++++
>  recipes-containers/criu/criu_1.2.bb                | 39 ++++++++++++++++=
++++
>  2 files changed, 81 insertions(+)
>  create mode 100644 recipes-containers/criu/criu-1.2/0001-Makefile-Fix-ha=
rdcoding.patch
>  create mode 100644 recipes-containers/criu/criu_1.2.bb
>
> diff --git a/recipes-containers/criu/criu-1.2/0001-Makefile-Fix-hardcodin=
g.patch b/recipes-containers/criu/criu-1.2/0001-Makefile-Fix-hardcoding.pat=
ch
> new file mode 100644
> index 0000000..fd9ab5b
> --- /dev/null
> +++ b/recipes-containers/criu/criu-1.2/0001-Makefile-Fix-hardcoding.patch
> @@ -0,0 +1,42 @@
> +From fa785bb1eb9cb0039d77836f4658c7bcccae5999 Mon Sep 17 00:00:00 2001
> +From: Alexey Firago <alexey_firago@mentor.com>
> +Date: Wed, 9 Jul 2014 02:01:11 +0400
> +Subject: [PATCH] Makefile: Fix hardcoding
> +
> +Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
> +---
> + Makefile | 18 +++++++++---------
> + 1 file changed, 9 insertions(+), 9 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index bda808d..4614ae2 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -23,15 +23,15 @@ export VERSION_SO_MAJOR VERSION_SO_MINOR
> + # Common definitions
> + #
> +
> +-FIND          :=3D find
> +-CSCOPE                :=3D cscope
> +-RM            :=3D rm -f
> +-LD            :=3D $(CROSS_COMPILE)ld
> +-CC            :=3D $(CROSS_COMPILE)gcc
> +-NM            :=3D $(CROSS_COMPILE)nm
> +-SH            :=3D bash
> +-MAKE          :=3D make
> +-OBJCOPY               :=3D $(CROSS_COMPILE)objcopy
> ++FIND          ?=3D find
> ++CSCOPE                ?=3D cscope
> ++RM            ?=3D rm -f
> ++LD            ?=3D $(CROSS_COMPILE)ld
> ++CC            ?=3D $(CROSS_COMPILE)gcc
> ++NM            ?=3D $(CROSS_COMPILE)nm
> ++SH            ?=3D bash
> ++MAKE          ?=3D make
> ++OBJCOPY               ?=3D $(CROSS_COMPILE)objcopy
> +
> + CFLAGS                +=3D $(USERCFLAGS)
> +
> +--
> +1.9.1
> +
> diff --git a/recipes-containers/criu/criu_1.2.bb b/recipes-containers/cri=
u/criu_1.2.bb
> new file mode 100644
> index 0000000..de07842
> --- /dev/null
> +++ b/recipes-containers/criu/criu_1.2.bb
> @@ -0,0 +1,39 @@
> +SUMMARY =3D "CRIU"
> +DESCRIPTION =3D "Checkpoint/Restore In Userspace, or CRIU, is a software=
 \
> +tool for Linux operating system. Using this tool, you can freeze a runni=
ng \
> +application (or part of it) and checkpoint it to a hard drive \
> +as a collection of files. You can then use the files to restore and run =
\
> +the application from the point it was frozen at. The distinctive feature=
 \
> +of the CRIU project is that it is mainly implemented in user space"
> +HOMEPAGE =3D "http://criu.org"
> +SECTION =3D "console/tools"
> +LICENSE =3D "GPLv2"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5cc804625b8b491b6b4312f0c9cb5=
efa"
> +
> +SRCREV =3D "v1.2"
> +PR =3D "r0"
> +PV =3D "1.2"
> +
> +SRC_URI =3D "git://git.criu.org/crtools.git;protocol=3Dgit \
> +       file://0001-Makefile-Fix-hardcoding.patch"
> +
> +DEPENDS +=3D "protobuf-c-native protobuf-c"
> +
> +S =3D "${WORKDIR}/git"
> +
> +ARMV_armv7a =3D "ARMV=3D7"
> +ARMV_armv6 =3D "ARMV=3D6"
> +ARMV ?=3D ""
> +EXTRA_OEMAKE +=3D "ARCH=3D${TARGET_ARCH} WERROR=3D0 ${ARMV}"
> +
> +do_compile () {
> +       unset CFLAGS
> +       unset LDFLAGS
> +       oe_runmake
> +}
> +
> +do_install () {
> +       mkdir -p ${D}/${bindir}
> +       install -m 755 ${S}/criu ${D}/${bindir}/criu
> +}
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"=

