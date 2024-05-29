Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097EBC27C43
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 10:04:49 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.10152.1716977085079562854
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 May 2024 03:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NZRcO1LE;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52962423ed8so2214843e87.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 May 2024 03:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716977083; x=1717581883; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8dGp0OBtZTz6GATg6ff3AiJyWx1/M/SgBt1V6tuh2E=;
        b=NZRcO1LErIuLTmJw+oQ79ZsHdwuPrYuukENlLUL8JXqB14zVxLrQcq+sq83yIF1ufy
         Eiv0CcbgUNJkWaaDHNebgb657W19qVQBx4L813nO9chEvE8kqpzkuZ0VgtD5uAzh1NjT
         rGfuYqw73vOOiPJPhLVhQzAqMx05i/A89xGkWZNtyPv1gTzHMKoQWkNcPgQINnFEtNJ/
         NMd20XW+nk8GKM1lreia7W1mrwIlNboIxpcUXm3wvUnO7Z2bPU4f+Ag3K/bW94k1u7tn
         FVf35nf6i1WwDUyxoDUmf+eRcQTYI88ie5LFaI3nGWjm6ol+ftXshhXVUmJ8DkJGeN9K
         wysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716977083; x=1717581883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8dGp0OBtZTz6GATg6ff3AiJyWx1/M/SgBt1V6tuh2E=;
        b=ABKtRpnB0W9UC1plkAe6rU052bjJe3P35ootJ3D6MMkJsuhI+jBQ5MbDGLEjxGsNkv
         XQnWMJZI5T8QgxJsWhtrVdca6VrGlEenaZMhM1bZUSODiuuTeRPcTZanEP3WkAziBp6z
         kaT1ixkqT3arqxn6D/9YalzNgTf1dMhhcdB67oGdmx1RF1+EOrulJBDDImeI2d4yagCh
         mCeqVrXkKprLentTx64zmEIWqp6pSyIJIS+gVdRlkL2d5Ll+jWuBY343j5RWCWo5vGy5
         ofXz0elXwT/6w/h3d87kB3SMkN3uKoYSvT64DsNozIbY1h5KfmzwF5DYuwPU8JMaBcMv
         tAzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaf0/0mw1XMwNl/rq1YbHDOTzZ624KqkNfwsjvMou0SlcQx+De09Kub2xbxJNlM9LU/iiha0YTngzSbR+IR/OoMQCDj4l0jiWa6o0OVT/dfjLgjdvpT/tALWg=
X-Gm-Message-State: AOJu0Yy6VA9keT6gz7lEf5nvzhcOrp8x42wxNt/9yZkpbnh+5BRkQccM
	ja6gaXhbPf5ubG2hESrqOZ6ezn2PXuudk5VDZakrNPvrYCq2tRgZkoCGngjRx6WNEViIy1K51+Z
	7LIK6VOvYLZ9QPE7c2xFJGNHzWsE=
X-Google-Smtp-Source: AGHT+IGnqhB6LUDqLNbxaeQQuMkNPnE457NkhWGbwRYbm6sjP++/smYrtVud+l8uBSxCRQ5ToPyLMRr0dELQtOz66IM=
X-Received: by 2002:ac2:4f8a:0:b0:519:6953:2ffc with SMTP id
 2adb3069b0e04-52966ca64bbmr8391900e87.42.1716977083010; Wed, 29 May 2024
 03:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240524190915.1241716-1-martin.jansa@gmail.com>
 <20240524190915.1241716-2-martin.jansa@gmail.com> <CADkTA4MJRMzVBZ7vksRw_+oHusHvGJhu9dQaL3HbwNKTvfaNJA@mail.gmail.com>
 <CA+chaQeNR23+LHGka=cyQzkE-2s5+Fo7qjrPKp_8QTb64F1rSw@mail.gmail.com>
 <CADkTA4Pnpohs_L7_fyu+XLKZLNPF6j=YW+5GHb-duPR__5M7Yg@mail.gmail.com>
 <CA+chaQe9dY205PvWwyPBHe0cYJs7it1OrL25F7+xhtoW42Z=4g@mail.gmail.com>
 <CADkTA4OVX8p1bU5nRKT3LBUvfHJ3aCA1ZbAcUpEbFXQwMBYY=w@mail.gmail.com> <3da1f706-e892-aff5-0577-8e91b6c3e58f@windriver.com>
In-Reply-To: <3da1f706-e892-aff5-0577-8e91b6c3e58f@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 29 May 2024 12:04:20 +0200
Message-ID: <CA+chaQd4j=n0r9-1sh_G4-h4Md78SmZDCVpUsjYDOOiw=A=1PA@mail.gmail.com>
Subject: Re: [meta-virtualization] [RFC][PATCH 2/3] cni: use GO_SRCURI_DESTSUFFIX
To: ChenQi <Qi.Chen@windriver.com>
Cc: bruce.ashfield@gmail.com, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 May 2024 10:04:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8779

FWIW: my colleague sent me some fixes for my WIP jansa/master branch in:
https://github.com/shr-project/meta-virtualization/pull/1
https://github.com/shr-project/meta-virtualization/pull/2
I haven't shared them as I'm waiting for master-next branch to be
updated to see what's left to fix (and hard to guess what Bruce is
cooking)

On Wed, May 29, 2024 at 11:34=E2=80=AFAM ChenQi <Qi.Chen@windriver.com> wro=
te:
>
> Hi Bruce,
>
> I did some investigation this afternoon. A patch series has been sent,
> which mostly comes from 'grep + sed', and also includes a patch from Mart=
in.
> I did build tests, the result looks good to me. I think the only
> remaining recipes that need to be dealt with are: yq and possibly runv.
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

