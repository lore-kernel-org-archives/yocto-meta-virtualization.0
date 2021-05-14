Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web09.8599.1620998733494807113
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 May 2021 06:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EJYVsT5c;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id f1so12477765edt.4
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 14 May 2021 06:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aDpRbXzSIC0Ucz5A6Jrmr7rrsJYjiT8qlZ7OAYJnFUA=;
        b=EJYVsT5cH048zMxydgy33gkXyVtqsf5GvH1YDQt0fYOrqUeQNDmw9CPWqTYDmk7fti
         jimMVLS38fQCAwUpFu0QH6RS7TwgSCkBJunKek1R8IxQ21B5P6zI0sQjMtTCF9Z+jHoF
         t8O8u/7hn5JCEAkdyAQYLebqnt7vdoBV4wfP3109r6Ek41y1XVjF39Tf0rrINhIhk+9T
         EnIFkLDIBrzvvZxosJFk+368lUs/tDGj/e1drCiUzPLdjq/5djlFXXLPvf8jK2nJzJZc
         SGE2srUJI2ATdyi/dKsRgaHXwJvbvRwBZPkfM9/rtcyFciWc6vUmnFRuEMe5JSrdvdJx
         hhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aDpRbXzSIC0Ucz5A6Jrmr7rrsJYjiT8qlZ7OAYJnFUA=;
        b=R2DwX6YWBNyDTaeO1nhAE11JXiYfmJTFCuKmQePISHUHK+kCzw4v2BrE7eXmikxpda
         9Pgr/1N6uSJw9BnyyFTKWzHApfKPZcSm9A/+EYrGeV2MBVDZbjuAS4jp5M2YBGxFpDQy
         XYvN3jQ4FSFWkc/zbKoRcDQ51Upg1TVRnNo8bywlYclMhvRuV9iYo01hj2VtT5tdKmT8
         +Weq1xiC+AJ+7RsIpEHQvoAeQ6zNQ3XKALL10Yut1981mi3WYn/IXORdvDdlx6Qj1b3l
         0rQzftp9tCH1UmDCE7BmJU6mylLAp2Od/wJnDf3DfnH+a6JrrfegCdUlmxVA+WlkxTAs
         Q3/w==
X-Gm-Message-State: AOAM532M487u4RUOcYgWPQXRI1EOWOXV7+N2FvKbdb7tSqqQUxTPjlMy
	DjwvZ/XqPk8yg4Wyh01gtU0=
X-Google-Smtp-Source: ABdhPJxjQlcq2dZy8VfJeFPtWmvvBhqWL1AhUVEl4DauOpFbXw/y9qaM6+Um3afMeGOxyo+Hc8gFuw==
X-Received: by 2002:aa7:d058:: with SMTP id n24mr18989443edo.275.1620998731776;
        Fri, 14 May 2021 06:25:31 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 9sm3577234ejv.73.2021.05.14.06.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 06:25:30 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 14 May 2021 15:25:30 +0200
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH 1/5] upx: fix build with gcc-11
Message-ID: <20210514132530.yeybeh3rloljeqjl@jama>
References: <20210514095156.1562532-1-Martin.Jansa@gmail.com>
 <167EEF9E05F75E35.12986@lists.yoctoproject.org>
 <CADkTA4NdK7pAKBX_H1PJQA7efoU5bDKZOyGnPrgGAwOWSbO+6A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4NdK7pAKBX_H1PJQA7efoU5bDKZOyGnPrgGAwOWSbO+6A@mail.gmail.com>
X-Groupsio-MsgNum: 6521
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cy5wrycaq3nfyx7b"
Content-Disposition: inline

--cy5wrycaq3nfyx7b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 14, 2021 at 09:04:31AM -0400, Bruce Ashfield wrote:
> On Fri, May 14, 2021 at 8:46 AM Bruce Ashfield via
> lists.yoctoproject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > Thanks for the fixups.
> >
> > I haven't been able to spend time on any gcc11 fixes, so these are app=
reciated.
> >
> > These built for me ... so they are merged.
> >
> > But then I switched to a different machine on a different builder, and
> > dev86 blew up during compilation.
> >
>=20
> I can confirm that my second builder is consistently showing this:
>=20
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 16 VERSION=3D0.16.21 PREFIX=3D/usr
> DIST=3D/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.21+gitAUT=
OINC+e254e0b196-r0/image
> LDFLAGS=3D-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
> -Wl,-z,relro,-z,now make.fil
> | make[1]: Entering directory
> '/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.21+gitAUTOINC+e=
254e0b196-r0/git'
> | x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
> -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2
> -Wformat -Wformat-security -Werror=3Dformat-security -Wdate-time
> --sysroot=3D/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.21+g=
itAUTOINC+e254e0b196-r0/recipe-sysroot
>  -O -DGNUMAKE -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
> -Wl,-z,relro,-z,now -o ifdefg ifdef.c
> | ./ifdefg -MU  makefile.in >tmp.mak
> | /bin/sh: 1: ./ifdefg: not found
> | make[1]: *** [Makefile:46: make.fil] Error 127
> | make[1]: Leaving directory
> '/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.21+gitAUTOINC+e=
254e0b196-r0/git'
> | make: *** [GNUmakefile:9: make.fil] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Execution of
> '/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.21+gitAUTOINC+e=
254e0b196-r0/temp/run.do_compile.30233'
> failed with exit code 1:
> | make[1]: Entering directory
> '/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.21+gitAUTOINC+e=
254e0b196-r0/git'
> | x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
> -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2
> -Wformat -Wformat-security -Werror=3Dformat-security -Wdate-time
> --sysroot=3D/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.21+g=
itAUTOINC+e254e0b196-r0/recipe-sysroot
>  -O -DGNUMAKE -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
> -Wl,-z,relro,-z,now -o ifdefg ifdef.c
> | ./ifdefg -MU  makefile.in >tmp.mak
> | /bin/sh: 1: ./ifdefg: not found
> | make[1]: *** [Makefile:46: make.fil] Error 127
> | make[1]: Leaving directory
> '/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.21+gitAUTOINC+e=
254e0b196-r0/git'
> | make: *** [GNUmakefile:9: make.fil] Error 2
> | WARNING: exit code 1 from a shell command.
> |
> ERROR: Task (/home/bruce/poky/meta-virtualization/recipes-extended/dev86=
/dev86_git.bb:do_compile)
> failed with exit code '1'
>=20
> Does that ring a bell ? I'll dig into it now, but it is worth checking
> to see if you ran into it during your recipe update.

It didn't fail for me like this, is your other builder x86_64?

Either it's some race, that it tried to call ifdefg before building it for=
 you (was in correct order in my build):

dev86/0.16.21+gitAUTOINC+e254e0b196-r0/git$ grep ifdefg ../temp/log.do_com=
pile
i686-webos-linux-gcc  -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wform=
at-security -Werror=3Dformat-security -Werror=3Dreturn-type --sysroot=3D/je=
nkins/mjansa/build/ros/webos-dashing-honister/tmp-glibc/work/qemux86-webos-=
linux/
dev86/0.16.21+gitAUTOINC+e254e0b196-r0/recipe-sysroot  -O -DGNUMAKE -Wl,-O=
1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,relro,-z,now -o ifdefg ifde=
f.c
./ifdefg -MU  makefile.in >tmp.mak

dev86/0.16.21+gitAUTOINC+e254e0b196-r0$ file git/ifdefg
git/ifdefg: ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV), d=
ynamically linked, interpreter /lib/ld-linux.so.2, for GNU/Linux 3.2.0, Bui=
ldID[sha1]=3D3edc52ae7ee0ef4fcd9d9148c63df9977c772780, with debug_info, not=
 stripped

but we should change it to call ifdefg from dev86-native anyway, let me tr=
y to reproduce this somehow.

And looks like the older version called ifdefg the same:

dev86/0.16.21-r0$ grep ifdefg temp/log.do_compile
i686-webos-linux-gcc  -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wform=
at-security -Werror=3Dformat-security -Werror=3Dreturn-type --sysroot=3D/je=
nkins/mjansa/build/ros/webos-dashing-hardknott/tmp-glibc/work/qemux86-webos=
-linux
/dev86/0.16.21-r0/recipe-sysroot  -O -DGNUMAKE -Wl,-O1 -Wl,--hash-style=3D=
gnu -Wl,--as-needed -Wl,-z,relro,-z,now -o ifdefg ifdef.c
./ifdefg -MU  makefile.in >tmp.mak

> > I'm leaving the changes as-is in the tree, and we can fix them as
> > required as new patches (I'm done mucking with history for one day;)
> >
> > Cheers,
> >
> > Bruce
> >
> >
> >
> > On Fri, May 14, 2021 at 5:52 AM Martin Jansa <Martin.Jansa@gmail.com> =
wrote:
> > >
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  .../0001-MyCom.h-fix-build-with-gcc-11.patch  | 31 ++++++++++++++++=
+++
> > >  recipes-extended/upx/upx_git.bb               |  4 ++-
> > >  2 files changed, 34 insertions(+), 1 deletion(-)
> > >  create mode 100644 recipes-extended/upx/upx/0001-MyCom.h-fix-build-=
with-gcc-11.patch
> > >
> > > diff --git a/recipes-extended/upx/upx/0001-MyCom.h-fix-build-with-gc=
c-11.patch b/recipes-extended/upx/upx/0001-MyCom.h-fix-build-with-gcc-11.pa=
tch
> > > new file mode 100644
> > > index 0000000..8b07c77
> > > --- /dev/null
> > > +++ b/recipes-extended/upx/upx/0001-MyCom.h-fix-build-with-gcc-11.pa=
tch
> > > @@ -0,0 +1,31 @@
> > > +From 8fe8cd22163fe11b791aac15b642d122ea98b9b5 Mon Sep 17 00:00:00 2=
001
> > > +From: Martin Jansa <martin.jansa@lge.com>
> > > +Date: Fri, 14 May 2021 02:26:13 -0700
> > > +Subject: [PATCH] MyCom.h: fix build with gcc-11
> > > +
> > > +* fixes:
> > > +  ./../src/lzma-sdk/C/7zip/Compress/LZMA/LZMAEncoder.h: In member f=
unction 'virtual ULONG NCompress::NLZMA::CEncoder::Release()':
> > > +  ./../src/lzma-sdk/C/7zip/Compress/LZMA/../../../Common/MyCom.h:15=
9:32: error: this 'if' clause does not guard... [-Werror=3Dmisleading-inden=
tation]
> > > +    159 | STDMETHOD_(ULONG, Release)() { if (--__m_RefCount !=3D 0)=
  \
> > > +        |                                ^~
> > > +
> > > +Upstream-Status: Submitted [https://github.com/upx/upx-lzma-sdk/pul=
l/5]
> > > +Signed-off-by: Martin Jansa <martin.jansa@lge.com>
> > > +---
> > > + C/Common/MyCom.h | 3 +--
> > > + 1 file changed, 1 insertion(+), 2 deletions(-)
> > > +
> > > +diff --git a/C/Common/MyCom.h b/C/Common/MyCom.h
> > > +index b8dbf38..2e3c54a 100644
> > > +--- a/C/Common/MyCom.h
> > > ++++ b/C/Common/MyCom.h
> > > +@@ -156,8 +156,7 @@ public:
> > > +
> > > + #define MY_ADDREF_RELEASE \
> > > + STDMETHOD_(ULONG, AddRef)() { return ++__m_RefCount; } \
> > > +-STDMETHOD_(ULONG, Release)() { if (--__m_RefCount !=3D 0)  \
> > > +-  return __m_RefCount; delete this; return 0; }
> > > ++STDMETHOD_(ULONG, Release)() { if (--__m_RefCount !=3D 0) return _=
_m_RefCount; delete this; return 0; }
> > > +
> > > + #define MY_UNKNOWN_IMP_SPEC(i) \
> > > +   MY_QUERYINTERFACE_BEGIN \
> > > diff --git a/recipes-extended/upx/upx_git.bb b/recipes-extended/upx/=
upx_git.bb
> > > index b77e658..96d2e99 100644
> > > --- a/recipes-extended/upx/upx_git.bb
> > > +++ b/recipes-extended/upx/upx_git.bb
> > > @@ -2,7 +2,9 @@ HOMEPAGE =3D "http://upx.sourceforge.net"
> > >  SUMMARY =3D "Ultimate executable compressor."
> > >
> > >  SRCREV =3D "4e1ae22a1a07be5135c68b25ff05058ae8ae48e1"
> > > -SRC_URI =3D "gitsm://github.com/upx/upx;branch=3Ddevel"
> > > +SRC_URI =3D "gitsm://github.com/upx/upx;branch=3Ddevel \
> > > +    file://0001-MyCom.h-fix-build-with-gcc-11.patch;patchdir=3Dsrc/=
lzma-sdk \
> > > +"
> > >
> > >  LICENSE =3D "GPLv2"
> > >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D353753597aa110e0ded35084=
08c6374a"
> > > --
> > > 2.30.2
> > >
> > >
> > >
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >=20
> >
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

--cy5wrycaq3nfyx7b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYJ56SAAKCRA3VSO3ZXaA
HAERAJ9WubUAX+PvGL8uxic3gNYcXMvCJgCfdHBUyQE8lr0AN6aN7Dd1aMWQ03U=
=Qi6p
-----END PGP SIGNATURE-----

--cy5wrycaq3nfyx7b--
