Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A354FC5475B
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 01:56:13 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.127.1710208568081727691
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Mar 2024 18:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JGShbesf;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1dda8e5fa8dso9241285ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Mar 2024 18:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710208567; x=1710813367; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDcHz74i/d+LfsxiOfCE0utRl3csrfgiTA3NMsj/eu4=;
        b=JGShbesfbMi6BVXXgjtQUApkeCFLOIq1YbzsqBJ7xivjXr4dqCK3PdsUp9YZH2TwFW
         o7FHGSRO0lDseYhS008vrCwkNV0+KQxg6+/ddIZyM6u3bShtBZJywfXXBF37XpgFOjP9
         XNk2m+6T2Kd+RVOIEMLYuCxV4h8u4xqdAYK/SziTwDoWqk4vXcqB61FJJTCEewvwNldL
         Dg6096+WxayHftiquoUfWkFsmItwsBl3smX2NLyKSLDXh/DPlNuv1ZCkFgb9FsyDk6Fa
         zbB3TAYs/LPwCxTzk0bDoK3zwu6zxpS7GPtFm5GeGAHjwyQ859YUWkleGmULHty+rNYa
         trFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710208567; x=1710813367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDcHz74i/d+LfsxiOfCE0utRl3csrfgiTA3NMsj/eu4=;
        b=QjMzMCX+xzMwU7NcAHlkWGArgHB2CN2nXTiee8BWzL7IE1+LzAengHApy5vKf/qTnt
         OQEMfsKo3lk1OWARlGJ/QPRlMGV/q/wGbaGjnlx8A4TFIS2xR4cwc8XTRnRZT4HC+Rb5
         oi9SxAIkzf8vceRWCcLwkT9fFIEPGOiEx6K2yUsVDy816Phoec+y7p+9WoY7zYHNjGs9
         QPd5dfK6ZrnJlyLBuB9z/IBe5H2cubMvYV0Ln3+1DT/1wJKLmBmJa+etsxXPU721NFL7
         /rQvWJlqGPOuPnsVRFJQTwBE7QObT0ITOBa0ooEx6nWEdOxN8kFzs/fn0ISCHZmJSlIn
         C1hQ==
X-Gm-Message-State: AOJu0YxDZguvUgZTiLMT1+ACtgZH/5wujeLJyoTGI/EhaDA+O+9gtK2m
	PSprkTvvlC4iearOW1K02OtyH3tepMzWvdcPVXX038Fmlm6ZXokA1sA+ZaUwCdO7q7dPh+ub5vW
	VlDYOtdEF9+vBXif/6IWM5rp18kg=
X-Google-Smtp-Source: AGHT+IH1rQUMBWUnQEpEoiMxav+gYS08C2UpvrN0qSFU7x4p+ZqWNSq7i//42HD3QtNcyqU+8j8a0a+xwG1ATDsI9U8=
X-Received: by 2002:a17:90b:38d1:b0:29b:fd48:f1ab with SMTP id
 nn17-20020a17090b38d100b0029bfd48f1abmr4027816pjb.29.1710208567281; Mon, 11
 Mar 2024 18:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <17BA0B9342C35A1E.21429@lists.yoctoproject.org>
 <CADkTA4M9w2W+7Cio6x2DBsHf+i6TPtrodVB4p5it_oGbh0bO-w@mail.gmail.com> <CANx9H-B2RS3CP6xg+R3QFCYUO0a6NYTzAgjhaJuoWRjw8dq2jA@mail.gmail.com>
In-Reply-To: <CANx9H-B2RS3CP6xg+R3QFCYUO0a6NYTzAgjhaJuoWRjw8dq2jA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Mar 2024 21:55:55 -0400
Message-ID: <CADkTA4Nu=+-2Vj16G=v_tMoL+Z+SKOaMSM9VzfD5jkf0XqcUSw@mail.gmail.com>
Subject: Re: [meta-virtualization] ceph upgrade
To: Tim Orling <ticotimo@gmail.com>
Cc: meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Mar 2024 01:56:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8626

On Mon, Mar 11, 2024 at 8:41=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wro=
te:
>
>
>
> On Mon, Mar 11, 2024 at 2:11=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gm=
ail.com> wrote:
>>
>> Hi all,
>>
>> I'm still looking for help with this.
>>
>> It's all fine and well that folks have packages that they are
>> interested in more than others, but it needs to be more than
>> maintainers that step up and fix the niche packages.
>>
>> I'm still holding the meta-virt master-next -> master push until Ceph
>> is upgraded and working.
>>
>> I know absolutely nothing about CMake, so I'm flailing around in the
>> build of Ceph and have gotten no further since I last asked for help.
>
>
> Well I did try, but I am no CMake expert nor ceph expert either. I got st=
alled on it detecting =E2=80=9Cthrift=E2=80=9D in one of the vendored libra=
ries.
>

I ended up with that as well (just a few minutes ago), I tried setting
some Thrift variables, but it refuses to detect those as well.

The errors seem to rotate .. and it isn't even obvious if some are
really fatal, or not.

Perhaps it just isn't something that cross builds anymore, and I'll
just blacklist it with the broken
recipe.

I'll have one more try with it tomorrow before giving up.

Bruce

> We can only take so much abuse from upstream ;)
>
>
>>
>> Bruce
>>
>> On Tue, Mar 5, 2024 at 9:22=E2=80=AFPM Bruce Ashfield via
>> lists.yoctoproject.org
>> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>> >
>> > Hi all,
>> >
>> > If anyone has experience with Cmake, I could use a hand completing the
>> > ceph upgrade that is marked as WIP in master-next.
>> >
>> > It took me a few hours today, but I managed to get past python3
>> > detection issues, but now I'm running into a compiler test failure
>> > during the build.
>> >
>> > To me, it looks like our sysroot isn't being passed, which could be
>> > related to the toolchain.cmake not being used (since the compiler test
>> > is being launched by a sub component).
>> >
>> > I'm inclined to be stubborn about this, and keep working on getting
>> > the package bumped, as it has missed a few upgrades and is in need of
>> > some love.
>> >
>> > Bruce
>> >
>> > --
>> > - Thou shalt not follow the NULL pointer, for chaos and madness await
>> > thee at its end
>> > - "Use the force Harry" - Gandalf, Star Trek II
>> >
>> >
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#8624): https://lists.yoctoproject.org/g/meta-virtual=
ization/message/8624
>> Mute This Topic: https://lists.yoctoproject.org/mt/104759213/924729
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub =
[ticotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

