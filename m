Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C837C5479F
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 17:59:59 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.19936.1708624796511985414
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Feb 2024 09:59:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QcEOu/Uw;
 spf=pass (domain: linaro.org, ip: 209.85.218.47, mailfrom: fathi.boudra@linaro.org)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a3d5e77cfbeso14454866b.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 09:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708624795; x=1709229595; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQGkaCdCMCkIg7HRzKsIbNSMFHDuRmV1Ru+wwQo3IUU=;
        b=QcEOu/UwndeXKa5+Yl4l9bVto9Dqc6xW+u5am2guf0gA0pDGYTO42nNiVtpuMKU2lM
         PkHRDSwwW0C6blro2j01KtgVGvBWtsDHOKNvYxNAxHRWoWAPkGndAM0zO+QRHsaMGiJj
         gfLU1+D3/aQhYvIiOCJTMoj2fZNRUvZfpLU4eor19ti6UZOU0V39mG8Yk1Uo4fXfo4LK
         iboaOnVhjxSYuRDU9Bd7JMgJVGnXQPSrHr54XCfCqV4LYkZ3GQihy4HOqOj+v5+5Q7w6
         J7BpwPvb6JBvqJiUiJLxOasH7qjhxK2dSNZy+7HVrzkwTGKZ1Jfk2RMEQ9nB4IgciycA
         zRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708624795; x=1709229595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aQGkaCdCMCkIg7HRzKsIbNSMFHDuRmV1Ru+wwQo3IUU=;
        b=EvCnnOtUtzVvKUDCUlnQXDMei/hmTvK7xjjGMLT0/cBSbpDPgozxIZDMntqphUiSkj
         HqBdjRQRJ0ZT5+VzEPX/nqVNZYGPQ+ACQfJOAozUr66aIUfeLswKqzLZ48YLoYdc58CI
         I0yPGyDtQ4/jPYgVPYTPuLWnZOEIU7OVtDV7BenzQcktsEvnDPd2KTD95NTakzRFxzCM
         aHDllRk0WWHhSSilKXjCsj2FBDzWI5hwSxGA/l/DKXqZMZFU+xdabipnFzhhzCNjfWeS
         Zv083Y4oZjvI5AnMMhNqeOfmKj9oSkrebtvP62jlIteLSGMM8qFpvnRsdG92uxmRt/U9
         YmTg==
X-Gm-Message-State: AOJu0YyHI5p5G/HiPib4x6bFhaADQeccBolElduWyOoY+YQjZm13qlKv
	FZaf29bmfUKEZ743h4ehEO2jYbq5nCxzIzmAWLYhHCzMl6fNU0mBfxLgdyJu+8+tH3r6q+Ts0vo
	83qo0GEZp4RFCbjjuAx0DDs/t2qZ03dvuHXiMhQ==
X-Google-Smtp-Source: AGHT+IG2qG6qRLrtYECsmFze1XkNU6dSGyqKGi0eOqx1L2QxNgYPSKVN4nKOq6GbZ++kDm7lfVqrWJHVp+CjmKkTboc=
X-Received: by 2002:a17:906:a2d5:b0:a3e:f9ae:4764 with SMTP id
 by21-20020a170906a2d500b00a3ef9ae4764mr2510512ejb.38.1708624794890; Thu, 22
 Feb 2024 09:59:54 -0800 (PST)
MIME-Version: 1.0
References: <20240222162019.3154833-1-fathi.boudra@linaro.org>
 <CADkTA4Ovz6SpRXopnfUxq8cMFXzCoG=hLZ3cA5vG3VNx=Pneww@mail.gmail.com>
 <CAGNsrLChN5LWNPR7OGLHZ5305fH8Xpw91RQggV9Wrt-ek4aZzw@mail.gmail.com>
 <CADkTA4N5NUoGGrxAKsSceeKUSyc+65eDHhrJqjHbm0NXLS7tNg@mail.gmail.com>
 <CAGNsrLA9tUtxLRo6ezA1zxtwL6L3OParW3eOg9n5qRS_b1WGLw@mail.gmail.com> <CADkTA4PROZPbH-yHDpqEQ-h-0rm_Xq4KqBz8MNx58CP52Ym_JA@mail.gmail.com>
In-Reply-To: <CADkTA4PROZPbH-yHDpqEQ-h-0rm_Xq4KqBz8MNx58CP52Ym_JA@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Thu, 22 Feb 2024 18:59:43 +0100
Message-ID: <CAGNsrLD5Gii+sBrPf_ggYTgDPvNK4cqMBF1+HiPVaju4n99h5Q@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] linux-yocto: include: relax the
 versioned linux-yocto_*_virtualization.inc
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 17:59:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8580

On Thu, 22 Feb 2024 at 18:52, Bruce Ashfield <bruce.ashfield@gmail.com> wro=
te:
>
> On Thu, Feb 22, 2024 at 12:37=E2=80=AFPM Fathi Boudra <fathi.boudra@linar=
o.org> wrote:
> >
> > On Thu, 22 Feb 2024 at 18:19, Bruce Ashfield <bruce.ashfield@gmail.com>=
 wrote:
> > >
> > > On Thu, Feb 22, 2024 at 12:16=E2=80=AFPM Fathi Boudra <fathi.boudra@l=
inaro.org> wrote:
> > > >
> > > > On Thu, 22 Feb 2024 at 18:10, Bruce Ashfield <bruce.ashfield@gmail.=
com> wrote:
> > > > >
> > > > > Unfortunately, no. I've already rejected similar patches in the p=
ast.
> > > > >
> > > > > The specific versioning is intentional and is going to stay. It t=
racks
> > > > > what is supported and tested in a given branch.
> > > > >
> > > > > If someone needs to deviate from what I'm marking as tested, they=
 can
> > > > > carry a file in their layers.
> > > >
> > > > That's unfortunate. Let's all carry a workaround for this one-liner
> > > > that hasn't changed in 4 years.
> > > >
> > >
> > > I'm not sure what you are implying, but I am constantly changing the
> > > versioned linux-yocto .inc file to match the upstream file.
> > >
> > > Which is exactly the point of that file, not the contents within the
> > > file.
> >
> > Let's be clear, as you mentioned, you've rejected similar patches in th=
e past.
> > There's real users affected by this strict versioning and causing
> > unnecessary breakage.
>
> And let's be clear that I'm not going to trade off a few users
> carrying a small tweak to their local configs / layers if they
> want to support a different set of versions than I'm testing,
> with even a single user thinking that the support is extended
> to anything more than the versions in oe-core.  It has to be
> enforced through the layer, not documentation or what people
> think they know.

You have no clue about how many users are affected.

> > Hence, I'm assuming that other users are or have been impacted and
> > carry a workaround.
> > Relaxing the versioned include doesn't change what you've been
> > testing, as it's pretty
> > clear it is whatever is supported by oe-core. It's unfortunate because =
the
> > linux-%.bbappend is relaxed.
>
> git contains all the history, it was a compromise from the start to
> allow other kernels of the same version, that don't happen to be
> linux-yocto to work. We went through quite a few iterations to get
> it to work, and I often do wish we had just kept the matching more
> strict.

Sorry, I don't see any compromises in the git history.

