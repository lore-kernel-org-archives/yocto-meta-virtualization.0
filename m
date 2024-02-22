Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61340C5478C
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 18:03:19 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.19618.1708624992596655968
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Feb 2024 10:03:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c7t8AyZR;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2997cb49711so52308a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 10:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708624992; x=1709229792; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNXli1z9Cth0Tdm2sOaJLZVaQNhbA3N+uvymPy8IX08=;
        b=c7t8AyZRQEe/cAWVqyQUelvjb+KPXFtzvfQH1lg7VnK64PEIsL9A4u/EJFDfKpaEKW
         q7ZVRjYwfnwT/gxtaqRVb67oVXn/ytJnVSauLIJI/Um9MGLcdo2zJ8QVbYBjp5OqoUZ6
         JebOYnrOXj5ULVruwd3vv3j062KD/1ATpoucWutHRQh5ow15R4f1Idk6BPsA61FDfn+j
         IS6G9eR8ZAcjtyfwny6Bs3Qk6c3rAlH/uBHX2T4YYw5gTVhW4HTO2XOjGo5LKe1fEw4p
         4kaJ09NI8nywZ5jFFW8uw9B/gGGaRyTN8SP/5+rlbPVUmpRreIL+h37fbUCCJj/MdwlZ
         SmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708624992; x=1709229792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNXli1z9Cth0Tdm2sOaJLZVaQNhbA3N+uvymPy8IX08=;
        b=kEab3BnXlpnj/78FfPesI2YTiDaGhv7xwp4VChwDWCvDD18PMwmGEbun+HhJ5dFg62
         DnPZMG4//J/CA+Zb8K8VazBHtgTf3/pgeJ8rFdM/0VGjYQwiGYk1M0vjDcsGBoF9jSkI
         9JqpaxeObZrlLD9CXJA5Jcr2WATf74xSFH4ExLggyUV9B8Umz7mR7aJbTcZNNhedVDdy
         unqTiVO/Yfk9TpkI3r/owuavZkTfCJk1IA2Y7pxfTURuoPwhabNwWH4anhiJwCukqxln
         TKXTbScJlpny0qqQDtC3WV1dg0aj0XH85ofFM2f/OLychiEkniLRh1jbC1kg9mv/gEQI
         smxg==
X-Gm-Message-State: AOJu0YxWO5hrN6y5adTtbLk5Iose6LxQxRKJeLE8EKMlVS/1HTBt9gvO
	cB2tUjYw8mw3Vg54IpXWf3fCHFgwj4zO572V9ADbaEwire8J/519OaqWdXfsGhMqg93lLIDPnF+
	fuAnbD3mb7m9qDeGbkON/s4vVrGI=
X-Google-Smtp-Source: AGHT+IH6YrDHwFFG1jjGgjj2lAN4rKgvN5jRrHL2Esm4ttHK123ZKGSS27ggUmfNmv9NIV0H5iep4C2MyoBm6q4sJcY=
X-Received: by 2002:a17:90b:904:b0:299:e313:b0ad with SMTP id
 bo4-20020a17090b090400b00299e313b0admr8724800pjb.9.1708624991997; Thu, 22 Feb
 2024 10:03:11 -0800 (PST)
MIME-Version: 1.0
References: <20240222162019.3154833-1-fathi.boudra@linaro.org>
 <CADkTA4Ovz6SpRXopnfUxq8cMFXzCoG=hLZ3cA5vG3VNx=Pneww@mail.gmail.com>
 <CAGNsrLChN5LWNPR7OGLHZ5305fH8Xpw91RQggV9Wrt-ek4aZzw@mail.gmail.com>
 <CADkTA4N5NUoGGrxAKsSceeKUSyc+65eDHhrJqjHbm0NXLS7tNg@mail.gmail.com>
 <CAGNsrLA9tUtxLRo6ezA1zxtwL6L3OParW3eOg9n5qRS_b1WGLw@mail.gmail.com>
 <CADkTA4PROZPbH-yHDpqEQ-h-0rm_Xq4KqBz8MNx58CP52Ym_JA@mail.gmail.com> <CAGNsrLD5Gii+sBrPf_ggYTgDPvNK4cqMBF1+HiPVaju4n99h5Q@mail.gmail.com>
In-Reply-To: <CAGNsrLD5Gii+sBrPf_ggYTgDPvNK4cqMBF1+HiPVaju4n99h5Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 22 Feb 2024 13:03:00 -0500
Message-ID: <CADkTA4NOcFx1GEH7ip97m5C3H0O6AuKJHjuARJCO+s8grqrWtw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] linux-yocto: include: relax the
 versioned linux-yocto_*_virtualization.inc
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 18:03:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8581

On Thu, Feb 22, 2024 at 12:59=E2=80=AFPM Fathi Boudra <fathi.boudra@linaro.=
org> wrote:
>
> On Thu, 22 Feb 2024 at 18:52, Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
> >
> > On Thu, Feb 22, 2024 at 12:37=E2=80=AFPM Fathi Boudra <fathi.boudra@lin=
aro.org> wrote:
> > >
> > > On Thu, 22 Feb 2024 at 18:19, Bruce Ashfield <bruce.ashfield@gmail.co=
m> wrote:
> > > >
> > > > On Thu, Feb 22, 2024 at 12:16=E2=80=AFPM Fathi Boudra <fathi.boudra=
@linaro.org> wrote:
> > > > >
> > > > > On Thu, 22 Feb 2024 at 18:10, Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
> > > > > >
> > > > > > Unfortunately, no. I've already rejected similar patches in the=
 past.
> > > > > >
> > > > > > The specific versioning is intentional and is going to stay. It=
 tracks
> > > > > > what is supported and tested in a given branch.
> > > > > >
> > > > > > If someone needs to deviate from what I'm marking as tested, th=
ey can
> > > > > > carry a file in their layers.
> > > > >
> > > > > That's unfortunate. Let's all carry a workaround for this one-lin=
er
> > > > > that hasn't changed in 4 years.
> > > > >
> > > >
> > > > I'm not sure what you are implying, but I am constantly changing th=
e
> > > > versioned linux-yocto .inc file to match the upstream file.
> > > >
> > > > Which is exactly the point of that file, not the contents within th=
e
> > > > file.
> > >
> > > Let's be clear, as you mentioned, you've rejected similar patches in =
the past.
> > > There's real users affected by this strict versioning and causing
> > > unnecessary breakage.
> >
> > And let's be clear that I'm not going to trade off a few users
> > carrying a small tweak to their local configs / layers if they
> > want to support a different set of versions than I'm testing,
> > with even a single user thinking that the support is extended
> > to anything more than the versions in oe-core.  It has to be
> > enforced through the layer, not documentation or what people
> > think they know.
>
> You have no clue about how many users are affected.

And you have no idea about what I do, or don't know.

This conversation is over as it is no longer even remotely productive.

Bruce

>
> > > Hence, I'm assuming that other users are or have been impacted and
> > > carry a workaround.
> > > Relaxing the versioned include doesn't change what you've been
> > > testing, as it's pretty
> > > clear it is whatever is supported by oe-core. It's unfortunate becaus=
e the
> > > linux-%.bbappend is relaxed.
> >
> > git contains all the history, it was a compromise from the start to
> > allow other kernels of the same version, that don't happen to be
> > linux-yocto to work. We went through quite a few iterations to get
> > it to work, and I often do wish we had just kept the matching more
> > strict.
>
> Sorry, I don't see any compromises in the git history.



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

