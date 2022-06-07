Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E0DC43334
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 13:00:01 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.11879.1654606795108832555
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 05:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GOfCd1EH;
 spf=pass (domain: gmail.com, ip: 209.85.219.182,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id l204so30980168ybf.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 05:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o3/re2aRoQBWXTlKAgUI5IVD+Ro/W1xOSjknN7hqErg=;
        b=GOfCd1EHa5c8wxOfV2sT5zTKWKt5Vze1b3vFT2l7b5G94KsLEL5W8D8mTJ/3GV6aRR
         Za2ZkG7qppSeWEjW54Wa2Wo61VC53QROVvCp26Dbu+DY3Ccf3EFy51S76HGzgFlvwRJA
         TOdjod0QUp/tIhKNwij70oQhpr04Du4AJyOnCA5DqFsbi5gmwzBNXTbvX8q8NOokpG+v
         oE0cOIDLK/q4+LuvC+ewJlMM+QHMYuI1jf6wrcvFVoU0DE/ST2GflU4dZiYY7JB2Bt03
         nfIYlaMpMdgkx7XN7ssoPK62WSxkb05Z91zuCzVxUw80w/9axAAIIDxTxr540ja1NKnF
         WZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o3/re2aRoQBWXTlKAgUI5IVD+Ro/W1xOSjknN7hqErg=;
        b=ov8mlYqP3OSP8AcoJkaN1SHoRzFIPvaQ/NMGnU3J/vXsfhkdQEfwYTz/n6v5X4C8x7
         BVI5d6K13zVPI5Ni32RkYQguAX1lN6H3Zrh0+z3mt5rILBbOYta/4BaTaLxGbldVE1ap
         DXxFDvqDB4zytdJUauFRC7leIWJFq769GWgHRozyDEyIGHZa5ZE26ukl0/NEh504FaTn
         qo4Zu1rpjVHx4MBRnoeAmrWC6inWAjXPmxuXWsFuII0pCGGMfA++Ro6CKStuPArtvGU6
         mPhPNe5hgwqCoOAe5grgGeNi/hhJXgOkiWQ2SBuE86BmOizvuu7crLdewiHi0lWqK0iP
         Kspg==
X-Gm-Message-State: AOAM532FajQZ0FJZWuC6c/00MYBjL9LcOWNslCrGKbzFX2CG3fDu6SLS
	J/028EN8p8CXyo5XSdv1VgCE30Me0+Xp/naWa3Mk8fm4kUM=
X-Google-Smtp-Source: 
 ABdhPJx7Wj9IoBMDBRxVgGkAcKR1FMTAz+AA4Ul6kOn5eseMOn4k2dtF3V8w7SRGkcoH8E6chtopOFB8geCcRffoWLM=
X-Received: by 2002:a25:6b50:0:b0:64f:4b33:664 with SMTP id
 o16-20020a256b50000000b0064f4b330664mr31550243ybm.153.1654606794121; Tue, 07
 Jun 2022 05:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220525234347.3799-1-sakib.sajal@windriver.com>
In-Reply-To: <20220525234347.3799-1-sakib.sajal@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 7 Jun 2022 08:59:43 -0400
Message-ID: 
 <CADkTA4PJT5HwekzjTQsCg3dt=N25fwzAaRpXGQkH7a=SUDaMkA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH V2] buildah: add recipe for buildah
 v1.26
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jun 2022 13:00:01 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7336

On Wed, May 25, 2022 at 7:43 PM <sakib.sajal@windriver.com> wrote:
>
> buildah is a command line tool, to be installed and run on target,
> that can be used to:
>    - create a working container, either from scratch or using an image
>      as a starting point
>    - create an image, either from a working container or via the
>      instructions in a Dockerfile
>    - images can be built in either the OCI image format or the
>      traditional upstream docker image format
>    - mount a working container's root filesystem for manipulation
>    - unmount a working container's root filesystem
>    - use the updated contents of a container's root filesystem as a
>      filesystem layer to create a new image
>    - delete a working container or an image
>    - rename a local container
>
> Testing:
> Setup the build directory:
>    $ . oe-init-build-env <build_dir>
>
> Add to local.conf:
>    IMAGE_INSTALL:append = " buildah kernel-modules"
>    KERNEL_FEATURES += "features/overlayfs/overlayfs.cfgi \
>                        features/netfilter/netfilter.scc  \
>                        features/lxc/lxc-enable.scc"
>    IMAGE_ROOTFS_EXTRA_SPACE = "5242880"
>
> Build image:
>    $ bitbake core-image-minimal
>
> Run the image:
>    $ runqemu nographic kvm qemuparams="-m 4096"
>
> On target:
> Pull an image:
>    > cnt=$(buildah from fedora)
>
> Or build from Dockerfile
>    > buildah bud -t <image_name>:<tag> .
>
> Mount the image:
>    > mnt=$(buildah mount ${cnt})
>
> Install packages on the container rootfs:
>    > dnf install --installroot $mnt <packages_to_install> -y
>
> Copy local files to the container:
>    > buildah copy $cnt <local_file> <dest_on_container>
>
> Save the changes to an image
>    > buildah commit --format docker $cnt <name>:<tag>
>
> Run the image using buildah:
>    > buildah run $cnt /bin/sh
>
> Or using docker:
>    > docker run -it <name>:<tag>

I haven't forgotten about this, just with the storms and power outages
here in Ottawa, I'm running way behind in my patch processing.

Bruce

>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  recipes-containers/buildah/buildah_git.bb | 57 +++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 recipes-containers/buildah/buildah_git.bb
>
> diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
> new file mode 100644
> index 0000000..024e82c
> --- /dev/null
> +++ b/recipes-containers/buildah/buildah_git.bb
> @@ -0,0 +1,57 @@
> +HOMEPAGE = "https://buildah.io"
> +SUMMARY = "A tool that facilitates building OCI container images."
> +DESCRIPTION = "A tool that facilitates building OCI container images."
> +
> +# Apache-2.0 for containerd
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://src/github.com/containers/buildah/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
> +
> +S = "${WORKDIR}/git"
> +
> +BUILDAH_VERSION = "1.26"
> +SRCREV_buildah = "0a9d6e6eaef2e2e7936313d449a4e226022eb865"
> +
> +PV = "${BUILDAH_VERSION}"
> +
> +inherit go
> +inherit goarch
> +inherit pkgconfig
> +
> +GO_IMPORT = "github.com/containers/buildah"
> +GO_INSTALL = "${GO_IMPORT}"
> +GO_WORKDIR = "${GO_INSTALL}"
> +GOBUILDFLAGS += "-mod vendor"
> +
> +SRC_URI = " \
> +    git://github.com/containers/buildah;branch=release-${BUILDAH_VERSION};name=buildah;protocol=https \
> +    "
> +
> +DEPENDS = "libdevmapper btrfs-tools gpgme"
> +RDEPENDS:${PN} = "cgroup-lite fuse-overlayfs libdevmapper podman"
> +RDEPENDS:${PN}-dev = "bash perl"
> +
> +do_compile:prepend() {
> +    cd ${S}/src/github.com/containers/buildah
> +}
> +
> +go_do_compile() {
> +        export TMPDIR="${GOTMPDIR}"
> +        if [ -n "${GO_INSTALL}" ]; then
> +                if [ -n "${GO_LINKSHARED}" ]; then
> +                        ${GO} install ${GOBUILDFLAGS} ./cmd/buildah
> +                        ${GO} install ${GOBUILDFLAGS} ./tests/imgtype/imgtype.go
> +                        ${GO} install ${GOBUILDFLAGS} ./tests/copy/copy.go
> +                        rm -rf ${B}/bin
> +                fi
> +                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./cmd/buildah
> +                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./tests/imgtype/imgtype.go
> +                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./tests/copy/copy.go
> +        fi
> +}
> +
> +do_install:append() {
> +    dest_dir=${D}/${sysconfdir}/containers
> +    mkdir -p ${dest_dir}
> +    install -m 666 ${S}/src/github.com/containers/buildah/docs/samples/registries.conf ${dest_dir}/buildah.registries.conf.sample
> +    install -m 666 ${S}/src/github.com/containers/buildah/tests/policy.json ${dest_dir}/buildah.policy.json.sample
> +}
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7324): https://lists.yoctoproject.org/g/meta-virtualization/message/7324
> Mute This Topic: https://lists.yoctoproject.org/mt/91344690/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

