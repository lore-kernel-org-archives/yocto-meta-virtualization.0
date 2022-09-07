Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED46AECAAA1
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 02:39:21 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.3309.1662518361568272637
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 19:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GFcULB27;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id y127so13250994pfy.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 19:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=VvZ61dOq91z81FTsHJwU540TZmdXNQjIRum1xGAyH8g=;
        b=GFcULB275hkWlCPt+emANWGN2eIzsdTk49GV2mRZnGVUQlS3ZA8fUVVj+PfSgt3PWN
         eW+FyQZCFuCNWa+zUZ+IrKy3jwACr128OpauD5ZRQT4aD2Tnckf2PVpMavqx11UeK70q
         wXJPPzBLpCEYSwAO68PVLbPG0h/SvFiSdsPUaDhkSyfapjDHgMdtOXPXV58vuvAIr/m3
         A21ln2UdvfkbK/HYv77ojswl3QQEBIbUYWqvOGJ4f6JAg+gZ38aAP2MaSnXQPajadVpY
         TcNAAZ5SmB+bYdl4QIkL4cl6fwUebTl4zAZ5m/S0pjBr7DL/gtatmHVsGtnoFGGZvke1
         ctqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=VvZ61dOq91z81FTsHJwU540TZmdXNQjIRum1xGAyH8g=;
        b=z7faJI2vTZ5pWhAazo1AjrNDZMtKBgYCZdAuFjCLHgz7/2XxxNhIVrWWo0H8jChsc0
         3hyYf/ygo8sj8ivQyhLqLS9YONwELz1X9NsnksmxhSARMsNN2W4qtw2Um7ErfPF2ijAn
         LLjiPFJd1GX47IQxSbHmCI4o3j4C2SwQ4NOoMuFSniU9UUfsgxl1vvqqhs37OjWZJ2qn
         x4MRY3h1Yhb1cxCanp/M3/pY0yt9UHToEy5Jauq7bZLHW2QeWXpviEDUJW9d6ZhYaxra
         sWCWNYuz9Ks0IvVzSKV9x2PHAdEvok3XflwO0UmlYu6Ko2ipxkBDs2b2f77fa9xDZ9BX
         BupQ==
X-Gm-Message-State: ACgBeo0wLAAdgZwPxDNAxijVhFptvTT7WlP/AF7NyqpOny5PawxvLlHn
	hElzjVbEZQx8fx+rA/zrhAxGiGe2EtEXjwGejFKjZZcE
X-Google-Smtp-Source: 
 AA6agR4JXydoJEiJxs95jiZc8aOw22FVpmNZ08XbIRSdhf3ICQCYo77xzmpcjwPkZkSkfY2+4d1t9z7iREdUp7wk9wA=
X-Received: by 2002:a05:6a00:1d1f:b0:53a:be2f:df38 with SMTP id
 a31-20020a056a001d1f00b0053abe2fdf38mr1526699pfx.20.1662518361034; Tue, 06
 Sep 2022 19:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220905113116.1766939-1-andrei@gherzan.com>
In-Reply-To: <20220905113116.1766939-1-andrei@gherzan.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 6 Sep 2022 22:39:09 -0400
Message-ID: 
 <CADkTA4Nvw4MOQGygA6qvByjRY5u-nzcvtVNPjnQwajTypZDBeQ@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone][PATCH 1/3] buildah: add recipe
 for buildah v1.26
To: Andrei Gherzan <andrei@gherzan.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	"sakib.sajal@windriver.com" <sakib.sajal@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Sep 2022 02:39:21 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7603

Technically we don't add new packages to old branches, without a very
good reason.

Sure, this can't break anything that already exists in kirkstone, but
it is a new feature when you consider supported hosts, etc.

The changes to master look fine, but I need to consider this a bit longer.

Bruce

On Mon, Sep 5, 2022 at 7:31 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> From: "sakib.sajal@windriver.com" <sakib.sajal@windriver.com>
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
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
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
> 2.25.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

