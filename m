Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF40C25B7E
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 16:00:40 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.18789.1716998438850820980
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 May 2024 09:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oagr2S+0;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-68197de7400so1720047a12.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 May 2024 09:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716998438; x=1717603238; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZNwOtkyXjJnkZVJjpBbUgYGDe4t20Ehh+b5qK3aSlA=;
        b=Oagr2S+0rVrpO/pNosHXy2NirWxZoMUaCtX1RrN4avtAPXqpA5lPzuxiqmv/AFTTPX
         UH9o0nh/MxfxgmNOmXgXWcgLM2SbVYeZ4pxKLqi9irHnv+U1LZ/LyzfSPqnnvwdaFTrz
         uo97qWWgqib+k9FlZ2hnfx/1cjcahYafDURZINPf6XzUwgeyJjYYsbW4Zgb4V3HT7yFZ
         j1TVE5n8ReEV/41BZt2LHvfXpFd1YnCZXAFpmjZpbvj5tiLXNTIt2FwdC4DCKSaVSGnS
         yUX6MYyXReSYjidY/pvm5hvruqJtW5t1UBqUAiORpDbr5BRX0/hZI/Q4FDquMZ5gtVvg
         DHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716998438; x=1717603238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZNwOtkyXjJnkZVJjpBbUgYGDe4t20Ehh+b5qK3aSlA=;
        b=i91uHWWVDTOhxwd985eqh/LlYrO5Wo+Nkw7ALSaDdxOUPgrqXSGOuwWGWmPR8E3Nz1
         je3Pn6zsH16oIAm9AEqsWdgu7MfxHPhI3v8SKMJdMG4nFToBl6GBOb7rORKnuvupyeqQ
         Oi3KN52RrF0qa9orJFwk7+v6iOz+yoUcXO7KK53mgHi1lvoaL6tAQM+/8iwPEOOxinGg
         0uIWpa1xfesrWPqkcScdIgr7Q1DQFhN8ZWcMXiiid2t46U+zEX+K0LrQR/Nf8WuTUTtu
         QADPsBWq2EJp2j+AEjHwXD2pW3NEqEvfgfIZ6PTjdUdXDyGIkZXP+aFy7y38ngFHawAh
         MSBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgj07OGYbG81miKxiwLZayP40enYb0ldl/j59ubyQzWBj2QCL5eYVMoDZN5kQ3S8qQwF689iZIs6rnDDU763RIk6Bly00FUQ4o//0H+qCRAw2e7/xjMjp2nwo=
X-Gm-Message-State: AOJu0YwkP9ZgjSu+fLZLEo4APcXynleKnXVenSrY+AC6sp5y5PEuBBB5
	EhIclzPce1JWU22fdIr9LtvxD8XHnvkfBiuNxhHJ8KJkdsoytwmUXIcCVN/ZvgVYwa1WOucReiw
	zpEkWaGnCZaexHdDm9irsKnEhl6Q=
X-Google-Smtp-Source: AGHT+IGNtNY1Xotj7h2YZQb/aUoaAVYzBBOdZohkgNGyKqyy8s1HRXZmTRQPiOVfuS5XuXEKi9rrNzKk19sge9db+ls=
X-Received: by 2002:a17:90a:fc85:b0:2c0:17b4:858f with SMTP id
 98e67ed59e1d1-2c017b487c4mr4439180a91.37.1716998437873; Wed, 29 May 2024
 09:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240524190915.1241716-1-martin.jansa@gmail.com>
 <20240524190915.1241716-2-martin.jansa@gmail.com> <CADkTA4MJRMzVBZ7vksRw_+oHusHvGJhu9dQaL3HbwNKTvfaNJA@mail.gmail.com>
 <CA+chaQeNR23+LHGka=cyQzkE-2s5+Fo7qjrPKp_8QTb64F1rSw@mail.gmail.com>
 <CADkTA4Pnpohs_L7_fyu+XLKZLNPF6j=YW+5GHb-duPR__5M7Yg@mail.gmail.com>
 <CA+chaQe9dY205PvWwyPBHe0cYJs7it1OrL25F7+xhtoW42Z=4g@mail.gmail.com>
 <CADkTA4OVX8p1bU5nRKT3LBUvfHJ3aCA1ZbAcUpEbFXQwMBYY=w@mail.gmail.com> <3da1f706-e892-aff5-0577-8e91b6c3e58f@windriver.com>
In-Reply-To: <3da1f706-e892-aff5-0577-8e91b6c3e58f@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 29 May 2024 12:00:25 -0400
Message-ID: <CADkTA4MDwcjFm4k4qyoomo1Lz=xgwVHdN2nQsZGS5HAnG3-zfg@mail.gmail.com>
Subject: Re: [meta-virtualization] [RFC][PATCH 2/3] cni: use GO_SRCURI_DESTSUFFIX
To: ChenQi <Qi.Chen@windriver.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 May 2024 16:00:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8783

On Wed, May 29, 2024 at 5:34=E2=80=AFAM ChenQi <Qi.Chen@windriver.com> wrot=
e:
>
> Hi Bruce,
>
> I did some investigation this afternoon. A patch series has been sent,
> which mostly comes from 'grep + sed', and also includes a patch from Mart=
in.
> I did build tests, the result looks good to me. I think the only
> remaining recipes that need to be dealt with are: yq and possibly runv.

runv has been put into read-only mode, so I'm going to remove it from
the layer and pull in a replacement. So nothing really to do on their front=
.

Bruce

> I'll need to do something else tomorrow. Hope you or someone else could
> check more.
> Hope this would help a little bit.
>
> Regards,
> Qi
>
> On 5/28/24 04:37, Bruce Ashfield via lists.yoctoproject.org wrote:
> > As an update. My patience is wearing thin.
> >
> > The posted patches don't build for me, my changes don't build for me,
> > if I hack things, the runtime is broken.
> >
> > I'm seeing different fetching and source management based on the
> > number of git repositories in the SCR_URI, which means I'm running
> > into everything from missing source to license checksum failures when
> > I reorganize the code.
> >
> > I'm stubborn about this sort of thing, there's no sense in me just
> > merging patches that don't build on my machines, and/or patches that I
> > don't understand how they fix issues, since I'll never be able to
> > maintain things afterwards.
> >
> > I am still working on this, but I'm no debugging oe-core code to try
> > and understand what is happening and why the behaviour is changing, so
> > everything is extremely hacked up and I'm not even near a RFT branch
> > yet.
> >
> > Summary: it will be quite some time before I have meta-virt working
> > again, since I feel like I've had a bag of rocks dumped right on top
> > of me and changes to core that I don't have straight in my head yet.
> >
> > Bruce
> >
> > On Fri, May 24, 2024 at 3:40=E2=80=AFPM Martin Jansa <martin.jansa@gmai=
l.com> wrote:
> >> On Fri, May 24, 2024 at 9:32=E2=80=AFPM Bruce Ashfield <bruce.ashfield=
@gmail.com> wrote:
> >>> Interesting.
> >>>
> >>> I've been through the layer now and have done all the simple semantic
> >>> changes to adjust things.
> >>>
> >>> I'm almost to runtime testing, but expect that by Monday I'll have
> >>> everything sorted.
> >> OK, looking forward to the master-next update (and kirkstone update)
> >> to have a bit greener world builds again :).
> >>
> >>> Bruce
> >>>
> >>> On Fri, May 24, 2024 at 3:26=E2=80=AFPM Martin Jansa <martin.jansa@gm=
ail.com> wrote:
> >>>> It was failing yesterday, but today it built OK, I didn't do any
> >>>> runtime testing (only checked buildhistory-diff).
> >>>>
> >>>> Have similar change for nerdctl cri-tools, only yq and docker-moby a=
re
> >>>> still failing for me.
> >>>>
> >>>> On Fri, May 24, 2024 at 9:22=E2=80=AFPM Bruce Ashfield <bruce.ashfie=
ld@gmail.com> wrote:
> >>>>> Did you get this to build with just that change ?
> >>>>>
> >>>>> My patches to cni are significantly larger to get it to build and
> >>>>> create binaries.
> >>>>>
> >>>>> Bruce
> >>>>>
> >>>>> On Fri, May 24, 2024 at 3:09=E2=80=AFPM Martin Jansa via
> >>>>> lists.yoctoproject.org <martin.jansa=3Dgmail.com@lists.yoctoproject=
.org>
> >>>>> wrote:
> >>>>>> * see:
> >>>>>>    https://lists.openembedded.org/g/openembedded-architecture/mess=
age/2007
> >>>>>>    https://git.openembedded.org/openembedded-core/commit/?id=3Dcc4=
ec43a2b657fb4c58429ab14f1edc2473c1327
> >>>>>>
> >>>>>> * fixes:
> >>>>>>    http://errors.yoctoproject.org/Errors/Details/772691/
> >>>>>>    ERROR: QA Issue: cni: LIC_FILES_CHKSUM points to an invalid fil=
e: TOPDIR/tmp-glibc/work/core2-64-oe-linux/cni/v1.2.0-rc0+gitb62753aa2bfa36=
5c1ceaff6f25774a8047c896b5/cni-v1.2.0-rc0+gitb62753aa2bfa365c1ceaff6f25774a=
8047c896b5/src/import/LICENSE [license-checksum]
> >>>>>>
> >>>>>> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> >>>>>> ---
> >>>>>>   recipes-networking/cni/cni_git.bb | 2 +-
> >>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networkin=
g/cni/cni_git.bb
> >>>>>> index b41b47cf..c0f316ec 100644
> >>>>>> --- a/recipes-networking/cni/cni_git.bb
> >>>>>> +++ b/recipes-networking/cni/cni_git.bb
> >>>>>> @@ -14,7 +14,7 @@ SRCREV_plugins =3D "b6a0e0bc96906f0d3bd6bfcaab0b=
5ae72292f46c"
> >>>>>>   SRCREV_flannel_plugin =3D "6464faacf5c00e25321573225d74638455ef0=
3a0"
> >>>>>>   SRCREV_FORMAT =3D "cni_plugins"
> >>>>>>   SRC_URI =3D "\
> >>>>>> -       git://github.com/containernetworking/cni.git;branch=3Dmain=
;name=3Dcni;protocol=3Dhttps \
> >>>>>> +       git://github.com/containernetworking/cni.git;branch=3Dmain=
;name=3Dcni;protocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
> >>>>>>           git://github.com/containernetworking/plugins.git;branch=
=3Dmain;destsuffix=3D${S}/src/github.com/containernetworking/plugins;name=
=3Dplugins;protocol=3Dhttps \
> >>>>>>           git://github.com/flannel-io/cni-plugin;branch=3Dmain;nam=
e=3Dflannel_plugin;protocol=3Dhttps;destsuffix=3D${S}/src/github.com/contai=
nernetworking/plugins/plugins/meta/flannel \
> >>>>>>           file://modules.txt \
> >>>>>> --
> >>>>>> 2.45.1
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>
> >>>>> --
> >>>>> - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
> >>>>> thee at its end
> >>>>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>
> >>>
> >>> --
> >>> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >>> thee at its end
> >>> - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8769): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/8769
> > Mute This Topic: https://lists.yoctoproject.org/mt/106287452/3618072
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [Qi.Chen@windriver.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

