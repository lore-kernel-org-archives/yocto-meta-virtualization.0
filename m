Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.8996.1625230629287661941
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 02 Jul 2021 05:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OFm2FhZD;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id t3so13062231edt.12
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 02 Jul 2021 05:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JIeQJ/l/dKCfcamsXfStQZhD5soyK/hqX77+lT+am+M=;
        b=OFm2FhZDw0MT9fZHLwzP43FrtFOL/+jRMhd2G4XxI1kBiJ6iiTjO2AiaAEX3Y564ZM
         3dN1xuD8Q3j9PxTelzSKMH+QOne5WXL+z25qAdRSt2hD4GOtQQhs8WzCDv1f5C/BYmWY
         4/fIugCgh7wjY1/aAi2L5vlpZfTHqoabSwB0DWc6dtFI38A7b0dPskFTd/6QwG7a1tc1
         6II01MW5OXKqMggl01FYa12y4Rldgiu9/ARyIEIoYNFIE2099tt4aAO9B51vfuR8EJlx
         hIThonIvlOJExaVtN5EpJqvKXzztHNb8ipIjefzSciHRv6U3qczJXx2iDki10zGmOT05
         79Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JIeQJ/l/dKCfcamsXfStQZhD5soyK/hqX77+lT+am+M=;
        b=QQD8UUdb2mVdU0bvdfo6DuF5uY1xZDYxwB2xQDYqQiIyrJbP/MVTqPNuXDsXdDPy/z
         pGOfwW0iUqNdpB28CzCuMZuib+oP8bFOZWwSeLZeVr2p0q4B6WhShwsSb5P8yIqZvipT
         7UduKEG3wl0LzRKd3LEXRZkJ2vY6EKVK885D5sLNdnRr8tfohF6m4clI58qgsreELKe5
         PqM/HU+Njgi44CGHoeQQHr2MFl6x7TqqsX0W+FtfhpIs14CqngwT3t9nbNZP3JpQd7lQ
         d2vEmamUd+1pwWPyYclH8DVXtFfhce9yl4vlU2d/uuimcOgI7OuEjlrHnpbymbMDk4t6
         nPww==
X-Gm-Message-State: AOAM532n5K8+D3crZumjrvSF9qEFgu4TPDT6FQsARy54gz6Hn3zsyTPr
	Jk4+G0Cps/jE0KZPV4934Z3OsRSg2+1J011ZYo4=
X-Google-Smtp-Source: ABdhPJw9nowmuPjjVNh+1lB0488bbH/1ZHC2UvmpBhYmQaPRxw+0e8KZMt3xC8yg0dBnHJC6lbKh2VSfcM1DVZzKUDU=
X-Received: by 2002:a05:6402:90a:: with SMTP id g10mr6588558edz.365.1625230627478;
 Fri, 02 Jul 2021 05:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210702075942.37015-1-hongxu.jia@windriver.com>
In-Reply-To: <20210702075942.37015-1-hongxu.jia@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 2 Jul 2021 08:56:56 -0400
Message-ID: <CADkTA4NdcdQSQSLKBFrvJwDXsUMz85W4X5zLr+naLSWcP63f6w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] umoci: rework recipe
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 2, 2021 at 3:59 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> 1. tweak homepage
>
> 2. Use go_do_compile of go bbclass in oe-core to replace
>    the do_compile in recipe, variables such as LD,CC,
>    CFLAGS, CGO_CFLAGS will be set automatically
>
> 3. Use go_do_install of go bbclass in oe-core to replace
>    the do_install in recipe, all necessary will be installed
>
> 4. export GO111MODULE=off globally
>
> 5. Skip file-rdeps insane for umoci dev packages since scripts
>    in umoci dev packages contains awk, bash shebang
>

Hmm. no. We need to keep all of the local parts of this recipe, it
needs to stay somewhat the bbclasses in oe-core, due to the way it
changes over time.

What we have works, and I'll leave it as-is.

cheers,

Bruce

> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-containers/umoci/umoci_git.bb | 75 ++++-----------------------
>  1 file changed, 10 insertions(+), 65 deletions(-)
>
> diff --git a/recipes-containers/umoci/umoci_git.bb b/recipes-containers/umoci/umoci_git.bb
> index f83a35a7..c4007eb3 100644
> --- a/recipes-containers/umoci/umoci_git.bb
> +++ b/recipes-containers/umoci/umoci_git.bb
> @@ -1,80 +1,25 @@
> -HOMEPAGE = "https://github.com/openSUSE/umoci"
> +HOMEPAGE = "https://umo.ci"
>  SUMMARY = "umoci modifies Open Container images"
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
>  RDEPENDS_${PN} = "skopeo"
>  RDEPENDS_${PN}_class-native = ""
>
> -SRCREV_umoci = "758044fc26ad65eb900143e90d1e22c2d6e4484d"
> -SRC_URI = "git://github.com/opencontainers/umoci.git;branch=master;name=umoci;destsuffix=github.com/opencontainers/umoci \
> -          "
> +SRCREV = "758044fc26ad65eb900143e90d1e22c2d6e4484d"
> +SRC_URI = " \
> +    git://${GO_IMPORT}; \
> +"
>
>  PV = "v0.4.7-dev+git${SRCPV}"
> -S = "${WORKDIR}/github.com/opencontainers/umoci"
> +S = "${WORKDIR}/git"
>  GO_IMPORT = "github.com/opencontainers/umoci"
>
>  inherit goarch
>  inherit go
>
> -# This disables seccomp and apparmor, which are on by default in the
> -# go package.
> -EXTRA_OEMAKE="BUILDTAGS=''"
> +export GO111MODULE="off"
>
> -
> -do_compile_class-native () {
> -    export GOARCH="${BUILD_GOARCH}"
> -
> -    # Pass the needed cflags/ldflags so that cgo can find the needed headers files and libraries
> -    export CGO_ENABLED="1"
> -    export CFLAGS="${BUILD_CFLAGS}"
> -    export LDFLAGS="${BUILD_LDFLAGS}"
> -    export CGO_CFLAGS="${BUILD_CFLAGS}"
> -
> -    # as of go 1.15.5, there are some flags the CGO doesn't like. Rather than
> -    # clearing them all, we sed away the ones we don't want.
> -    # export CGO_LDFLAGS="$(echo ${BUILD_LDFLAGS} | sed 's/-Wl,-O1//g' | sed 's/-Wl,--dynamic-linker.*?( \|$\)//g')"
> -    export CC="${BUILD_CC}"
> -    export LD="${BUILD_LD}"
> -
> -    export GOPATH="${WORKDIR}/git/"
> -    export GO111MODULE=off
> -
> -    cd ${S}
> -
> -    # why static ? patchelf will be run on dynamic binaries and it breaks
> -    # the executable (coredump)
> -    # https://forum.snapcraft.io/t/patchelf-broke-my-binary/4928
> -    # https://github.com/NixOS/patchelf/issues/146
> -    oe_runmake umoci.static
> -
> -    # so the common install can find our binary
> -    cp umoci.static umoci
> -}
> -
> -do_compile() {
> -    export GOARCH="${TARGET_GOARCH}"
> -    export GOPATH="${WORKDIR}/git/"
> -
> -    # Pass the needed cflags/ldflags so that cgo
> -    # can find the needed headers files and libraries
> -    export CGO_ENABLED="1"
> -    export CFLAGS=""
> -    export LDFLAGS=""
> -    export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> -    export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> -
> -    export GO111MODULE=off
> -
> -    cd ${S}
> -
> -    oe_runmake umoci
> -}
> -
> -do_install() {
> -    install -d ${D}/${sbindir}
> -    install ${S}/umoci ${D}/${sbindir}
> -}
> -
> -INSANE_SKIP_${PN} += "ldflags already-stripped"
> +INSANE_SKIP_${PN}-dev += "file-rdeps"
> +INSANE_SKIP_${PN} += "already-stripped"
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.27.0
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
