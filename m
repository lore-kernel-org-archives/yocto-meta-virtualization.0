Return-Path: <rob.dobson@citrix.com>
Received: from SMTP02.CITRIX.COM (smtp02.citrix.com [66.165.176.63])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4A9EE007AF
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Dec 2013 04:30:14 -0800 (PST)
X-IronPort-AV: E=Sophos;i="4.93,832,1378857600"; d="scan'208";a="78545136"
Received: from accessns.citrite.net (HELO FTLPEX01CL03.citrite.net)
	([10.9.154.239])
	by FTLPIPO02.CITRIX.COM with ESMTP; 05 Dec 2013 12:29:53 +0000
Received: from AMSPEX01CL01.citrite.net (10.69.46.32) by
	FTLPEX01CL03.citrite.net (10.13.107.80) with Microsoft SMTP Server
	(TLS) id 14.2.342.4; Thu, 5 Dec 2013 07:29:52 -0500
Received: from AMSPEX01CL02.citrite.net ([169.254.7.18]) by
	AMSPEX01CL01.citrite.net ([10.69.46.32]) with mapi id 14.02.0342.004;
	Thu, 5 Dec 2013 13:29:38 +0100
From: Rob Dobson <rob.dobson@citrix.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: Error: kernel-module-xen-acpi-processor not found in the base
	feeds 
Thread-Index: Ac7xtaB/+mC9DvQqSvaCzFbTiGVyTw==
Date: Thu, 5 Dec 2013 12:29:37 +0000
Message-ID: <C40136690E471047B567224B6AD7213D1BED57@AMSPEX01CL02.citrite.net>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.80.118.241]
MIME-Version: 1.0
X-DLP: MIA1
Subject: Error: kernel-module-xen-acpi-processor not found in the base feeds
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
X-List-Received-Date: Thu, 05 Dec 2013 12:30:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm new to OpenEmbedded and I've been trying to use the meta-virtualization=
 layer in order to build a small Xen guest VM.

The target I am building for is 'xen-guest-image-minimal',  however I am hi=
tting a failure complete 'do_rootfs':

       Error: kernel-module-xen-acpi-processor not found in the base feeds =
(genericx86 core2 i686 i586 i486 i386 x86 noarch any all).

Can anyone see what I'm doing wrong here?

Thanks very much.

Rob

>>>>>> BUILD CONFIG >>>>>>>
Build Configuration:
BB_VERSION        =3D "1.20.0"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "Ubuntu-12.04"
TARGET_SYS        =3D "i586-poky-linux"
MACHINE           =3D "genericx86"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "1.5"
TUNE_FEATURES     =3D "m32 core2"
TARGET_FPU        =3D ""
meta             =20
meta-yocto       =20
meta-yocto-bsp    =3D "master:64f0a0bc408d8e32d5e795aeb9fffee0539f5e22"
meta-oe          =20
meta-networking   =3D "master:b2c0f57f01ee8286c55259c8e0215a7c901699fc"
meta-virtualization =3D "master:61f1cd9c44f2bf1cb6b3605d2587baf9f439db9a"

>>>>>> MACHINE >>>>>>>
MACHINE ?=3D "genericx86"

>>>>>> FAILURE MESSAGE >>>>>>>
DEBUG: Executing python function rootfs_process_ignore
DEBUG: Python function rootfs_process_ignore finished
DEBUG: Executing python function rootfs_runtime_mapping
DEBUG: Python function rootfs_runtime_mapping finished
DEBUG: Executing shell function do_rootfs
Note: configuring RPM platform settings
Note: configuring RPM system provides
Note: configuring RPM DB settings
Note: configuring Smart settings

Note: adding Smart channel genericx86 (55)

Note: adding Smart channel core2 (50)

Note: adding Smart channel i586 (40)

Note: adding Smart channel all (10)

Note: configuring RPM cross-install scriptlet_wrapper

Updating cache...               ######################################## [1=
00%]

Saving cache...

Error: kernel-module-xen-acpi-processor not found in the base feeds (generi=
cx86 core2 i686 i586 i486 i386 x86 noarch any all).
WARNING: exit code 1 from a shell command.
ERROR: Function failed: do_rootfs (log file is located at /local/files/yoct=
o/poky-dora-10.0.0/build/tmp/work/genericx86-poky-linux/xen-guest-image-min=
imal/1.0-r0/temp/log.do_rootfs.21957)

>>>>>> BBLAYERS >>>>>>
# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
LCONF_VERSION =3D "6"

BBPATH =3D "${TOPDIR}"
BBFILES ?=3D ""

BBLAYERS ?=3D " \
  /local/files/yocto/poky-dora-10.0.0/meta \
  /local/files/yocto/poky-dora-10.0.0/meta-yocto \
  /local/files/yocto/poky-dora-10.0.0/meta-yocto-bsp \
  /local/files/yocto/poky-dora-10.0.0/meta-oe/meta-oe \
  /local/files/yocto/poky-dora-10.0.0/meta-oe/meta-networking \
  /local/files/yocto/poky-dora-10.0.0/meta-virtualization \
  "
BBLAYERS_NON_REMOVABLE ?=3D " \
  /local/files/yocto/poky-dora-10.0.0/meta \
  /local/files/yocto/poky-dora-10.0.0/meta-yocto \
  "

>>>>>> meta-oe/conf/layer.conf >>>>>>
Updated priority:
       BBFILE_PRIORITY_openembedded-layer =3D "4"

