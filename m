Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5ACDC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 13:35:43 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.8282.1702301736678566468
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 05:35:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HLgZSlPw;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7b435966249so205067639f.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 05:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702301736; x=1702906536; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMkNoTW5aSwFRcKrIFDF5g3+vjp9Bi6K4RaGqeNv5Gc=;
        b=HLgZSlPwxO9LKqReWbaO26UJKSw4vgzrkn2JUw56X8rRMkEeuK4qedEGx/L7LiK+qK
         ctFgeLSf5g/cfjNAjc3Bo7nbCMJ2XwUOVN3MHeb/NabWXlKhWNzKoQc04dciwgP1ErRR
         ZYoI1k0do6lUxqqQskXBXt2SR7XXLypBjpTpexGivIaUBIH2gfwTB95R9zoukmdLaUXo
         AbpoJu0elvi6x+Qpd9fHrhUQn+QqwHju3REV98PICfdCgHZ32shdkQ0YvbnGVwY1Fjm7
         OVUb58mtMY8IKAa0Fwbbj4Yrv8zvc8xQMgahRq45whpm2r6a4LtX0FkwYdV+qTeFnJoC
         Baig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702301736; x=1702906536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMkNoTW5aSwFRcKrIFDF5g3+vjp9Bi6K4RaGqeNv5Gc=;
        b=vuM7kYsDmkngjNb2E4ekhS3J4Zp/TWTKAODk8stSaSIJvtV+JAWrup3ROUtFoAFri6
         jSP8J/m9/MMcqrd33YCUQyqr6n/ioD/mTjLfqOSew76duc8tIcdyaSjwemP438OFyjpH
         4DMMN9QfMQ1yurqaFT7chv3Prc7Gb0z82dP4j/sgebOX6hdBP3Oaighfp38a6Q/qo6xN
         9+jGBMCipjmwH6jD3sn3Ya4YzG0W1YyQIETg9CwJVXOxks+Urccngdgn3FkrL8tGsZHx
         qbN6bGmy7bfQpIJ3k1AE7HDQskHJhkfQQqyxXWec0GQjBJ3p2ObrPC5eS4quEuD05V1B
         tH2Q==
X-Gm-Message-State: AOJu0YxcNIbzKt1BPv+EVj84q/KUvquECv48pLrH1PXj7M66eyJFmnTH
	jnZDVO4Bg28bpnCM6Hq2CVk2FTbCRIJeLi2sx58=
X-Google-Smtp-Source: AGHT+IHv2TOqkiNqdsh/k7JK07pW3dcFwSBa3/4BPjxjriLaxdBT0bwvrtip6ZdC2bbl/HMKAUHN+oHDALnrnm4rkV0=
X-Received: by 2002:a05:6602:4a81:b0:7b4:28f8:2bf6 with SMTP id
 ej1-20020a0566024a8100b007b428f82bf6mr4507775iob.31.1702301735702; Mon, 11
 Dec 2023 05:35:35 -0800 (PST)
MIME-Version: 1.0
References: <20231211120914.1631095-1-liu.ming50@gmail.com> <20231211120914.1631095-3-liu.ming50@gmail.com>
In-Reply-To: <20231211120914.1631095-3-liu.ming50@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Dec 2023 08:35:24 -0500
Message-ID: <CADkTA4N3qHZAULhP_=C7LhBnnYpTBCF7PctQdDRq4SKqxVR_MQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 2/2] podman: add alternative link
 for docker
To: Ming Liu <liu.ming50@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 13:35:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8501

I'm going to keep these as rconflicts.

There's simply no compelling reason to have both installed at the same time=
.

And the alternatives and the links they create are simply complexity
we don't need.

Bruce

On Mon, Dec 11, 2023 at 7:09=E2=80=AFAM Ming Liu <liu.ming50@gmail.com> wro=
te:
>
> From: Ming Liu <liu.ming50@gmail.com>
>
> Add alternative link for docker when 'docker' pkgconfig is enabled,
> this allows it could be installed together with docker-cli package.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  recipes-containers/podman/podman_git.bb | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers=
/podman/podman_git.bb
> index 7634ac85..e021dcd4 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -63,11 +63,16 @@ EXTRA_OEMAKE =3D " \
>       SYSTEMDDIR=3D${systemd_unitdir}/system USERSYSTEMDDIR=3D${systemd_u=
nitdir}/user \
>  "
>
> -# remove 'docker' from the packageconfig if you don't want podman to
> -# build and install the docker wrapper. If docker is enabled in the
> -# packageconfig, the podman package will rconfict with docker.
>  PACKAGECONFIG ?=3D "docker"
>
> +UPDATE_ALTERNATIVES_BBCLASS =3D "${@bb.utils.contains('PACKAGECONFIG', '=
docker', 'update-alternatives', '', d)}"
> +
> +inherit ${UPDATE_ALTERNATIVES_BBCLASS}
> +
> +ALTERNATIVE_PRIORITY =3D "50"
> +ALTERNATIVE:${PN} =3D "docker"
> +ALTERNATIVE_LINK_NAME[docker] =3D "${bindir}/docker"
> +
>  do_compile() {
>         cd ${S}/src
>         rm -rf .gopath
> @@ -151,7 +156,6 @@ RDEPENDS:${PN} +=3D "\
>         ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'fuse-overlayfs=
 slirp4netns', '', d)} \
>  "
>  RRECOMMENDS:${PN} +=3D "slirp4netns kernel-module-xt-masquerade kernel-m=
odule-xt-comment"
> -RCONFLICTS:${PN} =3D "${@bb.utils.contains('PACKAGECONFIG', 'docker', 'd=
ocker', '', d)}"
>
>  RDEPENDS:${PN}-ptest +=3D " \
>         bash \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8497): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8497
> Mute This Topic: https://lists.yoctoproject.org/mt/103107328/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

