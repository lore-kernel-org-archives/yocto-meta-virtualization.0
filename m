Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.1002.1583538773359337005
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Mar 2020 15:52:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HlchpRiP;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id 6so4254172wmi.5
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Mar 2020 15:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=btgy6io9L/jT1CDDh5dl+IMDxzihtWzogK0zi8shm30=;
        b=HlchpRiP5dF6R9/iavTYfY/aG6sZfdQlw4FKWz2Yxcbo9MtOwRUAFxr/Vv1cij4ZmO
         O5d75oHvk2dqAINqmVtijkcZPVqt0HRGDfLPWNUMA6B4jZDrVIRBW6AEX9pbpwr9M5At
         tymQgkfJyxREr1pMVWbPv59y4ARERMYqzGLnyOrnXhK3lKcqJDLno6zX8l26kuD7Lu/e
         QeCZhTRj6Yl2FQa/gSnAi/E87Ph+9ZtlnzcTQJNVOIZZJSevsLkwD481OWdhbS2x8EvF
         Lka0wLCUSp7LzEp9PpFaowBoyC7vgNhVku2CE//esSvZJ+Ie29uY4//XxNYFe6XTkw2h
         0RVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=btgy6io9L/jT1CDDh5dl+IMDxzihtWzogK0zi8shm30=;
        b=sHgTQzP9ONgXiESuWHluyEPrCb/TMhq0H2J0PQl2kVIjsd+8JU8RsYn5UjNx37GCbn
         7pjAtXz0jdTCAT/W04kT+NONuFIPdlJVCzf+JwOOhBIPhf3S48nM8Ffx6MSTZX1XgtqX
         yJln2V9EB7iYElhHIjJhRbbXPfEoYx4M4RfIti78arZiE2IiHhrKFiFAvZnwvd32K0n3
         joB1oDWILTHiw5s9p9JS+KSwG+HNdL7mZEl1feA7cd++nzIzgL4i2xxIDDv4RWuzomg4
         3eE1KRpSuWr26didtLdZgEQFg+oFPufIjnu1xoDsefLU4NSAUasYu2vKqTja4UdYqFQE
         +r7Q==
X-Gm-Message-State: ANhLgQ0yCtC/GD2vWq70zuF7VSeYpA/fPQH4v4uXIF2ctM6jc921JnKt
	MXBNiFqbYS0Xr+1nzp/DspI=
X-Google-Smtp-Source: ADFU+vvSVuSYm1Udqi2SOAbqrptRMiGv4Wf2f5G1QNzm3tMb74hFPRR0B0ISa5A20o4JQpWyDg9G8w==
X-Received: by 2002:a7b:cb42:: with SMTP id v2mr6446371wmj.170.1583538771643;
        Fri, 06 Mar 2020 15:52:51 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z135sm15717575wmc.20.2020.03.06.15.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 15:52:50 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 7 Mar 2020 00:52:49 +0100
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 1/2] xen-tools: fix COMPATIBLE_HOST restriction for i686
Message-ID: <20200306235249.pj37vlyijfacq2mo@jama>
References: <15F8D09CD90CE2BE.3586@lists.yoctoproject.org>
 <20200304152958.vnvz4t66ln2xyijl@jama>
 <CACMJ4GYAEfbc1Qky1-2=yxqfSTjgbp1s6vfvvVgdK=yp8NETpw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACMJ4GYAEfbc1Qky1-2=yxqfSTjgbp1s6vfvvVgdK=yp8NETpw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Groupsio-MsgNum: 5202
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5pityzw33pmlpgvd"
Content-Disposition: inline

--5pityzw33pmlpgvd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2020 at 03:05:48PM -0800, Christopher Clark wrote:
> On Wed, Mar 4, 2020 at 7:30 AM Martin Jansa <Martin.Jansa@gmail.com> wrot=
e:
> >
> > On Tue, Mar 03, 2020 at 03:10:35PM +0100, Martin Jansa via Lists.Yoctop=
roject.Org wrote:
> > > * let TARGET_VENDOR to be set to something else than the default:
> > >   meta/conf/bitbake.conf:TARGET_VENDOR =3D "-oe"
> > >   like other architectures use
> > > ---
> > >  recipes-extended/xen/xen-tools.inc | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xe=
n/xen-tools.inc
> > > index 8bdbfec..8b86f7b 100644
> > > --- a/recipes-extended/xen/xen-tools.inc
> > > +++ b/recipes-extended/xen/xen-tools.inc
> > > @@ -1,7 +1,7 @@
> > >  SUMMARY =3D "Xen hypervisor tools"
> > >  DESCRIPTION =3D "Tools and utility software for the Xen hypervisor"
> > >
> > > -COMPATIBLE_HOST =3D 'i686-oe-linux|(x86_64.*).*-linux|aarch64.*-linu=
x|arm-.*-linux-gnueabi'
> > > +COMPATIBLE_HOST =3D 'i686-.*-linux|(x86_64.*).*-linux|aarch64.*-linu=
x|arm-.*-linux-gnueabi'
> > >
> > >  inherit setuptools3 update-rc.d systemd deploy
> > >  require xen-blktap.inc
> >
> > Not really caused by this change, but now when the build can be started
> > it fails for me with:
> > error: mapfile-GNU:1:9: invalid use of VERSION in input file
> > Makefile:52: recipe for target 'libxenfsimage.so.4.12.0' failed
> >
> > Anyone else seeing this? It's actually raspberrypi4 world build, so the
> > COMPATIBLE_HOST above isn't related at all in this case.
>=20
> Thanks for the report, Martin. My first pass at repro'ing this did not
> encounter this failure; but this is my first build with raspberrypi4
> MACHINE, so it's possible that my config is different in some way. Are
> you able to give any more guidance on your build configuration to
> reproduce this? (MACHINE, layers and branches, conf file settings -
> eg. enabling reproducible builds)

It's reproducible only with gold, so:
DISTRO_FEATURES_append =3D " ld-is-gold"
in your local.conf should be able to reproduce it for any MACHINE (I see
it with qemux86 as well).

Easiest work around would be to add -fuse-ld=3Dbfd when building xen-tools
if nobody is interested to fix it properly.

The issue is this file:
http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dtools/libfsimage/co=
mmon/mapfile-GNU;h=3D26d4d7a69ec7bbd0f7f5e48c61ea7eb61c32a2f6;hb=3DHEAD

BFD seems to accept slightly different format when the version script is
provided "as just another input file to the linker" mentioned in older
documentation:
https://ftp.gnu.org/old-gnu/Manuals/ld-2.9.1/html_node/ld_25.html
https://sourceware.org/binutils/docs/ld/VERSION.html

and when passed with --version-script, when bfd complains about the
syntax exactly like gold does:

with gold:
WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/git/tools/libfsimage/common=
$ arm-oe-linux-gnueabi-gcc  -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -=
mcpu=3Dcortex-a7  --sysroot=3D/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe=
-r0/recipe-sysroot                             -L../common/ -Wl,--version-s=
cript=3Dmapfile-GNU -pthread -Wl,-soname -Wl,libxenfsimage.so.4.12 -shared =
-o libxenfsimage.so.4.12.0 fsimage.opic fsimage_plugin.opic fsimage_grub.op=
ic
/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/recipe-sysroot-native/usr/=
bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linu=
x-gnueabi/9.2.0/ld: error: mapfile-GNU:2:20: syntax error, unexpected '{', =
expecting ';'
/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/recipe-sysroot-native/usr/=
bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linu=
x-gnueabi/9.2.0/ld: fatal error: unable to parse version script file mapfil=
e-GNU
collect2: error: ld returned 1 exit status

WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/git/tools/libfsimage/common=
$ arm-oe-linux-gnueabi-gcc  -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -=
mcpu=3Dcortex-a7  --sysroot=3D/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe=
-r0/recipe-sysroot                             -L../common/ -Wl,mapfile-GNU=
 -pthread -Wl,-soname -Wl,libxenfsimage.so.4.12 -shared -o libxenfsimage.so=
=2E4.12.0 fsimage.opic fsimage_plugin.opic fsimage_grub.opic
/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/recipe-sysroot-native/usr/=
bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linu=
x-gnueabi/9.2.0/ld: error: mapfile-GNU:1:9: invalid use of VERSION in input=
 file
collect2: error: ld returned 1 exit status

with -fuse-ld=3Dbfd:
WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/git/tools/libfsimage/common=
$ arm-oe-linux-gnueabi-gcc  -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -=
mcpu=3Dcortex-a7  --sysroot=3D/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe=
-r0/recipe-sysroot                             -L../common/ -Wl,mapfile-GNU=
 -pthread -Wl,-soname -Wl,libxenfsimage.so.4.12 -shared -o libxenfsimage.so=
=2E4.12.0 fsimage.opic fsimage_plugin.opic fsimage_grub.opic -fuse-ld=3Dbfd

WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/git/tools/libfsimage/common=
$ arm-oe-linux-gnueabi-gcc  -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -=
mcpu=3Dcortex-a7  --sysroot=3D/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe=
-r0/recipe-sysroot                             -L../common/ -Wl,--version-s=
cript=3Dmapfile-GNU -pthread -Wl,-soname -Wl,libxenfsimage.so.4.12 -shared =
-o libxenfsimage.so.4.12.0 fsimage.opic fsimage_plugin.opic fsimage_grub.op=
ic -fuse-ld=3Dbfd
/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/recipe-sysroot-native/usr/=
bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linu=
x-gnueabi/9.2.0/ld.bfd:mapfile-GNU:2: syntax error in VERSION script
collect2: error: ld returned 1 exit status

both bfd and gold will happily accept the mapfile-SunOS version of this fil=
e:
http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dtools/libfsimage/co=
mmon/mapfile-SunOS;h=3De99b90b65077f9e0e6082e7d2d1fa5aa55e3af7b;hb=3DHEAD
in --version-script param:

WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/git/tools/libfsimage/common=
$ arm-oe-linux-gnueabi-gcc  -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -=
mcpu=3Dcortex-a7  --sysroot=3D/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe=
-r0/recipe-sysroot                             -L../common/ -Wl,--version-s=
cript=3Dmapfile-SunOS -pthread -Wl,-soname -Wl,libxenfsimage.so.4.12 -share=
d -o libxenfsimage.so.4.12.0 fsimage.opic fsimage_plugin.opic fsimage_grub.=
opic
WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/git/tools/libfsimage/common=
$ arm-oe-linux-gnueabi-gcc  -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -=
mcpu=3Dcortex-a7  --sysroot=3D/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe=
-r0/recipe-sysroot                             -L../common/ -Wl,--version-s=
cript=3Dmapfile-SunOS -pthread -Wl,-soname -Wl,libxenfsimage.so.4.12 -share=
d -o libxenfsimage.so.4.12.0 fsimage.opic fsimage_plugin.opic fsimage_grub.=
opic -fuse-ld=3Dbfd

and both will fail without --version-script:
WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/git/tools/libfsimage/common=
$ arm-oe-linux-gnueabi-gcc  -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -=
mcpu=3Dcortex-a7  --sysroot=3D/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe=
-r0/recipe-sysroot                             -L../common/ -Wl,mapfile-Sun=
OS -pthread -Wl,-soname -Wl,libxenfsimage.so.4.12 -shared -o libxenfsimage.=
so.4.12.0 fsimage.opic fsimage_plugin.opic fsimage_grub.opic -fuse-ld=3Dbfd
/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/recipe-sysroot-native/usr/=
bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linu=
x-gnueabi/9.2.0/ld.bfd:mapfile-SunOS: file format not recognized; treating =
as linker script
/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/recipe-sysroot-native/usr/=
bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linu=
x-gnueabi/9.2.0/ld.bfd:mapfile-SunOS:1: syntax error
collect2: error: ld returned 1 exit status
WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/git/tools/libfsimage/common=
$ arm-oe-linux-gnueabi-gcc  -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -=
mcpu=3Dcortex-a7  --sysroot=3D/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe=
-r0/recipe-sysroot                             -L../common/ -Wl,mapfile-Sun=
OS -pthread -Wl,-soname -Wl,libxenfsimage.so.4.12 -shared -o libxenfsimage.=
so.4.12.0 fsimage.opic fsimage_plugin.opic fsimage_grub.opic
/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/recipe-sysroot-native/usr/=
bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linu=
x-gnueabi/9.2.0/ld: error: mapfile-SunOS:1:19: syntax error, unexpected '{'
/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/recipe-sysroot-native/usr/=
bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linu=
x-gnueabi/9.2.0/ld: error: mapfile-SunOS: not an object or archive
collect2: error: ld returned 1 exit status

Unfortunatelly this isn't the only issue with gold in xen-tools, for qemux8=
6-64 it still fails with:

x86_64-oe-linux-ld --sysroot=3D/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfb=
e-r0/recipe-sysroot                                     -melf_x86_64 -melf_=
x86_64        -melf_x86_64  -T xen.lds -N prelink.o --build-id=3Dsha1 \
    /WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/git/tools/firmware/xen=
-dir/xen-root/xen/common/symbols-dummy.o -o /WORKDIR/xen-tools/4.12+gitAUTO=
INC+a5fcafbfbe-r0/git/tools/firmware/xen-dir/xen-root/xen/.xen-syms.0
x86_64-oe-linux-ld: error: xen.lds:66:47: syntax error, unexpected '-', exp=
ecting ')'
x86_64-oe-linux-ld: fatal error: unable to parse script file xen.lds

Which is also reproducible only with gold and bfd is happy:
WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/git/tools/firmware/xen-dir/=
xen-root/xen/arch/x86$ x86_64-oe-linux-ld.bfd --sysroot=3D/WORKDIR/xen-tool=
s/4.12+gitAUTOINC+a5fcafbfbe-r0/recipe-sysroot                             =
        -melf_x86_64 -melf_x86_64        -melf_x86_64  -T xen.lds -N prelin=
k.o --build-id=3Dsha1 /WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/git/=
tools/firmware/xen-dir/xen-root/xen/common/symbols-dummy.o -o /WORKDIR/xen-=
tools/4.12+gitAUTOINC+a5fcafbfbe-r0/git/tools/firmware/xen-dir/xen-root/xen=
/.xen-syms.0

adding:
echo 'LDFLAGS +=3D "-fuse-ld=3Dbfd"' >> "${S}/tools/libfsimage/Rules.mk"
in xen-tools.inc:do_configure works for qemux86, but not for qemux86-64.

Feel free to improve it or fix it properly (but with linux kernel also prev=
enting to use gold now it might not be worth spending extra time on gold).

Cheers,

--5pityzw33pmlpgvd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXmLiUAAKCRA3VSO3ZXaA
HLKzAJ9DJTWAuTmbKvcZic3a27dM14aGxACfZnlET1yS2knd4k7w1QIul6OuCTM=
=oIfg
-----END PGP SIGNATURE-----

--5pityzw33pmlpgvd--
