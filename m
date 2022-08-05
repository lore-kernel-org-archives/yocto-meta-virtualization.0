Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC2ABC00140
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 22:56:37 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web08.88.1659740195494446879
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 05 Aug 2022 15:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MM/Wsd+R;
 spf=pass (domain: gmail.com, ip: 209.85.167.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id c185so4140567oia.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 05 Aug 2022 15:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=isWdyoHqi/o/KkG7br/hQ3Ky31NSOE5IKJN2Ugfw3uc=;
        b=MM/Wsd+Rr/XTfdDcDGZziASOGvbBep0MGH+ROG5xqdw3FhhFFsCRU+dvqiuIRQXPCe
         vq6uGneDBs3xZD5+LvST9crpbN+1FK4HDUj2gVh8PK+Nat7hk8Vo58nGUT/TjCyONzOl
         WyJCHDiqw61uSE2C5iK3vXe0Ep/6v+L8tT76vmz/it9SHTuZiT8d3NCeMVVsd3VMpaw/
         3cj0Z9KTuv+uJJD2zpEXBgLpxk3cR4lBDV6xHiAGQOZqo9Q8H5qAG6FuQZ64KJTRa+rz
         3nEXpidhiKSxilp4hYUgkHrZtYS8/4QgtWlEmfdRmu1+6TkDwY99hIL3y4KxFdxlcK8p
         7z2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=isWdyoHqi/o/KkG7br/hQ3Ky31NSOE5IKJN2Ugfw3uc=;
        b=KyfTrBZgQzbTVUSWLZ2RQugsz1gO7QLraCwR7zvnh9mKCJfrFrIOdaWIuVgPip3sUj
         BSFAIl9tAf31K8r0KhQqCuxlmdaxELze4V+kLqmavhJYm+pQPJQTON/ty+JNPHK/Q+ul
         XKwxUWFXxwJ8Ypdc8dtTfsA3aDyrREA42WIcH6lOeVyEHAbueWJZEQOFvgvYxK03gBcQ
         uKxMtbMzAugtJQOllUYrGFA+HPv/KMwk8JORll8fabpbcls88YtPBYV5aqL/MdaE/r47
         E3E1paZu+KhqCqB1fGHtGBu1HBKgQPdZVaUPCN0RTa59ZD4H49ANu6IvEwIr3xvE/1u0
         nrXQ==
X-Gm-Message-State: ACgBeo38Qxayz7MbAg/uM12eEbYkYOXiLvLTRJRIMC3zc0QY6Ro/R2jF
	9OqIY7K2G3iKhRLKvj1dEwt2f71NbfXwtCINKH4=
X-Google-Smtp-Source: 
 AA6agR5e3ZDk1L4nSxToKfkKq+e/ENvSOnURs7KKKzUVL40G/M5UL0KM7QyhukoVjXJgTyOIOAcOETt8ejL0eYo0rqs=
X-Received: by 2002:a05:6808:3088:b0:342:cb06:8dd7 with SMTP id
 bl8-20020a056808308800b00342cb068dd7mr1219894oib.6.1659740194635; Fri, 05 Aug
 2022 15:56:34 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CADkTA4OwycAA=stusCGHrEjRga+JP3vjm+U5anU50y-D-0o8kA@mail.gmail.com>
 <8237.1658906356879254972@lists.yoctoproject.org>
 <1705B28225E1CC82.3155@lists.yoctoproject.org>
In-Reply-To: <1705B28225E1CC82.3155@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 5 Aug 2022 18:56:23 -0400
Message-ID: 
 <CADkTA4OPBa3TkWQOXqxZ3=-k7vEzuOCGVRPCeVeUDDEg_qCYuw@mail.gmail.com>
Subject: Re: [meta-virtualization] K3s service not starting after go-lang
 version update in poky
To: bruce.ashfield@gmail.com
Cc: Diego Sueiro <diego.sueiro@arm.com>,
 meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 05 Aug 2022 22:56:37 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7493

On Wed, Jul 27, 2022 at 9:25 AM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Wed, Jul 27, 2022 at 3:19 AM Diego Sueiro <diego.sueiro@arm.com> wrote=
:
> >
> > Hi Bruce,
> >
> > On Mon, Jun 27, 2022 at 01:51 PM, Bruce Ashfield wrote:
> >
> > >
> > > On Mon, Jun 27, 2022 at 6:00 AM Kamil Dzie=C5=BCyk <Kamil.Dziezyk@arm=
.com> wrote:
> > > >
> > > > Hello Bruce,
> > > >
> > > > There is a problem with the k3s service starting when the Yocto ima=
ge is
> > > built with the meta-virtualization master branch.
> > > >
> > > > This issue might be related to the go-lang version(1.18) used to bu=
ild the
> > > k3s.
> > > > After this patch was merged:
> > > https://git.yoctoproject.org/poky/commit/?id=3D8dc1f28aa10c775e64b527=
5679b1f8142e8cd038
> > > > a warning pops up during the k3s build:
> > > > ```
> > > > WARNING: k3s-v1.22.6+k3s1+git4262c6b91a43ef8411870f72ff8b8715949f90=
e2-r0
> > > do_package_qa: QA Issue: k3s: ELF binary /usr/local/bin/k3s has reloc=
ations in
> > > .text [textrel]
> > >
> > > That warning has actually been around for a while.
> > >
> > > > ```
> > > > See k3s service start logs here: https://pastebin.com/uXvsjPFu
> > > > I have tried a more recent version of k3s 1.22.8 with a small chang=
e and
> > > this version of the k3s starts successfully.
> > > > However, I did not manage to update all k3s build dependency source=
s from
> > > the recipes-container/k3s/src_uri.inc.
> > > > I have built the k3s with this change: https://pastebin.com/3QGvcqt=
a
> > > >
> > > > Could you update the k3s recipe on the master branch, to build a mo=
re recent
> > > version 1.23 or 1.24?
> > >
> > > I have a 1.24 update already underway. So hopefully things will be
> > > sorted out shortly.
> >
> > Do you have an ETA for this?
>
> I ran into some really nasty runtime issues, along with build issues,
> so I'm now on the 4th micro bump to deal with problems.
>
> There was also a week of squashing buildpath issues in oe-core that
> slowed things down.
>
> I have an arbitrary deadline of M3 for these sorts of updates, so that
> is the goal and one that is quickly approaching!

FYI: I finally managed to figure out the build issues, and have pushed
an initial bump to v1.24.x to master-next.

I spent nearly a day thinking it was our build, or the dependencies
that were the issue .. and as it turns out, even in a native / non-OE,
vendored or not-vendored build .. you get the same Sandbox build error
that I was debugging. I've changed the tags to avoid the ctrd internal
build and we at least get a binary.

This should also have the golang -> github substitutions that were
suggested for the previous version, I'll do a closer check later on
that.

I still have more runtime testing to do, but the fact that there's a
building jumping off point, I wanted to at least get it to master-next
and let folks know.

Bruce

>
> Bruce
>
> >
> > --
> > Diego Sueiro
> >
> > >
> > > Bruce
> > >
> > > >
> > > > Thanks,
> > > >
> > > > Kamil Dzie=C5=BCyk
> > > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
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
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7478): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7478
> Mute This Topic: https://lists.yoctoproject.org/mt/92017071/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

