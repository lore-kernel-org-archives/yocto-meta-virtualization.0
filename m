Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA7FC433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 13:32:33 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web08.6220.1642599152756046302
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 05:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LwXZuR2L;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id m4so11436122edb.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 05:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5ptTSgGZTZt5I/KgInPkfeu0vhRIAy354WX9qi9skzc=;
        b=LwXZuR2L4gtLbD0Yj4EG8j60LSVG1o9mvMJ+//KqpyvZsH/1cUajGGXZwxnVqZyeC6
         Tl3xGlHamrxIO7ivCohdwbiYS3u82ffW3Dpii+Gr1JI7vaiYisfRzSq0Ka9bFBkuvdRw
         IOAgb46bBr5TzuhuNSVuVzGJI9id5/H9GmboW3zxRwEfvIzKXQp1O7DUbrKIOWUXanWN
         LdV6jLzyVTB2yFtFGdM54KMdXCTzMShtV3Q6Gp18qeuaiv/97Mx/5IaiHjs3zhuJH5pk
         aNIulnvzTNjlQZdEiclZ4SPMj78Gwv751FDoXxO4ehmTjTsuUPO2+6/9ksbem5clP0yr
         5M4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5ptTSgGZTZt5I/KgInPkfeu0vhRIAy354WX9qi9skzc=;
        b=waLVv0hkjqF7nLBlzkzs6vIuVHEXvxZmTseBMGdYjtU3sOzckV7TAQxEMxtEqnjpux
         Baz3CV0u0YOsC9t9OmW+2gNgLZo+z4JCmjMJun3+4NRFfL38xtTuVJ4OOFGvgdj9med8
         +HWfX6S2tqZW/97nqgYmf0bSFM//DUhqN4yyDECUbJhVLo8GrhIhcz53r+ABJ33oDP9p
         peyrjRRcL55Myu5K93QWS1z94/1Kvg3WaADz6eX5jRHgfZQ38q453k/63B6U3H1zSgLP
         d67jIEdimNjDrMxZtuHyDT7T/38zmDHuFyTtloM4+xyXb1abydJwonWp3cwERyTxKorD
         wCxA==
X-Gm-Message-State: AOAM533xaVAm++8FoydXiDFqUD8/Ib/HAhIjXW3kfQLdPlP/OA6m33fA
	XjB1JudmV2SIx64SVuI9uHFqSYA5+9oAMrEdOIw=
X-Google-Smtp-Source: 
 ABdhPJwbbidIUDhyOPXUS2E8ttvlB6UKXs55z/xDEupOX+r+Nu/fwyHDVdNICCsJeW9yCFCMSQBjGzw6jqChICZh6+8=
X-Received: by 2002:a50:f086:: with SMTP id v6mr30948763edl.94.1642599151028;
 Wed, 19 Jan 2022 05:32:31 -0800 (PST)
MIME-Version: 1.0
References: <20220117125827.464599-1-ross.burton@arm.com>
 <16CB123A6CD49E87.30851@lists.yoctoproject.org>
 <CADkTA4MR63ejM49VXLaBz_AeK60Xk0kEJ8E1dQ7CPSTAvOkQVg@mail.gmail.com>
 <CAAnfSTtTQNQmY5DZSeZ=KRQ=F5-BGkdK=OswPHfyG7OAxJnuMQ@mail.gmail.com>
 <CADkTA4NKiE208nqVhX2pbZvdvr5QREBKYZGrd3-DXz9h+HsMhg@mail.gmail.com>
 <9cca0486-323f-4882-6cd2-cbed79524b04@arm.com>
In-Reply-To: <9cca0486-323f-4882-6cd2-cbed79524b04@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 19 Jan 2022 08:32:19 -0500
Message-ID: 
 <CADkTA4OSzY1C=VKBTK4J264EQT0e+gbq5xc8Tkj7e94U_yn9JQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] python3-dtc: fix packaging by using
 setuptools
To: Peter Hoyes <Peter.Hoyes@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Ross Burton <ross@burtonini.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Jan 2022 13:32:33 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7026

On Wed, Jan 19, 2022 at 7:52 AM Peter Hoyes <Peter.Hoyes@arm.com> wrote:
>
> On 18/01/2022 13:52, Bruce Ashfield via lists.yoctoproject.org wrote:
> > On Tue, Jan 18, 2022 at 6:18 AM Ross Burton <ross@burtonini.com> wrote:
> >> On Mon, 17 Jan 2022 at 18:07, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >>> Your change + my update are now queued:
> >>>
> >>> https://git.yoctoproject.org/meta-virtualization/commit/?h=master-next&id=ed4bd1de0d2e040c303a8497ac0cd961aa8b8a7b
> >>>
> >>> If you have any cycles for test build, that would be great .. since
> >>> somehow my own build didn't notice the empty package, so I can't say I
> >>> fully trust it.
> >> SETUPTOOLS_SETUP_PATH defaults to S, so you can remove the assignment entirely.
> >>
> > done. And pushed to master.
> >
> > Bruce
> >
> >> Ross
> >
> Hi Bruce,
>
> I am now seeing the following failure on our build when attempting to
> use python3-dtc:
>
> usr/lib/python3.10/site-packages/_libfdt.cpython-310-x86_64-linux-gnu.so:
> undefined symbol: fdt_overlay_target_offset
>
> I think this is because the updated SRCREV includes 45f3d1a which
> requires libfdt to export the symbol above, but poky/dtc is still on an
> older revision. Maybe its necessary to roll back the SRCREV patch until
> poky updates?

Hmm. That's a last resort, thrashing around the SRCREVs is never a
good idea.

I'll temporarily carry a newer dtc in meta-virt to get things working.

Bruce

>
> Cheers,
>
> Peter
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

