Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC8AC43334
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 16:34:28 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web08.146.1654619658531242679
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 09:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W5SfAumI;
 spf=pass (domain: gmail.com, ip: 209.85.219.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id y188so2541928ybe.11
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 09:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K3D9nIJeJakktSa+lbUH3f+4SDyjE1Qa6cOdFkJE4Zk=;
        b=W5SfAumIFDDTWYaErUucrYvVAMmD845ioXepTMe7bt1d14cVXOEhY5Qve2A8dnk420
         27fXRztZNJC3L8nHN0eC2N533U8K+FcjPvufBFSX3aRI3fMr35HDCBSLqeUxV1s29txp
         vdUXPFyI9s5NXZuJ6l5LkZTU5cRbgMV/3L2kQNkL5QXkJd6+IzLZztmzI6JZmEYvIM2L
         y2WcS4Nkj+h34M1VKjvbXeaPYewsEOPDBkSrcKnTqsCltJsVRIy+rWCnRhkq7jECJyzf
         lat3+/uTBLJ4vvRmDqtbnS8pCrEjCZWYNKTOFDye2CPyFT0H0ETAMzLOyvSTNpHjYyZs
         dFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K3D9nIJeJakktSa+lbUH3f+4SDyjE1Qa6cOdFkJE4Zk=;
        b=mklpxH1a3OYe/lB2JGsQmrCFUUifMR8QNeDHLoMGW3tJymeWJjzNSzOPp/QPGoeRil
         d9ajIFi2Acwxup4vpQIDFbOdl0MYsylQ4Ax2avJ9zLTXgGDbSUW5Ua5B2NJRe495FtlC
         sMz0P+pRSM1dHVy4DDYiUUl4oGgJ6d+fjWYzJeBIDACIG/mveVsKG2iir1/7o6hmfe5K
         Qkh4vJcgq3HMgbFWlqClRBg2kYHec/Xwd3OI27hvNOdA5G72BvODtIsZSg3cgf1hZ59i
         9cvQWWvY9yM2UyLkg+kPBkauBLh1H74pXIURNSyCY2h3GA2QOO3GTRKpWPbenDRqUAMd
         7k1Q==
X-Gm-Message-State: AOAM532gR+IfWvjBPbGetLUHaVxM4XfWjYt9pLwvfBREFZyouJVVRA1o
	MzeJBT8mAqw44/0ccdPUsFdF62syiYoz2W6eR9iA6/O8eqk=
X-Google-Smtp-Source: 
 ABdhPJz1258ZqZKfiNAdpZ5qQ6AGae8YEYItuY8KwMjn4ue/wUygIVkCT3BW3AqQUo3ZL1oLHOljtdWUvCZMfr+qOMM=
X-Received: by 2002:a05:6902:4aa:b0:65c:e284:e5f9 with SMTP id
 r10-20020a05690204aa00b0065ce284e5f9mr30393150ybs.501.1654619657268; Tue, 07
 Jun 2022 09:34:17 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CADkTA4ODh7j1FKWN_iDxmqcWMraRsV65AkjtfUn0ScOzNwnuvA@mail.gmail.com>
 <1654618299691.3554318096.2544244789@optimcloud.com>
In-Reply-To: <1654618299691.3554318096.2544244789@optimcloud.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 7 Jun 2022 12:34:05 -0400
Message-ID: 
 <CADkTA4MNbw1K4a4dXwf=1fYTdCHVEoe6oLhAA7228C8LwMT3Kg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH V2] buildah: add recipe for buildah
 v1.26
To: Yocto <yocto@optimcloud.com>
Cc: Sakib Sajal <sakib.sajal@windriver.com>,
 meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jun 2022 16:34:28 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7344

On Tue, Jun 7, 2022 at 12:12 PM Yocto <yocto@optimcloud.com> wrote:
>
> Wow great can we get crio and podman updated now also :)

I do see the ":)" at the end of that statement .. but since we have no
idea who "yocto@" is .. don't expect a full/proper answer.

If you would have checked master-next, you can see the in progress
upgrades, and as stated multiple times on the mailing list, the
updates to packages typically completes in the M3 timeframe, since
there is significant system level testing that happens, so I don't
really do, or take, one off upgrades to many packages.

Bruce

>
> On Tuesday 07 June 2022 21:06:17 PM (+07:00), Bruce Ashfield wrote:
>
>  > On Tue, Jun 7, 2022 at 9:50 AM Sakib Sajal <sakib.sajal@windriver.com>
> wrote:
>  > >
>  > >
>  > > On 2022-06-07 08:59, Bruce Ashfield wrote:
>  > > > [Please note: This e-mail is from an EXTERNAL e-mail address]
>  > > >
>  > > > On Wed, May 25, 2022 at 7:43 PM <sakib.sajal@windriver.com> wrote:
>  > > >> buildah is a command line tool, to be installed and run on target,
>  > > >> that can be used to:
>  > > >> - create a working container, either from scratch or using an image
>  > > >> as a starting point
>  > > >> - create an image, either from a working container or via the
>  > > >> instructions in a Dockerfile
>  > > >> - images can be built in either the OCI image format or the
>  > > >> traditional upstream docker image format
>  > > >> - mount a working container's root filesystem for manipulation
>  > > >> - unmount a working container's root filesystem
>  > > >> - use the updated contents of a container's root filesystem as a
>  > > >> filesystem layer to create a new image
>  > > >> - delete a working container or an image
>  > > >> - rename a local container
>  > > >>
>  > > >> Testing:
>  > > >> Setup the build directory:
>  > > >> $ . oe-init-build-env <build_dir>
>  > > >>
>  > > >> Add to local.conf:
>  > > >> IMAGE_INSTALL:append = " buildah kernel-modules"
>  > > >> KERNEL_FEATURES += "features/overlayfs/overlayfs.cfgi \
>  > > >> features/netfilter/netfilter.scc \
>  > > >> features/lxc/lxc-enable.scc"
>  > > >> IMAGE_ROOTFS_EXTRA_SPACE = "5242880"
>  > > >>
>  > > >> Build image:
>  > > >> $ bitbake core-image-minimal
>  > > >>
>  > > >> Run the image:
>  > > >> $ runqemu nographic kvm qemuparams="-m 4096"
>  > > >>
>  > > >> On target:
>  > > >> Pull an image:
>  > > >> > cnt=$(buildah from fedora)
>  > > >>
>  > > >> Or build from Dockerfile
>  > > >> > buildah bud -t <image_name>:<tag> .
>  > > >>
>  > > >> Mount the image:
>  > > >> > mnt=$(buildah mount ${cnt})
>  > > >>
>  > > >> Install packages on the container rootfs:
>  > > >> > dnf install --installroot $mnt <packages_to_install> -y
>  > > >>
>  > > >> Copy local files to the container:
>  > > >> > buildah copy $cnt <local_file> <dest_on_container>
>  > > >>
>  > > >> Save the changes to an image
>  > > >> > buildah commit --format docker $cnt <name>:<tag>
>  > > >>
>  > > >> Run the image using buildah:
>  > > >> > buildah run $cnt /bin/sh
>  > > >>
>  > > >> Or using docker:
>  > > >> > docker run -it <name>:<tag>
>  > > > I haven't forgotten about this, just with the storms and power
> outages
>  > > > here in Ottawa, I'm running way behind in my patch processing.
>  > > >
>  > > > Bruce
>  > >
>  > > Thank you for the update, I was about to ping you regarding this.
>  > >
>  >
>  > I did the easier patches this morning, I'll have a look at this more
>  > closely on Wednesday.
>  >
>  > Bruce
>  >
>  > > Sakib
>  > >
>  > > >
>  > > >> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>  > > >> ---
>  > > >> recipes-containers/buildah/buildah_git.bb | 57
> +++++++++++++++++++++++
>  > > >> 1 file changed, 57 insertions(+)
>  > > >> create mode 100644 recipes-containers/buildah/buildah_git.bb
>  > > >>
>  > > >> diff --git a/recipes-containers/buildah/buildah_git.bb
> b/recipes-containers/buildah/buildah_git.bb
>  > > >> new file mode 100644
>  > > >> index 0000000..024e82c
>  > > >> --- /dev/null
>  > > >> +++ b/recipes-containers/buildah/buildah_git.bb
>  > > >> @@ -0,0 +1,57 @@
>  > > >> +HOMEPAGE = "https://buildah.io"
>  > > >> +SUMMARY = "A tool that facilitates building OCI container images."
>  > > >> +DESCRIPTION = "A tool that facilitates building OCI container
> images."
>  > > >> +
>  > > >> +# Apache-2.0 for containerd
>  > > >> +LICENSE = "Apache-2.0"
>  > > >> +LIC_FILES_CHKSUM =
> "file://src/github.com/containers/buildah/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
>
> > > >> +
>  > > >> +S = "${WORKDIR}/git"
>  > > >> +
>  > > >> +BUILDAH_VERSION = "1.26"
>  > > >> +SRCREV_buildah = "0a9d6e6eaef2e2e7936313d449a4e226022eb865"
>  > > >> +
>  > > >> +PV = "${BUILDAH_VERSION}"
>  > > >> +
>  > > >> +inherit go
>  > > >> +inherit goarch
>  > > >> +inherit pkgconfig
>  > > >> +
>  > > >> +GO_IMPORT = "github.com/containers/buildah"
>  > > >> +GO_INSTALL = "${GO_IMPORT}"
>  > > >> +GO_WORKDIR = "${GO_INSTALL}"
>  > > >> +GOBUILDFLAGS += "-mod vendor"
>  > > >> +
>  > > >> +SRC_URI = " \
>  > > >> +
> git://github.com/containers/buildah;branch=release-${BUILDAH_VERSION};name=buildah;protocol=https
> \
>  > > >> + "
>  > > >> +
>  > > >> +DEPENDS = "libdevmapper btrfs-tools gpgme"
>  > > >> +RDEPENDS:${PN} = "cgroup-lite fuse-overlayfs libdevmapper podman"
>  > > >> +RDEPENDS:${PN}-dev = "bash perl"
>  > > >> +
>  > > >> +do_compile:prepend() {
>  > > >> + cd ${S}/src/github.com/containers/buildah
>  > > >> +}
>  > > >> +
>  > > >> +go_do_compile() {
>  > > >> + export TMPDIR="${GOTMPDIR}"
>  > > >> + if [ -n "${GO_INSTALL}" ]; then
>  > > >> + if [ -n "${GO_LINKSHARED}" ]; then
>  > > >> + ${GO} install ${GOBUILDFLAGS} ./cmd/buildah
>  > > >> + ${GO} install ${GOBUILDFLAGS} ./tests/imgtype/imgtype.go
>  > > >> + ${GO} install ${GOBUILDFLAGS} ./tests/copy/copy.go
>  > > >> + rm -rf ${B}/bin
>  > > >> + fi
>  > > >> + ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./cmd/buildah
>  > > >> + ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS}
> ./tests/imgtype/imgtype.go
>  > > >> + ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS}
> ./tests/copy/copy.go
>  > > >> + fi
>  > > >> +}
>  > > >> +
>  > > >> +do_install:append() {
>  > > >> + dest_dir=${D}/${sysconfdir}/containers
>  > > >> + mkdir -p ${dest_dir}
>  > > >> + install -m 666
> ${S}/src/github.com/containers/buildah/docs/samples/registries.conf
> ${dest_dir}/buildah.registries.conf.sample
>  > > >> + install -m 666
> ${S}/src/github.com/containers/buildah/tests/policy.json
> ${dest_dir}/buildah.policy.json.sample
>  > > >> +}
>  > > >> --
>  > > >> 2.33.0
>  > > >>
>  > > >>
>  > > >>
>  > > >>
>  > > >
>  > > > --
>  > > > - Thou shalt not follow the NULL pointer, for chaos and madness
> await
>  > > > thee at its end
>  > > > - "Use the force Harry" - Gandalf, Star Trek II
>  >
>  >
>  >
>
> --
> Sent with Vivaldi Mail. Download Vivaldi for free at vivaldi.com
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7343): https://lists.yoctoproject.org/g/meta-virtualization/message/7343
> Mute This Topic: https://lists.yoctoproject.org/mt/91344690/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

