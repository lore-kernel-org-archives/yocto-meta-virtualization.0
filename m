Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22474C433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web12.1057.1650347379097753002
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Apr 2022 22:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qOMCVm2c;
 spf=pass (domain: gmail.com, ip: 209.85.217.48,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id t202so1685846vst.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Apr 2022 22:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RZQCA7JFqxNC22SgYpCh7TnaL9eC+FPhwsf7C4PYIqo=;
        b=qOMCVm2cXZpRXqRsgUkUJlV0TAyLTlh6wgJPyGm91aERboOzgbzSqzd8UP+/nXQLx+
         jkyKOdTruTJDeqokTEQyoFJzFeLJo3zdQ7yHgrgoUEwXH3Q11eJ7hXu8WAx63aemW4r8
         S8L7BvOLDga94feV/008k4PEmA3MXPctCPvCJJsNY+f0zbYeE8aU55UcHUZJWR+/UuEd
         JVoM/JLLWPKkoxoevulXKZtdv8BtOg2N1bdF3olyzPo0nngSlj4cHORMwu4kcoAsTjwN
         aS1AZxLr0vymyQqtxpJ6sFw27OJjPIxcb6Cetww0v4l/K/TyikM8Ry+yi3gG+qL0oX1K
         Ox0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RZQCA7JFqxNC22SgYpCh7TnaL9eC+FPhwsf7C4PYIqo=;
        b=cBEQVAxXuuUoYVcrKD7dnotAsh4xadRzhI4WhT1XmE7aejXgq2Gm71xnE3+dWHi3v0
         fu0DKoRp/RAg+GtSBuigUNIPQ9M+O7vgs6n/BivMdpDcXLvDCSMyvBbSAuPtLTZcnqc0
         GgnaiQpDWRSR1qTaW+A6PJHWISCoX5CDmvQqVbVLUdPcb4MFnAg/NTTAYMteZLyR5Nek
         YsuvgvdvytIHK+43WHp/iqHdC0z6akk1K7Ue6K5JB0NopExNgMw0vMcSWPhIm1NAq3o8
         ovBl+mqxpayNlYLXCCOyGKrzAQNgS6WDA+qeFKfUIQ9OD958l+5+Pt1QijE/xbq7LRGn
         AgLg==
X-Gm-Message-State: AOAM532dQ7ppvSZuIka7dlc/2jMjEAh1Q6GW4eSapo+KIH/EPAu30zFk
	cUFwh4RkYfN5YrnW2guWc/8mfSAzUT4Zk3bJ7pY=
X-Google-Smtp-Source: 
 ABdhPJxXZxfjZNUKvprlfp31yR+mQGM/HKkCOUt6dWDrX91mzGAcJT7pXar88s4bYm+JmnTH3SXEKvzMw6Nqzzpsi/o=
X-Received: by 2002:a05:6102:38f:b0:32a:1321:bc0b with SMTP id
 m15-20020a056102038f00b0032a1321bc0bmr3861516vsq.72.1650347378138; Mon, 18
 Apr 2022 22:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220408084420.102085-1-michal.orzel@arm.com>
 <CADkTA4MxDwunJex7NnjFpLs2k0sUo354XUysH0PeYww+gYxA_A@mail.gmail.com>
 <A524ADAA-241A-4206-AA65-6B2778D5FE01@arm.com>
 <CADkTA4P2y+5Szb123+ZbU6w+rWpdxKv7fdqE0pHvPdwHCu-ZCA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4P2y+5Szb123+ZbU6w+rWpdxKv7fdqE0pHvPdwHCu-ZCA@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 18 Apr 2022 22:49:27 -0700
Message-ID: 
 <CACMJ4GZ08LhPXD78TtC7GOBeXcquSuPUf3q-4p-0CG8h96Qq+Q@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 0/3] xen: Update recipes for xen and
 xen-tools
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <Michal.Orzel@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>,
	Doug Goldstein <cardoe@gentoo.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7186

On Thu, Apr 14, 2022 at 1:40 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Thu, Apr 14, 2022 at 4:02 AM Bertrand Marquis
> <bertrand.marquis@arm.com> wrote:
> >
> > Hi Bruce,
> >
> > > On 14 Apr 2022, at 04:13, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > >
> > > On Fri, Apr 8, 2022 at 4:44 AM Michal Orzel <michal.orzel@arm.com> wrote:
> > >>
> > >> Before the next Yocto release, Xen recipes need to be updated.
> > >> This patch series:
> > >> - updates 4.15 recipes
> > >> - introduces 4.16 recipes
> > >> - removes 4.14 recipes
> > >
> > > FYI: I'm not ignoring these, and I will make sure they get into the
> > > upcoming release branch and are in place for the LTS release. I'm just
> > > waiting until Christopher gets a chance to review and see if these
> > > match up with what he was thinking about for versions.
> >
> > Thanks.

Thanks for your patience on these. I've just completed the build, boot
and XTF testing of this series with success, for x86-64, arm32 and
arm64 qemu MACHINES, with each of the three Xen versions (4.15.2,
4.16.1 and 4.17 git recipe).

I modified the 4.16 recipe to apply the Xen 4.16.1 release revision as
Bertrand indicated and Bruce has confirmed as wanted.
ie: SRCREV ?= "f26544492298cb82d66f9bf36e29d2f75b3133f2"
I also think the SRCREV revision posted for the git recipes update to
4.17 is a sensible choice.

For this series, with the update to 4.16.1 applied:
Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>

> > For LTS, I think we said the strategy should be a bit different:
> > - keep the original versions and update them.
> > - keep the same default version
> > - add/update other recipe upon request
> >
>
> My fault for not being clear, I was thinking about "the upcoming LTS",
> aka the very-soon to be released kirstone .. but just typed "LTS",
> which is no longer unambiguous!
>
> Unless you were also speaking about kirstone .. :)
>
> For dunfell-LTS, we definitely don't need to add new versions, but I'm
> happy to do updates.
>
> For Kirstone LTS, I just wanted to make sure that we had the right Xen
> versions, where at least one is also a Xen LTS and another version to
> track a latest release (for those that need it).
>
> I think we are aligned on both fronts.

Ack. ie. for Kirkstone, I think it is:
- the 4.16 recipes will be default (as per the change in this series)
and that will stay default
- the git recipes will be there and those can be updated to add
packaging compatibility with newer Xen updates if requested
- there's a good case for keeping the 4.15 release recipes included
given the timing of this update and the Kirkstone release
- and we can add recipes for a newer Xen stable version upon request

thanks,

Christopher

>
> Bruce
>
> > I do not think we need to push this change to LTS branch, there it might make more sense to update the present versions.
> > I can check that in the next weeks.
> >
> > Cheers
> > Bertrand
> >
> > >
> > > Bruce
> > >
> > >>
> > >> Michal Orzel (3):
> > >>  xen: Bump SRCREV of 4.15 recipes to 4.15.2
> > >>  xen: Add recipes for stable Xen 4.16 release and update master
> > >>  xen: Remove 4.14 recipes and related patches
> > >>
> > >> .../include/meta-virt-default-versions.inc    |   4 +-
> > >> ...-stand-alone-set-of-headers-Xen-4.14.patch | 178 ------------------
> > >> ...ython-pygrub-pass-DISTUTILS-xen-4.14.patch |  66 -------
> > >> ...d-firmware-as-ffreestanding-Xen-4.14.patch |  83 --------
> > >> recipes-extended/xen/xen-tools_4.14.bb        |  21 ---
> > >> recipes-extended/xen/xen-tools_4.15.bb        |   4 +-
> > >> recipes-extended/xen/xen-tools_4.16.bb        |  19 ++
> > >> recipes-extended/xen/xen-tools_git.bb         |   6 +-
> > >> recipes-extended/xen/xen_4.15.bb              |   4 +-
> > >> .../xen/{xen_4.14.bb => xen_4.16.bb}          |   6 +-
> > >> recipes-extended/xen/xen_git.bb               |   6 +-
> > >> 11 files changed, 34 insertions(+), 363 deletions(-)
> > >> delete mode 100644 recipes-extended/xen/files/0001-firmware-provide-a-stand-alone-set-of-headers-Xen-4.14.patch
> > >> delete mode 100644 recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch
> > >> delete mode 100644 recipes-extended/xen/files/0001-tools-firmware-Build-firmware-as-ffreestanding-Xen-4.14.patch
> > >> delete mode 100644 recipes-extended/xen/xen-tools_4.14.bb
> > >> create mode 100644 recipes-extended/xen/xen-tools_4.16.bb
> > >> rename recipes-extended/xen/{xen_4.14.bb => xen_4.16.bb} (79%)
> > >>
> > >> --
> > >> 2.25.1
> > >>
> > >>
> > >>
> > >>
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7172): https://lists.yoctoproject.org/g/meta-virtualization/message/7172
> > Mute This Topic: https://lists.yoctoproject.org/mt/90331599/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

