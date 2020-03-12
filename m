Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web10.206.1583973370526701370
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Mar 2020 17:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ol45FrB+;
 spf=pass (domain: gmail.com, ip: 209.85.167.67, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-lf1-f67.google.com with SMTP id q9so3278396lfc.10
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Mar 2020 17:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Zetyl8wNIYSPaUtuh7w2GKK27gLJjn8M1a1eozyohqA=;
        b=ol45FrB+7oUtaEctecD02T4/OrRxgYnUEYxKNUrCU7ytYIZ6dQGm1H6eFmpaDF0BLK
         6nkxxnEeA0VUC8sU1zXscoHLHtxklvkQhfWKGYPWKPivEtBo+5xCtW0YGu5U4LAM4SUh
         /tqYGsFFNxfDk/vILDzpave0g595hCxI9rUicuzcHUhU9rxuJFqubXVHjb8cxGXKlm1Q
         t6jjN+3KwZMd0peiF/+5u/Ns3nopuTuq9Nu1y7KRunQzqh8zB1b9+cqCefio6QikNRRB
         0VurpJPUxavrlEvxO5N3mFBV73X2vK2Cy/UHI+gB8L7aGcMl/6TVN3AjzbSlOx2GEXBJ
         jUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Zetyl8wNIYSPaUtuh7w2GKK27gLJjn8M1a1eozyohqA=;
        b=Qhv7zsCh8kB+ZfDsMTU1iDH+OMB0aBlu3Tpo9aJG0QGdftIV0JpAb4y+FWHClFG+XC
         24cHYTOqLvtf7dhYkZ3+GjfakQlc73X4QyN89Ry1YkCheLaRnknFYDBujVh1VOep96vo
         nO6eCNu4jm5+5V67YtvT2Mj8+AmcSlmllCxYQeSxr2VhaGtsNngc+Rv50n8AvAfGW7X3
         5cM/1mnmpHTFcSn8zDGXFqJrWfDF2dy8QrTnB5YxwiZxlXC/mJ7/4yNpWHlEyejsmRpI
         gxCTI6YnJv7UE3Yg+e1L2NCyxIKIoPFnQHOwf7z4DZXX/6XUI/fZys1mE4rxggi+Us5X
         oV+g==
X-Gm-Message-State: ANhLgQ3w/6YMREBK/SAiZNSJbDZHAj3FWP0HKEUGsXN0eCA4UOrQqVH0
	m8KP8Pb3vWwBYg0zCYbVg3CrIKCEK2a9Tq6fhgE=
X-Google-Smtp-Source: ADFU+vuo3s9Zm3ssoqd3oj1ZfxwEZ7KSYZkrvgX//lcj87CBTXj9wn0+5VXIJ2Qe53b5Spak0D2qBMLvkWfuk5Kc2kg=
X-Received: by 2002:a19:6513:: with SMTP id z19mr3628065lfb.207.1583973368471;
 Wed, 11 Mar 2020 17:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <15F8D09CD90CE2BE.3586@lists.yoctoproject.org> <20200304152958.vnvz4t66ln2xyijl@jama>
 <CACMJ4GYAEfbc1Qky1-2=yxqfSTjgbp1s6vfvvVgdK=yp8NETpw@mail.gmail.com> <20200306235249.pj37vlyijfacq2mo@jama>
In-Reply-To: <20200306235249.pj37vlyijfacq2mo@jama>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Wed, 11 Mar 2020 17:35:57 -0700
Message-ID: <CACMJ4Gaj8YcOBRMuyXWrxDg9eT7ENJqtFFezBofspn1+mkdtRw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/2] xen-tools: fix COMPATIBLE_HOST restriction for i686
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2020 at 3:52 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Wed, Mar 04, 2020 at 03:05:48PM -0800, Christopher Clark wrote:
> > On Wed, Mar 4, 2020 at 7:30 AM Martin Jansa <Martin.Jansa@gmail.com> wr=
ote:
> > >
> > > On Tue, Mar 03, 2020 at 03:10:35PM +0100, Martin Jansa via Lists.Yoct=
oproject.Org wrote:
> > > > * let TARGET_VENDOR to be set to something else than the default:
> > > >   meta/conf/bitbake.conf:TARGET_VENDOR =3D "-oe"
> > > >   like other architectures use
> > > > ---
> > > >  recipes-extended/xen/xen-tools.inc | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/=
xen/xen-tools.inc
> > > > index 8bdbfec..8b86f7b 100644
> > > > --- a/recipes-extended/xen/xen-tools.inc
> > > > +++ b/recipes-extended/xen/xen-tools.inc
> > > > @@ -1,7 +1,7 @@
> > > >  SUMMARY =3D "Xen hypervisor tools"
> > > >  DESCRIPTION =3D "Tools and utility software for the Xen hypervisor=
"
> > > >
> > > > -COMPATIBLE_HOST =3D 'i686-oe-linux|(x86_64.*).*-linux|aarch64.*-li=
nux|arm-.*-linux-gnueabi'
> > > > +COMPATIBLE_HOST =3D 'i686-.*-linux|(x86_64.*).*-linux|aarch64.*-li=
nux|arm-.*-linux-gnueabi'
> > > >
> > > >  inherit setuptools3 update-rc.d systemd deploy
> > > >  require xen-blktap.inc
> > >
> > > Not really caused by this change, but now when the build can be start=
ed
> > > it fails for me with:
> > > error: mapfile-GNU:1:9: invalid use of VERSION in input file
> > > Makefile:52: recipe for target 'libxenfsimage.so.4.12.0' failed
> > >
> > > Anyone else seeing this? It's actually raspberrypi4 world build, so t=
he
> > > COMPATIBLE_HOST above isn't related at all in this case.
> >
> > Thanks for the report, Martin. My first pass at repro'ing this did not
> > encounter this failure; but this is my first build with raspberrypi4
> > MACHINE, so it's possible that my config is different in some way. Are
> > you able to give any more guidance on your build configuration to
> > reproduce this? (MACHINE, layers and branches, conf file settings -
> > eg. enabling reproducible builds)
>
> It's reproducible only with gold, so:
> DISTRO_FEATURES_append =3D " ld-is-gold"
> in your local.conf should be able to reproduce it for any MACHINE (I see
> it with qemux86 as well).
>
> Easiest work around would be to add -fuse-ld=3Dbfd when building xen-tool=
s
> if nobody is interested to fix it properly.
>
> The issue is this file:
> http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dtools/libfsimage/=
common/mapfile-GNU;h=3D26d4d7a69ec7bbd0f7f5e48c61ea7eb61c32a2f6;hb=3DHEAD
>
> BFD seems to accept slightly different format when the version script is
> provided "as just another input file to the linker" mentioned in older
> documentation:
> https://ftp.gnu.org/old-gnu/Manuals/ld-2.9.1/html_node/ld_25.html
> https://sourceware.org/binutils/docs/ld/VERSION.html
>
> and when passed with --version-script, when bfd complains about the
> syntax exactly like gold does:
>
> with gold:
> WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/git/tools/libfsimage/comm=
on$ arm-oe-linux-gnueabi-gcc  -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard=
 -mcpu=3Dcortex-a7  --sysroot=3D/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbf=
be-r0/recipe-sysroot                             -L../common/ -Wl,--version=
-script=3Dmapfile-GNU -pthread -Wl,-soname -Wl,libxenfsimage.so.4.12 -share=
d -o libxenfsimage.so.4.12.0 fsimage.opic fsimage_plugin.opic fsimage_grub.=
opic
> /WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/recipe-sysroot-native/us=
r/bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-li=
nux-gnueabi/9.2.0/ld: error: mapfile-GNU:2:20: syntax error, unexpected '{'=
, expecting ';'
> /WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/recipe-sysroot-native/us=
r/bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-li=
nux-gnueabi/9.2.0/ld: fatal error: unable to parse version script file mapf=
ile-GNU
> collect2: error: ld returned 1 exit status
>
> WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/git/tools/libfsimage/comm=
on$ arm-oe-linux-gnueabi-gcc  -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard=
 -mcpu=3Dcortex-a7  --sysroot=3D/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbf=
be-r0/recipe-sysroot                             -L../common/ -Wl,mapfile-G=
NU -pthread -Wl,-soname -Wl,libxenfsimage.so.4.12 -shared -o libxenfsimage.=
so.4.12.0 fsimage.opic fsimage_plugin.opic fsimage_grub.opic
> /WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/recipe-sysroot-native/us=
r/bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-li=
nux-gnueabi/9.2.0/ld: error: mapfile-GNU:1:9: invalid use of VERSION in inp=
ut file
> collect2: error: ld returned 1 exit status
>
> with -fuse-ld=3Dbfd:
> WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/git/tools/libfsimage/comm=
on$ arm-oe-linux-gnueabi-gcc  -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard=
 -mcpu=3Dcortex-a7  --sysroot=3D/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbf=
be-r0/recipe-sysroot                             -L../common/ -Wl,mapfile-G=
NU -pthread -Wl,-soname -Wl,libxenfsimage.so.4.12 -shared -o libxenfsimage.=
so.4.12.0 fsimage.opic fsimage_plugin.opic fsimage_grub.opic -fuse-ld=3Dbfd
>
> WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/git/tools/libfsimage/comm=
on$ arm-oe-linux-gnueabi-gcc  -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard=
 -mcpu=3Dcortex-a7  --sysroot=3D/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbf=
be-r0/recipe-sysroot                             -L../common/ -Wl,--version=
-script=3Dmapfile-GNU -pthread -Wl,-soname -Wl,libxenfsimage.so.4.12 -share=
d -o libxenfsimage.so.4.12.0 fsimage.opic fsimage_plugin.opic fsimage_grub.=
opic -fuse-ld=3Dbfd
> /WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/recipe-sysroot-native/us=
r/bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-li=
nux-gnueabi/9.2.0/ld.bfd:mapfile-GNU:2: syntax error in VERSION script
> collect2: error: ld returned 1 exit status
>
> both bfd and gold will happily accept the mapfile-SunOS version of this f=
ile:
> http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dtools/libfsimage/=
common/mapfile-SunOS;h=3De99b90b65077f9e0e6082e7d2d1fa5aa55e3af7b;hb=3DHEAD
> in --version-script param:
>
> WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/git/tools/libfsimage/comm=
on$ arm-oe-linux-gnueabi-gcc  -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard=
 -mcpu=3Dcortex-a7  --sysroot=3D/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbf=
be-r0/recipe-sysroot                             -L../common/ -Wl,--version=
-script=3Dmapfile-SunOS -pthread -Wl,-soname -Wl,libxenfsimage.so.4.12 -sha=
red -o libxenfsimage.so.4.12.0 fsimage.opic fsimage_plugin.opic fsimage_gru=
b.opic
> WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/git/tools/libfsimage/comm=
on$ arm-oe-linux-gnueabi-gcc  -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard=
 -mcpu=3Dcortex-a7  --sysroot=3D/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbf=
be-r0/recipe-sysroot                             -L../common/ -Wl,--version=
-script=3Dmapfile-SunOS -pthread -Wl,-soname -Wl,libxenfsimage.so.4.12 -sha=
red -o libxenfsimage.so.4.12.0 fsimage.opic fsimage_plugin.opic fsimage_gru=
b.opic -fuse-ld=3Dbfd
>
> and both will fail without --version-script:
> WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/git/tools/libfsimage/comm=
on$ arm-oe-linux-gnueabi-gcc  -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard=
 -mcpu=3Dcortex-a7  --sysroot=3D/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbf=
be-r0/recipe-sysroot                             -L../common/ -Wl,mapfile-S=
unOS -pthread -Wl,-soname -Wl,libxenfsimage.so.4.12 -shared -o libxenfsimag=
e.so.4.12.0 fsimage.opic fsimage_plugin.opic fsimage_grub.opic -fuse-ld=3Db=
fd
> /WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/recipe-sysroot-native/us=
r/bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-li=
nux-gnueabi/9.2.0/ld.bfd:mapfile-SunOS: file format not recognized; treatin=
g as linker script
> /WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/recipe-sysroot-native/us=
r/bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-li=
nux-gnueabi/9.2.0/ld.bfd:mapfile-SunOS:1: syntax error
> collect2: error: ld returned 1 exit status
> WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/git/tools/libfsimage/comm=
on$ arm-oe-linux-gnueabi-gcc  -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard=
 -mcpu=3Dcortex-a7  --sysroot=3D/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbf=
be-r0/recipe-sysroot                             -L../common/ -Wl,mapfile-S=
unOS -pthread -Wl,-soname -Wl,libxenfsimage.so.4.12 -shared -o libxenfsimag=
e.so.4.12.0 fsimage.opic fsimage_plugin.opic fsimage_grub.opic
> /WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/recipe-sysroot-native/us=
r/bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-li=
nux-gnueabi/9.2.0/ld: error: mapfile-SunOS:1:19: syntax error, unexpected '=
{'
> /WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/recipe-sysroot-native/us=
r/bin/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-li=
nux-gnueabi/9.2.0/ld: error: mapfile-SunOS: not an object or archive
> collect2: error: ld returned 1 exit status
>
> Unfortunatelly this isn't the only issue with gold in xen-tools, for qemu=
x86-64 it still fails with:
>
> x86_64-oe-linux-ld --sysroot=3D/WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafb=
fbe-r0/recipe-sysroot                                     -melf_x86_64 -mel=
f_x86_64        -melf_x86_64  -T xen.lds -N prelink.o --build-id=3Dsha1 \
>     /WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/git/tools/firmware/x=
en-dir/xen-root/xen/common/symbols-dummy.o -o /WORKDIR/xen-tools/4.12+gitAU=
TOINC+a5fcafbfbe-r0/git/tools/firmware/xen-dir/xen-root/xen/.xen-syms.0
> x86_64-oe-linux-ld: error: xen.lds:66:47: syntax error, unexpected '-', e=
xpecting ')'
> x86_64-oe-linux-ld: fatal error: unable to parse script file xen.lds
>
> Which is also reproducible only with gold and bfd is happy:
> WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/git/tools/firmware/xen-di=
r/xen-root/xen/arch/x86$ x86_64-oe-linux-ld.bfd --sysroot=3D/WORKDIR/xen-to=
ols/4.12+gitAUTOINC+a5fcafbfbe-r0/recipe-sysroot                           =
          -melf_x86_64 -melf_x86_64        -melf_x86_64  -T xen.lds -N prel=
ink.o --build-id=3Dsha1 /WORKDIR/xen-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/gi=
t/tools/firmware/xen-dir/xen-root/xen/common/symbols-dummy.o -o /WORKDIR/xe=
n-tools/4.12+gitAUTOINC+a5fcafbfbe-r0/git/tools/firmware/xen-dir/xen-root/x=
en/.xen-syms.0
>
> adding:
> echo 'LDFLAGS +=3D "-fuse-ld=3Dbfd"' >> "${S}/tools/libfsimage/Rules.mk"
> in xen-tools.inc:do_configure works for qemux86, but not for qemux86-64.
>
> Feel free to improve it or fix it properly (but with linux kernel also pr=
eventing to use gold now it might not be worth spending extra time on gold)=
.

Thanks for the extended details on this. I am interested in pursuing
the full fix but am unclear on my timing for being able to get to it,
so will be looking at your suggestions for the more expedient
workarounds first.

Christopher
