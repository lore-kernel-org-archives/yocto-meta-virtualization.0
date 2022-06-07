Return-Path: <yocto@optimcloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C7DC433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 16:12:22 +0000 (UTC)
Received: from mail.optimvoice.io (mail.optimvoice.io [46.23.82.139])
 by mx.groups.io with SMTP id smtpd.web12.14600.1654618331385402143
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 09:12:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@optimcloud.com header.s=dkim
 header.b=fG4lsEtE;
 spf=none, err=permanent DNS error (domain: optimcloud.com, ip: 46.23.82.139,
 mailfrom: yocto@optimcloud.com)
Received: from authenticated-user (mail.optimvoice.io [46.23.82.139])
	by mail.optimvoice.io (Postfix) with ESMTPA id 910D310800091;
	Tue,  7 Jun 2022 16:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=optimcloud.com;
	s=dkim; t=1654618327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+wHA9TfGO4xT8motuPsLWEV45Gl1x3nYXS6ap5QtSwM=;
	b=fG4lsEtEMCntYVbEwXmM3ZWYORLpfRyBboHfs1J1wvkV2JwnqPDgXt8Ty2+RVv/rzjn4jM
	Trt13NfEb3PKdnPg1SqV9vLdKLlEsYZ6rIbAxgJLJqGNzjXBPfIaKaDF8ofAGrNzuigTL1
	6VKT3rbIL8mmIaKHr3huX+SUnZO+Z9IbjZcOK787EUgjxupOTS2KWvSktFxt4yLYGNHBCU
	pBVj8aLOLqLQUADxEf4tNpb99s+SrzcSH0eASawVlI7MGvIS8fKfBXBw6+EkwN2sKFIBgM
	om7ozS4j1+fcTel9LrAxkyWtXYjTeszPGsxzQ9yoKdmPfgCpJSYKdZDyqwgp8Q==
Content-Type: text/plain; charset=utf-8; format=flowed
Message-Id: <1654618299691.3554318096.2544244789@optimcloud.com>
From: Embedded Devel <yocto@optimcloud.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Sakib Sajal
 <sakib.sajal@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH V2] buildah: add recipe for
 buildah v1.26
Date: Tue, 07 Jun 2022 16:12:00 +0000
In-Reply-To: 
 <CADkTA4ODh7j1FKWN_iDxmqcWMraRsV65AkjtfUn0ScOzNwnuvA@mail.gmail.com>
References: 
 <CADkTA4ODh7j1FKWN_iDxmqcWMraRsV65AkjtfUn0ScOzNwnuvA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Authentication-Results: mail.optimvoice.io;
	auth=pass smtp.auth=yocto@optimcloud.com smtp.mailfrom=yocto@optimcloud.com
X-Spamd-Bar: /
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jun 2022 16:12:22 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7343

Wow great can we get crio and podman updated now also :) 

On Tuesday 07 June 2022 21:06:17 PM (+07:00), Bruce Ashfield wrote:

 > On Tue, Jun 7, 2022 at 9:50 AM Sakib Sajal <sakib.sajal@windriver.com> 
wrote:
 > >
 > >
 > > On 2022-06-07 08:59, Bruce Ashfield wrote:
 > > > [Please note: This e-mail is from an EXTERNAL e-mail address]
 > > >
 > > > On Wed, May 25, 2022 at 7:43 PM <sakib.sajal@windriver.com> wrote:
 > > >> buildah is a command line tool, to be installed and run on target,
 > > >> that can be used to:
 > > >> - create a working container, either from scratch or using an image
 > > >> as a starting point
 > > >> - create an image, either from a working container or via the
 > > >> instructions in a Dockerfile
 > > >> - images can be built in either the OCI image format or the
 > > >> traditional upstream docker image format
 > > >> - mount a working container's root filesystem for manipulation
 > > >> - unmount a working container's root filesystem
 > > >> - use the updated contents of a container's root filesystem as a
 > > >> filesystem layer to create a new image
 > > >> - delete a working container or an image
 > > >> - rename a local container
 > > >>
 > > >> Testing:
 > > >> Setup the build directory:
 > > >> $ . oe-init-build-env <build_dir>
 > > >>
 > > >> Add to local.conf:
 > > >> IMAGE_INSTALL:append = " buildah kernel-modules"
 > > >> KERNEL_FEATURES += "features/overlayfs/overlayfs.cfgi \
 > > >> features/netfilter/netfilter.scc \
 > > >> features/lxc/lxc-enable.scc"
 > > >> IMAGE_ROOTFS_EXTRA_SPACE = "5242880"
 > > >>
 > > >> Build image:
 > > >> $ bitbake core-image-minimal
 > > >>
 > > >> Run the image:
 > > >> $ runqemu nographic kvm qemuparams="-m 4096"
 > > >>
 > > >> On target:
 > > >> Pull an image:
 > > >> > cnt=$(buildah from fedora)
 > > >>
 > > >> Or build from Dockerfile
 > > >> > buildah bud -t <image_name>:<tag> .
 > > >>
 > > >> Mount the image:
 > > >> > mnt=$(buildah mount ${cnt})
 > > >>
 > > >> Install packages on the container rootfs:
 > > >> > dnf install --installroot $mnt <packages_to_install> -y
 > > >>
 > > >> Copy local files to the container:
 > > >> > buildah copy $cnt <local_file> <dest_on_container>
 > > >>
 > > >> Save the changes to an image
 > > >> > buildah commit --format docker $cnt <name>:<tag>
 > > >>
 > > >> Run the image using buildah:
 > > >> > buildah run $cnt /bin/sh
 > > >>
 > > >> Or using docker:
 > > >> > docker run -it <name>:<tag>
 > > > I haven't forgotten about this, just with the storms and power 
outages
 > > > here in Ottawa, I'm running way behind in my patch processing.
 > > >
 > > > Bruce
 > >
 > > Thank you for the update, I was about to ping you regarding this.
 > >
 >
 > I did the easier patches this morning, I'll have a look at this more
 > closely on Wednesday.
 >
 > Bruce
 >
 > > Sakib
 > >
 > > >
 > > >> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
 > > >> ---
 > > >> recipes-containers/buildah/buildah_git.bb | 57 
+++++++++++++++++++++++
 > > >> 1 file changed, 57 insertions(+)
 > > >> create mode 100644 recipes-containers/buildah/buildah_git.bb
 > > >>
 > > >> diff --git a/recipes-containers/buildah/buildah_git.bb 
b/recipes-containers/buildah/buildah_git.bb
 > > >> new file mode 100644
 > > >> index 0000000..024e82c
 > > >> --- /dev/null
 > > >> +++ b/recipes-containers/buildah/buildah_git.bb
 > > >> @@ -0,0 +1,57 @@
 > > >> +HOMEPAGE = "https://buildah.io"
 > > >> +SUMMARY = "A tool that facilitates building OCI container images."
 > > >> +DESCRIPTION = "A tool that facilitates building OCI container 
images."
 > > >> +
 > > >> +# Apache-2.0 for containerd
 > > >> +LICENSE = "Apache-2.0"
 > > >> +LIC_FILES_CHKSUM = 
"file://src/github.com/containers/buildah/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
 
> > >> +
 > > >> +S = "${WORKDIR}/git"
 > > >> +
 > > >> +BUILDAH_VERSION = "1.26"
 > > >> +SRCREV_buildah = "0a9d6e6eaef2e2e7936313d449a4e226022eb865"
 > > >> +
 > > >> +PV = "${BUILDAH_VERSION}"
 > > >> +
 > > >> +inherit go
 > > >> +inherit goarch
 > > >> +inherit pkgconfig
 > > >> +
 > > >> +GO_IMPORT = "github.com/containers/buildah"
 > > >> +GO_INSTALL = "${GO_IMPORT}"
 > > >> +GO_WORKDIR = "${GO_INSTALL}"
 > > >> +GOBUILDFLAGS += "-mod vendor"
 > > >> +
 > > >> +SRC_URI = " \
 > > >> + 
git://github.com/containers/buildah;branch=release-${BUILDAH_VERSION};name=buildah;protocol=https 
\
 > > >> + "
 > > >> +
 > > >> +DEPENDS = "libdevmapper btrfs-tools gpgme"
 > > >> +RDEPENDS:${PN} = "cgroup-lite fuse-overlayfs libdevmapper podman"
 > > >> +RDEPENDS:${PN}-dev = "bash perl"
 > > >> +
 > > >> +do_compile:prepend() {
 > > >> + cd ${S}/src/github.com/containers/buildah
 > > >> +}
 > > >> +
 > > >> +go_do_compile() {
 > > >> + export TMPDIR="${GOTMPDIR}"
 > > >> + if [ -n "${GO_INSTALL}" ]; then
 > > >> + if [ -n "${GO_LINKSHARED}" ]; then
 > > >> + ${GO} install ${GOBUILDFLAGS} ./cmd/buildah
 > > >> + ${GO} install ${GOBUILDFLAGS} ./tests/imgtype/imgtype.go
 > > >> + ${GO} install ${GOBUILDFLAGS} ./tests/copy/copy.go
 > > >> + rm -rf ${B}/bin
 > > >> + fi
 > > >> + ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./cmd/buildah
 > > >> + ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} 
./tests/imgtype/imgtype.go
 > > >> + ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} 
./tests/copy/copy.go
 > > >> + fi
 > > >> +}
 > > >> +
 > > >> +do_install:append() {
 > > >> + dest_dir=${D}/${sysconfdir}/containers
 > > >> + mkdir -p ${dest_dir}
 > > >> + install -m 666 
${S}/src/github.com/containers/buildah/docs/samples/registries.conf 
${dest_dir}/buildah.registries.conf.sample
 > > >> + install -m 666 
${S}/src/github.com/containers/buildah/tests/policy.json 
${dest_dir}/buildah.policy.json.sample
 > > >> +}
 > > >> --
 > > >> 2.33.0
 > > >>
 > > >>
 > > >>
 > > >>
 > > >
 > > > --
 > > > - Thou shalt not follow the NULL pointer, for chaos and madness 
await
 > > > thee at its end
 > > > - "Use the force Harry" - Gandalf, Star Trek II
 >
 >
 >

-- 
Sent with Vivaldi Mail. Download Vivaldi for free at vivaldi.com

