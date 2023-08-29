Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C46C83F15
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 02:02:07 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.8804.1693274523346638650
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 19:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=JuggoJ4e;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-58d70c441d5so47894827b3.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Aug 2023 19:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693274522; x=1693879322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6eVZcFibW0zsEP5XsvB8JnW6orNsVgGibaiewKz60s=;
        b=JuggoJ4eF4ZMwJeJJ+D1mtHuwMwmTsZGa5va2WdtBgVLXGOR0ZISyAusrAsW1Nlkjg
         jkmuZjwvCZNivU/o5of/+kT8rIuqtNXJ/H2qzZ4Z+DM9E5qVBbybbHW6GTO1lA9Uf7a2
         2kb6UmHLkhqwbv1uCSCFaR8CZXA3H49HBHSBGkJAqF+pws7GB8I34MgHhzjvOCP/Uulw
         JcJX7lPiLkYDqxIAqCp5YwYHLooZQQtiKkUGJGs056jsRmbrbMcw+fXvc9Ry2o0X6HFF
         8kzr7WrXi0k4yM0ScWpgPA2xF0D4XKFLZobCq3Ym0ld8fgfw1AEUBdnIpKOfSzIAXQ4Z
         DThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693274522; x=1693879322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6eVZcFibW0zsEP5XsvB8JnW6orNsVgGibaiewKz60s=;
        b=kaCpA2Pg+ZwBffSzwU5AhryFoGEOYiyWqqvVA6A1M6Na3TeDDRhgiGuxz5MSXZ6iAW
         ggNbms36311IMzR+blriMozIzJ9En2meTVaY/OOdfunc14pbIi0pqf7XIoA7Bi6tAxKs
         znM9TZqx8cmb6lEPWXoNizhUMV/dzDDAifZUw0s06GeyDJIClJ/uaKnghKJ92UXGlwTU
         cu/j9hSBghMjDkm91cB/PVDLIEIg14ajmCq/WhhMpFWQKCQMAp+3ZCBUhEjm3ME47HTf
         oCIOsQsBxxK3lA9FBW7IfJ57NBFQTkUvbxrlnsmoaQJ19G47NblGBEk+IlOEfdq+q2OD
         rsWQ==
X-Gm-Message-State: AOJu0Yx0rloTYjEjtSFW2I1HR/+fBEP6Nrt4DydLeouZTKFIKN5h7nPS
	jgTCIPNLLZ2Jhf3hzihRETrj+WdTjBzfbHwndyioWsT8G7A=
X-Google-Smtp-Source: AGHT+IFWlkjAzFX0Pv9BlzgfszsQ/MU/rSzuiXBPjb7E8QeGD/tiUoHkvvngSEsvZZQt+qR7CPO5rByTiK36n3X1IsI=
X-Received: by 2002:a25:ae10:0:b0:d77:e7c1:5537 with SMTP id
 a16-20020a25ae10000000b00d77e7c15537mr15460227ybj.18.1693274522354; Mon, 28
 Aug 2023 19:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230828125619.3221366-1-narpat.mali@windriver.com>
In-Reply-To: <20230828125619.3221366-1-narpat.mali@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 28 Aug 2023 22:01:51 -0400
Message-ID: <CADkTA4NJtH4wDPenc3p47Q5b0F7smPas3TPmpBRq0MtG_h6UWg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/1] docker-distribution: upgrade to 2.8.2
To: narpat.mali@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Aug 2023 02:02:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8256

master-next already has a bump to 2.8.2

https://git.yoctoproject.org/meta-virtualization/commit/?h=3Dmaster-next&id=
=3D06e6947fc93285b403419ee1e56f2ca79d7c5c1a

Bruce

On Mon, Aug 28, 2023 at 8:56=E2=80=AFAM Narpat Mali via lists.yoctoproject.=
org
<narpat.mali=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
> From: Narpat Mali <narpat.mali@windriver.com>
>
> Changelog:
> https://github.com/distribution/distribution/releases
>
> - Revert registry/client: set Accept: identity header when getting layers=
 by @ndeloof in #3783
> - Parse http forbidden as denied by @vvoland in #3914
> - Fix CVE-2022-28391 by bumping alpine from 3.14 to 3.16 by @thaJeztah (#=
3650)
> - Fix CVE-2023-2253 runaway allocation on /v2/_catalog by @josegomezr 521=
ea3d9
> - Fix panic in inmemory driver by @wy65701436 in #3815
> - bump up golang version (alternative) by @thaJeztah in #3903
> - Dockerfile: update xx to v1.2.1 by @thaJeztah in #3907
> - update to go1.19.9 by @thaJeztah in #3908
> - Add code to handle pagination of parts. Fixes max layer size of 10GB bu=
g by @DavidSpek in #3893
> - Dockerfile: fix filenames of artifacts by @thaJeztah in #3911
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>  .../docker-distribution/docker-distribution_git.bb            | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/docker-distribution/docker-distribution_g=
it.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
> index d05d0131..1aad06dc 100644
> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
> @@ -3,7 +3,7 @@ SUMMARY =3D "The Docker toolset to pack, ship, store, and=
 deliver content"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd2794c0df5b907fdace235a619d80=
314"
>
> -SRCREV_distribution=3D "dc5b207fdd294c57dfef59017df60088b27d2668"
> +SRCREV_distribution=3D "7c354a4b40feeea21d7eeae4de91c8ff7951e672"
>  SRC_URI =3D "git://github.com/docker/distribution.git;branch=3Drelease/2=
.8;name=3Ddistribution;destsuffix=3Dgit/src/github.com/docker/distribution;=
protocol=3Dhttps \
>             file://docker-registry.service \
>             file://0001-build-use-to-use-cross-go-compiler.patch \
> @@ -11,7 +11,7 @@ SRC_URI =3D "git://github.com/docker/distribution.git;b=
ranch=3Drelease/2.8;name=3Ddist
>
>  PACKAGES =3D+ "docker-registry"
>
> -PV =3D "v2.8.1+git${SRCPV}"
> +PV =3D "v2.8.2+git${SRCPV}"
>  S =3D "${WORKDIR}/git/src/github.com/docker/distribution"
>
>  GO_IMPORT =3D "import"
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8246): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8246
> Mute This Topic: https://lists.yoctoproject.org/mt/101009252/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

