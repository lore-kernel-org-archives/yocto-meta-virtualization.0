Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49666C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 13:35:59 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web10.160898.1692192955453979069
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Aug 2023 06:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=K+vB4jF0;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-34995e5b4bfso26380145ab.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Aug 2023 06:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692192954; x=1692797754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bq0l2qvobDfK0N5I2MA2TYimmqffeBuksJAf+nASeMk=;
        b=K+vB4jF0q13B8uzTZw0ssMN4yGuYX+pB0L3PUutzyRFtogOJy5bFtJ5u6oaHaM+tyQ
         MEmDE39Umfo9Rpo1+KqzV1jE1yD6yw+YmP6U6EltF8LLCzqXtrmc3kC+6WUZsKs3idP5
         uQ90ujnpJ56uNYe0Ze8ghpuJHN+y8nbZK9OR+ytFGUM3mnk8vBq4K/xxRoRO6Q68hvsR
         /C9xkl1upIx2zzqr42XqjuSdVQ65DpjA4x8klP5X9MaSQrbeONpzmpZXyi07m3I8HAJL
         B8drt4odw8Sm/J+wOG7m8WQE1/rU+hSKg82/rZ0N5GzOFZw95Qr1iWCXedoa9Zf4P8uE
         Wsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692192954; x=1692797754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bq0l2qvobDfK0N5I2MA2TYimmqffeBuksJAf+nASeMk=;
        b=bpwTUw/BBbhDAIIWKPbSLmqn+Ys3UwkJifKTEqcpV1LDeXGJv7lZuYUyo99F0QKGbk
         h+f+cyybddRT3pn086Lpg5wbaS3CbfWjE2vUKhKE6ZVtxBf0SIRIyS+2ON4Jzg0CCR44
         YD5rQjCOndbIylmolR3vMJsFEX+5AaDUlg4IqsFCQjb6Hc7FCMfXCltKdAgcObbGeqCl
         oLcqzfNaVKiEKTjJhQ3yUDEvdBfNstoaziv/Npbt3VF9RPlG6JvLFImCT+v1lY1cX60k
         IlSU585r0ZXprM2/izCzCMmzVfYbP3KFYpkFs/6rQsL0MOjReGdVrzDRhpST7dN4Qy66
         KLBA==
X-Gm-Message-State: AOJu0YxGdpL+yyGIsJEuyZv8zpOIYEo1TWPlXiIGC5ABSK+WqTIX8KPY
	yI5JOSdwjuZb5YnvT0fi/vQcz7nTr3G03WJNzgU=
X-Google-Smtp-Source: AGHT+IEBLpMxXoUYqxvzmRmfR0186ZwPK+nua7v4rhOAeprTBXKPOHOnJNO0K4xJ2F41eyL0XVU2ob5Qo0Onkh6royg=
X-Received: by 2002:a05:6e02:b21:b0:346:5e80:bf67 with SMTP id
 e1-20020a056e020b2100b003465e80bf67mr2872662ilu.21.1692192954659; Wed, 16 Aug
 2023 06:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230816060932.668438-1-Martin.Jansa@gmail.com>
In-Reply-To: <20230816060932.668438-1-Martin.Jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 16 Aug 2023 09:35:43 -0400
Message-ID: <CADkTA4OWMris3ESwrNCcoc5s1r-q_qKO=GvKqWjESy3S94s9iQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [kirkstone][PATCH] docker-ce: bump SRCREV_docker
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Aug 2023 13:35:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8200

Thanks Martin,

This is merged.

Bruce

On Wed, Aug 16, 2023 at 2:09=E2=80=AFAM Martin Jansa <Martin.Jansa@gmail.co=
m> wrote:
>
> * fix my prevous commit where I've missed this update corresponding
>   to SRCREV_moby change in docker-moby recipe.
>
> * also re-order the patches in SRC_URI to match docker-moby, so
>   that they are easier to compare
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-containers/docker/docker-ce_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-contain=
ers/docker/docker-ce_git.bb
> index 76ac41e..7142060 100644
> --- a/recipes-containers/docker/docker-ce_git.bb
> +++ b/recipes-containers/docker/docker-ce_git.bb
> @@ -31,7 +31,7 @@ DESCRIPTION =3D "Linux container runtime \
>  # so we get that tag, and make it our SRCREVS:
>  #
>
> -SRCREV_docker =3D "3056208812eb5e792fa99736c9167d1e10f4ab49"
> +SRCREV_docker =3D "791d8ab87747169b4cbfcdf2fd57c81952bae6d5"
>  SRCREV_libnetwork =3D "dcdf8f176d1e13ad719e913e796fb698d846de98"
>  SRCREV_cli =3D "911449ca245308472a3d34a7f1a98b918e65c8c3"
>  SRCREV_FORMAT =3D "docker_libnetwork"
> @@ -39,10 +39,10 @@ SRC_URI =3D "\
>      git://github.com/docker/docker.git;branch=3D20.10;name=3Ddocker;prot=
ocol=3Dhttps \
>      git://github.com/docker/libnetwork.git;branch=3Dmaster;name=3Dlibnet=
work;destsuffix=3Dgit/libnetwork;protocol=3Dhttps \
>      git://github.com/docker/cli;branch=3D20.10;name=3Dcli;destsuffix=3Dg=
it/cli;protocol=3Dhttps \
> -    file://0001-libnetwork-use-GO-instead-of-go.patch \
>      file://docker.init \
> -    file://0001-dynbinary-use-go-cross-compiler.patch \
> +    file://0001-libnetwork-use-GO-instead-of-go.patch \
>      file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
> +    file://0001-dynbinary-use-go-cross-compiler.patch \
>      file://0001-Revert-go-updates-from-1.19.12-to-1.18.7.patch;patchdir=
=3Dsrc/import \
>      file://0002-Revert-go-updates-from-1.18.7-to-1.17.13.patch;patchdir=
=3Dsrc/import \
>      file://0003-builder.go-avoid-using-strings.Cut-from-go-1.18.patch;pa=
tchdir=3Dsrc/import \
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8196): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8196
> Mute This Topic: https://lists.yoctoproject.org/mt/100774437/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

