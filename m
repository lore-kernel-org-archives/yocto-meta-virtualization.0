Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web08.10368.1618844123085935263
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 07:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MOEdeHIc;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id d21so20985684edv.9
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 19 Apr 2021 07:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1J+DbS8W6thul3G4eTRIJ4GGiEqk7NuNBwNt1Ywe+6Y=;
        b=MOEdeHIcMF0oh6YK0xF7w4SA4UJqFKtjd5CTkmOqgCyoV+3DXWxG+6jhzkZz7ArxS2
         xb2NRIi0FeS2oYQNMEeSGoE4MdczMuZIPJCY7VDfRKYMfhqTTFydcWF5unMaxRhLxaQB
         0jqg7zHAjDcnTQlk46yG2dAtJyX86ff5g6qgbqsGkh0b89DWm/uBkQYiwlOgLEdyI7be
         WHxJRHEKuXI/Wf0SIhi2l92vEhz7h14+SONHHtPWy65D5pho+9fpSqt4daRKAPkUE7/B
         XMlsEx41g9OJ5jJ0FwkjBLhysSdJAmYYz7VmdEWMmJl8CevXmHmMV5yDlAnKppL8suMy
         unWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1J+DbS8W6thul3G4eTRIJ4GGiEqk7NuNBwNt1Ywe+6Y=;
        b=VU3seP9sOU2ppx5o/vXU2quA6wlv28KpIi8UN4YhiDwUWnpgpjYZE+O+zdKoMc7nxK
         rXUCQfdpqmjn4DaQfXFZhC0s3FSKqOUQAdxLHJuSxpVbqjgXG8pOSYlMPFKTCSI+/K3G
         91cTVTZcWsgIwYkYuUNEwA7Ny8t3QiQ9I6in/uL1+d996totXJlW/Y0OrsWgUMMh9ef1
         qloMNzsedbfLsrbFIk5PQzw/HueyyENlmjrVI7vxK/B636R8cOarBxRmbzlBpdygjjYW
         +Z/ed7mY5uuWDOpEUvyYlD6fYSdr7YNzwgQG5ewRHcupW7X/kOIVouQ+bFpbfQUjk00V
         OioQ==
X-Gm-Message-State: AOAM532QVOGz0FKs+dqqTW2HciGxaeuQWQMtONsc02U/Y/IL1dS4xtia
	iPIeXAtreZhB9G7WT5wYxfT3KPyLgJ11T8shuY8=
X-Google-Smtp-Source: ABdhPJwZE/FKJjB163VSHqx9QC15bSwM1enUledqZ73t2c9972fLYJXumdDSyjF1k/bBPbWMIiB592tOCZPswbM1K84=
X-Received: by 2002:aa7:c789:: with SMTP id n9mr19207884eds.352.1618844121294;
 Mon, 19 Apr 2021 07:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210419030029.GC61503@gmail.com> <72C465B9-BCC7-46D6-8FB9-B013476E68E9@arm.com>
 <CADkTA4Mv3gPV6b0gawcggeAWpBtW=fDanQb0r9mcOtnTAzywFA@mail.gmail.com> <3AAF81FC-4D35-406B-BD16-B4283635D894@arm.com>
In-Reply-To: <3AAF81FC-4D35-406B-BD16-B4283635D894@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 19 Apr 2021 10:55:10 -0400
Message-ID: <CADkTA4MHE=8mhPtnyHP0Qj1EN2pzuf9EsgZFAtfs-MoKaF6K8w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v3 1/6] xen-tools: fix 32-bit x86 build by setting pvshim configure flags
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	Doug Goldstein <cardoe@gentoo.org>, "martin.jansa@gmail.com" <martin.jansa@gmail.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 19, 2021 at 10:48 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Bruce,
>
> > On 19 Apr 2021, at 13:37, Bruce Ashfield <bruce.ashfield@gmail.com> wr=
ote:
> >
> > On Mon, Apr 19, 2021 at 3:48 AM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >> Hi Bruce,
> >>
> >>> On 19 Apr 2021, at 04:00, Bruce Ashfield via lists.yoctoproject.org =
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >>>
> >>> I've merged v3.
> >>>
> >>> I also have a patch on master to bump the default version to 4.15,
> >>> but ran into a syslinux build issue (unrelated) that I'm sorting
> >>> out.
> >>
> >> If you share it, I could help do some testing with that.
> >
> > It's just the single patch on top of the master-next I just pushed.
> >
> >>
> >>>
> >>> When I have that 4.15 build tested, I'll push it as well.
> >>>
> >>> To confirm, we also want to remove 4.14 from master ? I've
> >>> done that as well, but would like an Ack before I push it.
> >>
> >> Could I request to wait some time to do that ?
> >> This would ease the transition on my side (and for some people using =
what we do).
> >>
> >> Something like a month would be great.
> >
> > I dropped the patch from master-next for now, and can re-apply it in a
> > month or so.
> >
>
> So right now on master there is no 4.14 anymore !
>
> Can=E2=80=99t we keep it there ?
> I am not sure i get why master-next has 4.14 but master does not anymore=
.
>

Bad push. Fixed now.

Bruce

> Regards
> Bertrand
>
> > Bruce
> >
> >>
> >> Regards
> >> Bertrand
> >>
> >>>
> >>> Cheers,
> >>>
> >>> Bruce
> >>>
> >>> In message: [meta-virtualization][PATCH v3 1/6] xen-tools: fix 32-bi=
t x86 build by setting pvshim configure flags
> >>> on 16/04/2021 Christopher Clark wrote:
> >>>
> >>>> Enable building the PV shim for x86_64 only.
> >>>>
> >>>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> >>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >>>> ---
> >>>> recipes-extended/xen/xen.inc | 1 +
> >>>> 1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xe=
n.inc
> >>>> index 9e8fcad..2fbdb3a 100644
> >>>> --- a/recipes-extended/xen/xen.inc
> >>>> +++ b/recipes-extended/xen/xen.inc
> >>>> @@ -125,6 +125,7 @@ EXTRA_OECONF +=3D " \
> >>>>    --disable-rombios \
> >>>>    --disable-ocamltools \
> >>>>    --disable-qemu-traditional \
> >>>> +    ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', '--enable-pv=
shim', '--disable-pvshim', d)} \
> >>>>    "
> >>>>
> >>>> EXTRA_OEMAKE +=3D "STDVGA_ROM=3D${STAGING_DIR_HOST}/usr/share/firmw=
are/vgabios-0.7a.bin"
> >>>> --
> >>>> 2.25.1
> >>>>
> >>>
> >>> In message: [meta-virtualization][PATCH v3 6/6] xtf-image: add a new=
 image for the Xen Test Framework
> >>> on 16/04/2021 Christopher Clark wrote:
> >>>
> >>>> Testing the Xen hypervisor, with the qemux86-64 MACHINE:
> >>>>   runqemu xtf-image nographic slirp
> >>>>       (login as root)
> >>>>       cd /usr/libexec/xtf
> >>>>       ./xtf-runner --list pv
> >>>>       # run an example test:
> >>>>       ./xtf-runner test-pv64-livepatch-priv-check
> >>>>
> >>>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> >>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >>>> ---
> >>>> recipes-extended/images/xtf-image.bb | 24 ++++++++++++++++++++++++
> >>>> 1 file changed, 24 insertions(+)
> >>>> create mode 100644 recipes-extended/images/xtf-image.bb
> >>>>
> >>>> diff --git a/recipes-extended/images/xtf-image.bb b/recipes-extende=
d/images/xtf-image.bb
> >>>> new file mode 100644
> >>>> index 0000000..3f9af25
> >>>> --- /dev/null
> >>>> +++ b/recipes-extended/images/xtf-image.bb
> >>>> @@ -0,0 +1,24 @@
> >>>> +require recipes-extended/images/xen-image-minimal.bb
> >>>> +DESCRIPTION =3D "A minimal Xen Test Framework (XTF) image for test=
ing the Xen hypervisor"
> >>>> +
> >>>> +# To run XTF tests with an image built for the qemux86-64 MACHINE:
> >>>> +#
> >>>> +#   runqemu xtf-image nographic slirp
> >>>> +#       (login as root)
> >>>> +#       # xtf-runner expects to be run from the top of the tests d=
irectory:
> >>>> +#       cd /usr/libexec/xtf
> >>>> +#       # list the tests available for PV guest types:
> >>>> +#       ./xtf-runner --list pv
> >>>> +#       # run an example test:
> >>>> +#       ./xtf-runner test-pv64-livepatch-priv-check
> >>>> +
> >>>> +IMAGE_NAME=3D"xtf"
> >>>> +
> >>>> +IMAGE_INSTALL_append =3D " xtf"
> >>>> +
> >>>> +QB_DEFAULT_FSTYPE =3D "wic"
> >>>> +
> >>>> +# Set the dom0 memory level lower than that assigned to qemu so th=
at Xen has
> >>>> +# some available memory for allocating to the XTF microkernel gues=
ts to run:
> >>>> +QB_MEM =3D "-m 400"
> >>>> +SYSLINUX_XEN_ARGS_append =3D " dom0_mem=3D256M"
> >>>> --
> >>>> 2.25.1
> >>>>
> >>>
> >>> In message: [meta-virtualization][PATCH v3 5/6] xtf: introduce recip=
e for the Xen Test Framework
> >>> on 16/04/2021 Christopher Clark wrote:
> >>>
> >>>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> >>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >>>> ---
> >>>> recipes-extended/xen/xtf_git.bb | 72 ++++++++++++++++++++++++++++++=
+++
> >>>> 1 file changed, 72 insertions(+)
> >>>> create mode 100644 recipes-extended/xen/xtf_git.bb
> >>>>
> >>>> diff --git a/recipes-extended/xen/xtf_git.bb b/recipes-extended/xen=
/xtf_git.bb
> >>>> new file mode 100644
> >>>> index 0000000..db08643
> >>>> --- /dev/null
> >>>> +++ b/recipes-extended/xen/xtf_git.bb
> >>>> @@ -0,0 +1,72 @@
> >>>> +SUMMARY =3D "Xen Test Framework"
> >>>> +HOMEPAGE =3D "https://xenbits.xenproject.org/docs/xtf/"
> >>>> +LICENSE =3D "BSD-2-Clause"
> >>>> +
> >>>> +# For additional reference on XTF, please see:
> >>>> +# https://static.sched.com/hosted_files/xendeveloperanddesignsummi=
t2017/79/xtf.pdf
> >>>> +
> >>>> +SRC_URI =3D "git://xenbits.xen.org/xtf"
> >>>> +SRCREV =3D "8ab15139728a8efd3ebbb60beb16a958a6a93fa1"
> >>>> +
> >>>> +COMPATIBLE_HOST =3D '(x86_64.*).*-linux'
> >>>> +
> >>>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da5680865974e05cf0510615=
ee1d745d8"
> >>>> +
> >>>> +PV =3D "0+git${SRCPV}"
> >>>> +
> >>>> +S =3D "${WORKDIR}/git"
> >>>> +
> >>>> +inherit python3native
> >>>> +
> >>>> +# To build 32-bit binaries some files from 32-bit glibc are needed=
.
> >>>> +# To enable multilib, please add the following to your local.conf =
-:
> >>>> +#
> >>>> +#    require conf/multilib.conf
> >>>> +#    MULTILIBS =3D "multilib:lib32"
> >>>> +#    DEFAULTTUNE_virtclass-multilib-lib32 =3D "x86"
> >>>> +
> >>>> +# Use this multilib prefix for x86 32-bit to match local.conf:
> >>>> +MLPREFIX32 =3D "lib32-"
> >>>> +# Add the multilib 32-bit glibc to DEPENDS only when necessary:
> >>>> +# The DEPENDS on a multilib 32-bit glibc is only added when target=
 is x86-64
> >>>> +# This x86-64 override is never intended for native use, so clear =
that.
> >>>> +GLIBC32 =3D ""
> >>>> +GLIBC32_x86-64 =3D "${MLPREFIX32}glibc"
> >>>> +GLIBC32_class-native =3D ""
> >>>> +DEPENDS +=3D "${GLIBC32}"
> >>>> +
> >>>> +PACKAGES =3D "${PN}"
> >>>> +
> >>>> +FILES_${PN} =3D " \
> >>>> +    ${libexecdir}/* \
> >>>> +    "
> >>>> +
> >>>> +RDEPENDS_${PN} =3D " \
> >>>> +    xen-tools-xl \
> >>>> +    python3 \
> >>>> +    "
> >>>> +
> >>>> +do_compile() {
> >>>> +    oe_runmake CC=3D"${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} -I${=
RECIPE_SYSROOT}/../${MLPREFIX32}recipe-sysroot/usr/include" \
> >>>> +               CPP=3D"${CPP}" \
> >>>> +               OBJCOPY=3D"${OBJCOPY}" \
> >>>> +               PYTHON=3D"${PYTHON}"
> >>>> +    # switch the shebang to python3
> >>>> +    sed 's,^\(#!/usr/bin/env python\)$,\13,' -i "${B}/xtf-runner"
> >>>> +}
> >>>> +
> >>>> +do_install() {
> >>>> +    # packaging: rpmbuild can package the XTF test unikernels when=
 they are
> >>>> +    # installed as non-executable files (they are run within VMs a=
nyway).
> >>>> +    oe_runmake install DESTDIR=3D"${D}" \
> >>>> +                       xtfdir=3D"${libexecdir}/${BPN}" \
> >>>> +                       PYTHON=3D"${PYTHON}" \
> >>>> +                       INSTALL_PROGRAM=3D"install -m 644 -p"
> >>>> +    install -m 755 -p "${B}/xtf-runner" "${D}${libexecdir}/${BPN}/=
xtf-runner"
> >>>> +}
> >>>> +
> >>>> +INSANE_SKIP =3D "arch"
> >>>> +# xen-tools-xl is a runtime but not build time dependency
> >>>> +INSANE_SKIP_${PN} =3D "build-deps"
> >>>> +INHIBIT_PACKAGE_STRIP =3D "1"
> >>>> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> >>>> --
> >>>> 2.25.1
> >>>>
> >>>
> >>> In message: [meta-virtualization][PATCH v3 4/6] xen, xen-tools: Docu=
ment the version update process in README
> >>> on 16/04/2021 Christopher Clark wrote:
> >>>
> >>>> Describes the versions of Xen to be included in meta-virtualization
> >>>> and recipe maintenance in release branches.
> >>>>
> >>>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> >>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >>>> ---
> >>>> recipes-extended/xen/README | 50 ++++++++++++++++++++++++++++++++++=
+++
> >>>> 1 file changed, 50 insertions(+)
> >>>>
> >>>> diff --git a/recipes-extended/xen/README b/recipes-extended/xen/REA=
DME
> >>>> index f286bb5..b9117f0 100644
> >>>> --- a/recipes-extended/xen/README
> >>>> +++ b/recipes-extended/xen/README
> >>>> @@ -36,3 +36,53 @@ as XSAs (http://xenbits.xen.org/xsa/). The easie=
st way to include those is to
> >>>> drop patches in 'recipes-extened/xen/files' and create a bbappend a=
dding those
> >>>> patches to SRC_URI and they will be applied. Alternatively, you can=
 override
> >>>> the SRC_URI to a git repo you provide that contains the patches.
> >>>> +
> >>>> +recipe maintenance
> >>>> +------------------
> >>>> +
> >>>> +# Xen version update
> >>>> +
> >>>> +The following rules shall be followed to define which versions of =
Xen have
> >>>> +recipes in meta-virtualization:
> >>>> +
> >>>> +- Before a Yocto release meta-virtualization shall have recipes fo=
r:
> >>>> +    - the latest stable major version of Xen, and
> >>>> +
> >>>> +    - the current version of the Xen master branch (known as the g=
it recipes)
> >>>> +
> >>>> +    - In addition, there may also be recipes included for the prev=
ious stable
> >>>> +      major version of Xen, in the case where the latest stable ma=
jor version
> >>>> +      is new and the prior stable major version of Xen is to be th=
e preferred
> >>>> +      version for the Yocto release
> >>>> +
> >>>> +- On Yocto LTS and the latest stable Yocto release branch, the pre=
ferred Xen
> >>>> +  major version that is present when the Yocto release is issued m=
ust stay
> >>>> +  supported and the recipes shall be regularly updated to follow u=
pdates
> >>>> +  available in the Xen stable branch for that Xen major release.
> >>>> +
> >>>> +- On Yocto LTS and the latest stable Yocto release branch, the rec=
ipes for the
> >>>> +  latest Xen major version shall also be regularly updated to foll=
ow updates
> >>>> +  available in the Xen stable branch for that Xen major release.
> >>>> +
> >>>> +- On the master / in-development Yocto branch, new Xen recipes sha=
ll be added
> >>>> +  when there is a new Xen major release.
> >>>> +
> >>>> +    - depending on the timing of the next Yocto release, the new r=
ecipes may
> >>>> +      be preferred, or the prior major version recipes may remain =
preferred
> >>>> +      until after the Yocto release
> >>>> +
> >>>> +    - the recipes for the previous Xen stable major version shall =
be removed
> >>>> +      from the branch when it is no longer the preferred Xen versi=
on
> >>>> +
> >>>> +- On Yocto LTS and the latest stable Yocto release branch, new Xen=
 recipes
> >>>> +  shall be added when there is a new Xen major release.
> >>>> +
> >>>> +    - The preferred version of the Xen recipes shall always stay a=
t the same
> >>>> +      Xen major version once a Yocto release has been issued, and =
shall receive
> >>>> +      regular updates to track the stable Xen branch of that Xen r=
elease.
> >>>> +
> >>>> +    - When new Xen recipes are added to a Yocto branch for a new X=
en major
> >>>> +      version, then any older Xen recipes present, except for the =
original
> >>>> +      preferred version recipes, shall be marked as not updated an=
ymore by
> >>>> +      adding a comment inside the recipes. The older recipes will =
not receive
> >>>> +      any build tests or be updated to follow the Xen branch.
> >>>> --
> >>>> 2.25.1
> >>>>
> >>>
> >>> In message: [meta-virtualization][PATCH v3 3/6] xen, xen-tools: upre=
v git recipes after 4.15 release
> >>> on 16/04/2021 Christopher Clark wrote:
> >>>
> >>>> Updated to the branch point for 4.16 development.
> >>>>
> >>>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> >>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >>>> ---
> >>>> recipes-extended/xen/xen-tools_git.bb | 4 ++--
> >>>> recipes-extended/xen/xen_git.bb       | 4 ++--
> >>>> 2 files changed, 4 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extend=
ed/xen/xen-tools_git.bb
> >>>> index 71850ee..0188bdd 100644
> >>>> --- a/recipes-extended/xen/xen-tools_git.bb
> >>>> +++ b/recipes-extended/xen/xen-tools_git.bb
> >>>> @@ -1,6 +1,6 @@
> >>>> -SRCREV ?=3D "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
> >>>> +SRCREV ?=3D "e680cc48b7184d3489873d6776f84ba1fc238ced"
> >>>>
> >>>> -XEN_REL ?=3D "4.15"
> >>>> +XEN_REL ?=3D "4.16"
> >>>> XEN_BRANCH ?=3D "master"
> >>>>
> >>>> SRC_URI =3D " \
> >>>> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen=
/xen_git.bb
> >>>> index 2b62c5c..eaf3956 100644
> >>>> --- a/recipes-extended/xen/xen_git.bb
> >>>> +++ b/recipes-extended/xen/xen_git.bb
> >>>> @@ -1,6 +1,6 @@
> >>>> -SRCREV ?=3D "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
> >>>> +SRCREV ?=3D "e680cc48b7184d3489873d6776f84ba1fc238ced"
> >>>>
> >>>> -XEN_REL ?=3D "4.15"
> >>>> +XEN_REL ?=3D "4.16"
> >>>> XEN_BRANCH ?=3D "master"
> >>>>
> >>>> SRC_URI =3D " \
> >>>> --
> >>>> 2.25.1
> >>>>
> >>>
> >>> In message: [meta-virtualization][PATCH v3 2/6] xen, xen-tools: add =
recipes for new stable Xen 4.15 release
> >>> on 16/04/2021 Christopher Clark wrote:
> >>>
> >>>> The recipes are introduced as the non-default version by adding an
> >>>> expressed PREFERRED_VERSION for 4.14 in:
> >>>>   conf/distro/include/meta-virt-default-versions.inc
> >>>>
> >>>> to keep the Xen 4.14 recipes as default for the Hardknott release.
> >>>>
> >>>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> >>>> ---
> >>>> .../include/meta-virt-default-versions.inc    |  3 ++-
> >>>> recipes-extended/xen/xen-tools_4.15.bb        | 18 ++++++++++++++++=
++
> >>>> recipes-extended/xen/xen_4.15.bb              | 19 ++++++++++++++++=
+++
> >>>> 3 files changed, 39 insertions(+), 1 deletion(-)
> >>>> create mode 100644 recipes-extended/xen/xen-tools_4.15.bb
> >>>> create mode 100644 recipes-extended/xen/xen_4.15.bb
> >>>>
> >>>> diff --git a/conf/distro/include/meta-virt-default-versions.inc b/c=
onf/distro/include/meta-virt-default-versions.inc
> >>>> index 299b5df..b85827b 100644
> >>>> --- a/conf/distro/include/meta-virt-default-versions.inc
> >>>> +++ b/conf/distro/include/meta-virt-default-versions.inc
> >>>> @@ -1,3 +1,4 @@
> >>>> # Meta-virtuailization PREFERED_VERSION
> >>>>
> >>>> -# placeholder for preferred versions
> >>>> +PREFERRED_VERSION_xen ?=3D "4.14+stable%"
> >>>> +PREFERRED_VERSION_xen-tools ?=3D "4.14+stable%"
> >>>> diff --git a/recipes-extended/xen/xen-tools_4.15.bb b/recipes-exten=
ded/xen/xen-tools_4.15.bb
> >>>> new file mode 100644
> >>>> index 0000000..314dc52
> >>>> --- /dev/null
> >>>> +++ b/recipes-extended/xen/xen-tools_4.15.bb
> >>>> @@ -0,0 +1,18 @@
> >>>> +SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
> >>>> +
> >>>> +XEN_REL ?=3D "4.15"
> >>>> +XEN_BRANCH ?=3D "stable-${XEN_REL}"
> >>>> +
> >>>> +SRC_URI =3D " \
> >>>> +    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> >>>> +    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> >>>> +    "
> >>>> +
> >>>> +LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501=
338e44a4e5"
> >>>> +
> >>>> +PV =3D "${XEN_REL}+stable${SRCPV}"
> >>>> +
> >>>> +S =3D "${WORKDIR}/git"
> >>>> +
> >>>> +require xen.inc
> >>>> +require xen-tools.inc
> >>>> diff --git a/recipes-extended/xen/xen_4.15.bb b/recipes-extended/xe=
n/xen_4.15.bb
> >>>> new file mode 100644
> >>>> index 0000000..2842c0a
> >>>> --- /dev/null
> >>>> +++ b/recipes-extended/xen/xen_4.15.bb
> >>>> @@ -0,0 +1,19 @@
> >>>> +SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
> >>>> +
> >>>> +XEN_REL ?=3D "4.15"
> >>>> +XEN_BRANCH ?=3D "stable-${XEN_REL}"
> >>>> +
> >>>> +SRC_URI =3D " \
> >>>> +    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> >>>> +    file://xen-arm64-implement-atomic-fetch-add.patch \
> >>>> +    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurse=
s-location.patch \
> >>>> +    "
> >>>> +
> >>>> +LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501=
338e44a4e5"
> >>>> +
> >>>> +PV =3D "${XEN_REL}+stable${SRCPV}"
> >>>> +
> >>>> +S =3D "${WORKDIR}/git"
> >>>> +
> >>>> +require xen.inc
> >>>> +require xen-hypervisor.inc
> >>>> --
> >>>> 2.25.1
> >>>>
> >>>
> >>>
> >>>=20
> >>
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
