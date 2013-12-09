Return-Path: <rob.dobson@citrix.com>
Received: from SMTP02.CITRIX.COM (smtp02.citrix.com [66.165.176.63])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6C51E006D2
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Dec 2013 08:54:12 -0800 (PST)
X-IronPort-AV: E=Sophos;i="4.93,859,1378857600"; d="scan'208";a="80083857"
Received: from accessns.citrite.net (HELO FTLPEX01CL02.citrite.net)
	([10.9.154.239])
	by FTLPIPO02.CITRIX.COM with ESMTP; 09 Dec 2013 16:54:10 +0000
Received: from AMSPEX01CL03.citrite.net (10.69.46.34) by
	FTLPEX01CL02.citrite.net (10.13.107.79) with Microsoft SMTP Server
	(TLS) id 14.2.342.4; Mon, 9 Dec 2013 11:54:10 -0500
Received: from AMSPEX01CL02.citrite.net ([169.254.7.18]) by
	AMSPEX01CL03.citrite.net ([10.69.46.34]) with mapi id 14.02.0342.004;
	Mon, 9 Dec 2013 17:54:08 +0100
From: Rob Dobson <rob.dobson@citrix.com>
To: Philip Tricca <flihp@twobit.us>
Thread-Topic: [meta-virtualization] Error: kernel-module-xen-acpi-processor
	not found in the base feeds
Thread-Index: AQHO8ewHL3Dr25S33kGLF7stWJsnFJpGGcmAgAE8nACABMMsgA==
Date: Mon, 9 Dec 2013 16:54:07 +0000
Message-ID: <C40136690E471047B567224B6AD7213D1C0BEC@AMSPEX01CL02.citrite.net>
References: <C40136690E471047B567224B6AD7213D1BED57@AMSPEX01CL02.citrite.net>
	<CADkTA4NcFnN2E08G8xMxTs+tkKQh3_xnjXBxwFeL9W332L3Pdg@mail.gmail.com>
	<CABZSBQd+CD3j-WBsUiMW5x53HUeYcXeDpKLxiLjyb7AVjaS+pQ@mail.gmail.com>
	<52A20414.3080600@twobit.us>
In-Reply-To: <52A20414.3080600@twobit.us>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.80.118.241]
MIME-Version: 1.0
X-DLP: MIA2
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Error: kernel-module-xen-acpi-processor not found in the base feeds
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
X-List-Received-Date: Mon, 09 Dec 2013 16:54:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for your help - and thanks for the example Philip, that's very helpf=
ul.

Thanks,

Rob

-----Original Message-----
From: Philip Tricca [mailto:flihp@twobit.us]=20
Sent: 06 December 2013 17:06
To: Rob Dobson
Cc: Chris Patterson; meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] Error: kernel-module-xen-acpi-processor =
not found in the base feeds

Hey Rob,

Chris is spot on here. You need 'xen' in your DISTRO_FEATURES. Figured sinc=
e you point out that you're new to OE you may want an example as well. I've=
 got some config / metadata up on github if you're interested.
Basically I've set up a meta layer specifically for distro stuff that doesn=
't belong in meta-virt to deal with stuff like this. You can check out the =
distro config here:

https://github.com/flihp/meta-integral/blob/master/conf/distro/integral-ndv=
m.conf

There's a bunch of stuff there that you may not want (selinux) but there's =
useful stuff too for Xen guests. Specifically I've had to sort out how to d=
eal with the xen console and fstab for PV guests to get xenfs mounted etc. =
Nothing too complicated but it may save you some time.

Hope this helps,
Philip

On 12/05/2013 05:13 PM, Chris Patterson wrote:
> You may need to add 'xen' to your DISTRO_FEATURES if you haven't=20
> already.  It will enable the xen configuration bits for the kernel.
>=20
>=20
> On Thu, Dec 5, 2013 at 6:57 PM, Bruce Ashfield=20
> <bruce.ashfield@gmail.com <mailto:bruce.ashfield@gmail.com>> wrote:
>=20
>     On Thu, Dec 5, 2013 at 7:29 AM, Rob Dobson <rob.dobson@citrix.com
>     <mailto:rob.dobson@citrix.com>> wrote:
>     > Hi all,
>     >
>     > I'm new to OpenEmbedded and I've been trying to use the
>     meta-virtualization layer in order to build a small Xen guest VM.
>     >
>     > The target I am building for is 'xen-guest-image-minimal',
>      however I am hitting a failure complete 'do_rootfs':
>     >
>     >        Error: kernel-module-xen-acpi-processor not found in the
>     base feeds (genericx86 core2 i686 i586 i486 i386 x86 noarch any all).
>     >
>     > Can anyone see what I'm doing wrong here?
>=20
>     Still suffering with this problem ? Nothing jumps to mind as a
>     problem, since
>     it really looks like you haven't changed anything from the default
>     configuration.
>=20
>     The error implies that the kernel module wasn't built for the board
>     in question.
>=20
>     Can you check the kernel build directory and check the .config to
>     see if the
>     Xen options where enabled ?
>=20
>     Bruce
>=20
>     >
>     > Thanks very much.
>     >
>     > Rob
>     >
>     >>>>>>> BUILD CONFIG >>>>>>>
>     > Build Configuration:
>     > BB_VERSION        =3D "1.20.0"
>     > BUILD_SYS         =3D "x86_64-linux"
>     > NATIVELSBSTRING   =3D "Ubuntu-12.04"
>     > TARGET_SYS        =3D "i586-poky-linux"
>     > MACHINE           =3D "genericx86"
>     > DISTRO            =3D "poky"
>     > DISTRO_VERSION    =3D "1.5"
>     > TUNE_FEATURES     =3D "m32 core2"
>     > TARGET_FPU        =3D ""
>     > meta
>     > meta-yocto
>     > meta-yocto-bsp    =3D "master:64f0a0bc408d8e32d5e795aeb9fffee0539f5=
e22"
>     > meta-oe
>     > meta-networking   =3D "master:b2c0f57f01ee8286c55259c8e0215a7c90169=
9fc"
>     > meta-virtualization =3D
>     "master:61f1cd9c44f2bf1cb6b3605d2587baf9f439db9a"
>     >
>     >>>>>>> MACHINE >>>>>>>
>     > MACHINE ?=3D "genericx86"
>     >
>     >>>>>>> FAILURE MESSAGE >>>>>>>
>     > DEBUG: Executing python function rootfs_process_ignore
>     > DEBUG: Python function rootfs_process_ignore finished
>     > DEBUG: Executing python function rootfs_runtime_mapping
>     > DEBUG: Python function rootfs_runtime_mapping finished
>     > DEBUG: Executing shell function do_rootfs
>     > Note: configuring RPM platform settings
>     > Note: configuring RPM system provides
>     > Note: configuring RPM DB settings
>     > Note: configuring Smart settings
>     >
>     > Note: adding Smart channel genericx86 (55)
>     >
>     > Note: adding Smart channel core2 (50)
>     >
>     > Note: adding Smart channel i586 (40)
>     >
>     > Note: adding Smart channel all (10)
>     >
>     > Note: configuring RPM cross-install scriptlet_wrapper
>     >
>     > Updating cache...             =20
>     ######################################## [100%]
>     >
>     > Saving cache...
>     >
>     > Error: kernel-module-xen-acpi-processor not found in the base
>     feeds (genericx86 core2 i686 i586 i486 i386 x86 noarch any all).
>     > WARNING: exit code 1 from a shell command.
>     > ERROR: Function failed: do_rootfs (log file is located at
>     /local/files/yocto/poky-dora-10.0.0/build/tmp/work/genericx86-poky-li=
nux/xen-guest-image-minimal/1.0-r0/temp/log.do_rootfs.21957)
>     >
>     >>>>>>> BBLAYERS >>>>>>
>     > # LAYER_CONF_VERSION is increased each time build/conf/bblayers.con=
f
>     > # changes incompatibly
>     > LCONF_VERSION =3D "6"
>     >
>     > BBPATH =3D "${TOPDIR}"
>     > BBFILES ?=3D ""
>     >
>     > BBLAYERS ?=3D " \
>     >   /local/files/yocto/poky-dora-10.0.0/meta \
>     >   /local/files/yocto/poky-dora-10.0.0/meta-yocto \
>     >   /local/files/yocto/poky-dora-10.0.0/meta-yocto-bsp \
>     >   /local/files/yocto/poky-dora-10.0.0/meta-oe/meta-oe \
>     >   /local/files/yocto/poky-dora-10.0.0/meta-oe/meta-networking \
>     >   /local/files/yocto/poky-dora-10.0.0/meta-virtualization \
>     >   "
>     > BBLAYERS_NON_REMOVABLE ?=3D " \
>     >   /local/files/yocto/poky-dora-10.0.0/meta \
>     >   /local/files/yocto/poky-dora-10.0.0/meta-yocto \
>     >   "
>     >
>     >>>>>>> meta-oe/conf/layer.conf >>>>>>
>     > Updated priority:
>     >        BBFILE_PRIORITY_openembedded-layer =3D "4"
>     > _______________________________________________
>     > meta-virtualization mailing list
>     > meta-virtualization@yoctoproject.org
>     <mailto:meta-virtualization@yoctoproject.org>
>     > https://lists.yoctoproject.org/listinfo/meta-virtualization
>=20
>=20
>=20
>     --
>     "Thou shalt not follow the NULL pointer, for chaos and madness await
>     thee at its end"
>     _______________________________________________
>     meta-virtualization mailing list
>     meta-virtualization@yoctoproject.org
>     <mailto:meta-virtualization@yoctoproject.org>
>     https://lists.yoctoproject.org/listinfo/meta-virtualization
>=20
>=20
>=20
>=20
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>=20


