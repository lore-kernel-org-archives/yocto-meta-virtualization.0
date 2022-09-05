Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B4FECAAD3
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 11:31:32 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web11.23785.1662377488302489101
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 05 Sep 2022 04:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=3yTMIGpK;
 spf=pass (domain: gherzan.com, ip: 66.111.4.29, mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id A0F135C00F0;
	Mon,  5 Sep 2022 07:31:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 05 Sep 2022 07:31:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1662377487; x=1662463887; bh=7m5ZSFW+3UrO+m5cKWagqQfnI
	MLKFtfA9/LtrXbD7nI=; b=3yTMIGpKvuq8mN1RTfntYAwxci10ANzS5t43raCIg
	696CowwySowo5aK10/h5yndGPDSa3kFRrORqWuN3KrcdgRMKMmLgsm2g7eBUoDe2
	YhfITofgStenSLJedS/3SUFU8hm/UqabbpY2EFTAlnQ/JDb5ZcoxUhfEKGhUOelq
	boWaHCRRfPRZiug3N0vABcB77kAnhB7gsnfiBXPydHV/7lCYOABnbgTPsnLkALDl
	hc0DNV+URvuGy59cRbiz/1OtM8NpvYCxMK2ekUv8iGBcE/YQ2VcfiHMMCFy8X/+l
	4jT+ChfIhfqtSBoYB7P8EPFPLTP2GzKNfM9OhpWknN3Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1662377487; x=1662463887; bh=7m5ZSFW+3UrO+m5cKWagqQfnIMLKFtfA9/L
	trXbD7nI=; b=rSiFIi24Mu2/R8PqwVRu7NtzBwC6bQz8oKWZIU3RGQiLRYnTXxN
	e413HQ5U9TccS669zA4N6vrQcwmymoF13AmyECunEcgMMqJoVgOJVPvnYSKGiVF5
	Y0wRTmeSwngqbPNqi1HOSjuIq05CgnqBLLY8GniHh7IDy/u2O9sxFKx2w3rxgLrL
	5W7OAGmrmhyXNWQR9RRm8LeAf2biEDNxZoZ4/kt9MZ9U81VTsMGNNxAJ3xCfFFe8
	yM9ZLnaRZQceg0sGWglf4tjEtkL3rFRU4qr4XE6wD292E5szAIWrp4rY/5NCvtHi
	dm/ROyNLwDq4mvVXmBeY/Hu32zbi0zU6e8w==
X-ME-Sender: <xms:D94VY7QlDLD7xN0v6neFK8jPcfOUsHZygNTejc5zoFPkvMsmPiKxvg>
    <xme:D94VY8zh8QAkrjBthYHLMJPD0bJGYy24Jrjo2mJcqIzzK2QGFybXJJwncZlUqKo8A
    uM5sgJovlnlmkf4-Uk>
X-ME-Received: 
 <xmr:D94VYw3ESr-Sz_acdhYHGWb4-ddUDimjeS79VhQh5-xEp2NBFkkplLpqrPDwxhg2uVt0Rc6U8Fgqo173mft1-qdxmK1V_M7vlUnVO1Sh3ECiRRULLW-jGMUq>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdeliedggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptehnughrvghi
    ucfihhgvrhiirghnuceorghnughrvghisehghhgvrhiirghnrdgtohhmqeenucggtffrrg
    htthgvrhhnpeevfedvlefgheeiveefjefgheekuefgieefudffieeugeegkeejuddvudej
    feetfeenucffohhmrghinhepsghuihhluggrhhdrihhopdhgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
    ihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:D94VY7CT2OU79lmSydMFNwFCdakJWwAAsNVTln1stnj4Eix76l3DBw>
    <xmx:D94VY0jGanQF0Dm6HorWFjGkZwxJ6Rj9wV-TkR5B3KL2JwEf5YAQrQ>
    <xmx:D94VY_q44TpwEj2fdC5Kt4Il2o-0ckT610JHx786r57ojop_nD22Hg>
    <xmx:D94VY3tUHXDyPTpV2C479oOXez-cP1VgWo2CER1bxbnb9w3Eltui7Q>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Sep 2022 07:31:26 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	"sakib.sajal@windriver.com" <sakib.sajal@windriver.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][kirkstone][PATCH 1/3] buildah: add recipe for
 buildah v1.26
Date: Mon,  5 Sep 2022 13:31:14 +0200
Message-Id: <20220905113116.1766939-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 05 Sep 2022 11:31:32 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7596

From: "sakib.sajal@windriver.com" <sakib.sajal@windriver.com>

buildah is a command line tool, to be installed and run on target,
that can be used to:
   - create a working container, either from scratch or using an image
     as a starting point
   - create an image, either from a working container or via the
     instructions in a Dockerfile
   - images can be built in either the OCI image format or the
     traditional upstream docker image format
   - mount a working container's root filesystem for manipulation
   - unmount a working container's root filesystem
   - use the updated contents of a container's root filesystem as a
     filesystem layer to create a new image
   - delete a working container or an image
   - rename a local container

Testing:
Setup the build directory:
   $ . oe-init-build-env <build_dir>

Add to local.conf:
   IMAGE_INSTALL:append = " buildah kernel-modules"
   KERNEL_FEATURES += "features/overlayfs/overlayfs.cfgi \
                       features/netfilter/netfilter.scc  \
                       features/lxc/lxc-enable.scc"
   IMAGE_ROOTFS_EXTRA_SPACE = "5242880"

Build image:
   $ bitbake core-image-minimal

Run the image:
   $ runqemu nographic kvm qemuparams="-m 4096"

On target:
Pull an image:
   > cnt=$(buildah from fedora)

Or build from Dockerfile
   > buildah bud -t <image_name>:<tag> .

Mount the image:
   > mnt=$(buildah mount ${cnt})

Install packages on the container rootfs:
   > dnf install --installroot $mnt <packages_to_install> -y

Copy local files to the container:
   > buildah copy $cnt <local_file> <dest_on_container>

Save the changes to an image
   > buildah commit --format docker $cnt <name>:<tag>

Run the image using buildah:
   > buildah run $cnt /bin/sh

Or using docker:
   > docker run -it <name>:<tag>

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-containers/buildah/buildah_git.bb | 57 +++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 recipes-containers/buildah/buildah_git.bb

diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
new file mode 100644
index 0000000..024e82c
--- /dev/null
+++ b/recipes-containers/buildah/buildah_git.bb
@@ -0,0 +1,57 @@
+HOMEPAGE = "https://buildah.io"
+SUMMARY = "A tool that facilitates building OCI container images."
+DESCRIPTION = "A tool that facilitates building OCI container images."
+
+# Apache-2.0 for containerd
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://src/github.com/containers/buildah/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
+
+S = "${WORKDIR}/git"
+
+BUILDAH_VERSION = "1.26"
+SRCREV_buildah = "0a9d6e6eaef2e2e7936313d449a4e226022eb865"
+
+PV = "${BUILDAH_VERSION}"
+
+inherit go
+inherit goarch
+inherit pkgconfig
+
+GO_IMPORT = "github.com/containers/buildah"
+GO_INSTALL = "${GO_IMPORT}"
+GO_WORKDIR = "${GO_INSTALL}"
+GOBUILDFLAGS += "-mod vendor"
+
+SRC_URI = " \
+    git://github.com/containers/buildah;branch=release-${BUILDAH_VERSION};name=buildah;protocol=https \
+    "
+
+DEPENDS = "libdevmapper btrfs-tools gpgme"
+RDEPENDS:${PN} = "cgroup-lite fuse-overlayfs libdevmapper podman"
+RDEPENDS:${PN}-dev = "bash perl"
+
+do_compile:prepend() {
+    cd ${S}/src/github.com/containers/buildah
+}
+
+go_do_compile() {
+        export TMPDIR="${GOTMPDIR}"
+        if [ -n "${GO_INSTALL}" ]; then
+                if [ -n "${GO_LINKSHARED}" ]; then
+                        ${GO} install ${GOBUILDFLAGS} ./cmd/buildah
+                        ${GO} install ${GOBUILDFLAGS} ./tests/imgtype/imgtype.go
+                        ${GO} install ${GOBUILDFLAGS} ./tests/copy/copy.go
+                        rm -rf ${B}/bin
+                fi
+                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./cmd/buildah
+                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./tests/imgtype/imgtype.go
+                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./tests/copy/copy.go
+        fi
+}
+
+do_install:append() {
+    dest_dir=${D}/${sysconfdir}/containers
+    mkdir -p ${dest_dir}
+    install -m 666 ${S}/src/github.com/containers/buildah/docs/samples/registries.conf ${dest_dir}/buildah.registries.conf.sample
+    install -m 666 ${S}/src/github.com/containers/buildah/tests/policy.json ${dest_dir}/buildah.policy.json.sample
+}
-- 
2.25.1


