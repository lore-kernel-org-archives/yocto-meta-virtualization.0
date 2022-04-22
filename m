Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDE5C35295
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:51:59 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web09.3806.1650595374942571105
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Apr 2022 19:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m8GV/KCU;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id r13so13657457ejd.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Apr 2022 19:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TNmwaVmisujO9Ki1kdBp8MlJKCcLc2v8qmZviWufl/c=;
        b=m8GV/KCUcR5Wpub2kc3369mDnIdxXrIbkxL9qnh2eGug07XcbGq2vC2ps6mC49THNj
         +w9HhixzM6MdD0pA5xUVKfUHJlLJLK7+9YU2BK3KCM6Ejyvef6AZz2Htvo6laVA2c5K1
         XhCjOK36LwM0IZywvaz+ixFMSjlDW2cilwU63tifsR5k4gCoh0IJTC//xOaVl83fdE8l
         KHYtOnSqmAdqxqKCOqAASxk781uUeR3s8/9fkSo1iDb17hSknY5G0UjwkABugn59c95K
         mhxwG1a6BzcilfUFCkdq9Y9JgmYEpVfftfhfc1kB9gINRUwfREVqoeTfNnHHy/q8htKU
         mHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TNmwaVmisujO9Ki1kdBp8MlJKCcLc2v8qmZviWufl/c=;
        b=YFWChJ57e8UQs1XYBxLLsNPw8fhvG4bVewMBDq9nb7jav+3kt7zDCwffZfG9tHEVDV
         Kw7jnqBR546wFdrFz3l41sBYJzaFXzXUtH/AGF9qxVVhHDofq/AGFpuFQC+mvokJi15p
         uFEDLA4hcBMXRBi4XRUanN/xBYcktkSHoxJTovWwS7G+yw2c6v0IAM+X9xnTrClWN2TT
         TR4I8ODukFU3wHgxyKg6R2xfN918S/Grop1hgMdDqOENRPBgK9WGYpK/g1IEhMnEI0vh
         2o8f9P5Mr2Euj2agzbEpuIzbhQFOt/NveOxrTCiRvYqv20ULU/Rz181q+qOP3NFXABfX
         jDCw==
X-Gm-Message-State: AOAM533+7GJVbzSV7amouP/fipJIqDcZ3y3+Po6M9Ddcc9Dq+kVzFoz8
	5QM1HTgr0VwBCDiDxt0Q+9XmaIBinDAH+9WT7XU=
X-Google-Smtp-Source: 
 ABdhPJysN+I1tDYSw5bxDqqn5JGbRS63Pmz4HqrMAe6Syz+En4hRDy3reLBdX8iqD3m+NMD03naxlAgQQqov55id2Xs=
X-Received: by 2002:a17:907:3f04:b0:6e8:4b0e:438d with SMTP id
 hq4-20020a1709073f0400b006e84b0e438dmr2081520ejc.391.1650595373044; Thu, 21
 Apr 2022 19:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <d972d7f9cf36463185b2811362a7df11@XBOX03.axis.com>
 <CADkTA4M0=xJ8Kt0k6ZHdT7Vy4CPQkZNsFHvCHMR=-4KM9hfcgQ@mail.gmail.com>
 <5bf45976-11c1-1184-f51b-e886c8aa301e@axis.com>
 <167DCA8D5023C45A.28983@lists.yoctoproject.org>
 <CADkTA4PMFz8wa-huojDvsOOYCTPFt3sEXqLYmTTMMtkcNs3Scg@mail.gmail.com>
 <8cd4d50a-4e1f-6f67-727c-e2ca6fbcf5c6@axis.com>
 <5763bac9-78cf-97eb-1dc6-7db16ab22b34@windriver.com>
 <CADkTA4PY8ktGzH_0zGxzEwn+zRMy6RbbTBXr5mZ+NyEY3p88Sw@mail.gmail.com>
 <b441020b-fb1c-4c18-0439-2c408f577f4d@windriver.com>
In-Reply-To: <b441020b-fb1c-4c18-0439-2c408f577f4d@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 21 Apr 2022 22:42:42 -0400
Message-ID: 
 <CADkTA4Na4tQ_q6ChGBN+mDgLT0V=ahU-NoUH0viMEmjjVQ-mTQ@mail.gmail.com>
Subject: Re: [meta-virtualization] nerdctl
To: ChenQi <Qi.Chen@windriver.com>
Cc: Joakim Roubert <joakim.roubert@axis.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:51:59 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7208

On Thu, Apr 21, 2022 at 10:38 PM ChenQi <Qi.Chen@windriver.com> wrote:
>
> Hi Bruce,
>
> I found that the nerdctl does not work on qemuarm. After tracking down
> the problem, I found that it's caused by CONFIG_OABI_COMPAT being
> enabled for qemuarm. It needs to be disabled for SECCOMP_FILTER to work,
> which is needed by nerdctl.
>
> Looking at the help message of 'CONFIG_OABI_COMPAT', it seems that it's
> pretty safe for us to disable it as we build things from scratch. And it
> suggests that "If in doubt say N.".
>
> Do you think this option should be disabled by default in yocto's kernel
> config?

Yes, it can be changed to =n at this point, but we still want to be
explicit and not take any defaults. It was a transitional ABI setting
.. almost 10 years ago. We can safely say that the transition period
is over.

As well as changing it to disabled, we should create a new fragment
with a name like "enable-oabi.scc" and the associated
"enable-oabi.cfg" that could be used via KERNEL_FEATURES to enable the
OABI functionality if anyone really needs it.

Bruce

>
> Regards,
> Qi
>
> On 4/18/22 21:42, Bruce Ashfield wrote:
> > On Mon, Apr 18, 2022 at 2:17 AM ChenQi <Qi.Chen@windriver.com> wrote:
> >> Hi Bruce and Joakim,
> >>
> >> I'm recently looking into this nerdctl recipe. I'm kind of shocked by
> >> the SRC_URI number in this recipe.
> > k3s is much, much worse.
> >
> >> Looking at the discussion on the mailing list (go.bbclass: Allow network
> > Right, we need this for licensing, SBOM, reproducibility, etc. As you
> > say, there's a shocking amount of code/dependencies that are fetched
> > for a lot of these recipes. The version management and scaling of them
> > to individual recipes would be nearly impossible .. so this is my
> > current effort :)
> >
> >> in do_compile), it seems that they are needed for offline build for this
> >> recipe.
> >>
> > Yes, they are (almost) all required (indirect dependency generation
> > isn't exact at times, so there may be a few extras that aren't used in
> > some build configurations).
> >
> >> Bruce, how do you get all these contents? Also, how do you generate the
> >> modules.txt file? You mentioned some helping script in the discussion,
> >> what's the status of that script?
> > The tool is still a WIP, once we get past the current release, I'm
> > going to complete the cleanup and make it more widely available. It
> > currently isn't really usable.
> >
> > The script generates the SRC_URI, the modules.txt and the vendor/
> > relocation parts of the recipe.
> >
> >> Joakim, maybe I misunderstood it, but are you still working on an
> >> upgrade of this recipe? If not, I'm going to try to do it.
> > I have an in progress update here.
> >
> > I'm using it to test the script in that mode, I should have the update
> > available in the next little while, and then the script that generates
> > it will follow.
> >
> > Cheers,
> >
> > Bruce
> >
> >> Last but not least, Bruce, thank you again for making this recipe work.
> >>
> >> Regards,
> >> Qi
> >>
> >> On 3/7/22 15:30, Joakim Roubert wrote:
> >>> On 2022-03-04 16:48, Bruce Ashfield wrote:
> >>>> It took several months, but:
> >>>>
> >>>> root@qemux86-64:~# uname -a
> >>>> Linux qemux86-64 5.17.0-rc6-yoctodev-standard #1 SMP PREEMPT Sun Feb
> >>>> 27 22:36:33 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux
> >>>> root@qemux86-64:~# nerdctl --version
> >>>> nerdctl version 0.17.0-10-gf2427ff.m
> >>>> root@qemux86-64:~#
> >>> Really cool!!!
> >>>
> >>>> The recipe isn't available yet, since this is using a huge amount of
> >>>> fetched go dependencies, using some new scripts/tooling that I created
> >>>> .. but at least I know the approach is feasible!
> >>> Excellent news!
> >>>
> >>> BR,
> >>>
> >>> /Joakim
> >>>
> >>> -=-=-=-=-=-=-=-=-=-=-=-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#7078): https://lists.yoctoproject.org/g/meta-virtualization/message/7078
> >>> Mute This Topic: https://lists.yoctoproject.org/mt/82714461/3618072
> >>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [Qi.Chen@windriver.com]
> >>> -=-=-=-=-=-=-=-=-=-=-=-
> >>>
> >
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

