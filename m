Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ABD5C00A8F
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 19:00:42 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.156169.1698174036560263855
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 12:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vt1kxkV9;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3575287211bso16886605ab.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Oct 2023 12:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698174036; x=1698778836; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7a7RUMWnmUk+5kvlVbJzvUdFEZC3I9XX4I5b3czEsU=;
        b=Vt1kxkV9VODdmeWIvDm5G8A3EvZPzSv4gs1hGEqY62Vr0739njeVxCkPSC6tej2xJb
         ykfnZaaP8vprhigGwEq8Femy4zDTV1e2eGxQBk/i3grbu1Lb4WE33TAwzw7qpHkwYNs6
         BQ2EjFa9Vog62LEWixbK1vcIcFZDzMYQHpeH+WY+GkuQ+vg6T8qD4R+94qfG8yjHSqno
         RxYv1PKVe0u5bQLQI3AM/LtORGujH1vQEVlMkZez+O2bRGgvtn4W90sGnM7b1wcBbkZY
         o5jJtHOD/+RCYpO/aJcAqiSrFZQGo74FyGiqPtaXu8hos5lw2+SLrGLWoRbpwHB2aXv2
         78fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698174036; x=1698778836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7a7RUMWnmUk+5kvlVbJzvUdFEZC3I9XX4I5b3czEsU=;
        b=cgx7xkCp1Ln6GeFZUJnt/v4P/QLTOO/YYg0bu938gieo7uTeDFdhmtL9gtHMeKuLL4
         SQptEihVHrZdio3WDvQHsDfWrZOePZZEY33EhwV3zyWF/iWoM2sHcGRdwX9X8yeuWOsf
         ncvNRkOlJORQSHvbVsPQ55ermoWUjEUbzvjn2AbUA8TbGWAZMnJCemdi1oahOBghtYEi
         S0Gxrqqnrnq7hANhAVhajpY3hHgjDQB7Dc/TFDF8QI6DDfWW8YhoaJ1dDXaznarftQ+x
         ApTD5eLKRwMyHVNY5mxkQMFt6f+xtVjQdRqq9yrp1XcIp9we64uPTjA0C2lWsyIbT9sT
         bVqA==
X-Gm-Message-State: AOJu0Yz00CiIeX092yXXlP3/LWOveUlTibgMD74wbmfl3U5SLJAt2qhL
	ghzFsJAEBqyxKukle3dXEJoCycOYOLRuD5IggM5yUgzN
X-Google-Smtp-Source: AGHT+IGAywowhe/oZVmJtMQPSOEVGCAwDMwlxEOa+5UVa6E1cbcXV2eq/8hb66xswL8/3JEy4yqfJvJpwf1ZxY+7zts=
X-Received: by 2002:a05:6e02:1c8b:b0:351:10c0:ffd5 with SMTP id
 w11-20020a056e021c8b00b0035110c0ffd5mr16491377ill.7.1698174035738; Tue, 24
 Oct 2023 12:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231016213431.2149835-1-JPEWhacker@gmail.com>
In-Reply-To: <20231016213431.2149835-1-JPEWhacker@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 24 Oct 2023 15:00:24 -0400
Message-ID: <CADkTA4PUTgU5R2ty2xDXzu9tiPR=Lnmz572gOTX1vRpj3r++1w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] classes/image-oci-umoci: Allow
 environment variables to have spaces
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Oct 2023 19:00:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8392

This also makes sense, and will be staged shortly,

Bruce

On Mon, Oct 16, 2023 at 5:34=E2=80=AFPM Joshua Watt <JPEWhacker@gmail.com> =
wrote:
>
> Quote the environment variable argument passed to umoci to allow it to
> correctly handle spaces. Note that this requires that OCI_IMAGE_ENV_VARS
> have the argument quoted with single quotes, as in:
>
>     OCI_IMAGE_ENV_VARS =3D "FOO=3D'bar bat'"
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  classes/image-oci-umoci.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
> index d96b438..e8facfe 100644
> --- a/classes/image-oci-umoci.inc
> +++ b/classes/image-oci-umoci.inc
> @@ -64,8 +64,8 @@ IMAGE_CMD:oci() {
>      fi
>      if [ -n "${OCI_IMAGE_ENV_VARS}" ]; then
>         for l in ${OCI_IMAGE_ENV_VARS}; do
> -           bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG} =
--config.env $l"
> -           umoci config --image $image_name:${OCI_IMAGE_TAG} --config.en=
v $l
> +           bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG} =
--config.env \"$l\""
> +           umoci config --image $image_name:${OCI_IMAGE_TAG} --config.en=
v "$l"
>         done
>      fi
>      if [ -n "${OCI_IMAGE_PORTS}" ]; then
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8377): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8377
> Mute This Topic: https://lists.yoctoproject.org/mt/102006235/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

