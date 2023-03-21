Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B22DC6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 12:45:07 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web11.11861.1679402704849565702
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 05:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QdxH3cwb;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id w4so8076208ilv.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Mar 2023 05:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679402704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwuBcOONqWlyZd1s9LR6LFF1MXTlqhNCeQVJYHusudg=;
        b=QdxH3cwbt8GWlav4doqFDlvAimmolfC0RMEFu6MvLpwx5sp1SFYvhRbOfuUuDsENCP
         CstBR+OEzFRULFRVUWvVVrcUgRws2tKzxJ+h8SyM27xGMCiDQnGiqbA56vD5/XaZmvdS
         wlJ72OH0QogCa188ekfATjs1Z81ZAkWIyQYd7OgxeLyO52iI/9RQxQIONKI5xKqsBVUe
         FT2SYmLIe4tvmgDYHeb23q8H+baIKxBNzitUxfhxpFsWO1XxOLB98zeMgz/KauwR8sV3
         M76hyrXswpWn+MUbH6EOYaYgmWWhuIJtrmdqexpR1rlif6Uy4w7oTtKeGhDfDSfIpIBK
         l2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679402704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwuBcOONqWlyZd1s9LR6LFF1MXTlqhNCeQVJYHusudg=;
        b=sYjxLPb9hisPF80yIAG8LYhbbW+MVIwTIZXtGHS3J8TcXasFfpHYnLS6xFT1S6JlHv
         7cvQbKHbh3gUwQPGaaYbgUuO+wWGKjkM1ZzuOc2U7RpR5vFMihBXQjBjkDGUx5QgsL2j
         jn8LLY1e8OLmi3uLGRbFtASfANEcSuRklT2F9P3D4X0OmuqzAIEdlCfOVeXRqBBYkTSr
         JyI9Z0H5hqyOY/nqLKiVeZdlxR16I1ju2SRglGYgSUqkzFXGpNB/XVXoSDLS+XKkF3dj
         hNykGEEbpkUOx7kF88QfeJdPB88r4PJKrOigd7a+lehZZT7xTwotIjg3JnIujAqSMPxU
         P9nA==
X-Gm-Message-State: AO0yUKUN5Z7yvWvHI24EIDiv+bFR+p+E/2/8HSGMAeP/vlWDZfHiUoJC
	GfqVx+vrvkdGS50NDRIdzuWkezvI4aHHRivKazmKpoQAr3o=
X-Google-Smtp-Source: AK7set/Dzcws0tC1yIZpfIZVTpLj/TxyYZipSpR8CBHVYt1Tjq+EwvqVsUWwvoL5Qzmei63EwlAxIFz1L2eKYAkbf7Y=
X-Received: by 2002:a92:bd02:0:b0:323:fadf:1e39 with SMTP id
 c2-20020a92bd02000000b00323fadf1e39mr796052ile.5.1679402704134; Tue, 21 Mar
 2023 05:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAEJU13K2p0aVdy5OY1pASDxC5_HLx1VAZE3m+eGxx5A5tRLNMA@mail.gmail.com>
 <174E6F79B1119D6D.22739@lists.yoctoproject.org>
In-Reply-To: <174E6F79B1119D6D.22739@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 21 Mar 2023 08:44:56 -0400
Message-ID: <CADkTA4PY5v=rN39V7zo20THoOsUkY0oyZn98TGwUuGu=n5VOCw@mail.gmail.com>
Subject: Re: [meta-virtualization] busybox_1.36.0.bb doesn't exist
To: bruce.ashfield@gmail.com
Cc: Ze Zhang <zhangze.linux@gmail.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Mar 2023 12:45:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7952

On Tue, Mar 21, 2023 at 8:38=E2=80=AFAM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> This is a bump that I do everytime OE core updates their busybox, I'm
> just completing some runtime tests and should have it pushed today.
>

Actually, cancel what I said above. I hadn't had my coffee yet, and I
thought this was about the runtime/init changes I have pending in
master.

What meta-virtualization branch are you using ? My just updated
oe-core has busybox 1.36.0, which matches the PV in
meta-virtualization, so you should have no issues.

Bruce

> Bruce
>
> On Mon, Mar 20, 2023 at 10:29=E2=80=AFPM Ze Zhang <zhangze.linux@gmail.co=
m> wrote:
> >
> >
> > HI,
> >
> > in this file meta-virtualization/tree/master/recipes-core/busybox)/busy=
box-initrd_1.36.0.bb
> >
> > busybox-initrd_1.36.0.bb should not include busybox_${PV}.bb, because b=
usybox_1.36.0.bb doesn't exist.
> >
> > require recipes-core/busybox/busybox_${PV}.bb
> >
> >
> >
> > https://github.com/lgirdk/meta-virtualization/issues/6
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7951): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7951
> Mute This Topic: https://lists.yoctoproject.org/mt/97753644/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/leave/6=
693017/1050810/978058475/xyzzy [bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

