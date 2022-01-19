Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCCD4C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 18:22:57 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.376.1642616576223685576
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 10:22:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kpExHYMo;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id n10so1606506edv.2
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 10:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=smkneSxGqN6S7s42aJsMbYwdOxxAZQeQxBtr7PRCZx0=;
        b=kpExHYMol1/wMjLvo6qZ+4A0NppCLqj31IH7jML9dRu2YqaXdv+LT79bE2aKLvhtsj
         itmGikKL8Woq1D2V2lE5XthtZQkBqKVgYAzkWBcTIYT8VP55ggCDilOSSY9CnG6dksZ5
         zu/VjeikKLknq9xznPGKs/g/ySlw02M2h+JfRnXLYD1KAR5eiaZgP+qG0cCWO5pm2sHs
         5i5UFgUYROhAD/qdjaBtyggGNFeYD1UUNW+wRyl5fGNf3TH/IO3/eSzORA4bpsRp3ihD
         n632bjuEJjcmzFAMYMiTpZLnEmVjR0zdlh25g9koDxGhfi4j7xBmyomSD+aHFXKuLkfL
         ab0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=smkneSxGqN6S7s42aJsMbYwdOxxAZQeQxBtr7PRCZx0=;
        b=SsHfpOS6DrhIhGLeVMF5J8lINdl3cfcGwnAuBgiWeWGzq4SzjMyX7a92IWgfB+A08R
         rj2tBPJ/pU9z6Rfym5/Je1rr+vKo2+1MQNpw+P5+EsEb0bp8tf2pW72eNb1HwjKdi74D
         Ls/WUoSTxi/KeoO7y41f5+P4vG8Gss7MxKyEAZijf8m4q6YBUV1dsY/z30e/OE3m6C8n
         zYI5XjrwmBehU01AwfKMSX4KErvSZXftgP8KyWKYvTk98JctCOGighF9+kZZHPI6T4TQ
         RTfphIkM6uNOJt+U2wpapQIQ0zJEV2aYDhS2GvcB9DTLGs1syEw2smvAynBZ128GUt0g
         Dwkw==
X-Gm-Message-State: AOAM532432Y6KeyHzBJPXP2A9mwbEl5zyWORkrO6HZvjT/AAFa56+mE0
	iPqFGpeyVjfD+9ACgAXC/HWzVKHDk/+cEZmWgjg=
X-Google-Smtp-Source: 
 ABdhPJzEsy4OiaEdMN97UW+y3tPw3NXBsHUqycmeu1tzebpjR5/iGTpmE7b0o4tnLgFAXO8fR/VBkHytrBZpTHZ2TSM=
X-Received: by 2002:a05:6402:d0d:: with SMTP id
 eb13mr16377222edb.349.1642616574596;
 Wed, 19 Jan 2022 10:22:54 -0800 (PST)
MIME-Version: 1.0
References: <20220117125827.464599-1-ross.burton@arm.com>
 <16CB123A6CD49E87.30851@lists.yoctoproject.org>
 <CADkTA4MR63ejM49VXLaBz_AeK60Xk0kEJ8E1dQ7CPSTAvOkQVg@mail.gmail.com>
 <CAAnfSTtTQNQmY5DZSeZ=KRQ=F5-BGkdK=OswPHfyG7OAxJnuMQ@mail.gmail.com>
 <CADkTA4NKiE208nqVhX2pbZvdvr5QREBKYZGrd3-DXz9h+HsMhg@mail.gmail.com>
 <9cca0486-323f-4882-6cd2-cbed79524b04@arm.com>
 <16CBAF3A238F1F77.17710@lists.yoctoproject.org>
In-Reply-To: <16CBAF3A238F1F77.17710@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 19 Jan 2022 13:22:43 -0500
Message-ID: 
 <CADkTA4MVHKHWpFep-+JcNw+BU0UNxgq792vPdirXX+wL7czTwQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] python3-dtc: fix packaging by using
 setuptools
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>,
 meta-virtualization@lists.yoctoproject.org,
	Ross Burton <ross@burtonini.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Jan 2022 18:22:57 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7029

On Wed, Jan 19, 2022 at 8:32 AM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> On Wed, Jan 19, 2022 at 7:52 AM Peter Hoyes <Peter.Hoyes@arm.com> wrote:
> >
> > On 18/01/2022 13:52, Bruce Ashfield via lists.yoctoproject.org wrote:
> > > On Tue, Jan 18, 2022 at 6:18 AM Ross Burton <ross@burtonini.com> wrote:
> > >> On Mon, 17 Jan 2022 at 18:07, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > >>> Your change + my update are now queued:
> > >>>
> > >>> https://git.yoctoproject.org/meta-virtualization/commit/?h=master-next&id=ed4bd1de0d2e040c303a8497ac0cd961aa8b8a7b
> > >>>
> > >>> If you have any cycles for test build, that would be great .. since
> > >>> somehow my own build didn't notice the empty package, so I can't say I
> > >>> fully trust it.
> > >> SETUPTOOLS_SETUP_PATH defaults to S, so you can remove the assignment entirely.
> > >>
> > > done. And pushed to master.
> > >
> > > Bruce
> > >
> > >> Ross
> > >
> > Hi Bruce,
> >
> > I am now seeing the following failure on our build when attempting to
> > use python3-dtc:
> >
> > usr/lib/python3.10/site-packages/_libfdt.cpython-310-x86_64-linux-gnu.so:
> > undefined symbol: fdt_overlay_target_offset
> >
> > I think this is because the updated SRCREV includes 45f3d1a which
> > requires libfdt to export the symbol above, but poky/dtc is still on an
> > older revision. Maybe its necessary to roll back the SRCREV patch until
> > poky updates?
>
> Hmm. That's a last resort, thrashing around the SRCREVs is never a
> good idea.
>
> I'll temporarily carry a newer dtc in meta-virt to get things working.

I split the difference.

The PV was wrong on the updated package anyway, so I've pushed a
change that uses SRCPV to show that I'm running ahead of oe-core DTC,
and I've reverted the one commit that introduces the problematic
symbol.

This gets me what I need for lopper, and I can now build and construct
xen-image-mininal for qemuarm64

Bruce


>
> Bruce
>
> >
> > Cheers,
> >
> > Peter
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7026): https://lists.yoctoproject.org/g/meta-virtualization/message/7026
> Mute This Topic: https://lists.yoctoproject.org/mt/88482921/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

