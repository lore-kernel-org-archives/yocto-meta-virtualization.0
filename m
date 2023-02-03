Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED90C61DA4
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 14:39:00 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web10.11979.1675435139255365126
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Feb 2023 06:38:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TAeH7EQd;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id j4so2032131iog.8
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Feb 2023 06:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DltmQ601gUIU1Wt/GR6n1dzD0wUvIDqNOw4C1j+RrHU=;
        b=TAeH7EQdlI17+PJAZyS2+JXVjKabmYFNdrnuMcZYSnad8ZWtprE5vnDAmCf7xNnaUQ
         6IV+NBgPKBhig1NSRjE9OyH9W5T5eleoQBE1P2JNZlkA4Jkm7yRii9jj5gn9geY+gG9U
         GD3edW3S8UAwd9XzrOciCQSHSMKP7gQ6CAFrrqoAZKvXH1W/qe0QjUoySithklvbgwMj
         4puUjR5gEeQ49GaWG4J+HDpobLQZ9KDrf4ezieZAx5+p7onca/eQpZH0apyCe0ZR7aJw
         CTdZpfz0Momt49M0QiTRHgnjOA8E0aK7gWBTUJMiicBMRK/yHy9fEXobmeFpZy1IDCfd
         14Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DltmQ601gUIU1Wt/GR6n1dzD0wUvIDqNOw4C1j+RrHU=;
        b=EDyOL+OwhJLfSFAcL36aOADf6p8NN83dtZIMoHVMWVTdjvED+FCiNxvsvIUN5Qu0pU
         sUkgcAqQfN06pGbBF1tM4CqyL3+Ema18/4F35hGuBkSViPnCiw5wbpQ4JvYtTP1THEpi
         UTHbgiUkkhjkMt8P6y8Lf69xXQ9+7hUfWRgvKlBzbjku/Hb321pDZjQdS/TaCJBl4C6x
         vqp9T781063rlqgvQkl/Kb7n7JjWBY46EZjmQwRcEWLkpdPSpDSs9tcu0ZCVYbMX7kA6
         F9tv67JDyTvvJkS5CeiMvLuE4YCEpnoYHo+TcFJJ64iDIALoZQgcigpO1B2SO3RRjKDp
         8NwA==
X-Gm-Message-State: AO0yUKWUGFp9O54xI2vhlakcaJbE7kHITcqMAu1+YyVCTA9t/xCbqbG2
	iMXOIudY8+UObztKUGrI6JiBluQAAttBcYpIcV4=
X-Google-Smtp-Source: AK7set/z5PZUx9jWsbhhly94jXHbid/o3lrld58N94aNzYDnTXdTPbDVC6jLmqwVgfJVLEs+7oYsP261JEmzQX2Betc=
X-Received: by 2002:a05:6602:387:b0:6e2:f126:6c1f with SMTP id
 f7-20020a056602038700b006e2f1266c1fmr2402911iov.1.1675435138388; Fri, 03 Feb
 2023 06:38:58 -0800 (PST)
MIME-Version: 1.0
References: <20230203085053.16198-1-Qi.Chen@windriver.com>
In-Reply-To: <20230203085053.16198-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 3 Feb 2023 09:38:46 -0500
Message-ID: <CADkTA4Nn45Ttv6Kj-0Vu5-jDty4obCg6zvsvQ0yuaxV07DD5yA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] kubernetes: upgrade to 1.26.1
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Feb 2023 14:39:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7844

On Fri, Feb 3, 2023 at 3:51 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> Changes include:
> 1. Update SRC_URI an SRCREV
> 2. Change 0001-hack-lib-golang.sh-use-CC-from-environment.patch to also
>    remove the 'export CC=xxx' for amd64. The original patch is a little
>    strange, it removes such statements for other archs but leaves amd64
>    untouched. If we're using CC from our environment, we use it for all
>    targets.
> 3. Adapt 0001-build-golang.sh-convert-remaining-go-calls-to-use.patch to
>    the 1.26.1 version.
> 4. Comment out the 'make file_generated' command. I'm not sure why it's
>    needed in the past, but for 1.26.1, it does seem to be necessary.

Those are host tools / files required for the build. The support has
moved into a new
script update-codegen.sh. While it isn't always necessary, there are some paths
through the build that require it.

There are some unprotected calls to "go" in the script, but luckily it
is host side
so the architecture matches and we are fine. If someone is building on a ARM
host, they can send patches to fix things.

I have been working on a similar update, and I'll roll your changes into my work
and add your signed off by to the commit.

Bruce

>
> This upgrade is tested on qemux86-64 & qemuarm64: k8s + containerd + flannel.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...sh-convert-remaining-go-calls-to-use.patch | 39 +++++++++++--------
>  ...ib-golang.sh-use-CC-from-environment.patch | 25 +++++++-----
>  .../kubernetes/kubernetes_git.bb              |  8 ++--
>  3 files changed, 43 insertions(+), 29 deletions(-)
>
> diff --git a/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch b/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch
> index 8c6644a..6849549 100644
> --- a/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch
> +++ b/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch
> @@ -1,18 +1,22 @@
> -From 9973a66665992c49593595ae1eb70848907ea6a9 Mon Sep 17 00:00:00 2001
> -From: Bruce Ashfield <bruce.ashfield@gmail.com>
> -Date: Wed, 12 Aug 2020 16:01:49 +0000
> -Subject: [PATCH] build/golang.sh: convert remaining 'go' calls to use
> +From 3a357f4bb769a4127f5107f4ae21ee8f12279677 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Thu, 2 Feb 2023 22:29:07 -0800
> +Subject: [PATCH 2/2] golang.sh: convert go to $GO
>
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> +Upstream-Status: Inappropriate [OE Specific]
> +
> +[The patch was original created by Bruce.]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>  ---
>   hack/lib/golang.sh | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> -Index: kubernetes-v1.24.0+git8b1b4db3834ddf7cf1b97137180f413cb9e2186f/hack/lib/golang.sh
> -===================================================================
> ---- kubernetes-v1.24.0+git8b1b4db3834ddf7cf1b97137180f413cb9e2186f.orig/hack/lib/golang.sh
> -+++ kubernetes-v1.24.0+git8b1b4db3834ddf7cf1b97137180f413cb9e2186f/hack/lib/golang.sh
> -@@ -652,7 +652,7 @@
> +diff --git a/hack/lib/golang.sh b/hack/lib/golang.sh
> +index 0ed2d719dd1..c2ea9e10186 100755
> +--- a/hack/lib/golang.sh
> ++++ b/hack/lib/golang.sh
> +@@ -676,7 +676,7 @@ kube::golang::build_some_binaries() {
>           kube::golang::create_coverage_dummy_test "${package}"
>           kube::util::trap_add "kube::golang::delete_coverage_dummy_test \"${package}\"" EXIT
>
> @@ -21,23 +25,23 @@ Index: kubernetes-v1.24.0+git8b1b4db3834ddf7cf1b97137180f413cb9e2186f/hack/lib/g
>             -covermode count \
>             -coverpkg k8s.io/...,k8s.io/kubernetes/vendor/k8s.io/... \
>             "${build_args[@]}" \
> -@@ -664,13 +664,13 @@
> +@@ -688,13 +688,13 @@ kube::golang::build_some_binaries() {
>       done
>       if [[ "${#uncovered[@]}" != 0 ]]; then
>         V=2 kube::log::info "Building ${uncovered[*]} without coverage..."
> --      go install "${build_args[@]}" "${uncovered[@]}"
> -+      $GO install "${build_args[@]}" "${uncovered[@]}"
> +-      GO111MODULE=on GOPROXY=off go install "${build_args[@]}" "${uncovered[@]}"
> ++      GO111MODULE=on GOPROXY=off $GO install "${build_args[@]}" "${uncovered[@]}"
>       else
>         V=2 kube::log::info "Nothing to build without coverage."
>        fi
>      else
>       V=2 kube::log::info "Coverage is disabled."
> --    go install "${build_args[@]}" "$@"
> -+    $GO install "${build_args[@]}" "$@"
> +-    GO111MODULE=on GOPROXY=off go install "${build_args[@]}" "$@"
> ++    GO111MODULE=on GOPROXY=off $GO install "${build_args[@]}" "$@"
>      fi
>   }
>
> -@@ -729,7 +729,7 @@
> +@@ -756,7 +756,7 @@ kube::golang::build_binaries_for_platform() {
>       testpkg=$(dirname "${test}")
>
>       mkdir -p "$(dirname "${outfile}")"
> @@ -46,3 +50,6 @@ Index: kubernetes-v1.24.0+git8b1b4db3834ddf7cf1b97137180f413cb9e2186f/hack/lib/g
>         ${goflags:+"${goflags[@]}"} \
>         -gcflags="${gogcflags}" \
>         -asmflags="${goasmflags}" \
> +--
> +2.37.1
> +
> diff --git a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
> index 1c4555a..c81bd1a 100644
> --- a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
> +++ b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
> @@ -1,21 +1,25 @@
> -From 9cbb2d523d481053d405ebac830c2074b00d3417 Mon Sep 17 00:00:00 2001
> +From 116ccf93eef322db23e3bd4f35b12be09ebfbde5 Mon Sep 17 00:00:00 2001
>  From: Koen Kooi <koen.kooi@linaro.org>
>  Date: Mon, 23 Jul 2018 15:28:02 +0200
> -Subject: [PATCH] hack/lib/golang.sh: use CC from environment
> +Subject: [PATCH 1/2] hack/lib/golang.sh: use CC from environment
>
>  Toolchain tupples differs, especially when using vendor provides ones.
>
>  Upstream-status: Inappropriate [embedded specific]
>  Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>  ---
> - hack/lib/golang.sh | 4 ----
> - 1 file changed, 4 deletions(-)
> + hack/lib/golang.sh | 5 -----
> + 1 file changed, 5 deletions(-)
>
> -Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/hack/lib/golang.sh
> -===================================================================
> ---- kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630.orig/hack/lib/golang.sh
> -+++ kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/hack/lib/golang.sh
> -@@ -414,19 +414,15 @@
> +diff --git a/hack/lib/golang.sh b/hack/lib/golang.sh
> +index fb97ee76783..0ed2d719dd1 100755
> +--- a/hack/lib/golang.sh
> ++++ b/hack/lib/golang.sh
> +@@ -419,23 +419,18 @@ kube::golang::set_platform_envs() {
> +     case "${platform}" in
> +       "linux/amd64")
> +         export CGO_ENABLED=1
> +-        export CC=${KUBE_LINUX_AMD64_CC:-x86_64-linux-gnu-gcc}
>           ;;
>         "linux/arm")
>           export CGO_ENABLED=1
> @@ -35,3 +39,6 @@ Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/hack/lib/g
>           ;;
>       esac
>     fi
> +--
> +2.37.1
> +
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index 31ef135..af26a39 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -5,8 +5,8 @@ applications across multiple hosts, providing basic mechanisms for deployment, \
>  maintenance, and scaling of applications. \
>  "
>
> -PV = "v1.24.0+git${SRCREV_kubernetes}"
> -SRCREV_kubernetes = "8b1b4db3834ddf7cf1b97137180f413cb9e2186f"
> +PV = "v1.26.1+git${SRCREV_kubernetes}"
> +SRCREV_kubernetes = "8f94681cd294aa8cfd3407b8191f6c70214973a4"
>  SRCREV_kubernetes-release = "7c1aa83dac555de6f05500911467b70aca4949f0"
>  PE = "1"
>
> @@ -22,7 +22,7 @@ PV:class-devupstream = "v1.23-alpha+git${SRCPV}"
>
>  SRCREV_FORMAT ?= "kubernetes_release"
>
> -SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.24;name=kubernetes;protocol=https;destsuffix=git/src/github.com/kubernetes/kubernetes \
> +SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.26;name=kubernetes;protocol=https;destsuffix=git/src/github.com/kubernetes/kubernetes \
>             git://github.com/kubernetes/release;branch=master;name=kubernetes-release;destsuffix=git/release;protocol=https"
>
>  SRC_URI:append = " \
> @@ -69,7 +69,7 @@ do_compile() {
>         export CC="${BUILD_CC}"
>         export LD="${BUILD_LD}"
>
> -       make generated_files GO="go" KUBE_BUILD_PLATFORMS="${HOST_GOOS}/${BUILD_GOARCH}"
> +       #make generated_files GO="go" KUBE_BUILD_PLATFORMS="${HOST_GOOS}/${BUILD_GOARCH}"
>
>         # Build the target binaries
>         export GOARCH="${TARGET_GOARCH}"
> --
> 2.37.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7843): https://lists.yoctoproject.org/g/meta-virtualization/message/7843
> Mute This Topic: https://lists.yoctoproject.org/mt/96719358/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

