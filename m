Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web10.9193.1595558202980208424
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Jul 2020 19:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K1+JG/X8;
 spf=pass (domain: gmail.com, ip: 209.85.210.67, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ot1-f67.google.com with SMTP id 95so5920204otw.10
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Jul 2020 19:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PgEJjNyeVAxMib7bFVwbMQK5jGw9bB2behp80WfpzM8=;
        b=K1+JG/X8pWO3rKbPKDoh9dBkXwC/AzN4svz4UjYyPyMKTS/8RTPQX1n9zMwwRiWMHP
         1MyeVucvPF1d7tbgDgFk5iNhMIAF/g74H6sIPoVIYfYfZAzQTdlocJp5t7LOcoomuSGk
         r+l6fZKHsDt2hqbXkf8b8K5kGuAwpzBDdF3sx6cPUdcKGTMod1YCBOuYGvjKdeY0RXdb
         iL9/86opEXcbCdIScb+pm2j+beJQ4d+B2C652Ogat/ctJal11tyIxooXJUpz/AUPVlH+
         Fzx4iamHngmxkSWqfq/JD/xEmsZYKGyQn+qwxsJCZfD+qGMJX1XBvbV3aIrdwfUsdGoZ
         U6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PgEJjNyeVAxMib7bFVwbMQK5jGw9bB2behp80WfpzM8=;
        b=fy008TAFxoLzF+Z54a+/q9puMVe8ZSwaGEQXIAHI5y6yHj3X2s6j2X6nOIm1lfI1G3
         1Rgu9/ab4XswxtP4gHvS7gGqs+VxAkYaS5takl1Fvi4Ib7iiPN6J5bnFeJpD7krSUEuC
         1qUG0Ggazc7UrgCkNIIbe3rkzj1sFDkql/yb7hzGq3OkLV19+1Qoph69lo2S9+rrUm8H
         N7g+2C+5q1CMiR/Mw2ZB91U2am/CZt4aVsBh3u2Y7ydvf5/JgggS6Me2xQ1riL6vdj/H
         YcKPSH7hZT33AvFDGfV+K+DK+D8TsDaEe/sBNlFloZmXSyTDxD8TcYk0HAPspUUGVDkN
         wFOQ==
X-Gm-Message-State: AOAM532IpJ16GKmN7ziBlGujwcBmZ6ICHs/FqFkZv2ITrxhMuGL4ZhxH
	Vnw+m9h3I7TnvbcM9Rx+tsGva5p6xlLwZm9kTuk=
X-Google-Smtp-Source: ABdhPJwiu4kZwFwsX3WYf/Xvpid3OS1yvkQn47cqjD6O+p8cYeNr0W1LF2eFlMwiEp0hQueurn3RT8c9wvc9BV2+10c=
X-Received: by 2002:a05:6830:3148:: with SMTP id c8mr6776562ots.80.1595558202353;
 Thu, 23 Jul 2020 19:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <QMcX.1595504908355333125.079B@lists.yoctoproject.org> <CADkTA4Mny9-1d8V5o4=85LVX5soNThjXZ7FxXdX4TDyROb91PQ@mail.gmail.com>
In-Reply-To: <CADkTA4Mny9-1d8V5o4=85LVX5soNThjXZ7FxXdX4TDyROb91PQ@mail.gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Thu, 23 Jul 2020 19:36:30 -0700
Message-ID: <CACMJ4GY=g3zG4K-bRyUtSzKKQK9VjKyYg+N-09Y-M-yD9Z8m6A@mail.gmail.com>
Subject: Re: [meta-virtualization] Comment / Feedback to include RPI-4 patches on DUNFELL branch
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Ashish <ashishm@mvista.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 23, 2020 at 5:29 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Thu, Jul 23, 2020 at 7:48 AM Ashish <ashishm@mvista.com> wrote:
> >
> > Hi  Bruce / Christopher ,
> >
> > - Can you share comments / plan ahead of merging RPI-4 Xen patches on dunfell ?
> >   Currently most of patches from Chris are being on master branch .
> >    And since Dunfell is an LTS , are there any plan to have Xen on Raspberry Pi4 on Dunfell branch ?
>
> Unfortunately no. These are functionality patches, so they aren't
> appropriate to backport to dunfell. They are also not being tested
> against equivalent dunfell branches from the other repos, so
> backporting would be non-trivial.

It's been pretty educational getting Xen up and running on this device
with Yocto lately, and I am sympathetic to the interest in getting it
to work with dunfell, since it is the LTS. Part of the motivation for
doing this work is the hope that people are interested in using it!
I am aware of others who have expressed interest in a backport of the
current Xen release to dunfell too. Perhaps if there is sufficient
interest from contributors willing to provide resources to the project
to cover the necessary testing and support, there might be some way
forward.

One issue that I hadn't foreseen that would affect putting it into a
LTS branch is the force-pushing that occurs on the Raspberry Pi Linux
kernel repository branches, which can break the build when the
expected commit is no longer available in the upstream branch. With
that kernel, unfortunately 5.4 is not declared stable yet. I also just
discovered that there is some existing Raspberry Pi 4 hardware support
in the meta-yocto-bsp layer -- ie. bcm-2xxx-rpi4 -- so I'm looking
into what it would take to get the Yocto Linux 5.4 kernel (ie.
linux-yocto) to work instead of the linux-raspberrypi kernel. I don't
have it working yet, but hopefully it is close, and that kernel is
likely going to be a better fit for Xen on R-Pi4 on any stable branch
in Yocto.

> > - Or we will be having these release patches from "Gatesgarth" release.
> >   This can help us to understand in a better way.
>
> Since they are in master now, they will be part of gatesgarth.

Excellent :-)

Christopher
