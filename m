Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F13C6FD20
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 03:11:00 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.34539.1679454656449006226
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 20:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RzHE6CSL;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id bf15so7881166iob.7
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Mar 2023 20:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679454655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZaL7+eE3n0jxcrruOj/wnnz+0FDpBpc6xWbl8TBlrCY=;
        b=RzHE6CSLtY7SMysO9a6WyYs4eVtS13zeKnx/C/+wJX9XmbypGMt4wS/8V8ftVJLb4F
         fPKpFAxPOF0J/VZ2HSkdxbGQ0bUF2VMKeXhgfo/1q9mMcjXeWEFEELxOPlUcUmzCVyug
         5kn/jWjK1Ozq1FosVBtkix0oxrl5H0TqHMieoqKpCSTC9qAlesg52o2rBQEeGmg+G30d
         CBDCF9oR8aFXHo80KUaxt+q9Pvemb5GCmZ4+xtnMORmQXTH1j8ZZbLf/BKeEHjMqvxKx
         iBOJ2TXsSgRrFO0T4TL6U1AhJyCnUDzGjsSIO1KqRApbmCmHeurxerkqXowKfesyuuIK
         y+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679454655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZaL7+eE3n0jxcrruOj/wnnz+0FDpBpc6xWbl8TBlrCY=;
        b=rck/mpD4jUXf2YqG/XbE36CFvjc/+4wWjvnB1d1fbWPHOaxJhNHd+Jhm5r7WlveBTe
         jOlIBUn6y5/S3m/1+Lm93E0qeQPhbmrqRAcR+7CbmAF1e+AzNWOk6jGp5Sv6V0NWK+vZ
         GAQOQhAaU2P61vcTXCOgs5mngmZofb6VMsCfWAq9r1P1RFMhN+0GwOEIHKQh4+2xZe78
         GArwmMtH2o2m/zOgCQxeeOpJ4XGystLrCv9+asN9qaTQoo3oS3hzJmEEUwUNe0D0VipA
         l0umozwQRv1LJ8sGq96ocSASAM+pVqBavBS5MhAtxwLvRLmuZ2Ej547Se0OGoGp20E0f
         IBKg==
X-Gm-Message-State: AO0yUKUPVkvBrtKzy4l0VuHvGUzllh9Zp4GQrRa5SofXlPneRjtA3D08
	jdEMKkOTYWpcUOKLm98sdXr1z3Ppl4nOCeQg16k=
X-Google-Smtp-Source: AK7set+JI6XLiNUPll99x36uXtgsD7mkP1mtLdvC64LlmqwD2B9BozUK4K3BAvsAC2CdLKW6ZoPhtkFUiLpK3Vhgqpk=
X-Received: by 2002:a6b:7a05:0:b0:744:f5bb:6e60 with SMTP id
 h5-20020a6b7a05000000b00744f5bb6e60mr2175872iom.1.1679454655610; Tue, 21 Mar
 2023 20:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAEJU13K2p0aVdy5OY1pASDxC5_HLx1VAZE3m+eGxx5A5tRLNMA@mail.gmail.com>
 <174E6F79B1119D6D.22739@lists.yoctoproject.org> <CADkTA4PY5v=rN39V7zo20THoOsUkY0oyZn98TGwUuGu=n5VOCw@mail.gmail.com>
 <CAEJU13JHseZDdEV49KiorFnMWOBCnAmvDBJZ3d5oxQesX4sqDg@mail.gmail.com>
In-Reply-To: <CAEJU13JHseZDdEV49KiorFnMWOBCnAmvDBJZ3d5oxQesX4sqDg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 21 Mar 2023 23:10:49 -0400
Message-ID: <CADkTA4PoDbUSP77uwd0owMCE5xWp6Man+AqnFsGO=4EKwO-6FA@mail.gmail.com>
Subject: Re: [meta-virtualization] busybox_1.36.0.bb doesn't exist
To: Ze Zhang <zhangze.linux@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Mar 2023 03:11:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7953

mickledore hasn't been released, and will come from oe-core master. So
I'm not sure what you are using, but it is 1.36.0 for the version
there.

I only branch meta-virt once I've stabilized post release of oe-core,
which is typically a week or so after release.

Bruce

On Tue, Mar 21, 2023 at 7:58=E2=80=AFPM Ze Zhang <zhangze.linux@gmail.com> =
wrote:
>
> hi,  I use the master branch of meta-virtualization,
> my yocto version is : mickledore, but it has busybox version 1.35,
> and there is no mickledore branch in meta-virtualization, maybe you shoul=
d create a mickledore branch for meta-virtualization.
> thanks a lot.
>
> Bruce Ashfield <bruce.ashfield@gmail.com> =E4=BA=8E2023=E5=B9=B43=E6=9C=
=8821=E6=97=A5=E5=91=A8=E4=BA=8C 20:45=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On Tue, Mar 21, 2023 at 8:38=E2=80=AFAM Bruce Ashfield via
>> lists.yoctoproject.org
>> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>> >
>> > This is a bump that I do everytime OE core updates their busybox, I'm
>> > just completing some runtime tests and should have it pushed today.
>> >
>>
>> Actually, cancel what I said above. I hadn't had my coffee yet, and I
>> thought this was about the runtime/init changes I have pending in
>> master.
>>
>> What meta-virtualization branch are you using ? My just updated
>> oe-core has busybox 1.36.0, which matches the PV in
>> meta-virtualization, so you should have no issues.
>>
>> Bruce
>>
>> > Bruce
>> >
>> > On Mon, Mar 20, 2023 at 10:29=E2=80=AFPM Ze Zhang <zhangze.linux@gmail=
.com> wrote:
>> > >
>> > >
>> > > HI,
>> > >
>> > > in this file meta-virtualization/tree/master/recipes-core/busybox)/b=
usybox-initrd_1.36.0.bb
>> > >
>> > > busybox-initrd_1.36.0.bb should not include busybox_${PV}.bb, becaus=
e busybox_1.36.0.bb doesn't exist.
>> > >
>> > > require recipes-core/busybox/busybox_${PV}.bb
>> > >
>> > >
>> > >
>> > > https://github.com/lgirdk/meta-virtualization/issues/6
>> >
>> >
>> >
>> > --
>> > - Thou shalt not follow the NULL pointer, for chaos and madness await
>> > thee at its end
>> > - "Use the force Harry" - Gandalf, Star Trek II
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#7951): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/7951
>> > Mute This Topic: https://lists.yoctoproject.org/mt/97753644/1050810
>> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/leav=
e/6693017/1050810/978058475/xyzzy [bruce.ashfield@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

