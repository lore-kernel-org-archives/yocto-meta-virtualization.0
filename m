Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 21A6BE00CD8; Thu, 14 Sep 2017 13:30:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.217.174 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.217.174 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43805E00C78
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Sep 2017 13:30:50 -0700 (PDT)
Received: by mail-ua0-f174.google.com with SMTP id k63so260800uak.12
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Sep 2017 13:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Oth3LdASzWWK8OmvwlYfLLvGE+GHOEWoAmmDzf+Fq0s=;
	b=S6CHFEmhVwLOVCJ2ezbqjiWaJD7+SI2AsYoUJ6E4FO/3AaygMkH7NhbxS11o6JyC9V
	t6TGDk9IApzcpuSS40rQWk+lWKcK7RZbzmF73H8ofEv9m/54CS1gvtZuP29Xfnejuyp4
	sHAT9oLkYamG13Z0+Qq+X5V56kgFcFqT1YrJD5xdOXtM/0h21EXLSkuHPK5+TvaBmkhA
	QyoTZZLZxSlhnU6qk10HBmu2i/waxAPbOGY3SQy+1rteHb3p/c46+KX4ztqJIiVrV7y6
	X1ort0wFCeuCt3X/Z/aMu833Vc4HYWJ+OtGxTTRLq4u7W+3WuDVX2CCR3K3GIEj6NVOM
	JjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Oth3LdASzWWK8OmvwlYfLLvGE+GHOEWoAmmDzf+Fq0s=;
	b=ccBiCF7nH8n9w2yLkjaoo9d7jPIEFJXNGU/qiLq9R4t9hFXKDODf4K6oLyC271tkDs
	GCBUNmzGnGadLXpbdCG9E4L4JZGqXkTO/jmQwW7hqcvcjxKYXPog9mBaT1YbUkg/dnT4
	p6m6yq7cou9umzUDulqa7UOE/r1dd+wf3bXttu1IXR8VRVerg/icOEpCiYuVUiNR/zfL
	8FVdUPvZSFw7d2t1WwheUkRb0g9EZng90BnoEkTLRG2A3veN8iLHgvLLWZP1BZ+WCgfs
	YfwTlF7uf56RkcG3uMrtyB9wYqFc86qMomIozTmHvQEvu1SeBa68ezrEWArJLaxbgOdx
	66dg==
X-Gm-Message-State: AHPjjUjjt8Aovtf/kaZFY7DsFupAqTcNIpD/afPoRyWohmzoQg8urNE7
	wZyaNoAvKJIwU/rlughPKFuU/tJwPUgX/UW3voI=
X-Google-Smtp-Source: AOwi7QBlm6OLTmQyxMjlWO4ryhauWz8+f7FVGNwecT7K85NKFxhh7KllFYKXioWCo2F2FMt1t8a/EElYFu7wYqcexas=
X-Received: by 10.176.87.9 with SMTP id s9mr14519244uaa.147.1505421049960;
	Thu, 14 Sep 2017 13:30:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.59.18 with HTTP; Thu, 14 Sep 2017 13:30:49 -0700 (PDT)
In-Reply-To: <20170913193946.98950-1-jason.wessel@windriver.com>
References: <20170913193946.98950-1-jason.wessel@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Sep 2017 16:30:49 -0400
Message-ID: <CADkTA4PO3CjU7yMyqZ+svY07d5Bo-od1ne4ER6CQeU+qN3vxDA@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] nets, docker, runc, oci-*tools: go.bbclass compile fixes
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Sep 2017 20:30:55 -0000
Content-Type: multipart/alternative; boundary="f403045dcf5eeb9f8f05592c26c3"

--f403045dcf5eeb9f8f05592c26c3
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Sep 13, 2017 at 3:39 PM, Jason Wessel <jason.wessel@windriver.com>
wrote:

> Recently in the oe-core the go.bbclass changed and requires the
> defition of the GO_IMPORT variable.  This was intended to simplify how
> the compilation works with go packages and it is still a work in
> progress.
>
> This patch set makes the recipes compatible to generate the same end
> result as before using the new go.bbclass from oe-core.
>
> Any patches that were included in the recipes had to have the paths
> adjusted because the new go.bbclass manipulates the notion of S to be
> S + "src" + "$GO_IMPORT" internally for the purpose of unpack, patch
> and compile.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  recipes-containers/docker/docker_git.bb            | 29
> +++++++++++-----------
>  ...-golang.org-x-net-pkg-until-we-move-to-go.patch | 20 +++++++--------
>  ...est-Recursively-remove-pre-existing-entri.patch |  4 +--
>  ...est-Split-unpackLayerEntry-into-its-own-f.patch |  4 +--
>  .../oci-image-tools/oci-image-tools_git.bb         | 16 ++++++------
>  .../oci-runtime-tools/oci-runtime-tools_git.bb     | 22 ++++++++--------
>  recipes-containers/riddler/riddler_git.bb          | 14 ++++++-----
>  ...untime-spec-198f23f827eea397d4331d7eb048d.patch |  8 +++---
>  .../0001-runc-Add-console-socket-dev-null.patch    |  4 +--
>  ...-Remove-Platform-as-no-longer-in-OCI-spec.patch |  8 +++---
>  ...date-memory-specs-to-use-int64-not-uint64.patch | 12 ++++-----
>  recipes-containers/runc/runc-docker_git.bb         |  2 ++
>  recipes-containers/runc/runc.inc                   | 13 +++++-----
>  recipes-networking/netns/netns_git.bb              | 14 ++++++-----
>  14 files changed, 88 insertions(+), 82 deletions(-)
>
> diff --git a/recipes-containers/docker/docker_git.bb
> b/recipes-containers/docker/docker_git.bb
> index 1ced8f4..4d6c17c 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -32,7 +32,9 @@ SRC_URI = "\
>
>  # Apache-2.0 for docker
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=9740d093a080530b5c5c6573df9af45a"
> +LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=
> 9740d093a080530b5c5c6573df9af45a"
> +
> +GO_IMPORT = "import"
>
>  S = "${WORKDIR}/git"
>
> @@ -81,18 +83,17 @@ do_compile() {
>         # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
>         # docker to download its dependencies but rather
>         # use dependencies packaged independently.
> -       cd ${S}
> +       cd ${S}/src/import
>         rm -rf .gopath
>         mkdir -p .gopath/src/"$(dirname "${DOCKER_PKG}")"
>         ln -sf ../../../.. .gopath/src/"${DOCKER_PKG}"
>
>         mkdir -p .gopath/src/github.com/docker
> -       ln -sf ../../../../../libnetwork .gopath/src/github.com/docker/
> libnetwork
> -       ln -sf ../../../../../cli .gopath/src/github.com/docker/cli
> +       ln -sf ${WORKDIR}/libnetwork .gopath/src/github.com/docker/
> libnetwork
> +       ln -sf ${WORKDIR}/cli .gopath/src/github.com/docker/cli
>
> -       export GOPATH="${S}/.gopath:${S}/vendor:${STAGING_DIR_TARGET}/$
> {prefix}/local/go"
> +       export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:
> ${STAGING_DIR_TARGET}/${prefix}/local/go"
>         export GOROOT="${STAGING_DIR_NATIVE}/
> ${nonarch_libdir}/${HOST_SYS}/go"
> -       cd -
>
>         # Pass the needed cflags/ldflags so that cgo
>         # can find the needed headers files and libraries
> @@ -109,10 +110,10 @@ do_compile() {
>           ./hack/make.sh dynbinary
>
>         # build the proxy
> -       go build -o ${S}/docker-proxy github.com/docker/libnetwork/
> cmd/proxy
> +       go build -o ${S}/src/import/docker-proxy
> github.com/docker/libnetwork/cmd/proxy
>
>          # build the cli
> -       go build -o ${S}/bundles/latest/dynbinary-client/docker
> github.com/docker/cli/cmd/docker
> +       go build -o ${S}/src/import/bundles/latest/dynbinary-client/docker
> github.com/docker/cli/cmd/docker
>  }
>
>  SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_
> FEATURES','systemd','${PN}','',d)}"
> @@ -126,15 +127,15 @@ INITSCRIPT_PARAMS_${PN} = "defaults"
>
>  do_install() {
>         mkdir -p ${D}/${bindir}
> -       cp ${S}/bundles/latest/dynbinary-client/docker
> ${D}/${bindir}/docker
> -       cp ${S}/bundles/latest/dynbinary-daemon/dockerd
> ${D}/${bindir}/dockerd
> -       cp ${S}/docker-proxy ${D}/${bindir}/docker-proxy
> +       cp ${S}/src/import/bundles/latest/dynbinary-client/docker
> ${D}/${bindir}/docker
> +       cp ${S}/src/import/bundles/latest/dynbinary-daemon/dockerd
> ${D}/${bindir}/dockerd
> +       cp ${S}/src/import/docker-proxy ${D}/${bindir}/docker-proxy
>
>         if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};
> then
>                 install -d ${D}${systemd_unitdir}/system
> -               install -m 644 ${S}/contrib/init/systemd/docker.*
> ${D}/${systemd_unitdir}/system
> +               install -m 644 ${S}/src/import/contrib/init/systemd/docker.*
> ${D}/${systemd_unitdir}/system
>                 # replaces one copied from above with one that uses the
> local registry for a mirror
> -               install -m 644 ${S}/contrib/init/systemd/docker.service
> ${D}/${systemd_unitdir}/system
> +               install -m 644 ${S}/src/import/contrib/init/systemd/docker.service
> ${D}/${systemd_unitdir}/system
>         else
>                 install -d ${D}${sysconfdir}/init.d
>                 install -m 0755 ${WORKDIR}/docker.init
> ${D}${sysconfdir}/init.d/docker.init
> @@ -142,7 +143,7 @@ do_install() {
>
>         mkdir -p ${D}${datadir}/docker/
>         cp ${WORKDIR}/hi.Dockerfile ${D}${datadir}/docker/
> -       install -m 0755 ${S}/contrib/check-config.sh ${D}${datadir}/docker/
> +       install -m 0755 ${S}/src/import/contrib/check-config.sh
> ${D}${datadir}/docker/
>  }
>
>  inherit useradd
> diff --git a/recipes-containers/docker/files/context-use-golang.org-
> x-net-pkg-until-we-move-to-go.patch b/recipes-containers/docker/
> files/context-use-golang.org-x-net-pkg-until-we-move-to-go.patch
> index c43a7e7..7ed606f 100644
> --- a/recipes-containers/docker/files/context-use-golang.org-
> x-net-pkg-until-we-move-to-go.patch
> +++ b/recipes-containers/docker/files/context-use-golang.org-
> x-net-pkg-until-we-move-to-go.patch
> @@ -18,8 +18,8 @@ Signed-off-by: Mark Asselstine <
> mark.asselstine@windriver.com>
>   integration-cli/docker_cli_save_load_unix_test.go |    2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)
>
> ---- a/client/README.md
> -+++ b/client/README.md
> +--- a/src/import/client/README.md
> ++++ b/src/import/client/README.md
>  @@ -8,7 +8,7 @@ For example, to list running containers
>   package main
>
> @@ -29,8 +29,8 @@ Signed-off-by: Mark Asselstine <
> mark.asselstine@windriver.com>
>         "fmt"
>
>         "github.com/docker/docker/api/types"
> ---- a/client/client.go
> -+++ b/client/client.go
> +--- a/src/import/client/client.go
> ++++ b/src/import/client/client.go
>  @@ -19,7 +19,7 @@ For example, to list running containers
>         package main
>
> @@ -40,8 +40,8 @@ Signed-off-by: Mark Asselstine <
> mark.asselstine@windriver.com>
>                 "fmt"
>
>                 "github.com/docker/docker/api/types"
> ---- a/daemon/info_unix.go
> -+++ b/daemon/info_unix.go
> +--- a/src/import/daemon/info_unix.go
> ++++ b/src/import/daemon/info_unix.go
>  @@ -3,7 +3,7 @@
>   package daemon
>
> @@ -51,8 +51,8 @@ Signed-off-by: Mark Asselstine <
> mark.asselstine@windriver.com>
>         "os/exec"
>         "strings"
>
> ---- a/integration-cli/docker_api_attach_test.go
> -+++ b/integration-cli/docker_api_attach_test.go
> +--- a/src/import/integration-cli/docker_api_attach_test.go
> ++++ b/src/import/integration-cli/docker_api_attach_test.go
>  @@ -3,7 +3,7 @@ package main
>   import (
>         "bufio"
> @@ -62,8 +62,8 @@ Signed-off-by: Mark Asselstine <
> mark.asselstine@windriver.com>
>         "io"
>         "net"
>         "net/http"
> ---- a/integration-cli/docker_cli_save_load_unix_test.go
> -+++ b/integration-cli/docker_cli_save_load_unix_test.go
> +--- a/src/import/integration-cli/docker_cli_save_load_unix_test.go
> ++++ b/src/import/integration-cli/docker_cli_save_load_unix_test.go
>  @@ -3,7 +3,7 @@
>   package main
>
> diff --git a/recipes-containers/oci-image-tools/files/0001-image-
> manifest-Recursively-remove-pre-existing-entri.patch
> b/recipes-containers/oci-image-tools/files/0001-image-
> manifest-Recursively-remove-pre-existing-entri.patch
> index d2cacc2..5594f97 100644
> --- a/recipes-containers/oci-image-tools/files/0001-image-
> manifest-Recursively-remove-pre-existing-entri.patch
> +++ b/recipes-containers/oci-image-tools/files/0001-image-
> manifest-Recursively-remove-pre-existing-entri.patch
> @@ -40,8 +40,8 @@ Signed-off-by: W. Trevor King <wking@tremily.us>
>
>  diff --git a/image/manifest.go b/image/manifest.go
>  index 8834c1e5f2f0..144bd4f62219 100644
> ---- a/image/manifest.go
> -+++ b/image/manifest.go
> +--- a/src/import/image/manifest.go
> ++++ b/src/import/image/manifest.go
>  @@ -253,11 +253,27 @@ loop:
>                         continue loop
>                 }
> diff --git a/recipes-containers/oci-image-tools/files/0002-image-
> manifest-Split-unpackLayerEntry-into-its-own-f.patch
> b/recipes-containers/oci-image-tools/files/0002-image-manifest-Split-
> unpackLayerEntry-into-its-own-f.patch
> index 9cf513e..69bdcdb 100644
> --- a/recipes-containers/oci-image-tools/files/0002-image-manifest-Split-
> unpackLayerEntry-into-its-own-f.patch
> +++ b/recipes-containers/oci-image-tools/files/0002-image-manifest-Split-
> unpackLayerEntry-into-its-own-f.patch
> @@ -18,8 +18,8 @@ Signed-off-by: W. Trevor King <wking@tremily.us>
>
>  diff --git a/image/manifest.go b/image/manifest.go
>  index 144bd4f62219..dfd5a83f70e4 100644
> ---- a/image/manifest.go
> -+++ b/image/manifest.go
> +--- a/src/import/image/manifest.go
> ++++ b/src/import/image/manifest.go
>  @@ -218,116 +218,131 @@ loop:
>                         return errors.Wrapf(err, "error advancing tar
> stream")
>                 }
> diff --git a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
> b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
> index 393bd7b..37ac087 100644
> --- a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
> +++ b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
> @@ -18,8 +18,7 @@ SRC_URI = "git://github.com/
> opencontainers/image-tools.git \
>
>  SRCREV = "d0c8533b0a2c68344ff2c8aff03d7fc2dff3a108"
>  PV = "0.1.0+git${SRCPV}"
> -
> -S = "${WORKDIR}/git"
> +GO_IMPORT = "import"
>
>  inherit goarch
>  inherit go
> @@ -38,11 +37,11 @@ do_compile() {
>         #
>         # We also need to link in the ipallocator directory as that is not
> under
>         # a src directory.
> -       ln -sfn . "${S}/vendor/src"
> -       mkdir -p "${S}/vendor/src/github.com/opencontainers/image-tools/"
> -       ln -sfn "${S}/image" "${S}/vendor/src/github.com/
> opencontainers/image-tools/image"
> -       ln -sfn "${S}/version" "${S}/vendor/src/github.com/
> opencontainers/image-tools/version"
> -       export GOPATH="${S}/vendor"
> +       ln -sfn . "${S}/src/import/vendor/src"
> +       mkdir -p "${S}/src/import/vendor/src/gi
> thub.com/opencontainers/image-tools/"
> +       ln -sfn "${S}/src/import/image" "${S}/src/import/vendor/src/gi
> thub.com/opencontainers/image-tools/image"
> +       ln -sfn "${S}/src/import/version" "${S}/src/import/vendor/src/gi
> thub.com/opencontainers/image-tools/version"
> +       export GOPATH="${S}/src/import/vendor"
>
>         # Pass the needed cflags/ldflags so that cgo
>         # can find the needed headers files and libraries
> @@ -51,13 +50,14 @@ do_compile() {
>         export LDFLAGS=""
>         export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_
> TARGET}"
>         export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_
> TARGET}"
> +       cd ${S}/src/import
>
>         oe_runmake tool
>  }
>
>  do_install() {
>         install -d ${D}/${sbindir}
> -       install ${S}/oci-image-tool ${D}/${sbindir}/
> +       install ${S}/src/import/oci-image-tool ${D}/${sbindir}/
>  }
>
>  INSANE_SKIP_${PN} += "ldflags"
> diff --git a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
> b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
> index d73edfe..0d9c6e6 100644
> --- a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
> +++ b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
> @@ -1,14 +1,13 @@
>  HOMEPAGE = "https://github.com/opencontainers/runtime-tools"
>  SUMMARY = "oci-runtime-tool is a collection of tools for working with the
> OCI runtime specification"
>  LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b355a61a394a504dacde901c958f662c"
> +LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=
> b355a61a394a504dacde901c958f662c"
>
>  SRC_URI = "git://github.com/opencontainers/runtime-tools.git"
>
>  SRCREV = "15ec1df3f6607f4223ab3915547c184cf60a30dd"
>  PV = "0.0.1+git${SRCPV}"
> -
> -S = "${WORKDIR}/git"
> +GO_IMPORT = "import"
>
>  INSANE_SKIP_${PN} += "ldflags"
>
> @@ -18,7 +17,7 @@ inherit go
>  do_compile() {
>         export GOARCH="${TARGET_GOARCH}"
>         export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
> -       export GOPATH="${S}:${S}/vendor"
> +       export GOPATH="${S}/src/import:${S}/src/import/vendor"
>
>         # Pass the needed cflags/ldflags so that cgo
>         # can find the needed headers files and libraries
> @@ -29,17 +28,18 @@ do_compile() {
>         export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_
> TARGET}"
>
>         # link fixups for compilation
> -       rm -f ${S}/vendor/src
> -       ln -sf ./ ${S}/vendor/src
> -       mkdir -p ${S}/vendor/github.com/opencontainers/runtime-tools
> -       ln -sf ../../../../generate ${S}/vendor/github.com/
> opencontainers/runtime-tools/generate
> -       ln -sf ../../../../validate ${S}/vendor/github.com/
> opencontainers/runtime-tools/validate
> -       ln -sf ../../../../cmd ${S}/vendor/github.com/
> opencontainers/runtime-tools/cmd
> +       rm -f ${S}/src/import/vendor/src
> +       ln -sf ./ ${S}/src/import/vendor/src
> +       mkdir -p ${S}/src/import/vendor/github.com/opencontainers/runtime-
> tools
> +       ln -sf ../../../../generate ${S}/src/import/vendor/github.
> com/opencontainers/runtime-tools/generate
> +       ln -sf ../../../../validate ${S}/src/import/vendor/github.
> com/opencontainers/runtime-tools/validate
> +       ln -sf ../../../../cmd ${S}/src/import/vendor/github.
> com/opencontainers/runtime-tools/cmd
> +       cd ${S}/src/import
>
>         oe_runmake
>  }
>
>  do_install() {
>         install -d ${D}/${sbindir}
> -       install ${S}/oci-runtime-tool ${D}/${sbindir}/oci-runtime-tool
> +       install ${S}/src/import/oci-runtime-tool
> ${D}/${sbindir}/oci-runtime-tool
>  }
> diff --git a/recipes-containers/riddler/riddler_git.bb
> b/recipes-containers/riddler/riddler_git.bb
> index ae6c5ec..9f7fe6b 100644
> --- a/recipes-containers/riddler/riddler_git.bb
> +++ b/recipes-containers/riddler/riddler_git.bb
> @@ -1,11 +1,12 @@
>  HOMEPAGE = "https://github.com/jfrazelle/riddler"
>  SUMMARY = "Convert `docker inspect` to opencontainers (OCI compatible)
> runc spec."
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=20ce4c6a4f32d6ee4a68e3a7506db3f1"
> +LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=
> 20ce4c6a4f32d6ee4a68e3a7506db3f1"
>
>  SRC_URI = "git://github.com/jfrazelle/riddler;branch=master"
>  SRCREV = "23befa0b232877b5b502b828e24161d801bd67f6"
>  PV = "0.1.0+git${SRCPV}"
> +GO_IMPORT = "import"
>
>  S = "${WORKDIR}/git"
>
> @@ -26,10 +27,10 @@ do_compile() {
>         #
>         # We also need to link in the ipallocator directory as that is not
> under
>         # a src directory.
> -       ln -sfn . "${S}/vendor/src"
> -       mkdir -p "${S}/vendor/src/github.com/jessfraz/riddler"
> -       ln -sfn "${S}/parse" "${S}/vendor/src/github.com/
> jessfraz/riddler/parse"
> -       export GOPATH="${S}/vendor"
> +       ln -sfn . "${S}/src/import/vendor/src"
> +       mkdir -p "${S}/src/import/vendor/src/github.com/jessfraz/riddler"
> +       ln -sfn "${S}/src/import/parse" "${S}/src/import/vendor/src/gi
> thub.com/jessfraz/riddler/parse"
> +       export GOPATH="${S}/src/import/vendor"
>
>         # Pass the needed cflags/ldflags so that cgo
>         # can find the needed headers files and libraries
> @@ -38,11 +39,12 @@ do_compile() {
>         export LDFLAGS=""
>         export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_
> TARGET}"
>         export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_
> TARGET}"
> +       cd ${S}/src/import
>
>         oe_runmake static
>  }
>
>  do_install() {
>         install -d ${D}/${sbindir}
> -       install ${S}/riddler ${D}/${sbindir}/riddler
> +       install ${S}/src/import/riddler ${D}/${sbindir}/riddler
>  }
> diff --git a/recipes-containers/runc/runc-docker/0001-Update-to-
> runtime-spec-198f23f827eea397d4331d7eb048d.patch
> b/recipes-containers/runc/runc-docker/0001-Update-to-runtime-spec-
> 198f23f827eea397d4331d7eb048d.patch
> index bc1e9a2..bcc76fc 100644
> --- a/recipes-containers/runc/runc-docker/0001-Update-to-runtime-spec-
> 198f23f827eea397d4331d7eb048d.patch
> +++ b/recipes-containers/runc/runc-docker/0001-Update-to-runtime-spec-
> 198f23f827eea397d4331d7eb048d.patch
> @@ -14,8 +14,8 @@ Signed-off-by: Justin Cormack <justin.cormack@docker.com
> >
>
>  diff --git a/vendor.conf b/vendor.conf
>  index e23e7ea7..09a8a924 100644
> ---- a/vendor.conf
> -+++ b/vendor.conf
> +--- a/src/import/vendor.conf
> ++++ b/src/import/vendor.conf
>  @@ -1,7 +1,7 @@
>   # OCI runtime-spec. When updating this, make sure you use a version tag
> rather
>   # than a commit ID so it's much more obvious what version of the spec we
> are
> @@ -27,8 +27,8 @@ index e23e7ea7..09a8a924 100644
>   github.com/opencontainers/selinux v1.0.0-rc1
>  diff --git a/vendor/github.com/opencontainers/runtime-spec/
> specs-go/config.go b/vendor/github.com/opencontainers/runtime-spec/
> specs-go/config.go
>  index 8bf8d924..68ab112e 100644
> ---- a/vendor/github.com/opencontainers/runtime-spec/specs-go/config.go
> -+++ b/vendor/github.com/opencontainers/runtime-spec/specs-go/config.go
> +--- a/src/import/vendor/github.com/opencontainers/runtime-
> spec/specs-go/config.go
> ++++ b/src/import/vendor/github.com/opencontainers/runtime-
> spec/specs-go/config.go
>  @@ -6,8 +6,6 @@ import "os"
>   type Spec struct {
>         // Version of the Open Container Runtime Specification with which
> the bundle complies.
> diff --git a/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-dev-null.patch
> b/recipes-containers/runc/runc-docker/0001-runc-Add-
> console-socket-dev-null.patch
> index f49adfb..48c1250 100644
> --- a/recipes-containers/runc/runc-docker/0001-runc-Add-
> console-socket-dev-null.patch
> +++ b/recipes-containers/runc/runc-docker/0001-runc-Add-
> console-socket-dev-null.patch
> @@ -14,8 +14,8 @@ Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>
>  diff --git a/utils_linux.go b/utils_linux.go
>  index 8085f7fe..e6d31b35 100644
> ---- a/utils_linux.go
> -+++ b/utils_linux.go
> +--- a/src/import/utils_linux.go
> ++++ b/src/import/utils_linux.go
>  @@ -227,6 +227,11 @@ type runner struct {
>   }
>
> diff --git a/recipes-containers/runc/runc-docker/0002-Remove-
> Platform-as-no-longer-in-OCI-spec.patch b/recipes-containers/runc/
> runc-docker/0002-Remove-Platform-as-no-longer-in-OCI-spec.patch
> index 6ec286a..7970dec 100644
> --- a/recipes-containers/runc/runc-docker/0002-Remove-
> Platform-as-no-longer-in-OCI-spec.patch
> +++ b/recipes-containers/runc/runc-docker/0002-Remove-
> Platform-as-no-longer-in-OCI-spec.patch
> @@ -13,8 +13,8 @@ Signed-off-by: Justin Cormack <justin.cormack@docker.com
> >
>
>  diff --git a/libcontainer/specconv/example.go b/libcontainer/specconv/
> example.go
>  index 33134116..d6621194 100644
> ---- a/libcontainer/specconv/example.go
> -+++ b/libcontainer/specconv/example.go
> +--- a/src/import/libcontainer/specconv/example.go
> ++++ b/src/import/libcontainer/specconv/example.go
>  @@ -2,7 +2,6 @@ package specconv
>
>   import (
> @@ -36,8 +36,8 @@ index 33134116..d6621194 100644
>                         Readonly: true,
>  diff --git a/spec.go b/spec.go
>  index 92d38f57..876937d2 100644
> ---- a/spec.go
> -+++ b/spec.go
> +--- a/src/import/spec.go
> ++++ b/src/import/spec.go
>  @@ -7,7 +7,6 @@ import (
>         "fmt"
>         "io/ioutil"
> diff --git a/recipes-containers/runc/runc-docker/0003-Update-
> memory-specs-to-use-int64-not-uint64.patch b/recipes-containers/runc/
> runc-docker/0003-Update-memory-specs-to-use-int64-not-uint64.patch
> index 9cb3492..50a9b7f 100644
> --- a/recipes-containers/runc/runc-docker/0003-Update-
> memory-specs-to-use-int64-not-uint64.patch
> +++ b/recipes-containers/runc/runc-docker/0003-Update-
> memory-specs-to-use-int64-not-uint64.patch
> @@ -20,8 +20,8 @@ Signed-off-by: Justin Cormack <justin.cormack@docker.com
> >
>
>  diff --git a/libcontainer/cgroups/fs/memory.go b/libcontainer/cgroups/fs/
> memory.go
>  index da2cc9f8..b739c631 100644
> ---- a/libcontainer/cgroups/fs/memory.go
> -+++ b/libcontainer/cgroups/fs/memory.go
> +--- a/src/import/libcontainer/cgroups/fs/memory.go
> ++++ b/src/import/libcontainer/cgroups/fs/memory.go
>  @@ -73,14 +73,14 @@ func EnableKernelMemoryAccounting(path string) error
> {
>         // until a limit is set on the cgroup and limit cannot be set once
> the
>         // cgroup has children, or if there are already tasks in the
> cgroup.
> @@ -123,8 +123,8 @@ index da2cc9f8..b739c631 100644
>         }
>  diff --git a/libcontainer/configs/cgroup_linux.go
> b/libcontainer/configs/cgroup_linux.go
>  index 3e0509de..e15a662f 100644
> ---- a/libcontainer/configs/cgroup_linux.go
> -+++ b/libcontainer/configs/cgroup_linux.go
> +--- a/src/import/libcontainer/configs/cgroup_linux.go
> ++++ b/src/import/libcontainer/configs/cgroup_linux.go
>  @@ -43,19 +43,19 @@ type Resources struct {
>         Devices []*Device `json:"devices"`
>
> @@ -152,8 +152,8 @@ index 3e0509de..e15a662f 100644
>         CpuShares uint64 `json:"cpu_shares"`
>  diff --git a/update.go b/update.go
>  index 0ea90d60..133be999 100644
> ---- a/update.go
> -+++ b/update.go
> +--- a/src/import/update.go
> ++++ b/src/import/update.go
>  @@ -124,11 +124,11 @@ other options are ignored.
>
>                 r := specs.LinuxResources{
> diff --git a/recipes-containers/runc/runc-docker_git.bb
> b/recipes-containers/runc/runc-docker_git.bb
> index f412c84..9735325 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -10,6 +10,8 @@ SRC_URI = "git://github.com/docker/runc.
> git;nobranch=1;name=runc-docker \
>             file://0001-runc-Add-console-socket-dev-null.patch \
>            "
>
> +GO_IMPORT = "import"
> +
>  RUNC_VERSION = "1.0.0-rc3"
>  PROVIDES += "virtual/runc"
>  RPROVIDES_${PN} = "virtual/runc"
> diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/
> runc.inc
> index dbc83c2..83d5f86 100644
> --- a/recipes-containers/runc/runc.inc
> +++ b/recipes-containers/runc/runc.inc
> @@ -4,7 +4,7 @@ DESCRIPTION = "runc is a CLI tool for spawning and running
> containers according
>
>  # Apache-2.0 for containerd
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
> +LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=
> 435b266b3899aa8a959f17d41c56def8"
>
>  S = "${WORKDIR}/git"
>
> @@ -26,20 +26,19 @@ do_compile() {
>         # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
>         # docker to download its dependencies but rather
>         # use dependencies packaged independently.
> -       cd ${S}
> +       cd ${S}/src/import
>         rm -rf .gopath
>         dname=`dirname "${LIBCONTAINER_PACKAGE}"`
>         bname=`basename "${LIBCONTAINER_PACKAGE}"`
>         mkdir -p .gopath/src/${dname}
>
>         (cd .gopath/src/${dname}; ln -sf ../../../../../${bname} ${bname})
> -       export GOPATH="${S}/.gopath:${S}/vendor:${STAGING_DIR_TARGET}/$
> {prefix}/local/go"
> +       export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:
> ${STAGING_DIR_TARGET}/${prefix}/local/go"
>         export GOROOT="${STAGING_DIR_NATIVE}/
> ${nonarch_libdir}/${HOST_SYS}/go"
> -       cd -
>
>         # Fix up symlink for go-cross compiler
> -       rm -f ${S}/vendor/src
> -       ln -sf ./ ${S}/vendor/src
> +       rm -f ${S}/src/import/vendor/src
> +       ln -sf ./ ${S}/src/import/vendor/src
>
>         # Pass the needed cflags/ldflags so that cgo
>         # can find the needed headers files and libraries
> @@ -55,7 +54,7 @@ do_compile() {
>  do_install() {
>         mkdir -p ${D}/${bindir}
>
> -       cp ${S}/runc ${D}/${bindir}/runc
> +       cp ${S}/src/import/runc ${D}/${bindir}/runc
>         ln -sf runc ${D}/${bindir}/docker-runc
>  }
>
> diff --git a/recipes-networking/netns/netns_git.bb
> b/recipes-networking/netns/netns_git.bb
> index 641d55f..8e771f5 100644
> --- a/recipes-networking/netns/netns_git.bb
> +++ b/recipes-networking/netns/netns_git.bb
> @@ -1,11 +1,12 @@
>  HOMEPAGE = "https://github.com/jfrazelle/netns"
>  SUMMARY = "Runc hook for setting up default bridge networking."
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=20ce4c6a4f32d6ee4a68e3a7506db3f1"
> +LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=
> 20ce4c6a4f32d6ee4a68e3a7506db3f1"
>
>  SRC_URI = "git://github.com/jessfraz/netns;branch=master"
>  SRCREV = "85b1ab9fcccbaa404a2636b52a48bbde02437cf7"
>  PV = "0.1.0+git${SRCPV}"
> +GO_IMPORT = "import"
>
>  S = "${WORKDIR}/git"
>
> @@ -22,10 +23,10 @@ do_compile() {
>         #
>         # We also need to link in the ipallocator directory as that is not
> under
>         # a src directory.
> -       ln -sfn . "${S}/vendor/src"
> -       mkdir -p "${S}/vendor/src/github.com/jessfraz/netns"
> -       ln -sfn "${S}/ipallocator" "${S}/vendor/src/github.com/
> jessfraz/netns/ipallocator"
> -       export GOPATH="${S}/vendor"
> +       ln -sfn . "${S}/src/import/vendor/src"
> +       mkdir -p "${S}/src/import/vendor/src/github.com/jessfraz/netns"
> +       ln -sfn "${S}/src/import/ipallocator" "${S}/src/import/vendor/src/
> github.com/jessfraz/netns/ipallocator"
> +       export GOPATH="${S}/src/import/vendor"
>
>         # Pass the needed cflags/ldflags so that cgo
>         # can find the needed headers files and libraries
> @@ -35,10 +36,11 @@ do_compile() {
>         export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_
> TARGET}"
>         export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_
> TARGET}"
>
> +       cd ${S}/src/import
>         oe_runmake static
>  }
>
>  do_install() {
>         install -d ${D}/${sbindir}
> -       install ${S}/netns ${D}/${sbindir}/netns
> +       install ${S}/src/import/netns ${D}/${sbindir}/netns
>  }
> --
> 2.11.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f403045dcf5eeb9f8f05592c26c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, Sep 13, 2017 at 3:39 PM=
, Jason Wessel <span dir=3D"ltr">&lt;<a href=3D"mailto:jason.wessel@windriv=
er.com" target=3D"_blank">jason.wessel@windriver.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Recently in the oe-core the go.bbclass ch=
anged and requires the<br>
defition of the GO_IMPORT variable.=C2=A0 This was intended to simplify how=
<br>
the compilation works with go packages and it is still a work in<br>
progress.<br>
<br>
This patch set makes the recipes compatible to generate the same end<br>
result as before using the new go.bbclass from oe-core.<br>
<br>
Any patches that were included in the recipes had to have the paths<br>
adjusted because the new go.bbclass manipulates the notion of S to be<br>
S + &quot;src&quot; + &quot;$GO_IMPORT&quot; internally for the purpose of =
unpack, patch<br>
and compile.<br>
<br>
Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.co=
m">jason.wessel@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">dock<wbr>er_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 29 +++++++++++-----------<br>
=C2=A0...-golang.org-x-net-pkg-<wbr>until-we-move-to-go.patch | 20 +++++++-=
-------<br>
=C2=A0...est-Recursively-remove-pre-<wbr>existing-entri.patch |=C2=A0 4 +--=
<br>
=C2=A0...est-Split-unpackLayerEntry-<wbr>into-its-own-f.patch |=C2=A0 4 +--=
<br>
=C2=A0.../oci-image-tools/<a href=3D"http://oci-image-tools_git.bb" rel=3D"=
noreferrer" target=3D"_blank">oci-image-<wbr>tools_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 16 ++++++------<br>
=C2=A0.../oci-runtime-tools/<a href=3D"http://oci-runtime-tools_git.bb" rel=
=3D"noreferrer" target=3D"_blank">oci-<wbr>runtime-tools_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0| 22 ++++++++--------<br>
=C2=A0recipes-containers/riddler/<a href=3D"http://riddler_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">rid<wbr>dler_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 14 ++++++-----<br>
=C2=A0...untime-spec-<wbr>198f23f827eea397d4331d7eb048d.<wbr>patch |=C2=A0 =
8 +++---<br>
=C2=A0.../0001-runc-Add-console-<wbr>socket-dev-null.patch=C2=A0 =C2=A0 |=
=C2=A0 4 +--<br>
=C2=A0...-Remove-Platform-as-no-<wbr>longer-in-OCI-spec.patch |=C2=A0 8 +++=
---<br>
=C2=A0...date-memory-specs-to-use-<wbr>int64-not-uint64.patch | 12 ++++----=
-<br>
=C2=A0recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer" target=3D"_blank">runc-<wbr>docker_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A0recipes-containers/runc/runc.<wbr>inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 13 +++++-----<br>
=C2=A0recipes-networking/netns/<a href=3D"http://netns_git.bb" rel=3D"noref=
errer" target=3D"_blank">netns<wbr>_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 14 ++++++-----<br>
=C2=A014 files changed, 88 insertions(+), 82 deletions(-)<br>
<br>
diff --git a/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=
=3D"noreferrer" target=3D"_blank">do<wbr>cker_git.bb</a> b/recipes-containe=
rs/docker/<a href=3D"http://docker_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">do<wbr>cker_git.bb</a><br>
index 1ced8f4..4d6c17c 100644<br>
--- a/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">do<wbr>cker_git.bb</a><br>
+++ b/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">do<wbr>cker_git.bb</a><br>
@@ -32,7 +32,9 @@ SRC_URI =3D &quot;\<br>
<br>
=C2=A0# Apache-2.0 for docker<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>9740d093a080530b5c5c6=
573df9af4<wbr>5a&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;<wbr>md5=3D<wbr>9740d=
093a080530b5c5c6573df9af4<wbr>5a&quot;<br>
+<br>
+GO_IMPORT =3D &quot;import&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
@@ -81,18 +83,17 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Set GOPATH. See &#39;PACKAGERS.md&#39;. Don&#=
39;t rely on<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # docker to download its dependencies but rathe=
r<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # use dependencies packaged independently.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src/import<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf .gopath<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p .gopath/src/&quot;$(dirname &quot;${DO=
CKER_PKG}&quot;)&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ../../../.. .gopath/src/&quot;${DOCKER_P=
KG}&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p .gopath/src/<a href=3D"http://github.c=
om/docker" rel=3D"noreferrer" target=3D"_blank">github.com/docker</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../../../../../libnetwork .gopath/src/<a=
 href=3D"http://github.com/docker/libnetwork" rel=3D"noreferrer" target=3D"=
_blank">github.com/docker/<wbr>libnetwork</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../../../../../cli .gopath/src/<a href=
=3D"http://github.com/docker/cli" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/docker/<wbr>cli</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${WORKDIR}/libnetwork .gopath/src/<a hre=
f=3D"http://github.com/docker/libnetwork" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/docker/<wbr>libnetwork</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${WORKDIR}/cli .gopath/src/<a href=3D"ht=
tp://github.com/docker/cli" rel=3D"noreferrer" target=3D"_blank">github.com=
/docker/<wbr>cli</a><br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOPATH=3D&quot;${S}/.gopath:${S}/<wbr>ve=
ndor:${STAGING_DIR_TARGET}/$<wbr>{prefix}/local/go&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOPATH=3D&quot;${S}/src/import/.<wbr>gop=
ath:${S}/src/import/vendor:<wbr>${STAGING_DIR_TARGET}/${<wbr>prefix}/local/=
go&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOROOT=3D&quot;${STAGING_DIR_NATIVE}/<wb=
r>${nonarch_libdir}/${HOST_SYS}/<wbr>go&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd -<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so that cgo<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # can find the needed headers files and librari=
es<br>
@@ -109,10 +110,10 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./hack/make.sh dynbinary<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # build the proxy<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0go build -o ${S}/docker-proxy <a href=3D"http:/=
/github.com/docker/libnetwork/cmd/proxy" rel=3D"noreferrer" target=3D"_blan=
k">github.com/docker/libnetwork/<wbr>cmd/proxy</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0go build -o ${S}/src/import/docker-proxy <a hre=
f=3D"http://github.com/docker/libnetwork/cmd/proxy" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/docker/libnetwork/<wbr>cmd/proxy</a><br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# build the cli<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0go build -o ${S}/bundles/latest/dynbinary-<wbr>=
client/docker <a href=3D"http://github.com/docker/cli/cmd/docker" rel=3D"no=
referrer" target=3D"_blank">github.com/docker/cli/cmd/<wbr>docker</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0go build -o ${S}/src/import/bundles/<wbr>latest=
/dynbinary-client/docker <a href=3D"http://github.com/docker/cli/cmd/docker=
" rel=3D"noreferrer" target=3D"_blank">github.com/docker/cli/cmd/<wbr>docke=
r</a><br>
=C2=A0}<br>
<br>
=C2=A0SYSTEMD_PACKAGES =3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEAT=
URES&#39;,&#39;systemd&#39;,&#39;${PN}&#39;,&#39;&#39;<wbr>,d)}&quot;<br>
@@ -126,15 +127,15 @@ INITSCRIPT_PARAMS_${PN} =3D &quot;defaults&quot;<br>
<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}/${bindir}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${S}/bundles/latest/dynbinary-<wbr>client/do=
cker ${D}/${bindir}/docker<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${S}/bundles/latest/dynbinary-<wbr>daemon/do=
ckerd ${D}/${bindir}/dockerd<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${S}/docker-proxy ${D}/${bindir}/docker-prox=
y<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${S}/src/import/bundles/<wbr>latest/dynbinar=
y-client/docker ${D}/${bindir}/docker<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${S}/src/import/bundles/<wbr>latest/dynbinar=
y-daemon/<wbr>dockerd ${D}/${bindir}/dockerd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${S}/src/import/docker-proxy ${D}/${bindir}/=
docker-proxy<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_<wbr>FEATUR=
ES&#39;,&#39;systemd&#39;,&#39;true&#39;,&#39;<wbr>false&#39;,d)}; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sy=
stemd_unitdir}/system<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${S}=
/contrib/init/systemd/<wbr>docker.* ${D}/${systemd_unitdir}/system<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${S}=
/src/import/contrib/init/<wbr>systemd/docker.* ${D}/${systemd_unitdir}/syst=
em<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # replaces one copi=
ed from above with one that uses the local registry for a mirror<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${S}=
/contrib/init/systemd/<wbr>docker.service ${D}/${systemd_unitdir}/system<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${S}=
/src/import/contrib/init/<wbr>systemd/docker.service ${D}/${systemd_unitdir=
}/system<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sy=
sconfdir}/init.d<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${W=
ORKDIR}/docker.init ${D}${sysconfdir}/init.d/<wbr>docker.init<br>
@@ -142,7 +143,7 @@ do_install() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}${datadir}/docker/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/hi.Dockerfile ${D}${datadir}/dock=
er/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${S}/contrib/check-config.sh ${=
D}${datadir}/docker/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${S}/src/import/contrib/check-<=
wbr>config.sh ${D}${datadir}/docker/<br>
=C2=A0}<br>
<br>
=C2=A0inherit useradd<br>
diff --git a/recipes-containers/docker/<wbr>files/context-use-golang.org-<w=
br>x-net-pkg-until-we-move-to-go.<wbr>patch b/recipes-containers/docker/<wb=
r>files/context-use-golang.org-<wbr>x-net-pkg-until-we-move-to-go.<wbr>patc=
h<br>
index c43a7e7..7ed606f 100644<br>
--- a/recipes-containers/docker/<wbr>files/context-use-golang.org-<wbr>x-ne=
t-pkg-until-we-move-to-go.<wbr>patch<br>
+++ b/recipes-containers/docker/<wbr>files/context-use-golang.org-<wbr>x-ne=
t-pkg-until-we-move-to-go.<wbr>patch<br>
@@ -18,8 +18,8 @@ Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark=
.asselstine@windriver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
=C2=A0 integration-cli/docker_cli_<wbr>save_load_unix_test.go |=C2=A0 =C2=
=A0 2 +-<br>
=C2=A0 5 files changed, 5 insertions(+), 5 deletions(-)<br>
<br>
---- a/client/README.md<br>
-+++ b/client/README.md<br>
+--- a/src/import/client/README.md<br>
++++ b/src/import/client/README.md<br>
=C2=A0@@ -8,7 +8,7 @@ For example, to list running containers<br>
=C2=A0 package main<br>
<br>
@@ -29,8 +29,8 @@ Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark=
.asselstine@windriver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fmt&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"http://github.com/docker/docke=
r/api/types" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker/=
api/<wbr>types</a>&quot;<br>
---- a/client/client.go<br>
-+++ b/client/client.go<br>
+--- a/src/import/client/client.go<br>
++++ b/src/import/client/client.go<br>
=C2=A0@@ -19,7 +19,7 @@ For example, to list running containers<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 package main<br>
<br>
@@ -40,8 +40,8 @@ Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark=
.asselstine@windriver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fmt&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"ht=
tp://github.com/docker/docker/api/types" rel=3D"noreferrer" target=3D"_blan=
k">github.com/docker/docker/api/<wbr>types</a>&quot;<br>
---- a/daemon/info_unix.go<br>
-+++ b/daemon/info_unix.go<br>
+--- a/src/import/daemon/info_unix.<wbr>go<br>
++++ b/src/import/daemon/info_unix.<wbr>go<br>
=C2=A0@@ -3,7 +3,7 @@<br>
=C2=A0 package daemon<br>
<br>
@@ -51,8 +51,8 @@ Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark=
.asselstine@windriver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;os/exec&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;strings&quot;<br>
<br>
---- a/integration-cli/docker_api_<wbr>attach_test.go<br>
-+++ b/integration-cli/docker_api_<wbr>attach_test.go<br>
+--- a/src/import/integration-cli/<wbr>docker_api_attach_test.go<br>
++++ b/src/import/integration-cli/<wbr>docker_api_attach_test.go<br>
=C2=A0@@ -3,7 +3,7 @@ package main<br>
=C2=A0 import (<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;bufio&quot;<br>
@@ -62,8 +62,8 @@ Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark=
.asselstine@windriver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;net&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;net/http&quot;<br>
---- a/integration-cli/docker_cli_<wbr>save_load_unix_test.go<br>
-+++ b/integration-cli/docker_cli_<wbr>save_load_unix_test.go<br>
+--- a/src/import/integration-cli/<wbr>docker_cli_save_load_unix_<wbr>test.=
go<br>
++++ b/src/import/integration-cli/<wbr>docker_cli_save_load_unix_<wbr>test.=
go<br>
=C2=A0@@ -3,7 +3,7 @@<br>
=C2=A0 package main<br>
<br>
diff --git a/recipes-containers/oci-<wbr>image-tools/files/0001-image-<wbr>=
manifest-Recursively-remove-<wbr>pre-existing-entri.patch b/recipes-contain=
ers/oci-<wbr>image-tools/files/0001-image-<wbr>manifest-Recursively-remove-=
<wbr>pre-existing-entri.patch<br>
index d2cacc2..5594f97 100644<br>
--- a/recipes-containers/oci-<wbr>image-tools/files/0001-image-<wbr>manifes=
t-Recursively-remove-<wbr>pre-existing-entri.patch<br>
+++ b/recipes-containers/oci-<wbr>image-tools/files/0001-image-<wbr>manifes=
t-Recursively-remove-<wbr>pre-existing-entri.patch<br>
@@ -40,8 +40,8 @@ Signed-off-by: W. Trevor King &lt;<a href=3D"mailto:wking=
@tremily.us">wking@tremily.us</a>&gt;<br>
<br>
=C2=A0diff --git a/image/manifest.go b/image/manifest.go<br>
=C2=A0index 8834c1e5f2f0..144bd4f62219 100644<br>
---- a/image/manifest.go<br>
-+++ b/image/manifest.go<br>
+--- a/src/import/image/manifest.go<br>
++++ b/src/import/image/manifest.go<br>
=C2=A0@@ -253,11 +253,27 @@ loop:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue loop<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
diff --git a/recipes-containers/oci-<wbr>image-tools/files/0002-image-<wbr>=
manifest-Split-<wbr>unpackLayerEntry-into-its-own-<wbr>f.patch b/recipes-co=
ntainers/oci-<wbr>image-tools/files/0002-image-<wbr>manifest-Split-<wbr>unp=
ackLayerEntry-into-its-own-<wbr>f.patch<br>
index 9cf513e..69bdcdb 100644<br>
--- a/recipes-containers/oci-<wbr>image-tools/files/0002-image-<wbr>manifes=
t-Split-<wbr>unpackLayerEntry-into-its-own-<wbr>f.patch<br>
+++ b/recipes-containers/oci-<wbr>image-tools/files/0002-image-<wbr>manifes=
t-Split-<wbr>unpackLayerEntry-into-its-own-<wbr>f.patch<br>
@@ -18,8 +18,8 @@ Signed-off-by: W. Trevor King &lt;<a href=3D"mailto:wking=
@tremily.us">wking@tremily.us</a>&gt;<br>
<br>
=C2=A0diff --git a/image/manifest.go b/image/manifest.go<br>
=C2=A0index 144bd4f62219..dfd5a83f70e4 100644<br>
---- a/image/manifest.go<br>
-+++ b/image/manifest.go<br>
+--- a/src/import/image/manifest.go<br>
++++ b/src/import/image/manifest.go<br>
=C2=A0@@ -218,116 +218,131 @@ loop:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return errors.Wrapf(err, &quot;error advancing tar stream&quot;)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
diff --git a/recipes-containers/oci-<wbr>image-tools/<a href=3D"http://oci-=
image-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">oci-image-tools_<w=
br>git.bb</a> b/recipes-containers/oci-<wbr>image-tools/<a href=3D"http://o=
ci-image-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">oci-image-tools=
_<wbr>git.bb</a><br>
index 393bd7b..37ac087 100644<br>
--- a/recipes-containers/oci-<wbr>image-tools/<a href=3D"http://oci-image-t=
ools_git.bb" rel=3D"noreferrer" target=3D"_blank">oci-image-tools_<wbr>git.=
bb</a><br>
+++ b/recipes-containers/oci-<wbr>image-tools/<a href=3D"http://oci-image-t=
ools_git.bb" rel=3D"noreferrer" target=3D"_blank">oci-image-tools_<wbr>git.=
bb</a><br>
@@ -18,8 +18,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/open=
containers/image-tools.git" rel=3D"noreferrer" target=3D"_blank">github.com=
/<wbr>opencontainers/image-tools.git</a> \<br>
<br>
=C2=A0SRCREV =3D &quot;<wbr>d0c8533b0a2c68344ff2c8aff03d7f<wbr>c2dff3a108&q=
uot;<br>
=C2=A0PV =3D &quot;0.1.0+git${SRCPV}&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
+GO_IMPORT =3D &quot;import&quot;<br>
<br>
=C2=A0inherit goarch<br>
=C2=A0inherit go<br>
@@ -38,11 +37,11 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We also need to link in the ipallocator direc=
tory as that is not under<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # a src directory.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sfn . &quot;${S}/vendor/src&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p &quot;${S}/vendor/src/<a href=3D"http:=
//github.com/opencontainers/image-tools/" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/<wbr>opencontainers/image-tools/</a>&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sfn &quot;${S}/image&quot; &quot;${S}/vendo=
r/src/<a href=3D"http://github.com/opencontainers/image-tools/image" rel=3D=
"noreferrer" target=3D"_blank">github.com/<wbr>opencontainers/image-tools/<=
wbr>image</a>&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sfn &quot;${S}/version&quot; &quot;${S}/ven=
dor/src/<a href=3D"http://github.com/opencontainers/image-tools/version" re=
l=3D"noreferrer" target=3D"_blank">github.com/<wbr>opencontainers/image-too=
ls/<wbr>version</a>&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOPATH=3D&quot;${S}/vendor&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sfn . &quot;${S}/src/import/vendor/src&quot=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p &quot;${S}/src/import/vendor/src/<a hr=
ef=3D"http://github.com/opencontainers/image-tools/" rel=3D"noreferrer" tar=
get=3D"_blank">gi<wbr>thub.com/opencontainers/image-<wbr>tools/</a>&quot;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sfn &quot;${S}/src/import/image&quot; &quot=
;${S}/src/import/vendor/src/<a href=3D"http://github.com/opencontainers/ima=
ge-tools/image" rel=3D"noreferrer" target=3D"_blank">gi<wbr>thub.com/openco=
ntainers/image-<wbr>tools/image</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sfn &quot;${S}/src/import/version&quot; &qu=
ot;${S}/src/import/vendor/src/<a href=3D"http://github.com/opencontainers/i=
mage-tools/version" rel=3D"noreferrer" target=3D"_blank">gi<wbr>thub.com/op=
encontainers/image-<wbr>tools/version</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOPATH=3D&quot;${S}/src/import/<wbr>vend=
or&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so that cgo<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # can find the needed headers files and librari=
es<br>
@@ -51,13 +50,14 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export LDFLAGS=3D&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CGO_CFLAGS=3D&quot;${BUILDSDK_CFLAGS} --=
sysroot=3D${STAGING_DIR_<wbr>TARGET}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CGO_LDFLAGS=3D&quot;${BUILDSDK_<wbr>LDFL=
AGS} --sysroot=3D${STAGING_DIR_<wbr>TARGET}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src/import<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake tool<br>
=C2=A0}<br>
<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/${sbindir}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install ${S}/oci-image-tool ${D}/${sbindir}/<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install ${S}/src/import/oci-image-tool ${D}/${s=
bindir}/<br>
=C2=A0}<br>
<br>
=C2=A0INSANE_SKIP_${PN} +=3D &quot;ldflags&quot;<br>
diff --git a/recipes-containers/oci-<wbr>runtime-tools/<a href=3D"http://oc=
i-runtime-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">oci-runtime-<w=
br>tools_git.bb</a> b/recipes-containers/oci-<wbr>runtime-tools/<a href=3D"=
http://oci-runtime-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">oci-r=
untime-<wbr>tools_git.bb</a><br>
index d73edfe..0d9c6e6 100644<br>
--- a/recipes-containers/oci-<wbr>runtime-tools/<a href=3D"http://oci-runti=
me-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">oci-runtime-<wbr>tool=
s_git.bb</a><br>
+++ b/recipes-containers/oci-<wbr>runtime-tools/<a href=3D"http://oci-runti=
me-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">oci-runtime-<wbr>tool=
s_git.bb</a><br>
@@ -1,14 +1,13 @@<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://github.com/opencontainers/runti=
me-tools" rel=3D"noreferrer" target=3D"_blank">https://github.com/<wbr>open=
containers/runtime-tools</a>&quot;<br>
=C2=A0SUMMARY =3D &quot;oci-runtime-tool is a collection of tools for worki=
ng with the OCI runtime specification&quot;<br>
=C2=A0LICENSE =3D &quot;GPLv2&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>b355a61a394a504dacde9=
01c958f66<wbr>2c&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;<wbr>md5=3D<wbr>b355a=
61a394a504dacde901c958f66<wbr>2c&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/opencontainers/r=
untime-tools.git" rel=3D"noreferrer" target=3D"_blank">github.com/<wbr>open=
containers/runtime-tools.<wbr>git</a>&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;<wbr>15ec1df3f6607f4223ab3915547c18<wbr>4cf60a30dd&q=
uot;<br>
=C2=A0PV =3D &quot;0.0.1+git${SRCPV}&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
+GO_IMPORT =3D &quot;import&quot;<br>
<br>
=C2=A0INSANE_SKIP_${PN} +=3D &quot;ldflags&quot;<br>
<br>
@@ -18,7 +17,7 @@ inherit go<br>
=C2=A0do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOARCH=3D&quot;${TARGET_GOARCH}&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOROOT=3D&quot;${STAGING_LIBDIR_<wbr>NAT=
IVE}/${TARGET_SYS}/go&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOPATH=3D&quot;${S}:${S}/vendor&quot;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOPATH=3D&quot;${S}/src/import:${S}/<wbr=
>src/import/vendor&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so that cgo<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # can find the needed headers files and librari=
es<br>
@@ -29,17 +28,18 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CGO_LDFLAGS=3D&quot;${BUILDSDK_<wbr>LDFL=
AGS} --sysroot=3D${STAGING_DIR_<wbr>TARGET}&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # link fixups for compilation<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${S}/vendor/src<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ./ ${S}/vendor/src<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${S}/vendor/<a href=3D"http://github.c=
om/opencontainers/runtime-tools" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/<wbr>opencontainers/runtime-tools</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../../../../generate ${S}/vendor/<a href=
=3D"http://github.com/opencontainers/runtime-tools/generate" rel=3D"norefer=
rer" target=3D"_blank">github.com/<wbr>opencontainers/runtime-tools/<wbr>ge=
nerate</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../../../../validate ${S}/vendor/<a href=
=3D"http://github.com/opencontainers/runtime-tools/validate" rel=3D"norefer=
rer" target=3D"_blank">github.com/<wbr>opencontainers/runtime-tools/<wbr>va=
lidate</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../../../../cmd ${S}/vendor/<a href=3D"h=
ttp://github.com/opencontainers/runtime-tools/cmd" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/<wbr>opencontainers/runtime-tools/<wbr>cmd</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${S}/src/import/vendor/src<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ./ ${S}/src/import/vendor/src<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${S}/src/import/vendor/<a href=3D"http=
://github.com/opencontainers/runtime-tools" rel=3D"noreferrer" target=3D"_b=
lank">github.<wbr>com/opencontainers/runtime-<wbr>tools</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../../../../generate ${S}/src/import/ven=
dor/<a href=3D"http://github.com/opencontainers/runtime-tools/generate" rel=
=3D"noreferrer" target=3D"_blank">github.<wbr>com/opencontainers/runtime-<w=
br>tools/generate</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../../../../validate ${S}/src/import/ven=
dor/<a href=3D"http://github.com/opencontainers/runtime-tools/validate" rel=
=3D"noreferrer" target=3D"_blank">github.<wbr>com/opencontainers/runtime-<w=
br>tools/validate</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../../../../cmd ${S}/src/import/vendor/<=
a href=3D"http://github.com/opencontainers/runtime-tools/cmd" rel=3D"norefe=
rrer" target=3D"_blank">github.<wbr>com/opencontainers/runtime-<wbr>tools/c=
md</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src/import<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake<br>
=C2=A0}<br>
<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/${sbindir}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install ${S}/oci-runtime-tool ${D}/${sbindir}/o=
ci-runtime-<wbr>tool<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install ${S}/src/import/oci-runtime-<wbr>tool $=
{D}/${sbindir}/oci-runtime-<wbr>tool<br>
=C2=A0}<br>
diff --git a/recipes-containers/riddler/<a href=3D"http://riddler_git.bb" r=
el=3D"noreferrer" target=3D"_blank">r<wbr>iddler_git.bb</a> b/recipes-conta=
iners/riddler/<a href=3D"http://riddler_git.bb" rel=3D"noreferrer" target=
=3D"_blank">r<wbr>iddler_git.bb</a><br>
index ae6c5ec..9f7fe6b 100644<br>
--- a/recipes-containers/riddler/<a href=3D"http://riddler_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">r<wbr>iddler_git.bb</a><br>
+++ b/recipes-containers/riddler/<a href=3D"http://riddler_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">r<wbr>iddler_git.bb</a><br>
@@ -1,11 +1,12 @@<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://github.com/jfrazelle/riddler" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/jfrazelle/<wbr>riddl=
er</a>&quot;<br>
=C2=A0SUMMARY =3D &quot;Convert `docker inspect` to opencontainers (OCI com=
patible) runc spec.&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>20ce4c6a4f32d6ee4a68e=
3a7506db3<wbr>f1&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;<wbr>md5=3D<wbr>20ce4=
c6a4f32d6ee4a68e3a7506db3<wbr>f1&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/jfrazelle/riddle=
r;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.com/jfrazell=
e/<wbr>riddler;branch=3Dmaster</a>&quot;<br>
=C2=A0SRCREV =3D &quot;<wbr>23befa0b232877b5b502b828e24161<wbr>d801bd67f6&q=
uot;<br>
=C2=A0PV =3D &quot;0.1.0+git${SRCPV}&quot;<br>
+GO_IMPORT =3D &quot;import&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
@@ -26,10 +27,10 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We also need to link in the ipallocator direc=
tory as that is not under<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # a src directory.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sfn . &quot;${S}/vendor/src&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p &quot;${S}/vendor/src/<a href=3D"http:=
//github.com/jessfraz/riddler" rel=3D"noreferrer" target=3D"_blank">github.=
com/<wbr>jessfraz/riddler</a>&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sfn &quot;${S}/parse&quot; &quot;${S}/vendo=
r/src/<a href=3D"http://github.com/jessfraz/riddler/parse" rel=3D"noreferre=
r" target=3D"_blank">github.com/<wbr>jessfraz/riddler/parse</a>&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOPATH=3D&quot;${S}/vendor&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sfn . &quot;${S}/src/import/vendor/src&quot=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p &quot;${S}/src/import/vendor/src/<a hr=
ef=3D"http://github.com/jessfraz/riddler" rel=3D"noreferrer" target=3D"_bla=
nk">gi<wbr>thub.com/jessfraz/riddler</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sfn &quot;${S}/src/import/parse&quot; &quot=
;${S}/src/import/vendor/src/<a href=3D"http://github.com/jessfraz/riddler/p=
arse" rel=3D"noreferrer" target=3D"_blank">gi<wbr>thub.com/jessfraz/riddler=
/<wbr>parse</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOPATH=3D&quot;${S}/src/import/<wbr>vend=
or&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so that cgo<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # can find the needed headers files and librari=
es<br>
@@ -38,11 +39,12 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export LDFLAGS=3D&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CGO_CFLAGS=3D&quot;${BUILDSDK_CFLAGS} --=
sysroot=3D${STAGING_DIR_<wbr>TARGET}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CGO_LDFLAGS=3D&quot;${BUILDSDK_<wbr>LDFL=
AGS} --sysroot=3D${STAGING_DIR_<wbr>TARGET}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src/import<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake static<br>
=C2=A0}<br>
<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/${sbindir}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install ${S}/riddler ${D}/${sbindir}/riddler<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install ${S}/src/import/riddler ${D}/${sbindir}=
/riddler<br>
=C2=A0}<br>
diff --git a/recipes-containers/runc/<wbr>runc-docker/0001-Update-to-<wbr>r=
untime-spec-<wbr>198f23f827eea397d4331d7eb048d.<wbr>patch b/recipes-contain=
ers/runc/<wbr>runc-docker/0001-Update-to-<wbr>runtime-spec-<wbr>198f23f827e=
ea397d4331d7eb048d.<wbr>patch<br>
index bc1e9a2..bcc76fc 100644<br>
--- a/recipes-containers/runc/<wbr>runc-docker/0001-Update-to-<wbr>runtime-=
spec-<wbr>198f23f827eea397d4331d7eb048d.<wbr>patch<br>
+++ b/recipes-containers/runc/<wbr>runc-docker/0001-Update-to-<wbr>runtime-=
spec-<wbr>198f23f827eea397d4331d7eb048d.<wbr>patch<br>
@@ -14,8 +14,8 @@ Signed-off-by: Justin Cormack &lt;<a href=3D"mailto:justi=
n.cormack@docker.com">justin.cormack@docker.com</a>&gt;<br>
<br>
=C2=A0diff --git a/vendor.conf b/vendor.conf<br>
=C2=A0index e23e7ea7..09a8a924 100644<br>
---- a/vendor.conf<br>
-+++ b/vendor.conf<br>
+--- a/src/import/vendor.conf<br>
++++ b/src/import/vendor.conf<br>
=C2=A0@@ -1,7 +1,7 @@<br>
=C2=A0 # OCI runtime-spec. When updating this, make sure you use a version =
tag rather<br>
=C2=A0 # than a commit ID so it&#39;s much more obvious what version of the=
 spec we are<br>
@@ -27,8 +27,8 @@ index e23e7ea7..09a8a924 100644<br>
=C2=A0 <a href=3D"http://github.com/opencontainers/selinux" rel=3D"noreferr=
er" target=3D"_blank">github.com/opencontainers/<wbr>selinux</a> v1.0.0-rc1=
<br>
=C2=A0diff --git a/vendor/<a href=3D"http://github.com/opencontainers/runti=
me-spec/specs-go/config.go" rel=3D"noreferrer" target=3D"_blank">github.com=
/<wbr>opencontainers/runtime-spec/<wbr>specs-go/config.go</a> b/vendor/<a h=
ref=3D"http://github.com/opencontainers/runtime-spec/specs-go/config.go" re=
l=3D"noreferrer" target=3D"_blank">github.com/<wbr>opencontainers/runtime-s=
pec/<wbr>specs-go/config.go</a><br>
=C2=A0index 8bf8d924..68ab112e 100644<br>
---- a/vendor/<a href=3D"http://github.com/opencontainers/runtime-spec/spec=
s-go/config.go" rel=3D"noreferrer" target=3D"_blank">github.com/<wbr>openco=
ntainers/runtime-spec/<wbr>specs-go/config.go</a><br>
-+++ b/vendor/<a href=3D"http://github.com/opencontainers/runtime-spec/spec=
s-go/config.go" rel=3D"noreferrer" target=3D"_blank">github.com/<wbr>openco=
ntainers/runtime-spec/<wbr>specs-go/config.go</a><br>
+--- a/src/import/vendor/<a href=3D"http://github.com/opencontainers/runtim=
e-spec/specs-go/config.go" rel=3D"noreferrer" target=3D"_blank">github.<wbr=
>com/opencontainers/runtime-<wbr>spec/specs-go/config.go</a><br>
++++ b/src/import/vendor/<a href=3D"http://github.com/opencontainers/runtim=
e-spec/specs-go/config.go" rel=3D"noreferrer" target=3D"_blank">github.<wbr=
>com/opencontainers/runtime-<wbr>spec/specs-go/config.go</a><br>
=C2=A0@@ -6,8 +6,6 @@ import &quot;os&quot;<br>
=C2=A0 type Spec struct {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // Version of the Open Container Runtime Specif=
ication with which the bundle complies.<br>
diff --git a/recipes-containers/runc/<wbr>runc-docker/0001-runc-Add-<wbr>co=
nsole-socket-dev-null.patch b/recipes-containers/runc/<wbr>runc-docker/0001=
-runc-Add-<wbr>console-socket-dev-null.patch<br>
index f49adfb..48c1250 100644<br>
--- a/recipes-containers/runc/<wbr>runc-docker/0001-runc-Add-<wbr>console-s=
ocket-dev-null.patch<br>
+++ b/recipes-containers/runc/<wbr>runc-docker/0001-runc-Add-<wbr>console-s=
ocket-dev-null.patch<br>
@@ -14,8 +14,8 @@ Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.w=
essel@windriver.com">jason.wessel@windriver.com</a>&gt;<br>
<br>
=C2=A0diff --git a/utils_linux.go b/utils_linux.go<br>
=C2=A0index 8085f7fe..e6d31b35 100644<br>
---- a/utils_linux.go<br>
-+++ b/utils_linux.go<br>
+--- a/src/import/utils_linux.go<br>
++++ b/src/import/utils_linux.go<br>
=C2=A0@@ -227,6 +227,11 @@ type runner struct {<br>
=C2=A0 }<br>
<br>
diff --git a/recipes-containers/runc/<wbr>runc-docker/0002-Remove-<wbr>Plat=
form-as-no-longer-in-OCI-<wbr>spec.patch b/recipes-containers/runc/<wbr>run=
c-docker/0002-Remove-<wbr>Platform-as-no-longer-in-OCI-<wbr>spec.patch<br>
index 6ec286a..7970dec 100644<br>
--- a/recipes-containers/runc/<wbr>runc-docker/0002-Remove-<wbr>Platform-as=
-no-longer-in-OCI-<wbr>spec.patch<br>
+++ b/recipes-containers/runc/<wbr>runc-docker/0002-Remove-<wbr>Platform-as=
-no-longer-in-OCI-<wbr>spec.patch<br>
@@ -13,8 +13,8 @@ Signed-off-by: Justin Cormack &lt;<a href=3D"mailto:justi=
n.cormack@docker.com">justin.cormack@docker.com</a>&gt;<br>
<br>
=C2=A0diff --git a/libcontainer/specconv/<wbr>example.go b/libcontainer/spe=
cconv/<wbr>example.go<br>
=C2=A0index 33134116..d6621194 100644<br>
---- a/libcontainer/specconv/<wbr>example.go<br>
-+++ b/libcontainer/specconv/<wbr>example.go<br>
+--- a/src/import/libcontainer/<wbr>specconv/example.go<br>
++++ b/src/import/libcontainer/<wbr>specconv/example.go<br>
=C2=A0@@ -2,7 +2,6 @@ package specconv<br>
<br>
=C2=A0 import (<br>
@@ -36,8 +36,8 @@ index 33134116..d6621194 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Readonly: true,<br>
=C2=A0diff --git a/spec.go b/spec.go<br>
=C2=A0index 92d38f57..876937d2 100644<br>
---- a/spec.go<br>
-+++ b/spec.go<br>
+--- a/src/import/spec.go<br>
++++ b/src/import/spec.go<br>
=C2=A0@@ -7,7 +7,6 @@ import (<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fmt&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io/ioutil&quot;<br>
diff --git a/recipes-containers/runc/<wbr>runc-docker/0003-Update-<wbr>memo=
ry-specs-to-use-int64-not-<wbr>uint64.patch b/recipes-containers/runc/<wbr>=
runc-docker/0003-Update-<wbr>memory-specs-to-use-int64-not-<wbr>uint64.patc=
h<br>
index 9cb3492..50a9b7f 100644<br>
--- a/recipes-containers/runc/<wbr>runc-docker/0003-Update-<wbr>memory-spec=
s-to-use-int64-not-<wbr>uint64.patch<br>
+++ b/recipes-containers/runc/<wbr>runc-docker/0003-Update-<wbr>memory-spec=
s-to-use-int64-not-<wbr>uint64.patch<br>
@@ -20,8 +20,8 @@ Signed-off-by: Justin Cormack &lt;<a href=3D"mailto:justi=
n.cormack@docker.com">justin.cormack@docker.com</a>&gt;<br>
<br>
=C2=A0diff --git a/libcontainer/cgroups/fs/<wbr>memory.go b/libcontainer/cg=
roups/fs/<wbr>memory.go<br>
=C2=A0index da2cc9f8..b739c631 100644<br>
---- a/libcontainer/cgroups/fs/<wbr>memory.go<br>
-+++ b/libcontainer/cgroups/fs/<wbr>memory.go<br>
+--- a/src/import/libcontainer/<wbr>cgroups/fs/memory.go<br>
++++ b/src/import/libcontainer/<wbr>cgroups/fs/memory.go<br>
=C2=A0@@ -73,14 +73,14 @@ func EnableKernelMemoryAccounting(<wbr>path strin=
g) error {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // until a limit is set on the cgroup and limit=
 cannot be set once the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // cgroup has children, or if there are already=
 tasks in the cgroup.<br>
@@ -123,8 +123,8 @@ index da2cc9f8..b739c631 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0diff --git a/libcontainer/configs/cgroup_<wbr>linux.go b/libcontainer=
/configs/cgroup_<wbr>linux.go<br>
=C2=A0index 3e0509de..e15a662f 100644<br>
---- a/libcontainer/configs/cgroup_<wbr>linux.go<br>
-+++ b/libcontainer/configs/cgroup_<wbr>linux.go<br>
+--- a/src/import/libcontainer/<wbr>configs/cgroup_linux.go<br>
++++ b/src/import/libcontainer/<wbr>configs/cgroup_linux.go<br>
=C2=A0@@ -43,19 +43,19 @@ type Resources struct {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Devices []*Device `json:&quot;devices&quot;`<br=
>
<br>
@@ -152,8 +152,8 @@ index 3e0509de..e15a662f 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CpuShares uint64 `json:&quot;cpu_shares&quot;`<=
br>
=C2=A0diff --git a/update.go b/update.go<br>
=C2=A0index 0ea90d60..133be999 100644<br>
---- a/update.go<br>
-+++ b/update.go<br>
+--- a/src/import/update.go<br>
++++ b/src/import/update.go<br>
=C2=A0@@ -124,11 +124,11 @@ other options are ignored.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r :=3D specs.LinuxR=
esources{<br>
diff --git a/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" =
rel=3D"noreferrer" target=3D"_blank">runc<wbr>-docker_git.bb</a> b/recipes-=
containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">runc<wbr>-docker_git.bb</a><br>
index f412c84..9735325 100644<br>
--- a/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer" target=3D"_blank">runc<wbr>-docker_git.bb</a><br>
+++ b/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer" target=3D"_blank">runc<wbr>-docker_git.bb</a><br>
@@ -10,6 +10,8 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/dock=
er/runc.git;nobranch=3D1;name=3Drunc-docker" rel=3D"noreferrer" target=3D"_=
blank">github.com/docker/runc.<wbr>git;nobranch=3D1;name=3Drunc-<wbr>docker=
</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-runc-Add-console-<wbr=
>socket-dev-null.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
+GO_IMPORT =3D &quot;import&quot;<br>
+<br>
=C2=A0RUNC_VERSION =3D &quot;1.0.0-rc3&quot;<br>
=C2=A0PROVIDES +=3D &quot;virtual/runc&quot;<br>
=C2=A0RPROVIDES_${PN} =3D &quot;virtual/runc&quot;<br>
diff --git a/recipes-containers/runc/<wbr>runc.inc b/recipes-containers/run=
c/<wbr>runc.inc<br>
index dbc83c2..83d5f86 100644<br>
--- a/recipes-containers/runc/<wbr>runc.inc<br>
+++ b/recipes-containers/runc/<wbr>runc.inc<br>
@@ -4,7 +4,7 @@ DESCRIPTION =3D &quot;runc is a CLI tool for spawning and r=
unning containers according<br>
<br>
=C2=A0# Apache-2.0 for containerd<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>435b266b3899aa8a959f1=
7d41c56de<wbr>f8&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;<wbr>md5=3D<wbr>435b2=
66b3899aa8a959f17d41c56de<wbr>f8&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
@@ -26,20 +26,19 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Set GOPATH. See &#39;PACKAGERS.md&#39;. Don&#=
39;t rely on<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # docker to download its dependencies but rathe=
r<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # use dependencies packaged independently.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src/import<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf .gopath<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dname=3D`dirname &quot;${LIBCONTAINER_PACKAGE}&=
quot;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bname=3D`basename &quot;${LIBCONTAINER_PACKAGE}=
&quot;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p .gopath/src/${dname}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (cd .gopath/src/${dname}; ln -sf ../../../../..=
/${bname} ${bname})<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOPATH=3D&quot;${S}/.gopath:${S}/<wbr>ve=
ndor:${STAGING_DIR_TARGET}/$<wbr>{prefix}/local/go&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOPATH=3D&quot;${S}/src/import/.<wbr>gop=
ath:${S}/src/import/vendor:<wbr>${STAGING_DIR_TARGET}/${<wbr>prefix}/local/=
go&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOROOT=3D&quot;${STAGING_DIR_NATIVE}/<wb=
r>${nonarch_libdir}/${HOST_SYS}/<wbr>go&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd -<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Fix up symlink for go-cross compiler<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${S}/vendor/src<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ./ ${S}/vendor/src<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${S}/src/import/vendor/src<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ./ ${S}/src/import/vendor/src<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so that cgo<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # can find the needed headers files and librari=
es<br>
@@ -55,7 +54,7 @@ do_compile() {<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}/${bindir}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${S}/runc ${D}/${bindir}/runc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${S}/src/import/runc ${D}/${bindir}/runc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf runc ${D}/${bindir}/docker-runc<br>
=C2=A0}<br>
<br>
diff --git a/recipes-networking/netns/<a href=3D"http://netns_git.bb" rel=
=3D"noreferrer" target=3D"_blank">net<wbr>ns_git.bb</a> b/recipes-networkin=
g/netns/<a href=3D"http://netns_git.bb" rel=3D"noreferrer" target=3D"_blank=
">net<wbr>ns_git.bb</a><br>
index 641d55f..8e771f5 100644<br>
--- a/recipes-networking/netns/<a href=3D"http://netns_git.bb" rel=3D"noref=
errer" target=3D"_blank">net<wbr>ns_git.bb</a><br>
+++ b/recipes-networking/netns/<a href=3D"http://netns_git.bb" rel=3D"noref=
errer" target=3D"_blank">net<wbr>ns_git.bb</a><br>
@@ -1,11 +1,12 @@<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://github.com/jfrazelle/netns" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/jfrazelle/<wbr>netns</=
a>&quot;<br>
=C2=A0SUMMARY =3D &quot;Runc hook for setting up default bridge networking.=
&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>20ce4c6a4f32d6ee4a68e=
3a7506db3<wbr>f1&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;<wbr>md5=3D<wbr>20ce4=
c6a4f32d6ee4a68e3a7506db3<wbr>f1&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/jessfraz/netns;b=
ranch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.com/jessfraz/<w=
br>netns;branch=3Dmaster</a>&quot;<br>
=C2=A0SRCREV =3D &quot;<wbr>85b1ab9fcccbaa404a2636b52a48bb<wbr>de02437cf7&q=
uot;<br>
=C2=A0PV =3D &quot;0.1.0+git${SRCPV}&quot;<br>
+GO_IMPORT =3D &quot;import&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
@@ -22,10 +23,10 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We also need to link in the ipallocator direc=
tory as that is not under<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # a src directory.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sfn . &quot;${S}/vendor/src&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p &quot;${S}/vendor/src/<a href=3D"http:=
//github.com/jessfraz/netns" rel=3D"noreferrer" target=3D"_blank">github.co=
m/<wbr>jessfraz/netns</a>&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sfn &quot;${S}/ipallocator&quot; &quot;${S}=
/vendor/src/<a href=3D"http://github.com/jessfraz/netns/ipallocator" rel=3D=
"noreferrer" target=3D"_blank">github.com/<wbr>jessfraz/netns/ipallocator</=
a>&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOPATH=3D&quot;${S}/vendor&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sfn . &quot;${S}/src/import/vendor/src&quot=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p &quot;${S}/src/import/vendor/src/<a hr=
ef=3D"http://github.com/jessfraz/netns" rel=3D"noreferrer" target=3D"_blank=
">gi<wbr>thub.com/jessfraz/netns</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sfn &quot;${S}/src/import/ipallocator&quot;=
 &quot;${S}/src/import/vendor/src/<a href=3D"http://github.com/jessfraz/net=
ns/ipallocator" rel=3D"noreferrer" target=3D"_blank">gi<wbr>thub.com/jessfr=
az/netns/<wbr>ipallocator</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOPATH=3D&quot;${S}/src/import/<wbr>vend=
or&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so that cgo<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # can find the needed headers files and librari=
es<br>
@@ -35,10 +36,11 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CGO_CFLAGS=3D&quot;${BUILDSDK_CFLAGS} --=
sysroot=3D${STAGING_DIR_<wbr>TARGET}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CGO_LDFLAGS=3D&quot;${BUILDSDK_<wbr>LDFL=
AGS} --sysroot=3D${STAGING_DIR_<wbr>TARGET}&quot;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src/import<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake static<br>
=C2=A0}<br>
<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/${sbindir}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install ${S}/netns ${D}/${sbindir}/netns<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install ${S}/src/import/netns ${D}/${sbindir}/n=
etns<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--f403045dcf5eeb9f8f05592c26c3--
