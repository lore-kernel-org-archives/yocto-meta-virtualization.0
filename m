Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E28C636D6
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 20:36:55 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.5517.1676666209942087974
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Feb 2023 12:36:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZeY76TC7;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id q20so754146ilc.9
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 12:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hBRw4cR9kgNkyot306GqWSjppkd6VLmxx3qlsO4duZo=;
        b=ZeY76TC7TMIVivav+oyFlgMdYpwylP7MTS4hXYo00OvxsBePejVqBQGJI7tuswy93W
         APuD4lN3Eo4fHMAeS47PgF53TcayxoeilyJKSF8xNTT1eFEeSuqWiCmpcPrURcUoQklt
         WFmCnxnYk28krxWmFJdrRG8wxs5KHIYBE53zm7m4fieOuEidz34QDsvay0XQqlEk1pBZ
         WeEMQjVIOemss0ScF4F+kWTaUCXRPOOgvqO1XKVGzciqrlM/rWGrYx+FS8Ovt4zGDoZ2
         9RbUdRx6kEnswLbyTNke3m205DmJDVqAExDjV3HBazuN3Rs9eSKejwA36UpJxICdTn73
         iyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hBRw4cR9kgNkyot306GqWSjppkd6VLmxx3qlsO4duZo=;
        b=1hGbMEYiEHBFURT2ywkEwgAtMfjPgXk1Ua6LB+5HS/GNYa27XQDGvdMEPDdzsIhXcq
         dXSHuMaA/z6ieFwtsP49m0tOeanhqDIZQBdqwU9yL20evgamZ4e9iZq+mkasVR0LRqUl
         zRAZHI+DdtJZpHiVe1lItB2Z493hQ9tHgSMX03FLCTzMD07Gul9FsQiUMvx9tJqqceRL
         MzqNWMvK3hiQ2Z4bL17RYINn/6RBuKA83FfSchNSBddi6kgtxY1/mh2xaygYvIL8vcO3
         XnEVaii0tme0EC6vPNF8E76McXTHOke+tVoZ1z5v4Z5UZ0NH6wRc0HgXoO8jLLTJKQe9
         R2vQ==
X-Gm-Message-State: AO0yUKXe7txt/MMbuEO46kLreQBbNIMJwZjDFfU7jqUT2VcvaZUMMnZJ
	Eq8nBJ1TUI8vgHinpz/8o1TApcYJs0WgDLj9TYQ=
X-Google-Smtp-Source: AK7set/SmPSsUrqynCZcsVRJ+7GuRfSQhxNZQ4VaZKHXMMBmiz8YZBlfEYJ+/0M0nSrap05EE7+5N6aGuQMvcAWmcCg=
X-Received: by 2002:a05:6e02:1307:b0:313:d01e:ecf6 with SMTP id
 g7-20020a056e02130700b00313d01eecf6mr647651ilr.0.1676666209054; Fri, 17 Feb
 2023 12:36:49 -0800 (PST)
MIME-Version: 1.0
References: <20230217053224.3870-1-Qi.Chen@windriver.com> <20230217053224.3870-2-Qi.Chen@windriver.com>
 <CADkTA4MNO3rffZvtO6X+kTfKdpjO40c24wL6KzNUxEiePjbU0Q@mail.gmail.com>
 <CO6PR11MB5602600230D9DFFC40C23A48EDA19@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CADkTA4N0kJZUwgjXVwz4SZGtiQD=fB3j6mgNCPyqt-qLJwXjCw@mail.gmail.com>
 <CO6PR11MB560205CE9C63402E627E57F6EDA19@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CADkTA4MV=sLbOzdqLDaB48MDQt33=He48VcQp=AsN5E7jX=HOg@mail.gmail.com> <CO6PR11MB5602576602D503298F05997AEDA19@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB5602576602D503298F05997AEDA19@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 17 Feb 2023 15:36:37 -0500
Message-ID: <CADkTA4PXwj9gmOnLSyGYx7thbFdy6nZqpz9ucEYjY7q=69YzqQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/5] cri-o: use PACKAGECONFIG to
 handle selinux
To: "Chen, Qi" <Qi.Chen@windriver.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 20:36:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7879

On Fri, Feb 17, 2023 at 10:30 AM Chen, Qi <Qi.Chen@windriver.com> wrote:
>
> Hi Bruce,
>
> I've sent out V2.
> I also noticed there's a cri-o upgrade in master-next, so I cherry-picked it onto my branch and tested 'k8s + cri-o + flannel' for qemux86-64. Things are working.

I've grabbed parts of the original series and the v2 patches and
staged them onto master-next.

I also have my container-host bbclass and configuration work on master-next.

My tests passed, but it would be good to get your results with it as
well .. as I may have missed part of your series. If I did miss
something, resend it against master-next and I'll add them to the
queue.

Bruce

>
> Regards,
> Qi
>
> -----Original Message-----
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> Sent: Friday, February 17, 2023 10:27 PM
> To: Chen, Qi <Qi.Chen@windriver.com>
> Cc: meta-virtualization@lists.yoctoproject.org
> Subject: Re: [meta-virtualization][PATCH 2/5] cri-o: use PACKAGECONFIG to handle selinux
>
> On Fri, Feb 17, 2023 at 9:24 AM Chen, Qi <Qi.Chen@windriver.com> wrote:
> >
> > OK, I see. Let's just drop this patch so that libselinux is still a dependency and the layer check is still there.
> > I'll send out V2 of the README change to match the current situation.
>
> It would be nice to have the ability to disable the selinux support, for those that don't need it.
>
> So triggering everything off the distro feature is fine, if you want to do that with the v2. No need to modify the crio.conf for now, as we don't have selinux policies to fully test it regardless.
>
> Bruce
>
> >
> > Regards,
> > Qi
> >
> > -----Original Message-----
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Sent: Friday, February 17, 2023 10:11 PM
> > To: Chen, Qi <Qi.Chen@windriver.com>
> > Cc: meta-virtualization@lists.yoctoproject.org
> > Subject: Re: [meta-virtualization][PATCH 2/5] cri-o: use PACKAGECONFIG
> > to handle selinux
> >
> > On Fri, Feb 17, 2023 at 8:56 AM Chen, Qi <Qi.Chen@windriver.com> wrote:
> > >
> > > I disable it by default to align with oe-core/meta-openembedded practice, although some of the recipes there are using DISTRO_FEATURES to determine the default value.
> > > Also, selinux is set to 'false' by default in crio.conf, both in the old crio.conf and the new one.
> > >
> >
> > There's no such policy in meta-virt.
> >
> > My point is that libselinux was previously a DEPENDS. Which means that it would always be available to be discovered/probed by the cri-o build. Which means that it is (at least theoretically) enabled by default when cri-o is used.
> >
> > By making this a packageconfig, and then not enabling it by default, means that we are changing the default behaviour.  Which we won't do unless something is broken.
> >
> > > Do you think the default value should be set according to DISTRO_FEATURES? Or we should just make selinux enabled by default?
> > >
> >
> > Doing it by distro feature check is acceptable, and in theory, we should take it a step further and do a sed operation to change the crio.conf at the same time.
> >
> > Bruce
> >
> > > Regards,
> > > Qi
> > >
> > > -----Original Message-----
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > Sent: Friday, February 17, 2023 9:48 PM
> > > To: Chen, Qi <Qi.Chen@windriver.com>
> > > Cc: meta-virtualization@lists.yoctoproject.org
> > > Subject: Re: [meta-virtualization][PATCH 2/5] cri-o: use
> > > PACKAGECONFIG to handle selinux
> > >
> > > This still needs to be enabled by default in the packageconfig, unless you can show that the existing builds were not detecting libselinux and using it.
> > >
> > > Bruce
> > >
> > > On Fri, Feb 17, 2023 at 12:32 AM Chen Qi <Qi.Chen@windriver.com> wrote:
> > > >
> > > > For cri-o, libselinux is optional, this can be seen from its Makefile.
> > > > So let's make selinux optional by using PACKAGECONFIG.
> > > > In this way, meta-selinux dependency could be removed.
> > > >
> > > > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > > ---
> > > >  recipes-containers/cri-o/cri-o_git.bb | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/recipes-containers/cri-o/cri-o_git.bb
> > > > b/recipes-containers/cri-o/cri-o_git.bb
> > > > index 66d1116..7af698f 100644
> > > > --- a/recipes-containers/cri-o/cri-o_git.bb
> > > > +++ b/recipes-containers/cri-o/cri-o_git.bb
> > > > @@ -39,14 +39,14 @@ DEPENDS = " \
> > > >      ostree \
> > > >      libdevmapper \
> > > >      libseccomp \
> > > > -    libselinux \
> > > >      "
> > > >  RDEPENDS:${PN} = " \
> > > >      cni \
> > > >      libdevmapper \
> > > >      "
> > > >
> > > > -SKIP_RECIPE[cri-o] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'selinux', '', 'Depends on libselinux from meta-selinux which is not included', d)}"
> > > > +PACKAGECONFIG ?= ""
> > > > +PACKAGECONFIG[selinux] = ",,libselinux"
> > > >
> > > >  PACKAGES =+ "${PN}-config"
> > > >
> > > > --
> > > > 2.37.1
> > > >
> > > >
> > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#7861):
> > > > https://lists.yoctoproject.org/g/meta-virtualization/message/7861
> > > > Mute This Topic:
> > > > https://lists.yoctoproject.org/mt/97023221/1050810
> > > > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > > > Unsubscribe:
> > > > https://lists.yoctoproject.org/g/meta-virtualization/unsub
> > > > [bruce.ashfield@gmail.com]
> > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness
> > > await thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

