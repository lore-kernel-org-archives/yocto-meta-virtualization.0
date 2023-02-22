Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE67C636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 11:41:36 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web11.6667.1677066090170308570
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 03:41:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=him8B4Hr;
 spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id i24so3209023ila.7
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Feb 2023 03:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GDtsikLWLMNkPzJKJ9qFxObxGpjsldYMZUKmzaAWV1w=;
        b=him8B4HrLYL1hItQVWcifGgbiLMwqDNAuTOgIQh3PHp8c3QaXPK1gpEGrTKhjz6Sjo
         4Uo1fuJOrBy6O66Swgi9x8YFNrR1KahLTomYDn71YKkNvVfNZoDimu6QG68tL+CMzG2W
         CRX3CfAZmy1TgatPgxeOSWum7DIYLjYKycKQxfB1ydnty9LH2zsj1eZ5C2EkkwVN67m+
         v6aYaq3UR6ar3+20g7zl4eeYlbpUez5n7N3NfmU25vZQyzeF1gZhSa5ZXTI5dDP5FEHk
         rW9PgS2ZqmyPVwuLoIzNb7yI8gKV3GlCICgPm/w3HviOUDwgNHfSXd27kuVZrVAClpnX
         yT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GDtsikLWLMNkPzJKJ9qFxObxGpjsldYMZUKmzaAWV1w=;
        b=IHh1GQCaiDrxAAmMEUUfXYDbP4HHSNtm4VCMf9rOUYRFQ0vBTEn3vLlsn/32r0HTQa
         apfeIiWr1M+wS8nwaoDBu/UJkCfHK8d3MnKrYzvDxbZfni1PaJhqn1wlr84lQq1upxV9
         c28wAo3trjd+PGmoHy2c+uy3HlU9CtpfpIfZsks1SX6fkwYC4YJOh2WyZUjl70SHTrq9
         sWL70UXifaAua5sB1+68dT/kXjaS39zQ1EMdYViCPi05T1CyhiJJpA339wiQ2/cqEnXs
         XZptktQkF9/h0I1qMTpjF8Cns6ECsHA+AwkWUz/5WNLuwBkRm99pyUNGIuVeZJU1Ecyb
         eWHQ==
X-Gm-Message-State: AO0yUKVehhFp5pqCoM/RWStZ9baW756UXXY+CULR6MTgWVnH24GsmeuY
	cbKdVrWcYmLtFdqTJx9XqkHW49Pm2y/QheyseYo=
X-Google-Smtp-Source: AK7set8LsfyY0MxvkYvoq8oSc7wCsZN05eDPcH2kcEA43bVLXrQoozm9GeAVTHB30N5nEY3Y7ddyExamkw5LtbGZxyk=
X-Received: by 2002:a05:6e02:e07:b0:314:24e2:5189 with SMTP id
 a7-20020a056e020e0700b0031424e25189mr1966593ilk.0.1677066088962; Wed, 22 Feb
 2023 03:41:28 -0800 (PST)
MIME-Version: 1.0
References: <PR3P192MB0714875B214757CD0A475B9DDAAA9@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
In-Reply-To: <PR3P192MB0714875B214757CD0A475B9DDAAA9@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 22 Feb 2023 06:41:17 -0500
Message-ID: <CADkTA4Py_w_pTcTYJRQjwL_sorBJBYcAHMOf7WbSykgmXoUJNg@mail.gmail.com>
Subject: Re: [meta-virtualization][dunfell][PATCH 3/3] containerd: upgrade to 1.4.13
To: hsimeliere.opensource@witekio.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000007f62b005f5486069"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Feb 2023 11:41:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7893

--0000000000007f62b005f5486069
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 22, 2023, 5:43 AM Hugo Simeliere via lists.yoctoproject.org
<hsimeliere.opensource=witekio.com@lists.yoctoproject.org> wrote:

> Fixes below CVEs:
> * CVE-2020-15257
> * CVE-2021-21334
> * CVE-2021-32760
> * CVE-2021-41103
> * CVE-2022-23648
>
> Based on commit cd6feb72b84aab9655af6c8c0774a180ea2a4f60
>
> Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
> ---
>  .../containerd/containerd-docker_git.bb       | 10 ++-
>  .../0001-Add-build-option-GODEBUG-1.patch     | 28 +++-----
>  ...1-build-use-oe-provided-GO-and-flags.patch | 42 -----------
>  .../containerd-opencontainers_git.bb          | 20 ++----
>  recipes-containers/containerd/containerd.inc  |  9 ++-
>  ...1-build-use-oe-provided-GO-and-flags.patch | 70 +++++++++++++++++++
>  6 files changed, 100 insertions(+), 79 deletions(-)
>  delete mode 100644
> recipes-containers/containerd/containerd-opencontainers/0001-build-use-oe-provided-GO-and-flags.patch
>  create mode 100644
> recipes-containers/containerd/files/0001-build-use-oe-provided-GO-and-flags.patch
>
> diff --git a/recipes-containers/containerd/containerd-docker_git.bb
> b/recipes-containers/containerd/containerd-docker_git.bb
> index f6b0e28..8d1a27a 100644
> --- a/recipes-containers/containerd/containerd-docker_git.bb
> +++ b/recipes-containers/containerd/containerd-docker_git.bb
> @@ -1,8 +1,11 @@
>  SRCREV = "3addd840653146c90a254301d6c3a663c7fd6429"
>  SRC_URI = "\
> - git://
> github.com/docker/containerd.git;branch=v0.2.x;destsuffix=git/src/github.com/containerd/containerd;protocol=https
> \
> + git://
> github.com/docker/containerd.git;branch=v0.2.x;destsuffix=git/src/github.com/containerd/containerd
> \
>   "
>
> +
> +LIC_FILES_CHKSUM =
> "file://LICENSE.code;md5=aadc30f9c14d876ded7bedc0afd2d3d7"
> +
>  include containerd.inc
>
>  CONTAINERD_VERSION = "v0.2.x"
> @@ -12,3 +15,8 @@ PROVIDES += "virtual/containerd"
>  RPROVIDES_${PN} = "virtual/containerd"
>
>  DEPENDS += "btrfs-tools"
> +
> +do_compile_prepend() {
> + bberror "${PN} is depreciated and will be removed in the future"
> + bbfatal "use container-opencontainers for a working configuration"
> +}
> diff --git
> a/recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch
> b/recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch
> index fec9ea6..8b43c8a 100644
> ---
> a/recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch
> +++
> b/recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch
> @@ -15,28 +15,18 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   src/import/Makefile | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> -diff --git a/src/import/Makefile b/src/import/Makefile
> -index 4355395..4fb5d3b 100644
> ---- a/src/import/Makefile
> -+++ b/src/import/Makefile
> -@@ -75,11 +75,15 @@ TEST_REQUIRES_ROOT_PACKAGES=$(filter \
> +Index: git/src/import/Makefile
> +===================================================================
> +--- git.orig/src/import/Makefile 2020-10-12 08:09:41.638977052 -0700
> ++++ git/src/import/Makefile 2020-10-12 08:10:49.783074373 -0700
> +@@ -72,6 +72,10 @@
>   COMMANDS=ctr containerd containerd-stress
> - MANPAGES=ctr.1 containerd.1 containerd-config.1 containerd-config.toml.5
> + MANPAGES=ctr.8 containerd.8 containerd-config.8 containerd-config.toml.5
>
>  +ifndef GODEBUG
>  +   EXTRA_LDFLAGS += -s -w
>  +endif
>  +
> - # Build tags seccomp and apparmor are needed by CRI plugin.
> - BUILDTAGS ?= seccomp apparmor
> - GO_TAGS=$(if $(BUILDTAGS),-tags "$(BUILDTAGS)",)
> --GO_LDFLAGS=-ldflags '-s -w -X $(PKG)/version.Version=$(VERSION) -X
> $(PKG)/version.Revision=$(REVISION) -X $(PKG)/version.Package=$(PACKAGE)
> $(EXTRA_LDFLAGS)'
> --SHIM_GO_LDFLAGS=-ldflags '-s -w -X $(PKG)/version.Version=$(VERSION) -X
> $(PKG)/version.Revision=$(REVISION) -X $(PKG)/version.Package=$(PACKAGE)
> -extldflags "-static"'
> -+GO_LDFLAGS=-ldflags '-X $(PKG)/version.Version=$(VERSION) -X
> $(PKG)/version.Revision=$(REVISION) -X $(PKG)/version.Package=$(PACKAGE)
> $(EXTRA_LDFLAGS)'
> -+SHIM_GO_LDFLAGS=-ldflags '-X $(PKG)/version.Version=$(VERSION) -X
> $(PKG)/version.Revision=$(REVISION) -X $(PKG)/version.Package=$(PACKAGE)
> -extldflags "-static $(EXTRA_EXTLDFLAGS)" $(EXTRA_LDFLAGS)'
> -
> - #Replaces ":" (*nix), ";" (windows) with newline for easy parsing
> - GOPATHS=$(shell echo ${GOPATH} | tr ":" "\n" | tr ";" "\n")
> ---
> -2.7.4
> -
> + ifdef BUILDTAGS
> +     GO_BUILDTAGS = ${BUILDTAGS}
> + endif
> diff --git
> a/recipes-containers/containerd/containerd-opencontainers/0001-build-use-oe-provided-GO-and-flags.patch
> b/recipes-containers/containerd/containerd-opencontainers/0001-build-use-oe-provided-GO-and-flags.patch
> deleted file mode 100644
> index d4d5973..0000000
> ---
> a/recipes-containers/containerd/containerd-opencontainers/0001-build-use-oe-provided-GO-and-flags.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 408e8b526d490af817a64b7220e8e2c3789de58f Mon Sep 17 00:00:00 2001
> -From: Bruce Ashfield <bruce.ashfield@gmail.com>
> -Date: Sun, 10 Feb 2019 23:46:06 +0000
> -Subject: [PATCH] build: use oe provided GO and flags
> -
> -We want to use the go compiler as defined in the oe-enviroment, not the
> -generic call to 'go'. Without changing this, we'll get things like cgo
> -errors and invalid flag combos.
> -
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ----
> - Makefile | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -Index: git/src/import/Makefile
> -===================================================================
> ---- git.orig/src/import/Makefile
> -+++ git/src/import/Makefile
> -@@ -166,19 +166,19 @@
> - # Build a binary from a cmd.
> - bin/%: cmd/% FORCE
> - @echo "$(WHALE) $@${BINARY_SUFFIX}"
> -- @go build ${GO_GCFLAGS} ${GO_BUILD_FLAGS} -o $@${BINARY_SUFFIX}
> ${GO_LDFLAGS} ${GO_TAGS}  ./$<
> -+ @$(GO) build ${GO_GCFLAGS} ${GO_BUILD_FLAGS} -o $@${BINARY_SUFFIX}
> ${GO_LDFLAGS} ${GO_TAGS}  ./$<
> -
> - bin/containerd-shim: cmd/containerd-shim FORCE # set !cgo and omit pie
> for a static shim build:
> https://github.com/golang/go/issues/17789#issuecomment-258542220
> - @echo "$(WHALE) bin/containerd-shim"
> -- @CGO_ENABLED=0 go build ${GO_BUILD_FLAGS} -o bin/containerd-shim
> ${SHIM_GO_LDFLAGS} ${GO_TAGS} ./cmd/containerd-shim
> -+ @$(GO) build ${GO_BUILD_FLAGS} -o bin/containerd-shim
> ${SHIM_GO_LDFLAGS} ${GO_TAGS} ./cmd/containerd-shim
> -
> - bin/containerd-shim-runc-v1: cmd/containerd-shim-runc-v1 FORCE # set
> !cgo and omit pie for a static shim build:
> https://github.com/golang/go/issues/17789#issuecomment-258542220
> - @echo "$(WHALE) bin/containerd-shim-runc-v1"
> -- @CGO_ENABLED=0 go build ${GO_BUILD_FLAGS} -o
> bin/containerd-shim-runc-v1 ${SHIM_GO_LDFLAGS} ${GO_TAGS}
> ./cmd/containerd-shim-runc-v1
> -+ @$(GO) build ${GO_BUILD_FLAGS} -o bin/containerd-shim-runc-v1
> ${SHIM_GO_LDFLAGS} ${GO_TAGS} ./cmd/containerd-shim-runc-v1
> -
> - bin/containerd-shim-runhcs-v1: cmd/containerd-shim-runhcs-v1 FORCE # set
> !cgo and omit pie for a static shim build:
> https://github.com/golang/go/issues/17789#issuecomment-258542220
> - @echo "$(WHALE) bin/containerd-shim-runhcs-v1${BINARY_SUFFIX}"
> -- @CGO_ENABLED=0 go build ${GO_BUILD_FLAGS} -o
> bin/containerd-shim-runhcs-v1${BINARY_SUFFIX} ${SHIM_GO_LDFLAGS} ${GO_TAGS}
> ./cmd/containerd-shim-runhcs-v1
> -+ @$(GO) build ${GO_BUILD_FLAGS} -o
> bin/containerd-shim-runhcs-v1${BINARY_SUFFIX} ${SHIM_GO_LDFLAGS}
> $(GOBUILDFLAGS) ${GO_TAGS} ./cmd/containerd-shim-runhcs-v1
> -
> - binaries: $(BINARIES) ## build binaries
> - @echo "$(WHALE) $@"
> diff --git a/recipes-containers/containerd/
> containerd-opencontainers_git.bb b/recipes-containers/containerd/
> containerd-opencontainers_git.bb
> index 5f697ed..19a1e60 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> @@ -1,5 +1,5 @@
> -SRCREV = "3b3e9d5f62a114153829f9fbe2781d27b0a2ddac"
> -SRC_URI = "git://
> github.com/containerd/containerd;branch=release/1.2;protocol=https \
> +SRCREV = "9cc61520f4cd876b86e77edfeb88fbcd536d1f9d"
> +SRC_URI = "git://github.com/containerd/containerd;branch=release/1.4 \
>             file://0001-build-use-oe-provided-GO-and-flags.patch \
>             file://0001-Add-build-option-GODEBUG-1.patch \
>            "
> @@ -8,20 +8,10 @@ include containerd.inc
>
>  LIC_FILES_CHKSUM =
> "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d89"
>
> -CONTAINERD_VERSION = "v1.2.14"
> +CONTAINERD_VERSION = "v1.4.13"
> +CVE_VERSION = "1.4.13"
>

Thanks for the CVE efforts!

But we unfortunately don't do version bumps like this on the stable
branches. Only a 1.2.x version bump would meet the bugfix only criteria
that most layers in the yocto project ecosystem follow.

If there aren't any minor releases upstream, then we are stuck with
patches.

If there's no other route to address bugs or security issues, then it isn't
impossible to do a version bump like this, but it is rare and would need
some runtime testing as these components can be quite sensitive to interop
issues when versions change.

Bruce


> -# Work around internal error in gold triggered due to DWARF-5 by forcing
> to use bfd even with ld-is-gold:
> -#
> _/OE/lge/build/webosose/dunfell/BUILD/work/qemux86_64-webos-linux/containerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d5f62-r0/git/src/import/cmd/containerd-shim
> -#
> /OE/lge/build/webosose/dunfell/BUILD/work/qemux86_64-webos-linux/containerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d5f62-r0/recipe-sysroot-native/usr/lib/x86_64-webos-linux/go/pkg/tool/linux_amd64/link:
> running x86_64-webos-linux-gcc failed: exit status 1
> -#
> /OE/lge/build/webosose/dunfell/BUILD/work/qemux86_64-webos-linux/containerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d5f62-r0/recipe-sysroot-native/usr/bin/x86_64-webos-linux/../../libexec/x86_64-webos-linux/gcc/x86_64-webos-linux/9.3.0/ld:
> internal error in read_header_prolog, at ../../gold/dwarf_reader.cc:1678
> -# collect2: error: ld returned 1 exit status
> -# alternatively we can backport DWARF-5 support to binutils-2.34 used in
> dunfell like in:
> -#
> https://git.openembedded.org/openembedded-core/commit/?id=d07d4d739ae17787017f771dd2068fda0e836722
> -EXTRA_EXTLDFLAGS = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold',
> ' -fuse-ld=bfd ', '', d)}"
> -
> -EXTRA_OEMAKE += "GODEBUG=1 EXTRA_EXTLDFLAGS='${EXTRA_EXTLDFLAGS}'"
> +EXTRA_OEMAKE += "GODEBUG=1"
>
>  PROVIDES += "virtual/containerd"
>  RPROVIDES_${PN} = "virtual/containerd"
> -
> -CVE_PRODUCT = "containerd"
> diff --git a/recipes-containers/containerd/containerd.inc
> b/recipes-containers/containerd/containerd.inc
> index e226edf..2a14a44 100644
> --- a/recipes-containers/containerd/containerd.inc
> +++ b/recipes-containers/containerd/containerd.inc
> @@ -6,7 +6,7 @@ DESCRIPTION = "containerd is a daemon to control runC,
> built for performance and
>
>  # Apache-2.0 for containerd
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM =
> "file://src/import/LICENSE.code;md5=aadc30f9c14d876ded7bedc0afd2d3d7"
> +LIC_FILES_CHKSUM ?=
> "file://src/import/LICENSE.code;md5=aadc30f9c14d876ded7bedc0afd2d3d7"
>
>  SRC_URI += "file://containerd.service"
>
> @@ -38,7 +38,7 @@ do_compile() {
>      # without this, the stress test parts of the build fail
>      cp ${S}/src/import/*.go ${S}/src/import/vendor/src/
> github.com/containerd/containerd
>
> -    for c in content errdefs fs images mount snapshots linux api runtimes
> defaults progress \
> +    for c in content timeout ttrpcutil oom stdio process errdefs fs
> images mount snapshots linux api runtimes defaults progress \
>       protobuf reference diff platforms runtime remotes version archive
> dialer gc metadata \
>       metrics filters identifiers labels leases plugin server services \
>       cmd cio containers namespaces oci events log reaper sys rootfs
> nvidia seed apparmor seccomp; do
> @@ -64,6 +64,7 @@ do_compile() {
>      export BUILDTAGS="no_btrfs static_build netgo"
>      export CFLAGS="${CFLAGS}"
>      export LDFLAGS="${LDFLAGS}"
> +    export SHIM_CGO_ENABLED="${CGO_ENABLED}"
>
>      cd ${S}/src/import
>      oe_runmake binaries
> @@ -79,12 +80,16 @@ do_install() {
>
>   cp ${S}/src/import/bin/containerd ${D}/${bindir}/containerd
>   cp ${S}/src/import/bin/containerd-shim ${D}/${bindir}/containerd-shim
> + cp ${S}/src/import/bin/containerd-shim-runc-v1
> ${D}/${bindir}/containerd-shim-runc-v1
> + cp ${S}/src/import/bin/containerd-shim-runc-v2
> ${D}/${bindir}/containerd-shim-runc-v2
>   cp ${S}/src/import/bin/ctr ${D}/${bindir}/containerd-ctr
>
>   ln -sf containerd ${D}/${bindir}/docker-containerd
>   ln -sf containerd-shim ${D}/${bindir}/docker-containerd-shim
>   ln -sf containerd-ctr ${D}/${bindir}/docker-containerd-ctr
>
> + ln -sf containerd-ctr ${D}/${bindir}/ctr
> +
>   if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};
> then
>   install -d ${D}${systemd_unitdir}/system
>   install -m 644 ${WORKDIR}/containerd.service
> ${D}/${systemd_unitdir}/system
> diff --git
> a/recipes-containers/containerd/files/0001-build-use-oe-provided-GO-and-flags.patch
> b/recipes-containers/containerd/files/0001-build-use-oe-provided-GO-and-flags.patch
> new file mode 100644
> index 0000000..a58feed
> --- /dev/null
> +++
> b/recipes-containers/containerd/files/0001-build-use-oe-provided-GO-and-flags.patch
> @@ -0,0 +1,70 @@
> +From 408e8b526d490af817a64b7220e8e2c3789de58f Mon Sep 17 00:00:00 2001
> +From: Bruce Ashfield <bruce.ashfield@gmail.com>
> +Date: Sun, 10 Feb 2019 23:46:06 +0000
> +Subject: [PATCH] build: use oe provided GO and flags
> +
> +We want to use the go compiler as defined in the oe-enviroment, not the
> +generic call to 'go'. Without changing this, we'll get things like cgo
> +errors and invalid flag combos.
> +
> +Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> +---
> + Makefile | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +Index: git/src/import/Makefile
> +===================================================================
> +--- git.orig/src/import/Makefile 2020-10-12 07:36:18.775820388 -0700
> ++++ git/src/import/Makefile 2020-10-12 08:00:05.134151221 -0700
> +@@ -163,19 +163,19 @@
> +
> + build: ## build the go packages
> + @echo "$(WHALE) $@"
> +- @go build ${DEBUG_GO_GCFLAGS} ${GO_GCFLAGS} ${GO_BUILD_FLAGS}
> ${EXTRA_FLAGS} ${GO_LDFLAGS} ${PACKAGES}
> ++ @$(GO) build ${DEBUG_GO_GCFLAGS} ${GO_GCFLAGS} ${GO_BUILD_FLAGS}
> ${EXTRA_FLAGS} ${GO_LDFLAGS} ${PACKAGES}
> +
> + test: ## run tests, except integration tests and tests that require root
> + @echo "$(WHALE) $@"
> +- @go test ${TESTFLAGS} $(filter-out ${INTEGRATION_PACKAGE},${PACKAGES})
> ++ @$(GO) test ${TESTFLAGS} $(filter-out
> ${INTEGRATION_PACKAGE},${PACKAGES})
> +
> + root-test: ## run tests, except integration tests
> + @echo "$(WHALE) $@"
> +- @go test ${TESTFLAGS} $(filter-out
> ${INTEGRATION_PACKAGE},${TEST_REQUIRES_ROOT_PACKAGES}) -test.root
> ++ @$(GO) test ${TESTFLAGS} $(filter-out
> ${INTEGRATION_PACKAGE},${TEST_REQUIRES_ROOT_PACKAGES}) -test.root
> +
> + integration: ## run integration tests
> + @echo "$(WHALE) $@"
> +- @go test ${TESTFLAGS} -test.root -parallel ${TESTFLAGS_PARALLEL}
> ++ @$(GO) test ${TESTFLAGS} -test.root -parallel ${TESTFLAGS_PARALLEL}
> +
> + benchmark: ## run benchmarks tests
> + @echo "$(WHALE) $@"
> +@@ -185,7 +185,7 @@
> +
> + define BUILD_BINARY =
> + @echo "$(WHALE) $@"
> +-@go build ${DEBUG_GO_GCFLAGS} ${GO_GCFLAGS} ${GO_BUILD_FLAGS} -o $@
> ${GO_LDFLAGS} ${GO_TAGS}  ./$<
> ++@$(GO) build ${DEBUG_GO_GCFLAGS} ${GO_GCFLAGS} ${GO_BUILD_FLAGS} -o $@
> ${GO_LDFLAGS} ${GO_TAGS}  ./$<
> + endef
> +
> + # Build a binary from a cmd.
> +@@ -194,15 +194,15 @@
> +
> + bin/containerd-shim: cmd/containerd-shim FORCE # set !cgo and omit pie
> for a static shim build:
> https://github.com/golang/go/issues/17789#issuecomment-258542220
> + @echo "$(WHALE) bin/containerd-shim"
> +- @CGO_ENABLED=${SHIM_CGO_ENABLED} go build ${GO_BUILD_FLAGS} -o
> bin/containerd-shim ${SHIM_GO_LDFLAGS} ${GO_TAGS} ./cmd/containerd-shim
> ++ @CGO_ENABLED=${SHIM_CGO_ENABLED} $(GO) build -a -pkgdir
> dontusecurrentpkgs ${GO_BUILD_FLAGS} -o bin/containerd-shim
> ${SHIM_GO_LDFLAGS} ${GO_TAGS} ./cmd/containerd-shim
> +
> + bin/containerd-shim-runc-v1: cmd/containerd-shim-runc-v1 FORCE # set
> !cgo and omit pie for a static shim build:
> https://github.com/golang/go/issues/17789#issuecomment-258542220
> + @echo "$(WHALE) bin/containerd-shim-runc-v1"
> +- @CGO_ENABLED=${SHIM_CGO_ENABLED} go build ${GO_BUILD_FLAGS} -o
> bin/containerd-shim-runc-v1 ${SHIM_GO_LDFLAGS} ${GO_TAGS}
> ./cmd/containerd-shim-runc-v1
> ++ @CGO_ENABLED=${SHIM_CGO_ENABLED} $(GO) build -a -pkgdir
> dontusecurrentpkgs ${GO_BUILD_FLAGS} -o bin/containerd-shim-runc-v1
> ${SHIM_GO_LDFLAGS} ${GO_TAGS} ./cmd/containerd-shim-runc-v1
> +
> + bin/containerd-shim-runc-v2: cmd/containerd-shim-runc-v2 FORCE # set
> !cgo and omit pie for a static shim build:
> https://github.com/golang/go/issues/17789#issuecomment-258542220
> + @echo "$(WHALE) bin/containerd-shim-runc-v2"
> +- @CGO_ENABLED=${SHIM_CGO_ENABLED} go build ${GO_BUILD_FLAGS} -o
> bin/containerd-shim-runc-v2 ${SHIM_GO_LDFLAGS} ${GO_TAGS}
> ./cmd/containerd-shim-runc-v2
> ++ @CGO_ENABLED=${SHIM_CGO_ENABLED} $(GO) build -a -pkgdir
> dontusecurrentpkgs ${GO_BUILD_FLAGS} -o bin/containerd-shim-runc-v2
> ${SHIM_GO_LDFLAGS} ${GO_TAGS} ./cmd/containerd-shim-runc-v2
> +
> + binaries: $(BINARIES) ## build binaries
> + @echo "$(WHALE) $@"
> --
> 2.39.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7892):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7892
> Mute This Topic: https://lists.yoctoproject.org/mt/97157111/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000007f62b005f5486069
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Feb 22, 2023, 5:43 AM Hugo Simeliere via <a hr=
ef=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;hsimeli=
ere.opensource=3D<a href=3D"mailto:witekio.com@lists.yoctoproject.org">wite=
kio.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">




<div dir=3D"ltr">
<u></u>Fixes below CVEs:
<div>* CVE-2020-15257</div>
<div>* CVE-2021-21334</div>
<div>* CVE-2021-32760</div>
<div>* CVE-2021-41103</div>
<div>* CVE-2022-23648</div>
<div><br>
</div>
<div>Based on commit cd6feb72b84aab9655af6c8c0774a180ea2a4f60</div>
<div><br>
</div>
<div>Signed-off-by: Hugo SIMELIERE &lt;<a href=3D"mailto:hsimeliere.opensou=
rce@witekio.com" target=3D"_blank" rel=3D"noreferrer">hsimeliere.opensource=
@witekio.com</a>&gt;</div>
<div>---</div>
<div>=C2=A0.../containerd/<a href=3D"http://containerd-docker_git.bb" targe=
t=3D"_blank" rel=3D"noreferrer">containerd-docker_git.bb</a> =C2=A0 =C2=A0 =
=C2=A0 | 10 ++-</div>
<div>=C2=A0.../0001-Add-build-option-GODEBUG-1.patch =C2=A0 =C2=A0 | 28 +++=
-----</div>
<div>=C2=A0...1-build-use-oe-provided-GO-and-flags.patch | 42 -----------</=
div>
<div>=C2=A0.../<a href=3D"http://containerd-opencontainers_git.bb" target=
=3D"_blank" rel=3D"noreferrer">containerd-opencontainers_git.bb</a> =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 20 ++----</div>
<div>=C2=A0recipes-containers/containerd/containerd.inc =C2=A0| =C2=A09 ++-=
</div>
<div>=C2=A0...1-build-use-oe-provided-GO-and-flags.patch | 70 +++++++++++++=
++++++</div>
<div>=C2=A06 files changed, 100 insertions(+), 79 deletions(-)</div>
<div>=C2=A0delete mode 100644 recipes-containers/containerd/containerd-open=
containers/0001-build-use-oe-provided-GO-and-flags.patch</div>
<div>=C2=A0create mode 100644 recipes-containers/containerd/files/0001-buil=
d-use-oe-provided-GO-and-flags.patch</div>
<div><br>
</div>
<div>diff --git a/recipes-containers/containerd/<a href=3D"http://container=
d-docker_git.bb" target=3D"_blank" rel=3D"noreferrer">containerd-docker_git=
.bb</a> b/recipes-containers/containerd/<a href=3D"http://containerd-docker=
_git.bb" target=3D"_blank" rel=3D"noreferrer">containerd-docker_git.bb</a><=
/div>
<div>index f6b0e28..8d1a27a 100644</div>
<div>--- a/recipes-containers/containerd/<a href=3D"http://containerd-docke=
r_git.bb" target=3D"_blank" rel=3D"noreferrer">containerd-docker_git.bb</a>=
</div>
<div>+++ b/recipes-containers/containerd/<a href=3D"http://containerd-docke=
r_git.bb" target=3D"_blank" rel=3D"noreferrer">containerd-docker_git.bb</a>=
</div>
<div>@@ -1,8 +1,11 @@</div>
<div>=C2=A0SRCREV =3D &quot;3addd840653146c90a254301d6c3a663c7fd6429&quot;<=
/div>
<div>=C2=A0SRC_URI =3D &quot;\</div>
<div>-=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82git://<a href=3D"http://=
github.com/docker/containerd.git;branch=3Dv0.2.x;destsuffix=3Dgit/src/githu=
b.com/containerd/containerd;protocol=3Dhttps" target=3D"_blank" rel=3D"nore=
ferrer">github.com/docker/containerd.git;branch=3Dv0.2.x;destsuffix=3Dgit/s=
rc/github.com/containerd/containerd;protocol=3Dhttps</a> \</div>
<div>+=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82git://<a href=3D"http://=
github.com/docker/containerd.git;branch=3Dv0.2.x;destsuffix=3Dgit/src/githu=
b.com/containerd/containerd" target=3D"_blank" rel=3D"noreferrer">github.co=
m/docker/containerd.git;branch=3Dv0.2.x;destsuffix=3Dgit/src/github.com/con=
tainerd/containerd</a> \</div>
<div>=C2=A0=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82&quot;</div>
<div>=C2=A0</div>
<div>+</div>
<div>+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.code;md5=3Daadc30f9c14d876d=
ed7bedc0afd2d3d7&quot;</div>
<div>+</div>
<div>=C2=A0include containerd.inc</div>
<div>=C2=A0</div>
<div>=C2=A0CONTAINERD_VERSION =3D &quot;v0.2.x&quot;</div>
<div>@@ -12,3 +15,8 @@ PROVIDES +=3D &quot;virtual/containerd&quot;</div>
<div>=C2=A0RPROVIDES_${PN} =3D &quot;virtual/containerd&quot;</div>
<div>=C2=A0</div>
<div>=C2=A0DEPENDS +=3D &quot;btrfs-tools&quot;</div>
<div>+</div>
<div>+do_compile_prepend() {</div>
<div>+=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82bberror &quot;${PN} is d=
epreciated and will be removed in the future&quot;</div>
<div>+=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82bbfatal &quot;use contai=
ner-opencontainers for a working configuration&quot;</div>
<div>+}</div>
<div>diff --git a/recipes-containers/containerd/containerd-opencontainers/0=
001-Add-build-option-GODEBUG-1.patch b/recipes-containers/containerd/contai=
nerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch</div>
<div>index fec9ea6..8b43c8a 100644</div>
<div>--- a/recipes-containers/containerd/containerd-opencontainers/0001-Add=
-build-option-GODEBUG-1.patch</div>
<div>+++ b/recipes-containers/containerd/containerd-opencontainers/0001-Add=
-build-option-GODEBUG-1.patch</div>
<div>@@ -15,28 +15,18 @@ Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:ho=
ngxu.jia@windriver.com" target=3D"_blank" rel=3D"noreferrer">hongxu.jia@win=
driver.com</a>&gt;</div>
<div>=C2=A0 src/import/Makefile | 8 ++++++--</div>
<div>=C2=A0 1 file changed, 6 insertions(+), 2 deletions(-)</div>
<div>=C2=A0</div>
<div>-diff --git a/src/import/Makefile b/src/import/Makefile</div>
<div>-index 4355395..4fb5d3b 100644</div>
<div>---- a/src/import/Makefile</div>
<div>-+++ b/src/import/Makefile</div>
<div>-@@ -75,11 +75,15 @@ TEST_REQUIRES_ROOT_PACKAGES=3D$(filter \</div>
<div>+Index: git/src/import/Makefile</div>
<div>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div>+--- git.orig/src/import/Makefile=E2=80=82=E2=80=82=E2=80=822020-10-12=
 08:09:41.638977052 -0700</div>
<div>++++ git/src/import/Makefile=E2=80=82=E2=80=822020-10-12 08:10:49.7830=
74373 -0700</div>
<div>+@@ -72,6 +72,10 @@</div>
<div>=C2=A0 COMMANDS=3Dctr containerd containerd-stress</div>
<div>- MANPAGES=3Dctr.1 containerd.1 containerd-config.1 containerd-config.=
toml.5</div>
<div>+ MANPAGES=3Dctr.8 containerd.8 containerd-config.8 containerd-config.=
toml.5</div>
<div>=C2=A0 </div>
<div>=C2=A0+ifndef GODEBUG</div>
<div>=C2=A0+ =C2=A0 EXTRA_LDFLAGS +=3D -s -w</div>
<div>=C2=A0+endif</div>
<div>=C2=A0+</div>
<div>- # Build tags seccomp and apparmor are needed by CRI plugin.</div>
<div>- BUILDTAGS ?=3D seccomp apparmor</div>
<div>- GO_TAGS=3D$(if $(BUILDTAGS),-tags &quot;$(BUILDTAGS)&quot;,)</div>
<div>--GO_LDFLAGS=3D-ldflags &#39;-s -w -X $(PKG)/version.Version=3D$(VERSI=
ON) -X $(PKG)/version.Revision=3D$(REVISION) -X $(PKG)/version.Package=3D$(=
PACKAGE) $(EXTRA_LDFLAGS)&#39;</div>
<div>--SHIM_GO_LDFLAGS=3D-ldflags &#39;-s -w -X $(PKG)/version.Version=3D$(=
VERSION) -X $(PKG)/version.Revision=3D$(REVISION) -X $(PKG)/version.Package=
=3D$(PACKAGE) -extldflags &quot;-static&quot;&#39;</div>
<div>-+GO_LDFLAGS=3D-ldflags &#39;-X $(PKG)/version.Version=3D$(VERSION) -X=
 $(PKG)/version.Revision=3D$(REVISION) -X $(PKG)/version.Package=3D$(PACKAG=
E) $(EXTRA_LDFLAGS)&#39;</div>
<div>-+SHIM_GO_LDFLAGS=3D-ldflags &#39;-X $(PKG)/version.Version=3D$(VERSIO=
N) -X $(PKG)/version.Revision=3D$(REVISION) -X $(PKG)/version.Package=3D$(P=
ACKAGE) -extldflags &quot;-static $(EXTRA_EXTLDFLAGS)&quot; $(EXTRA_LDFLAGS=
)&#39;</div>
<div>- </div>
<div>- #Replaces &quot;:&quot; (*nix), &quot;;&quot; (windows) with newline=
 for easy parsing</div>
<div>- GOPATHS=3D$(shell echo ${GOPATH} | tr &quot;:&quot; &quot;\n&quot; |=
 tr &quot;;&quot; &quot;\n&quot;)</div>
<div>--- </div>
<div>-2.7.4</div>
<div>-</div>
<div>+ ifdef BUILDTAGS</div>
<div>+ =C2=A0 =C2=A0 GO_BUILDTAGS =3D ${BUILDTAGS}</div>
<div>+ endif</div>
<div>diff --git a/recipes-containers/containerd/containerd-opencontainers/0=
001-build-use-oe-provided-GO-and-flags.patch b/recipes-containers/container=
d/containerd-opencontainers/0001-build-use-oe-provided-GO-and-flags.patch</=
div>
<div>deleted file mode 100644</div>
<div>index d4d5973..0000000</div>
<div>--- a/recipes-containers/containerd/containerd-opencontainers/0001-bui=
ld-use-oe-provided-GO-and-flags.patch</div>
<div>+++ /dev/null</div>
<div>@@ -1,42 +0,0 @@</div>
<div>-From 408e8b526d490af817a64b7220e8e2c3789de58f Mon Sep 17 00:00:00 200=
1</div>
<div>-From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.com</a>&gt;</div>
<div>-Date: Sun, 10 Feb 2019 23:46:06 +0000</div>
<div>-Subject: [PATCH] build: use oe provided GO and flags</div>
<div>-</div>
<div>-We want to use the go compiler as defined in the oe-enviroment, not t=
he</div>
<div>-generic call to &#39;go&#39;. Without changing this, we&#39;ll get th=
ings like cgo</div>
<div>-errors and invalid flag combos.</div>
<div>-</div>
<div>-Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.com</a>&=
gt;</div>
<div>----</div>
<div>- Makefile | 8 ++++----</div>
<div>- 1 file changed, 4 insertions(+), 4 deletions(-)</div>
<div>-</div>
<div>-Index: git/src/import/Makefile</div>
<div>-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div>---- git.orig/src/import/Makefile</div>
<div>-+++ git/src/import/Makefile</div>
<div>-@@ -166,19 +166,19 @@</div>
<div>- # Build a binary from a cmd.</div>
<div>- bin/%: cmd/% FORCE</div>
<div>- =E2=80=82=E2=80=82=E2=80=82=E2=80=82@echo &quot;$(WHALE) $@${BINARY_=
SUFFIX}&quot;</div>
<div>--=E2=80=82=E2=80=82=E2=80=82=E2=80=82@go build ${GO_GCFLAGS} ${GO_BUI=
LD_FLAGS} -o $@${BINARY_SUFFIX} ${GO_LDFLAGS} ${GO_TAGS} =C2=A0./$&lt;</div=
>
<div>-+=E2=80=82=E2=80=82=E2=80=82=E2=80=82@$(GO) build ${GO_GCFLAGS} ${GO_=
BUILD_FLAGS} -o $@${BINARY_SUFFIX} ${GO_LDFLAGS} ${GO_TAGS} =C2=A0./$&lt;</=
div>
<div>- </div>
<div>- bin/containerd-shim: cmd/containerd-shim FORCE # set !cgo and omit p=
ie for a static shim build: <a href=3D"https://github.com/golang/go/issues/=
17789#issuecomment-258542220" target=3D"_blank" rel=3D"noreferrer">https://=
github.com/golang/go/issues/17789#issuecomment-258542220</a></div>
<div>- =E2=80=82=E2=80=82=E2=80=82=E2=80=82@echo &quot;$(WHALE) bin/contain=
erd-shim&quot;</div>
<div>--=E2=80=82=E2=80=82=E2=80=82=E2=80=82@CGO_ENABLED=3D0 go build ${GO_B=
UILD_FLAGS} -o bin/containerd-shim ${SHIM_GO_LDFLAGS} ${GO_TAGS} ./cmd/cont=
ainerd-shim</div>
<div>-+=E2=80=82=E2=80=82=E2=80=82=E2=80=82@$(GO) build ${GO_BUILD_FLAGS} -=
o bin/containerd-shim ${SHIM_GO_LDFLAGS} ${GO_TAGS} ./cmd/containerd-shim</=
div>
<div>- </div>
<div>- bin/containerd-shim-runc-v1: cmd/containerd-shim-runc-v1 FORCE # set=
 !cgo and omit pie for a static shim build: <a href=3D"https://github.com/g=
olang/go/issues/17789#issuecomment-258542220" target=3D"_blank" rel=3D"nore=
ferrer">https://github.com/golang/go/issues/17789#issuecomment-258542220</a=
></div>
<div>- =E2=80=82=E2=80=82=E2=80=82=E2=80=82@echo &quot;$(WHALE) bin/contain=
erd-shim-runc-v1&quot;</div>
<div>--=E2=80=82=E2=80=82=E2=80=82=E2=80=82@CGO_ENABLED=3D0 go build ${GO_B=
UILD_FLAGS} -o bin/containerd-shim-runc-v1 ${SHIM_GO_LDFLAGS} ${GO_TAGS} ./=
cmd/containerd-shim-runc-v1</div>
<div>-+=E2=80=82=E2=80=82=E2=80=82=E2=80=82@$(GO) build ${GO_BUILD_FLAGS} -=
o bin/containerd-shim-runc-v1 ${SHIM_GO_LDFLAGS} ${GO_TAGS} ./cmd/container=
d-shim-runc-v1</div>
<div>- </div>
<div>- bin/containerd-shim-runhcs-v1: cmd/containerd-shim-runhcs-v1 FORCE #=
 set !cgo and omit pie for a static shim build: <a href=3D"https://github.c=
om/golang/go/issues/17789#issuecomment-258542220" target=3D"_blank" rel=3D"=
noreferrer">https://github.com/golang/go/issues/17789#issuecomment-25854222=
0</a></div>
<div>- =E2=80=82=E2=80=82=E2=80=82=E2=80=82@echo &quot;$(WHALE) bin/contain=
erd-shim-runhcs-v1${BINARY_SUFFIX}&quot;</div>
<div>--=E2=80=82=E2=80=82=E2=80=82=E2=80=82@CGO_ENABLED=3D0 go build ${GO_B=
UILD_FLAGS} -o bin/containerd-shim-runhcs-v1${BINARY_SUFFIX} ${SHIM_GO_LDFL=
AGS} ${GO_TAGS} ./cmd/containerd-shim-runhcs-v1</div>
<div>-+=E2=80=82=E2=80=82=E2=80=82=E2=80=82@$(GO) build ${GO_BUILD_FLAGS} -=
o bin/containerd-shim-runhcs-v1${BINARY_SUFFIX} ${SHIM_GO_LDFLAGS} $(GOBUIL=
DFLAGS) ${GO_TAGS} ./cmd/containerd-shim-runhcs-v1</div>
<div>- </div>
<div>- binaries: $(BINARIES) ## build binaries</div>
<div>- =E2=80=82=E2=80=82=E2=80=82=E2=80=82@echo &quot;$(WHALE) $@&quot;</d=
iv>
<div>diff --git a/recipes-containers/containerd/<a href=3D"http://container=
d-opencontainers_git.bb" target=3D"_blank" rel=3D"noreferrer">containerd-op=
encontainers_git.bb</a> b/recipes-containers/containerd/<a href=3D"http://c=
ontainerd-opencontainers_git.bb" target=3D"_blank" rel=3D"noreferrer">conta=
inerd-opencontainers_git.bb</a></div>
<div>index 5f697ed..19a1e60 100644</div>
<div>--- a/recipes-containers/containerd/<a href=3D"http://containerd-openc=
ontainers_git.bb" target=3D"_blank" rel=3D"noreferrer">containerd-openconta=
iners_git.bb</a></div>
<div>+++ b/recipes-containers/containerd/<a href=3D"http://containerd-openc=
ontainers_git.bb" target=3D"_blank" rel=3D"noreferrer">containerd-openconta=
iners_git.bb</a></div>
<div>@@ -1,5 +1,5 @@</div>
<div>-SRCREV =3D &quot;3b3e9d5f62a114153829f9fbe2781d27b0a2ddac&quot;</div>
<div>-SRC_URI =3D &quot;git://<a href=3D"http://github.com/containerd/conta=
inerd;branch=3Drelease/1.2;protocol=3Dhttps" target=3D"_blank" rel=3D"noref=
errer">github.com/containerd/containerd;branch=3Drelease/1.2;protocol=3Dhtt=
ps</a> \</div>
<div>+SRCREV =3D &quot;9cc61520f4cd876b86e77edfeb88fbcd536d1f9d&quot;</div>
<div>+SRC_URI =3D &quot;git://<a href=3D"http://github.com/containerd/conta=
inerd;branch=3Drelease/1.4" target=3D"_blank" rel=3D"noreferrer">github.com=
/containerd/containerd;branch=3Drelease/1.4</a> \</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-build-use-oe-pro=
vided-GO-and-flags.patch \</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Add-build-option=
-GODEBUG-1.patch \</div>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;</div>
<div>@@ -8,20 +8,10 @@ include containerd.inc</div>
<div>=C2=A0</div>
<div>=C2=A0LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;md5=3D1269f=
40c0d099c21a871163984590d89&quot;</div>
<div>=C2=A0</div>
<div>-CONTAINERD_VERSION =3D &quot;v1.2.14&quot;</div>
<div>+CONTAINERD_VERSION =3D &quot;v1.4.13&quot;</div>
<div>+CVE_VERSION =3D &quot;1.4.13&quot;</div></div></blockquote></div></di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for the CVE efforts!=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">But we unfortunately do=
n&#39;t do version bumps like this on the stable branches. Only a 1.2.x ver=
sion bump would meet the bugfix only criteria that most layers in the yocto=
 project ecosystem follow.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">If there aren&#39;t any minor releases upstream, then we are stuck with =
patches.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">If there&=
#39;s no other route to address bugs or security issues, then it isn&#39;t =
impossible to do a version bump like this, but it is rare and would need so=
me runtime testing as these components can be quite sensitive to interop is=
sues when versions change.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Bruce=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">
<div>=C2=A0</div>
<div>-# Work around internal error in gold triggered due to DWARF-5 by forc=
ing to use bfd even with ld-is-gold:</div>
<div>-# _/OE/lge/build/webosose/dunfell/BUILD/work/qemux86_64-webos-linux/c=
ontainerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d5f62-r0/git/src/import/cm=
d/containerd-shim</div>
<div>-# /OE/lge/build/webosose/dunfell/BUILD/work/qemux86_64-webos-linux/co=
ntainerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d5f62-r0/recipe-sysroot-nat=
ive/usr/lib/x86_64-webos-linux/go/pkg/tool/linux_amd64/link: running x86_64=
-webos-linux-gcc
 failed: exit status 1</div>
<div>-# /OE/lge/build/webosose/dunfell/BUILD/work/qemux86_64-webos-linux/co=
ntainerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d5f62-r0/recipe-sysroot-nat=
ive/usr/bin/x86_64-webos-linux/../../libexec/x86_64-webos-linux/gcc/x86_64-=
webos-linux/9.3.0/ld:
 internal error in read_header_prolog, at ../../gold/dwarf_reader.cc:1678</=
div>
<div>-# collect2: error: ld returned 1 exit status</div>
<div>-# alternatively we can backport DWARF-5 support to binutils-2.34 used=
 in dunfell like in:</div>
<div>-# <a href=3D"https://git.openembedded.org/openembedded-core/commit/?i=
d=3Dd07d4d739ae17787017f771dd2068fda0e836722" target=3D"_blank" rel=3D"nore=
ferrer">https://git.openembedded.org/openembedded-core/commit/?id=3Dd07d4d7=
39ae17787017f771dd2068fda0e836722</a></div>
<div>-EXTRA_EXTLDFLAGS =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&=
#39;, &#39;ld-is-gold&#39;, &#39; -fuse-ld=3Dbfd &#39;, &#39;&#39;, d)}&quo=
t;</div>
<div>-</div>
<div>-EXTRA_OEMAKE +=3D &quot;GODEBUG=3D1 EXTRA_EXTLDFLAGS=3D&#39;${EXTRA_E=
XTLDFLAGS}&#39;&quot;</div>
<div>+EXTRA_OEMAKE +=3D &quot;GODEBUG=3D1&quot;</div>
<div>=C2=A0</div>
<div>=C2=A0PROVIDES +=3D &quot;virtual/containerd&quot;</div>
<div>=C2=A0RPROVIDES_${PN} =3D &quot;virtual/containerd&quot;</div>
<div>-</div>
<div>-CVE_PRODUCT =3D &quot;containerd&quot;</div>
<div>diff --git a/recipes-containers/containerd/containerd.inc b/recipes-co=
ntainers/containerd/containerd.inc</div>
<div>index e226edf..2a14a44 100644</div>
<div>--- a/recipes-containers/containerd/containerd.inc</div>
<div>+++ b/recipes-containers/containerd/containerd.inc</div>
<div>@@ -6,7 +6,7 @@ DESCRIPTION =3D &quot;containerd is a daemon to contro=
l runC, built for performance and</div>
<div>=C2=A0</div>
<div>=C2=A0# Apache-2.0 for containerd</div>
<div>=C2=A0LICENSE =3D &quot;Apache-2.0&quot;</div>
<div>-LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE.code;md5=3Daadc3=
0f9c14d876ded7bedc0afd2d3d7&quot;</div>
<div>+LIC_FILES_CHKSUM ?=3D &quot;file://src/import/LICENSE.code;md5=3Daadc=
30f9c14d876ded7bedc0afd2d3d7&quot;</div>
<div>=C2=A0</div>
<div>=C2=A0SRC_URI +=3D &quot;file://containerd.service&quot;</div>
<div>=C2=A0</div>
<div>@@ -38,7 +38,7 @@ do_compile() {</div>
<div>=C2=A0 =C2=A0 =C2=A0# without this, the stress test parts of the build=
 fail</div>
<div>=C2=A0 =C2=A0 =C2=A0cp ${S}/src/import/*.go ${S}/src/import/vendor/src=
/<a href=3D"http://github.com/containerd/containerd" target=3D"_blank" rel=
=3D"noreferrer">github.com/containerd/containerd</a></div>
<div>=C2=A0</div>
<div>- =C2=A0 =C2=A0for c in content errdefs fs images mount snapshots linu=
x api runtimes defaults progress \</div>
<div>+ =C2=A0 =C2=A0for c in content timeout ttrpcutil oom stdio process er=
rdefs fs images mount snapshots linux api runtimes defaults progress \</div=
>
<div>=C2=A0=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82 =C2=A0 =C2=A0 protobuf reference diff =
platforms runtime remotes version archive dialer gc metadata \</div>
<div>=C2=A0=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82 =C2=A0 =C2=A0 metrics filters identifi=
ers labels leases plugin server services \</div>
<div>=C2=A0=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82 =C2=A0 =C2=A0 cmd cio containers names=
paces oci events log reaper sys rootfs nvidia seed apparmor seccomp; do</di=
v>
<div>@@ -64,6 +64,7 @@ do_compile() {</div>
<div>=C2=A0 =C2=A0 =C2=A0export BUILDTAGS=3D&quot;no_btrfs static_build net=
go&quot;</div>
<div>=C2=A0 =C2=A0 =C2=A0export CFLAGS=3D&quot;${CFLAGS}&quot;</div>
<div>=C2=A0 =C2=A0 =C2=A0export LDFLAGS=3D&quot;${LDFLAGS}&quot;</div>
<div>+ =C2=A0 =C2=A0export SHIM_CGO_ENABLED=3D&quot;${CGO_ENABLED}&quot;</d=
iv>
<div>=C2=A0</div>
<div>=C2=A0 =C2=A0 =C2=A0cd ${S}/src/import</div>
<div>=C2=A0 =C2=A0 =C2=A0oe_runmake binaries</div>
<div>@@ -79,12 +80,16 @@ do_install() {</div>
<div>=C2=A0</div>
<div>=C2=A0=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82cp ${S}/src/import/=
bin/containerd ${D}/${bindir}/containerd</div>
<div>=C2=A0=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82cp ${S}/src/import/=
bin/containerd-shim ${D}/${bindir}/containerd-shim</div>
<div>+=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82cp ${S}/src/import/bin/c=
ontainerd-shim-runc-v1 ${D}/${bindir}/containerd-shim-runc-v1</div>
<div>+=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82cp ${S}/src/import/bin/c=
ontainerd-shim-runc-v2 ${D}/${bindir}/containerd-shim-runc-v2</div>
<div>=C2=A0=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82cp ${S}/src/import/=
bin/ctr ${D}/${bindir}/containerd-ctr</div>
<div>=C2=A0=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82</div>
<div>=C2=A0=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82ln -sf containerd $=
{D}/${bindir}/docker-containerd</div>
<div>=C2=A0=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82ln -sf containerd-s=
him ${D}/${bindir}/docker-containerd-shim</div>
<div>=C2=A0=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82ln -sf containerd-c=
tr ${D}/${bindir}/docker-containerd-ctr</div>
<div>=C2=A0</div>
<div>+=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82ln -sf containerd-ctr ${=
D}/${bindir}/ctr</div>
<div>+</div>
<div>=C2=A0=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82if ${@bb.utils.cont=
ains(&#39;DISTRO_FEATURES&#39;,&#39;systemd&#39;,&#39;true&#39;,&#39;false&=
#39;,d)}; then</div>
<div>=C2=A0=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82install -d ${D}${systemd_unitdir}/syste=
m</div>
<div>=C2=A0=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82install -m 644 ${WORKDIR}/containerd.se=
rvice ${D}/${systemd_unitdir}/system</div>
<div>diff --git a/recipes-containers/containerd/files/0001-build-use-oe-pro=
vided-GO-and-flags.patch b/recipes-containers/containerd/files/0001-build-u=
se-oe-provided-GO-and-flags.patch</div>
<div>new file mode 100644</div>
<div>index 0000000..a58feed</div>
<div>--- /dev/null</div>
<div>+++ b/recipes-containers/containerd/files/0001-build-use-oe-provided-G=
O-and-flags.patch</div>
<div>@@ -0,0 +1,70 @@</div>
<div>+From 408e8b526d490af817a64b7220e8e2c3789de58f Mon Sep 17 00:00:00 200=
1</div>
<div>+From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.com</a>&gt;</div>
<div>+Date: Sun, 10 Feb 2019 23:46:06 +0000</div>
<div>+Subject: [PATCH] build: use oe provided GO and flags</div>
<div>+</div>
<div>+We want to use the go compiler as defined in the oe-enviroment, not t=
he</div>
<div>+generic call to &#39;go&#39;. Without changing this, we&#39;ll get th=
ings like cgo</div>
<div>+errors and invalid flag combos.</div>
<div>+</div>
<div>+Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.com</a>&=
gt;</div>
<div>+---</div>
<div>+ Makefile | 8 ++++----</div>
<div>+ 1 file changed, 4 insertions(+), 4 deletions(-)</div>
<div>+</div>
<div>+Index: git/src/import/Makefile</div>
<div>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div>+--- git.orig/src/import/Makefile=E2=80=82=E2=80=82=E2=80=822020-10-12=
 07:36:18.775820388 -0700</div>
<div>++++ git/src/import/Makefile=E2=80=82=E2=80=822020-10-12 08:00:05.1341=
51221 -0700</div>
<div>+@@ -163,19 +163,19 @@</div>
<div>+ </div>
<div>+ build: ## build the go packages</div>
<div>+ =E2=80=82=E2=80=82=E2=80=82=E2=80=82@echo &quot;$(WHALE) $@&quot;</d=
iv>
<div>+-=E2=80=82=E2=80=82=E2=80=82=E2=80=82@go build ${DEBUG_GO_GCFLAGS} ${=
GO_GCFLAGS} ${GO_BUILD_FLAGS} ${EXTRA_FLAGS} ${GO_LDFLAGS} ${PACKAGES}</div=
>
<div>++=E2=80=82=E2=80=82=E2=80=82=E2=80=82@$(GO) build ${DEBUG_GO_GCFLAGS}=
 ${GO_GCFLAGS} ${GO_BUILD_FLAGS} ${EXTRA_FLAGS} ${GO_LDFLAGS} ${PACKAGES}</=
div>
<div>+ </div>
<div>+ test: ## run tests, except integration tests and tests that require =
root</div>
<div>+ =E2=80=82=E2=80=82=E2=80=82=E2=80=82@echo &quot;$(WHALE) $@&quot;</d=
iv>
<div>+-=E2=80=82=E2=80=82=E2=80=82=E2=80=82@go test ${TESTFLAGS} $(filter-o=
ut ${INTEGRATION_PACKAGE},${PACKAGES})</div>
<div>++=E2=80=82=E2=80=82=E2=80=82=E2=80=82@$(GO) test ${TESTFLAGS} $(filte=
r-out ${INTEGRATION_PACKAGE},${PACKAGES})</div>
<div>+ </div>
<div>+ root-test: ## run tests, except integration tests</div>
<div>+ =E2=80=82=E2=80=82=E2=80=82=E2=80=82@echo &quot;$(WHALE) $@&quot;</d=
iv>
<div>+-=E2=80=82=E2=80=82=E2=80=82=E2=80=82@go test ${TESTFLAGS} $(filter-o=
ut ${INTEGRATION_PACKAGE},${TEST_REQUIRES_ROOT_PACKAGES}) -test.root</div>
<div>++=E2=80=82=E2=80=82=E2=80=82=E2=80=82@$(GO) test ${TESTFLAGS} $(filte=
r-out ${INTEGRATION_PACKAGE},${TEST_REQUIRES_ROOT_PACKAGES}) -test.root</di=
v>
<div>+ </div>
<div>+ integration: ## run integration tests</div>
<div>+ =E2=80=82=E2=80=82=E2=80=82=E2=80=82@echo &quot;$(WHALE) $@&quot;</d=
iv>
<div>+-=E2=80=82=E2=80=82=E2=80=82=E2=80=82@go test ${TESTFLAGS} -test.root=
 -parallel ${TESTFLAGS_PARALLEL}</div>
<div>++=E2=80=82=E2=80=82=E2=80=82=E2=80=82@$(GO) test ${TESTFLAGS} -test.r=
oot -parallel ${TESTFLAGS_PARALLEL}</div>
<div>+ </div>
<div>+ benchmark: ## run benchmarks tests</div>
<div>+ =E2=80=82=E2=80=82=E2=80=82=E2=80=82@echo &quot;$(WHALE) $@&quot;</d=
iv>
<div>+@@ -185,7 +185,7 @@</div>
<div>+ </div>
<div>+ define BUILD_BINARY =3D</div>
<div>+ @echo &quot;$(WHALE) $@&quot;</div>
<div>+-@go build ${DEBUG_GO_GCFLAGS} ${GO_GCFLAGS} ${GO_BUILD_FLAGS} -o $@ =
${GO_LDFLAGS} ${GO_TAGS} =C2=A0./$&lt;</div>
<div>++@$(GO) build ${DEBUG_GO_GCFLAGS} ${GO_GCFLAGS} ${GO_BUILD_FLAGS} -o =
$@ ${GO_LDFLAGS} ${GO_TAGS} =C2=A0./$&lt;</div>
<div>+ endef</div>
<div>+ </div>
<div>+ # Build a binary from a cmd.</div>
<div>+@@ -194,15 +194,15 @@</div>
<div>+ </div>
<div>+ bin/containerd-shim: cmd/containerd-shim FORCE # set !cgo and omit p=
ie for a static shim build: <a href=3D"https://github.com/golang/go/issues/=
17789#issuecomment-258542220" target=3D"_blank" rel=3D"noreferrer">https://=
github.com/golang/go/issues/17789#issuecomment-258542220</a></div>
<div>+ =E2=80=82=E2=80=82=E2=80=82=E2=80=82@echo &quot;$(WHALE) bin/contain=
erd-shim&quot;</div>
<div>+-=E2=80=82=E2=80=82=E2=80=82=E2=80=82@CGO_ENABLED=3D${SHIM_CGO_ENABLE=
D} go build ${GO_BUILD_FLAGS} -o bin/containerd-shim ${SHIM_GO_LDFLAGS} ${G=
O_TAGS} ./cmd/containerd-shim</div>
<div>++=E2=80=82=E2=80=82=E2=80=82=E2=80=82@CGO_ENABLED=3D${SHIM_CGO_ENABLE=
D} $(GO) build -a -pkgdir dontusecurrentpkgs ${GO_BUILD_FLAGS} -o bin/conta=
inerd-shim ${SHIM_GO_LDFLAGS} ${GO_TAGS} ./cmd/containerd-shim</div>
<div>+ </div>
<div>+ bin/containerd-shim-runc-v1: cmd/containerd-shim-runc-v1 FORCE # set=
 !cgo and omit pie for a static shim build: <a href=3D"https://github.com/g=
olang/go/issues/17789#issuecomment-258542220" target=3D"_blank" rel=3D"nore=
ferrer">https://github.com/golang/go/issues/17789#issuecomment-258542220</a=
></div>
<div>+ =E2=80=82=E2=80=82=E2=80=82=E2=80=82@echo &quot;$(WHALE) bin/contain=
erd-shim-runc-v1&quot;</div>
<div>+-=E2=80=82=E2=80=82=E2=80=82=E2=80=82@CGO_ENABLED=3D${SHIM_CGO_ENABLE=
D} go build ${GO_BUILD_FLAGS} -o bin/containerd-shim-runc-v1 ${SHIM_GO_LDFL=
AGS} ${GO_TAGS} ./cmd/containerd-shim-runc-v1</div>
<div>++=E2=80=82=E2=80=82=E2=80=82=E2=80=82@CGO_ENABLED=3D${SHIM_CGO_ENABLE=
D} $(GO) build -a -pkgdir dontusecurrentpkgs ${GO_BUILD_FLAGS} -o bin/conta=
inerd-shim-runc-v1 ${SHIM_GO_LDFLAGS} ${GO_TAGS} ./cmd/containerd-shim-runc=
-v1</div>
<div>+ </div>
<div>+ bin/containerd-shim-runc-v2: cmd/containerd-shim-runc-v2 FORCE # set=
 !cgo and omit pie for a static shim build: <a href=3D"https://github.com/g=
olang/go/issues/17789#issuecomment-258542220" target=3D"_blank" rel=3D"nore=
ferrer">https://github.com/golang/go/issues/17789#issuecomment-258542220</a=
></div>
<div>+ =E2=80=82=E2=80=82=E2=80=82=E2=80=82@echo &quot;$(WHALE) bin/contain=
erd-shim-runc-v2&quot;</div>
<div>+-=E2=80=82=E2=80=82=E2=80=82=E2=80=82@CGO_ENABLED=3D${SHIM_CGO_ENABLE=
D} go build ${GO_BUILD_FLAGS} -o bin/containerd-shim-runc-v2 ${SHIM_GO_LDFL=
AGS} ${GO_TAGS} ./cmd/containerd-shim-runc-v2</div>
<div>++=E2=80=82=E2=80=82=E2=80=82=E2=80=82@CGO_ENABLED=3D${SHIM_CGO_ENABLE=
D} $(GO) build -a -pkgdir dontusecurrentpkgs ${GO_BUILD_FLAGS} -o bin/conta=
inerd-shim-runc-v2 ${SHIM_GO_LDFLAGS} ${GO_TAGS} ./cmd/containerd-shim-runc=
-v2</div>
<div>+ </div>
<div>+ binaries: $(BINARIES) ## build binaries</div>
<div>+ =E2=80=82=E2=80=82=E2=80=82=E2=80=82@echo &quot;$(WHALE) $@&quot;</d=
iv>
<div>-- </div>
<div>2.39.2</div>
<div><br>
</div>
<u></u>
<div>
<div id=3D"m_6895269100824661304Signature">
<div>
<div></div>
</div>
</div>
</div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7892): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7892" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://lists.yoctoproject.org/g/meta-virtualization/message/7892</a><br=
>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/97157111/1050=
810" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctopro=
ject.org/mt/97157111/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank" rel=3D"noreferrer">meta-virtualization+owner@list=
s.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfi=
eld@gmail.com" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.co=
m</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--0000000000007f62b005f5486069--

