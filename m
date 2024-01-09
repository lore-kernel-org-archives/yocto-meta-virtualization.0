Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84A4C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 13:23:20 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.16655.1704806599376839296
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Jan 2024 05:23:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EMTaHV/d;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7bc32b0fdadso125994939f.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Jan 2024 05:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704806598; x=1705411398; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdWf5eedTiLlRkLNcDE+X/toLWTuvkeY1Rj2aq+e/48=;
        b=EMTaHV/dBAP6K4ys3ZHoCAr0ejZWc88Gcidgg9tkUumqmuvYTsb1QnWPOOfktUZZSO
         gF0ia/NjiJ2umAgmyKG+3VAmIvkv8I1cSuRy4iGYXPwto7MrJiVQjjgLuDpzPgGlB1Y7
         6/yTCQC2pqOiSk3ZIEesRC50lClAkCcG1xgzjii+TyhE2ZSQL4Qg1g1SJsc/thJdBReR
         otjLp6kYWzpudrAGAIC1NuZBaIMbiISQSlgC+nSBv8QPiLmGMiXbHI15zkNqT2vkplaR
         r8H0wFkUnVy+8Nc09ziMnWXF41W1gnu1Wg0fL/RMoT2RPDesXXts1Y6mVhDFkWAQ0unm
         YITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704806598; x=1705411398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdWf5eedTiLlRkLNcDE+X/toLWTuvkeY1Rj2aq+e/48=;
        b=H7Uv6UGfvuIqODPBU01nliedhljJ/QYu4p5DXbj4BJuoQ8ttzjq2QApzAyYeikKtfb
         AXwALMURf6P3itvimMyc+aVqDkdx/DUq55W+NuloseI4WOQMB9IST0Umw54Q7LC4b1/I
         En1SoIPveXPR/3GIUNsWGdacVPdLRxH2APyFMA9heU1EQlJ1099I9N4vi0Vw5+qSOD9s
         onH6L1jiPJu5Ofu9L3kD+/+DhuwKvqFAzhlh1J34pMTc6ryX2xl2r+fBnZXd/KozD0oW
         wm74eveJs2hAm4yrd5N4uZb+j+pJkfYK6rYSl6vblQwVBlsT3URsuwmzSPyENyD6lAKU
         qJBg==
X-Gm-Message-State: AOJu0YwWHWn5zJjQa56jvXlSWwUe0sRsoMr7WmjtB7pIst5xc6IiqOTo
	p320LBu/zeg8NQpBrM5yED3wvBbv9eRM97yknJQ=
X-Google-Smtp-Source: AGHT+IG1PgT68kKhrG+RucKCnzAWD2hiuQTjJRjCfy+BRDtxR5Il9JmG9J7Uuai3vEGTOAekOShFs5gNTcLZprfXy94=
X-Received: by 2002:a6b:6619:0:b0:7be:c3d2:2035 with SMTP id
 a25-20020a6b6619000000b007bec3d22035mr2670509ioc.27.1704806598350; Tue, 09
 Jan 2024 05:23:18 -0800 (PST)
MIME-Version: 1.0
References: <20240108180933.2362963-1-liu.ming50@gmail.com>
 <CADkTA4NwrXFJ0b_2x0GDhVNeSUFVGOvWuXRKu+Wj1ckE=CtSEA@mail.gmail.com> <CALatG=4-p2tGB_Ke2WzULVQOPN00n5EYYRvAcsgfWi-U2gGo5g@mail.gmail.com>
In-Reply-To: <CALatG=4-p2tGB_Ke2WzULVQOPN00n5EYYRvAcsgfWi-U2gGo5g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Jan 2024 08:23:06 -0500
Message-ID: <CADkTA4OeoLqbD_7Zo-96RL3oAoQH-j0xx3phYGuAx_DKJT1WXQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] podman: support bash completions for podman/docker
To: Ming Liu <liu.ming50@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Jan 2024 13:23:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8534

On Tue, Jan 9, 2024 at 4:19=E2=80=AFAM Ming Liu <liu.ming50@gmail.com> wrot=
e:
>
> Hi, Bruce:
>
> Seems podman manage its shell completions inside the code (see this line:=
 https://github.com/containers/podman/pull/21095/commits/6c4892c8029fd992b4=
494adb62c535d0f5c5d62d#diff-cf5cc76e70a369c5221f08f29ec0452710af1f4ecd423c1=
62d5b669688416caeR484)
>
> then it uses "podman completion SHELL-NAME" to get the completion for a p=
articular shell, so it's not safe to pre-generate a completion outside of p=
odman source? For instance, if we add a CVE fix or some common bug fixes to=
 SRC_URI, the completion might be changed and the developers have to be awa=
re of that and also update completion file.
>

That CVE example is quite unlikely .. and I'd suggest we created the
issue by packaging the completions in the first case.

> And this qemu wrapper way is being used in OE in several recipes, like py=
thon, the qemu-native would be built in most cases if you build a OE image,=
 so would be no much cost on it? Just my personal options.
>

I'm quite aware of how and where the wrappers are used.  It is still
too complex for something as trivial
as bash completion generation.

I'd suggest you can carry the generation and packaging in a bbappend,
and that I can look into alternate
ways to generate the completions in the future.

Even generating them on-target, in a first boot scenario is preferable
(from a maintenance point of view).

I also have a podman-native extension locally that could be useful,
but doing an emulated arch-specific
execution of target podman to generate bash completion outputs (that
should NOT be arch specfic, and
if they are, we want no part of them) is far too heavy.

Bruce

> the best,
> thank you



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

