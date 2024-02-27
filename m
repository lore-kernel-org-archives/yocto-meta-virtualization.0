Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DCBC54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 13:46:01 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.12327.1709041558285396880
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 05:45:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DmES469E;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-60925d20af0so7589627b3.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Feb 2024 05:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709041557; x=1709646357; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaPETsCubgL/CijzP+Js/Lb5VJ5QFc5MkSvq6+HcXvM=;
        b=DmES469EMPjyH3MMIPqwnERN5nkvuWLPMta1JQmUOLJpD5S1c346ilqRLJ2uxfqm09
         QLcSh6hiAYzr+nJhjMSje3WZmatouXRG8PItSQBsIgpkIfkbTSjG59UoIAgUvH3hc6Nv
         69SCku75GDWc/2An2QcLBo3gJvtXZFB3BwcBSK1N5crM2D58C4EiZZSc0sg8Dc18vzR+
         IfZogYAxjseQLiHX6DQZ49nyPzQIldkyA2dejblq6ggcHqls0ZvRl8pBfHC0Zc4qcs6z
         JCBvHM2VhPixO5+tBgzRFiojU2X07mAxnhsybnnlazyYOY0GGPdY7pJ6+zOPMcPB6I5P
         ty2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709041557; x=1709646357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaPETsCubgL/CijzP+Js/Lb5VJ5QFc5MkSvq6+HcXvM=;
        b=CQw8UeZAOVRSBMyC1uor7zTWvGUjiI6YbEnRQIw9PrcdAhp9peiPxuZXGJINKy58ly
         KIYxMdzgawB48oM7kOWqcmUPKClSFgYpH9HHxiKn7XRlPO4HAOz3HzkKMukD5y+f5xtr
         ePzjtI/qfLTaSa0hPLVbs+Vbr4G1CZQqUbgYOA07ag+j/CdS3KWKe/wjjhQkmaEt0EzK
         3gbg5qtc9Gg7+E92FOMvmA5dAbOV6HUtmcZ+05Udfh7BeJ4djZshcVFgUgRNqjVNPwX9
         TIU6YnAxIti/MnHSsog25P3iljX84ouinJ2+F9oZXuAmamSlVaTN7xpgARMAOMe/Nt4y
         CB4g==
X-Gm-Message-State: AOJu0YyXYu+FM1rWstWwryFMLU+5aZPl/HYJpstzEDtm6mteooZjPGCy
	bGmsqpU8y1jonLyQx4OGzW6/lAe28NyHb+OpJgDA6mwpv+WbbwGy24jOMzUTsgJ/uApzJBb9f0X
	vzBGaP4lFmLo9oEHEMCGkWFf55ts=
X-Google-Smtp-Source: AGHT+IHGcUTITUj6jcDaIFQPuTvFDYGSE4uhoD32j/yOwtoNtEyhvS1SUulsurnjl7t31F4WbkQEOdV90NpuqXwMGOw=
X-Received: by 2002:a0d:e892:0:b0:608:b725:b2da with SMTP id
 r140-20020a0de892000000b00608b725b2damr2140283ywe.5.1709041557017; Tue, 27
 Feb 2024 05:45:57 -0800 (PST)
MIME-Version: 1.0
References: <20240227051211.3390256-1-Qi.Chen@windriver.com> <20240227051211.3390256-4-Qi.Chen@windriver.com>
In-Reply-To: <20240227051211.3390256-4-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Feb 2024 08:45:45 -0500
Message-ID: <CADkTA4NNKkrF3dn2DfJYRUPpRxuNk_KpzpBNo7qcHz6aZxcO2Q@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 4/4] meta-virt: rename
 containerd-opencontainers to containerd
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Feb 2024 13:46:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8588

On Tue, Feb 27, 2024 at 12:12=E2=80=AFAM Chen Qi via lists.yoctoproject.org
<Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> We had two containerd recipes, containerd-opencontainers and
> containerd-docker. But now we have only one containerd recipe.
> We should just use the name 'containerd'.
>
> The previous CVE_PRODUCT setting in containerd-opencontainers
> is deleted, as it's no longer needed.
>
> The 'containerd-opencontainers' is added in PROVIDES and RPROVIDES
> for backward compatibility.

As previously mentioned, I'm going to keep this as-is for now.

Cheers,

Bruce

>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  conf/layer.conf                                             | 2 +-
>  ...kefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch | 0
>  .../0001-build-don-t-use-gcflags-to-define-trimpath.patch   | 0
>  .../{containerd-opencontainers_git.bb =3D> containerd_git.bb} | 6 ++----
>  4 files changed, 3 insertions(+), 5 deletions(-)
>  rename recipes-containers/containerd/{containerd-opencontainers =3D> con=
tainerd}/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch (1=
00%)
>  rename recipes-containers/containerd/{containerd-opencontainers =3D> con=
tainerd}/0001-build-don-t-use-gcflags-to-define-trimpath.patch (100%)
>  rename recipes-containers/containerd/{containerd-opencontainers_git.bb =
=3D> containerd_git.bb} (96%)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index c44d585c..fa9468f3 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -40,7 +40,7 @@ LAYERRECOMMENDS_virtualization-layer =3D " \
>  require conf/distro/include/virt_security_flags.inc
>
>  PREFERRED_PROVIDER_virtual/runc ?=3D "runc-opencontainers"
> -PREFERRED_PROVIDER_virtual/containerd ?=3D "containerd-opencontainers"
> +PREFERRED_PROVIDER_virtual/containerd ?=3D "containerd"
>  PREFERRED_PROVIDER_virtual/docker ?=3D "docker-moby"
>
>  # Sanity check for meta-virtualization layer.
> diff --git a/recipes-containers/containerd/containerd-opencontainers/0001=
-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch b/recipes-conta=
iners/containerd/containerd/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-extern=
ally-speci.patch
> similarity index 100%
> rename from recipes-containers/containerd/containerd-opencontainers/0001-=
Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch
> rename to recipes-containers/containerd/containerd/0001-Makefile-allow-GO=
_BUILD_FLAGS-to-be-externally-speci.patch
> diff --git a/recipes-containers/containerd/containerd-opencontainers/0001=
-build-don-t-use-gcflags-to-define-trimpath.patch b/recipes-containers/cont=
ainerd/containerd/0001-build-don-t-use-gcflags-to-define-trimpath.patch
> similarity index 100%
> rename from recipes-containers/containerd/containerd-opencontainers/0001-=
build-don-t-use-gcflags-to-define-trimpath.patch
> rename to recipes-containers/containerd/containerd/0001-build-don-t-use-g=
cflags-to-define-trimpath.patch
> diff --git a/recipes-containers/containerd/containerd-opencontainers_git.=
bb b/recipes-containers/containerd/containerd_git.bb
> similarity index 96%
> rename from recipes-containers/containerd/containerd-opencontainers_git.b=
b
> rename to recipes-containers/containerd/containerd_git.bb
> index 1dadf287..ac874397 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd_git.bb
> @@ -20,8 +20,8 @@ CVE_VERSION =3D "v2.0.0-beta.0"
>
>  # EXTRA_OEMAKE +=3D "GODEBUG=3D1"
>
> -PROVIDES +=3D "virtual/containerd"
> -RPROVIDES:${PN} =3D "virtual-containerd"
> +PROVIDES +=3D "virtual/containerd containerd-opencontainers"
> +RPROVIDES:${PN} =3D "virtual-containerd containerd-opencontainers"
>
>  S =3D "${WORKDIR}/git/src/github.com/containerd/containerd"
>
> @@ -96,5 +96,3 @@ INSANE_SKIP:${PN} +=3D "ldflags already-stripped"
>  COMPATIBLE_HOST =3D "^(?!(qemu)?mips).*"
>
>  RDEPENDS:${PN} +=3D " ${VIRTUAL-RUNTIME_container_runtime}"
> -
> -CVE_PRODUCT =3D "containerd"
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8585): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8585
> Mute This Topic: https://lists.yoctoproject.org/mt/104598179/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

