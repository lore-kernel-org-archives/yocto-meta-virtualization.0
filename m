Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.9373.1625231560936855266
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 02 Jul 2021 06:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JBB/HTyD;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id hc16so16040338ejc.12
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 02 Jul 2021 06:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oKFAN5PESq2PT6ZtW4kUbwV8/X3pBKZMI9DI7P3egGc=;
        b=JBB/HTyDOx2tGFAznCfde1qI6sBL8vQn1lomJtnwaKAn/7jsn/IgWWcgDyMY8zUyjl
         /S2bPUlnOC8rsuAiWeA1xE1TKunEHeQYEKd2tQ9vUTtjZqX5Zjc4Q482lOkWwZrXUpOU
         EquLjOuxdcIkvIIrtAdUlap+05VE8C/cDqwRTfEeZm1caPML3hNEfKIJ7o5onku1JLq0
         oDBi9FZ3J3z2pi+B4Xh3Am9NMbg+IK0tTVbWGe1hrOmuhiQcr6DJlM9unJ+FXNbfMnPF
         Sm3y2zMeDWcUVsg7MfklhjsshLa7RpoLu9fPOMWpkM74AIfTko8yC+V5IwYujr8YAxEL
         Suow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oKFAN5PESq2PT6ZtW4kUbwV8/X3pBKZMI9DI7P3egGc=;
        b=J/8nUpFUplxzbDRHb/xVgI7ieNe/+Hw2kr1C2KCNeU9hmVOorjZPPlts81uE7qEVTT
         b1GwhezN2093PXu7w/0j5DXnZYpg0gKWytF2j1mJNo7+Ckyd7bWWyYNh1C5MPkq059fv
         ykyiTTOvVamI1we01AniU3yaMfdg+Oie6mFLhl2omwHYiPqkdVCJGx+Ugbo8bwb+ZKe1
         W0njXFAj/mEWKFg9W2a6Vr8X/0PqyyY2bPY3jQ7XXQbEjPmALP70hXr3zHoCHXgHzg4z
         bFyPUr0OJtQyLAHMsSESq43eTMsCn+xGjUpDfQvtr/lwDdBX3A2c+HhhrK+JVi9V5emT
         U/3A==
X-Gm-Message-State: AOAM530bXah68f/LGSzCj2eQLzR3lqURDlV2AlvWdw9S4z0I44wl/o0B
	FqMeGhoitucBQZL46ZWRd2I6VapzLolpyAIUr6o=
X-Google-Smtp-Source: ABdhPJz3UoiZKRW1lIOCPR5rmcuqTu6mC3w0FavRP54zxFgS5M5TyTfnWyP4UqYn3QxFenqZinwQk2SwWZOyxXMRMuo=
X-Received: by 2002:a17:906:2cca:: with SMTP id r10mr5082864ejr.298.1625231559166;
 Fri, 02 Jul 2021 06:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210702075942.37015-1-hongxu.jia@windriver.com> <168DFAA59EFCBE06.30759@lists.yoctoproject.org>
In-Reply-To: <168DFAA59EFCBE06.30759@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 2 Jul 2021 09:12:28 -0400
Message-ID: <CADkTA4NFipXx59_rYdgxJY0p1k7SrJhxAYAQ-EWADTnNXoX2EQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] umoci: rework recipe
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Hongxu Jia <hongxu.jia@windriver.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 2, 2021 at 8:57 AM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> On Fri, Jul 2, 2021 at 3:59 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
> >
> > 1. tweak homepage
> >
> > 2. Use go_do_compile of go bbclass in oe-core to replace
> >    the do_compile in recipe, variables such as LD,CC,
> >    CFLAGS, CGO_CFLAGS will be set automatically
> >
> > 3. Use go_do_install of go bbclass in oe-core to replace
> >    the do_install in recipe, all necessary will be installed
> >
> > 4. export GO111MODULE=off globally
> >
> > 5. Skip file-rdeps insane for umoci dev packages since scripts
> >    in umoci dev packages contains awk, bash shebang
> >
>
> Hmm. no. We need to keep all of the local parts of this recipe, it
> needs to stay somewhat the bbclasses in oe-core, due to the way it
> changes over time.
>
> What we have works, and I'll leave it as-is.

I should add that there is a middle ground.

Leave the source layout as-is, and the explicit compile/install
routines in place. If there are some variables that can now safely
take defaults from the bbclass, we can use those. But dropping the
recipe structure as it stands, and using the default routines (which
have lost me days and weeks of time over the years), isn't going to
make it into the tree as-is.

Bruce

>
> cheers,
>
> Bruce
>
> > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > ---
> >  recipes-containers/umoci/umoci_git.bb | 75 ++++-----------------------
> >  1 file changed, 10 insertions(+), 65 deletions(-)
> >
> > diff --git a/recipes-containers/umoci/umoci_git.bb b/recipes-containers/umoci/umoci_git.bb
> > index f83a35a7..c4007eb3 100644
> > --- a/recipes-containers/umoci/umoci_git.bb
> > +++ b/recipes-containers/umoci/umoci_git.bb
> > @@ -1,80 +1,25 @@
> > -HOMEPAGE = "https://github.com/openSUSE/umoci"
> > +HOMEPAGE = "https://umo.ci"
> >  SUMMARY = "umoci modifies Open Container images"
> >  LICENSE = "Apache-2.0"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
> > +LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
> >
> >  RDEPENDS_${PN} = "skopeo"
> >  RDEPENDS_${PN}_class-native = ""
> >
> > -SRCREV_umoci = "758044fc26ad65eb900143e90d1e22c2d6e4484d"
> > -SRC_URI = "git://github.com/opencontainers/umoci.git;branch=master;name=umoci;destsuffix=github.com/opencontainers/umoci \
> > -          "
> > +SRCREV = "758044fc26ad65eb900143e90d1e22c2d6e4484d"
> > +SRC_URI = " \
> > +    git://${GO_IMPORT}; \
> > +"
> >
> >  PV = "v0.4.7-dev+git${SRCPV}"
> > -S = "${WORKDIR}/github.com/opencontainers/umoci"
> > +S = "${WORKDIR}/git"
> >  GO_IMPORT = "github.com/opencontainers/umoci"
> >
> >  inherit goarch
> >  inherit go
> >
> > -# This disables seccomp and apparmor, which are on by default in the
> > -# go package.
> > -EXTRA_OEMAKE="BUILDTAGS=''"
> > +export GO111MODULE="off"
> >
> > -
> > -do_compile_class-native () {
> > -    export GOARCH="${BUILD_GOARCH}"
> > -
> > -    # Pass the needed cflags/ldflags so that cgo can find the needed headers files and libraries
> > -    export CGO_ENABLED="1"
> > -    export CFLAGS="${BUILD_CFLAGS}"
> > -    export LDFLAGS="${BUILD_LDFLAGS}"
> > -    export CGO_CFLAGS="${BUILD_CFLAGS}"
> > -
> > -    # as of go 1.15.5, there are some flags the CGO doesn't like. Rather than
> > -    # clearing them all, we sed away the ones we don't want.
> > -    # export CGO_LDFLAGS="$(echo ${BUILD_LDFLAGS} | sed 's/-Wl,-O1//g' | sed 's/-Wl,--dynamic-linker.*?( \|$\)//g')"
> > -    export CC="${BUILD_CC}"
> > -    export LD="${BUILD_LD}"
> > -
> > -    export GOPATH="${WORKDIR}/git/"
> > -    export GO111MODULE=off
> > -
> > -    cd ${S}
> > -
> > -    # why static ? patchelf will be run on dynamic binaries and it breaks
> > -    # the executable (coredump)
> > -    # https://forum.snapcraft.io/t/patchelf-broke-my-binary/4928
> > -    # https://github.com/NixOS/patchelf/issues/146
> > -    oe_runmake umoci.static
> > -
> > -    # so the common install can find our binary
> > -    cp umoci.static umoci
> > -}
> > -
> > -do_compile() {
> > -    export GOARCH="${TARGET_GOARCH}"
> > -    export GOPATH="${WORKDIR}/git/"
> > -
> > -    # Pass the needed cflags/ldflags so that cgo
> > -    # can find the needed headers files and libraries
> > -    export CGO_ENABLED="1"
> > -    export CFLAGS=""
> > -    export LDFLAGS=""
> > -    export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> > -    export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> > -
> > -    export GO111MODULE=off
> > -
> > -    cd ${S}
> > -
> > -    oe_runmake umoci
> > -}
> > -
> > -do_install() {
> > -    install -d ${D}/${sbindir}
> > -    install ${S}/umoci ${D}/${sbindir}
> > -}
> > -
> > -INSANE_SKIP_${PN} += "ldflags already-stripped"
> > +INSANE_SKIP_${PN}-dev += "file-rdeps"
> > +INSANE_SKIP_${PN} += "already-stripped"
> >  BBCLASSEXTEND = "native nativesdk"
> > --
> > 2.27.0
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
