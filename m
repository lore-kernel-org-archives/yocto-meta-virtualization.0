Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFFBC54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 14:25:19 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.12913.1709735112332443946
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 Mar 2024 06:25:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ss2aoVYP;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dcb3e6ff3fso40394285ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 06 Mar 2024 06:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709735112; x=1710339912; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wP4OC2H1isZfqejFpNu2EOYnFlUd81yqJRpW430dBhg=;
        b=Ss2aoVYPc/nrFRNf6AoyEPhsUsf4+7W8vHz2n4NGPdFOpplvOOOFJ5DZextgE0BrkL
         5HJOw/iGLp7lmixlmKuSnBRc9OYl7aJYHtlRDOmWEMv9uCsFSWu+M6bq7SBee/sQjF8T
         CXUDWXcRSz1M1LZ7zoq/hUtnLedB+dCtLYsWo9twwbwCg/mePEOPUzDPc7MoQBgEJG+c
         GZPf2fURBskFZhyVXeNJ/0xkD4c//DTgtr98LKefVi5hsjn/gC0k7MvY7Slnik499TCD
         RkHgWwh13kfgm4pzhF4RkGlMVsBNvMf2O9946eqfypGOpI2j6YG72RyoOPm0PN5MVDKv
         gyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709735112; x=1710339912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wP4OC2H1isZfqejFpNu2EOYnFlUd81yqJRpW430dBhg=;
        b=JzUl1ZY5stKwb6q99a1CpudWmUk/CP24PNRZe5KPfztf0IfOUSWJoyuToTT4LszIwJ
         2I9qEGh2Fhy1CY2wbvW04CnvzyNd8ns/lcU10Jjt050sR1JMCSYyKelkbJ/c7vteYpUm
         ZG4PwIamfXb8LW5VLyeIo47Gz/VIsTU5LNGOIbEnJTB+daIlEwsnQw9LdufR/AhLHrm4
         D6pTlvksCqlbNPkocatX/EvK7C0GjCRyP0iAVjJS6otXuQZTOvnneF6Fj5CkCltPbBfr
         qt2VHpPnqZncXWumTshHrVNpNVg1+4tbY6ZWCGMCOEDF/kVkVxve6k9LmkaPOS39eSTW
         lI+g==
X-Gm-Message-State: AOJu0Yw6goRY7BvwAlBwwog+SDPw1YgQSqU22qG6uT2uRXt2RslsP/p/
	HIRN4nKFxN96Spzuoeua3wIU2tt5XbRfV2LyMaPTIhHBSp3uPgvuj9D8iukkFjdTUVVHpaT3i3+
	40J95uOkustno5uLWbxUkkummlcc=
X-Google-Smtp-Source: AGHT+IEvsqvxPAx5wTWvhEPgpWyLJsnGz2gjQMkzxkCADbjleLRNtpWG3WOADLWlVVaAbfFyq/5qGALAx1EOWBk8zp0=
X-Received: by 2002:a17:90a:17e9:b0:299:bade:ed0b with SMTP id
 q96-20020a17090a17e900b00299badeed0bmr10937173pja.45.1709735111546; Wed, 06
 Mar 2024 06:25:11 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4Pu+VRU=nOazQGrCdJcTriVDatUOnG7P6DVi9T1AOTOBw@mail.gmail.com>
 <CAMKF1so3wHCg=Vsv8-=Pgu=P5xE1CqEb9PCg4bkaYTOnrU43ww@mail.gmail.com>
In-Reply-To: <CAMKF1so3wHCg=Vsv8-=Pgu=P5xE1CqEb9PCg4bkaYTOnrU43ww@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 6 Mar 2024 09:24:59 -0500
Message-ID: <CADkTA4NJ--Y4AGKUjZ28_=gL+TstFUCdMPV-BRP73mOPZr3JzA@mail.gmail.com>
Subject: Re: [meta-virtualization] ceph upgrade
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 06 Mar 2024 14:25:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8606

On Wed, Mar 6, 2024 at 1:38=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Tue, Mar 5, 2024 at 6:22=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gma=
il.com> wrote:
>>
>> Hi all,
>>
>> If anyone has experience with Cmake, I could use a hand completing the
>> ceph upgrade that is marked as WIP in master-next.
>>
>> It took me a few hours today, but I managed to get past python3
>> detection issues, but now I'm running into a compiler test failure
>> during the build.
>>
>> To me, it looks like our sysroot isn't being passed, which could be
>> related to the toolchain.cmake not being used (since the compiler test
>> is being launched by a sub component).
>
>
> Post the cmake error logs this might give some hints

Instead of that, I've pushed the broken recipe to master-next. The logs are=
n't
very useful because they are missing the important details.

CMake is failing a "working c compiler" test on one of the nested modules
it builds.  In particular it can't find things lke libgcc, etc.

That of course implies that the sysroot and our other toolchain options are
not making it to that level of the build. That's about all that the logs wi=
ll
tell someone.

That's the part I need help with, I have no idea how to (and everything
I've tried has failed) to get those flags picked up by that part of the
build. Other components are building file, so the toolchain environment
is not completely broken.

Assistance in that area, really does need to hands on since the logs
don't show nearly enough to debug it.

Bruce


>>
>>
>> I'm inclined to be stubborn about this, and keep working on getting
>> the package bumped, as it has missed a few upgrades and is in need of
>> some love.
>>
>> Bruce
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#8604): https://lists.yoctoproject.org/g/meta-virtual=
ization/message/8604
>> Mute This Topic: https://lists.yoctoproject.org/mt/104759213/1997914
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

