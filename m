Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7949DC433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 17:00:27 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web11.9416.1653498024629201262
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 May 2022 10:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AFA6JVqj;
 spf=pass (domain: gmail.com, ip: 209.85.217.42,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id j7so21256310vsj.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 May 2022 10:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CfTZ++m6vux3LGNZLJpWCfzCuL5mZTcYP237yMmBD0g=;
        b=AFA6JVqjn4e4dDP0iGKv5Krp4DPKSXK/u8F9SdiofHFxSYYUC+G6cJtXWf4XrGuCj0
         kxyBrXFgwAzcCIemMoTB3YtV7EKbr0q5Lia/bfaPUDPaitDSifOde5MUHQrV/AuI+pmb
         fg4S5FG6OLXsPSa9b3x2cHVnSMA6qTtm4noLmFUvGrQ7uGE/yecw6uvfYtxrYBpyqeIW
         tkJXnFB8ZL8A0LToj8UzwhcINAtW340S0CEuVJ/dD809d1QzbjINZv9FB9riLTlzuo4M
         /kznsQ8MQJBZXYpG2upDWaLnCvtZDNTYO92dH37haCIqd2UuKEI/gqN/3+2zcR26MHJV
         lczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CfTZ++m6vux3LGNZLJpWCfzCuL5mZTcYP237yMmBD0g=;
        b=nVl0joI3R8LERf/bqmhAvFA9xdn51kKPHMuYX2303E46qjPGE1fb5fZVfEZNkfckeK
         a7QvfJNVLq9gSwRoww8+EDbvozfzfnAKxdjycPdbwPjULqWx0s/SLXyP5ZZDLfxPjsh1
         CcRfUm/DM5MOsXaI7gdXcamzXIrGNueyEbrzHq1TT6xd0CVnE+lBGCkoeJLlrsVuIwuQ
         YVot1mxW4gedPrOXBg1S86bABQzh/ZNix1gNUp8/Fxar2zWMIZuxe3Ek90q+YbiTEEdt
         f50JXm28miocBjSvg98BuwkQ060yYW9rQsOwK635VdNQ7987HpoW5+5RiKzHCuLZVcln
         pxOA==
X-Gm-Message-State: AOAM531KMza7mzfT8p+LqEORMlf1RTf+fk6CJdr751l1EIfHa5yWEXTQ
	ZQ9GfeHF5oOYcsrSU1MUnjp9hTjGdE+qQ+jhtu4=
X-Google-Smtp-Source: 
 ABdhPJwwhqhW3AcurNqTKeTW5AO49yxKGnfV5fdGmoHxdoboVl82FC7+PgWw9QMMiBpl2EPXng6etZUNmVGi+NlFb7Y=
X-Received: by 2002:a67:ed4b:0:b0:32d:285a:e552 with SMTP id
 m11-20020a67ed4b000000b0032d285ae552mr13912034vsp.84.1653498023710; Wed, 25
 May 2022 10:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220521190447.135705-1-christopher.w.clark@gmail.com>
 <CADkTA4Pv6Qz7i6+AtHaGUuq6yPOkkgCM9Hb8eqXW_U6kh3nCFA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4Pv6Qz7i6+AtHaGUuq6yPOkkgCM9Hb8eqXW_U6kh3nCFA@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 25 May 2022 10:00:12 -0700
Message-ID: 
 <CACMJ4GZX0zzNQHijN6-y9ia1RPZgTs=Jd70CNxN+XDvuE7-7Tw@mail.gmail.com>
Subject: Re:
 [meta-virtualization][gatesgarth,hardknott,honister,kirkstone,master][PATCH
 0/11] Xen on Raspberry Pi 4 fixes
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Doug Goldstein <cardoe@gentoo.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 25 May 2022 17:00:27 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7323

 On Wed, May 25, 2022 at 8:36 AM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Sat, May 21, 2022 at 3:04 PM Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
> >
> > A series of fixes applied to master and across stable branches where
> > needed to fix running Xen on the Raspberry Pi 4 board.
> >
> > This updates Linux kernel configuration for Xen to remove tracking from
> > the linux-yocto-dev kernel, either by applying a fixed revision and
> > specification of a stable branch or replacing it with the linux-yocto
> > kernel. The Xen build configuration is updated to remove the hypervisor
> > defconfig for the Raspberry Pi and drop the arm64 prelink patch as a
> > license correction and since the build no longer needs it with the newer
> > gcc toolchain.
>
> I appreciate the patches for all the branches, it gives more
> confidence in how thorough things look!
>
> I will avoid the EOL branches, but if someone really wants them, they
> are on the list and I wouldn't fight too hard about not applying them.

ack, ok

> Just so I'm clear, there aren't actually 11 patches, just some of the
> patches repeated across the various branches .. totalling 11. If that
> is wrong, please do follow up to the branches with more patches, as I
> definitely didn't get 11.

It is a bit confusing, sorry - I sent 11 patches in total, so I put
"0/11" on the cover letter, but that's the total over 5 branches.
(They are in sequence starting here:
https://lists.yoctoproject.org/g/meta-virtualization/message/7298 and
listed in the first message in this thread)
When I sent each patch, I put the branch name that the patch applies
to in the Subject line.

There are at most 3 patches for any given branch, and although the
patches do look similar between branches, there are small differences:
eg. selection of "v5.10/standard/bcm-2xxx-rpi" for gatesgarth vs
"v5.12/standard/bcm-2xxx-rpi" for hardknott, reflecting the state of
linux-yocto-dev at the point that the branch was active.
So I sent the patches that I tested in each branch, and I would
recommend applying the sent one rather than picking similar ones
across between branches for these.

thanks,

Christopher

>
> Bruce
>
> >
> > Tested on hardware.
> >
> > Christopher Clark
> >
> > gatesgarth:
> >   01: linux-yocto-dev, raspberrypi: apply fixed revision to kernel
> >   02: xen: drop patch to workaround prelink on aarch64
> >   03: xen: fix boot on the Raspberry Pi 4
> >
> > hardknott:
> >   04: linux-yocto-dev, raspberrypi: apply fixed revision to kernel
> >   05: xen: drop patch to workaround prelink on aarch64
> >   06: xen: fix boot on the Raspberry Pi 4
> >
> > honister:
> >   07: linux-yocto-dev, xen, raspberrypi: remove tracking bbappend
> >   08: xen: drop patch to workaround prelink on aarch64
> >   09: xen: fix boot on the Raspberry Pi 4 with Xen 4.14
> >
> > kirkstone:
> >   10: xen, raspberry pi: replace linux-yocto-dev with linux-yocto 5.15
> >
> > master:
> >   11: xen, raspberry pi: replace linux-yocto-dev with linux-yocto 5.15
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

