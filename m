Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27090C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:48:22 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.8504.1646408900460270165
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Mar 2022 07:48:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ISXX8ZLo;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id q17so11294777edd.4
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Mar 2022 07:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=90fPt9v+2M5gEy1wdX9Yf+K+00y5VecS9+1kTgf/RIg=;
        b=ISXX8ZLoA/d33u6DD2EexSo0apt6yFo6wioMUtofW4R9dGP2HiqrUF82/D27GOTF5X
         d0DMfrrPSxg/kWl86lTt/hkJp6zhLySGg262KbRbD+aSL7OcvL3EBjAJRu0NRFZztZSd
         AZw1DC/NOoZ33xq/AhQhOm9qAo7mlBaAg3QX3hs+7QqHBNHnxDQv47dkCzQis0ViUXvM
         9AvHFbSszNYWBVziIeFgEElVE63GzDduIet5n+HaMqtatEit2MYG/YbmHz0UZGqKl91L
         MLlhjMJYYbrEF/g9YBaHbU4CPo9FzAPKDYKH/beDVILykOpjpDSOB6UVJJOm8IV2RseW
         RN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=90fPt9v+2M5gEy1wdX9Yf+K+00y5VecS9+1kTgf/RIg=;
        b=yDtLd1jAil1u9F+W500LzDCsg7QjKUIOv3hEZ9RCK02oHwn3QMHplavj5Ob9KOr26A
         JHTel9GUG/SSJ0ZrK58DuydPtGMsLnFf6OcG3Ij/frX1WkVLbKAABU7x8uXN5kTEeIQx
         nCWMZ4Mc8hxy6n2LtfMo9P9BJ+Sr2nn8Oo1FgfLLJKZQpLF8ZJWd+eWt/8+eil635NiN
         P/r4Av9TwzF3wqTTiMot8qajZqWx6uUr/6qIMqH9kDUlpkdtN4QbA8eU8xXpN8/+Rmyf
         fO49SiZ+R1d4KTuL0MIsLrOsjslLL8O4q1A8mFoW8osDVYAsptjdDr5h7bXSqlGxiZIk
         Q93A==
X-Gm-Message-State: AOAM531KQrqrs0YTImFGC1iCLlBs7K8r4VlGmBd2oU+3/1iayYfBA9oj
	q3uA5cl3biG5pij9llc2bcZ1ScyoSaNB2Hfx5D4=
X-Google-Smtp-Source: 
 ABdhPJwYNteR+y6Xhti8o4Et2BYe2bZnhqv3aNmylz5sNQkno9H34F6ylKyI1Rag2BK8z79EIShD1VHkJ01gUBUSkKI=
X-Received: by 2002:a05:6402:510c:b0:415:baf2:44ee with SMTP id
 m12-20020a056402510c00b00415baf244eemr13365458edd.141.1646408898845; Fri, 04
 Mar 2022 07:48:18 -0800 (PST)
MIME-Version: 1.0
References: <d972d7f9cf36463185b2811362a7df11@XBOX03.axis.com>
 <CADkTA4M0=xJ8Kt0k6ZHdT7Vy4CPQkZNsFHvCHMR=-4KM9hfcgQ@mail.gmail.com>
 <5bf45976-11c1-1184-f51b-e886c8aa301e@axis.com>
 <167DCA8D5023C45A.28983@lists.yoctoproject.org>
In-Reply-To: <167DCA8D5023C45A.28983@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 4 Mar 2022 10:48:07 -0500
Message-ID: 
 <CADkTA4PMFz8wa-huojDvsOOYCTPFt3sEXqLYmTTMMtkcNs3Scg@mail.gmail.com>
Subject: Re: [meta-virtualization] nerdctl
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Joakim Roubert <joakim.roubert@axis.com>,
 meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Mar 2022 15:48:22 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7077

On Mon, May 10, 2021 at 3:15 PM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> On Mon, May 10, 2021 at 12:59 PM Joakim Roubert <joakim.roubert@axis.com> wrote:
> >
> > On 2021-05-10 14:10, Bruce Ashfield wrote:
> > >
> > > I'm actually already working on it, and have been for about a month.
> >
> > Awesome!!
> >
> > > There's a few build issues remaining, but I expect to have it done in
> > > the not to distant future.
> >
> > Great news, makes me think of that old movie title "Bruce Almighty".
> > Kudos!
>
> Ha. I wouldn't say that :D
>
> When I was working on k3s I was adding sanity tests for containerd and
> was reading about nerctl and the docker-like interface it provided ..
> so I thought it was a good idea.
>
> The issue with the recipe, is that it has an insane amount of go
> dependencies and is heavily go.mod based.  I had 0.7x nearly working,
> with only some go build errors due to may layout of the source not
> being quite right .. I attempted to update to 0.8.x recently and the
> amount of SRC_URI churn was huge .. so I wrote myself some helper
> tools to generate things.
>
> I'm still working through the fallout of that 0.8.x update, but
> hopefully I'll get through it shortly.

(resending with the list address fixed)

It took several months, but:

root@qemux86-64:~# uname -a
Linux qemux86-64 5.17.0-rc6-yoctodev-standard #1 SMP PREEMPT Sun Feb
27 22:36:33 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux
root@qemux86-64:~# nerdctl --version
nerdctl version 0.17.0-10-gf2427ff.m
root@qemux86-64:~#

The recipe isn't available yet, since this is using a huge amount of
fetched go dependencies, using some new scripts/tooling that I created
.. but at least I know the approach is feasible!

Bruce

>
> Bruce
>
> >
> > BR,
> >
> > /J
> >
> >
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
> View/Reply Online (#6501): https://lists.yoctoproject.org/g/meta-virtualization/message/6501
> Mute This Topic: https://lists.yoctoproject.org/mt/82714461/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

