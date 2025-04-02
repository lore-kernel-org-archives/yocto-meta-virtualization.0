Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA9F6C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 15:59:41 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.12688.1743609575805943989
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Apr 2025 08:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OwGYxCJk;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac25520a289so1163690666b.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Apr 2025 08:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743609574; x=1744214374; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iokQsibRpQKCkaU8TfZaDNlatJQIYGJ5150MXYKk07s=;
        b=OwGYxCJkqn312wAfbro0aGMyr8PE13fYdDkIQEuoE7HUqasfQHrgzcJMn1wGAzozgD
         LsstX2Z/mHgIEoNr506v6s0dsz7lM8s+eitOX2w0XGFWJM7fiAVKsLMGye3JqAClE7vu
         VjxhkjjkYsn+AP/eTodVm8R0DMo8tAcFEcnptum1mHTkbAxIKOOo5+lL7L03Uyc+aQkc
         m41WWwidOKyeI89gwOZ7PaoqujnV97kTyIKgZ8zMWWp++iOxx37GQSBC+NXG+1/hc+zF
         fast0QmvChvX/ApZqMn8KP/kUuH7ZpeJ+8rwETJNiXCvrkrxGMfCduo35J5FfnDRnz98
         WXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743609574; x=1744214374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iokQsibRpQKCkaU8TfZaDNlatJQIYGJ5150MXYKk07s=;
        b=tMc70XlLMBUzXO+N5UI0dd+cISIet94iXXTcoUp0A8YB0uft/dWohhlxNyy5ClrKYE
         vZLfugeI8Piecy+dzPrzG4vRL6ROd1n1zjWLRCTpE9DXnXlC0m+3058bd5hJy/bt7UT+
         L98aGxRv6GEHQHFengLf2DwRBcD8F0K4Rygu1jrBj1qnaLaXPvay6c7Je9mNBOQeDZf7
         ScLp479aJ6DgRlC1LY1WXQ6XzImht1/rdObvpP0tp36MEfriFtXGTe8LclASQrw0DLIZ
         QY9wVdzBKbG64RZ4XX4T7Xc3GIeWBps/rXLvnofykDiVdXExjgas4YeZnpOa7POj7yUP
         qEMw==
X-Gm-Message-State: AOJu0YwhmtlyyGjdFZ4IHyO5gHNP1HeUeY7ywznk8J/POcEPSdHnmw4w
	bw03B4r8o/Kmfb+x5OfMYasCLgqr7NhgQ1fAQeLvnHbtPswr0ZEsL0o77XVA
X-Gm-Gg: ASbGnct6IRUtpaULF9mXWT0Jw/arP7QJ176WDz4cdXAzD1GyIjbVh+QZkUX4UDKNXox
	Df3XECiSth8L455wgGSG6XhGZ6/fd0MoOp7J5jhKsX6QAkOsnzyhnpsVw2E35PkvCfwzZu7+Drn
	VCEA+PRBJx2GEr1BSAXN+uZGRUVQMzDBg0NnwMCD6a9vDN56KnRQbpumD+piX0rlKCB+hUDl0BA
	dV6pabir3gobHcqgpxld457v73gq+HVBQeviJnkorERx6+Uyw8n2dTgsbevDQZT0FGTAa1/AuYX
	WGiFF+QA06G6iO2hnXaSEZIp5ZLt8Pz2YsOgCCQlZOXmJG0=
X-Google-Smtp-Source: AGHT+IFbjSJ36HsjOm5LUUK7tX8uxBsmb8bq2HIw7V3AAMGzJUEFV9vz//mpBukxUKWiRhNoG1SbcA==
X-Received: by 2002:a17:907:a089:b0:abc:4b7:e3d3 with SMTP id a640c23a62f3a-ac738a3e93bmr1759205666b.27.1743609573832;
        Wed, 02 Apr 2025 08:59:33 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac71967f7a4sm929667266b.138.2025.04.02.08.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:59:33 -0700 (PDT)
From: martin.jansa@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 1/3] metadata: add whitespace around assignments
Date: Wed,  2 Apr 2025 17:59:25 +0200
Message-ID: <20250402155927.3585290-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Apr 2025 15:59:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9193

From: Martin Jansa <martin.jansa@gmail.com>

With:
https://lists.openembedded.org/g/bitbake-devel/message/17508
there are many WARNINGs from this layer will cover src_uri.inc files
in next commit.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../container-host-config.bb                  |  2 +-
 recipes-containers/cri-tools/cri-tools_git.bb |  2 +-
 recipes-containers/criu/criu_git.bb           |  4 ++--
 .../docker-compose/docker-compose_git.bb      |  2 +-
 .../docker-distribution_git.bb                |  4 ++--
 recipes-containers/docker/docker.inc          |  2 +-
 recipes-containers/lxc/lxc_git.bb             |  2 +-
 recipes-containers/nerdctl/nerdctl_git.bb     |  2 +-
 .../oci-image-tools/oci-image-tools_git.bb    |  2 +-
 recipes-containers/podman/podman_git.bb       |  4 ++--
 recipes-containers/riddler/riddler_git.bb     |  2 +-
 recipes-containers/runc/runc.inc              |  4 ++--
 recipes-containers/skopeo/skopeo_git.bb       |  2 +-
 recipes-containers/umoci/umoci_git.bb         |  2 +-
 recipes-core/runx/runx_git.bb                 |  4 ++--
 recipes-devtools/yq/yq_git.bb                 |  2 +-
 recipes-extended/ceph/ceph_git.bb             |  2 +-
 recipes-extended/dev86/dev86_git.bb           |  2 +-
 .../images/container-devtools-base.bb         |  2 +-
 recipes-extended/images/xtf-image.bb          |  2 +-
 recipes-extended/kvmtool/kvmtool_git.bb       |  2 +-
 recipes-extended/libvirt/libvirt-python.inc   |  2 +-
 .../rootlesskit/rootlesskit_git.bb            |  2 +-
 recipes-extended/xen/xen-hypervisor.inc       |  2 +-
 recipes-extended/xen/xen-tools.inc            |  4 ++--
 recipes-extended/xen/xen.inc                  | 20 +++++++++----------
 26 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/recipes-containers/container-host-config/container-host-config.bb b/recipes-containers/container-host-config/container-host-config.bb
index eb047da9..dc0ae201 100644
--- a/recipes-containers/container-host-config/container-host-config.bb
+++ b/recipes-containers/container-host-config/container-host-config.bb
@@ -11,7 +11,7 @@ SRC_URI = " \
     file://policy.json \
 "
 
-S="${UNPACKDIR}"
+S = "${UNPACKDIR}"
 
 do_install() {
 	install -d ${D}/${sysconfdir}/containers
diff --git a/recipes-containers/cri-tools/cri-tools_git.bb b/recipes-containers/cri-tools/cri-tools_git.bb
index d06e34c5..25f13702 100644
--- a/recipes-containers/cri-tools/cri-tools_git.bb
+++ b/recipes-containers/cri-tools/cri-tools_git.bb
@@ -36,7 +36,7 @@ inherit go
 inherit goarch
 inherit pkgconfig
 
-EXTRA_OEMAKE="BUILDTAGS=''"
+EXTRA_OEMAKE = "BUILDTAGS = ''"
 
 do_compile() {
 	# link fixups for compilation
diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index 8ecc1725..811eb7e3 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -49,8 +49,8 @@ CFLAGS += " -I${STAGING_INCDIR} -I${STAGING_INCDIR}/libnl3"
 CFLAGS:append:arm = " -D__WORDSIZE"
 
 # overide LDFLAGS to allow criu to build without: "x86_64-poky-linux-ld: unrecognized option '-Wl,-O1'"
-export LDFLAGS=""
-export C_INCLUDE_PATH="${STAGING_INCDIR}/libnl3"
+export LDFLAGS = ""
+export C_INCLUDE_PATH = "${STAGING_INCDIR}/libnl3"
 
 export BUILD_SYS
 export HOST_SYS
diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/recipes-containers/docker-compose/docker-compose_git.bb
index 575ee30e..e48ee9af 100644
--- a/recipes-containers/docker-compose/docker-compose_git.bb
+++ b/recipes-containers/docker-compose/docker-compose_git.bb
@@ -8,7 +8,7 @@ DEPENDS = " \
 "
 
 # Specify the first two important SRCREVs as the format
-SRCREV_FORMAT="compose_survey"
+SRCREV_FORMAT = "compose_survey"
 SRCREV_compose = "eaf9800948e022573997649656c040a19d4b15c2"
 
 SRC_URI = "git://github.com/docker/compose;name=compose;branch=main;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"
diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index c6e887f1..22e19ef4 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "The Docker toolset to pack, ship, store, and deliver content"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRCREV_distribution= "f22dd6186008ff9d35f92acc5bc5fd16ba7ef95a"
+SRCREV_distribution = "f22dd6186008ff9d35f92acc5bc5fd16ba7ef95a"
 SRC_URI = "git://github.com/docker/distribution.git;branch=main;name=distribution;destsuffix=git/src/github.com/distribution/distribution/v3;protocol=https \
            file://docker-registry.service \
            file://0001-build-use-to-use-cross-go-compiler.patch \
@@ -20,7 +20,7 @@ inherit goarch go systemd
 
 # This disables seccomp and apparmor, which are on by default in the
 # go package. 
-EXTRA_OEMAKE="BUILDTAGS=''"
+EXTRA_OEMAKE = "BUILDTAGS = ''"
 
 do_compile() {
 	export GOARCH="${TARGET_GOARCH}"
diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
index 3843f3b6..05a14f97 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -50,7 +50,7 @@ do_configure[noexec] = "1"
 # Export for possible use in Makefiles, default value comes from go.bbclass
 export GO_LINKSHARED
 
-DOCKER_PKG="github.com/docker/docker"
+DOCKER_PKG = "github.com/docker/docker"
 # in order to exclude devicemapper and btrfs - https://github.com/docker/docker/issues/14056
 BUILD_TAGS ?= "exclude_graphdriver_btrfs exclude_graphdriver_devicemapper"
 
diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
index fe713a0d..63123590 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -78,7 +78,7 @@ PACKAGECONFIG[doc] = "-Dman=true,-Dman=false,,"
 PACKAGECONFIG[apparmor] = "-Dapparmor=true,-Dapparmor=false,apparmor,apparmor"
 PACKAGECONFIG[templates] = ",,, ${PN}-templates"
 PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux,libselinux"
-PACKAGECONFIG[seccomp] ="-Dseccomp=true,-Dseccomp=false,libseccomp,libseccomp"
+PACKAGECONFIG[seccomp] = "-Dseccomp=true,-Dseccomp=false,libseccomp,libseccomp"
 PACKAGECONFIG[systemd] = "-Dsystemd-unitdir=${sysconfdir}/systemd/system/, -Dsystemd-unitdir=, systemd,"
 PACKAGECONFIG[systemd] = "-Dinit-script=systemd,-Dinit-script=sysvinit,systemd,"
 
diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
index 45e17c27..536c470b 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -10,7 +10,7 @@ DEPENDS = " \
 "
 
 # Specify the first two important SRCREVs as the format
-SRCREV_FORMAT="nerdcli_cgroups"
+SRCREV_FORMAT = "nerdcli_cgroups"
 SRCREV_nerdcli = "497c7cf74d09bf1ddf2678382360ca61e6faebac"
 
 SRC_URI = "git://github.com/containerd/nerdctl.git;name=nerdcli;branch=main;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"
diff --git a/recipes-containers/oci-image-tools/oci-image-tools_git.bb b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
index ade6534d..c2e07889 100644
--- a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
+++ b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
@@ -16,7 +16,7 @@ inherit go
 
 # This disables seccomp and apparmor, which are on by default in the
 # go package. 
-EXTRA_OEMAKE="BUILDTAGS=''"
+EXTRA_OEMAKE = "BUILDTAGS=''"
 
 S = "${WORKDIR}/git/src/github.com/opencontainers/image-tools"
 
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index be85e512..dd3e78d9 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -45,13 +45,13 @@ ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
 exclude_graphdriver_btrfs exclude_graphdriver_devicemapper ${BUILDTAGS_EXTRA}"
 
 # overide LDFLAGS to allow podman to build without: "flag provided but not # defined: -Wl,-O1
-export LDFLAGS=""
+export LDFLAGS = ""
 
 # https://github.com/llvm/llvm-project/issues/53999
 TOOLCHAIN = "gcc"
 
 # podmans Makefile expects BUILDFLAGS to be set but go.bbclass defines them in GOBUILDFLAGS
-export BUILDFLAGS="${GOBUILDFLAGS}"
+export BUILDFLAGS = "${GOBUILDFLAGS}"
 
 inherit go goarch
 inherit container-host
diff --git a/recipes-containers/riddler/riddler_git.bb b/recipes-containers/riddler/riddler_git.bb
index 3d6581a1..52630563 100644
--- a/recipes-containers/riddler/riddler_git.bb
+++ b/recipes-containers/riddler/riddler_git.bb
@@ -22,7 +22,7 @@ COMPATIBLE_HOST:mipsarch = "null"
 
 # This disables seccomp and apparmor, which are on by default in the
 # go package. 
-EXTRA_OEMAKE="BUILDTAGS=''"
+EXTRA_OEMAKE = "BUILDTAGS=''"
 
 do_compile() {
 	export GOARCH="${TARGET_GOARCH}"
diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/runc.inc
index a7c0f618..bcd7f791 100644
--- a/recipes-containers/runc/runc.inc
+++ b/recipes-containers/runc/runc.inc
@@ -30,7 +30,7 @@ RPROVIDES:${PN} = "virtual-runc"
 
 GO_IMPORT = "import"
 
-LIBCONTAINER_PACKAGE="github.com/opencontainers/runc/libcontainer"
+LIBCONTAINER_PACKAGE = "github.com/opencontainers/runc/libcontainer"
 
 do_configure[noexec] = "1"
 
@@ -38,7 +38,7 @@ do_configure[noexec] = "1"
 DISTRO_BUILDTAGS ?= "${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'seccomp', '', d)} \
                      ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
 
-EXTRA_OEMAKE="BUILDTAGS='${PACKAGECONFIG_CONFARGS} ${DISTRO_BUILDTAGS}' GO=${GO}"
+EXTRA_OEMAKE = "BUILDTAGS='${PACKAGECONFIG_CONFARGS} ${DISTRO_BUILDTAGS}' GO=${GO}"
 
 do_compile() {
 	# Set GOPATH. See 'PACKAGERS.md'. Don't rely on
diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
index bc9abb90..fe8cfa16 100644
--- a/recipes-containers/skopeo/skopeo_git.bb
+++ b/recipes-containers/skopeo/skopeo_git.bb
@@ -43,7 +43,7 @@ CVE_STATUS[CVE-2019-10214] = "fixed-version: This CVE was fixed in the container
 
 # This disables seccomp and apparmor, which are on by default in the
 # go package. 
-EXTRA_OEMAKE="BUILDTAGS=''"
+EXTRA_OEMAKE = "BUILDTAGS=''"
 
 do_compile() {
 	export GOARCH="${TARGET_GOARCH}"
diff --git a/recipes-containers/umoci/umoci_git.bb b/recipes-containers/umoci/umoci_git.bb
index 317e1137..84f7a40f 100644
--- a/recipes-containers/umoci/umoci_git.bb
+++ b/recipes-containers/umoci/umoci_git.bb
@@ -21,7 +21,7 @@ COMPATIBLE_HOST = "^(?!mips).*"
 
 # This disables seccomp and apparmor, which are on by default in the
 # go package. 
-EXTRA_OEMAKE="BUILDTAGS=''"
+EXTRA_OEMAKE = "BUILDTAGS=''"
 
 
 do_compile:class-native () {
diff --git a/recipes-core/runx/runx_git.bb b/recipes-core/runx/runx_git.bb
index 831360ba..b3250322 100644
--- a/recipes-core/runx/runx_git.bb
+++ b/recipes-core/runx/runx_git.bb
@@ -4,8 +4,8 @@ DESCRIPTION = "Xen Runtime for OCI"
 
 SRCREV_runx = "edc9350a79ede0365066c9743080e3dc6430d602"
 
-KERNEL_SRC_VER="linux-5.4"
-KERNEL_URL_VER="v5.x"
+KERNEL_SRC_VER = "linux-5.4"
+KERNEL_URL_VER = "v5.x"
 
 SRC_URI = "\
 	  git://github.com/lf-edge/runx;nobranch=1;name=runx;protocol=https \
diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
index a1adfc96..3d0714c7 100644
--- a/recipes-devtools/yq/yq_git.bb
+++ b/recipes-devtools/yq/yq_git.bb
@@ -11,7 +11,7 @@ SRCREV_cobra = "b43be995ebb4bee335a787bd44498b91aef7619c"
 SRCREV_pflag = "2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab"
 SRCREV_logging = "b2cb9fa56473e98db8caba80237377e83fe44db5"
 SRCREV_yaml = "f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
-SRCREV_xerrors="65e65417b02f28de84b55f16b46a1e789149973a"
+SRCREV_xerrors = "65e65417b02f28de84b55f16b46a1e789149973a"
 SRCREV_envsubst = "16035fe3571ad42c7796bf554f978bb2df64231b"
 SRCREV_participle = "49f4822ed012d9818c80ca4fcdeb7e2d55c04806"
 SRCREV_utfbom = "6ae8f945ca96f30defc7e8ab12ec5d10cf86ded4"
diff --git a/recipes-extended/ceph/ceph_git.bb b/recipes-extended/ceph/ceph_git.bb
index 32da1052..2eaa335a 100644
--- a/recipes-extended/ceph/ceph_git.bb
+++ b/recipes-extended/ceph/ceph_git.bb
@@ -18,7 +18,7 @@ SRC_URI = "gitsm://github.com/ceph/ceph.git;protocol=https;branch=main \
            file://0001-rgw-setup.py-allow-incompatible-pointer-types.patch \
 	   "
 
-SRCREV= "a53e858fd7cc6fd8c04f37d503ce9ed7080f2da6"
+SRCREV = "a53e858fd7cc6fd8c04f37d503ce9ed7080f2da6"
 PV = "20.0.0+git"
 
 S = "${WORKDIR}/git"
diff --git a/recipes-extended/dev86/dev86_git.bb b/recipes-extended/dev86/dev86_git.bb
index 5adf2826..6414ecfb 100644
--- a/recipes-extended/dev86/dev86_git.bb
+++ b/recipes-extended/dev86/dev86_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 SECTION = "console/tools"
 
-BASE_PV="0.16.21"
+BASE_PV = "0.16.21"
 PV = "${BASE_PV}+git"
 SRCREV = "e254e0b19651d3b8a20225b40281c9974a95dec4"
 SRC_URI = "git://github.com/jbruchon/${BPN}.git;protocol=https;branch=master \
diff --git a/recipes-extended/images/container-devtools-base.bb b/recipes-extended/images/container-devtools-base.bb
index 12e13fe6..63d40ab7 100644
--- a/recipes-extended/images/container-devtools-base.bb
+++ b/recipes-extended/images/container-devtools-base.bb
@@ -2,7 +2,7 @@ SUMMARY = "Basic container image with development tools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-CONTAINER_SHELL="bash"
+CONTAINER_SHELL = "bash"
 
 CORE_DEV_IMAGE_EXTRA_INSTALL ?= ""
 
diff --git a/recipes-extended/images/xtf-image.bb b/recipes-extended/images/xtf-image.bb
index f9ecea91..7b6eadfd 100644
--- a/recipes-extended/images/xtf-image.bb
+++ b/recipes-extended/images/xtf-image.bb
@@ -25,7 +25,7 @@ DESCRIPTION = "A minimal Xen Test Framework (XTF) image for testing the Xen hype
 # For testimage, see the qemu boot log: ${WORKDIR}/testimage/qemu_boot_log.*
 # and the test log: ${WORKDIR}/temp/log.do_testimage
 
-IMAGE_NAME="xtf"
+IMAGE_NAME = "xtf"
 
 IMAGE_INSTALL:append = " xtf"
 
diff --git a/recipes-extended/kvmtool/kvmtool_git.bb b/recipes-extended/kvmtool/kvmtool_git.bb
index 10f06993..6597873d 100644
--- a/recipes-extended/kvmtool/kvmtool_git.bb
+++ b/recipes-extended/kvmtool/kvmtool_git.bb
@@ -21,7 +21,7 @@ PV = "5.10.0+git"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE='V=1 EXTRA_CFLAGS="-I${STAGING_KERNEL_BUILDDIR}/include/generated -I${STAGING_KERNEL_BUILDDIR}/arch/${ARCH}/include/generated"'
+EXTRA_OEMAKE = 'V=1 EXTRA_CFLAGS="-I${STAGING_KERNEL_BUILDDIR}/include/generated -I${STAGING_KERNEL_BUILDDIR}/arch/${ARCH}/include/generated"'
 
 do_install() {
     install -d ${D}${bindir}
diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 6bf0ddac..20c9f69b 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -25,7 +25,7 @@ SRC_URI[libvirt_python.sha256sum] = "00efb9a781087668512d6a002eb9cd136e44ff8701a
 export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS = "-I${S}/include"
 export LIBVIRT_LIBS = "-L${B}/src/.libs -lvirt -ldl"
-export LDFLAGS="-L${B}/src/.libs"
+export LDFLAGS = "-L${B}/src/.libs"
 
 LIBVIRT_INSTALL_ARGS = "--root=${D} \
     --prefix=${prefix} \
diff --git a/recipes-extended/rootlesskit/rootlesskit_git.bb b/recipes-extended/rootlesskit/rootlesskit_git.bb
index fcc38e7a..f8dd55af 100644
--- a/recipes-extended/rootlesskit/rootlesskit_git.bb
+++ b/recipes-extended/rootlesskit/rootlesskit_git.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
     rsync-native \
 "
 # Specify the first two important SRCREVs as the format
-SRCREV_FORMAT="rootless"
+SRCREV_FORMAT = "rootless"
 SRCREV_rootless = "530859a92629689c0c17c96d9ab145f4d04b5b5a"
 
 SRC_URI = "git://github.com/rootless-containers/rootlesskit;name=rootless;branch=master;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"
diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
index 6f3d24d0..347f98f7 100644
--- a/recipes-extended/xen/xen-hypervisor.inc
+++ b/recipes-extended/xen/xen-hypervisor.inc
@@ -114,4 +114,4 @@ KCONFIG_CONFIG_ROOTDIR = "${S}/xen"
 
 # Xen is setting all CC flags on its own. Make sure that they are not modified
 # for aarch64, e.g. with architecture-specific optimizations.
-TUNE_CCARGS:aarch64=""
+TUNE_CCARGS:aarch64 = ""
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index ec727965..a034bc4c 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -721,14 +721,14 @@ FILES:${PN}-test += "\
 # test-cpu-policy and test-tsx only exist in 4.16 for x86
 ALLOW_EMPTY:${PN}-test = "1"
 
-FILES:${PN}-xen-mceinj +="\
+FILES:${PN}-xen-mceinj += "\
     ${sbindir}/xen-mceinj \
     "
 
 # xen-mceinj is only built for x86 4.16, so allow empty package
 ALLOW_EMPTY:${PN}-xen-mceinj = "1"
 
-FILES:${PN}-xen-vmtrace +="\
+FILES:${PN}-xen-vmtrace += "\
     ${sbindir}/xen-vmtrace \
     "
 
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 63790f73..f8c1e266 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -73,20 +73,20 @@ libexecdir = "${libdir}"
 export XEN_OS = "Linux"
 
 # this is used for the header (#!${bindir}/python) of the install python scripts
-export PYTHONPATH="${bindir}/env python3"
-export ac_cv_path_PYTHONPATH="${bindir}/env python3"
+export PYTHONPATH = "${bindir}/env python3"
+export ac_cv_path_PYTHONPATH = "${bindir}/env python3"
 export DISTUTILS_BUILD_ARGS
 export DISTUTILS_INSTALL_ARGS
 
 # xen and seabios require HOSTCC and HOSTCXX set to cross-compile
-export HOSTCC="${BUILD_CC}"
-export HOSTCXX="${BUILD_CXX}"
+export HOSTCC = "${BUILD_CC}"
+export HOSTCXX = "${BUILD_CXX}"
 
 # make xen requires CROSS_COMPILE set by hand as it does not abide by ./configure
-export CROSS_COMPILE="${TARGET_PREFIX}"
+export CROSS_COMPILE = "${TARGET_PREFIX}"
 
 # overide LDFLAGS to allow xen to build without: "x86_64-oe-linux-ld: unrecognized option '-Wl,-O1'"
-export LDFLAGS=""
+export LDFLAGS = ""
 
 # No additional C flags for the main hypervisor build
 EXTRA_CFLAGS_XEN_CORE ?= ""
@@ -99,7 +99,7 @@ DEBUG_PREFIX_MAP:append = " \
 # - The Xen tools build for x86 systems with HVM-mode enabled includes hvmloader
 #   which fails to build when "-m64" is included in flags set via the
 #   EXTRA_CFLAGS_XEN_TOOLS: so clear TUNE_CCARGS on x86 to prevent that.
-TUNE_CCARGS:x86-64=""
+TUNE_CCARGS:x86-64 = ""
 
 # - Yocto supplies the _FORTIFY_SOURCE flag via CC/CPP/CXX but then passes the
 #   optimization -O via C*FLAGS which is problematic when the CFLAGS are cleared
@@ -110,11 +110,11 @@ TUNE_CCARGS:x86-64=""
 #   It must not be compiled with SSE compiler options enabled and the Xen build
 #   explicitly clears CFLAGS to ensure that, so such options must not be passed
 #   in via the tool variable. hvmloader is required to run HVM-mode guest VMs.
-CC="${CCACHE}${HOST_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${DEBUG_PREFIX_MAP} ${CC_REPRODUCIBLE_OPTIONS}"
-EXTRA_CFLAGS_XEN_TOOLS="${HOST_CC_ARCH} ${CFLAGS}"
+CC = "${CCACHE}${HOST_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${DEBUG_PREFIX_MAP} ${CC_REPRODUCIBLE_OPTIONS}"
+EXTRA_CFLAGS_XEN_TOOLS = "${HOST_CC_ARCH} ${CFLAGS}"
 # 32-bit ARM needs the TUNE_CCARGS component of HOST_CC_ARCH to be passed
 # in CC to ensure that configure can compile binaries for the right arch.
-CC:arm="${CCACHE}${HOST_PREFIX}gcc ${TUNE_CCARGS} ${TOOLCHAIN_OPTIONS} ${DEBUG_PREFIX_MAP} ${CC_REPRODUCIBLE_OPTIONS}"
+CC:arm = "${CCACHE}${HOST_PREFIX}gcc ${TUNE_CCARGS} ${TOOLCHAIN_OPTIONS} ${DEBUG_PREFIX_MAP} ${CC_REPRODUCIBLE_OPTIONS}"
 
 # There are no Xen-provided variables for C++, so append to the tool variables:
 CPP:append = " ${CPPFLAGS}"

