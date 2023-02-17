Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EA0C05027
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 14:27:04 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.7529.1676644018397609461
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Feb 2023 06:26:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SIXlFnnO;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id 79so599615iou.12
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 06:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f7sATpQRLdZ4OfHgFy/LBFpzcpgOoghnODRkrBt5OJs=;
        b=SIXlFnnOVCBePnQZxPgV/A4M4PJ2Fdzm0Z2zwRUBEUQvv4eRVnCbCaiJ+hx9wu9PDP
         aCIp8P94+gb6Pd5TR3RGPCY/s2RdOq5YoZ85GdgY1aZPKvDLI5jTDgILWr/5/hu0BM19
         TkAIzjWva9TUmlMEjMkX3XwJG3GMUh6Pe45tBEIXGaESXuKQPU2boGNbJSHZ8UhixKG1
         wy/C7/CgSQg+sgQTjSUOULSIUe28dsoM2VX00leZS5tpb4qCSnP6+uDi5DZPjfcfRGVC
         OCIeHoiYgnc93UryAn6/Zu36wHN7W4CBk/Y5okcFN5xjdUgrRcQV54IDNJvUzhHN/Mob
         /KtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7sATpQRLdZ4OfHgFy/LBFpzcpgOoghnODRkrBt5OJs=;
        b=BcX6Kg9CyU/yYkY2djxjgHQ6i6oH8NcIv+rlEVsrZlTBkkEBDAmfQEVxRmaNKOWeBR
         O4EP5vKYD12wD4d88DHBO96Fnu+REbl1gkx9mFZEIlB0lvwc8g3795q6oiGn+nJi01Z7
         V/BsdRBdrUMq2P6iKTRKD8FTFXyvHwW/ifc35emQW6uaiAaBjdF1yATFYRK9hEE+592e
         wITWP5FkLs28fOvqfYGMaZ74lkX8HBMg4Sc9bjl59r0bi76XkkZsf5Z+l9rU2ul2ULvX
         S7pEgcIW9s0NPxhp9k6Uze1HY6kvFSGe6o39mH4FwyUyLLQidpKX+QGuvqeUYXVMTVsl
         FZ+Q==
X-Gm-Message-State: AO0yUKXoFmGHqZfWOpkowmS4Ly+tO1qanvG7/D3ndEryv0wD5H0z/8Z3
	mdN3/qHX53YxBtAP3Amw29athtjsIv4LU39yCbQACpX1ptE=
X-Google-Smtp-Source: AK7set/vlEjmdjYv3QYUCvLBnSVVxnMymffksFQAO7gYzYrwcgAWQI5ZpQDUdVqXyXAaWGlxTAMqq5XRmoDyYEmZbEM=
X-Received: by 2002:a5d:8254:0:b0:71c:1bd4:b768 with SMTP id
 n20-20020a5d8254000000b0071c1bd4b768mr2922939ioo.84.1676644017500; Fri, 17
 Feb 2023 06:26:57 -0800 (PST)
MIME-Version: 1.0
References: <20230217053224.3870-1-Qi.Chen@windriver.com> <20230217053224.3870-2-Qi.Chen@windriver.com>
 <CADkTA4MNO3rffZvtO6X+kTfKdpjO40c24wL6KzNUxEiePjbU0Q@mail.gmail.com>
 <CO6PR11MB5602600230D9DFFC40C23A48EDA19@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CADkTA4N0kJZUwgjXVwz4SZGtiQD=fB3j6mgNCPyqt-qLJwXjCw@mail.gmail.com> <CO6PR11MB560205CE9C63402E627E57F6EDA19@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB560205CE9C63402E627E57F6EDA19@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 17 Feb 2023 09:26:46 -0500
Message-ID: <CADkTA4MV=sLbOzdqLDaB48MDQt33=He48VcQp=AsN5E7jX=HOg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/5] cri-o: use PACKAGECONFIG to
 handle selinux
To: "Chen, Qi" <Qi.Chen@windriver.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 14:27:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7874

On Fri, Feb 17, 2023 at 9:24 AM Chen, Qi <Qi.Chen@windriver.com> wrote:
>
> OK, I see. Let's just drop this patch so that libselinux is still a dependency and the layer check is still there.
> I'll send out V2 of the README change to match the current situation.

It would be nice to have the ability to disable the selinux support,
for those that don't need it.

So triggering everything off the distro feature is fine, if you want
to do that with the v2. No need to modify the crio.conf for now, as we
don't have selinux policies to fully test it regardless.

Bruce

>
> Regards,
> Qi
>
> -----Original Message-----
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> Sent: Friday, February 17, 2023 10:11 PM
> To: Chen, Qi <Qi.Chen@windriver.com>
> Cc: meta-virtualization@lists.yoctoproject.org
> Subject: Re: [meta-virtualization][PATCH 2/5] cri-o: use PACKAGECONFIG to handle selinux
>
> On Fri, Feb 17, 2023 at 8:56 AM Chen, Qi <Qi.Chen@windriver.com> wrote:
> >
> > I disable it by default to align with oe-core/meta-openembedded practice, although some of the recipes there are using DISTRO_FEATURES to determine the default value.
> > Also, selinux is set to 'false' by default in crio.conf, both in the old crio.conf and the new one.
> >
>
> There's no such policy in meta-virt.
>
> My point is that libselinux was previously a DEPENDS. Which means that it would always be available to be discovered/probed by the cri-o build. Which means that it is (at least theoretically) enabled by default when cri-o is used.
>
> By making this a packageconfig, and then not enabling it by default, means that we are changing the default behaviour.  Which we won't do unless something is broken.
>
> > Do you think the default value should be set according to DISTRO_FEATURES? Or we should just make selinux enabled by default?
> >
>
> Doing it by distro feature check is acceptable, and in theory, we should take it a step further and do a sed operation to change the crio.conf at the same time.
>
> Bruce
>
> > Regards,
> > Qi
> >
> > -----Original Message-----
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Sent: Friday, February 17, 2023 9:48 PM
> > To: Chen, Qi <Qi.Chen@windriver.com>
> > Cc: meta-virtualization@lists.yoctoproject.org
> > Subject: Re: [meta-virtualization][PATCH 2/5] cri-o: use PACKAGECONFIG
> > to handle selinux
> >
> > This still needs to be enabled by default in the packageconfig, unless you can show that the existing builds were not detecting libselinux and using it.
> >
> > Bruce
> >
> > On Fri, Feb 17, 2023 at 12:32 AM Chen Qi <Qi.Chen@windriver.com> wrote:
> > >
> > > For cri-o, libselinux is optional, this can be seen from its Makefile.
> > > So let's make selinux optional by using PACKAGECONFIG.
> > > In this way, meta-selinux dependency could be removed.
> > >
> > > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > ---
> > >  recipes-containers/cri-o/cri-o_git.bb | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/recipes-containers/cri-o/cri-o_git.bb
> > > b/recipes-containers/cri-o/cri-o_git.bb
> > > index 66d1116..7af698f 100644
> > > --- a/recipes-containers/cri-o/cri-o_git.bb
> > > +++ b/recipes-containers/cri-o/cri-o_git.bb
> > > @@ -39,14 +39,14 @@ DEPENDS = " \
> > >      ostree \
> > >      libdevmapper \
> > >      libseccomp \
> > > -    libselinux \
> > >      "
> > >  RDEPENDS:${PN} = " \
> > >      cni \
> > >      libdevmapper \
> > >      "
> > >
> > > -SKIP_RECIPE[cri-o] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'selinux', '', 'Depends on libselinux from meta-selinux which is not included', d)}"
> > > +PACKAGECONFIG ?= ""
> > > +PACKAGECONFIG[selinux] = ",,libselinux"
> > >
> > >  PACKAGES =+ "${PN}-config"
> > >
> > > --
> > > 2.37.1
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#7861):
> > > https://lists.yoctoproject.org/g/meta-virtualization/message/7861
> > > Mute This Topic: https://lists.yoctoproject.org/mt/97023221/1050810
> > > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > > Unsubscribe:
> > > https://lists.yoctoproject.org/g/meta-virtualization/unsub
> > > [bruce.ashfield@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
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

