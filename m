Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.8349.1618835862146575633
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 05:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lXStuj1Y;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id v6so51370979ejo.6
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 19 Apr 2021 05:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eWTF+er42O4mOn6dhUt1m/S3dJFiFHFJT3Gtapntpws=;
        b=lXStuj1Yw1UkUIyj8+iXOv9FmMriMihXDN6AqAJSoERMGbjAHyL05mHSntpnXWvs9u
         qC0udq0m2wDNqvaYUeDImItlkmbctypHFHxOXN+maRt1vca4pfFX25jNbDUyYFTVJdcl
         yP4yakbuZuybZjp/ynkL5J9x2FyZTHZcndgsiuBkXXpJCgS0jYm4qjKpaT+18J0wK3Vj
         Sm8MfaEnJdvVLF2SnON8y2ucziPa93GK1sCt1DUQNyWxfTiK7ukohZx7GGL8BbDuBDKr
         gw5srSsWHWq1/5bK7iNlCr5XwjkpTgxAUetQV1m64tN5IFiwbJ146QyIwflY7OnGRU3j
         56WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eWTF+er42O4mOn6dhUt1m/S3dJFiFHFJT3Gtapntpws=;
        b=t2KRJjfWVvmG5HbymOm0DLjIwQPxbvB5lXrBNaKA/DFMpkULdEtnuLfka2ACAoxlJc
         WtBHFE3jcfnLMJpVZTeARfnARocNmmFLeqhEAMZRohCepCTLSWvp1GGMTWT0vS6WW1qf
         6dk5/prW0EWXtXDWt1Ksr0MTNpBRkU+dUNIQ8VC3P5gnGKNz94kULsXA+78WJbnPG0jv
         dpS4GhuFyNCTkucPEbm8sC1nyTFyuv+lGMZYmTG42ISBAq/fUfOH6M3pLoWTuSfYU46i
         acMX4jvbdO8Lr9MQwZXsZBeUhpKS3wPYowDW6+lehu1JbZFWh0x1To6rtEsads//yNum
         39KQ==
X-Gm-Message-State: AOAM533ZDoMBNHaxPzJXt5p9qsgEDTscUsNVtwLVmQDPRoJ2Lzx1Fq41
	9xulMAMcKsdUzOv9QUTGxds7GkOzM2pKcPUJEJQ=
X-Google-Smtp-Source: ABdhPJwFVNk8LAzs42wdCfZPtFX336yFAAneK6RCXom4wb0OQIlCEQm3UJJHjE40RxBpUPmTeTTD+InC3paGV5Fvehs=
X-Received: by 2002:a17:906:a103:: with SMTP id t3mr22183507ejy.334.1618835860530;
 Mon, 19 Apr 2021 05:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210419030029.GC61503@gmail.com> <72C465B9-BCC7-46D6-8FB9-B013476E68E9@arm.com>
In-Reply-To: <72C465B9-BCC7-46D6-8FB9-B013476E68E9@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 19 Apr 2021 08:37:29 -0400
Message-ID: <CADkTA4Mv3gPV6b0gawcggeAWpBtW=fDanQb0r9mcOtnTAzywFA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v3 1/6] xen-tools: fix 32-bit x86 build by setting pvshim configure flags
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	Doug Goldstein <cardoe@gentoo.org>, "martin.jansa@gmail.com" <martin.jansa@gmail.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 19, 2021 at 3:48 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Bruce,
>
> > On 19 Apr 2021, at 04:00, Bruce Ashfield via lists.yoctoproject.org <bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
> >
> > I've merged v3.
> >
> > I also have a patch on master to bump the default version to 4.15,
> > but ran into a syslinux build issue (unrelated) that I'm sorting
> > out.
>
> If you share it, I could help do some testing with that.

It's just the single patch on top of the master-next I just pushed.

>
> >
> > When I have that 4.15 build tested, I'll push it as well.
> >
> > To confirm, we also want to remove 4.14 from master ? I've
> > done that as well, but would like an Ack before I push it.
>
> Could I request to wait some time to do that ?
> This would ease the transition on my side (and for some people using what we do).
>
> Something like a month would be great.

I dropped the patch from master-next for now, and can re-apply it in a
month or so.

Bruce

>
> Regards
> Bertrand
>
> >
> > Cheers,
> >
> > Bruce
> >
> > In message: [meta-virtualization][PATCH v3 1/6] xen-tools: fix 32-bit x86 build by setting pvshim configure flags
> > on 16/04/2021 Christopher Clark wrote:
> >
> >> Enable building the PV shim for x86_64 only.
> >>
> >> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> >> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> recipes-extended/xen/xen.inc | 1 +
> >> 1 file changed, 1 insertion(+)
> >>
> >> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> >> index 9e8fcad..2fbdb3a 100644
> >> --- a/recipes-extended/xen/xen.inc
> >> +++ b/recipes-extended/xen/xen.inc
> >> @@ -125,6 +125,7 @@ EXTRA_OECONF += " \
> >>     --disable-rombios \
> >>     --disable-ocamltools \
> >>     --disable-qemu-traditional \
> >> +    ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', '--enable-pvshim', '--disable-pvshim', d)} \
> >>     "
> >>
> >> EXTRA_OEMAKE += "STDVGA_ROM=${STAGING_DIR_HOST}/usr/share/firmware/vgabios-0.7a.bin"
> >> --
> >> 2.25.1
> >>
> >
> > In message: [meta-virtualization][PATCH v3 6/6] xtf-image: add a new image for the Xen Test Framework
> > on 16/04/2021 Christopher Clark wrote:
> >
> >> Testing the Xen hypervisor, with the qemux86-64 MACHINE:
> >>    runqemu xtf-image nographic slirp
> >>        (login as root)
> >>        cd /usr/libexec/xtf
> >>        ./xtf-runner --list pv
> >>        # run an example test:
> >>        ./xtf-runner test-pv64-livepatch-priv-check
> >>
> >> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> >> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> recipes-extended/images/xtf-image.bb | 24 ++++++++++++++++++++++++
> >> 1 file changed, 24 insertions(+)
> >> create mode 100644 recipes-extended/images/xtf-image.bb
> >>
> >> diff --git a/recipes-extended/images/xtf-image.bb b/recipes-extended/images/xtf-image.bb
> >> new file mode 100644
> >> index 0000000..3f9af25
> >> --- /dev/null
> >> +++ b/recipes-extended/images/xtf-image.bb
> >> @@ -0,0 +1,24 @@
> >> +require recipes-extended/images/xen-image-minimal.bb
> >> +DESCRIPTION = "A minimal Xen Test Framework (XTF) image for testing the Xen hypervisor"
> >> +
> >> +# To run XTF tests with an image built for the qemux86-64 MACHINE:
> >> +#
> >> +#   runqemu xtf-image nographic slirp
> >> +#       (login as root)
> >> +#       # xtf-runner expects to be run from the top of the tests directory:
> >> +#       cd /usr/libexec/xtf
> >> +#       # list the tests available for PV guest types:
> >> +#       ./xtf-runner --list pv
> >> +#       # run an example test:
> >> +#       ./xtf-runner test-pv64-livepatch-priv-check
> >> +
> >> +IMAGE_NAME="xtf"
> >> +
> >> +IMAGE_INSTALL_append = " xtf"
> >> +
> >> +QB_DEFAULT_FSTYPE = "wic"
> >> +
> >> +# Set the dom0 memory level lower than that assigned to qemu so that Xen has
> >> +# some available memory for allocating to the XTF microkernel guests to run:
> >> +QB_MEM = "-m 400"
> >> +SYSLINUX_XEN_ARGS_append = " dom0_mem=256M"
> >> --
> >> 2.25.1
> >>
> >
> > In message: [meta-virtualization][PATCH v3 5/6] xtf: introduce recipe for the Xen Test Framework
> > on 16/04/2021 Christopher Clark wrote:
> >
> >> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> >> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> recipes-extended/xen/xtf_git.bb | 72 +++++++++++++++++++++++++++++++++
> >> 1 file changed, 72 insertions(+)
> >> create mode 100644 recipes-extended/xen/xtf_git.bb
> >>
> >> diff --git a/recipes-extended/xen/xtf_git.bb b/recipes-extended/xen/xtf_git.bb
> >> new file mode 100644
> >> index 0000000..db08643
> >> --- /dev/null
> >> +++ b/recipes-extended/xen/xtf_git.bb
> >> @@ -0,0 +1,72 @@
> >> +SUMMARY = "Xen Test Framework"
> >> +HOMEPAGE = "https://xenbits.xenproject.org/docs/xtf/"
> >> +LICENSE = "BSD-2-Clause"
> >> +
> >> +# For additional reference on XTF, please see:
> >> +# https://static.sched.com/hosted_files/xendeveloperanddesignsummit2017/79/xtf.pdf
> >> +
> >> +SRC_URI = "git://xenbits.xen.org/xtf"
> >> +SRCREV = "8ab15139728a8efd3ebbb60beb16a958a6a93fa1"
> >> +
> >> +COMPATIBLE_HOST = '(x86_64.*).*-linux'
> >> +
> >> +LIC_FILES_CHKSUM = "file://COPYING;md5=a5680865974e05cf0510615ee1d745d8"
> >> +
> >> +PV = "0+git${SRCPV}"
> >> +
> >> +S = "${WORKDIR}/git"
> >> +
> >> +inherit python3native
> >> +
> >> +# To build 32-bit binaries some files from 32-bit glibc are needed.
> >> +# To enable multilib, please add the following to your local.conf -:
> >> +#
> >> +#    require conf/multilib.conf
> >> +#    MULTILIBS = "multilib:lib32"
> >> +#    DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> >> +
> >> +# Use this multilib prefix for x86 32-bit to match local.conf:
> >> +MLPREFIX32 = "lib32-"
> >> +# Add the multilib 32-bit glibc to DEPENDS only when necessary:
> >> +# The DEPENDS on a multilib 32-bit glibc is only added when target is x86-64
> >> +# This x86-64 override is never intended for native use, so clear that.
> >> +GLIBC32 = ""
> >> +GLIBC32_x86-64 = "${MLPREFIX32}glibc"
> >> +GLIBC32_class-native = ""
> >> +DEPENDS += "${GLIBC32}"
> >> +
> >> +PACKAGES = "${PN}"
> >> +
> >> +FILES_${PN} = " \
> >> +    ${libexecdir}/* \
> >> +    "
> >> +
> >> +RDEPENDS_${PN} = " \
> >> +    xen-tools-xl \
> >> +    python3 \
> >> +    "
> >> +
> >> +do_compile() {
> >> +    oe_runmake CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} -I${RECIPE_SYSROOT}/../${MLPREFIX32}recipe-sysroot/usr/include" \
> >> +               CPP="${CPP}" \
> >> +               OBJCOPY="${OBJCOPY}" \
> >> +               PYTHON="${PYTHON}"
> >> +    # switch the shebang to python3
> >> +    sed 's,^\(#!/usr/bin/env python\)$,\13,' -i "${B}/xtf-runner"
> >> +}
> >> +
> >> +do_install() {
> >> +    # packaging: rpmbuild can package the XTF test unikernels when they are
> >> +    # installed as non-executable files (they are run within VMs anyway).
> >> +    oe_runmake install DESTDIR="${D}" \
> >> +                       xtfdir="${libexecdir}/${BPN}" \
> >> +                       PYTHON="${PYTHON}" \
> >> +                       INSTALL_PROGRAM="install -m 644 -p"
> >> +    install -m 755 -p "${B}/xtf-runner" "${D}${libexecdir}/${BPN}/xtf-runner"
> >> +}
> >> +
> >> +INSANE_SKIP = "arch"
> >> +# xen-tools-xl is a runtime but not build time dependency
> >> +INSANE_SKIP_${PN} = "build-deps"
> >> +INHIBIT_PACKAGE_STRIP = "1"
> >> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> >> --
> >> 2.25.1
> >>
> >
> > In message: [meta-virtualization][PATCH v3 4/6] xen, xen-tools: Document the version update process in README
> > on 16/04/2021 Christopher Clark wrote:
> >
> >> Describes the versions of Xen to be included in meta-virtualization
> >> and recipe maintenance in release branches.
> >>
> >> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> >> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> recipes-extended/xen/README | 50 +++++++++++++++++++++++++++++++++++++
> >> 1 file changed, 50 insertions(+)
> >>
> >> diff --git a/recipes-extended/xen/README b/recipes-extended/xen/README
> >> index f286bb5..b9117f0 100644
> >> --- a/recipes-extended/xen/README
> >> +++ b/recipes-extended/xen/README
> >> @@ -36,3 +36,53 @@ as XSAs (http://xenbits.xen.org/xsa/). The easiest way to include those is to
> >> drop patches in 'recipes-extened/xen/files' and create a bbappend adding those
> >> patches to SRC_URI and they will be applied. Alternatively, you can override
> >> the SRC_URI to a git repo you provide that contains the patches.
> >> +
> >> +recipe maintenance
> >> +------------------
> >> +
> >> +# Xen version update
> >> +
> >> +The following rules shall be followed to define which versions of Xen have
> >> +recipes in meta-virtualization:
> >> +
> >> +- Before a Yocto release meta-virtualization shall have recipes for:
> >> +    - the latest stable major version of Xen, and
> >> +
> >> +    - the current version of the Xen master branch (known as the git recipes)
> >> +
> >> +    - In addition, there may also be recipes included for the previous stable
> >> +      major version of Xen, in the case where the latest stable major version
> >> +      is new and the prior stable major version of Xen is to be the preferred
> >> +      version for the Yocto release
> >> +
> >> +- On Yocto LTS and the latest stable Yocto release branch, the preferred Xen
> >> +  major version that is present when the Yocto release is issued must stay
> >> +  supported and the recipes shall be regularly updated to follow updates
> >> +  available in the Xen stable branch for that Xen major release.
> >> +
> >> +- On Yocto LTS and the latest stable Yocto release branch, the recipes for the
> >> +  latest Xen major version shall also be regularly updated to follow updates
> >> +  available in the Xen stable branch for that Xen major release.
> >> +
> >> +- On the master / in-development Yocto branch, new Xen recipes shall be added
> >> +  when there is a new Xen major release.
> >> +
> >> +    - depending on the timing of the next Yocto release, the new recipes may
> >> +      be preferred, or the prior major version recipes may remain preferred
> >> +      until after the Yocto release
> >> +
> >> +    - the recipes for the previous Xen stable major version shall be removed
> >> +      from the branch when it is no longer the preferred Xen version
> >> +
> >> +- On Yocto LTS and the latest stable Yocto release branch, new Xen recipes
> >> +  shall be added when there is a new Xen major release.
> >> +
> >> +    - The preferred version of the Xen recipes shall always stay at the same
> >> +      Xen major version once a Yocto release has been issued, and shall receive
> >> +      regular updates to track the stable Xen branch of that Xen release.
> >> +
> >> +    - When new Xen recipes are added to a Yocto branch for a new Xen major
> >> +      version, then any older Xen recipes present, except for the original
> >> +      preferred version recipes, shall be marked as not updated anymore by
> >> +      adding a comment inside the recipes. The older recipes will not receive
> >> +      any build tests or be updated to follow the Xen branch.
> >> --
> >> 2.25.1
> >>
> >
> > In message: [meta-virtualization][PATCH v3 3/6] xen, xen-tools: uprev git recipes after 4.15 release
> > on 16/04/2021 Christopher Clark wrote:
> >
> >> Updated to the branch point for 4.16 development.
> >>
> >> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> >> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> recipes-extended/xen/xen-tools_git.bb | 4 ++--
> >> recipes-extended/xen/xen_git.bb       | 4 ++--
> >> 2 files changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen/xen-tools_git.bb
> >> index 71850ee..0188bdd 100644
> >> --- a/recipes-extended/xen/xen-tools_git.bb
> >> +++ b/recipes-extended/xen/xen-tools_git.bb
> >> @@ -1,6 +1,6 @@
> >> -SRCREV ?= "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
> >> +SRCREV ?= "e680cc48b7184d3489873d6776f84ba1fc238ced"
> >>
> >> -XEN_REL ?= "4.15"
> >> +XEN_REL ?= "4.16"
> >> XEN_BRANCH ?= "master"
> >>
> >> SRC_URI = " \
> >> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
> >> index 2b62c5c..eaf3956 100644
> >> --- a/recipes-extended/xen/xen_git.bb
> >> +++ b/recipes-extended/xen/xen_git.bb
> >> @@ -1,6 +1,6 @@
> >> -SRCREV ?= "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
> >> +SRCREV ?= "e680cc48b7184d3489873d6776f84ba1fc238ced"
> >>
> >> -XEN_REL ?= "4.15"
> >> +XEN_REL ?= "4.16"
> >> XEN_BRANCH ?= "master"
> >>
> >> SRC_URI = " \
> >> --
> >> 2.25.1
> >>
> >
> > In message: [meta-virtualization][PATCH v3 2/6] xen, xen-tools: add recipes for new stable Xen 4.15 release
> > on 16/04/2021 Christopher Clark wrote:
> >
> >> The recipes are introduced as the non-default version by adding an
> >> expressed PREFERRED_VERSION for 4.14 in:
> >>    conf/distro/include/meta-virt-default-versions.inc
> >>
> >> to keep the Xen 4.14 recipes as default for the Hardknott release.
> >>
> >> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> >> ---
> >> .../include/meta-virt-default-versions.inc    |  3 ++-
> >> recipes-extended/xen/xen-tools_4.15.bb        | 18 ++++++++++++++++++
> >> recipes-extended/xen/xen_4.15.bb              | 19 +++++++++++++++++++
> >> 3 files changed, 39 insertions(+), 1 deletion(-)
> >> create mode 100644 recipes-extended/xen/xen-tools_4.15.bb
> >> create mode 100644 recipes-extended/xen/xen_4.15.bb
> >>
> >> diff --git a/conf/distro/include/meta-virt-default-versions.inc b/conf/distro/include/meta-virt-default-versions.inc
> >> index 299b5df..b85827b 100644
> >> --- a/conf/distro/include/meta-virt-default-versions.inc
> >> +++ b/conf/distro/include/meta-virt-default-versions.inc
> >> @@ -1,3 +1,4 @@
> >> # Meta-virtuailization PREFERED_VERSION
> >>
> >> -# placeholder for preferred versions
> >> +PREFERRED_VERSION_xen ?= "4.14+stable%"
> >> +PREFERRED_VERSION_xen-tools ?= "4.14+stable%"
> >> diff --git a/recipes-extended/xen/xen-tools_4.15.bb b/recipes-extended/xen/xen-tools_4.15.bb
> >> new file mode 100644
> >> index 0000000..314dc52
> >> --- /dev/null
> >> +++ b/recipes-extended/xen/xen-tools_4.15.bb
> >> @@ -0,0 +1,18 @@
> >> +SRCREV ?= "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
> >> +
> >> +XEN_REL ?= "4.15"
> >> +XEN_BRANCH ?= "stable-${XEN_REL}"
> >> +
> >> +SRC_URI = " \
> >> +    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
> >> +    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> >> +    "
> >> +
> >> +LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> >> +
> >> +PV = "${XEN_REL}+stable${SRCPV}"
> >> +
> >> +S = "${WORKDIR}/git"
> >> +
> >> +require xen.inc
> >> +require xen-tools.inc
> >> diff --git a/recipes-extended/xen/xen_4.15.bb b/recipes-extended/xen/xen_4.15.bb
> >> new file mode 100644
> >> index 0000000..2842c0a
> >> --- /dev/null
> >> +++ b/recipes-extended/xen/xen_4.15.bb
> >> @@ -0,0 +1,19 @@
> >> +SRCREV ?= "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
> >> +
> >> +XEN_REL ?= "4.15"
> >> +XEN_BRANCH ?= "stable-${XEN_REL}"
> >> +
> >> +SRC_URI = " \
> >> +    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
> >> +    file://xen-arm64-implement-atomic-fetch-add.patch \
> >> +    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
> >> +    "
> >> +
> >> +LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> >> +
> >> +PV = "${XEN_REL}+stable${SRCPV}"
> >> +
> >> +S = "${WORKDIR}/git"
> >> +
> >> +require xen.inc
> >> +require xen-hypervisor.inc
> >> --
> >> 2.25.1
> >>
> >
> >
> > 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
