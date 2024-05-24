Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A08C25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 19:40:41 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.4144.1716579635268254865
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 May 2024 12:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bnrNU++B;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-529646df247so1208407e87.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 12:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716579633; x=1717184433; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWeuEW5ljnlTVNDnFNCGbKtooC1QzlQAkN9aJDomzU4=;
        b=bnrNU++B3hoi7yYnOW31lXS/UGTXZpHitktIUOBEBDlYO/LLcCUe0zJPn5pdZ3dXsy
         adE2RmEAdJDt4y+YQbLiixiPvTPA1sPSVmoRy2ixbKjrLS3M8RfObbSKzMbThRkTdu/0
         HkV7eCeiWCywdD8Pr4k0r18I55rdvYo+PEaMInxkIlCy1H3IZoBMFJTUpkZUUgB5v1Ow
         AlK+0gFvArxqY3xFxEeIUK0pPhUhl4KBBXnJ7Eh7AqJE9OF0Y7DzAyZEdCZ2otskSTXC
         HxdpDKLL3XSMxxT4uHkxp2NHJ7IO5/0LLNzK5xDK7AyG9HMwS2BP2UuqP4x/kyHaTIPN
         rqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716579633; x=1717184433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWeuEW5ljnlTVNDnFNCGbKtooC1QzlQAkN9aJDomzU4=;
        b=L3NTx6x43//u3sT8qXWzqCkdU75FC5Iz9NU0aRZKjNKVYBzCqOt9vmmDG4ilpmXQJ6
         hR0d9wWuN1aVgqRhWN1I0B7cRcgya3itef7ajeai3Hj/21zOOtR3jEQff0soBOiv0Ljx
         1wDBSjGyUya7k1P6ru8XtrKAXP9PiFqe6TKv70jxwnd+pcPMXKDyK12WXB10R+cThXL0
         6MgwartcmqxEuxAE/uHwrrorbeFBulQh8aDsk8CpWF6p/ajerYmHRiaJNiBsSJQW3VCL
         X/VVG6SbwJF++u6+nsgEXclJcM8435aSBBToNj6L6p/ov5IUGWhmj0EiamNcnAHeoJXY
         DOZQ==
X-Gm-Message-State: AOJu0YysKLgza9uHWMh1q5eRM5H6IALxzCGXW3h1uwYMPI1BuKdvXXUe
	Qy0FQYXym8Dbg46LT1fv/xRyY0i9o/OesqkLSti5EM1vwvUmh3EfMEUxP504UV6RAr2g0pJ4Wx4
	not80W5I2kma2W3AiKUC5f+ZnICU=
X-Google-Smtp-Source: AGHT+IEPZF7ctHJggC5fQakuoDGt7unbs5hJIwgDKyhZa79Ql5iuO8TygLV+ErqzLEffQM9Ox7XKYD8gNlQHWIV463I=
X-Received: by 2002:ac2:4acf:0:b0:529:593f:3f3c with SMTP id
 2adb3069b0e04-529666d5dfemr2065958e87.53.1716579633190; Fri, 24 May 2024
 12:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240524190915.1241716-1-martin.jansa@gmail.com>
 <20240524190915.1241716-2-martin.jansa@gmail.com> <CADkTA4MJRMzVBZ7vksRw_+oHusHvGJhu9dQaL3HbwNKTvfaNJA@mail.gmail.com>
 <CA+chaQeNR23+LHGka=cyQzkE-2s5+Fo7qjrPKp_8QTb64F1rSw@mail.gmail.com> <CADkTA4Pnpohs_L7_fyu+XLKZLNPF6j=YW+5GHb-duPR__5M7Yg@mail.gmail.com>
In-Reply-To: <CADkTA4Pnpohs_L7_fyu+XLKZLNPF6j=YW+5GHb-duPR__5M7Yg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 24 May 2024 21:40:14 +0200
Message-ID: <CA+chaQe9dY205PvWwyPBHe0cYJs7it1OrL25F7+xhtoW42Z=4g@mail.gmail.com>
Subject: Re: [meta-virtualization] [RFC][PATCH 2/3] cni: use GO_SRCURI_DESTSUFFIX
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 19:40:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8765

On Fri, May 24, 2024 at 9:32=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
> Interesting.
>
> I've been through the layer now and have done all the simple semantic
> changes to adjust things.
>
> I'm almost to runtime testing, but expect that by Monday I'll have
> everything sorted.

OK, looking forward to the master-next update (and kirkstone update)
to have a bit greener world builds again :).

>
> Bruce
>
> On Fri, May 24, 2024 at 3:26=E2=80=AFPM Martin Jansa <martin.jansa@gmail.=
com> wrote:
> >
> > It was failing yesterday, but today it built OK, I didn't do any
> > runtime testing (only checked buildhistory-diff).
> >
> > Have similar change for nerdctl cri-tools, only yq and docker-moby are
> > still failing for me.
> >
> > On Fri, May 24, 2024 at 9:22=E2=80=AFPM Bruce Ashfield <bruce.ashfield@=
gmail.com> wrote:
> > >
> > > Did you get this to build with just that change ?
> > >
> > > My patches to cni are significantly larger to get it to build and
> > > create binaries.
> > >
> > > Bruce
> > >
> > > On Fri, May 24, 2024 at 3:09=E2=80=AFPM Martin Jansa via
> > > lists.yoctoproject.org <martin.jansa=3Dgmail.com@lists.yoctoproject.o=
rg>
> > > wrote:
> > > >
> > > > * see:
> > > >   https://lists.openembedded.org/g/openembedded-architecture/messag=
e/2007
> > > >   https://git.openembedded.org/openembedded-core/commit/?id=3Dcc4ec=
43a2b657fb4c58429ab14f1edc2473c1327
> > > >
> > > > * fixes:
> > > >   http://errors.yoctoproject.org/Errors/Details/772691/
> > > >   ERROR: QA Issue: cni: LIC_FILES_CHKSUM points to an invalid file:=
 TOPDIR/tmp-glibc/work/core2-64-oe-linux/cni/v1.2.0-rc0+gitb62753aa2bfa365c=
1ceaff6f25774a8047c896b5/cni-v1.2.0-rc0+gitb62753aa2bfa365c1ceaff6f25774a80=
47c896b5/src/import/LICENSE [license-checksum]
> > > >
> > > > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > > > ---
> > > >  recipes-networking/cni/cni_git.bb | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking=
/cni/cni_git.bb
> > > > index b41b47cf..c0f316ec 100644
> > > > --- a/recipes-networking/cni/cni_git.bb
> > > > +++ b/recipes-networking/cni/cni_git.bb
> > > > @@ -14,7 +14,7 @@ SRCREV_plugins =3D "b6a0e0bc96906f0d3bd6bfcaab0b5=
ae72292f46c"
> > > >  SRCREV_flannel_plugin =3D "6464faacf5c00e25321573225d74638455ef03a=
0"
> > > >  SRCREV_FORMAT =3D "cni_plugins"
> > > >  SRC_URI =3D "\
> > > > -       git://github.com/containernetworking/cni.git;branch=3Dmain;=
name=3Dcni;protocol=3Dhttps \
> > > > +       git://github.com/containernetworking/cni.git;branch=3Dmain;=
name=3Dcni;protocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
> > > >          git://github.com/containernetworking/plugins.git;branch=3D=
main;destsuffix=3D${S}/src/github.com/containernetworking/plugins;name=3Dpl=
ugins;protocol=3Dhttps \
> > > >          git://github.com/flannel-io/cni-plugin;branch=3Dmain;name=
=3Dflannel_plugin;protocol=3Dhttps;destsuffix=3D${S}/src/github.com/contain=
ernetworking/plugins/plugins/meta/flannel \
> > > >          file://modules.txt \
> > > > --
> > > > 2.45.1
> > > >
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#8756): https://lists.yoctoproject.org/g/meta-vi=
rtualization/message/8756
> > > > Mute This Topic: https://lists.yoctoproject.org/mt/106287452/105081=
0
> > > > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > > > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/u=
nsub [bruce.ashfield@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >
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

