Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84730C433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 20:33:04 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.2219.1657744381839917442
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Jul 2022 13:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bKI2nW1M;
 spf=pass (domain: gmail.com, ip: 209.85.216.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 v4-20020a17090abb8400b001ef966652a3so5608401pjr.4
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Jul 2022 13:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a/vq11puBJlP2xbHPagvZMACe8w4jeNws9Yux/9d+0U=;
        b=bKI2nW1MtgNTNTCNastjY3uPu2XZPQXIn/1QViYtX7ISPoSjjw+XIRHgUnjuMRDgvL
         SZsHREhVyUUwlgB1QgtIyxiorUYs8nBzXld5oeL6OVZRDNGdi8bemU/bKOt/lfEhA4hy
         5ifg5AvNIzTxWSFRt6vyrja+Q4AAQcxq//JgTQCIze/E8ljVVIMvlVTEnpNuGcvoyBin
         5ocOtHHIKsGyYAv7Ah7L94eO1UGNTLkMjhfDnXTb6/Q5RJhgLVQPYKq+Ccn08rF0Qr9L
         EVss5PsdcfAeaP5A8js2fS0FhRfOwHYK3DfbWbTUzV7lbOCer3Wg5hbNkdbjhpDlWCtT
         bUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a/vq11puBJlP2xbHPagvZMACe8w4jeNws9Yux/9d+0U=;
        b=Zn2vTZnec4eeYh87WSFPbaNn5zh+4B/V+gYD1K4n1R0FYVOR2I5ahJpNZ5EDJMWEr3
         vfggUUqocLq5LHcNoGkkoWQo+VKzE1zV2Gifvbb8eEeTclKOVH5HC6+pKnBZ7Usf3uFL
         PcAHotf4CwwjXLSjVMls04z/39myWAS2nfF+HfFyOeUbqMYToLsrGnl9aXSM5meC1vGI
         pqlsZl1qpPBaEVYmRenfJD53Z8Dkc7abCKh2JzhNZbC2rOw3svOv3iGDRMOdGeCwE30c
         IJyA0AHMxXu7OlyQ92g64IQJUBbE3vXSA4m6AkmaPKPsV5gOT81ji7JZDg0Ckcg9VZ4B
         2goQ==
X-Gm-Message-State: AJIora+Ap4JeSYMAIYVVGVJt2WRRvgsJLqFePpCjwlDHUtfaq9rDMEoN
	nxm9N2ypu7+PF4D+M17MOjj8FffFfSYNJt0vN+0=
X-Google-Smtp-Source: 
 AGRyM1urj+QGeNSZUsiMzdPspeI9p1il6zNSF6KY0gjGRgilkkc4cvU1fmVUNyfSiLSc9hhUb8Z66XtM5OYNL69kv/M=
X-Received: by 2002:a17:902:b186:b0:16b:d762:6d81 with SMTP id
 s6-20020a170902b18600b0016bd7626d81mr4800940plr.88.1657744381200; Wed, 13 Jul
 2022 13:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220713110240.1294624-1-ross.burton@arm.com>
 <CACMJ4GaPEB3qvRTb+ys7bEMUTfCO_30hN7HeOa=rtzYx4MZQnQ@mail.gmail.com>
In-Reply-To: 
 <CACMJ4GaPEB3qvRTb+ys7bEMUTfCO_30hN7HeOa=rtzYx4MZQnQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 13 Jul 2022 16:32:49 -0400
Message-ID: 
 <CADkTA4O87Lzd9VxvvenhCFq3wkXf0-Kd-zZTYTB7rrEAJbw81g@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] xen: remove obsolete sdl
 PACKAGECONFIG
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>,
 meta-virtualization@lists.yoctoproject.org,
	nd <nd@arm.com>, Doug Goldstein <cardoe@cardoe.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Jul 2022 20:33:04 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7459

On Wed, Jul 13, 2022 at 3:29 PM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> On Wed, Jul 13, 2022 at 4:02 AM Ross Burton <ross.burton@arm.com> wrote:
> >
> > Nothing in Xen respects --enable-sdl, and nothing in Xen links to libSDL,
> > so this PACKAGECONFIG is obsolete.
> >
> > It looks like the last user of SDL in Xen was removed in "Remove
> > internal tools/ioemu tree"[1] back in 2008.
> >
> > [1] xen 19dc3860dcfde9bc4ec4ef35bb1337e13276f630
> >
>
> I was surprised by this but think it is correct.
> There are also no SDL header file inclusions in the Xen tools source,
> and the xen and xen-tools recipes build successfully with this patch
> applied.
>
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
>
> Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>
>

Since this is showing up on the yocto autobuilder as well, I've bumped
it up the queue and done the merge.

Bruce

> Christopher
>
>
> > ---
> >  recipes-extended/xen/xen.inc | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> > index 2bbf1e3..5937763 100644
> > --- a/recipes-extended/xen/xen.inc
> > +++ b/recipes-extended/xen/xen.inc
> > @@ -7,12 +7,10 @@ inherit autotools-brokensep pkgconfig
> >  require xen-arch.inc
> >
> >  PACKAGECONFIG ??= " \
> > -    sdl \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
> >      "
> >
> >  PACKAGECONFIG[lzo] = ",,lzo"
> > -PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
> >  PACKAGECONFIG[xsm] = "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
> >  PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd,"
> >  PACKAGECONFIG[externalblktap] = ",,,"
> > --
> > 2.34.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7453): https://lists.yoctoproject.org/g/meta-virtualization/message/7453
> > Mute This Topic: https://lists.yoctoproject.org/mt/92354872/3619036
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [christopher.w.clark+meta-virt@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

