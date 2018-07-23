Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 78067E00C77; Mon, 23 Jul 2018 12:51:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E9F5E00A04
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jul 2018 12:51:13 -0700 (PDT)
Received: by mail-lf1-f65.google.com with SMTP id f18-v6so1335101lfc.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jul 2018 12:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dd0Rl/cBR2IzHEYtONcBY6Qx/LMUTP6lFUAJ8ICT1y0=;
	b=kq8pPO0ogUd/BpM8WnQqCcv894AAGKFFe4KqcQjhuMuyKadLm47iNayxlhrv6g9eU5
	hqiOOAHxPlV71vQDTOdDC4W3Ju/bj32vyps7yTwqxtwYd2gdwtP6TyZfDRdJ/3nFRiHD
	LUHNpBPD2PMUkp7GmxHFNeYA4aVnC+DI3pvoSAsNzL5ma3JeMihSEBEPqkbz8wXshIj+
	sEhiSYH0FLaScCTO97JEGi84xuAFEhK6z0LgYQSXqlk2zgJ4R4kURXQft1vQG9nQ1/3B
	uLUQ6HTCu4+EqxeC8ULCCh6Auyfmqz6LBipsrV4pWQbRH7XrZWH9/xYYnOB6NqDIRf1r
	//+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dd0Rl/cBR2IzHEYtONcBY6Qx/LMUTP6lFUAJ8ICT1y0=;
	b=C8kwnigOWehz50OFjLkM51bBqLMkLfSmrjgNdZ3IrZdX4H16q/yCMi81FpSKwpggfS
	uGzITs/O2K42KHbtkgl0z231Szkv1QsG1vsJjGOKuuAoII9rRek+fXNTP6C8kgvLMwfG
	Y2UEl4SocQq9ggkgLcNZv67XDVG2mbIZsuiKyvzpOHmwakS2kY7WWR3F+7Zn+BpKE/Cc
	Rfpa6EUUiuMiImyqBwjqU8pEcQBiQQyDPsaQMa4xso84vg3Vol43ZySe4nC6nIDxqk5z
	l4bBD7uzokz25fQ3ZafZusFcaTv1vJ+6ZkCR9KnXsaOptDE+KijdlC6ZfwJ6fRca8x9s
	j9xQ==
X-Gm-Message-State: AOUpUlFLS63jgWSMM/kX8CrnGHoMulY8BXnailr4d/fdMY9+no5EQ8HV
	l5gXUoRX0eCg1tBWU8JPq/WN6UX2etZsd3ayNbc=
X-Google-Smtp-Source: AAOMgpcg2MEvlhR+Sf3pNrSgn42u8kkb7VFj5Heo3a83yf9vDn9HoIkzJWC1HJH2XZCSDttV0oEuBojUodIl+1d2f+w=
X-Received: by 2002:a19:cb44:: with SMTP id
	b65-v6mr8584974lfg.12.1532375472075; 
	Mon, 23 Jul 2018 12:51:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Mon, 23 Jul 2018 12:51:11
	-0700 (PDT)
In-Reply-To: <20180723144850.17279-1-koen.kooi@linaro.org>
References: <20180723144850.17279-1-koen.kooi@linaro.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 23 Jul 2018 15:51:11 -0400
Message-ID: <CADkTA4MDKrO8xkjEMWf6-=3mzsU73WKZuEa73oBzHFopuCNafw@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Raymond Danks <ray.danks@se-eng.com>, meta-virtualization@yoctoproject.org,
	Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [PATCH 1/4] kubernetes: explicitly build for $TARGET_ARCH
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
X-List-Received-Date: Mon, 23 Jul 2018 19:51:14 -0000
Content-Type: text/plain; charset="UTF-8"

I had to add a QA skip for PN-misc, since in my config it was throwing
a GNU_HASH error.

This is now pushed, thanks for the cleanups.

Cheers,

Bruce

On Mon, Jul 23, 2018 at 10:48 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> 'make all' uses 'uname' to select the build target, leading to compile failures like this:
>
> | arm-angstrom-linux-gnueabi-gcc: error: unrecognized command line option '-m64'
>
> After providing the proper arch to the makefile it will try to use a hardcoded compiler:
>
> | # runtime/cgo
> | exec: "arm-linux-gnueabihf-gcc": executable file not found in $PATH
>
> Fix that up by removing all hardcoded 'CC' entries in golang.sh
>
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  ...ack-lib-golang.sh-use-CC-from-environment.patch | 40 ++++++++++++++++++++++
>  recipes-containers/kubernetes/kubernetes_git.bb    |  6 ++--
>  2 files changed, 44 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
>
> diff --git a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
> new file mode 100644
> index 0000000..62d0521
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
> @@ -0,0 +1,40 @@
> +From 9cbb2d523d481053d405ebac830c2074b00d3417 Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen.kooi@linaro.org>
> +Date: Mon, 23 Jul 2018 15:28:02 +0200
> +Subject: [PATCH] hack/lib/golang.sh: use CC from environment
> +
> +Toolchain tupples differs, especially when using vendor provides ones.
> +
> +Upstream-status: Inappropriate [embedded specific]
> +Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> +---
> + hack/lib/golang.sh | 4 ----
> + 1 file changed, 4 deletions(-)
> +
> +diff --git a/hack/lib/golang.sh b/hack/lib/golang.sh
> +index c5d4634..563e2b4b 100755
> +--- a/src/import/hack/lib/golang.sh
> ++++ b/src/import/hack/lib/golang.sh
> +@@ -278,19 +278,15 @@ kube::golang::set_platform_envs() {
> +     case "${platform}" in
> +       "linux/arm")
> +         export CGO_ENABLED=1
> +-        export CC=arm-linux-gnueabihf-gcc
> +         ;;
> +       "linux/arm64")
> +         export CGO_ENABLED=1
> +-        export CC=aarch64-linux-gnu-gcc
> +         ;;
> +       "linux/ppc64le")
> +         export CGO_ENABLED=1
> +-        export CC=powerpc64le-linux-gnu-gcc
> +         ;;
> +       "linux/s390x")
> +         export CGO_ENABLED=1
> +-        export CC=s390x-linux-gnu-gcc
> +         ;;
> +     esac
> +   fi
> +--
> +2.9.5
> +
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index 10558ef..33cb933 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -7,6 +7,7 @@ maintenance, and scaling of applications. \
>
>  SRCREV_kubernetes = "210c9cd7e1782e9fe46938fe0368556f2166a528"
>  SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.11;name=kubernetes \
> +           file://0001-hack-lib-golang.sh-use-CC-from-environment.patch \
>            "
>
>  DEPENDS += "rsync-native \
> @@ -46,6 +47,7 @@ inherit goarch
>
>  do_compile() {
>         export GOARCH="${TARGET_GOARCH}"
> +       export GOOS="${TARGET_GOOS}"
>         export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
>         export GOPATH="${S}/src/import:${S}/src/import/vendor"
>
> @@ -72,7 +74,7 @@ do_compile() {
>
>         cd ${S}/src/import
>         # to limit what is built, use 'WHAT', i.e. make WHAT=cmd/kubelet
> -       make all
> +       make cross KUBE_BUILD_PLATFORMS=${GOOS}/${GOARCH}
>  }
>
>  do_install() {
> @@ -82,7 +84,7 @@ do_install() {
>
>      install -d ${D}${sysconfdir}/kubernetes/manifests/
>
> -    install -m 755 -D ${S}/src/import/_output/bin/kube* ${D}/${bindir}
> +    install -m 755 -D ${S}/src/import/_output/local/bin/${TARGET_GOOS}/${TARGET_GOARCH}/* ${D}/${bindir}
>
>      install -m 0644 ${S}/src/import/build/debs/kubelet.service  ${D}${systemd_unitdir}/system/
>      install -m 0644 ${S}/src/import/build/debs/10-kubeadm.conf  ${D}${systemd_unitdir}/system/kubelet.service.d/
> --
> 2.9.5
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

