Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8461FC636D6
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 20:50:25 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web11.5853.1676667023259994412
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Feb 2023 12:50:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KFKAA48I;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id bx7so981044iob.8
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 12:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j0AnskygfvcV2Jj8vZdGRLsCRmiQYE27qmtbsJqSdSA=;
        b=KFKAA48I2RaMxagqtjQn68zZMIDdOQZ/pCJ1cRx1I8JQXMgV5JB65WX7iATr1ig8/v
         Y0BPCc1F27q8qqtsFvJ/P2ZZpxE2eplbR+rLa+ow8RKDoZCKBqjY57/irxU4YqXnVjwo
         vqO8Dq1dUhgaTVkBoGAQAZPxClzYTZ03J/yimrJErZYpnmsplasJ9Rxv15fCGvrrctzS
         nTejuwMlyjhBcQlwrEMTqxh/WBovIMxgrKJriFRTwVQjzoo9xKGVWi62eMN8AGQoil+4
         tZy8wBts+Y+/aXabq6retDQ26/P4Q/UkokpqPv0nxaFs2J8pNKt4Q6AvH31ojQNxlagG
         ThJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0AnskygfvcV2Jj8vZdGRLsCRmiQYE27qmtbsJqSdSA=;
        b=NTXFAsd3BuHgdP1CSXV1nbIpMKOTssewnWpRziesvBEddzrOcIIhG2fb7hikI+g4lE
         MWq5eGafabrjvchnLSIrAF7rDMctqIfg+ruvUrv6u/tyktJS1v8kLoiqqILAjBKMM3wu
         yW4NJLQ9RNf8yFbwIjc8cMNQxyCbMkP2MGd9ejVZbGtBb+ogUydwvJ6p2v4xNoEH/gOh
         Y4CUN1HxuLpXqi/VS+VvPUfoLJ2DXtlOmXxWHunNpKXnOTKCgrRLtHKsGrKsGqv3X7HT
         YiCK6jVBTPVKIuXUW3hTDycfCUYcMD45H3XFU5g0waKnazE50gvdvVwx7/gPPAGDMHJh
         9w9Q==
X-Gm-Message-State: AO0yUKXU4RcLMaBoAS4d3Vo7ExbY84e42IXiDBMdrNlo1BVfNPyKdNFr
	uwQW/mIRwxEh6F7pBXS75mA2DyzMuaH3LaRiWr4=
X-Google-Smtp-Source: AK7set+amk38mOxX0eUbDxAbxOAeiJJbs+tSc8LmOkQsqJWcDwKJakK4dy7HLjLjFd78Q9vgCYyJQj2yYY7Kk4ob62c=
X-Received: by 2002:a5d:8254:0:b0:71c:1bd4:b768 with SMTP id
 n20-20020a5d8254000000b0071c1bd4b768mr3276401ioo.84.1676667022458; Fri, 17
 Feb 2023 12:50:22 -0800 (PST)
MIME-Version: 1.0
References: <20230217183010.3427667-1-Martin.Jansa@gmail.com>
In-Reply-To: <20230217183010.3427667-1-Martin.Jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 17 Feb 2023 15:50:11 -0500
Message-ID: <CADkTA4M1NqDiB+Z9yicpQmvAXpDAXss2uZ9=3-fro0f74JeRxQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker-*: prevent -march being
 exported in arm builds
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 20:50:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7880

On Fri, Feb 17, 2023 at 1:30 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> * don't export CGO_CFLAGS/CGO_CXXFLAGS like the previous version
>   didn't before:
>   https://git.yoctoproject.org/meta-virtualization/commit/?id=aceed7bf95cc8a42c8f470d8edf3c6f03d49da00
>
> * both docker-moby and docker-ce have the same issue as shown with
>   qemuarm build:
>   docker-moby: http://errors.yoctoproject.org/Errors/Details/690021/
>   docker-ce: http://errors.yoctoproject.org/Errors/Details/690020/
>

Thanks for the change .. not a trivial fixup, and thanks for all the
logging of the reasons.

My testing passed as well, so this is now on master-next.

Bruce


> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-containers/docker/docker-ce_git.bb    |   2 +-
>  recipes-containers/docker/docker-moby_git.bb  |   2 +-
>  ...0001-dynbinary-use-go-cross-compiler.patch | 104 ++++++++++++++++--
>  3 files changed, 97 insertions(+), 11 deletions(-)
>
> diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
> index 0f43da6..b9888d2 100644
> --- a/recipes-containers/docker/docker-ce_git.bb
> +++ b/recipes-containers/docker/docker-ce_git.bb
> @@ -41,7 +41,7 @@ SRC_URI = "\
>         git://github.com/docker/cli;branch=23.0;name=cli;destsuffix=git/cli;protocol=https \
>         file://0001-libnetwork-use-GO-instead-of-go.patch \
>         file://docker.init \
> -        file://0001-dynbinary-use-go-cross-compiler.patch \
> +        file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
>          file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
>         "
>
> diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
> index 19f4763..17cd316 100644
> --- a/recipes-containers/docker/docker-moby_git.bb
> +++ b/recipes-containers/docker/docker-moby_git.bb
> @@ -45,7 +45,7 @@ SRC_URI = "\
>         file://docker.init \
>         file://0001-libnetwork-use-GO-instead-of-go.patch \
>          file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
> -        file://0001-dynbinary-use-go-cross-compiler.patch \
> +        file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
>         "
>
>  DOCKER_COMMIT = "${SRCREV_moby}"
> diff --git a/recipes-containers/docker/files/0001-dynbinary-use-go-cross-compiler.patch b/recipes-containers/docker/files/0001-dynbinary-use-go-cross-compiler.patch
> index c10e69d..ea8f4c5 100644
> --- a/recipes-containers/docker/files/0001-dynbinary-use-go-cross-compiler.patch
> +++ b/recipes-containers/docker/files/0001-dynbinary-use-go-cross-compiler.patch
> @@ -1,20 +1,106 @@
> -From bbf600cc4d46c3f7ec0c1b486790a2402d41f550 Mon Sep 17 00:00:00 2001
> +From 3ce6089417b8c6c4e8279e6ef60213436ebf8793 Mon Sep 17 00:00:00 2001
>  From: Bruce Ashfield <bruce.ashfield@gmail.com>
>  Date: Tue, 30 Jun 2020 22:23:33 -0400
>  Subject: [PATCH] dynbinary: use go cross compiler
>
> +MJ: use ${GO} also in "go env" calls, because native go:
> +  $ go env GOARM
> +  5
> +while go cross compiler for my target:
> +  $ ${GO} env GOARM
> +  7
> +this can lead to:
> +  error: switch '-mcpu=cortex-a9' conflicts with switch '-march=armv5t' [-Werror]
> +
> +but even after fixing it to use "better" -march it still doesn't match with -mcpu
> +set in our GOBUILDFLAGS, causing e.g.:
> +  error: switch '-mcpu=cortex-a9' conflicts with switch '-march=armv7-a+simd' [-Werror]
> +
> +so drop CGO_CFLAGS/CGO_CXXFLAGS as in OE builds we don't need them
> +as long as ${GO} and GOBUILDFLAGS are respected
> +
> +it was added in:
> +https://github.com/moby/moby/commit/12558c8d6ea9f388b54eb94ba6b9eb4a9fc5c9f2
> +
> +and it wasn't an issue before:
> +https://github.com/moby/moby/commit/8c12a6648b368cc2acaea0339d6c57c920ed265c
> +
> +because it was using 'case "${GOARM}" in' and ${GOARM} was empty in our builds
> +
>  Upstream-Status: Inappropriate [embedded specific]
>
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>  Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>  ---
> - hack/make/.binary | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -Index: git/src/import/hack/make/.binary
> -===================================================================
> ---- git.orig/src/import/hack/make/.binary
> -+++ git/src/import/hack/make/.binary
> -@@ -66,7 +66,7 @@
> + hack/make/.binary | 37 ++++++++-----------------------------
> + 1 file changed, 8 insertions(+), 29 deletions(-)
> +
> +diff --git a/hack/make/.binary b/hack/make/.binary
> +index 39c00cd50c..de32ad1cc7 100644
> +--- a/hack/make/.binary
> ++++ b/hack/make/.binary
> +@@ -3,7 +3,7 @@ set -e
> +
> + # a helper to provide ".exe" when it's appropriate
> + binary_extension() {
> +-      if [ "$(go env GOOS)" = 'windows' ]; then
> ++      if [ "$(${GO} env GOOS)" = 'windows' ]; then
> +               echo -n '.exe'
> +       fi
> + }
> +@@ -16,33 +16,12 @@ source "${MAKEDIR}/.go-autogen"
> + (
> +       export GOGC=${DOCKER_BUILD_GOGC:-1000}
> +
> +-      if [ "$(go env GOOS)/$(go env GOARCH)" != "$(go env GOHOSTOS)/$(go env GOHOSTARCH)" ]; then
> +-              # must be cross-compiling!
> +-              if [ "$(go env GOOS)/$(go env GOARCH)" = "linux/arm" ]; then
> +-                      # specify name of the target ARM architecture
> +-                      case "$(go env GOARM)" in
> +-                              5)
> +-                                      export CGO_CFLAGS="-march=armv5t"
> +-                                      export CGO_CXXFLAGS="-march=armv5t"
> +-                                      ;;
> +-                              6)
> +-                                      export CGO_CFLAGS="-march=armv6"
> +-                                      export CGO_CXXFLAGS="-march=armv6"
> +-                                      ;;
> +-                              7)
> +-                                      export CGO_CFLAGS="-march=armv7-a"
> +-                                      export CGO_CXXFLAGS="-march=armv7-a"
> +-                                      ;;
> +-                      esac
> +-              fi
> +-      fi
> +-
> +       # -buildmode=pie is not supported on Windows arm64 and Linux mips*, ppc64be
> +       # https://github.com/golang/go/blob/go1.19.4/src/cmd/internal/sys/supported.go#L125-L132
> +       if ! [ "$DOCKER_STATIC" = "1" ]; then
> +               # -buildmode=pie not supported when -race is enabled
> +               if [[ " $BUILDFLAGS " != *" -race "* ]]; then
> +-                      case "$(go env GOOS)/$(go env GOARCH)" in
> ++                      case "$(${GO} env GOOS)/$(${GO} env GOARCH)" in
> +                               windows/arm64 | linux/mips* | linux/ppc64) ;;
> +                               *)
> +                                       BUILDFLAGS+=("-buildmode=pie")
> +@@ -54,11 +33,11 @@ source "${MAKEDIR}/.go-autogen"
> +       # only necessary for non-sandboxed invocation where TARGETPLATFORM is empty
> +       PLATFORM_NAME=$TARGETPLATFORM
> +       if [ -z "$PLATFORM_NAME" ]; then
> +-              PLATFORM_NAME="$(go env GOOS)/$(go env GOARCH)"
> +-              if [ -n "$(go env GOARM)" ]; then
> +-                      PLATFORM_NAME+="/v$(go env GOARM)"
> +-              elif [ -n "$(go env GOAMD64)" ] && [ "$(go env GOAMD64)" != "v1" ]; then
> +-                      PLATFORM_NAME+="/$(go env GOAMD64)"
> ++              PLATFORM_NAME="$(${GO} env GOOS)/$(${GO} env GOARCH)"
> ++              if [ -n "$(${GO} env GOARM)" ]; then
> ++                      PLATFORM_NAME+="/v$(${GO} env GOARM)"
> ++              elif [ -n "$(${GO} env GOAMD64)" ] && [ "$(${GO} env GOAMD64)" != "v1" ]; then
> ++                      PLATFORM_NAME+="/$(${GO} env GOAMD64)"
> +               fi
> +       fi
> +
> +@@ -66,7 +45,7 @@ source "${MAKEDIR}/.go-autogen"
>         if [ -n "$DOCKER_DEBUG" ]; then
>                 set -x
>         fi
> --
> 2.39.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7878): https://lists.yoctoproject.org/g/meta-virtualization/message/7878
> Mute This Topic: https://lists.yoctoproject.org/mt/97034605/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

