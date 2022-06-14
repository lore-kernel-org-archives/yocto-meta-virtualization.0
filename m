Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1DFC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 19:48:46 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.1447.1655236120783509043
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 12:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iBZPYWs1;
 spf=pass (domain: gmail.com, ip: 209.85.216.52,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so10026014pjb.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 12:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Of4KLwW4PFmophfmeEkOVG0HAHl12ftPLNDWNeoNm88=;
        b=iBZPYWs1DjbWf50/fmo89o4cKEIWn4Tuzrfuia8jtypjcZgkFOB1sUWEWScBZtr1Sj
         Gl+rb0kQ3aObpGEPgU9Z36Ppu3ljlX2QxHemP7lt3NmrxrERfJUtJ4qQYF2KCkeRVb9B
         Y3J0c9wi2FMLK3XtXvNhbKQCpfQWwtqQs20fhOHES9iHR2bc0yNRqReZwl09HkgA07H0
         Ot44yXsO/z1ToyztwK5c4ZARGyFSZSr4sR3KP8icmlMFIGex35ZDkXwRk3HN+ugG8pdA
         U4u1isGlc758TEepCmpWvjR0o5KbTyVwkayOMWM2cErY4f6REBLDHfO85AdHabdzPaSh
         163Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Of4KLwW4PFmophfmeEkOVG0HAHl12ftPLNDWNeoNm88=;
        b=ucS3redeV1OQV5lfaDUCnVkB3UJzu4xlmJTjw95+IcoT1qGxt4OiBVBcTbpDF1dNXx
         5z6HnPNgEeyJMZE6j7BtxJukyZprI5DK5XF0Pe7FmIXfvamjLfGyja8PZWR5IHwglFJs
         GCaQn6XWS0nb1Ewmd+b+rysNA6Wi5gVS5ib7cTKT21Jc1J2h6rP+W3r41sscKlVcvuaI
         djQw+unAp7/Zir/K1cFSXOhYhx/6ukGtph9BVRyzvZVSuEd1TLSn/3BQ96re8Ig4AaD7
         W6gVkKgRWVh5fcyVrYkqRn+FBsSU1xRTlBhhxIabZ9pr6wasbFsKi5SScRFOWcM7eq/x
         IbCw==
X-Gm-Message-State: AJIora+H0ycDukIuhjU4JVADPj5kOsQCNkl/YeRqA04dmo1AouWUNNk7
	VQoDXi93sHO9F9+3hTv0eNKTBwd2cB85fdcymWVTFhY3N58=
X-Google-Smtp-Source: 
 AGRyM1u6DcrUvXGYkVGPrDLvTWufKoxvPq76RxW5ZkxJ4cgmSi+d8Y5jWzSt6IpxkApxnAPRTPVr32iG01DqI2TWfvw=
X-Received: by 2002:a17:90b:1d02:b0:1e6:961d:d56f with SMTP id
 on2-20020a17090b1d0200b001e6961dd56fmr6216752pjb.225.1655236120110; Tue, 14
 Jun 2022 12:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220525234347.3799-1-sakib.sajal@windriver.com>
 <CADkTA4PJT5HwekzjTQsCg3dt=N25fwzAaRpXGQkH7a=SUDaMkA@mail.gmail.com>
 <e25f93e4-3512-eb34-aa57-c691f8e169d7@windriver.com>
In-Reply-To: <e25f93e4-3512-eb34-aa57-c691f8e169d7@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 14 Jun 2022 15:48:27 -0400
Message-ID: 
 <CADkTA4PU0=TE3TruN9_kWZWpmKeHRyMf7g0mpESeWWpU8GyEEw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH V2] buildah: add recipe for buildah
 v1.26
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Jun 2022 19:48:46 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7382

On Tue, Jun 7, 2022 at 9:50 AM Sakib Sajal <sakib.sajal@windriver.com> wrote:
>
>
> On 2022-06-07 08:59, Bruce Ashfield wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > On Wed, May 25, 2022 at 7:43 PM <sakib.sajal@windriver.com> wrote:
> >> buildah is a command line tool, to be installed and run on target,
> >> that can be used to:
> >>     - create a working container, either from scratch or using an image
> >>       as a starting point
> >>     - create an image, either from a working container or via the
> >>       instructions in a Dockerfile
> >>     - images can be built in either the OCI image format or the
> >>       traditional upstream docker image format
> >>     - mount a working container's root filesystem for manipulation
> >>     - unmount a working container's root filesystem
> >>     - use the updated contents of a container's root filesystem as a
> >>       filesystem layer to create a new image
> >>     - delete a working container or an image
> >>     - rename a local container
> >>
> >> Testing:
> >> Setup the build directory:
> >>     $ . oe-init-build-env <build_dir>
> >>
> >> Add to local.conf:
> >>     IMAGE_INSTALL:append = " buildah kernel-modules"
> >>     KERNEL_FEATURES += "features/overlayfs/overlayfs.cfgi \
> >>                         features/netfilter/netfilter.scc  \
> >>                         features/lxc/lxc-enable.scc"
> >>     IMAGE_ROOTFS_EXTRA_SPACE = "5242880"
> >>
> >> Build image:
> >>     $ bitbake core-image-minimal
> >>
> >> Run the image:
> >>     $ runqemu nographic kvm qemuparams="-m 4096"
> >>
> >> On target:
> >> Pull an image:
> >>     > cnt=$(buildah from fedora)
> >>
> >> Or build from Dockerfile
> >>     > buildah bud -t <image_name>:<tag> .
> >>
> >> Mount the image:
> >>     > mnt=$(buildah mount ${cnt})
> >>
> >> Install packages on the container rootfs:
> >>     > dnf install --installroot $mnt <packages_to_install> -y
> >>
> >> Copy local files to the container:
> >>     > buildah copy $cnt <local_file> <dest_on_container>
> >>
> >> Save the changes to an image
> >>     > buildah commit --format docker $cnt <name>:<tag>
> >>
> >> Run the image using buildah:
> >>     > buildah run $cnt /bin/sh
> >>
> >> Or using docker:
> >>     > docker run -it <name>:<tag>
> > I haven't forgotten about this, just with the storms and power outages
> > here in Ottawa, I'm running way behind in my patch processing.
> >
> > Bruce
>
> Thank you for the update, I was about to ping you regarding this.

I've been held up with some larger system integration issues for the
past week or so, I've got this staged locally and will get it tested
and merged as soon as possible.

Bruce

>
> Sakib
>
> >
> >> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> >> ---
> >>   recipes-containers/buildah/buildah_git.bb | 57 +++++++++++++++++++++++
> >>   1 file changed, 57 insertions(+)
> >>   create mode 100644 recipes-containers/buildah/buildah_git.bb
> >>
> >> diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
> >> new file mode 100644
> >> index 0000000..024e82c
> >> --- /dev/null
> >> +++ b/recipes-containers/buildah/buildah_git.bb
> >> @@ -0,0 +1,57 @@
> >> +HOMEPAGE = "https://buildah.io"
> >> +SUMMARY = "A tool that facilitates building OCI container images."
> >> +DESCRIPTION = "A tool that facilitates building OCI container images."
> >> +
> >> +# Apache-2.0 for containerd
> >> +LICENSE = "Apache-2.0"
> >> +LIC_FILES_CHKSUM = "file://src/github.com/containers/buildah/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
> >> +
> >> +S = "${WORKDIR}/git"
> >> +
> >> +BUILDAH_VERSION = "1.26"
> >> +SRCREV_buildah = "0a9d6e6eaef2e2e7936313d449a4e226022eb865"
> >> +
> >> +PV = "${BUILDAH_VERSION}"
> >> +
> >> +inherit go
> >> +inherit goarch
> >> +inherit pkgconfig
> >> +
> >> +GO_IMPORT = "github.com/containers/buildah"
> >> +GO_INSTALL = "${GO_IMPORT}"
> >> +GO_WORKDIR = "${GO_INSTALL}"
> >> +GOBUILDFLAGS += "-mod vendor"
> >> +
> >> +SRC_URI = " \
> >> +    git://github.com/containers/buildah;branch=release-${BUILDAH_VERSION};name=buildah;protocol=https \
> >> +    "
> >> +
> >> +DEPENDS = "libdevmapper btrfs-tools gpgme"
> >> +RDEPENDS:${PN} = "cgroup-lite fuse-overlayfs libdevmapper podman"
> >> +RDEPENDS:${PN}-dev = "bash perl"
> >> +
> >> +do_compile:prepend() {
> >> +    cd ${S}/src/github.com/containers/buildah
> >> +}
> >> +
> >> +go_do_compile() {
> >> +        export TMPDIR="${GOTMPDIR}"
> >> +        if [ -n "${GO_INSTALL}" ]; then
> >> +                if [ -n "${GO_LINKSHARED}" ]; then
> >> +                        ${GO} install ${GOBUILDFLAGS} ./cmd/buildah
> >> +                        ${GO} install ${GOBUILDFLAGS} ./tests/imgtype/imgtype.go
> >> +                        ${GO} install ${GOBUILDFLAGS} ./tests/copy/copy.go
> >> +                        rm -rf ${B}/bin
> >> +                fi
> >> +                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./cmd/buildah
> >> +                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./tests/imgtype/imgtype.go
> >> +                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./tests/copy/copy.go
> >> +        fi
> >> +}
> >> +
> >> +do_install:append() {
> >> +    dest_dir=${D}/${sysconfdir}/containers
> >> +    mkdir -p ${dest_dir}
> >> +    install -m 666 ${S}/src/github.com/containers/buildah/docs/samples/registries.conf ${dest_dir}/buildah.registries.conf.sample
> >> +    install -m 666 ${S}/src/github.com/containers/buildah/tests/policy.json ${dest_dir}/buildah.policy.json.sample
> >> +}
> >> --
> >> 2.33.0
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#7324): https://lists.yoctoproject.org/g/meta-virtualization/message/7324
> >> Mute This Topic: https://lists.yoctoproject.org/mt/91344690/1050810
> >> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

