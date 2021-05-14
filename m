Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web08.8353.1620997484481284969
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 May 2021 06:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X8wKyb40;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id v5so23533534edc.8
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 14 May 2021 06:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fuWBAcPO4gUdiEnTJ+sAQMJjFBMwjEP9uaajKbJcU5s=;
        b=X8wKyb40j6WkXz56el7TgetIPWxm8KSkeTmvyGnLUG/WVLtdvZu83mWqUhYLx4kKGs
         8CGP3PapvBbrDzoiiXtPLfXbi4zScRjZ0hsxmrKoFihkLyQM6TMiTnBoazjws2ui2GEx
         BnX/hkDeXEd8f0oRcoM/yxlbnyJMvyWqigPE/rv2wxlD+/l6U8j6QpXhkSLEquWVNKnG
         ABSnVo0XvqoAH089KQLt1O7auE0t6iNX2yyB3jTn2KNjOjMK4Y8NrmMQRyuhtJ4mTFZR
         a+RK2hVcJ58uD75ro/X0wCJgf2d0+1Qd7k2TaxjTmI+6w6uOdAFuWRstb6MuL/TV2rrc
         WosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fuWBAcPO4gUdiEnTJ+sAQMJjFBMwjEP9uaajKbJcU5s=;
        b=PeNy5DNxBl18iTCeOFcr9H4g16WIY7aBaMV+PweEjrKchTjSBoWS9+MnfiAv9oAs9O
         jADOM9ShNxzPMsm3aUzqzkyGDnLhZ76y4ChmUHRx9eq3gOAQ6vzgo7WNu6uQHrMklmCn
         D+AugPpKu6+bjh2OcHzUi91/4DSYtV308HXUkxv5gkpn8nThsGKojt36/nDALu5QqbHH
         jFlHU8Qbk7qfJWMyu0M0MmIk5QJazqr775E3lx7OkJO451PBiw4ppadV9aasalfbVT89
         +8e/FSUxxXqm9jCg0WlLI1T+4oH2mXC1li+tpsdPP+le+8xRruFr/Y2TZdRlUkm/fids
         wYXw==
X-Gm-Message-State: AOAM5307HjcHLWqy09O+kbO1tDp8CdVb33iYOYivS/K1tQbuYON0GdvI
	qHxoNUKyCcpSEdM97nzbccPC2kZxlM5Pa2aU4y8=
X-Google-Smtp-Source: ABdhPJx55rVv6nyjpuJOsT2FMZRSYLPSKNaTRf2X37UkcoYjgC//GgtXk0Fa/T113itX7DUDWvwHmNsJnR7Fg2MrPi8=
X-Received: by 2002:a05:6402:268c:: with SMTP id w12mr58215461edd.234.1620997482856;
 Fri, 14 May 2021 06:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210514095156.1562532-1-Martin.Jansa@gmail.com> <167EEF9E05F75E35.12986@lists.yoctoproject.org>
In-Reply-To: <167EEF9E05F75E35.12986@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 14 May 2021 09:04:31 -0400
Message-ID: <CADkTA4NdK7pAKBX_H1PJQA7efoU5bDKZOyGnPrgGAwOWSbO+6A@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/5] upx: fix build with gcc-11
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, May 14, 2021 at 8:46 AM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> Thanks for the fixups.
>
> I haven't been able to spend time on any gcc11 fixes, so these are appreciated.
>
> These built for me ... so they are merged.
>
> But then I switched to a different machine on a different builder, and
> dev86 blew up during compilation.
>

I can confirm that my second builder is consistently showing this:

Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 VERSION=0.16.21 PREFIX=/usr
DIST=/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.21+gitAUTOINC+e254e0b196-r0/image
LDFLAGS=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
-Wl,-z,relro,-z,now make.fil
| make[1]: Entering directory
'/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.21+gitAUTOINC+e254e0b196-r0/git'
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3
-mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2
-Wformat -Wformat-security -Werror=format-security -Wdate-time
--sysroot=/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.21+gitAUTOINC+e254e0b196-r0/recipe-sysroot
 -O -DGNUMAKE -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
-Wl,-z,relro,-z,now -o ifdefg ifdef.c
| ./ifdefg -MU  makefile.in >tmp.mak
| /bin/sh: 1: ./ifdefg: not found
| make[1]: *** [Makefile:46: make.fil] Error 127
| make[1]: Leaving directory
'/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.21+gitAUTOINC+e254e0b196-r0/git'
| make: *** [GNUmakefile:9: make.fil] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of
'/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.21+gitAUTOINC+e254e0b196-r0/temp/run.do_compile.30233'
failed with exit code 1:
| make[1]: Entering directory
'/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.21+gitAUTOINC+e254e0b196-r0/git'
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3
-mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2
-Wformat -Wformat-security -Werror=format-security -Wdate-time
--sysroot=/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.21+gitAUTOINC+e254e0b196-r0/recipe-sysroot
 -O -DGNUMAKE -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
-Wl,-z,relro,-z,now -o ifdefg ifdef.c
| ./ifdefg -MU  makefile.in >tmp.mak
| /bin/sh: 1: ./ifdefg: not found
| make[1]: *** [Makefile:46: make.fil] Error 127
| make[1]: Leaving directory
'/opt/poky/build/tmp/work/core2-64-poky-linux/dev86/0.16.21+gitAUTOINC+e254e0b196-r0/git'
| make: *** [GNUmakefile:9: make.fil] Error 2
| WARNING: exit code 1 from a shell command.
|
ERROR: Task (/home/bruce/poky/meta-virtualization/recipes-extended/dev86/dev86_git.bb:do_compile)
failed with exit code '1'

Does that ring a bell ? I'll dig into it now, but it is worth checking
to see if you ran into it during your recipe update.

Bruce


> I'm leaving the changes as-is in the tree, and we can fix them as
> required as new patches (I'm done mucking with history for one day;)
>
> Cheers,
>
> Bruce
>
>
>
> On Fri, May 14, 2021 at 5:52 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../0001-MyCom.h-fix-build-with-gcc-11.patch  | 31 +++++++++++++++++++
> >  recipes-extended/upx/upx_git.bb               |  4 ++-
> >  2 files changed, 34 insertions(+), 1 deletion(-)
> >  create mode 100644 recipes-extended/upx/upx/0001-MyCom.h-fix-build-with-gcc-11.patch
> >
> > diff --git a/recipes-extended/upx/upx/0001-MyCom.h-fix-build-with-gcc-11.patch b/recipes-extended/upx/upx/0001-MyCom.h-fix-build-with-gcc-11.patch
> > new file mode 100644
> > index 0000000..8b07c77
> > --- /dev/null
> > +++ b/recipes-extended/upx/upx/0001-MyCom.h-fix-build-with-gcc-11.patch
> > @@ -0,0 +1,31 @@
> > +From 8fe8cd22163fe11b791aac15b642d122ea98b9b5 Mon Sep 17 00:00:00 2001
> > +From: Martin Jansa <martin.jansa@lge.com>
> > +Date: Fri, 14 May 2021 02:26:13 -0700
> > +Subject: [PATCH] MyCom.h: fix build with gcc-11
> > +
> > +* fixes:
> > +  ./../src/lzma-sdk/C/7zip/Compress/LZMA/LZMAEncoder.h: In member function 'virtual ULONG NCompress::NLZMA::CEncoder::Release()':
> > +  ./../src/lzma-sdk/C/7zip/Compress/LZMA/../../../Common/MyCom.h:159:32: error: this 'if' clause does not guard... [-Werror=misleading-indentation]
> > +    159 | STDMETHOD_(ULONG, Release)() { if (--__m_RefCount != 0)  \
> > +        |                                ^~
> > +
> > +Upstream-Status: Submitted [https://github.com/upx/upx-lzma-sdk/pull/5]
> > +Signed-off-by: Martin Jansa <martin.jansa@lge.com>
> > +---
> > + C/Common/MyCom.h | 3 +--
> > + 1 file changed, 1 insertion(+), 2 deletions(-)
> > +
> > +diff --git a/C/Common/MyCom.h b/C/Common/MyCom.h
> > +index b8dbf38..2e3c54a 100644
> > +--- a/C/Common/MyCom.h
> > ++++ b/C/Common/MyCom.h
> > +@@ -156,8 +156,7 @@ public:
> > +
> > + #define MY_ADDREF_RELEASE \
> > + STDMETHOD_(ULONG, AddRef)() { return ++__m_RefCount; } \
> > +-STDMETHOD_(ULONG, Release)() { if (--__m_RefCount != 0)  \
> > +-  return __m_RefCount; delete this; return 0; }
> > ++STDMETHOD_(ULONG, Release)() { if (--__m_RefCount != 0) return __m_RefCount; delete this; return 0; }
> > +
> > + #define MY_UNKNOWN_IMP_SPEC(i) \
> > +   MY_QUERYINTERFACE_BEGIN \
> > diff --git a/recipes-extended/upx/upx_git.bb b/recipes-extended/upx/upx_git.bb
> > index b77e658..96d2e99 100644
> > --- a/recipes-extended/upx/upx_git.bb
> > +++ b/recipes-extended/upx/upx_git.bb
> > @@ -2,7 +2,9 @@ HOMEPAGE = "http://upx.sourceforge.net"
> >  SUMMARY = "Ultimate executable compressor."
> >
> >  SRCREV = "4e1ae22a1a07be5135c68b25ff05058ae8ae48e1"
> > -SRC_URI = "gitsm://github.com/upx/upx;branch=devel"
> > +SRC_URI = "gitsm://github.com/upx/upx;branch=devel \
> > +    file://0001-MyCom.h-fix-build-with-gcc-11.patch;patchdir=src/lzma-sdk \
> > +"
> >
> >  LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=353753597aa110e0ded3508408c6374a"
> > --
> > 2.30.2
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
