Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D38C25B74
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 03:26:09 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.14177.1716866760555260129
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 May 2024 20:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GXuMKVU8;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2bdf446f3d1so257588a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 May 2024 20:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716866760; x=1717471560; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jq+L1ksFfLwk8BOkMViLDyh2N032y5Kmd9EGqWCuQc8=;
        b=GXuMKVU8JZshCJZkxZInKU4u4AZAQuAwdDz1E6mAeIhTbyl232qJfHh36rClYy7WZ2
         NK04GAKP4WgMqFop6aLHYpU6N8CNn8Om/n7JPO6uVYCkI8DGvcNlJLMd/DUQfZ3VxJVD
         h8YB/KArBRr+S4N7KuGixmsMrXWuePZA09ozHOSxXNMb0bGnSOFmHWLNNHJAJaFwMpWV
         FUpsy4SJF2szvS+jV3Rmkf+YSmlcg/rLICDDE16Gu+gVLFy3pLIl/asimXA3jgPFcoP6
         joIJGJkogtcxo8DEGkcOKXB1o/Y0v+vJ0hLZ9BzQFeQN95c1G9AXM+DtlOMIDj5Czd44
         wEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716866760; x=1717471560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jq+L1ksFfLwk8BOkMViLDyh2N032y5Kmd9EGqWCuQc8=;
        b=r8S3ai6KeQjy0Xj3hWYpOUAELrkApqwO2oCQTg3SQYa4kYLWwrKe5FVaptAKcQGXV/
         PwcGw/sIBe9PXAUeh/euXq4PK0DVGwv9LtQL9CYcyOZdwe5p31fJ1yHdusds378AUwb+
         N6ulyhnUbRcKYuYOMU8vpOPaUTum2FMHTZNgXLQBTkzqPiiffVJlFZ2b1FO1zxis5fWK
         bP5lmeesEKfqi/VECnKo7oSMhyM3Swd98/ObqrxyTNFdBkH2+YASz00O80i2aLEzYBgk
         WhecNHo5hOHSJXHxxmEDbEprqsnS7Nap3nyd2iM2XVQIFJrpoEOxKUF/7C114k1GDzGl
         +hSA==
X-Forwarded-Encrypted: i=1; AJvYcCWu8Q1htBkyNtavJwQvRuPsEwCvi0VhLmDJLqioNR+3Kl8ynUgeuxrq/QTS7vSUUwbzx6G3g/MneNh4vjmyCLZUAGRjMgj1tTOay6ht9Y3fWs2zoaIeU/Fg1Qw=
X-Gm-Message-State: AOJu0YwwnoD3oYOfXrSI7z3t2sPc0PgpS0CLeb7aIA6C7BLeKbXAsArO
	CoaDZiKTPQB/7dG1cKuYEIrhXHSt2naHcKBW62lo8kklg8+7B9BOmUVDD6PBD3PBFmrt2xDcLro
	xB2AmygJmVM7CAibpcrN9YMs6d/k=
X-Google-Smtp-Source: AGHT+IFvfTebCNydmeAz8f56PNTpJuvoQTRiEDc68lsgJ3prt0ZriU40bzHqZzGAmButvjXOhNl0reEyWfFicji7+z8=
X-Received: by 2002:a17:90a:d143:b0:2c0:11d4:b2e0 with SMTP id
 98e67ed59e1d1-2c011d4b31bmr128091a91.34.1716866759780; Mon, 27 May 2024
 20:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240524190915.1241716-1-martin.jansa@gmail.com>
 <20240524190915.1241716-2-martin.jansa@gmail.com> <CADkTA4MJRMzVBZ7vksRw_+oHusHvGJhu9dQaL3HbwNKTvfaNJA@mail.gmail.com>
 <CA+chaQeNR23+LHGka=cyQzkE-2s5+Fo7qjrPKp_8QTb64F1rSw@mail.gmail.com>
 <CADkTA4Pnpohs_L7_fyu+XLKZLNPF6j=YW+5GHb-duPR__5M7Yg@mail.gmail.com>
 <CA+chaQe9dY205PvWwyPBHe0cYJs7it1OrL25F7+xhtoW42Z=4g@mail.gmail.com> <17D372F5902822DA.24533@lists.yoctoproject.org>
In-Reply-To: <17D372F5902822DA.24533@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 27 May 2024 23:25:48 -0400
Message-ID: <CADkTA4O7fDg5wfCyHiTwkyBZbRQaUb3MuDDZ0X8CW9YUpX37LQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [RFC][PATCH 2/3] cni: use GO_SRCURI_DESTSUFFIX
To: bruce.ashfield@gmail.com
Cc: Martin Jansa <martin.jansa@gmail.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 May 2024 03:26:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8770

On Mon, May 27, 2024 at 4:38=E2=80=AFPM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> As an update. My patience is wearing thin.
>
> The posted patches don't build for me, my changes don't build for me,
> if I hack things, the runtime is broken.
>
> I'm seeing different fetching and source management based on the
> number of git repositories in the SCR_URI, which means I'm running
> into everything from missing source to license checksum failures when
> I reorganize the code.
>
> I'm stubborn about this sort of thing, there's no sense in me just
> merging patches that don't build on my machines, and/or patches that I
> don't understand how they fix issues, since I'll never be able to
> maintain things afterwards.
>
> I am still working on this, but I'm no debugging oe-core code to try
> and understand what is happening and why the behaviour is changing, so
> everything is extremely hacked up and I'm not even near a RFT branch
> yet.
>
> Summary: it will be quite some time before I have meta-virt working
> again, since I feel like I've had a bag of rocks dumped right on top
> of me and changes to core that I don't have straight in my head yet.

I did finally come to a better understanding of what is breaking some
of the packages and I've now fixed them.

I'm working on some of the more complex container ones tomorrow,
but I expect to have the branch ready for more testing on Tuesday.

Bruce

>
> Bruce
>
> On Fri, May 24, 2024 at 3:40=E2=80=AFPM Martin Jansa <martin.jansa@gmail.=
com> wrote:
> >
> > On Fri, May 24, 2024 at 9:32=E2=80=AFPM Bruce Ashfield <bruce.ashfield@=
gmail.com> wrote:
> > >
> > > Interesting.
> > >
> > > I've been through the layer now and have done all the simple semantic
> > > changes to adjust things.
> > >
> > > I'm almost to runtime testing, but expect that by Monday I'll have
> > > everything sorted.
> >
> > OK, looking forward to the master-next update (and kirkstone update)
> > to have a bit greener world builds again :).
> >
> > >
> > > Bruce
> > >
> > > On Fri, May 24, 2024 at 3:26=E2=80=AFPM Martin Jansa <martin.jansa@gm=
ail.com> wrote:
> > > >
> > > > It was failing yesterday, but today it built OK, I didn't do any
> > > > runtime testing (only checked buildhistory-diff).
> > > >
> > > > Have similar change for nerdctl cri-tools, only yq and docker-moby =
are
> > > > still failing for me.
> > > >
> > > > On Fri, May 24, 2024 at 9:22=E2=80=AFPM Bruce Ashfield <bruce.ashfi=
eld@gmail.com> wrote:
> > > > >
> > > > > Did you get this to build with just that change ?
> > > > >
> > > > > My patches to cni are significantly larger to get it to build and
> > > > > create binaries.
> > > > >
> > > > > Bruce
> > > > >
> > > > > On Fri, May 24, 2024 at 3:09=E2=80=AFPM Martin Jansa via
> > > > > lists.yoctoproject.org <martin.jansa=3Dgmail.com@lists.yoctoproje=
ct.org>
> > > > > wrote:
> > > > > >
> > > > > > * see:
> > > > > >   https://lists.openembedded.org/g/openembedded-architecture/me=
ssage/2007
> > > > > >   https://git.openembedded.org/openembedded-core/commit/?id=3Dc=
c4ec43a2b657fb4c58429ab14f1edc2473c1327
> > > > > >
> > > > > > * fixes:
> > > > > >   http://errors.yoctoproject.org/Errors/Details/772691/
> > > > > >   ERROR: QA Issue: cni: LIC_FILES_CHKSUM points to an invalid f=
ile: TOPDIR/tmp-glibc/work/core2-64-oe-linux/cni/v1.2.0-rc0+gitb62753aa2bfa=
365c1ceaff6f25774a8047c896b5/cni-v1.2.0-rc0+gitb62753aa2bfa365c1ceaff6f2577=
4a8047c896b5/src/import/LICENSE [license-checksum]
> > > > > >
> > > > > > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > > > > > ---
> > > > > >  recipes-networking/cni/cni_git.bb | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networ=
king/cni/cni_git.bb
> > > > > > index b41b47cf..c0f316ec 100644
> > > > > > --- a/recipes-networking/cni/cni_git.bb
> > > > > > +++ b/recipes-networking/cni/cni_git.bb
> > > > > > @@ -14,7 +14,7 @@ SRCREV_plugins =3D "b6a0e0bc96906f0d3bd6bfcaa=
b0b5ae72292f46c"
> > > > > >  SRCREV_flannel_plugin =3D "6464faacf5c00e25321573225d74638455e=
f03a0"
> > > > > >  SRCREV_FORMAT =3D "cni_plugins"
> > > > > >  SRC_URI =3D "\
> > > > > > -       git://github.com/containernetworking/cni.git;branch=3Dm=
ain;name=3Dcni;protocol=3Dhttps \
> > > > > > +       git://github.com/containernetworking/cni.git;branch=3Dm=
ain;name=3Dcni;protocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
> > > > > >          git://github.com/containernetworking/plugins.git;branc=
h=3Dmain;destsuffix=3D${S}/src/github.com/containernetworking/plugins;name=
=3Dplugins;protocol=3Dhttps \
> > > > > >          git://github.com/flannel-io/cni-plugin;branch=3Dmain;n=
ame=3Dflannel_plugin;protocol=3Dhttps;destsuffix=3D${S}/src/github.com/cont=
ainernetworking/plugins/plugins/meta/flannel \
> > > > > >          file://modules.txt \
> > > > > > --
> > > > > > 2.45.1
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > >
> > > > >
> > > > > --
> > > > > - Thou shalt not follow the NULL pointer, for chaos and madness a=
wait
> > > > > thee at its end
> > > > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8769): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8769
> Mute This Topic: https://lists.yoctoproject.org/mt/106287452/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

