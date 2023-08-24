Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77035C3DA6F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 15:17:06 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.522.1692890220842890199
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Aug 2023 08:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dEOD/U+k;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-79093c0c68bso240775039f.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Aug 2023 08:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692890220; x=1693495020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHLr0w3gGwimb7cGZo2ptyHlOgYEEUfOL6e/Oz//O1A=;
        b=dEOD/U+k3cHR/alTMzJrhdLwXIm+Wm+aNyMSb6oDivaMbEkFkneYfTHCW4afCHAljY
         eHcqZk8y3FZWe2Eq3G3yOX2LWRmjcMrAHvnSpv1iIDNl2a72E2vD89REcISJ0QBmHn6W
         S9P2Wu4BmsCkPr0XLOFBKT9g6AwYPzNA9mdTbE9pgMp71tsQGu8lTIENIJ6oybkF22K7
         jGMGoZIA/M5QAkPu+iF9B8HaQAPrxRRX9FrRbU/PvCXzmS5NkiQCMx6+mI5KGPJvCih+
         LZ7qu15swxACl0MjhvwhW0t//zXV2SME1Z0b3qb8YhRdCHYJ5meHGQx1aYoXOXmNjj4q
         Dkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692890220; x=1693495020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHLr0w3gGwimb7cGZo2ptyHlOgYEEUfOL6e/Oz//O1A=;
        b=eoW9KoOzqXURVXjn6B+XRt3YaVzaDpbZOZ9icfQIpqjcPJ3ujsgnWSxst2tNAZKfs4
         XeX/YU+F3DxuRG+eklJcLkotpvyuriFKqxN5DMF2xSzHMkCDXSPv5kiqaUQThNbaC10X
         N+ncDRZe8bJYrP105GXrWnuZ8LX+wZb6wkAA+yen2+1CkGxZ3+oVq++xtSWzp544ORYa
         UgdAR/gi41HMIo0OjwiIF2gbsjC5/z54yuqkh+96WRuRCAePK8o93QuVu4lbP29KrM8S
         qLoYWA82saP8UE9Q+iLUd5IVtNE39dT7PFl4+HOroFp7SqY3oN6DwZzNIGj08I1Btm9i
         S7Dw==
X-Gm-Message-State: AOJu0Yybr1J5oZYr84cUqa05RGRT2HlFnhvC1FgrCWhbVL0isNfTEwMQ
	jPpUadd1ttW6jsGiCifjZ1ASfTa93R27+8c2cCxqYvjtXh8=
X-Google-Smtp-Source: AGHT+IHcGh2rApD6Jd0lnBk98YGn6OMBno3ctHEJc+xPu8iQJcg/UUSmhv53pHErJofvZvGTuHX2FyqxuCdeFU9mcjU=
X-Received: by 2002:a6b:f214:0:b0:790:f733:2f9e with SMTP id
 q20-20020a6bf214000000b00790f7332f9emr6656605ioh.13.1692890219847; Thu, 24
 Aug 2023 08:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230824100604.3935542-1-mingli.yu@windriver.com>
In-Reply-To: <20230824100604.3935542-1-mingli.yu@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 24 Aug 2023 11:16:48 -0400
Message-ID: <CADkTA4PjHE-eu1CrgeGAaUdNo+iCEhaoGkttcNcsGKD+jZYMvg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] go-mux: Switch to main branch
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Aug 2023 15:17:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8230

I had bumped into (and fixed) the go-context branch change myself, but
I didn't notice the go-mux one due to mirroring.

I've put my and your patches onto master-next.

I also uprev'd the packages.

Bruce

On Thu, Aug 24, 2023 at 6:06=E2=80=AFAM Yu, Mingli <mingli.yu@eng.windriver=
.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> The project has renamed the master branch to main.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  recipes-devtools/go/go-mux_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/go/go-mux_git.bb b/recipes-devtools/go/go-m=
ux_git.bb
> index 3f939f45..fb4502b6 100644
> --- a/recipes-devtools/go/go-mux_git.bb
> +++ b/recipes-devtools/go/go-mux_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc50f6bd9c1e15e=
d0bad3bea18e3c1b7f"
>  SRCNAME =3D "mux"
>
>  PKG_NAME =3D "github.com/gorilla/${SRCNAME}"
> -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps"
> +SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmain;protocol=3Dhttps"
>
>  SRCREV =3D "136d54f81f00414c45c3c68dd47e98cc97519c5e"
>
> --
> 2.35.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8228): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8228
> Mute This Topic: https://lists.yoctoproject.org/mt/100932420/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

