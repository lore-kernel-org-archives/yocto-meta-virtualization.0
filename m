Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AA1A3E00CE2; Wed, 14 Mar 2018 05:36:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.66 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1D7FE00823
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 05:36:16 -0700 (PDT)
Received: by mail-lf0-f66.google.com with SMTP id t132-v6so4551233lfe.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 05:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2T2m77pYAF2tCtFOTU5EqDCGHsgM8NCLkQQjVp3nMuc=;
	b=AY2icWaqZ14Mt04TbpJ9hwFA6pMPyhQIeAZfo6yeB0FLoTe+FVkw42WgB58ilodyYR
	71NncR1vI7YXj+sPyz1ewDAsohHJo6VZKSt5fpCdioB66wFcB9TcETMLEr9BNHAgXQ9g
	zwH/NzjmffBmvI1+TdXI8115ZsZFiArTeDRa7rGcHnThY1GGRVKXiSpznIX34kabheu8
	fqUtKbixYLT8j1Hyn8ZegeIWZl5vUef1Ie4RwWwIY1DCx/J7AeC35MsHaFh+EleyQHJt
	IaxnfB0EQVCuMS9O74VyPmwOrhSqOqbQxtNNW2RaocIyr1+7/nGHGCk0K1ZiW4aNseel
	aj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2T2m77pYAF2tCtFOTU5EqDCGHsgM8NCLkQQjVp3nMuc=;
	b=gYAnzcKWtXU18MDLBcIHBa013r6aga4GzGrjGLndm5LSqgVZ4C+f78InhZIteAECMu
	4ekwiWZOTYAL9O+eKJtRud8+8/RK0+7UTeUg618sfa/CACTjKpsCoZib3M1ZqS0pdb4M
	TssnQrlrzSeaPs8VUM/JkZUqxKzceJtDo1cbqikrU9F9keV6qfB+GB4RJP42rRF591cy
	eXoAXsz45oK4zP2I/AQem0vN7rvs5WCYW7O9pqSsudo0sK7B3CpOya+lYlBX0dGu41pN
	i1kgnVa1t06onyZ7Q1PYszThXSJy2jkXE06GOBtLMgegKbdUXhVqD971dywjiUfCEMfI
	9hEw==
X-Gm-Message-State: AElRT7GJMVcs81bud0gN624TLTRxuDxGejTy7UN5e+mp3zH/VJTPfiKz
	kn1tTARHNIiwYd0lq5pcseB9Tz69/pLa87RYhxc=
X-Google-Smtp-Source: AG47ELvEEv3hN8/PacabVgihjo275Nf1HQBHfnY9TwSHA6W2XT4i9pFQilHh10FeWeqyFUPS0JM1wNVVv8mShdgsemw=
X-Received: by 10.46.23.202 with SMTP id 71mr2833314ljx.49.1521030975526; Wed,
	14 Mar 2018 05:36:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Wed, 14 Mar 2018 05:36:14 -0700 (PDT)
In-Reply-To: <20180314084005.23014-1-pascal.bach@siemens.com>
References: <20180314084005.23014-1-pascal.bach@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 14 Mar 2018 08:36:14 -0400
Message-ID: <CADkTA4Mom5R6DXGgH8i0xEEfY7bgSWtZ=6==q9T7an8QwC+wdg@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] style: make indention consistent
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
X-List-Received-Date: Wed, 14 Mar 2018 12:36:18 -0000
Content-Type: text/plain; charset="UTF-8"

urk. Thanks, but no thanks. On the next package update, I'll take care of these,
but I avoid all whitespace / cleanup patches like the plague.

Bruce

On Wed, Mar 14, 2018 at 4:40 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  recipes-containers/containerd/containerd.inc       |  80 +++++++-------
>  recipes-containers/docker/docker_git.bb            | 120 ++++++++++-----------
>  recipes-containers/runc/runc.inc                   |  56 +++++-----
>  recipes-devtools/python/python3-docker_2.5.1.bb    |   6 +-
>  .../linux/linux-yocto_virtualization.inc           |   6 +-
>  5 files changed, 134 insertions(+), 134 deletions(-)
>
> diff --git a/recipes-containers/containerd/containerd.inc b/recipes-containers/containerd/containerd.inc
> index e7a3719..f91e018 100644
> --- a/recipes-containers/containerd/containerd.inc
> +++ b/recipes-containers/containerd/containerd.inc
> @@ -25,30 +25,30 @@ INSANE_SKIP_${PN} += "ldflags"
>  do_configure[noexec] = "1"
>
>  do_compile() {
> -       # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
> -       # docker to download its dependencies but rather
> -       # use dependencies packaged independently.
> -       cd ${S}
> -       rm -rf .gopath
> -       mkdir -p .gopath/src/"$(dirname "${CONTAINERD_PKG}")"
> -       ln -sf ../../../.. .gopath/src/"${CONTAINERD_PKG}"
> -
> -        export GOPATH="${WORKDIR}/git/"
> -        export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
> -
> -       # Pass the needed cflags/ldflags so that cgo
> -       # can find the needed headers files and libraries
> -       export GOARCH="${TARGET_GOARCH}"
> -       export CGO_ENABLED="1"
> -       export CFLAGS=""
> -       export LDFLAGS=""
> -       export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> -       export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> -        export GO_GCFLAGS=""
> -       export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
> -       export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
> -
> -        oe_runmake static
> +    # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
> +    # docker to download its dependencies but rather
> +    # use dependencies packaged independently.
> +    cd ${S}
> +    rm -rf .gopath
> +    mkdir -p .gopath/src/"$(dirname "${CONTAINERD_PKG}")"
> +    ln -sf ../../../.. .gopath/src/"${CONTAINERD_PKG}"
> +
> +    export GOPATH="${WORKDIR}/git/"
> +    export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
> +
> +    # Pass the needed cflags/ldflags so that cgo
> +    # can find the needed headers files and libraries
> +    export GOARCH="${TARGET_GOARCH}"
> +    export CGO_ENABLED="1"
> +    export CFLAGS=""
> +    export LDFLAGS=""
> +    export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> +    export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> +    export GO_GCFLAGS=""
> +    export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
> +    export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
> +
> +    oe_runmake static
>  }
>
>  # Note: disabled for now, since docker is launching containerd
> @@ -57,22 +57,22 @@ do_compile() {
>  # SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','containerd.service','',d)}"
>
>  do_install() {
> -       mkdir -p ${D}/${bindir}
> -
> -       cp ${S}/bin/containerd ${D}/${bindir}/containerd
> -       cp ${S}/bin/containerd-shim ${D}/${bindir}/containerd-shim
> -        cp ${S}/bin/ctr ${D}/${bindir}/containerd-ctr
> -
> -       ln -sf containerd ${D}/${bindir}/docker-containerd
> -       ln -sf containerd-shim ${D}/${bindir}/docker-containerd-shim
> -       ln -sf containerd-ctr ${D}/${bindir}/docker-containerd-ctr
> -
> -       if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> -               install -d ${D}${systemd_unitdir}/system
> -               install -m 644 ${WORKDIR}/containerd.service ${D}/${systemd_unitdir}/system
> -               # adjust from /usr/local/bin to /usr/bin/
> -               sed -e "s:/usr/local/bin/containerd:${bindir}/docker-containerd:g" -i ${D}/${systemd_unitdir}/system/containerd.service
> -       fi
> +    mkdir -p ${D}/${bindir}
> +
> +    cp ${S}/bin/containerd ${D}/${bindir}/containerd
> +    cp ${S}/bin/containerd-shim ${D}/${bindir}/containerd-shim
> +    cp ${S}/bin/ctr ${D}/${bindir}/containerd-ctr
> +
> +    ln -sf containerd ${D}/${bindir}/docker-containerd
> +    ln -sf containerd-shim ${D}/${bindir}/docker-containerd-shim
> +    ln -sf containerd-ctr ${D}/${bindir}/docker-containerd-ctr
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 644 ${WORKDIR}/containerd.service ${D}/${systemd_unitdir}/system
> +        # adjust from /usr/local/bin to /usr/bin/
> +        sed -e "s:/usr/local/bin/containerd:${bindir}/docker-containerd:g" -i ${D}/${systemd_unitdir}/system/containerd.service
> +    fi
>  }
>
>  FILES_${PN} += "${systemd_system_unitdir}/*"
> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> index 4ba5e81..5ae9211 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -22,13 +22,13 @@ SRCREV_docker = "e639a70fbe999d96354a5bcf560231b7b8aa935c"
>  SRCREV_libnetwork = "26addf43a5d925ff79d262dbbdb5344bc2b6e198"
>  SRCREV_cli = "a765218f1988e85b68aa3977f34893ec7b059a60"
>  SRC_URI = "\
> -       git://github.com/moby/moby.git;nobranch=1;name=docker \
> -       git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=libnetwork \
> -       git://github.com/docker/cli;branch=master;name=cli;destsuffix=cli \
> -       file://docker.init \
> -       file://hi.Dockerfile \
> -       file://context-use-golang.org-x-net-pkg-until-we-move-to-go.patch \
> -       "
> +    git://github.com/moby/moby.git;nobranch=1;name=docker \
> +    git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=libnetwork \
> +    git://github.com/docker/cli;branch=master;name=cli;destsuffix=cli \
> +    file://docker.init \
> +    file://hi.Dockerfile \
> +    file://context-use-golang.org-x-net-pkg-until-we-move-to-go.patch \
> +    "
>
>  # Apache-2.0 for docker
>  LICENSE = "Apache-2.0"
> @@ -80,41 +80,41 @@ inherit goarch
>  do_configure[noexec] = "1"
>
>  do_compile() {
> -       # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
> -       # docker to download its dependencies but rather
> -       # use dependencies packaged independently.
> -       cd ${S}/src/import
> -       rm -rf .gopath
> -       mkdir -p .gopath/src/"$(dirname "${DOCKER_PKG}")"
> -       ln -sf ../../../.. .gopath/src/"${DOCKER_PKG}"
> -
> -       mkdir -p .gopath/src/github.com/docker
> -       ln -sf ${WORKDIR}/libnetwork .gopath/src/github.com/docker/libnetwork
> -       ln -sf ${WORKDIR}/cli .gopath/src/github.com/docker/cli
> -
> -       export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
> -       export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
> -
> -       # Pass the needed cflags/ldflags so that cgo
> -       # can find the needed headers files and libraries
> -       export GOARCH=${TARGET_GOARCH}
> -       export CGO_ENABLED="1"
> -       export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> -       export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> -       # in order to exclude devicemapper and btrfs - https://github.com/docker/docker/issues/14056
> -       export DOCKER_BUILDTAGS='exclude_graphdriver_btrfs exclude_graphdriver_devicemapper'
> -
> -       # this is the unsupported built structure
> -       # that doesn't rely on an existing docker
> -       # to build this:
> -       DOCKER_GITCOMMIT="${SRCREV}" \
> -         ./hack/make.sh dynbinary
> -
> -       # build the proxy
> -       go build -o ${S}/src/import/docker-proxy github.com/docker/libnetwork/cmd/proxy
> -
> -        # build the cli
> -       go build -o ${S}/src/import/bundles/latest/dynbinary-client/docker github.com/docker/cli/cmd/docker
> +    # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
> +    # docker to download its dependencies but rather
> +    # use dependencies packaged independently.
> +    cd ${S}/src/import
> +    rm -rf .gopath
> +    mkdir -p .gopath/src/"$(dirname "${DOCKER_PKG}")"
> +    ln -sf ../../../.. .gopath/src/"${DOCKER_PKG}"
> +
> +    mkdir -p .gopath/src/github.com/docker
> +    ln -sf ${WORKDIR}/libnetwork .gopath/src/github.com/docker/libnetwork
> +    ln -sf ${WORKDIR}/cli .gopath/src/github.com/docker/cli
> +
> +    export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
> +    export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
> +
> +    # Pass the needed cflags/ldflags so that cgo
> +    # can find the needed headers files and libraries
> +    export GOARCH=${TARGET_GOARCH}
> +    export CGO_ENABLED="1"
> +    export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> +    export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> +    # in order to exclude devicemapper and btrfs - https://github.com/docker/docker/issues/14056
> +    export DOCKER_BUILDTAGS='exclude_graphdriver_btrfs exclude_graphdriver_devicemapper'
> +
> +    # this is the unsupported built structure
> +    # that doesn't rely on an existing docker
> +    # to build this:
> +    DOCKER_GITCOMMIT="${SRCREV}" \
> +      ./hack/make.sh dynbinary
> +
> +    # build the proxy
> +    go build -o ${S}/src/import/docker-proxy github.com/docker/libnetwork/cmd/proxy
> +
> +    # build the cli
> +    go build -o ${S}/src/import/bundles/latest/dynbinary-client/docker github.com/docker/cli/cmd/docker
>  }
>
>  SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
> @@ -127,24 +127,24 @@ INITSCRIPT_NAME_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','dock
>  INITSCRIPT_PARAMS_${PN} = "defaults"
>
>  do_install() {
> -       mkdir -p ${D}/${bindir}
> -       cp ${S}/src/import/bundles/latest/dynbinary-client/docker ${D}/${bindir}/docker
> -       cp ${S}/src/import/bundles/latest/dynbinary-daemon/dockerd ${D}/${bindir}/dockerd
> -       cp ${S}/src/import/docker-proxy ${D}/${bindir}/docker-proxy
> -
> -       if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> -               install -d ${D}${systemd_unitdir}/system
> -               install -m 644 ${S}/src/import/contrib/init/systemd/docker.* ${D}/${systemd_unitdir}/system
> -               # replaces one copied from above with one that uses the local registry for a mirror
> -               install -m 644 ${S}/src/import/contrib/init/systemd/docker.service ${D}/${systemd_unitdir}/system
> -       else
> -               install -d ${D}${sysconfdir}/init.d
> -               install -m 0755 ${WORKDIR}/docker.init ${D}${sysconfdir}/init.d/docker.init
> -       fi
> -
> -       mkdir -p ${D}${datadir}/docker/
> -       cp ${WORKDIR}/hi.Dockerfile ${D}${datadir}/docker/
> -       install -m 0755 ${S}/src/import/contrib/check-config.sh ${D}${datadir}/docker/
> +    mkdir -p ${D}/${bindir}
> +    cp ${S}/src/import/bundles/latest/dynbinary-client/docker ${D}/${bindir}/docker
> +    cp ${S}/src/import/bundles/latest/dynbinary-daemon/dockerd ${D}/${bindir}/dockerd
> +    cp ${S}/src/import/docker-proxy ${D}/${bindir}/docker-proxy
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 644 ${S}/src/import/contrib/init/systemd/docker.* ${D}/${systemd_unitdir}/system
> +        # replaces one copied from above with one that uses the local registry for a mirror
> +        install -m 644 ${S}/src/import/contrib/init/systemd/docker.service ${D}/${systemd_unitdir}/system
> +    else
> +        install -d ${D}${sysconfdir}/init.d
> +        install -m 0755 ${WORKDIR}/docker.init ${D}${sysconfdir}/init.d/docker.init
> +    fi
> +
> +    mkdir -p ${D}${datadir}/docker/
> +    cp ${WORKDIR}/hi.Dockerfile ${D}${datadir}/docker/
> +    install -m 0755 ${S}/src/import/contrib/check-config.sh ${D}${datadir}/docker/
>  }
>
>  inherit useradd
> diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/runc.inc
> index 0179103..23f31c4 100644
> --- a/recipes-containers/runc/runc.inc
> +++ b/recipes-containers/runc/runc.inc
> @@ -23,38 +23,38 @@ do_configure[noexec] = "1"
>  EXTRA_OEMAKE="BUILDTAGS=''"
>
>  do_compile() {
> -       # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
> -       # docker to download its dependencies but rather
> -       # use dependencies packaged independently.
> -       cd ${S}/src/import
> -       rm -rf .gopath
> -       dname=`dirname "${LIBCONTAINER_PACKAGE}"`
> -       bname=`basename "${LIBCONTAINER_PACKAGE}"`
> -       mkdir -p .gopath/src/${dname}
> -
> -       (cd .gopath/src/${dname}; ln -sf ../../../../../${bname} ${bname})
> -       export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
> -
> -       # Fix up symlink for go-cross compiler
> -       rm -f ${S}/src/import/vendor/src
> -       ln -sf ./ ${S}/src/import/vendor/src
> -
> -       # Pass the needed cflags/ldflags so that cgo
> -       # can find the needed headers files and libraries
> -       export CGO_ENABLED="1"
> -       export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> -       export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> -       export CFLAGS=""
> -       export LDFLAGS=""
> -
> -        oe_runmake static
> +    # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
> +    # docker to download its dependencies but rather
> +    # use dependencies packaged independently.
> +    cd ${S}/src/import
> +    rm -rf .gopath
> +    dname=`dirname "${LIBCONTAINER_PACKAGE}"`
> +    bname=`basename "${LIBCONTAINER_PACKAGE}"`
> +    mkdir -p .gopath/src/${dname}
> +
> +    (cd .gopath/src/${dname}; ln -sf ../../../../../${bname} ${bname})
> +    export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
> +
> +    # Fix up symlink for go-cross compiler
> +    rm -f ${S}/src/import/vendor/src
> +    ln -sf ./ ${S}/src/import/vendor/src
> +
> +    # Pass the needed cflags/ldflags so that cgo
> +    # can find the needed headers files and libraries
> +    export CGO_ENABLED="1"
> +    export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> +    export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> +    export CFLAGS=""
> +    export LDFLAGS=""
> +
> +    oe_runmake static
>  }
>
>  do_install() {
> -       mkdir -p ${D}/${bindir}
> +    mkdir -p ${D}/${bindir}
>
> -       cp ${S}/src/import/runc ${D}/${bindir}/runc
> -       ln -sf runc ${D}/${bindir}/docker-runc
> +    cp ${S}/src/import/runc ${D}/${bindir}/runc
> +    ln -sf runc ${D}/${bindir}/docker-runc
>  }
>
>  INHIBIT_PACKAGE_STRIP = "1"
> diff --git a/recipes-devtools/python/python3-docker_2.5.1.bb b/recipes-devtools/python/python3-docker_2.5.1.bb
> index 341d95c..d686239 100644
> --- a/recipes-devtools/python/python3-docker_2.5.1.bb
> +++ b/recipes-devtools/python/python3-docker_2.5.1.bb
> @@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "b876e6909d8d2360e0540364c3a952a62847137f4674f2439320ede16d
>  DEPENDS += "${PYTHON_PN}-pip-native"
>
>  RDEPENDS_${PN} += " \
> -       python3-docker-pycreds \
> -       python3-requests \
> -       python3-websocket-client \
> +    python3-docker-pycreds \
> +    python3-requests \
> +    python3-websocket-client \
>  "
> diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/recipes-kernel/linux/linux-yocto_virtualization.inc
> index 9905ed9..51fa250 100644
> --- a/recipes-kernel/linux/linux-yocto_virtualization.inc
> +++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
> @@ -2,10 +2,10 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/linux-yocto:"
>
>  SRC_URI += "file://xt-checksum.scc \
>              file://ebtables.scc \
> -           file://vswitch.scc \
> -           file://lxc.scc \
> +            file://vswitch.scc \
> +            file://lxc.scc \
>              file://docker.scc \
> -           "
> +        "
>  KERNEL_FEATURES_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'kvm', 'features/kvm/qemu-kvm-enable.scc', '', d)}"
>
>  KERNEL_MODULE_AUTOLOAD += "openvswitch"
> --
> 2.11.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

