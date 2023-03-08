Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC89CC678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 22:06:19 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.6805.1678313170070329502
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Mar 2023 14:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ieFeQnfE;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id y10so44180qtj.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Mar 2023 14:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678313169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rg8CyOgh6L46lHHHlNoh7bVrQR/lmJqJmQAUJjaB5SU=;
        b=ieFeQnfE5oxhXzi4gvaTpL/cb6QoeeUF7093KnFlmsKAhgw1oPZjF2dJfejRGEKj2z
         IEN5W5Li1fuCCSu/Ra6Uk5oGSsLoMpmIlpAj3aD6NhUS+3Flba1qDWEXPWabBmGZmm0g
         1PI10KhV0IDKSXd+i/jtwhtcYqR2hWZIb0wkzdnDf2FoNbL/aUl59TA9ttiYn1l65gwD
         IXvrgJbjgLYA9KRKGhgtKrWreJvP6L1GPC+OKqditDMZNXV/nePeNe7dV4kNoIrrQwte
         G1joHlf3CmcyeOxikfYgJMngVog3htFV1HrVT9GEJ71OPOlg6RSobzSLNtkLGOQLUGaj
         e0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678313169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rg8CyOgh6L46lHHHlNoh7bVrQR/lmJqJmQAUJjaB5SU=;
        b=Atppojbj7jqSsOGy1DDrfm56uRQmtpUIkHppF3K16nklpdCVdGCU66uGwJ4J5I/u9n
         XccJMt6Nq4L9JTJYyE4zUy6+y+wkJMWAu6lVxENa45n03ongX09CEGYSvlvrzV6XRKzw
         2uBzDEUtlZ5cxZvi0RqtKxOt7f7OX/78YKGhas/vNEMIw977RlwIzLAsCR7iw1BMrsC2
         jjcVzlNennrFnvI2tjO9QLbsAkTK3mL1h+9lSKsOyOY5b5NNZ859x+q/W/Qh261RX4Va
         Z7W+3xTF+DzVPq65WmoVs5sZ2JAtRj0gCUHmBclLJdxqg7T27mh1EJCREHN8e50VGtsu
         6eVw==
X-Gm-Message-State: AO0yUKWq/IWSPMhxgSQmVzfCyGyzN+jLqB4aDLXcfoNKsdUYggWI8jhk
	hs4uBgdE1Kbz+QaIIAEzsnloj2UbRlgy7A==
X-Google-Smtp-Source: AK7set9Xsc3Tt5torFlR2QAvNdo/lpRsWtTxBqXqV8Ls13EVew/DUxtnyPXWI+zefGrHLlImuV7q5A==
X-Received: by 2002:ac8:5c82:0:b0:3ba:6595:8640 with SMTP id r2-20020ac85c82000000b003ba65958640mr30429581qta.19.1678313168940;
        Wed, 08 Mar 2023 14:06:08 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id bn2-20020a05620a2ac200b0073bad2f9380sm12212826qkb.14.2023.03.08.14.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 14:06:08 -0800 (PST)
Date: Wed, 8 Mar 2023 17:06:06 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] kubernetes: upgrade to 1.26.1
Message-ID: <ZAkGzn9ar5iKGa81@gmail.com>
References: <20230203085053.16198-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203085053.16198-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Mar 2023 22:06:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7935

I haven't forgotten about this, I'm still working on a joint upgrade
to multiple recipes and stacks related to kubernetes, so it is taking
a bit longer than I'd like for the update.

Bruce

In message: [meta-virtualization][PATCH] kubernetes: upgrade to 1.26.1
on 03/02/2023 Chen Qi wrote:

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
>  	export CC="${BUILD_CC}"
>  	export LD="${BUILD_LD}"
>  
> -	make generated_files GO="go" KUBE_BUILD_PLATFORMS="${HOST_GOOS}/${BUILD_GOARCH}"
> +	#make generated_files GO="go" KUBE_BUILD_PLATFORMS="${HOST_GOOS}/${BUILD_GOARCH}"
>  
>  	# Build the target binaries
>  	export GOARCH="${TARGET_GOARCH}"
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


