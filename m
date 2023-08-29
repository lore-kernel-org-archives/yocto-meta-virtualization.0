Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D2BC83F15
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 01:50:46 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.8538.1693273841532891392
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 18:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dor8hdDm;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-58fc4d319d2so45173257b3.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Aug 2023 18:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693273840; x=1693878640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSHEVSDbCWAPjHoRLgtzaj62KfG3Z5b/U5dsjwgfb60=;
        b=dor8hdDmWSN2xGENjqDG58+xYAU/Y/me/brELFpEcXH3pwXAQtNIKMd5Ly0oBEimWd
         lejyxEaq1lwHNnoWe4RGEA7ptJ/WGIOhpNmJo1kQaaH6wPCOTXL5AiUVyzKo1mJzkgv0
         RIfcnoO14PH0IQ5wqBpD/t7ocLGIxIJZtowlA2Z8OE5UV4QQ80QnyNhMe918vX1xpBzH
         UV7MF/jAdtF0JHwP4POHpJFIJKsonbdqKfbykv1kBb+dabALMeg8v/UPkmOqHcZsGckn
         bjLSfBpIwh9J/pj4SRmh6I63XWdQXlOyJ7lfXL5ydX1jzPc8lPManssKV8l8ISOUs0MZ
         6WNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693273840; x=1693878640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSHEVSDbCWAPjHoRLgtzaj62KfG3Z5b/U5dsjwgfb60=;
        b=JVVERcE1wcZCez5eaExKrop7b+veMFHNPX8ajUsfySpdu/CJSTbz+drmwEnoO0a32I
         VsHg14WljISY5mxqHqUIEO78SaDp2Jn+3rKQPOQKhJHqa3Xn4K9+7DE/CtHDTESic9C6
         3rsKDs74303SzCklJmQoif6iIVDj9pMMoqlf9d7ebhhSqcETcQsbJXQHzSDKa8SNOxDQ
         UF3pcELPMO/x1uRlvtntkRzhLkVuGOfmJ/71BN1fjwo+DvcN8wDhl8FKzLmGObx1xbAl
         2h++/TxFp19ckYBySI6g6bj6xKpwnYrUmTbmY8bo7BwZvr+7/k48IlCeprnxqVxbuEWq
         oWaw==
X-Gm-Message-State: AOJu0Ywqy/yhC2RwlnnFkOktiORPgJQJzHZwTB3fBkkFhcSoxMBaLRGc
	NDYtkiS/PyL/IN2RZpGA8y/1HAB11FL8uZVlyX2TqFZc
X-Google-Smtp-Source: AGHT+IEuwujt1ZreCkbJhMf7p8U2F1yuk4VWL2B+QJCHGKVrKN52YIQ28LBdAK9UGDRCCbJnosWQDNVfw/0lNIzfdGE=
X-Received: by 2002:a25:ab0b:0:b0:d78:20d6:6f4e with SMTP id
 u11-20020a25ab0b000000b00d7820d66f4emr1085394ybi.38.1693273840672; Mon, 28
 Aug 2023 18:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230828220710.2689454-1-Martin.Jansa@gmail.com>
In-Reply-To: <20230828220710.2689454-1-Martin.Jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 28 Aug 2023 21:50:29 -0400
Message-ID: <CADkTA4PGWLMN4J8xxmiHzYA7gdWa9UVGK5PgHJHBqvKKCBx0uQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] go-mux: Switch to main branch
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Aug 2023 01:50:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8253

We've got this one already queued on master-next.

While I'm on holidays, I'm holding most patches out of master until I
can be around to deal with issues.

Bruce

On Mon, Aug 28, 2023 at 6:07=E2=80=AFPM Martin Jansa <Martin.Jansa@gmail.co=
m> wrote:
>
> The project has renamed the master branch to main.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-devtools/go/go-mux_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/go/go-mux_git.bb b/recipes-devtools/go/go-m=
ux_git.bb
> index 3f939f4..fb4502b 100644
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
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8251): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8251
> Mute This Topic: https://lists.yoctoproject.org/mt/101020201/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

