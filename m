Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEB1C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 23:43:59 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.13807.1653522231654835446
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 May 2022 16:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24PNhmYj000964
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 May 2022 16:43:49 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 24PNhm28027967
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 May 2022 16:43:48 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 25 May 2022 16:43:48 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 25 May 2022 16:43:48 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 25 May 2022 16:43:48 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH V2] buildah: add recipe for buildah v1.26
Date: Wed, 25 May 2022 19:43:47 -0400
Message-ID: <20220525234347.3799-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 25 May 2022 23:43:59 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7324

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
2.33.0


