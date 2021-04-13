Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.3951.1618283739255159152
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 12 Apr 2021 20:15:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=viC++SPx;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id v24-20020a9d69d80000b02901b9aec33371so14884781oto.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Apr 2021 20:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3iHfe06VyQAmA0xnuAmsuNzzkqKlrcVjSvPQBEZ9/dQ=;
        b=viC++SPx9p1IxmzUM5kJQgzyESX+d2NLR0OzXkDfT5PvpYse/nttdKDlh28641ZsTW
         RfMdWAYvT4m9oJapms8XnRnMupY4tot7FQ4HPQuoavhSzUKkyPydcna7RGDxHlwSoPg5
         gNMOvkxA98oSo53inCAh+54XOkbZFRqvJ6CPCe9oLEzrr2WPw7BsAbs8JAatVCBzFTz0
         n32ePFHbab6ItWhOcL8Jt6FXGQxTBBHe8JxNNx8RnsAWslzPckGEOL8MWSZ1zzYYhD0+
         fnRb8mgCWl0v53CPjYty/ZVa+O6pe/U3+AeuFJ96xCkGOhcuorYzhHhj23pRB8eIhsTK
         Dz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3iHfe06VyQAmA0xnuAmsuNzzkqKlrcVjSvPQBEZ9/dQ=;
        b=RaEuKkZ2bMeA01xseSVzfu/cfQslLrQjspM5BmcBt1poPRxWdp5z0Z4lgHvEK9D7d0
         vcLDETif+0gtPoa5QzryI8nSeG0wNDASM76WvvAJ22HDFg69Gqke9ZjKkXIVNHyV6W/+
         J1CduURO/zf4B9mTNXNe8Je4/ab2Mhq+fGCPRyeeIfMZ+QqM3RNpheqD+ypAFuNv5npS
         17cxUD1zs2R+++jR42NFYa4cXFlksCSF4CGrD6iWBbdWoaFyG+xs9NKpt2oSxhQTOX7l
         EGcsW/Iq1/5/dmdVI0gCoBK2GayRL7Xb7LOiDKxbvaLDHn0uvoibj5E4Rkzo6acYnLjI
         cfHg==
X-Gm-Message-State: AOAM532XEW3go5ud5uVo/0yvv/p4tmi5rg1PT7taKdb9ZDZwBvwMNI/z
	F896KXQ5/N7OktId8eVIoXykuaTF6V0eJNPcq5w=
X-Google-Smtp-Source: ABdhPJzxgdg3wRzKn/YbBus548fXealq9lztAd21PGj9yg6De0CW5gAwi/WIMA8aXyeR3E6E5V74Ru6CGu2qp4iJAUg=
X-Received: by 2002:a05:6830:1d1:: with SMTP id r17mr10223673ota.78.1618283738541;
 Mon, 12 Apr 2021 20:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210404092619.2059377-1-Martin.Jansa@gmail.com> <CACMJ4GaTFWE18fGWYPE0PWF1X=8gbGGWcp09bjc7fThc0sPcxg@mail.gmail.com>
In-Reply-To: <CACMJ4GaTFWE18fGWYPE0PWF1X=8gbGGWcp09bjc7fThc0sPcxg@mail.gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Mon, 12 Apr 2021 20:15:27 -0700
Message-ID: <CACMJ4GYJ44ZC28gM4WPrZcoxHKCR8Phf-Bkh1_a8Ek6pAwOJbw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] xen: drop i686 support also from xen-tools/xen-python2
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 6, 2021 at 10:59 PM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> On Sun, Apr 4, 2021 at 2:26 AM Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > * this commit seems no longer true for current version of xen:
> >   commit a0964e2044cb1ccdd4f64173658ce7602257ff48
> >   Author: Christopher Clark <christopher.w.clark@gmail.com>
> >   Date:   Tue Feb 25 16:16:00 2020 -0800
> >
> >     xen, xen-tools: separate COMPATIBLE_HOST for hypervisor and tools
> >
> >     The tools have broader platform compatibility than the hypervisor.
> >
> > * xen-tools are failing to build for qemux86 as shown in:
> >   http://errors.yoctoproject.org/Errors/Details/575367/
> >
> >   make[8]: Entering directory 'TOPDIR/tmp-glibc/work/core2-32-oe-linux/xen-tools/4.14+stableAUTOINC+ad844aa352-r0/git/tools/firmware/xen-dir/xen-root/xen'
> >   echo "*** Xen x86/32 target no longer supported!"
> >   *** Xen x86/32 target no longer supported!
> >   make[8]: Leaving directory 'TOPDIR/tmp-glibc/work/core2-32-oe-linux/xen-tools/4.14+stableAUTOINC+ad844aa352-r0/git/tools/firmware/xen-dir/xen-root/xen'
> >   ln -sf xen-root/xen/xen xen-shim
> >   ln -sf xen-root/xen/xen-syms xen-shim-syms
> >   ...
> >   install: cannot stat 'xen-dir/xen-shim': No such file or directory
> >   make[4]: *** [Makefile:51: install] Error 1
> >
> >   revert the commit and also drop i686 from map_xen_arch
>
> Thanks for reporting this, Martin. I need to look into this. I can see
> why this particular part of the tools build is not suitable for x86/32
> but I don't think that it necessarily means that the entire suite of
> xen-tools should be removed with it for x86/32, and if not then this
> won't be the change that we will want to fix this build issue.

To follow up on this: I've just posted an alternative patch that fixes
the 32-bit x86 xen-tools build, so patch from this thread will not be
required.

thanks

Christopher


>
> Christopher
>
>
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  recipes-extended/xen/xen-arch.inc       | 3 +--
> >  recipes-extended/xen/xen-hypervisor.inc | 3 ---
> >  recipes-extended/xen/xen-python2.bb     | 3 ---
> >  recipes-extended/xen/xen-tools.inc      | 2 --
> >  recipes-extended/xen/xen.inc            | 2 ++
> >  5 files changed, 3 insertions(+), 10 deletions(-)
> >
> > diff --git a/recipes-extended/xen/xen-arch.inc b/recipes-extended/xen/xen-arch.inc
> > index fb0093e..9676045 100644
> > --- a/recipes-extended/xen/xen-arch.inc
> > +++ b/recipes-extended/xen/xen-arch.inc
> > @@ -8,8 +8,7 @@ def map_xen_arch(a, d):
> >      import re
> >      valid_archs = d.getVar('valid_xen_archs').split()
> >
> > -    if   re.match("i.86", a):        return "x86_32"
> > -    elif re.match("x86.64", a):      return "x86_64"
> > +    if re.match("x86.64", a):      return "x86_64"
> >      elif re.match("arm.*", a):       return "arm32"
> >      elif re.match("aarch64.*", a):   return "arm64"
> >      elif a in valid_archs:           return a
> > diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
> > index 916bd3c..d8e57e2 100644
> > --- a/recipes-extended/xen/xen-hypervisor.inc
> > +++ b/recipes-extended/xen/xen-hypervisor.inc
> > @@ -6,9 +6,6 @@ DESCRIPTION = "The Xen hypervisor"
> >  # this allows for varying the target architecture or toolchain used
> >  # to build the different components. eg. 32-bit tools and a 64-bit hypervisor.
> >
> > -# The Xen hypervisor has a narrower compatible platform range than the Xen tools
> > -COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
> > -
> >  inherit deploy python3native cml1
> >
> >  PACKAGES = " \
> > diff --git a/recipes-extended/xen/xen-python2.bb b/recipes-extended/xen/xen-python2.bb
> > index ad3c1fd..08d8e92 100644
> > --- a/recipes-extended/xen/xen-python2.bb
> > +++ b/recipes-extended/xen/xen-python2.bb
> > @@ -6,9 +6,6 @@ SECTION = "console/tools"
> >
> >  SRCREV ?= "a5fcafbfbee55261853fba07149c1c795f2baf58"
> >
> > -# The same restriction as xen-tools.inc, because of the dependency on xen-tools-xentrace from xen-tools-xentrace-format
> > -COMPATIBLE_HOST = 'i686-.*-linux|(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
> > -
> >  XEN_REL ?= "4.12"
> >  XEN_BRANCH ?= "stable-4.12"
> >
> > diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
> > index 722c503..35d0c58 100644
> > --- a/recipes-extended/xen/xen-tools.inc
> > +++ b/recipes-extended/xen/xen-tools.inc
> > @@ -1,8 +1,6 @@
> >  SUMMARY = "Xen hypervisor tools"
> >  DESCRIPTION = "Tools and utility software for the Xen hypervisor"
> >
> > -COMPATIBLE_HOST = 'i686-.*-linux|(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
> > -
> >  inherit setuptools3 update-rc.d systemd deploy
> >  require xen-blktap.inc
> >
> > diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> > index 9e8fcad..8277939 100644
> > --- a/recipes-extended/xen/xen.inc
> > +++ b/recipes-extended/xen/xen.inc
> > @@ -2,6 +2,8 @@ HOMEPAGE = "http://xen.org"
> >  LICENSE = "GPLv2"
> >  SECTION = "console/tools"
> >
> > +COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
> > +
> >  inherit autotools-brokensep
> >
> >  require xen-arch.inc
> > --
> > 2.30.2
> >
