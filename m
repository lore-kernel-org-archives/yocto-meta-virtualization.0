Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43BBC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 01:55:49 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.1262.1699322145335626384
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 17:55:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c8ss0l6j;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-778940531dbso336377885a.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Nov 2023 17:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699322144; x=1699926944; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vGF1D4kBb4EE6sBccqC2cVMnkEZhNYxxKEWF7ImCF7A=;
        b=c8ss0l6j0kYg/wLh3QJ0oBdNdlSa8HnJJs2wS33tZVVoK2i4P92n3jWrsZB86JNwLc
         U4JrEzRIlTp6ICz8ct+ZwKCn6iAU//cvV0mRBFkuyEvpeYQ8iOVD8xI4VjIzJHxnmTwN
         YM69YQX+X3AVpywPH5Lnx2ZlUl9z41xCayxXkfxq8uhHp8Br+5cTFzDbWVV1G0ZvMSwC
         r4rzgoltO4vrEKxaRihBK+trNsA/zyfJUBZLj7oDCectuQ6inZyUWfEm/ep2Yx+WWYLn
         gNmgt0jbNacDDILhdsethjhiLq7tF38oOyM/3cGMeOSXbYYl0yZBu749zQ8PQbnTUl5r
         p04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699322144; x=1699926944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGF1D4kBb4EE6sBccqC2cVMnkEZhNYxxKEWF7ImCF7A=;
        b=C7J29d79rs7UtVimS1sNimOozaDevgLbDkE1PJ6DvO1BSB1BwEsBF0s1CBB/xD5C+5
         dQz80jedLgnQcjAhiPrUTG515gNqfW6JqcHwChugZPD1KaUOqMGZMeEve/uKIvmS+amv
         QZZsf4y5T0YcrXhkCsoYE7ZKz9v6LsvTqqzMEUTNSUh4rn04JAX2aGZa0nESB4b7nNm2
         dCxQrkAsypDcYaPo+XGoCxk0Yc7hwseQ2+bWcMbaGQCLSXrf5k6ry8geuLlrFyYYTFJQ
         WyTSFVJL6fhiFHg4fPizVuOUxYza1IQWm0IDOVcdaQuuJpKx2EPu0kX9lpiu+duLAjMq
         LgQQ==
X-Gm-Message-State: AOJu0Yzo9f+slouPlRi8E67CwWcUY9wSgBsFbgPcqFCy+Mp5s2XLt83l
	xROPTJb2k/W6swFGgL08wTG+4wMuLW5rAAzi
X-Google-Smtp-Source: AGHT+IH8Bkwd8f9qhnVaSTjZX+cE7t1OxsatsTja8HonShfKeV0tBtFmIevCK6hcBAHBGC7DYPtgkw==
X-Received: by 2002:a05:620a:7e9:b0:775:a91c:80c2 with SMTP id k9-20020a05620a07e900b00775a91c80c2mr27734752qkk.73.1699322144174;
        Mon, 06 Nov 2023 17:55:44 -0800 (PST)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id bl12-20020a05620a1a8c00b0076f16e98851sm3795499qkb.102.2023.11.06.17.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 17:55:43 -0800 (PST)
Date: Tue, 7 Nov 2023 01:55:42 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: soumya.sambu@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH 1/1] kubernetes: Adjust
 patches to resolve error that occur with devtool
Message-ID: <ZUmZHuThmfjqR7XR@gmail.com>
References: <20231102130805.1285325-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102130805.1285325-1-soumya.sambu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Nov 2023 01:55:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8432

In message: [meta-virtualization][kirkstone][PATCH 1/1] kubernetes: Adjust patches to resolve error that occur with devtool
on 02/11/2023 Soumya via lists.yoctoproject.org wrote:

> From: Soumya Sambu <soumya.sambu@windriver.com>
> 
> Adjust patches and .bb to fix  below error which occurs with devtool modify command -
> 
> ERROR: Applying patch '0001-hack-lib-golang.sh-use-CC-from-environment.patch' on
> target directory
> CmdError('sh -c \'PATCHFILE="0001-hack-lib-golang.sh-use-CC-from-environment.patch"
> git -c user.name="OpenEmbedded" -c user.email="oe.patch@oe" commit -F /tmp/tmp_ptvioq3
> --author="Koen Kooi <koen.kooi@linaro.org>"
> --date="Mon, 23 Jul 2018 15:28:02 +0200"\'', 0, 'stdout: On branch devtool
> Changes not staged for commit:
>   (use "git add <file>..." to update what will be committed)
>   (use "git restore <file>..." to discard changes in working directory)
>   (commit or discard the untracked or modified content in submodules)
> \tmodified:   src/import (modified content)
> 
> no changes added to commit (use "git add" and/or "git commit -a")
> 
> stderr: ')

The long log should also explain the change, not just what it
fixes.

In particular, indicate that devtool insists on working out of
a specific directory (${S} ?), and that hwe have to adjust the
paths of our patches to that directory structure, and also update
the recipe patch listing to be able to still apply the changes
during a build.

Also, does master have the same issue ? if so, we need to fix
it there first.

> 
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  ...ed_files-Fix-race-issue-for-installi.patch | 20 +++++++++++--------
>  ...sh-convert-remaining-go-calls-to-use.patch | 18 +++++++++--------
>  ...1-cross-don-t-build-tests-by-default.patch | 12 ++++++-----
>  ...ib-golang.sh-use-CC-from-environment.patch | 14 ++++++++-----
>  .../kubernetes/kubernetes_git.bb              |  8 ++++----
>  5 files changed, 42 insertions(+), 30 deletions(-)
> 
> diff --git a/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.patch b/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.patch
> index 02bb5e91..e0ef04dc 100644
> --- a/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.patch
> +++ b/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.patch
> @@ -1,8 +1,8 @@
>  From 441df8a24a2c80e320f140b5d9bc352c7ce8a64a Mon Sep 17 00:00:00 2001
>  From: Robert Yang <liezhi.yang@windriver.com>
>  Date: Thu, 15 Oct 2020 07:27:35 +0000
> -Subject: [PATCH] src/import/build/root/Makefile.generated_files: Fix race issue for installing
> - go2make
> +Subject: [PATCH] src/import/build/root/Makefile.generated_files: Fix race
> + issue for installing go2make
>  
>  The src/import/build/root/Makefile.generated_files are called several times during the build, so the
>  following target which installs go2make will also run several times:
> @@ -24,15 +24,17 @@ problem.
>  Upstream-Status: Pending
>  
>  Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +
> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>

There's no need to add your Signed-Off-By here, there's no
changes in the the patch outside of context and line wrapping.

Same comment for all the patches that are being tweaked.

Cheers,

Bruce

>  ---
> - src/import/build/root/Makefile.generated_files | 4 +++-
> + build/root/Makefile.generated_files | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>  
> -Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/src/import/build/root/Makefile.generated_files
> -===================================================================
> ---- kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630.orig/src/import/build/root/Makefile.generated_files
> -+++ kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/src/import/build/root/Makefile.generated_files
> -@@ -67,7 +67,9 @@
> +diff --git a/build/root/Makefile.generated_files b/build/root/Makefile.generated_files
> +index d86a90cbb39..19a3d332476 100644
> +--- a/build/root/Makefile.generated_files
> ++++ b/build/root/Makefile.generated_files
> +@@ -67,7 +67,9 @@ $(META_DIR)/$(GO_PKGDEPS_FILE): FORCE
>   	if [[ "$(DBG_CODEGEN)" == 1 ]]; then          \
>   	    echo "DBG: calculating Go dependencies";  \
>   	fi
> @@ -43,3 +45,5 @@ Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/src/import
>   	hack/run-in-gopath.sh go2make                       \
>   	    k8s.io/kubernetes/...                           \
>   	    --prune  k8s.io/kubernetes/staging              \
> +--
> +2.40.0
> diff --git a/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch b/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch
> index 8adbafb3..39fdac54 100644
> --- a/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch
> +++ b/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch
> @@ -4,15 +4,17 @@ Date: Wed, 12 Aug 2020 16:01:49 +0000
>  Subject: [PATCH] build/golang.sh: convert remaining 'go' calls to use
>  
>  Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> +
> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
>  ---
>   hack/lib/golang.sh | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>  
> -diff --git a/src/import/hack/lib/golang.sh b/src/import/hack/lib/golang.sh
> -index e9148ec08fa..71d3c987563 100755
> ---- a/src/import/hack/lib/golang.sh
> -+++ b/src/import/hack/lib/golang.sh
> -@@ -651,7 +651,7 @@ kube::golang::build_some_binaries() {
> +diff --git a/hack/lib/golang.sh b/hack/lib/golang.sh
> +index d0f4b00dadf..cef0c2075a3 100755
> +--- a/hack/lib/golang.sh
> ++++ b/hack/lib/golang.sh
> +@@ -654,7 +654,7 @@ kube::golang::build_some_binaries() {
>           kube::golang::create_coverage_dummy_test "${package}"
>           kube::util::trap_add "kube::golang::delete_coverage_dummy_test \"${package}\"" EXIT
>   
> @@ -21,7 +23,7 @@ index e9148ec08fa..71d3c987563 100755
>             -covermode count \
>             -coverpkg k8s.io/...,k8s.io/kubernetes/vendor/k8s.io/... \
>             "${build_args[@]}" \
> -@@ -663,13 +663,13 @@ kube::golang::build_some_binaries() {
> +@@ -666,13 +666,13 @@ kube::golang::build_some_binaries() {
>       done
>       if [[ "${#uncovered[@]}" != 0 ]]; then
>         V=2 kube::log::info "Building ${uncovered[*]} without coverage..."
> @@ -37,7 +39,7 @@ index e9148ec08fa..71d3c987563 100755
>      fi
>   }
>   
> -@@ -725,7 +725,7 @@ kube::golang::build_binaries_for_platform() {
> +@@ -730,7 +730,7 @@ kube::golang::build_binaries_for_platform() {
>       testpkg=$(dirname "${test}")
>   
>       mkdir -p "$(dirname "${outfile}")"
> @@ -47,5 +49,5 @@ index e9148ec08fa..71d3c987563 100755
>         -gcflags "${gogcflags:-}" \
>         -asmflags "${goasmflags:-}" \
>  -- 
> -2.19.1
> +2.40.0
>  
> diff --git a/recipes-containers/kubernetes/kubernetes/0001-cross-don-t-build-tests-by-default.patch b/recipes-containers/kubernetes/kubernetes/0001-cross-don-t-build-tests-by-default.patch
> index 659e3013..26a9b726 100644
> --- a/recipes-containers/kubernetes/kubernetes/0001-cross-don-t-build-tests-by-default.patch
> +++ b/recipes-containers/kubernetes/kubernetes/0001-cross-don-t-build-tests-by-default.patch
> @@ -11,14 +11,16 @@ components without error. As such, we patch the targets out of the
>  script to allow a successful build.
>  
>  Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> +
> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
>  ---
>   hack/make-rules/cross.sh | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>  
> -diff --git a/src/import/hack/make-rules/cross.sh b/hack/make-rules/cross.sh
> -index 8e1e938..0898c5c 100755
> ---- a/src/import/hack/make-rules/cross.sh
> -+++ b/src/import/hack/make-rules/cross.sh
> +diff --git a/hack/make-rules/cross.sh b/hack/make-rules/cross.sh
> +index f8a6d0dbf5e..d22bf52b1cc 100755
> +--- a/hack/make-rules/cross.sh
> ++++ b/hack/make-rules/cross.sh
>  @@ -33,6 +33,6 @@ make all WHAT="${KUBE_NODE_TARGETS[*]}" KUBE_BUILD_PLATFORMS="${KUBE_NODE_PLATFO
>   
>   make all WHAT="${KUBE_CLIENT_TARGETS[*]}" KUBE_BUILD_PLATFORMS="${KUBE_CLIENT_PLATFORMS[*]}"
> @@ -29,5 +31,5 @@ index 8e1e938..0898c5c 100755
>  -make all WHAT="${KUBE_TEST_SERVER_TARGETS[*]}" KUBE_BUILD_PLATFORMS="${KUBE_TEST_SERVER_PLATFORMS[*]}"
>  +#make all WHAT="${KUBE_TEST_SERVER_TARGETS[*]}" KUBE_BUILD_PLATFORMS="${KUBE_TEST_SERVER_PLATFORMS[*]}"
>  -- 
> -2.7.4
> +2.40.0
>  
> diff --git a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
> index 3a22a2ef..d3b71aef 100644
> --- a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
> +++ b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
> @@ -7,15 +7,17 @@ Toolchain tupples differs, especially when using vendor provides ones.
>  
>  Upstream-status: Inappropriate [embedded specific]
>  Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> +
> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
>  ---
>   hack/lib/golang.sh | 4 ----
>   1 file changed, 4 deletions(-)
>  
> -Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/src/import/hack/lib/golang.sh
> -===================================================================
> ---- kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630.orig/src/import/hack/lib/golang.sh
> -+++ kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/src/import/hack/lib/golang.sh
> -@@ -414,19 +414,15 @@
> +diff --git a/hack/lib/golang.sh b/hack/lib/golang.sh
> +index e16a60d1867..d0f4b00dadf 100755
> +--- a/hack/lib/golang.sh
> ++++ b/hack/lib/golang.sh
> +@@ -420,19 +420,15 @@ kube::golang::set_platform_envs() {
>           ;;
>         "linux/arm")
>           export CGO_ENABLED=1
> @@ -35,3 +37,5 @@ Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/src/import
>           ;;
>       esac
>     fi
> +--
> +2.40.0
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index f475bd73..59892c92 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -26,10 +26,10 @@ SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.23;name=k
>             git://github.com/kubernetes/release;branch=master;name=kubernetes-release;destsuffix=git/release;protocol=https"
>  
>  SRC_URI:append = " \
> -           file://0001-hack-lib-golang.sh-use-CC-from-environment.patch \
> -           file://0001-cross-don-t-build-tests-by-default.patch \
> -           file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch \
> -           file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch \
> +           file://0001-hack-lib-golang.sh-use-CC-from-environment.patch;patchdir=src/import \
> +           file://0001-cross-don-t-build-tests-by-default.patch;patchdir=src/import \
> +           file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch;patchdir=src/import \
> +           file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch;patchdir=src/import \
>             file://cni-containerd-net.conflist \
>             file://k8s-init \
>             file://99-kubernetes.conf \
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8410): https://lists.yoctoproject.org/g/meta-virtualization/message/8410
> Mute This Topic: https://lists.yoctoproject.org/mt/102341396/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


