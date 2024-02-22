Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E16CC54791
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 17:52:19 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.19358.1708624331320056673
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Feb 2024 09:52:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fncDX9MA;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e4670921a4so3223769b3a.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 09:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708624330; x=1709229130; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuWXcKtxFvF7l15v9RBWdF7+FbHydHEcsq836AlzL9M=;
        b=fncDX9MA6mXJoKThmdyhk8UgbGOYTcbhES4NTC2zYn69UAIt1vbqocJGBf11+mED0k
         qc7WtlTxCiAuNawJ1yL4Z5M9WBS5DbiiLBCecMWVpQKZXDbOXQYMcASE30VRPXNpqlEj
         AjQww5LFWYqCphww+vRNmk3+0BkOx3b62NlvJadY/Yp+IAV8TAZE8Ewdb2hwJrkNZGpj
         q+eLMUL9uWKecmb+oW+DmhRL8lZ1Qus1l7Cpwa63QJuxSAEt7fzs1KRZQ8JjFuPfDq+b
         7tdT77y3gKyg/A8tGYb+7MYNMGHImfIRwOfGmkMf3B5MK5VgDhutZxWxK59KxZ+Hrtz5
         7fPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708624330; x=1709229130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuWXcKtxFvF7l15v9RBWdF7+FbHydHEcsq836AlzL9M=;
        b=Xpy/osC1OHjJxflJNel3r1YYq1hM/PjvoWlHCsYUwIrgSJvIwJI/40/9Erv7BW5bw5
         rU5iT/kH8z4uwbXqlr0SFZHlikMIiMAZlhNxDzO17iDgiNYO36xwe9Tzh+1xbPigt+BY
         xw7mYqSCExuqpQC9bt5Q8in7cOjmw0MFil+vin7kaUWkRF/GnfG+IGUkdxwppKcUCfQ6
         Pl12rqVQuZSQRHQ5f1dbp0j2xY4OlohReR6NK+u5NcAe/gU366Y9bWee1Esetc2MVKfM
         7ymJCvaWGlmDca6lqPXr3yolvkNRI7TO6cmU+LiTvucmxduIo/0paKwmHT2Y3EizJ9p7
         9FZA==
X-Gm-Message-State: AOJu0Yy0W+5T090ahn+bry7u5bIrvs/EYGyn3yva0w18u4QE7dZStqYw
	YZXBIDm5D5b7O34F8MKJ5hHFt7InIu3Mo7IsTXv7iKE4oPvo1OiPPzwY6GkEpDWPmsd7+7PjLiz
	FiIsbqEyJW7zY7IwJx6EClhh36js=
X-Google-Smtp-Source: AGHT+IEyQ4bZ0ZEg4sub9ALOR5oxovJPzNqec58UcMdrLyq3Cp4hr4G8Lbl5+P+kBiTAb3nrfFSD+P9P1kEFmcJFjVA=
X-Received: by 2002:a05:6a21:9101:b0:1a0:b414:a53f with SMTP id
 tn1-20020a056a21910100b001a0b414a53fmr7930007pzb.23.1708624330468; Thu, 22
 Feb 2024 09:52:10 -0800 (PST)
MIME-Version: 1.0
References: <20240222162019.3154833-1-fathi.boudra@linaro.org>
 <CADkTA4Ovz6SpRXopnfUxq8cMFXzCoG=hLZ3cA5vG3VNx=Pneww@mail.gmail.com>
 <CAGNsrLChN5LWNPR7OGLHZ5305fH8Xpw91RQggV9Wrt-ek4aZzw@mail.gmail.com>
 <CADkTA4N5NUoGGrxAKsSceeKUSyc+65eDHhrJqjHbm0NXLS7tNg@mail.gmail.com> <CAGNsrLA9tUtxLRo6ezA1zxtwL6L3OParW3eOg9n5qRS_b1WGLw@mail.gmail.com>
In-Reply-To: <CAGNsrLA9tUtxLRo6ezA1zxtwL6L3OParW3eOg9n5qRS_b1WGLw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 22 Feb 2024 12:51:59 -0500
Message-ID: <CADkTA4PROZPbH-yHDpqEQ-h-0rm_Xq4KqBz8MNx58CP52Ym_JA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] linux-yocto: include: relax the
 versioned linux-yocto_*_virtualization.inc
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 17:52:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8579

On Thu, Feb 22, 2024 at 12:37=E2=80=AFPM Fathi Boudra <fathi.boudra@linaro.=
org> wrote:
>
> On Thu, 22 Feb 2024 at 18:19, Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
> >
> > On Thu, Feb 22, 2024 at 12:16=E2=80=AFPM Fathi Boudra <fathi.boudra@lin=
aro.org> wrote:
> > >
> > > On Thu, 22 Feb 2024 at 18:10, Bruce Ashfield <bruce.ashfield@gmail.co=
m> wrote:
> > > >
> > > > Unfortunately, no. I've already rejected similar patches in the pas=
t.
> > > >
> > > > The specific versioning is intentional and is going to stay. It tra=
cks
> > > > what is supported and tested in a given branch.
> > > >
> > > > If someone needs to deviate from what I'm marking as tested, they c=
an
> > > > carry a file in their layers.
> > >
> > > That's unfortunate. Let's all carry a workaround for this one-liner
> > > that hasn't changed in 4 years.
> > >
> >
> > I'm not sure what you are implying, but I am constantly changing the
> > versioned linux-yocto .inc file to match the upstream file.
> >
> > Which is exactly the point of that file, not the contents within the
> > file.
>
> Let's be clear, as you mentioned, you've rejected similar patches in the =
past.
> There's real users affected by this strict versioning and causing
> unnecessary breakage.

And let's be clear that I'm not going to trade off a few users
carrying a small tweak to their local configs / layers if they
want to support a different set of versions than I'm testing,
with even a single user thinking that the support is extended
to anything more than the versions in oe-core.  It has to be
enforced through the layer, not documentation or what people
think they know.

> Hence, I'm assuming that other users are or have been impacted and
> carry a workaround.
> Relaxing the versioned include doesn't change what you've been
> testing, as it's pretty
> clear it is whatever is supported by oe-core. It's unfortunate because th=
e
> linux-%.bbappend is relaxed.

git contains all the history, it was a compromise from the start to
allow other kernels of the same version, that don't happen to be
linux-yocto to work. We went through quite a few iterations to get
it to work, and I often do wish we had just kept the matching more
strict.

Bruce




--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

