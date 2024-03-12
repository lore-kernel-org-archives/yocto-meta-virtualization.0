Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDBDC54E5D
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 17:58:43 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.3392.1710266321120299295
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Mar 2024 10:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k5wTRN47;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d2ab9c5e83so2665641fa.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Mar 2024 10:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710266319; x=1710871119; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9VFVZz6USboWL6Z247Qtw69matJJ+WSjaE2Pxlk6X0=;
        b=k5wTRN47X4QfcE9NaO8b2sXapcPnFikXJJX6OWvKbsK9F5joLVU9djaC8rlOpPvCec
         aMAExBkZWH8Zf1YgSrRU+H0mcWJMvHYEcY5CujXVn70dQJKK/YdqPLvcdLVGbHbri1m/
         wWYB1Hc0zONyT2XjY9Y06Ky4uS9ZQwGQw8TYs1WYtAytJ1yGn1cjcgVWk3D5AQ7S0QAY
         zAXzOVOX1W2NFnBFI9vMQwBf1Yi+3wbZ7IlcOxcPYpXjJuB7CjhkDtMfthUMRmnWOXYh
         WgL3uja0+qUQUvRY9DL0rKfE1TxTi09Tb5R1NofREV/l5gEMsqGOFY9CU4h0B1RJGMCo
         QoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710266319; x=1710871119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9VFVZz6USboWL6Z247Qtw69matJJ+WSjaE2Pxlk6X0=;
        b=KFYw02lj/CbJCu+s4KycqFNOcn1oa3TS3XMV5S0tMWmOVmrmONLhf4GwLpC9nJPWAV
         pvrM7iI812D8GPdE8FPzw6greZBN2pOxjD8dmRk9XjLexdcoe8XIUiAxNhPlt5x4F60B
         zaNi4+hlndKuWibb0MbBtwHDNILkRusMfLlZ5c4JurV7mEKl1TFXCLftJtOh8mY8Nr7I
         Cb+dxyFa1tcBeZgyKQVCGn7/oBsv0MN7fXOeERF8jHViOfsBocUlIbOpyVc7mSzhjRm2
         +oaM8eyMMpygjHePJfC8j5krbQtmtvXTUNhV/GQ3QL4MTd7nZAXNvygR/TQqANja9men
         kcwg==
X-Forwarded-Encrypted: i=1; AJvYcCXsVfepB/25kCsnopjQZqiPtUQSISF/YpbN9DtINjaGeBXF1uVwLT3fOY8t7sLyyAt+8y6wXfRaNtTnwCdfLnshGN2MynjAavGM2OB9CJdprMfEf5ui3VFQOIA=
X-Gm-Message-State: AOJu0YzzTcgv8lUD0LccW3mPVXZncEUxRD2+6Dca/bKH2V4W0jrCgsEd
	k3EpNln5/ccjdpYGIQRVk8I8hT2slYfGrWFwTzwOG/1CuTBTQ/7n3d5uaZ5dAAhFY2KiI+lb0g1
	TInqvVCPiySrBAbFWpfviUv5Rqls=
X-Google-Smtp-Source: AGHT+IFZ7mwldLxHgOAYss3k+UZlESvOBH0SIPI3d0R3A2FnFZDwtfR/mDJJH3qnIEopNXhVdw+onQpDDuNq4xuVSJ0=
X-Received: by 2002:a2e:87ce:0:b0:2d4:e03:b52c with SMTP id
 v14-20020a2e87ce000000b002d40e03b52cmr2771379ljj.50.1710266318994; Tue, 12
 Mar 2024 10:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <17BA0B9342C35A1E.21429@lists.yoctoproject.org>
 <CADkTA4M9w2W+7Cio6x2DBsHf+i6TPtrodVB4p5it_oGbh0bO-w@mail.gmail.com>
 <CANx9H-B2RS3CP6xg+R3QFCYUO0a6NYTzAgjhaJuoWRjw8dq2jA@mail.gmail.com> <CADkTA4Nu=+-2Vj16G=v_tMoL+Z+SKOaMSM9VzfD5jkf0XqcUSw@mail.gmail.com>
In-Reply-To: <CADkTA4Nu=+-2Vj16G=v_tMoL+Z+SKOaMSM9VzfD5jkf0XqcUSw@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 12 Mar 2024 10:58:27 -0700
Message-ID: <CACMJ4Ga8A-nkYq6BcyWF9Ar9NTKePaqmmkj7ii0wMkS8g1770A@mail.gmail.com>
Subject: Re: [meta-virtualization] ceph upgrade
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>, 
	meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Mar 2024 17:58:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8628

On Mon, Mar 11, 2024 at 6:56=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
> On Mon, Mar 11, 2024 at 8:41=E2=80=AFPM Tim Orling <ticotimo@gmail.com> w=
rote:
> > On Mon, Mar 11, 2024 at 2:11=E2=80=AFPM Bruce Ashfield <bruce.ashfield@=
gmail.com> wrote:
> >>
> >> Hi all,
> >>
> >> I'm still looking for help with this.
> >>
> >> It's all fine and well that folks have packages that they are
> >> interested in more than others, but it needs to be more than
> >> maintainers that step up and fix the niche packages.
> >>
> >> I'm still holding the meta-virt master-next -> master push until Ceph
> >> is upgraded and working.
> >>
> >> I know absolutely nothing about CMake, so I'm flailing around in the
> >> build of Ceph and have gotten no further since I last asked for help.
> >
> > Well I did try, but I am no CMake expert nor ceph expert either. I got =
stalled on it detecting =E2=80=9Cthrift=E2=80=9D in one of the vendored lib=
raries.
>
> I ended up with that as well (just a few minutes ago), I tried setting
> some Thrift variables, but it refuses to detect those as well.
>
> The errors seem to rotate .. and it isn't even obvious if some are
> really fatal, or not.
>
> Perhaps it just isn't something that cross builds anymore, and I'll
> just blacklist it with the broken
> recipe.
>
> I'll have one more try with it tomorrow before giving up.

Hi Bruce, Tim,

I had a look at this yesterday, and I (possibly?) made some progress
with it but wanted to ask before getting too far with an approach:
would it be OK to pull out at least some of those vendored components
into some new separate recipes, so that rebuilding that compile stage
when it needs it is faster?

Christopher


>
> Bruce
>
> > We can only take so much abuse from upstream ;)
> >
> >
> >>
> >> Bruce
> >>
> >> On Tue, Mar 5, 2024 at 9:22=E2=80=AFPM Bruce Ashfield via
> >> lists.yoctoproject.org
> >> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >> >
> >> > Hi all,
> >> >
> >> > If anyone has experience with Cmake, I could use a hand completing t=
he
> >> > ceph upgrade that is marked as WIP in master-next.
> >> >
> >> > It took me a few hours today, but I managed to get past python3
> >> > detection issues, but now I'm running into a compiler test failure
> >> > during the build.
> >> >
> >> > To me, it looks like our sysroot isn't being passed, which could be
> >> > related to the toolchain.cmake not being used (since the compiler te=
st
> >> > is being launched by a sub component).
> >> >
> >> > I'm inclined to be stubborn about this, and keep working on getting
> >> > the package bumped, as it has missed a few upgrades and is in need o=
f
> >> > some love.
> >> >
> >> > Bruce
> >> >
> >> > --
> >> > - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
> >> > thee at its end
> >> > - "Use the force Harry" - Gandalf, Star Trek II
> >> >
> >> >
> >> >
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
> >>
> >>
> >>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8626): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8626
> Mute This Topic: https://lists.yoctoproject.org/mt/104759213/3619036
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
christopher.w.clark+meta-virt@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

