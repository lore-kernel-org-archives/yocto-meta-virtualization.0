Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF06BC04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 13:25:10 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web09.19692.1658928309448987933
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 06:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=erO+8kbX;
 spf=pass (domain: gmail.com, ip: 209.85.160.51,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-10e3852b463so5900227fac.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 06:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Xv8CTEbXgZ2jVEGZ1eeF0Y1mWJ+99bphpxWE9ThUx4w=;
        b=erO+8kbX4Inzgelkgco3shQSnz+03vefJKMCVmU+iYZmVT9/iuG+MmMCPzlYj95jYC
         iWC8EGESm0VMcaWGGGdv4yJdOUuMP150xQGi+qa7mbGS7ZAABXLAwqm2U3HpR5pfKZ9n
         eY/YVNwIra1zhjo9uDdlKISnc+V13ty67Xd0fQ5l8Gu1eY/X8b2UhZMcK4DFNcbWekCn
         0bJYKlKhFRFlCIltrHrFlUE2ZEOPMSPMAHMsCvlPOI6V0e+2EDzBrtEIfS5jn1ov76i+
         PYInsBzr1Mb9TYoAFtkkT3OCoZripXN+olLlm1hwws6nqFtYqsKEDBT6lF/hoXS8WaKs
         OD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Xv8CTEbXgZ2jVEGZ1eeF0Y1mWJ+99bphpxWE9ThUx4w=;
        b=UqK0dieMCcoluAdr6pOk0Ym1KIi+n1hTzPMBoJmAdEEEryipfue/DHQFYIWnGPccbr
         4E8cjeRQ1p/LhnZVqHhxtujERzQ0+WSY+LSCWXpJWf0n2vILdBfnqi37l/GLV8unQGUA
         Jt3wD5qlgF+q/ghrkWwUg7wHN0UvF1cDbzBJ8cxP/N64cWQdKE4XSmC8Gy8+D8yZaM2V
         HHPy4JGzn53avGiuYNGwHmrQWN5XAp8oW30JgSrR/BPGk80/6j3VkXQyJ9VPwfV80XJy
         J33rMsgqEYEc9NcottkWQVl0Ts80Ih4SAagczqO72MPIUIJVz1Z1ev1uCUSSBvp8DmTk
         h/Mg==
X-Gm-Message-State: AJIora/b5Ohl+kVcFt/3/bTXsqnpC0bqCK6K45yRE2b02XrCifuqUVNG
	R81Ov2nazeZMU8kYEtWezUcyIBQIoFH/6wRDkJs=
X-Google-Smtp-Source: 
 AGRyM1vT4Safhl3SMKIubXV5mMGO5hcG2ljKOtlbNaNOXQfgAaIg3xLRy8le2yDufT2X19uYzOmujg9syr3AjLgmSeg=
X-Received: by 2002:a05:6870:d611:b0:10d:b8a2:98c5 with SMTP id
 a17-20020a056870d61100b0010db8a298c5mr1932820oaq.175.1658928308689; Wed, 27
 Jul 2022 06:25:08 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CADkTA4OwycAA=stusCGHrEjRga+JP3vjm+U5anU50y-D-0o8kA@mail.gmail.com>
 <8237.1658906356879254972@lists.yoctoproject.org>
In-Reply-To: <8237.1658906356879254972@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 27 Jul 2022 09:24:56 -0400
Message-ID: 
 <CADkTA4NqcVwszOVz7SBHrniKuBa=EK6YeSe02GrmGYALsyovog@mail.gmail.com>
Subject: Re: [meta-virtualization] K3s service not starting after go-lang
 version update in poky
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 27 Jul 2022 13:25:10 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7478

On Wed, Jul 27, 2022 at 3:19 AM Diego Sueiro <diego.sueiro@arm.com> wrote:
>
> Hi Bruce,
>
> On Mon, Jun 27, 2022 at 01:51 PM, Bruce Ashfield wrote:
>
> >
> > On Mon, Jun 27, 2022 at 6:00 AM Kamil Dzie=C5=BCyk <Kamil.Dziezyk@arm.c=
om> wrote:
> > >
> > > Hello Bruce,
> > >
> > > There is a problem with the k3s service starting when the Yocto image=
 is
> > built with the meta-virtualization master branch.
> > >
> > > This issue might be related to the go-lang version(1.18) used to buil=
d the
> > k3s.
> > > After this patch was merged:
> > https://git.yoctoproject.org/poky/commit/?id=3D8dc1f28aa10c775e64b52756=
79b1f8142e8cd038
> > > a warning pops up during the k3s build:
> > > ```
> > > WARNING: k3s-v1.22.6+k3s1+git4262c6b91a43ef8411870f72ff8b8715949f90e2=
-r0
> > do_package_qa: QA Issue: k3s: ELF binary /usr/local/bin/k3s has relocat=
ions in
> > .text [textrel]
> >
> > That warning has actually been around for a while.
> >
> > > ```
> > > See k3s service start logs here: https://pastebin.com/uXvsjPFu
> > > I have tried a more recent version of k3s 1.22.8 with a small change =
and
> > this version of the k3s starts successfully.
> > > However, I did not manage to update all k3s build dependency sources =
from
> > the recipes-container/k3s/src_uri.inc.
> > > I have built the k3s with this change: https://pastebin.com/3QGvcqta
> > >
> > > Could you update the k3s recipe on the master branch, to build a more=
 recent
> > version 1.23 or 1.24?
> >
> > I have a 1.24 update already underway. So hopefully things will be
> > sorted out shortly.
>
> Do you have an ETA for this?

I ran into some really nasty runtime issues, along with build issues,
so I'm now on the 4th micro bump to deal with problems.

There was also a week of squashing buildpath issues in oe-core that
slowed things down.

I have an arbitrary deadline of M3 for these sorts of updates, so that
is the goal and one that is quickly approaching!

Bruce

>
> --
> Diego Sueiro
>
> >
> > Bruce
> >
> > >
> > > Thanks,
> > >
> > > Kamil Dzie=C5=BCyk
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7475): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7475
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

