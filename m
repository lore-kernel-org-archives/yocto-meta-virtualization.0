Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9393C3DA4A
	for <webhook@archiver.kernel.org>; Sat,  3 Aug 2024 02:08:19 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.1520.1722650897515960782
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 02 Aug 2024 19:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JpIrFrm1;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2cb53da06a9so2818819a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 02 Aug 2024 19:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722650897; x=1723255697; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b15LrnIvY4WodIxNvhJCfREpKvpaVL74iqLx/Yn8byA=;
        b=JpIrFrm1PRI4pJ++Yf48AsQ5yBJfKEmbIANJ9Coj5Vn0iA4yfNW7xqIuOLR/3ChTHj
         uKRvJyKZg9EkGlBVbonaDV6PTdVbJj5Iq0eckbAJ32pqm6+4R20oz8uYRETV7MNM68OY
         rt1YIV/r/f2oscLbS8pFhlv4w76pI7nqWM086GmjlNhlxedq1OvsN/Kor2VJiAA7XMTV
         JeDSHjSCfn2Olr5pe/n61DG/a1YAWMRw7RAkdUzBlGZlZUqCkC2jtuIXvJ4aSt+8edhM
         8beVENYI95Cwpxr0+I3IPxbD7FjE/5VQfuqFQkL3Q+btYKEj637xi5NhycJuaoYrG9lw
         FNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722650897; x=1723255697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b15LrnIvY4WodIxNvhJCfREpKvpaVL74iqLx/Yn8byA=;
        b=VXqZfu2ywgNZngNOLEyzEXKQ7Altp0T1ZDPAhTFZhgq03hv6hDNe+SwyrOucykoG9X
         uJEbFliiHN3ofvDOeQf5AXN5Z5ZRuwzqNesNQqyappWmQYaiJwFj0Ftm79YqrCzC72iS
         4Pp0m57JOj0mOEpzXcSmuF70LRxEHLsgSvx6s0GH5t5TZmlS/Hl9KFmgCwp+84k7F+jA
         Pskk+cqwOiKQEPKfeEn5nel5CuZL/ZMZzKshfmVydYUqI0UasmcEWXRelkw7HIzqse/o
         q8cfcjdARDLae/pBJECSf+oCZS0UYzQTXd5fdb1XIsAgLAX+kHoDpIoXeCGzHS3Ar6MK
         G+gQ==
X-Gm-Message-State: AOJu0Yz7dLzykCTf81IyjiIEJspNt/Gf6Eu/0wve2QVezY8g7xhw8PAt
	xoSrL4lXacKkmbQQ3kSxpxSLNJd6TwHHfSj9mkjE85GRzr799d104y6ljhnnEQvpoJDpmb/P0Av
	l+zate/LPsbGs2dWXN2w+UNXtR5A=
X-Google-Smtp-Source: AGHT+IFGmlHxczvFXySZfhUREnhaAEQ8yQd4wA/mAgt8T8+SehSmNkY81n2zhpQ+sZdBEJ493HR40ij/PXZQnZBybtw=
X-Received: by 2002:a17:90b:3b87:b0:2cb:4c30:51bd with SMTP id
 98e67ed59e1d1-2cffa2bc65fmr8253395a91.19.1722650896518; Fri, 02 Aug 2024
 19:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240802123754.3683142-1-theodore_roth@trimble.com>
In-Reply-To: <20240802123754.3683142-1-theodore_roth@trimble.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 2 Aug 2024 22:08:05 -0400
Message-ID: <CADkTA4MvguFWyeZJrR1kAhVjjXTDvQY92Fi9WnxPKP8Ep-+CKA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker-moby: Fix branch value
To: "Theodore A. Roth" <troth@openavr.org>
Cc: meta-virtualization@lists.yoctoproject.org, 
	"Theodore A . Roth" <theodore_roth@trimble.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 03 Aug 2024 02:08:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8858

On Fri, Aug 2, 2024 at 8:38=E2=80=AFAM Theodore A. Roth <troth@openavr.org>=
 wrote:
>
> From: "Theodore A. Roth" <troth@openavr.org>
>
> The upstream git repo does not have a `27.0` branch. It is `27.x`.
> This is causing fetch errors.

To be accurate, they *changed* the upstream branch.

One means that the integration was incorrect, the other means that
the upstream project is behaving antisocially.

I'm actually going to set this to nobranch, since I've lost faith in
the way they manage their repo.

Bruce

>
>     ERROR: docker-moby-27.0.3+git7fa33a539a2054417c8aacdd7f92e3f8e50f1dff=
-r0 \
>         do_fetch: Fetcher failure: Unable to find revision \
>         7fa33a539a2054417c8aacdd7f92e3f8e50f1dff in branch 27.0 even from=
 upstream
>     ERROR: docker-moby-27.0.3+git7fa33a539a2054417c8aacdd7f92e3f8e50f1dff=
-r0 \
>         do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL =
from \
>         any source.', 'git://github.com/moby/moby.git;branch=3D27.0;name=
=3Dmoby;protocol=3Dhttps;destsuffix=3Dgit/src/import/')
>
> Signed-off-by: Theodore A. Roth <troth@openavr.org>
> Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
> ---
>  recipes-containers/docker/docker-moby_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-conta=
iners/docker/docker-moby_git.bb
> index b4576de9..16675d21 100644
> --- a/recipes-containers/docker/docker-moby_git.bb
> +++ b/recipes-containers/docker/docker-moby_git.bb
> @@ -49,9 +49,9 @@ SRCREV_libnetwork =3D "67e0588f1ddfaf2faf4c8cae8b7ea287=
6434d91c"
>  SRCREV_cli =3D "d41cb083c352853f94b292a87df4859c4a96dcc2"
>  SRCREV_FORMAT =3D "moby_libnetwork"
>  SRC_URI =3D "\
> -       git://github.com/moby/moby.git;branch=3D27.0;name=3Dmoby;protocol=
=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
> +       git://github.com/moby/moby.git;branch=3D27.x;name=3Dmoby;protocol=
=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
>         git://github.com/docker/libnetwork.git;branch=3Dmaster;name=3Dlib=
network;destsuffix=3Dgit/libnetwork;protocol=3Dhttps \
> -       git://github.com/docker/cli;branch=3D27.0;name=3Dcli;destsuffix=
=3Dgit/cli;protocol=3Dhttps \
> +       git://github.com/docker/cli;branch=3D27.x;name=3Dcli;destsuffix=
=3Dgit/cli;protocol=3Dhttps \
>         file://docker.init \
>         file://0001-libnetwork-use-GO-instead-of-go.patch \
>          file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patc=
h \
> --
> 2.34.1
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

