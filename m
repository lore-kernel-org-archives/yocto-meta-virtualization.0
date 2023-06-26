Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525B8EB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 07:12:52 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web11.2544.1687763568201384271
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Jun 2023 00:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=UzuqiRrF;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-780d1c179e2so152983439f.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Jun 2023 00:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687763567; x=1690355567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYKm6DpcqswHY1mA6CNFhjLQczC0DiX/OEUjetGNgSo=;
        b=UzuqiRrFs7MrH1428OGqrNbtYrejjJxNi/tkaZhd4QLiv+c0c9suPuKriBNR/csHJE
         fDJmk8JxYtraCqw09bGRB77h777UJ7CofnHtRcxhpI/7VoSd1ZzW+z9HpmYsqdqOmc0q
         6KW7bxTooDmodNHFIiY7b+qovJsITYrvOGgbYIOie/GS03MOcD208GVDzsfs+uMPywfT
         Lzg6Er9+QHm5Qs86t6BSEs9auNPwNj/vx6Am+1gz2qJR9/Ejj30WVKwjBFKBCr3Dk+Qz
         /zGBaT/9iuKLSir3wUEzlHci1TSldnqHAYauMqG9dyHhkSChJakzWzzeKKzcEAbWHdQV
         pkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687763567; x=1690355567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rYKm6DpcqswHY1mA6CNFhjLQczC0DiX/OEUjetGNgSo=;
        b=HBiRbkJ2MkICQ59Pxp7FAjPTKV0vw0xNFnDMXc9w2flq+QNnJWOnK45Kcx5qpw28fE
         XU9MkSSaa/t3hrwpD3OeJzsiyIvwQPxORF3y4mI+Ka1L+PYHD0LfjrVcRQ46GbHWYJOb
         NpzZT0EtbMHGGIyt0G64y7JKD9aJ1RinCuljklK99UF5t76+02QMmwYTtoN9VbfNOdmf
         hWsgDiS8KgRCUbnsAD4HTdFK+sK30bNnSiGJ+C8OwKghi4xrVsxk870HQQVVGDUC/EFd
         PFq8BNc+EvXEAmlIulscENmUWUMzqddQOqoE152vsYM5iX9cVmv4dLOYzbMcOgxvNupM
         7Xtw==
X-Gm-Message-State: AC+VfDwrcSDwJEnK3/bUtXhFptnJcuvs+k1C8+r7Q0PrqIU8a4YAimZz
	I0bHk07fFd7XEK7P7S74EXB8oRA/ZxEOh2BCUIbinGd8sC8Onw==
X-Google-Smtp-Source: ACHHUZ78+e5CGKtB9IJ0goBn+08FpAja+mOxWc7bBeL2oAzqwB/23PDjuqnOY7h6VZOyllS+rxCC2ygpUls6bGAMlLE=
X-Received: by 2002:a92:da83:0:b0:341:da26:d2f4 with SMTP id
 u3-20020a92da83000000b00341da26d2f4mr29315779iln.23.1687763567142; Mon, 26
 Jun 2023 00:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230626064420.1012760-1-Qi.Chen@windriver.com> <20230626064420.1012760-2-Qi.Chen@windriver.com>
In-Reply-To: <20230626064420.1012760-2-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 26 Jun 2023 03:12:35 -0400
Message-ID: <CADkTA4OwvJUG_d1A-bjzHcf6Lgz_tygs+uZ7RHnyhtQ+_4uBGw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] meta-virt: rename
 containerd-opencontainers to containerd
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Jun 2023 07:12:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8107

On Mon, Jun 26, 2023 at 2:44=E2=80=AFAM Chen Qi via lists.yoctoproject.org
<Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> We had two containerd recipes, containerd-opencontainers and
> containerd-docker. But now we have only one containerd recipe.
> We should just use the name 'containerd'.

We could, but there's also no pressing need to change it (otherwise, I
would have).

I'll leave this as-is, since there are actually some layers with
includes that I don't feel the need to break at the moment.

Bruce

>
> The previous CVE_PRODUCT setting in containerd-opencontainers
> is deleted, as it's no longer needed.
>
> The 'containerd-opencontainers' is added in PROVIDES and RPROVIDES
> for backward compatibility.
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
> index 9ff61f1..cbd75f5 100644
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
> index c804caa..ab41a6c 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd_git.bb
> @@ -20,8 +20,8 @@ CVE_VERSION =3D "v1.7.1"
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
> @@ -99,5 +99,3 @@ INSANE_SKIP:${PN} +=3D "ldflags already-stripped"
>  COMPATIBLE_HOST =3D "^(?!(qemu)?mips).*"
>
>  RDEPENDS:${BPN} +=3D " ${VIRTUAL-RUNTIME_container_runtime}"
> -
> -CVE_PRODUCT =3D "containerd"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8106): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8106
> Mute This Topic: https://lists.yoctoproject.org/mt/99782881/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

