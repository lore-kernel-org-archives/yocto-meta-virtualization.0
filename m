Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484AAC83F15
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 02:20:37 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.8993.1693275627999610300
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 19:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dDkkSmqX;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-59234aaca15so45174817b3.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Aug 2023 19:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693275627; x=1693880427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhBImum7d+9Sur1xcr1BFqY7WBqUPs2jFO1wakzor/M=;
        b=dDkkSmqXUYWdmFukaSgPAZTrnfbUWwp6BGKn9m6dh1ilQaiT2ybhR4R6puMhwuw2mW
         V9N6pcGTYKuHxNrDvAngxvZWh9n+ldM+srFKM/6zeKMjJuiLyWqSYM4V4xO7HICJlNx9
         L+jNNtMUznzcLauig6EpqEn30p3bI8+aNgX0Ur0jebnlecqMfce1MJ5z5lA2PxexT04P
         sQmPqSQe92yqScuDaUoVEPAhERIh42tAPColAZHGFaNlVlHnUvymmaVsyG8SPKuu3bBp
         rGd2bqZdM8zbbiMrkDYouF0rRecOQp/iB9B22Vng1TXcgicFCH2g/8L9Xu436uyr8H3a
         hrng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693275627; x=1693880427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhBImum7d+9Sur1xcr1BFqY7WBqUPs2jFO1wakzor/M=;
        b=CEwRm1usdqkv5YFrBhs5zj3oJZQgOSR4dge6cWWUdm5WKyqRTmPShjXVrfx98gWEAr
         tqpwpwFHYhun0f5/hWFm2yKT4mVDFkVgGvecHlJbDaekxSSr9ZZBWZEvZnsUTZIJAqIS
         WQsxfT+Qql5o55Z7CKpm8K1gXjpsf1+Wjc7SR/oohvQyAvX+K3Qv+mj0lqv/8kXvS5t5
         t3RYUHVSsKqJ2WYAt+sxHSC4OTSMTsAT9fkaBYFNU+UmXz7Sm7MdoKYP5DdBIgnmUvjr
         Djt8aPxUwGnjm555pBM8jH/75J0vpaaqUhgTuwYr35jnkTB49wxh8GNtM7UuFHh1QG70
         yxaQ==
X-Gm-Message-State: AOJu0YxMKDwsmN88k9UUWpl7ZmkyW2A3ymvxc3F8BZ6/NUurI4W0sooD
	lx9ZcRbDz5nucN3tLk6/mYodfnPMbtB93AS3wO8=
X-Google-Smtp-Source: AGHT+IGgkYVsN8gsl1sVH4oU9OtRTcpIxIg3GNfBb/3vUgI6Hgi2SqKBydd2vgn9I5K0mTwSKzFEeOzsGpcqF681JfI=
X-Received: by 2002:a25:9cc5:0:b0:d68:8a7f:127f with SMTP id
 z5-20020a259cc5000000b00d688a7f127fmr10393994ybo.52.1693275627115; Mon, 28
 Aug 2023 19:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230828202834.2981605-1-javier.tia@linaro.org>
In-Reply-To: <20230828202834.2981605-1-javier.tia@linaro.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 28 Aug 2023 22:20:15 -0400
Message-ID: <CADkTA4PcfD4PzoFpncuOfo7zCptnXKKSxQTyk-ngG76cvQbgfw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] go-build: add SRCREV_FORMAT
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Aug 2023 02:20:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8258

On Mon, Aug 28, 2023 at 4:28=E2=80=AFPM Javier Tia <javier.tia@linaro.org> =
wrote:
>
> Recipes that use multiple SCMs in the SRC_URI, must supply SRCREV_FORMAT
> to avoid an expansion error.
>
> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> ---
>  recipes-devtools/go/go-build_git.bb | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/recipes-devtools/go/go-build_git.bb b/recipes-devtools/go/go=
-build_git.bb
> index 2337c9e1..2a78be01 100644
> --- a/recipes-devtools/go/go-build_git.bb
> +++ b/recipes-devtools/go/go-build_git.bb
> @@ -4,12 +4,12 @@ DESCRIPTION =3D "Xen Runtime for OCI"
>
>  SRCREV_runx =3D "f24efd33fb18469e9cfe4d1bfe8e2c90ec8c4e93"
>  SRCREV_runc =3D "1e7bb5b773162b57333d57f612fd72e3f8612d94"
> -
> +SRCREV_FORMAT =3D "runx"
>  SRC_URI =3D "\
> -         git://github.com/lf-edge/runx;nobranch=3D1;name=3Drunx;protocol=
=3Dhttps \
> -          git://github.com/opencontainers/runc;branch=3Drelease-1.1;name=
=3Drunc;protocol=3Dhttps;destsuffix=3Dgit/src/import/gobuild/go/src/github.=
com/opencontainers/runc \
> -          file://0001-build-use-instead-of-go.patch \
> -         "
> +    git://github.com/lf-edge/runx;nobranch=3D1;name=3Drunx;protocol=3Dht=
tps \
> +    git://github.com/opencontainers/runc;branch=3Drelease-1.1;name=3Drun=
c;protocol=3Dhttps;destsuffix=3Dgit/src/import/gobuild/go/src/github.com/op=
encontainers/runc \
> +    file://0001-build-use-instead-of-go.patch \
> +"

There's some extra whitespace and formatting changes in the patch, it's a g=
ood
policy to not mix them in with a fix.

In a scenario like this, I tend to use the representative SCMs in the
format. So in this
case it should be runx_runc. There are some exceptions to this in the
tree, and I need
to fix them.

I've spun a patch with just that for master-next.

Bruce


>  SRC_URI[md5sum] =3D "0d701ac1e2a67d47ce7127432df2c32b"
>  SRC_URI[sha256sum] =3D "5a26478906d5005f4f809402e981518d2b8844949199f60c=
4b6e1f986ca2a769"
>
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8250): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8250
> Mute This Topic: https://lists.yoctoproject.org/mt/101018420/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

