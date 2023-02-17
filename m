Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51958C6379F
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 14:11:14 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web11.7121.1676643072441515935
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Feb 2023 06:11:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TIpYVSku;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id p131so485490iod.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 06:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XGndaIAjtmL9QgOIp5Eg8yGXDPGYyiTOE3BmvniDo1Y=;
        b=TIpYVSkuHe+IY8TTiUJxUVGy7smDpsjSTBqB8ZgBFZ6BYUk3y17YHg4ZyUE2/5IQI/
         KL1GpXOucxiKYNzcB01hZNtcOUNx2yDjtIZvlS2CEmkEw/B759p2VLg2CpJPXko/jMyh
         KSw2iLNTJQox2tEfEKlmOkmJX0tRqXHCMrZl00uoWQp0bLdSAGrlP9/veh3+J8Rv6P5L
         geIoCN5NgiNEJeU9XuiDvzCSwDob67kBwd+n73mgaF8Nxc0utE3hbeFJSW0vzA8fxLRJ
         lZAHaLoKHaeMDkkPTHXaVsXjCHoy0OEpTMINWNXq1MmQec2BOGVyzlzM7xgt5zWPWUGz
         7uAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XGndaIAjtmL9QgOIp5Eg8yGXDPGYyiTOE3BmvniDo1Y=;
        b=7//TF/I5ug3VHOK/k3S1Ld1R1ErgiF+54rGqTt9CtpLhxd0P9lbzsh/r338ptPQZRE
         U1aS7j5Fct54PP7imyClMcFXHW3TCV3rHchRg76uvXJwpFyFYfOzLUuUbxv7Rh9lBwgh
         zCJyUDK3tI6VYN1qKRCCZ+/NFFDv/92b6oEkFUaPWi1az56c13a3jbeDEUdftysipg/B
         WHPt7TOkenkMzJjoMP5ybUinN3H5XRrg+Z9dksBTc2a9vQ9kVHJj6Twlq6iCx/Wy72Ya
         rBFKn96N5rAj/OX9vj6iTWDByjhBbiPSVMEu5ubiYFg8kP89mSCpFMdzhfiESjAsQOwL
         lg1Q==
X-Gm-Message-State: AO0yUKVpSAYArNymKsTIaUR2toGa+/aS0mR1VBJ0NaU0x3cdsrR+ws9j
	Se1A+L7sjMDxGq7875aqCLCspFaMMcx1UVlbghk=
X-Google-Smtp-Source: AK7set9EcmNhxx3yl42Ywswz/LBjd7DenST2eY84CjEMSusPDZiJiy1P1TEV+LWTEq1aJc+PF4x7Huid68xSqgRg35M=
X-Received: by 2002:a05:6638:22d0:b0:3c5:1900:9b95 with SMTP id
 j16-20020a05663822d000b003c519009b95mr1201050jat.3.1676643071569; Fri, 17 Feb
 2023 06:11:11 -0800 (PST)
MIME-Version: 1.0
References: <20230217053224.3870-1-Qi.Chen@windriver.com> <20230217053224.3870-2-Qi.Chen@windriver.com>
 <CADkTA4MNO3rffZvtO6X+kTfKdpjO40c24wL6KzNUxEiePjbU0Q@mail.gmail.com> <CO6PR11MB5602600230D9DFFC40C23A48EDA19@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB5602600230D9DFFC40C23A48EDA19@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 17 Feb 2023 09:11:00 -0500
Message-ID: <CADkTA4N0kJZUwgjXVwz4SZGtiQD=fB3j6mgNCPyqt-qLJwXjCw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/5] cri-o: use PACKAGECONFIG to
 handle selinux
To: "Chen, Qi" <Qi.Chen@windriver.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 14:11:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7870

On Fri, Feb 17, 2023 at 8:56 AM Chen, Qi <Qi.Chen@windriver.com> wrote:
>
> I disable it by default to align with oe-core/meta-openembedded practice, although some of the recipes there are using DISTRO_FEATURES to determine the default value.
> Also, selinux is set to 'false' by default in crio.conf, both in the old crio.conf and the new one.
>

There's no such policy in meta-virt.

My point is that libselinux was previously a DEPENDS. Which means that
it would always be available to be discovered/probed by the cri-o
build. Which means that it is (at least theoretically) enabled by
default when cri-o is used.

By making this a packageconfig, and then not enabling it by default,
means that we are changing the default behaviour.  Which we won't do
unless something is broken.

> Do you think the default value should be set according to DISTRO_FEATURES? Or we should just make selinux enabled by default?
>

Doing it by distro feature check is acceptable, and in theory, we
should take it a step further and do a sed operation to change the
crio.conf at the same time.

Bruce

> Regards,
> Qi
>
> -----Original Message-----
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> Sent: Friday, February 17, 2023 9:48 PM
> To: Chen, Qi <Qi.Chen@windriver.com>
> Cc: meta-virtualization@lists.yoctoproject.org
> Subject: Re: [meta-virtualization][PATCH 2/5] cri-o: use PACKAGECONFIG to handle selinux
>
> This still needs to be enabled by default in the packageconfig, unless you can show that the existing builds were not detecting libselinux and using it.
>
> Bruce
>
> On Fri, Feb 17, 2023 at 12:32 AM Chen Qi <Qi.Chen@windriver.com> wrote:
> >
> > For cri-o, libselinux is optional, this can be seen from its Makefile.
> > So let's make selinux optional by using PACKAGECONFIG.
> > In this way, meta-selinux dependency could be removed.
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  recipes-containers/cri-o/cri-o_git.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes-containers/cri-o/cri-o_git.bb
> > b/recipes-containers/cri-o/cri-o_git.bb
> > index 66d1116..7af698f 100644
> > --- a/recipes-containers/cri-o/cri-o_git.bb
> > +++ b/recipes-containers/cri-o/cri-o_git.bb
> > @@ -39,14 +39,14 @@ DEPENDS = " \
> >      ostree \
> >      libdevmapper \
> >      libseccomp \
> > -    libselinux \
> >      "
> >  RDEPENDS:${PN} = " \
> >      cni \
> >      libdevmapper \
> >      "
> >
> > -SKIP_RECIPE[cri-o] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'selinux', '', 'Depends on libselinux from meta-selinux which is not included', d)}"
> > +PACKAGECONFIG ?= ""
> > +PACKAGECONFIG[selinux] = ",,libselinux"
> >
> >  PACKAGES =+ "${PN}-config"
> >
> > --
> > 2.37.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7861):
> > https://lists.yoctoproject.org/g/meta-virtualization/message/7861
> > Mute This Topic: https://lists.yoctoproject.org/mt/97023221/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe:
> > https://lists.yoctoproject.org/g/meta-virtualization/unsub
> > [bruce.ashfield@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

