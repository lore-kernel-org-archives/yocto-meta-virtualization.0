Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web09.3867.1618801233985234671
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 18 Apr 2021 20:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dTEJCWoC;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id y136so2461455qkb.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 18 Apr 2021 20:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=gq9RkMZd23m42db51R3UWhYSELCDOl1DMDLv/W2DvPo=;
        b=dTEJCWoCbwsDoXJqC9TRIxxIo79vh0E88g8n1hHjk1JXxXqSDOlWOryLGFjOJU8cHY
         Teq6bKoeUNjU5WCBrNzM6TCV0E2Uunmb/Vbnf6kOcaUdZeTd17HCpkMSbTYJrg9PfszQ
         BD6P10H/S1YbvZ0HOkNMajRi/Zs74qeTAoB9oeorxpR8mezNnLXjBBZkhFWhjmxLmPHU
         ar5Njn6LeST6UEYKBGScWUMnqJS4kXC7nG83eFpDLflkTgZQnTEBltdmtiMW7pw/Fbap
         vAUylHDceoI92E3qate2YLXImpwS1YBOIz2WxVi1eijTc7HyAYtqn0ABYpAgKR+H9JcT
         5X+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gq9RkMZd23m42db51R3UWhYSELCDOl1DMDLv/W2DvPo=;
        b=KQX4KioV/AvClvPGPM2PhBMpQnNq6fMLvRSQTM4i4rK4XFyuMxpMZdI6CSvAg2MkyZ
         yRWBcQ/yWHRK1owCTpRtTnnXoN32qczXrC0v7KSNACk5BVThMMXo3cde2Z0JgVWXMGil
         sHCYf5Ct/uDpkGywsp5H9zzIN79xW1Tmz7QjC7lUNaf2UTaO5D5jpYryYQZ0mE9VSUw4
         1h+QdHkI7JPl5PE/B4EFWxBpTDUBzk8An7xJrv7xB/miCuT6LAa19GhXFs+EzpGepJsA
         EQ1WiObwW2o9C2/Odk1XCzbQlGrNQ48RksS0+59lezw3nmS6pJ1VtqPF/vdFmxe2aGWs
         Jn/g==
X-Gm-Message-State: AOAM5329EmuccYvHDJrnNvINGDE7FciRKR62BLEvJG2+L9sgKRdVVwiB
	fegNd1mSLYtNMOpRB86jDjc=
X-Google-Smtp-Source: ABdhPJytmd4CT1JuZnpL7INmDoFN6Hxt2o6ZREp62BZ/OJnKK0oCxeZuirzLe5jh77RNPhyr3ngA5w==
X-Received: by 2002:a05:620a:6c1:: with SMTP id 1mr10297649qky.198.1618801232890;
        Sun, 18 Apr 2021 20:00:32 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id 8sm8939559qkb.32.2021.04.18.20.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 20:00:32 -0700 (PDT)
Date: Sun, 18 Apr 2021 23:00:30 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, cardoe@gentoo.org,
	bertrand.marquis@arm.com, martin.jansa@gmail.com
Subject: Re: [meta-virtualization][PATCH v3 1/6] xen-tools: fix 32-bit x86 build by setting pvshim configure flags
Message-ID: <20210419030029.GC61503@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210416184136.71992-2-christopher.w.clark@gmail.com>
 <20210416184136.71992-3-christopher.w.clark@gmail.com>
 <20210416184136.71992-4-christopher.w.clark@gmail.com>
 <20210416184136.71992-5-christopher.w.clark@gmail.com>
 <20210416184136.71992-6-christopher.w.clark@gmail.com>
 <20210416184136.71992-1-christopher.w.clark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I've merged v3.

I also have a patch on master to bump the default version to 4.15,
but ran into a syslinux build issue (unrelated) that I'm sorting
out.

When I have that 4.15 build tested, I'll push it as well.

To confirm, we also want to remove 4.14 from master ? I've
done that as well, but would like an Ack before I push it.

Cheers,

Bruce

In message: [meta-virtualization][PATCH v3 1/6] xen-tools: fix 32-bit x86 build by setting pvshim configure flags
on 16/04/2021 Christopher Clark wrote:

> Enable building the PV shim for x86_64 only.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  recipes-extended/xen/xen.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 9e8fcad..2fbdb3a 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -125,6 +125,7 @@ EXTRA_OECONF += " \
>      --disable-rombios \
>      --disable-ocamltools \
>      --disable-qemu-traditional \
> +    ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', '--enable-pvshim', '--disable-pvshim', d)} \
>      "
>  
>  EXTRA_OEMAKE += "STDVGA_ROM=${STAGING_DIR_HOST}/usr/share/firmware/vgabios-0.7a.bin"
> -- 
> 2.25.1
> 

In message: [meta-virtualization][PATCH v3 6/6] xtf-image: add a new image for the Xen Test Framework
on 16/04/2021 Christopher Clark wrote:

> Testing the Xen hypervisor, with the qemux86-64 MACHINE:
>     runqemu xtf-image nographic slirp
>         (login as root)
>         cd /usr/libexec/xtf
>         ./xtf-runner --list pv
>         # run an example test:
>         ./xtf-runner test-pv64-livepatch-priv-check
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  recipes-extended/images/xtf-image.bb | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 recipes-extended/images/xtf-image.bb
> 
> diff --git a/recipes-extended/images/xtf-image.bb b/recipes-extended/images/xtf-image.bb
> new file mode 100644
> index 0000000..3f9af25
> --- /dev/null
> +++ b/recipes-extended/images/xtf-image.bb
> @@ -0,0 +1,24 @@
> +require recipes-extended/images/xen-image-minimal.bb
> +DESCRIPTION = "A minimal Xen Test Framework (XTF) image for testing the Xen hypervisor"
> +
> +# To run XTF tests with an image built for the qemux86-64 MACHINE:
> +#
> +#   runqemu xtf-image nographic slirp
> +#       (login as root)
> +#       # xtf-runner expects to be run from the top of the tests directory:
> +#       cd /usr/libexec/xtf
> +#       # list the tests available for PV guest types:
> +#       ./xtf-runner --list pv
> +#       # run an example test:
> +#       ./xtf-runner test-pv64-livepatch-priv-check
> +
> +IMAGE_NAME="xtf"
> +
> +IMAGE_INSTALL_append = " xtf"
> +
> +QB_DEFAULT_FSTYPE = "wic"
> +
> +# Set the dom0 memory level lower than that assigned to qemu so that Xen has
> +# some available memory for allocating to the XTF microkernel guests to run:
> +QB_MEM = "-m 400"
> +SYSLINUX_XEN_ARGS_append = " dom0_mem=256M"
> -- 
> 2.25.1
> 

In message: [meta-virtualization][PATCH v3 5/6] xtf: introduce recipe for the Xen Test Framework
on 16/04/2021 Christopher Clark wrote:

> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  recipes-extended/xen/xtf_git.bb | 72 +++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 recipes-extended/xen/xtf_git.bb
> 
> diff --git a/recipes-extended/xen/xtf_git.bb b/recipes-extended/xen/xtf_git.bb
> new file mode 100644
> index 0000000..db08643
> --- /dev/null
> +++ b/recipes-extended/xen/xtf_git.bb
> @@ -0,0 +1,72 @@
> +SUMMARY = "Xen Test Framework"
> +HOMEPAGE = "https://xenbits.xenproject.org/docs/xtf/"
> +LICENSE = "BSD-2-Clause"
> +
> +# For additional reference on XTF, please see:
> +# https://static.sched.com/hosted_files/xendeveloperanddesignsummit2017/79/xtf.pdf
> +
> +SRC_URI = "git://xenbits.xen.org/xtf"
> +SRCREV = "8ab15139728a8efd3ebbb60beb16a958a6a93fa1"
> +
> +COMPATIBLE_HOST = '(x86_64.*).*-linux'
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=a5680865974e05cf0510615ee1d745d8"
> +
> +PV = "0+git${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit python3native
> +
> +# To build 32-bit binaries some files from 32-bit glibc are needed.
> +# To enable multilib, please add the following to your local.conf -:
> +#
> +#    require conf/multilib.conf
> +#    MULTILIBS = "multilib:lib32"
> +#    DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> +
> +# Use this multilib prefix for x86 32-bit to match local.conf:
> +MLPREFIX32 = "lib32-"
> +# Add the multilib 32-bit glibc to DEPENDS only when necessary:
> +# The DEPENDS on a multilib 32-bit glibc is only added when target is x86-64
> +# This x86-64 override is never intended for native use, so clear that.
> +GLIBC32 = ""
> +GLIBC32_x86-64 = "${MLPREFIX32}glibc"
> +GLIBC32_class-native = ""
> +DEPENDS += "${GLIBC32}"
> +
> +PACKAGES = "${PN}"
> +
> +FILES_${PN} = " \
> +    ${libexecdir}/* \
> +    "
> +
> +RDEPENDS_${PN} = " \
> +    xen-tools-xl \
> +    python3 \
> +    "
> +
> +do_compile() {
> +    oe_runmake CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} -I${RECIPE_SYSROOT}/../${MLPREFIX32}recipe-sysroot/usr/include" \
> +               CPP="${CPP}" \
> +               OBJCOPY="${OBJCOPY}" \
> +               PYTHON="${PYTHON}"
> +    # switch the shebang to python3
> +    sed 's,^\(#!/usr/bin/env python\)$,\13,' -i "${B}/xtf-runner"
> +}
> +
> +do_install() {
> +    # packaging: rpmbuild can package the XTF test unikernels when they are
> +    # installed as non-executable files (they are run within VMs anyway).
> +    oe_runmake install DESTDIR="${D}" \
> +                       xtfdir="${libexecdir}/${BPN}" \
> +                       PYTHON="${PYTHON}" \
> +                       INSTALL_PROGRAM="install -m 644 -p"
> +    install -m 755 -p "${B}/xtf-runner" "${D}${libexecdir}/${BPN}/xtf-runner"
> +}
> +
> +INSANE_SKIP = "arch"
> +# xen-tools-xl is a runtime but not build time dependency
> +INSANE_SKIP_${PN} = "build-deps"
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> -- 
> 2.25.1
> 

In message: [meta-virtualization][PATCH v3 4/6] xen, xen-tools: Document the version update process in README
on 16/04/2021 Christopher Clark wrote:

> Describes the versions of Xen to be included in meta-virtualization
> and recipe maintenance in release branches.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  recipes-extended/xen/README | 50 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/recipes-extended/xen/README b/recipes-extended/xen/README
> index f286bb5..b9117f0 100644
> --- a/recipes-extended/xen/README
> +++ b/recipes-extended/xen/README
> @@ -36,3 +36,53 @@ as XSAs (http://xenbits.xen.org/xsa/). The easiest way to include those is to
>  drop patches in 'recipes-extened/xen/files' and create a bbappend adding those
>  patches to SRC_URI and they will be applied. Alternatively, you can override
>  the SRC_URI to a git repo you provide that contains the patches.
> +
> +recipe maintenance
> +------------------
> +
> +# Xen version update
> +
> +The following rules shall be followed to define which versions of Xen have
> +recipes in meta-virtualization:
> +
> +- Before a Yocto release meta-virtualization shall have recipes for:
> +    - the latest stable major version of Xen, and
> +
> +    - the current version of the Xen master branch (known as the git recipes)
> +
> +    - In addition, there may also be recipes included for the previous stable
> +      major version of Xen, in the case where the latest stable major version
> +      is new and the prior stable major version of Xen is to be the preferred
> +      version for the Yocto release
> +
> +- On Yocto LTS and the latest stable Yocto release branch, the preferred Xen
> +  major version that is present when the Yocto release is issued must stay
> +  supported and the recipes shall be regularly updated to follow updates
> +  available in the Xen stable branch for that Xen major release.
> +
> +- On Yocto LTS and the latest stable Yocto release branch, the recipes for the
> +  latest Xen major version shall also be regularly updated to follow updates
> +  available in the Xen stable branch for that Xen major release.
> +
> +- On the master / in-development Yocto branch, new Xen recipes shall be added
> +  when there is a new Xen major release.
> +
> +    - depending on the timing of the next Yocto release, the new recipes may
> +      be preferred, or the prior major version recipes may remain preferred
> +      until after the Yocto release
> +
> +    - the recipes for the previous Xen stable major version shall be removed
> +      from the branch when it is no longer the preferred Xen version
> +
> +- On Yocto LTS and the latest stable Yocto release branch, new Xen recipes
> +  shall be added when there is a new Xen major release.
> +
> +    - The preferred version of the Xen recipes shall always stay at the same
> +      Xen major version once a Yocto release has been issued, and shall receive
> +      regular updates to track the stable Xen branch of that Xen release.
> +
> +    - When new Xen recipes are added to a Yocto branch for a new Xen major
> +      version, then any older Xen recipes present, except for the original
> +      preferred version recipes, shall be marked as not updated anymore by
> +      adding a comment inside the recipes. The older recipes will not receive
> +      any build tests or be updated to follow the Xen branch.
> -- 
> 2.25.1
> 

In message: [meta-virtualization][PATCH v3 3/6] xen, xen-tools: uprev git recipes after 4.15 release
on 16/04/2021 Christopher Clark wrote:

> Updated to the branch point for 4.16 development.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  recipes-extended/xen/xen-tools_git.bb | 4 ++--
>  recipes-extended/xen/xen_git.bb       | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen/xen-tools_git.bb
> index 71850ee..0188bdd 100644
> --- a/recipes-extended/xen/xen-tools_git.bb
> +++ b/recipes-extended/xen/xen-tools_git.bb
> @@ -1,6 +1,6 @@
> -SRCREV ?= "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
> +SRCREV ?= "e680cc48b7184d3489873d6776f84ba1fc238ced"
>  
> -XEN_REL ?= "4.15"
> +XEN_REL ?= "4.16"
>  XEN_BRANCH ?= "master"
>  
>  SRC_URI = " \
> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
> index 2b62c5c..eaf3956 100644
> --- a/recipes-extended/xen/xen_git.bb
> +++ b/recipes-extended/xen/xen_git.bb
> @@ -1,6 +1,6 @@
> -SRCREV ?= "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
> +SRCREV ?= "e680cc48b7184d3489873d6776f84ba1fc238ced"
>  
> -XEN_REL ?= "4.15"
> +XEN_REL ?= "4.16"
>  XEN_BRANCH ?= "master"
>  
>  SRC_URI = " \
> -- 
> 2.25.1
> 

In message: [meta-virtualization][PATCH v3 2/6] xen, xen-tools: add recipes for new stable Xen 4.15 release
on 16/04/2021 Christopher Clark wrote:

> The recipes are introduced as the non-default version by adding an
> expressed PREFERRED_VERSION for 4.14 in:
>     conf/distro/include/meta-virt-default-versions.inc
> 
> to keep the Xen 4.14 recipes as default for the Hardknott release.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
>  .../include/meta-virt-default-versions.inc    |  3 ++-
>  recipes-extended/xen/xen-tools_4.15.bb        | 18 ++++++++++++++++++
>  recipes-extended/xen/xen_4.15.bb              | 19 +++++++++++++++++++
>  3 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-extended/xen/xen-tools_4.15.bb
>  create mode 100644 recipes-extended/xen/xen_4.15.bb
> 
> diff --git a/conf/distro/include/meta-virt-default-versions.inc b/conf/distro/include/meta-virt-default-versions.inc
> index 299b5df..b85827b 100644
> --- a/conf/distro/include/meta-virt-default-versions.inc
> +++ b/conf/distro/include/meta-virt-default-versions.inc
> @@ -1,3 +1,4 @@
>  # Meta-virtuailization PREFERED_VERSION
>  
> -# placeholder for preferred versions
> +PREFERRED_VERSION_xen ?= "4.14+stable%"
> +PREFERRED_VERSION_xen-tools ?= "4.14+stable%"
> diff --git a/recipes-extended/xen/xen-tools_4.15.bb b/recipes-extended/xen/xen-tools_4.15.bb
> new file mode 100644
> index 0000000..314dc52
> --- /dev/null
> +++ b/recipes-extended/xen/xen-tools_4.15.bb
> @@ -0,0 +1,18 @@
> +SRCREV ?= "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
> +
> +XEN_REL ?= "4.15"
> +XEN_BRANCH ?= "stable-${XEN_REL}"
> +
> +SRC_URI = " \
> +    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
> +    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> +    "
> +
> +LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> +
> +PV = "${XEN_REL}+stable${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +require xen.inc
> +require xen-tools.inc
> diff --git a/recipes-extended/xen/xen_4.15.bb b/recipes-extended/xen/xen_4.15.bb
> new file mode 100644
> index 0000000..2842c0a
> --- /dev/null
> +++ b/recipes-extended/xen/xen_4.15.bb
> @@ -0,0 +1,19 @@
> +SRCREV ?= "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
> +
> +XEN_REL ?= "4.15"
> +XEN_BRANCH ?= "stable-${XEN_REL}"
> +
> +SRC_URI = " \
> +    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
> +    file://xen-arm64-implement-atomic-fetch-add.patch \
> +    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
> +    "
> +
> +LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> +
> +PV = "${XEN_REL}+stable${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +require xen.inc
> +require xen-hypervisor.inc
> -- 
> 2.25.1
> 

