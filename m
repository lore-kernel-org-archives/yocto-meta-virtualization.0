Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9EFF2E00C22; Tue, 20 Aug 2019 06:11:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.128.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53AE0E00961
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Aug 2019 06:11:55 -0700 (PDT)
Received: by mail-wm1-f68.google.com with SMTP id l2so2625132wmg.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Aug 2019 06:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ITDu5BhPNvHXlpKY5+xpX+ZX7trOivwuNkh64WaB/yk=;
	b=bc0xZ5wubS86GRS5V6AahGVc0JbYobXm8udFC3qDWTVF3t5kRHY3FFyGuf0dqL7TkO
	kHS879f9NR2WxyPTgYzCafXdxBonRJogYUkSLJSEuvFuT5Cj2I9LlLQ76jNfCR4TmTwe
	VE8UB/OYN4grYj2v/u5mguMEIhKGIoixa1aw4DNP2XG8FRDbaH9ASg1oLFBZd4uQtv/I
	V7/zA32DZmtDZ2zROtg6ujxJSG+gNj+B5wlD3mZfuzOVG69cLS/HwDlZymb4Vrfv5fET
	OB/RwTUyU44YmAyRy5hivcQxuOIYhx9h4oNA6WcqyjhptW54cQbRUSlkKjufvkgwrlEq
	Bbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ITDu5BhPNvHXlpKY5+xpX+ZX7trOivwuNkh64WaB/yk=;
	b=Cn/YKg2uKAqSsS1uMlLZQtQ00zJRz0xepmWnhWlseZJIIZxgSYvyRBXqJBgjWbWnGN
	9kjs3pyb64UKGHBayuzGfIwWUbvVhHLq5pjBFyiwSB5RHBCRDYsv8lzbau/ePf4Yt6Gi
	236Z/240mTbuMoV+i4JGtCclGjbNpXP6mjablOg1gHVh6ORP2hGfwWiexgxhInYBoZQM
	mv/JY3Z9p0/SIF/urqGNopQM+Rho6/uEFK9eH3d9Hf9j8sk2GdKLNOavQAaQD9Ema/Cu
	hTv2uG3B/zRhQVfFt/qMQdJ/mSQ0mATdGlBEOIa0K1eJHeDEKaq6KL95BCStJejAA93B
	l9/g==
X-Gm-Message-State: APjAAAV4Lb50m7L0IVt2P1OQozurgBmCGw8hrQUXeB/LOl8hm/Xr6xJP
	OLUT83+v3dNySpEE/b1wjF+BdDSQdp7SZ0mvT0I=
X-Google-Smtp-Source: APXvYqywu3kFsKcIl4G+uUE39HGhhmg1D5NCurnx87zDCmFFOd11ai97WzVhXW7LziV00n3+xWTpcS2an/yZhXnFnaY=
X-Received: by 2002:a1c:5f06:: with SMTP id t6mr24018942wmb.60.1566306714052; 
	Tue, 20 Aug 2019 06:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <1566291252-30059-1-git-send-email-liu.ming50@gmail.com>
In-Reply-To: <1566291252-30059-1-git-send-email-liu.ming50@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 20 Aug 2019 09:11:42 -0400
Message-ID: <CADkTA4MXMvL-N_66VB89J+GjjuGwuEaaw2Fz=UXSKeZQcwQNCA@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: meta-virtualization@yoctoproject.org, max.krummenacher@toradex.com,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH] docker: add docker-app support
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
X-List-Received-Date: Tue, 20 Aug 2019 13:11:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 20, 2019 at 4:56 AM <liu.ming50@gmail.com> wrote:
>
> From: Ming Liu <liu.ming50@gmail.com>
>
> A docker-cpp binary would be generated after this change.

Looks like auto-correct changed "docker-app" to "docker-cpp".

Also, can you include some of the information from docker-app in the
long log, that way we have a recorded description of what it is.

I'm also trying to make sure these components are testable, can you
put of your testing, can you include it in the long log as well ?
Eventually we need unit tests for everything, but having a log of the
tests is a minimum starting point.

>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  recipes-containers/docker/docker_git.bb            |  9 +++++++
>  .../0001-Makefile-do-not-override-LDFLAGS.patch    | 31 ++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 recipes-containers/docker/files/0001-Makefile-do-not-override-LDFLAGS.patch
>
> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> index e45f87e..bf9cdc7 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -38,13 +38,16 @@ DESCRIPTION = "Linux container runtime \
>  SRCREV_moby = "344b093258fcb2195fa393081e5224a6c766c798"
>  SRCREV_libnetwork = "5ac07abef4eee176423fdc1b870d435258e2d381"
>  SRCREV_cli = "2f1931f9eb2d6bac2efd48d94739f2e9919d4d7d"
> +SRCREV_app = "ad4481ea1a063659f15cac38048883b54f0820e2"
>  SRC_URI = "\
>         git://github.com/moby/moby.git;nobranch=1;name=moby \
>         git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=git/libnetwork \
>         git://github.com/docker/cli;branch=19.03;name=cli;destsuffix=git/cli \
> +       git://github.com/docker/app;branch=master;name=app;destsuffix=git/app \

I'm trying to decide if we want this to also be part of the docker-ce build.

While it is true that it isn't part of docker-ce, I'm trying to keep
the build outputs of the two very similar. I'd also rather not break
this up into a separate recipe at the moment, since having all of the
components build out of a single recipe was a design choice, and I'd
like to keep that intact.

I'm thinking we can hit a middle ground on this. Leave the build as
you have it, but package the resulting binary in a separate package
out of this single recipe. That way we can avoid adding it to
docker-ce for now, and it can be an optional install.

I have another round of updates to the recipes almost ready to go, but
I can easily stack this on top of the work that I'm doing.

>         file://docker.init \
>         file://0001-libnetwork-use-GO-instead-of-go.patch \
>         file://0001-imporve-hardcoded-CC-on-cross-compile.patch \
> +       file://0001-Makefile-do-not-override-LDFLAGS.patch \
>         "
>
>  require docker.inc
> @@ -83,6 +86,7 @@ do_compile() {
>         mkdir -p .gopath/src/github.com/docker
>         ln -sf ${WORKDIR}/git/libnetwork .gopath/src/github.com/docker/libnetwork
>         ln -sf ${WORKDIR}/git/cli .gopath/src/github.com/docker/cli
> +       ln -sf ${WORKDIR}/git/app .gopath/src/github.com/docker/app
>
>         export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
>         export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
> @@ -111,6 +115,10 @@ do_compile() {
>         export DOCKER_VERSION=${DOCKER_VERSION}
>         VERSION="${DOCKER_VERSION}" DOCKER_GITCOMMIT="${SRCREV_docker}" make dynbinary
>
> +       # build the app
> +       cd ${S}/src/import/.gopath/src/github.com/docker/app
> +       make dynamic

I noticed another raw "make" call in one of the other recipes while
doing another round of uprevs (which I'll submit shortly), but this
should be oe_runmake to match other calls.

Bruce

> +
>         # build the proxy
>         cd ${S}/src/import/.gopath/src/github.com/docker/libnetwork
>         oe_runmake cross-local
> @@ -119,6 +127,7 @@ do_compile() {
>  do_install() {
>         mkdir -p ${D}/${bindir}
>         cp ${WORKDIR}/git/cli/build/docker ${D}/${bindir}/docker
> +       cp ${WORKDIR}/git/app/bin/docker-app ${D}/${bindir}/docker-app
>         cp ${S}/src/import/bundles/latest/dynbinary-daemon/dockerd ${D}/${bindir}/dockerd
>         cp ${WORKDIR}/git/libnetwork/bin/docker-proxy* ${D}/${bindir}/docker-proxy
>
> diff --git a/recipes-containers/docker/files/0001-Makefile-do-not-override-LDFLAGS.patch b/recipes-containers/docker/files/0001-Makefile-do-not-override-LDFLAGS.patch
> new file mode 100644
> index 0000000..c987a51
> --- /dev/null
> +++ b/recipes-containers/docker/files/0001-Makefile-do-not-override-LDFLAGS.patch
> @@ -0,0 +1,31 @@
> +From 494b5f6982a35e285d3ef15e67d2fe27873909e4 Mon Sep 17 00:00:00 2001
> +From: Ming Liu <liu.ming50@gmail.com>
> +Date: Sun, 18 Aug 2019 11:52:14 +0800
> +Subject: [PATCH] Makefile: do not override LDFLAGS
> +
> +Replace a ":=" by "+=" when setting LDFLAGS, this ensures it would not
> +override the linking flags from OE environment.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +
> +Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> +---
> + app/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/app/Makefile b/app/Makefile
> +index 77f18b4..d311726 100644
> +--- a/app/Makefile
> ++++ b/app/Makefile
> +@@ -13,7 +13,7 @@ ifeq ($(EXPERIMENTAL),on)
> +   BUILDTAGS="experimental"
> + endif
> +
> +-LDFLAGS := "-s -w \
> ++LDFLAGS := " \
> +   -X $(PKG_NAME)/internal.GitCommit=$(COMMIT) \
> +   -X $(PKG_NAME)/internal.Version=$(TAG)      \
> +   -X $(PKG_NAME)/internal.Experimental=$(EXPERIMENTAL) \
> +--
> +2.7.4
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

