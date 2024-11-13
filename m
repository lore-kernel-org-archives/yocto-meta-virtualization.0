Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB99D41C11
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 07:44:49 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.6624.1731483886599974193
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Nov 2024 23:44:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZtF1eOhe;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so58275381fa.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Nov 2024 23:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731483885; x=1732088685; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmhhpIaFxTy68inmHIgNmrVmuMFJ1kfS51eA5ARq5gs=;
        b=ZtF1eOheu4eHvrRNPvRaOAGD4zme6PGlAAcUo0m/c6eFJc2FshA2P1ptS+w/aXXwkK
         CZbgl6mVHaRSD7TtQNSiZCTpJCzGR56GfQEETbT0CE8I3mRxTq3CLn/eEkarM1XrAmgJ
         Xq9bXqz9Uh9xtGgnqu4NbBXjdfRHfWUC2hjlTGDLbBHAF34N7vP88B+isu8Vxui/shhM
         kD+3rG30RFDPxXjJsO9ELXsoe9Ze24kTgDyiTpVxidR1dcMBpnJCLOPqZ2YtKiyBxQ99
         VklEm4sHhggeJQrpOWT+1A9A9x0MrV+MTE1bQnRtc14GmbIGjLkqKyukJnqcpG7GaL5N
         Fdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731483885; x=1732088685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TmhhpIaFxTy68inmHIgNmrVmuMFJ1kfS51eA5ARq5gs=;
        b=ZAP+0i6Uu+5gJN0xSKcQgAnu9/5sqapPXWEkM5nGmfUU5/BQW4KMO4SFX4EB+1b6FB
         fJbvhqQx62fsLUGlMrsRWGBMjY99o1VMi4fDVmBw7OFC2+NzuNiOAe5hsWCGXQb4gvLZ
         OOu8D1dgU2U7Rh57/Fm2Y7LvRHUkSiaRndNm/S3YCbgmA618Csc32wTSCjmGsVW4quVW
         AsTKBc7CoxIuE5E1ouGlLMgS/adwd1RaOGqhXsBoYBZQrSxTBhyKM9/fdw8KEzcUJx52
         bjVqRdLXEAX2n19j9Y68EwTTfSuTHYqmSEVKKm/N6UrxOdNrBGGrkUY24meCD93qX2OG
         2+/g==
X-Gm-Message-State: AOJu0YxnxafsqGSxos7dotoCMyeSCJ49b4U+56WhK6xTqE9rw0iWNdil
	G5/B80aFFfoiKPwLBqSp7B9QUk5yitlIRoOTpWXCImHvo88TQDmaPPib/Mn6XColHIz5lFlkJTV
	2haXUZuPvjvI8NK/KfBZvA5vZJNs=
X-Google-Smtp-Source: AGHT+IFBM6akrc/e5Y7zJpE5Lknb7C3bgLgz2p4b4MLdfyTvDYXeWIOLmTHtgUcvqXycAyninU6i4GKnQH3b3IOOSYo=
X-Received: by 2002:a2e:9f54:0:b0:2fb:34dc:7beb with SMTP id
 38308e7fff4ca-2ff2014f218mr71288581fa.12.1731483884293; Tue, 12 Nov 2024
 23:44:44 -0800 (PST)
MIME-Version: 1.0
References: <20241111163628.111992-1-martin.jansa@gmail.com> <ZzPjBWxtD2+wHij7@gmail.com>
In-Reply-To: <ZzPjBWxtD2+wHij7@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 13 Nov 2024 08:44:26 +0100
Message-ID: <CA+chaQevweZrObk74CaYRW0jm4t22-asUxTi04HKP4b_mJdkBA@mail.gmail.com>
Subject: Re: [meta-virtualization] [master][scarthgap][styhead][kirkstone][PATCH]
 go-cli: use main branch
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Nov 2024 07:44:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8968

On Wed, Nov 13, 2024 at 12:21=E2=80=AFAM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> I had to tweak it a bit for kirkstone, but it is now applied
> everywhere!

Thanks!

For me git cherry-pick tweaked it automatically for me for kirkstone,
when cherry-picking from master, that's why I've sent just one
version. But I guess git am was more picky, sorry about that and
thanks for resolving it.

Cheers,

>
> Bruce
>
> In message: [meta-virtualization] [master][scarthgap][styhead][kirkstone]=
[PATCH] go-cli: use main branch
> on 11/11/2024 Martin Jansa via lists.yoctoproject.org wrote:
>
> > * master was renamed to main long time ago
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> >  recipes-devtools/go/go-cli_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/recipes-devtools/go/go-cli_git.bb b/recipes-devtools/go/go=
-cli_git.bb
> > index 8a4992bd..37f65c33 100644
> > --- a/recipes-devtools/go/go-cli_git.bb
> > +++ b/recipes-devtools/go/go-cli_git.bb
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ded9b539ed65d=
73926f30ff1f1587dc44"
> >  SRCNAME =3D "cli"
> >
> >  PKG_NAME =3D "github.com/codegangsta/${SRCNAME}"
> > -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps"
> > +SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmain;protocol=3Dhttps"
> >
> >  SRCREV =3D "27ecc97192df1bf053a22b04463f2b51b8b8373e"
> >  PV =3D "1.1.0+git"
> > --
> > 2.47.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8962): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/8962
> > Mute This Topic: https://lists.yoctoproject.org/mt/109518136/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

