Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.11435.1600170447257209889
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 15 Sep 2020 04:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nSfWTojQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id k14so2743509edo.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 15 Sep 2020 04:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=48loEGdvbKZpAJO65cz4qy/+ShuLVSzwZh9ufuUaoqw=;
        b=nSfWTojQeelcbIJDoDS+ukGoaTh0QCKR7wc24OYm7lApLyZ93IbJ079y44v5XcQCdO
         +1En76Oo/k855XHoDgwshi/6CBPPAAat5Zb/fhQhBtVicKtIoA0cmJZXHE3Qu+6s61BG
         rRf+drczpDBx/lL79+4aTolRjuu6c3phM+C4/fB5GlSybEVfujxg+1Ob4f7zmuGTVWKB
         BMo1HhWUHi2vyBvxegnQl79mdlctHJUW0QZnNcP6LGALXlKacVuuzxsNtHWr2qJswSs7
         bueGsusbEloqKuyRzlzsgPfO+/j0vvAu5oVLOLgqkqXRp7agOm9xnICDCNgiULd908NZ
         Y6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=48loEGdvbKZpAJO65cz4qy/+ShuLVSzwZh9ufuUaoqw=;
        b=QRgixcWuVFxQkyglio9ULa28DasROjMVhWW+kgydsSmipG9fJIZAQ19Zu4NW8O7452
         WViXCPF8W663Sz7LvK/sP4Unqn98Z18k/zsVvWs39rHw3Xz5aQBnWNI8FHId87rpMUWQ
         RQed+rTbG4vXxxZPcmpR3MD/OTOQ+mEpKZhMxM9j73gUG6BZ2edLNrPX7iQO7PLjHTSe
         UTldmyrpqfEFZW4jJdmY7VX2fHVoSNwaWwx6qaEFQaKuGfqiCLsLNA32NTIWFD3SYHMp
         ZZUfi1jDqxR9sib7JPj1H3aLCVTsLfJL6vp25xvBgY4kSh0TJOkHlYUCQV74bbGCLid7
         zoTg==
X-Gm-Message-State: AOAM531zXi7LJIvgW5TOZxFTjzHqGihF9Yhl0YG22MjsDcv1oL93olKz
	J1xZuCAsN5J8TvR8svvTJzZlPr0AZX8lJWMV8qc=
X-Google-Smtp-Source: ABdhPJzHYxCCyF9BDqwusz874QFiXxYKpYwP8h/Xw6xJcUPnNXJHC1iuq5s4eLCDEATJm0ihTaQnccfBT2awHWU5NbQ=
X-Received: by 2002:a50:abc3:: with SMTP id u61mr21283568edc.129.1600170445520;
 Tue, 15 Sep 2020 04:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200915064803.14962-1-hongxu.jia@windriver.com>
In-Reply-To: <20200915064803.14962-1-hongxu.jia@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 15 Sep 2020 07:45:56 -0400
Message-ID: <CADkTA4PL9qgNrc0vSLr=RbLA6s_fFhUfnh=2=RrDRevOihOsYA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/2] skopeo: upgrade to 1.1.1
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 15, 2020 at 2:48 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> - Drop ostree

We should be logging the skopeo commit that drops the support.

>
> - Support native and nativesdk
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../skopeo/{skopeo_git.bb => skopeo_1.1.1.bb} | 50 +++++--------------
>  1 file changed, 12 insertions(+), 38 deletions(-)
>  rename recipes-containers/skopeo/{skopeo_git.bb => skopeo_1.1.1.bb} (33%)
>
> diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_1.1.1.bb
> similarity index 33%
> rename from recipes-containers/skopeo/skopeo_git.bb
> rename to recipes-containers/skopeo/skopeo_1.1.1.bb
> index f5a6231..ca23ac6 100644
> --- a/recipes-containers/skopeo/skopeo_git.bb
> +++ b/recipes-containers/skopeo/skopeo_1.1.1.bb
> @@ -1,14 +1,14 @@
>  HOMEPAGE = "https://github.com/containers/skopeo"
>  SUMMARY = "Work with remote images registries - retrieving information, images, signing content"
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=7e611105d3e369954840a6668c438584"
> +LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=7e611105d3e369954840a6668c438584"
>
>  DEPENDS = " \
>      gpgme \
> -    multipath-tools \
> +    libdevmapper \
> +    lvm2 \
>      btrfs-tools \
>      glib-2.0 \
> -    ostree \
>  "
>
>  inherit go
> @@ -17,64 +17,38 @@ RDEPENDS_${PN} = " \
>       gpgme \
>       libgpg-error \
>       libassuan \
> +     libdevmapper \
>  "
>
>  SRC_URI = " \
> -    git://github.com/containers/skopeo \
> +    git://${GO_IMPORT};branch=release-1.1 \

Leave this as github.com, GO_IMPORT makes this unreadable. It can be used
below, but not in the SRC_URI.

>      file://storage.conf \
>      file://registries.conf \
>  "
>
> -SRCREV = "1cf1e06582142c522543560f2bc6d6756696e8ad"
> -PV = "v0.1.39-dev+git${SRCPV}"

I don't like removing the PV and then having to re-add it constantly.

So although this is for now on a specific release, I want the PV with
+git to stay, since it is only going to be exactly on 1.1 for a very
small amount of time.

Cheers,

Bruce

> -GO_IMPORT = "import"
> +SRCREV = "67abbb3cefbdc876447583d5ea45e76bf441eba7"
> +GO_IMPORT = "github.com/containers/skopeo"
>
>  S = "${WORKDIR}/git"
>
>  inherit goarch
>  inherit pkgconfig
>
> -# This disables seccomp and apparmor, which are on by default in the
> -# go package.
> -EXTRA_OEMAKE="BUILDTAGS=''"
> -
>  do_compile() {
> -       export GOARCH="${TARGET_GOARCH}"
> -
> -       # Setup vendor directory so that it can be used in GOPATH.
> -       #
> -       # Go looks in a src directory under any directory in GOPATH but riddler
> -       # uses 'vendor' instead of 'vendor/src'. We can fix this with a symlink.
> -       #
> -       # We also need to link in the ipallocator directory as that is not under
> -       # a src directory.
> -       ln -sfn . "${S}/src/import/vendor/src"
> -       mkdir -p "${S}/src/import/vendor/src/github.com/projectatomic/skopeo"
> -       ln -sfn "${S}/src/import/skopeo" "${S}/src/import/vendor/src/github.com/projectatomic/skopeo"
> -       ln -sfn "${S}/src/import/version" "${S}/src/import/vendor/src/github.com/projectatomic/skopeo/version"
> -       export GOPATH="${S}/src/import/vendor"
> -
> -       # Pass the needed cflags/ldflags so that cgo
> -       # can find the needed headers files and libraries
> -       export CGO_ENABLED="1"
> -       export CFLAGS=""
> -       export LDFLAGS=""
> -       export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> -       export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> -       cd ${S}/src/import
> -
> +       cd ${S}/src/${GO_IMPORT}
>         oe_runmake binary-local
>  }
>
>  do_install() {
>         install -d ${D}/${sbindir}
>         install -d ${D}/${sysconfdir}/containers
> -
> -       install ${S}/src/import/skopeo ${D}/${sbindir}/
> -       install ${S}/src/import/default-policy.json ${D}/${sysconfdir}/containers/policy.json
> +       install ${S}/src/${GO_IMPORT}/skopeo ${D}/${sbindir}/
> +       install ${S}/src/${GO_IMPORT}/default-policy.json ${D}/${sysconfdir}/containers/policy.json
>
>         install ${WORKDIR}/storage.conf ${D}/${sysconfdir}/containers/storage.conf
>         install ${WORKDIR}/registries.conf ${D}/${sysconfdir}/containers/registries.conf
>  }
>
>  INSANE_SKIP_${PN} += "ldflags"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.18.2
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
