Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web08.8889.1620999722862104183
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 May 2021 06:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R+H02OLH;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id u21so44685354ejo.13
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 14 May 2021 06:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ExPEY+7xd37nVMXG64itxDdGeOVDHjjr/pnthXWVSok=;
        b=R+H02OLHZHag/c8rj84HYOc/Z5Vfv74yMClBCg+poWrxhszSom0iRJAW1Mc/71MPAA
         4j7EX9vCy4edcQNynW3lze3JtdcQVvfIewU6hjvB78HcH0xVNCgoiNUN4mWDCeJO8uY3
         45LNyuTSlOcY9EyZRhPV84UvT9qUtyc7jpu+9fgwkjL7jrKbfGixv4iQKKYiWlQrhGQY
         DvO1390ZQIlPLwHNSZR4InzVZyivjEd0P1DmLIK/wJiLN4dkW6G/7ncaWPRY/JDSWr1B
         v16i+WGn44mfIq4Qx0jJy+1x7OtMgMpXyFzdH9j9xJP9Y38LYAQnlYAmTWrm45I2zsEf
         96/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ExPEY+7xd37nVMXG64itxDdGeOVDHjjr/pnthXWVSok=;
        b=mA+j4qIW5RAcIiCbcELkikE9gsV6m3QgTPenmwT7BlAcHsMyom16+5zQh3KiLYLbti
         m/qf5giYs3JdQ1R3YZglJPKrPOA4uhoceL4A7Zc9b0oQ4hXy7LhUrLdAKbD0nHUaY51R
         6ttQKinE3SgRBaSJnqz7sV7y2tOY8bmQvlDB0DkChrmydoGF23D74gnma18BQoUY3TE2
         ugu3kA67juSl2F9AzPd5A3P3kcoiixZmIt8CgG519uFoOPxpqlCRlI4RoIemPTgWDZMk
         Fu9qGmAYGCiGGAJBM3R3t7WR62dLAMvvFwI6SQ0FjjTA8wDeQvWxq1CDeDdMCeWz59XW
         5MHQ==
X-Gm-Message-State: AOAM533JWekxxiWFhiaENvSPxYWZqF1drkC+lSMei0zeB9F7Patzd0iA
	GpVcMz+OLplfhvGuEIUsolxLUAFe9HUv5dryF0rjRJxz3d0=
X-Google-Smtp-Source: ABdhPJwzz5dK6tZJIS8gd+iixK8EByM3RYeNx6o5bwF/nn/8uArdd4mNQ7Tb83Jg79fgitFLECCBFP/o8uOq6Ov1Au4=
X-Received: by 2002:a17:906:5617:: with SMTP id f23mr16906890ejq.298.1620999721324;
 Fri, 14 May 2021 06:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210514095156.1562532-1-Martin.Jansa@gmail.com>
 <167EEF9E05F75E35.12986@lists.yoctoproject.org> <CADkTA4NdK7pAKBX_H1PJQA7efoU5bDKZOyGnPrgGAwOWSbO+6A@mail.gmail.com>
 <20210514132530.yeybeh3rloljeqjl@jama> <CADkTA4PwOW146ixTCA6pSp0O=B-L4DCngnu+5SgUjvthtSpjPQ@mail.gmail.com>
In-Reply-To: <CADkTA4PwOW146ixTCA6pSp0O=B-L4DCngnu+5SgUjvthtSpjPQ@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 14 May 2021 09:41:49 -0400
Message-ID: <CADkTA4MnwgHkVwoWT1fdGNa_c9A4Ga4dqFxEZxsrMFrAx1UP=w@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/5] upx: fix build with gcc-11
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 14, 2021 at 9:39 AM Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
>
> On Fri, May 14, 2021 at 9:25 AM Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> >
> > On Fri, May 14, 2021 at 09:04:31AM -0400, Bruce Ashfield wrote:
> > > On Fri, May 14, 2021 at 8:46 AM Bruce Ashfield via
> > > lists.yoctoproject.org
> > > <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> > > >
> > > > Thanks for the fixups.
> > > >
> > > > I haven't been able to spend time on any gcc11 fixes, so these are=
 appreciated.
> > > >
> > > > These built for me ... so they are merged.
> > > >
> > > > But then I switched to a different machine on a different builder,=
 and
> > > > dev86 blew up during compilation.
> > > >
> > >
> > > I can confirm that my second builder is consistently showing this:
> > >
> > > Log data follows:
> > > | DEBUG: Executing shell function do_compile
> > > | NOTE: make -j 16 VERSION=3D0.16.21 PREFIX=3D/usr
> > > DIST=3D/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.21+gi=
tAUTOINC+e254e0b196-r0/image
> > > LDFLAGS=3D-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
> > > -Wl,-z,relro,-z,now make.fil
> > > | make[1]: Entering directory
> > > '/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.21+gitAUTOI=
NC+e254e0b196-r0/git'
> > > | x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
> > > -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2
> > > -Wformat -Wformat-security -Werror=3Dformat-security -Wdate-time
> > > --sysroot=3D/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.=
21+gitAUTOINC+e254e0b196-r0/recipe-sysroot
> > >  -O -DGNUMAKE -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
> > > -Wl,-z,relro,-z,now -o ifdefg ifdef.c
> > > | ./ifdefg -MU  makefile.in >tmp.mak
> > > | /bin/sh: 1: ./ifdefg: not found
> > > | make[1]: *** [Makefile:46: make.fil] Error 127
> > > | make[1]: Leaving directory
> > > '/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.21+gitAUTOI=
NC+e254e0b196-r0/git'
> > > | make: *** [GNUmakefile:9: make.fil] Error 2
> > > | ERROR: oe_runmake failed
> > > | WARNING: exit code 1 from a shell command.
> > > | ERROR: Execution of
> > > '/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.21+gitAUTOI=
NC+e254e0b196-r0/temp/run.do_compile.30233'
> > > failed with exit code 1:
> > > | make[1]: Entering directory
> > > '/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.21+gitAUTOI=
NC+e254e0b196-r0/git'
> > > | x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
> > > -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2
> > > -Wformat -Wformat-security -Werror=3Dformat-security -Wdate-time
> > > --sysroot=3D/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.=
21+gitAUTOINC+e254e0b196-r0/recipe-sysroot
> > >  -O -DGNUMAKE -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
> > > -Wl,-z,relro,-z,now -o ifdefg ifdef.c
> > > | ./ifdefg -MU  makefile.in >tmp.mak
> > > | /bin/sh: 1: ./ifdefg: not found
> > > | make[1]: *** [Makefile:46: make.fil] Error 127
> > > | make[1]: Leaving directory
> > > '/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.21+gitAUTOI=
NC+e254e0b196-r0/git'
> > > | make: *** [GNUmakefile:9: make.fil] Error 2
> > > | WARNING: exit code 1 from a shell command.
> > > |
> > > ERROR: Task (/home/bruce/poky/meta-virtualization/recipes-extended/d=
ev86/dev86_git.bb:do_compile)
> > > failed with exit code '1'
> > >
> > > Does that ring a bell ? I'll dig into it now, but it is worth checki=
ng
> > > to see if you ran into it during your recipe update.
> >
> > It didn't fail for me like this, is your other builder x86_64?
> >
>
> They are both x86-64, but one was building qemux86-64 and the other
> genericx86-64 as the target.
>
> > Either it's some race, that it tried to call ifdefg before building it=
 for you (was in correct order in my build):
> >
>
> Since that helper is running on the build host, the following made it
> work on my broken builder:
>
> diff --git a/recipes-extended/dev86/dev86_git.bb
> b/recipes-extended/dev86/dev86_git.bb
> index 476bf38..bc68cca 100644
> --- a/recipes-extended/dev86/dev86_git.bb
> +++ b/recipes-extended/dev86/dev86_git.bb
> @@ -19,7 +19,7 @@ EXTRA_OEMAKE =3D "VERSION=3D${BASE_PV} PREFIX=3D${pref=
ix}
> DIST=3D${D} LDFLAGS=3D'${LDFLAGS
>  do_compile() {
>         # ${S}/Makefile does respect LDFLAGS, but ${S}/cpp/Makefile
> doesn't when building bcc-cpp
>         sed -i 's#$(CC) $(CFLAGS) -o bcc-cpp#$(CC) $(CFLAGS)
> $(LDFLAGS) -o bcc-cpp#g' ${S}/cpp/Makefile
> -       oe_runmake make.fil
> +       CC=3D${BUILD_CC} oe_runmake make.fil
>         oe_runmake -f make.fil bcc86 as86 ld86
>  }
>
>
> But maybe it just changed the timing, and the fix, really isn't a fix.

Sorry for the extra email.

I meant to say, that is of course assuming that the first call to
make.fil is only building ifdefg, otherwise, I built the whole thing
for the build host :D .. and it is of course the same thing you were
saying about ifdefg-native.

Bruce

>
> Bruce
>
>
> > dev86/0.16.21+gitAUTOINC+e254e0b196-r0/git$ grep ifdefg ../temp/log.do=
_compile
> > i686-webos-linux-gcc  -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpma=
th=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wfor=
mat-security -Werror=3Dformat-security -Werror=3Dreturn-type --sysroot=3D/j=
enkins/mjansa/build/ros/webos-dashing-honister/tmp-glibc/work/qemux86-webos=
-linux/
> > dev86/0.16.21+gitAUTOINC+e254e0b196-r0/recipe-sysroot  -O -DGNUMAKE -W=
l,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,relro,-z,now -o ifdefg =
ifdef.c
> > ./ifdefg -MU  makefile.in >tmp.mak
> >
> > dev86/0.16.21+gitAUTOINC+e254e0b196-r0$ file git/ifdefg
> > git/ifdefg: ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV=
), dynamically linked, interpreter /lib/ld-linux.so.2, for GNU/Linux 3.2.0,=
 BuildID[sha1]=3D3edc52ae7ee0ef4fcd9d9148c63df9977c772780, with debug_info,=
 not stripped
> >
> > but we should change it to call ifdefg from dev86-native anyway, let m=
e try to reproduce this somehow.
> >
> > And looks like the older version called ifdefg the same:
> >
> > dev86/0.16.21-r0$ grep ifdefg temp/log.do_compile
> > i686-webos-linux-gcc  -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpma=
th=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wfor=
mat-security -Werror=3Dformat-security -Werror=3Dreturn-type --sysroot=3D/j=
enkins/mjansa/build/ros/webos-dashing-hardknott/tmp-glibc/work/qemux86-webo=
s-linux
> > /dev86/0.16.21-r0/recipe-sysroot  -O -DGNUMAKE -Wl,-O1 -Wl,--hash-styl=
e=3Dgnu -Wl,--as-needed -Wl,-z,relro,-z,now -o ifdefg ifdef.c
> > ./ifdefg -MU  makefile.in >tmp.mak
> >
> > > > I'm leaving the changes as-is in the tree, and we can fix them as
> > > > required as new patches (I'm done mucking with history for one day=
;)
> > > >
> > > > Cheers,
> > > >
> > > > Bruce
> > > >
> > > >
> > > >
> > > > On Fri, May 14, 2021 at 5:52 AM Martin Jansa <Martin.Jansa@gmail.c=
om> wrote:
> > > > >
> > > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > > ---
> > > > >  .../0001-MyCom.h-fix-build-with-gcc-11.patch  | 31 ++++++++++++=
+++++++
> > > > >  recipes-extended/upx/upx_git.bb               |  4 ++-
> > > > >  2 files changed, 34 insertions(+), 1 deletion(-)
> > > > >  create mode 100644 recipes-extended/upx/upx/0001-MyCom.h-fix-bu=
ild-with-gcc-11.patch
> > > > >
> > > > > diff --git a/recipes-extended/upx/upx/0001-MyCom.h-fix-build-wit=
h-gcc-11.patch b/recipes-extended/upx/upx/0001-MyCom.h-fix-build-with-gcc-1=
1.patch
> > > > > new file mode 100644
> > > > > index 0000000..8b07c77
> > > > > --- /dev/null
> > > > > +++ b/recipes-extended/upx/upx/0001-MyCom.h-fix-build-with-gcc-1=
1.patch
> > > > > @@ -0,0 +1,31 @@
> > > > > +From 8fe8cd22163fe11b791aac15b642d122ea98b9b5 Mon Sep 17 00:00:=
00 2001
> > > > > +From: Martin Jansa <martin.jansa@lge.com>
> > > > > +Date: Fri, 14 May 2021 02:26:13 -0700
> > > > > +Subject: [PATCH] MyCom.h: fix build with gcc-11
> > > > > +
> > > > > +* fixes:
> > > > > +  ./../src/lzma-sdk/C/7zip/Compress/LZMA/LZMAEncoder.h: In memb=
er function 'virtual ULONG NCompress::NLZMA::CEncoder::Release()':
> > > > > +  ./../src/lzma-sdk/C/7zip/Compress/LZMA/../../../Common/MyCom.=
h:159:32: error: this 'if' clause does not guard... [-Werror=3Dmisleading-i=
ndentation]
> > > > > +    159 | STDMETHOD_(ULONG, Release)() { if (--__m_RefCount !=
=3D 0)  \
> > > > > +        |                                ^~
> > > > > +
> > > > > +Upstream-Status: Submitted [https://github.com/upx/upx-lzma-sdk=
/pull/5]
> > > > > +Signed-off-by: Martin Jansa <martin.jansa@lge.com>
> > > > > +---
> > > > > + C/Common/MyCom.h | 3 +--
> > > > > + 1 file changed, 1 insertion(+), 2 deletions(-)
> > > > > +
> > > > > +diff --git a/C/Common/MyCom.h b/C/Common/MyCom.h
> > > > > +index b8dbf38..2e3c54a 100644
> > > > > +--- a/C/Common/MyCom.h
> > > > > ++++ b/C/Common/MyCom.h
> > > > > +@@ -156,8 +156,7 @@ public:
> > > > > +
> > > > > + #define MY_ADDREF_RELEASE \
> > > > > + STDMETHOD_(ULONG, AddRef)() { return ++__m_RefCount; } \
> > > > > +-STDMETHOD_(ULONG, Release)() { if (--__m_RefCount !=3D 0)  \
> > > > > +-  return __m_RefCount; delete this; return 0; }
> > > > > ++STDMETHOD_(ULONG, Release)() { if (--__m_RefCount !=3D 0) retu=
rn __m_RefCount; delete this; return 0; }
> > > > > +
> > > > > + #define MY_UNKNOWN_IMP_SPEC(i) \
> > > > > +   MY_QUERYINTERFACE_BEGIN \
> > > > > diff --git a/recipes-extended/upx/upx_git.bb b/recipes-extended/=
upx/upx_git.bb
> > > > > index b77e658..96d2e99 100644
> > > > > --- a/recipes-extended/upx/upx_git.bb
> > > > > +++ b/recipes-extended/upx/upx_git.bb
> > > > > @@ -2,7 +2,9 @@ HOMEPAGE =3D "http://upx.sourceforge.net"
> > > > >  SUMMARY =3D "Ultimate executable compressor."
> > > > >
> > > > >  SRCREV =3D "4e1ae22a1a07be5135c68b25ff05058ae8ae48e1"
> > > > > -SRC_URI =3D "gitsm://github.com/upx/upx;branch=3Ddevel"
> > > > > +SRC_URI =3D "gitsm://github.com/upx/upx;branch=3Ddevel \
> > > > > +    file://0001-MyCom.h-fix-build-with-gcc-11.patch;patchdir=3D=
src/lzma-sdk \
> > > > > +"
> > > > >
> > > > >  LICENSE =3D "GPLv2"
> > > > >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D353753597aa110e0ded3=
508408c6374a"
> > > > > --
> > > > > 2.30.2
> > > > >
> > > > >
> > > > >
> > > > >
> > > >
> > > >
> > > > --
> > > > - Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait
> > > > thee at its end
> > > > - "Use the force Harry" - Gandalf, Star Trek II
> > > >
> > > >=20
> > > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
