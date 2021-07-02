Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.9481.1625232249733457665
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 02 Jul 2021 06:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IwmYNZoI;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id i20so15795087ejw.4
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 02 Jul 2021 06:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=quFfhM556I7g7GaQl0G0Y1bwqbKAp7bKhBP2Y+ZweHw=;
        b=IwmYNZoIsu9B8nFJXlto/pH3s4scT0oaS1/xFxeOUn22vUbvCMdXBVqMe3ZMNAaKo3
         FnqBR4FGroX3dR++W7Woxj9FFqJPgWNwa3hPoxQIpcSpQSDbKAk5qCOP0X1KMzD7zTzL
         fXCH02KnYgFRz9yyR6Om1zzySh8iQXsSZjXHUYar/3TGtW02jhpjiczMxEtGQEJcP716
         LTqEe2iCPiype/vlukVXuoUAFTmuoId6QG7bgnxZc7R4IbvmCJR8veQbMiKfN0kWGv1p
         UJ2qdrj/jbiUd2btp6WT4XOPSDGG+4QQOBObs5e7cfr/fd2Exn/wQ3hyIm7hEGrvZKlh
         Q0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=quFfhM556I7g7GaQl0G0Y1bwqbKAp7bKhBP2Y+ZweHw=;
        b=VfF8+jOpOjNSkagLdvfH4woNBFVb59jmJgeNgwCw+ZdQ3mTtlBXEinKKE2cCOh8hBW
         9tblbdPOnnF45zHTsKQt5bwgMsAWb6Gi1h4FSO/W2Yf1rDljHOe/txl6+YsrJ5oFZzBc
         nqs5JHaP9SyjMZJam0j8TLFH9+HJ6ERzo0l2LX0kzah14P/lM2oi6g5YIT2ARsD3+9mD
         QbnHhxVZ82rdlKKnnS0jpfDLB8do2/+RbwT8utWoVDb9hT15Op8OeQZm3D9kadktmh3M
         ZaaJgtraJgLkVHtkpj0pMRUbTYo6mMPSGZ/uPaEMU66iw26gKugA0fh7GdBQgFysmAfo
         HehA==
X-Gm-Message-State: AOAM533rvlHBzhaBcF9iLV0SyvAaFuIAapUP7EYglKyAONXOQvbPuRIG
	zO3oatMU5K0H9iTmASnPWDrzwwOSaTu7XzMe1uI=
X-Google-Smtp-Source: ABdhPJwsXEBTQu4UNcwyuv+scQuFtqHhDSzb4iPTHQ2vKJ6RkKWH3xDA8zLpv7BrsKgpigGMcZH5RVasRJrcCMmw1OQ=
X-Received: by 2002:a17:906:c2cf:: with SMTP id ch15mr5310611ejb.517.1625232246498;
 Fri, 02 Jul 2021 06:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <168DEA6BA6D7C3F7.26864@lists.yoctoproject.org> <9477d86d-e33d-d726-b0ee-2693e655e8bd@windriver.com>
In-Reply-To: <9477d86d-e33d-d726-b0ee-2693e655e8bd@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 2 Jul 2021 09:23:55 -0400
Message-ID: <CADkTA4PnFfL5Ro_9WmRD8jMdgG5-zMJT+6tsMQjOJJNQk3hcwQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] umoci: rework recipe
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 2, 2021 at 4:11 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> On 7/2/21 3:59 PM, hongxu wrote:
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
>
> Hi Bruce,
>
> About native umoci, I've no idea about the patchelf testing, I directly run native umoci -h in my build
>

I have a whole series of OCI image construction changes that do need
that static support. both sloci and umoci run in some unique ways to
do the image work, hence why it must be static and isolated from the
defaults.

Once I get 5.13 into oe-core as the default kernel, I'll be returning
to that image work.

Cheers,

Bruce

> ...
>
> $ image/buildarea/raid5/hjia/wrlinux-20/lat_deb_061621/build-binary/tmp-glibc/work/x86_64-linux/umoci-native/0.4.6-r0/recipe-sysroot-native/usr/bin/umoci -h
> NAME:
>    umoci - umoci modifies Open Container images
>
> USAGE:
>    umoci [global options] command [command options] [arguments...]
>
> VERSION:
>    unknown
>
> AUTHOR:
>    Aleksa Sarai <asarai@suse.com>
>
> COMMANDS:
>    raw      advanced internal image tooling
>    help, h  Shows a list of commands or help for one command
>
>    image:
>      config      modifies the image configuration of an OCI image
>      unpack      unpacks a reference into an OCI runtime bundle
>      repack      repacks an OCI runtime bundle into a reference
>      new         creates a blank tagged OCI image
>      tag         creates a new tag in an OCI image
>      remove, rm  removes a tag from an OCI image
>      stat        displays status information of an image manifest
>      insert      insert content into an OCI image
>
>    layout:
>      gc        garbage-collects an OCI image's blobs
>      init      create a new OCI layout
>      list, ls  lists the set of tags in an OCI layout
>
> GLOBAL OPTIONS:
>    --verbose      alias for --log=info
>    --log value    set the log level (debug, info, [warn], error, fatal) (default: "warn")
>    --help, -h     show help
>    --version, -v  print the version
>
> ...
>
> //Hongxu
>
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
>
>
> 
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
