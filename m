Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CCCC64ECC
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:02 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.39574.1650289349516128822
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Apr 2022 06:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BzoPOZrt;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id z12so17509090edl.2
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Apr 2022 06:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mW/ty4/787Kp7RU/UDweL4qfM2GBkgOjMam7m9IuQ3A=;
        b=BzoPOZrtVpIi3ywqzigf7SCZqDnoIZd52127nepzs9daWpuXDTmvNF+l2VMjSl0qnl
         oG/2rWzMsHE/jR+q1RNisDFtGDxYjwXxUjepQdD+aUXuU4cGPkXJnCR4e5j1znNyeQcH
         58+Uktut1NB11cUJXPY5JbgFeqGEe7ULLriZe/e32Re/nwf/zj9RB8KByQg/Xdi4z00l
         +kh3KxSRTk/8UuaikLBwFiGtmlYldFLKm2s+0Mxi/0XWW0YlXhTwX4IfabdeMzrwlTXy
         Zn5y410b1AQu3e0t6B6iC8yIOmO4ZXSrDTlvZl4vb9ufPsczZ4PxWABB8KquXb7ybmEL
         jKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mW/ty4/787Kp7RU/UDweL4qfM2GBkgOjMam7m9IuQ3A=;
        b=HiCSceajsQPnPWsGz3TGIso34rAyF/HWTizwxluhCrOdCatEkvFwBFZPKUiC2St3gj
         6OcfTlqiGNsQKDOKc76Gs+mSnYY1iivZuWWRw38OKWI/aWXntll62ZZ+D2DY2M7lh6N1
         TzLAj/q+2WJO9mxCPbNDZRj+Oet5L8ZvsamtpTXuWcMMQ3a5AKhh2cE98SWlwoJihB3q
         p1EPDrIFqxMZgEmx/O9EBCIY3lMyUt/K8qgZaBSjWYEKvIAaZll584+4M9NBB/beMUhi
         juDVSaMQ9G1yx+6MvjL6I+PgL/DbJnvxXtRXaKmXQ6GJz//TMsFYHup6mR+w6NZo6wU1
         7b3Q==
X-Gm-Message-State: AOAM5316NQZYNV4r7aW+VVU/Rx/JRZrgCI30WH/X3Uj97z+uIPj/4Jdv
	ljqG4HDI0KvLY0sZXvEcg0KS1iiGsE7XA3VCXsY=
X-Google-Smtp-Source: 
 ABdhPJxWXmQMMTuee0jb9BRVFzackjMf/TTrgVzK27QGEYCYDbD5JRm04H/49Xx3UMywgTOSYEPUODu9Euz7j74RIPY=
X-Received: by 2002:a05:6402:d4c:b0:410:a415:fd95 with SMTP id
 ec12-20020a0564020d4c00b00410a415fd95mr12254230edb.288.1650289347860; Mon, 18
 Apr 2022 06:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <d972d7f9cf36463185b2811362a7df11@XBOX03.axis.com>
 <CADkTA4M0=xJ8Kt0k6ZHdT7Vy4CPQkZNsFHvCHMR=-4KM9hfcgQ@mail.gmail.com>
 <5bf45976-11c1-1184-f51b-e886c8aa301e@axis.com>
 <167DCA8D5023C45A.28983@lists.yoctoproject.org>
 <CADkTA4PMFz8wa-huojDvsOOYCTPFt3sEXqLYmTTMMtkcNs3Scg@mail.gmail.com>
 <8cd4d50a-4e1f-6f67-727c-e2ca6fbcf5c6@axis.com>
 <5763bac9-78cf-97eb-1dc6-7db16ab22b34@windriver.com>
In-Reply-To: <5763bac9-78cf-97eb-1dc6-7db16ab22b34@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 18 Apr 2022 09:42:16 -0400
Message-ID: 
 <CADkTA4PY8ktGzH_0zGxzEwn+zRMy6RbbTBXr5mZ+NyEY3p88Sw@mail.gmail.com>
Subject: Re: [meta-virtualization] nerdctl
To: ChenQi <Qi.Chen@windriver.com>
Cc: Joakim Roubert <joakim.roubert@axis.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Apr 2022 14:26:02 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7183

On Mon, Apr 18, 2022 at 2:17 AM ChenQi <Qi.Chen@windriver.com> wrote:
>
> Hi Bruce and Joakim,
>
> I'm recently looking into this nerdctl recipe. I'm kind of shocked by
> the SRC_URI number in this recipe.

k3s is much, much worse.

> Looking at the discussion on the mailing list (go.bbclass: Allow network

Right, we need this for licensing, SBOM, reproducibility, etc. As you
say, there's a shocking amount of code/dependencies that are fetched
for a lot of these recipes. The version management and scaling of them
to individual recipes would be nearly impossible .. so this is my
current effort :)

> in do_compile), it seems that they are needed for offline build for this
> recipe.
>

Yes, they are (almost) all required (indirect dependency generation
isn't exact at times, so there may be a few extras that aren't used in
some build configurations).

> Bruce, how do you get all these contents? Also, how do you generate the
> modules.txt file? You mentioned some helping script in the discussion,
> what's the status of that script?

The tool is still a WIP, once we get past the current release, I'm
going to complete the cleanup and make it more widely available. It
currently isn't really usable.

The script generates the SRC_URI, the modules.txt and the vendor/
relocation parts of the recipe.

>
> Joakim, maybe I misunderstood it, but are you still working on an
> upgrade of this recipe? If not, I'm going to try to do it.

I have an in progress update here.

I'm using it to test the script in that mode, I should have the update
available in the next little while, and then the script that generates
it will follow.

Cheers,

Bruce

>
> Last but not least, Bruce, thank you again for making this recipe work.
>
> Regards,
> Qi
>
> On 3/7/22 15:30, Joakim Roubert wrote:
> > On 2022-03-04 16:48, Bruce Ashfield wrote:
> >>
> >> It took several months, but:
> >>
> >> root@qemux86-64:~# uname -a
> >> Linux qemux86-64 5.17.0-rc6-yoctodev-standard #1 SMP PREEMPT Sun Feb
> >> 27 22:36:33 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux
> >> root@qemux86-64:~# nerdctl --version
> >> nerdctl version 0.17.0-10-gf2427ff.m
> >> root@qemux86-64:~#
> >
> > Really cool!!!
> >
> >> The recipe isn't available yet, since this is using a huge amount of
> >> fetched go dependencies, using some new scripts/tooling that I created
> >> .. but at least I know the approach is feasible!
> >
> > Excellent news!
> >
> > BR,
> >
> > /Joakim
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7078): https://lists.yoctoproject.org/g/meta-virtualization/message/7078
> > Mute This Topic: https://lists.yoctoproject.org/mt/82714461/3618072
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [Qi.Chen@windriver.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

