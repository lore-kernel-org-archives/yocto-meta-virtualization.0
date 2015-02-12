Return-Path: <j105.rob@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F2F6E00945; Thu, 12 Feb 2015 04:13:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	MALFORMED_FREEMAIL, MISSING_HEADERS, RCVD_IN_DNSWL_LOW,
	TRACKER_ID autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (j105.rob[at]gmail.com)
	*  1.0 MISSING_HEADERS Missing To: header
	*  1.3 TRACKER_ID BODY: Incorporates a tracking ID number
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.173 listed in list.dnswl.org]
	* 2.6 MALFORMED_FREEMAIL Bad headers on message from free email service
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70A2EE0093B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Feb 2015 04:13:53 -0800 (PST)
Received: by pdbfp1 with SMTP id fp1so7376659pdb.5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Feb 2015 04:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:cc
	:content-type; bh=Hb1fP6IBMOL6LXdlKZRXW4M7NklZF5vUmIyJRVPTY0E=;
	b=gBV92HSfzV66eVVg1FHjvXqrLV+Z5iSKYF21ltpbcjxIGtr1p+KumeijQYFa8iSJqV
	5koVaTuhObyzVbiKc8+XdH+FaKcc16h7A79zRUOw6IyRRzuUuzOg9p2ksi5+yiWx+0F5
	1IxPWfAcdezYbq3ix/Ap8vqwYGEisQAB8S5tB2nIsMCL0El59hYkN4GnUql72TaFIYd3
	g7TQP3V2Oy42NSoqWYJuLwTWpQKZ83xlV2btZYPK1b1rBohvMLumksEmKkHtaDYvOaQw
	QFmL5nnLv99R4KjWPC6OYEI932EU7BITgGoFqvbC9jZSQrKEmjIc/FiYYI+7RRLT7uMr
	FpJQ==
MIME-Version: 1.0
X-Received: by 10.70.62.1 with SMTP id u1mr229848pdr.89.1423743233234; Thu, 12
	Feb 2015 04:13:53 -0800 (PST)
Received: by 10.66.160.137 with HTTP; Thu, 12 Feb 2015 04:13:53 -0800 (PST)
In-Reply-To: <31b67a7576df40e5b7b88081a671520e@BL2FFO11FD008.protection.gbl>
References: <CAOWu+mCXRMGc=34bW7sEYLZpecuwSmqM4+=_RvrQ4gMn9R4z9w@mail.gmail.com>
	<31b67a7576df40e5b7b88081a671520e@BL2FFO11FD008.protection.gbl>
Date: Thu, 12 Feb 2015 07:13:53 -0500
Message-ID: <CAOWu+mC+aTQpC6sDwSizFyT=WtQeNsnY6X0-OrD1sJ7ax9s=xA@mail.gmail.com>
From: Rob Weiss <j105.rob@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Building xen-image-minimal problem
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
X-List-Received-Date: Thu, 12 Feb 2015 12:13:57 -0000
Content-Type: multipart/alternative; boundary=089e0160b8d6ab1d55050ee30d8e

--089e0160b8d6ab1d55050ee30d8e
Content-Type: text/plain; charset=UTF-8

That was the issue and has now been corrected. Now I am getting the
following error:

ubuntu@yocto:/opt/rob/poky/build$ bitbake xen-image-minimal
Parsing recipes: 100%
|########################################################################################################################################################################################################|
Time: 00:00:08
Parsing of 1588 .bb files complete (0 cached, 1588 parsed). 2073 targets,
69 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.24.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-14.04"
TARGET_SYS        = "x86_64-poky-linux"
MACHINE           = "genericx86-64"
DISTRO            = "poky-selinux"
DISTRO_VERSION    = "1.7.1"
TUNE_FEATURES     = "m64 core2"
TARGET_FPU        = ""
meta
meta-yocto
meta-yocto-bsp    = "dizzy:9fc095a439c36014c73b3a8f240afba09fe0e4d7"
meta-virtualization = "dizzy:b0745517d1d8f4b6b51bc1256344cf1db7001a53"
meta-oe
meta-networking
meta-filesystems
meta-python       = "dizzy:6413cdb66acf43059f94d0076ec9b8ad6a475b35"
meta-selinux      = "dizzy:869aded23e5f999c4f6b3ecf0562ea9da4862c73"

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: Debian package install does not support BAD_RECOMMENDATIONS
ERROR: Function failed: do_configure (log file is located at
/opt/rob/poky/build/tmp/work/core2-64-poky-linux/xen/4.3.1-r0/temp/log.do_configure.8101)
ERROR: Logfile of failure stored in:
/opt/rob/poky/build/tmp/work/core2-64-poky-linux/xen/4.3.1-r0/temp/log.do_configure.8101
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
'bit-64', 'x86_64-linux', 'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_copy_aclocals
| DEBUG: Python function autotools_copy_aclocals finished
| DEBUG: Executing shell function do_configure
| NOTE: Running
/opt/rob/poky/build/tmp/work/core2-64-poky-linux/xen/4.3.1-r0/xen-4.3.1/configure
 --build=x86_64-linux    --host=x86_64-poky-linux
  --target=x86_64-poky-linux    --prefix=/usr    --exec_prefix=/usr
  --bindir=/usr/bin    --sbindir=/usr/sbin    --libexecdir=/usr/lib/xen
  --datadir=/usr/share    --sysconfdir=/etc    --sharedstatedir=/com
  --localstatedir=/var    --libdir=/usr/lib    --includedir=/usr/include
  --oldincludedir=/usr/include    --infodir=/usr/share/info
  --mandir=/usr/share/man    --disable-silent-rules
  --disable-dependency-tracking
--with-libtool-sysroot=/opt/rob/poky/build/tmp/sysroots/genericx86-64
      --exec-prefix=/usr     --prefix=/usr     --host=x86_64-poky-linux
--disable-stubdom     --disable-ioemu-stubdom     --disable-pv-grub
--disable-xenstore-stubdom  --enable-nls --enable-sdl --disable-xsmpolicy
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| Will build the following subsystems:
|   xen
|   kernels
|   tools
|   docs
| configure: creating ./config.status
| config.status: creating ./config/Toplevel.mk
| make: Entering directory
`/opt/rob/poky/build/tmp/work/core2-64-poky-linux/xen/4.3.1-r0/xen-4.3.1/tools/firmware'
|
/opt/rob/poky/build/tmp/work/core2-64-poky-linux/xen/4.3.1-r0/xen-4.3.1/tools/firmware/../../tools/Rules.mk:112:
*** You have to run ./configure before building or installing the tools.
Stop.
| make: Leaving directory
`/opt/rob/poky/build/tmp/work/core2-64-poky-linux/xen/4.3.1-r0/xen-4.3.1/tools/firmware'
| WARNING: exit code 2 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
/opt/rob/poky/build/tmp/work/core2-64-poky-linux/xen/4.3.1-r0/temp/log.do_configure.8101)
ERROR: Task 332 (/opt/extras/meta-virtualization/recipes-extended/xen/
xen_4.3.1.bb, do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2900 tasks of which 2644 didn't need to be
rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  /opt/extras/meta-virtualization/recipes-extended/xen/xen_4.3.1.bb,
do_configure
Summary: There was 1 WARNING message shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.



Any ideas how to proceed to resolve this error? I am not modifying anything
in any layer at this point, just pulling the sources and trying to build
existing supplied images.

On Wed, Feb 11, 2015 at 7:29 PM, Nathan Rossi <nathan.rossi@xilinx.com>
wrote:

> > -----Original Message-----
> > From: meta-virtualization-bounces@yoctoproject.org [mailto:meta-
> > virtualization-bounces@yoctoproject.org] On Behalf Of Rob Weiss
> > Sent: Thursday, February 12, 2015 12:35 AM
> > To: meta-virtualization@yoctoproject.org
> > Subject: [meta-virtualization] Building xen-image-minimal problem
> >
> > I am trying to build xen-image-minimal using poky dizzy and I am getting
> > the follow error:
> >
> > ubuntu@yocto:/opt/rob/poky/build$ bitbake -v xen-image-minimal
> > Loading cache: 100%
> >
> |#########################################################################
> >
> ##########################################################################
> > #######################################################| ETA:  00:00:00
> > Loaded 2074 entries from dependency cache.
> > NOTE: Resolving any missing task queue dependencies
> > NOTE: selecting pigz-native to satisfy gzip-native due to
> > PREFERRED_PROVIDERS
> > NOTE: selecting pseudo-native to satisfy virtual/fakeroot-native due to
> > PREFERRED_PROVIDERS
> > NOTE: selecting linux-yocto to satisfy virtual/kernel due to
> > PREFERRED_PROVIDERS
> > NOTE: selecting opkg-utils-native to satisfy virtual/update-alternatives-
> > native due to PREFERRED_PROVIDERS
> > NOTE: selecting linux-yocto to satisfy runtime kernel-module-xen-acpi-
> > processor due to PREFERRED_PROVIDER_virtual/kernel = linux-yocto
> > NOTE: selecting linux-yocto to satisfy runtime kernel-module-xen-blkback
> > due to PREFERRED_PROVIDER_virtual/kernel = linux-yocto
> > NOTE: selecting linux-yocto to satisfy runtime kernel-module-xen-gntalloc
> > due to PREFERRED_PROVIDER_virtual/kernel = linux-yocto
> > NOTE: selecting linux-yocto to satisfy runtime kernel-module-xen-gntdev
> > due to PREFERRED_PROVIDER_virtual/kernel = linux-yocto
> > NOTE: selecting linux-yocto to satisfy runtime kernel-module-xen-netback
> > due to PREFERRED_PROVIDER_virtual/kernel = linux-yocto
> > NOTE: selecting linux-yocto to satisfy runtime kernel-module-xen-pciback
> > due to PREFERRED_PROVIDER_virtual/kernel = linux-yocto
> > NOTE: selecting linux-yocto to satisfy runtime kernel-module-xen-wdt due
> > to PREFERRED_PROVIDER_virtual/kernel = linux-yocto
> > ERROR: Nothing RPROVIDES 'xen-base' (but /opt/extras/meta-
> > virtualization/recipes-extended/images/xen-image-minimal.bb RDEPENDS on
> or
> > otherwise requires it)
> > NOTE: Runtime target 'xen-base' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['xen-base']
> > NOTE: Target 'xen-image-minimal' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['xen-image-minimal', 'xen-
> > base']
> > ERROR: Required build target 'xen-image-minimal' has no buildable
> > providers.
> > Missing or unbuildable dependency chain was: ['xen-image-minimal', 'xen-
> > base']
> >
> > Summary: There were 2 ERROR messages shown, returning a non-zero exit
> > code.
> >
> > Any insight as to why this is happening? What additional information is
> > needed to diagnose this error. I am very new to yocto and this is my
> first
> > attempt at building an image.
>
> Hi Rob,
>
> It looks like it can't resolve the provider for xen-base, which means it
> doesn't know how to build xen with your configuration.
>
> What machine/architecture are you building for? The current dizzy of
> meta-virtualization only supports xen on x86_64.
>
> Regards,
> Nathan
>



-- 

-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1.4.12 (GNU/Linux)

mQENBFKEwSUBCADi6r/xXH0QTgLbPg2EIQD86M+5w1PekvnLLxfUEficcvlTNrLW
bBsGVCdksAymJdHuuLrrujnoQrd5REoTq7R6IZHFZ5SS7eRkfrG4eFImRoXmHHRq
71DPdZnlALoUXUS9lb1pY4AbMaF51pduGigGUrVSHaAH2aLQMz2k9C+Cox5QLghm
9M0vhwGXviJ2PEZZ2nc03YT2PTwqQQHYJI9rLRJQXOpl9nUZn4zLDJg9H8nkhm4b
8yj3MRW1FVfW1KqnCuRBnwKuXVmeaJ0aA0ZnXy4xb7sT7Gw92K2a6QJzFviCJfx4
jAGB6wuRF9wFI2GswposLN4514FzyNSb+3BnABEBAAG0I1JvYmVydCBKIFdlaXNz
IDxqMTA1LnJvYkBnbWFpbC5jb20+iQE4BBMBAgAiBQJShMElAhsDBgsJCAcDAgYV
CAIJCgsEFgIDAQIeAQIXgAAKCRA7Vynrc6yHx2yyCACfv7iBr49MvbXMlkgeXk3T
vsJGXhXS7ZuwjaGLY1jGRMgj9ir1gS3D8qJzcjNhofW52Kn2TWhPbh7ed9xpuDQp
zk75Nw/TNT2FBerKF7d2s/v3qhpUUod72q7rTHBA3EMYDfUa+XsxfmI3TybOJn1N
aSNS/7LyNqaJY1Mh+SbhmBppVZQJmmGAcq3g4WmDo9WXvL11nKEwHp5eVzH7u6E1
HszjKTu26s+Vtre0dE2lq2EaatK88t+5aE8kQtTQ9oyTyeVikrJ40nqajRbZqAOH
1Kh0EWOrJvzjloeC33UPIqS7ITIBtDpzzQgjmh4KjLQhjYgg6abxOgbjmrDXif4H
uQENBFKEwSUBCADqgJH5/im2YwGUxF8Hf2RF8Wd3G6tQHEIVl5DIsT6OAcL2/aLD
J1V2gGkPzXltvf8sRWa8IdHoqLpe0RDEzxpjjP26BTq2UoQu1Hn44W19QM93EaFP
M7vdQLWClmGzxNC2/Jw7nszm92QpxP/RWvWXJDxsa8cjrJCHBzQj74hMeMMCmK2O
rCAUlH3q1iI9KAQAz6r+aIsQuaeXSNT5N7La4pBidooV8LxLI/zyPMJ42x4uSNbD
2KEpFrs6lYPiJDTcv2e8ZqTdbqR9JS6KopvJQzf31MfGZENZB6MqEjH92FQMtjl3
Psx6PUhZlsOXBQkcexh4AYalolSYdgQU4lBTABEBAAGJAR8EGAECAAkFAlKEwSUC
GwwACgkQO1cp63Osh8eQNwf+OTc1mOBCFUhdlMK1JCDFsBdFPmPICy3e/ZKSXgZu
Ti9ywcIJrAmyjx6TPXLzoSB6VH+Qouq+dYlYCnm9rn2ljl8Ek0q0lCDAJKrVfIjy
zErWLwkSFBaAg2BrmiQnDxrKV1ba1eubf8WJz7fDh9RX0NZwBjz+8BHoOiCz2iBD
onFBrt0/v9D/aIiiTOSzKTNnipmPKldDVsseh02F3jTogUXcDoPFKD6terrF5mgD
SHa5uGDy9MixlsVxptUTOyonFt8UKU6XCBvFCGUc4o6kT1IOPybqNxa/+b0LpEE0
x6KyVLpc5VDkkhby/MI/lEnt7qPEct37NYBbaSf8348gKQ==
=L0yr
-----END PGP PUBLIC KEY BLOCK-----

--089e0160b8d6ab1d55050ee30d8e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:12.8000001907349px">That was the =
issue and has now been corrected. Now I am getting the following error:</sp=
an><div style=3D"font-size:12.8000001907349px"><br></div><div style=3D"font=
-size:12.8000001907349px"><div>ubuntu@yocto:/opt/rob/poky/build$ bitbake xe=
n-image-minimal</div><div>Parsing recipes: 100% |##########################=
###########################################################################=
###########################################################################=
########################| Time: 00:00:08</div><div>Parsing of 1588 .bb file=
s complete (0 cached, 1588 parsed). 2073 targets, 69 skipped, 0 masked, 0 e=
rrors.</div><span class=3D"im"><div>NOTE: Resolving any missing task queue =
dependencies</div><div><br></div></span><div>Build Configuration:</div><div=
>BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.24.0&quot;</div><div>BUI=
LD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&quot;</div><div>N=
ATIVELSBSTRING =C2=A0 =3D &quot;Ubuntu-14.04&quot;</div><div>TARGET_SYS =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-poky-linux&quot;</div><div>MACHINE=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;genericx86-64&quot;</div><div=
>DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;poky-selinux&quo=
t;</div><div>DISTRO_VERSION =C2=A0 =C2=A0=3D &quot;1.7.1&quot;</div><div>TU=
NE_FEATURES =C2=A0 =C2=A0 =3D &quot;m64 core2&quot;</div><div>TARGET_FPU =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;&quot;</div><div>meta =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</div><div>meta-yocto =C2=A0 =C2=A0 =C2=
=A0 =C2=A0</div><div>meta-yocto-bsp =C2=A0 =C2=A0=3D &quot;dizzy:9fc095a439=
c36014c73b3a8f240afba09fe0e4d7&quot;</div><div>meta-virtualization =3D &quo=
t;dizzy:b0745517d1d8f4b6b51bc1256344cf1db7001a53&quot;</div><div>meta-oe =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>meta-networking =C2=A0=
=C2=A0</div><div>meta-filesystems =C2=A0</div><div>meta-python =C2=A0 =C2=
=A0 =C2=A0 =3D &quot;dizzy:6413cdb66acf43059f94d0076ec9b8ad6a475b35&quot;</=
div><div>meta-selinux =C2=A0 =C2=A0 =C2=A0=3D &quot;dizzy:869aded23e5f999c4=
f6b3ecf0562ea9da4862c73&quot;</div><div><br></div><div>NOTE: Preparing runq=
ueue</div><div>NOTE: Executing SetScene Tasks</div><div>NOTE: Executing Run=
Queue Tasks</div><div>WARNING: Debian package install does not support BAD_=
RECOMMENDATIONS</div><div>ERROR: Function failed: do_configure (log file is=
 located at /opt/rob/poky/build/tmp/work/core2-64-poky-linux/xen/4.3.1-r0/t=
emp/log.do_configure.8101)</div><div>ERROR: Logfile of failure stored in: /=
opt/rob/poky/build/tmp/work/core2-64-poky-linux/xen/4.3.1-r0/temp/log.do_co=
nfigure.8101</div><div>Log data follows:</div><div>| DEBUG: Executing pytho=
n function sysroot_cleansstate</div><div>| DEBUG: Python function sysroot_c=
leansstate finished</div><div>| DEBUG: SITE files [&#39;endian-little&#39;,=
 &#39;common-linux&#39;, &#39;common-glibc&#39;, &#39;bit-64&#39;, &#39;x86=
_64-linux&#39;, &#39;common&#39;]</div><div>| DEBUG: Executing shell functi=
on autotools_preconfigure</div><div>| DEBUG: Shell function autotools_preco=
nfigure finished</div><div>| DEBUG: Executing python function autotools_cop=
y_aclocals</div><div>| DEBUG: Python function autotools_copy_aclocals finis=
hed</div><div>| DEBUG: Executing shell function do_configure</div><div>| NO=
TE: Running /opt/rob/poky/build/tmp/work/core2-64-poky-linux/xen/4.3.1-r0/x=
en-4.3.1/configure =C2=A0--build=3Dx86_64-linux=C2=A0<span style=3D"white-s=
pace:pre-wrap">		</span>=C2=A0=C2=A0--host=3Dx86_64-poky-linux=C2=A0<span s=
tyle=3D"white-space:pre-wrap">		</span>=C2=A0=C2=A0--target=3Dx86_64-poky-l=
inux=C2=A0<span style=3D"white-space:pre-wrap">		</span>=C2=A0=C2=A0--prefi=
x=3D/usr=C2=A0<span style=3D"white-space:pre-wrap">	</span>=C2=A0=C2=A0--ex=
ec_prefix=3D/usr=C2=A0<span style=3D"white-space:pre-wrap">		</span>=C2=A0=
=C2=A0--bindir=3D/usr/bin=C2=A0<span style=3D"white-space:pre-wrap">		</spa=
n>=C2=A0=C2=A0--sbindir=3D/usr/sbin=C2=A0<span style=3D"white-space:pre-wra=
p">		</span>=C2=A0=C2=A0--libexecdir=3D/usr/lib/xen=C2=A0<span style=3D"whi=
te-space:pre-wrap">		</span>=C2=A0=C2=A0--datadir=3D/usr/share=C2=A0<span s=
tyle=3D"white-space:pre-wrap">		</span>=C2=A0=C2=A0--sysconfdir=3D/etc=C2=
=A0<span style=3D"white-space:pre-wrap">		</span>=C2=A0=C2=A0--sharedstated=
ir=3D/com=C2=A0<span style=3D"white-space:pre-wrap">		</span>=C2=A0=C2=A0--=
localstatedir=3D/var=C2=A0<span style=3D"white-space:pre-wrap">		</span>=C2=
=A0=C2=A0--libdir=3D/usr/lib=C2=A0<span style=3D"white-space:pre-wrap">		</=
span>=C2=A0=C2=A0--includedir=3D/usr/include=C2=A0<span style=3D"white-spac=
e:pre-wrap">		</span>=C2=A0=C2=A0--oldincludedir=3D/usr/include=C2=A0<span =
style=3D"white-space:pre-wrap">		</span>=C2=A0=C2=A0--infodir=3D/usr/share/=
info=C2=A0<span style=3D"white-space:pre-wrap">		</span>=C2=A0=C2=A0--mandi=
r=3D/usr/share/man=C2=A0<span style=3D"white-space:pre-wrap">		</span>=C2=
=A0=C2=A0--disable-silent-rules=C2=A0<span style=3D"white-space:pre-wrap">	=
	</span>=C2=A0=C2=A0--disable-dependency-tracking=C2=A0<span style=3D"white=
-space:pre-wrap">		</span>=C2=A0=C2=A0--with-libtool-sysroot=3D/opt/rob/pok=
y/build/tmp/sysroots/genericx86-64 =C2=A0 =C2=A0 =C2=A0 --exec-prefix=3D/us=
r =C2=A0 =C2=A0 --prefix=3D/usr =C2=A0 =C2=A0 --host=3Dx86_64-poky-linux =
=C2=A0 =C2=A0 --disable-stubdom =C2=A0 =C2=A0 --disable-ioemu-stubdom =C2=
=A0 =C2=A0 --disable-pv-grub =C2=A0 =C2=A0 --disable-xenstore-stubdom =C2=
=A0--enable-nls --enable-sdl --disable-xsmpolicy</div><div>| checking build=
 system type... x86_64-pc-linux-gnu</div><div>| checking host system type..=
. x86_64-poky-linux-gnu</div><div>| Will build the following subsystems:</d=
iv><div>| =C2=A0 xen</div><div>| =C2=A0 kernels</div><div>| =C2=A0 tools</d=
iv><div>| =C2=A0 docs</div><div>| configure: creating ./config.status</div>=
<div>| config.status: creating ./config/Toplevel.mk</div><div>| make: Enter=
ing directory `/opt/rob/poky/build/tmp/work/core2-64-poky-linux/xen/4.3.1-r=
0/xen-4.3.1/tools/firmware&#39;</div><div>| /opt/rob/poky/build/tmp/work/co=
re2-64-poky-linux/xen/4.3.1-r0/xen-4.3.1/tools/firmware/../../tools/Rules.m=
k:112: *** You have to run ./configure before building or installing the to=
ols.=C2=A0 Stop.</div><div>| make: Leaving directory `/opt/rob/poky/build/t=
mp/work/core2-64-poky-linux/xen/4.3.1-r0/xen-4.3.1/tools/firmware&#39;</div=
><div>| WARNING: exit code 2 from a shell command.</div><div>| ERROR: Funct=
ion failed: do_configure (log file is located at /opt/rob/poky/build/tmp/wo=
rk/core2-64-poky-linux/xen/4.3.1-r0/temp/log.do_configure.8101)</div><div>E=
RROR: Task 332 (/opt/extras/meta-virtualization/recipes-extended/xen/<a hre=
f=3D"http://xen_4.3.1.bb/" target=3D"_blank">xen_4.3.1.bb</a>, do_configure=
) failed with exit code &#39;1&#39;</div><div>NOTE: Tasks Summary: Attempte=
d 2900 tasks of which 2644 didn&#39;t need to be rerun and 1 failed.</div><=
div>Waiting for 0 running tasks to finish:</div><div><br></div><div>Summary=
: 1 task failed:</div><div>=C2=A0 /opt/extras/meta-virtualization/recipes-e=
xtended/xen/<a href=3D"http://xen_4.3.1.bb/" target=3D"_blank">xen_4.3.1.bb=
</a>, do_configure</div><div>Summary: There was 1 WARNING message shown.</d=
iv><div>Summary: There was 1 ERROR message shown, returning a non-zero exit=
 code.</div></div><div style=3D"font-size:12.8000001907349px"><br></div><di=
v style=3D"font-size:12.8000001907349px"><br></div><div style=3D"font-size:=
12.8000001907349px"><br></div><div style=3D"font-size:12.8000001907349px">A=
ny ideas how to proceed to resolve this error? I am not modifying anything =
in any layer at this point, just pulling the sources and trying to build ex=
isting supplied images.</div></div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On Wed, Feb 11, 2015 at 7:29 PM, Nathan Rossi <span dir=
=3D"ltr">&lt;<a href=3D"mailto:nathan.rossi@xilinx.com" target=3D"_blank">n=
athan.rossi@xilinx.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div class=3D"HOEnZb"><div class=3D"h5">&gt; -----Original Message-----=
<br>
&gt; From: <a href=3D"mailto:meta-virtualization-bounces@yoctoproject.org">=
meta-virtualization-bounces@yoctoproject.org</a> [mailto:<a href=3D"mailto:=
meta-">meta-</a><br>
&gt; <a href=3D"mailto:virtualization-bounces@yoctoproject.org">virtualizat=
ion-bounces@yoctoproject.org</a>] On Behalf Of Rob Weiss<br>
&gt; Sent: Thursday, February 12, 2015 12:35 AM<br>
&gt; To: <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtu=
alization@yoctoproject.org</a><br>
&gt; Subject: [meta-virtualization] Building xen-image-minimal problem<br>
&gt;<br>
&gt; I am trying to build xen-image-minimal using poky dizzy and I am getti=
ng<br>
&gt; the follow error:<br>
&gt;<br>
&gt; ubuntu@yocto:/opt/rob/poky/build$ bitbake -v xen-image-minimal<br>
&gt; Loading cache: 100%<br>
&gt; |#####################################################################=
####<br>
&gt; ######################################################################=
####<br>
&gt; #######################################################| ETA:=C2=A0 00=
:00:00<br>
&gt; Loaded 2074 entries from dependency cache.<br>
&gt; NOTE: Resolving any missing task queue dependencies<br>
&gt; NOTE: selecting pigz-native to satisfy gzip-native due to<br>
&gt; PREFERRED_PROVIDERS<br>
&gt; NOTE: selecting pseudo-native to satisfy virtual/fakeroot-native due t=
o<br>
&gt; PREFERRED_PROVIDERS<br>
&gt; NOTE: selecting linux-yocto to satisfy virtual/kernel due to<br>
&gt; PREFERRED_PROVIDERS<br>
&gt; NOTE: selecting opkg-utils-native to satisfy virtual/update-alternativ=
es-<br>
&gt; native due to PREFERRED_PROVIDERS<br>
&gt; NOTE: selecting linux-yocto to satisfy runtime kernel-module-xen-acpi-=
<br>
&gt; processor due to PREFERRED_PROVIDER_virtual/kernel =3D linux-yocto<br>
&gt; NOTE: selecting linux-yocto to satisfy runtime kernel-module-xen-blkba=
ck<br>
&gt; due to PREFERRED_PROVIDER_virtual/kernel =3D linux-yocto<br>
&gt; NOTE: selecting linux-yocto to satisfy runtime kernel-module-xen-gntal=
loc<br>
&gt; due to PREFERRED_PROVIDER_virtual/kernel =3D linux-yocto<br>
&gt; NOTE: selecting linux-yocto to satisfy runtime kernel-module-xen-gntde=
v<br>
&gt; due to PREFERRED_PROVIDER_virtual/kernel =3D linux-yocto<br>
&gt; NOTE: selecting linux-yocto to satisfy runtime kernel-module-xen-netba=
ck<br>
&gt; due to PREFERRED_PROVIDER_virtual/kernel =3D linux-yocto<br>
&gt; NOTE: selecting linux-yocto to satisfy runtime kernel-module-xen-pciba=
ck<br>
&gt; due to PREFERRED_PROVIDER_virtual/kernel =3D linux-yocto<br>
&gt; NOTE: selecting linux-yocto to satisfy runtime kernel-module-xen-wdt d=
ue<br>
&gt; to PREFERRED_PROVIDER_virtual/kernel =3D linux-yocto<br>
&gt; ERROR: Nothing RPROVIDES &#39;xen-base&#39; (but /opt/extras/meta-<br>
&gt; virtualization/recipes-extended/images/<a href=3D"http://xen-image-min=
imal.bb" target=3D"_blank">xen-image-minimal.bb</a> RDEPENDS on or<br>
&gt; otherwise requires it)<br>
&gt; NOTE: Runtime target &#39;xen-base&#39; is unbuildable, removing...<br=
>
&gt; Missing or unbuildable dependency chain was: [&#39;xen-base&#39;]<br>
&gt; NOTE: Target &#39;xen-image-minimal&#39; is unbuildable, removing...<b=
r>
&gt; Missing or unbuildable dependency chain was: [&#39;xen-image-minimal&#=
39;, &#39;xen-<br>
&gt; base&#39;]<br>
&gt; ERROR: Required build target &#39;xen-image-minimal&#39; has no builda=
ble<br>
&gt; providers.<br>
&gt; Missing or unbuildable dependency chain was: [&#39;xen-image-minimal&#=
39;, &#39;xen-<br>
&gt; base&#39;]<br>
&gt;<br>
&gt; Summary: There were 2 ERROR messages shown, returning a non-zero exit<=
br>
&gt; code.<br>
&gt;<br>
&gt; Any insight as to why this is happening? What additional information i=
s<br>
&gt; needed to diagnose this error. I am very new to yocto and this is my f=
irst<br>
&gt; attempt at building an image.<br>
<br>
</div></div>Hi Rob,<br>
<br>
It looks like it can&#39;t resolve the provider for xen-base, which means i=
t doesn&#39;t know how to build xen with your configuration.<br>
<br>
What machine/architecture are you building for? The current dizzy of meta-v=
irtualization only supports xen on x86_64.<br>
<br>
Regards,<br>
Nathan<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature"><div dir=3D"ltr"><div><br></div><div>-----BEGIN PGP PU=
BLIC KEY BLOCK-----</div><div>Version: GnuPG v1.4.12 (GNU/Linux)</div><div>=
<br></div><div>mQENBFKEwSUBCADi6r/xXH0QTgLbPg2EIQD86M+5w1PekvnLLxfUEficcvlT=
NrLW</div><div>bBsGVCdksAymJdHuuLrrujnoQrd5REoTq7R6IZHFZ5SS7eRkfrG4eFImRoXm=
HHRq</div><div>71DPdZnlALoUXUS9lb1pY4AbMaF51pduGigGUrVSHaAH2aLQMz2k9C+Cox5Q=
Lghm</div><div>9M0vhwGXviJ2PEZZ2nc03YT2PTwqQQHYJI9rLRJQXOpl9nUZn4zLDJg9H8nk=
hm4b</div><div>8yj3MRW1FVfW1KqnCuRBnwKuXVmeaJ0aA0ZnXy4xb7sT7Gw92K2a6QJzFviC=
Jfx4</div><div>jAGB6wuRF9wFI2GswposLN4514FzyNSb+3BnABEBAAG0I1JvYmVydCBKIFdl=
aXNz</div><div>IDxqMTA1LnJvYkBnbWFpbC5jb20+iQE4BBMBAgAiBQJShMElAhsDBgsJCAcD=
AgYV</div><div>CAIJCgsEFgIDAQIeAQIXgAAKCRA7Vynrc6yHx2yyCACfv7iBr49MvbXMlkge=
Xk3T</div><div>vsJGXhXS7ZuwjaGLY1jGRMgj9ir1gS3D8qJzcjNhofW52Kn2TWhPbh7ed9xp=
uDQp</div><div>zk75Nw/TNT2FBerKF7d2s/v3qhpUUod72q7rTHBA3EMYDfUa+XsxfmI3TybO=
Jn1N</div><div>aSNS/7LyNqaJY1Mh+SbhmBppVZQJmmGAcq3g4WmDo9WXvL11nKEwHp5eVzH7=
u6E1</div><div>HszjKTu26s+Vtre0dE2lq2EaatK88t+5aE8kQtTQ9oyTyeVikrJ40nqajRbZ=
qAOH</div><div>1Kh0EWOrJvzjloeC33UPIqS7ITIBtDpzzQgjmh4KjLQhjYgg6abxOgbjmrDX=
if4H</div><div>uQENBFKEwSUBCADqgJH5/im2YwGUxF8Hf2RF8Wd3G6tQHEIVl5DIsT6OAcL2=
/aLD</div><div>J1V2gGkPzXltvf8sRWa8IdHoqLpe0RDEzxpjjP26BTq2UoQu1Hn44W19QM93=
EaFP</div><div>M7vdQLWClmGzxNC2/Jw7nszm92QpxP/RWvWXJDxsa8cjrJCHBzQj74hMeMMC=
mK2O</div><div>rCAUlH3q1iI9KAQAz6r+aIsQuaeXSNT5N7La4pBidooV8LxLI/zyPMJ42x4u=
SNbD</div><div>2KEpFrs6lYPiJDTcv2e8ZqTdbqR9JS6KopvJQzf31MfGZENZB6MqEjH92FQM=
tjl3</div><div>Psx6PUhZlsOXBQkcexh4AYalolSYdgQU4lBTABEBAAGJAR8EGAECAAkFAlKE=
wSUC</div><div>GwwACgkQO1cp63Osh8eQNwf+OTc1mOBCFUhdlMK1JCDFsBdFPmPICy3e/ZKS=
XgZu</div><div>Ti9ywcIJrAmyjx6TPXLzoSB6VH+Qouq+dYlYCnm9rn2ljl8Ek0q0lCDAJKrV=
fIjy</div><div>zErWLwkSFBaAg2BrmiQnDxrKV1ba1eubf8WJz7fDh9RX0NZwBjz+8BHoOiCz=
2iBD</div><div>onFBrt0/v9D/aIiiTOSzKTNnipmPKldDVsseh02F3jTogUXcDoPFKD6terrF=
5mgD</div><div>SHa5uGDy9MixlsVxptUTOyonFt8UKU6XCBvFCGUc4o6kT1IOPybqNxa/+b0L=
pEE0</div><div>x6KyVLpc5VDkkhby/MI/lEnt7qPEct37NYBbaSf8348gKQ=3D=3D</div><d=
iv>=3DL0yr</div><div>-----END PGP PUBLIC KEY BLOCK-----</div><div><br></div=
></div></div>
</div>

--089e0160b8d6ab1d55050ee30d8e--
