Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF63C25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 19:32:21 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.3987.1716579132519728525
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 May 2024 12:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AmuCttU2;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-65c5a29f7f0so4231257a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 12:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716579132; x=1717183932; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVDzvdG4msvztJA5vKpuO8AMfoh6oMSyX3OVZAmBDJc=;
        b=AmuCttU22/o/PoWEKI2vXhfDe+V+X8Jqki6rkQR8oRc8aMHP5wjCmzFLK42N9NNvRD
         PdjNteZ9OAnQUKwqFpzTWAhEoo2b1FvGIlIAXQYDIh7uNw7vlRGEHZ2fY9OikTWOJceX
         izsNgdWwDsSpUvmR4vUmUCvom8RJwu71yxP9f5d+60JkRU2qa6S4VM1Ho88vK5KtZccp
         x9qfOrvCGo9OvQUDgROf+gA+MvcDq5SBs+DFAFaFKa+dg7P9tJVGkkspkoVvOX9vef2j
         H2vc31PCThfd4weeHu4V31ELhJK4TkjE0zZJYOydB6D3dORczkE1WRUB0mRXESILUb5j
         vUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716579132; x=1717183932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVDzvdG4msvztJA5vKpuO8AMfoh6oMSyX3OVZAmBDJc=;
        b=AvcXclR30L3HqAwtFw8621ClWDRvHsaubNCSmCNXyckiCQKuafYhzvpXOPcKezJs3w
         jPg3JNwiBge0bjNXRjnrnO9+10MSgBQnalmh9Vy6bQdV8KQxW5fWYjutxfuuFyhJNoiK
         qjzlRvudLUFtmpOaDe2FY/rtWEau1CvjQIpA3EDzRAHZy//ouOrZLzeG4iw7xcAbPy3x
         IzHJ2rWk4Uhkx6Iba4QSvz4h2Lbp9xQhha8UzTLhbmFHAYYrpJpAnEymQ0NIL15tYj9G
         dixPasdYnH+uWm+Edsg9Fs9K6O8Y2njdWo6FBC30Cikx1LgcC6pUJywzXEYmblX2IWSP
         9ugQ==
X-Gm-Message-State: AOJu0YzCuIqiJVnz3jdX1z8twuij2GuuIah/z3udxalo3BOJnBR3JQXL
	VOMfhKj2qJhhBcUAj8DFEgFd8+1qrTGSKtYh8AT9T9QOUpS4dPZu3sFYDVvZ/OwL943c/ysrp80
	UiWbVw/lrAHZOKdI3+bKbEsvBr8H8mw==
X-Google-Smtp-Source: AGHT+IHkiVwPAj0/v8lL7HoKJxHjYWhFK7UjJ2oXajkCSWGMHpwkGVV7ErT76arVqmqNLhQHCH6esVme8uyB8Co404s=
X-Received: by 2002:a17:90b:d86:b0:2bd:f1ce:1922 with SMTP id
 98e67ed59e1d1-2bf5f711103mr3093646a91.33.1716579131868; Fri, 24 May 2024
 12:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240524190915.1241716-1-martin.jansa@gmail.com>
 <20240524190915.1241716-2-martin.jansa@gmail.com> <CADkTA4MJRMzVBZ7vksRw_+oHusHvGJhu9dQaL3HbwNKTvfaNJA@mail.gmail.com>
 <CA+chaQeNR23+LHGka=cyQzkE-2s5+Fo7qjrPKp_8QTb64F1rSw@mail.gmail.com>
In-Reply-To: <CA+chaQeNR23+LHGka=cyQzkE-2s5+Fo7qjrPKp_8QTb64F1rSw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 24 May 2024 15:32:00 -0400
Message-ID: <CADkTA4Pnpohs_L7_fyu+XLKZLNPF6j=YW+5GHb-duPR__5M7Yg@mail.gmail.com>
Subject: Re: [meta-virtualization] [RFC][PATCH 2/3] cni: use GO_SRCURI_DESTSUFFIX
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 19:32:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8764

Interesting.

I've been through the layer now and have done all the simple semantic
changes to adjust things.

I'm almost to runtime testing, but expect that by Monday I'll have
everything sorted.

Bruce

On Fri, May 24, 2024 at 3:26=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> It was failing yesterday, but today it built OK, I didn't do any
> runtime testing (only checked buildhistory-diff).
>
> Have similar change for nerdctl cri-tools, only yq and docker-moby are
> still failing for me.
>
> On Fri, May 24, 2024 at 9:22=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gm=
ail.com> wrote:
> >
> > Did you get this to build with just that change ?
> >
> > My patches to cni are significantly larger to get it to build and
> > create binaries.
> >
> > Bruce
> >
> > On Fri, May 24, 2024 at 3:09=E2=80=AFPM Martin Jansa via
> > lists.yoctoproject.org <martin.jansa=3Dgmail.com@lists.yoctoproject.org=
>
> > wrote:
> > >
> > > * see:
> > >   https://lists.openembedded.org/g/openembedded-architecture/message/=
2007
> > >   https://git.openembedded.org/openembedded-core/commit/?id=3Dcc4ec43=
a2b657fb4c58429ab14f1edc2473c1327
> > >
> > > * fixes:
> > >   http://errors.yoctoproject.org/Errors/Details/772691/
> > >   ERROR: QA Issue: cni: LIC_FILES_CHKSUM points to an invalid file: T=
OPDIR/tmp-glibc/work/core2-64-oe-linux/cni/v1.2.0-rc0+gitb62753aa2bfa365c1c=
eaff6f25774a8047c896b5/cni-v1.2.0-rc0+gitb62753aa2bfa365c1ceaff6f25774a8047=
c896b5/src/import/LICENSE [license-checksum]
> > >
> > > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > > ---
> > >  recipes-networking/cni/cni_git.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/c=
ni/cni_git.bb
> > > index b41b47cf..c0f316ec 100644
> > > --- a/recipes-networking/cni/cni_git.bb
> > > +++ b/recipes-networking/cni/cni_git.bb
> > > @@ -14,7 +14,7 @@ SRCREV_plugins =3D "b6a0e0bc96906f0d3bd6bfcaab0b5ae=
72292f46c"
> > >  SRCREV_flannel_plugin =3D "6464faacf5c00e25321573225d74638455ef03a0"
> > >  SRCREV_FORMAT =3D "cni_plugins"
> > >  SRC_URI =3D "\
> > > -       git://github.com/containernetworking/cni.git;branch=3Dmain;na=
me=3Dcni;protocol=3Dhttps \
> > > +       git://github.com/containernetworking/cni.git;branch=3Dmain;na=
me=3Dcni;protocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
> > >          git://github.com/containernetworking/plugins.git;branch=3Dma=
in;destsuffix=3D${S}/src/github.com/containernetworking/plugins;name=3Dplug=
ins;protocol=3Dhttps \
> > >          git://github.com/flannel-io/cni-plugin;branch=3Dmain;name=3D=
flannel_plugin;protocol=3Dhttps;destsuffix=3D${S}/src/github.com/containern=
etworking/plugins/plugins/meta/flannel \
> > >          file://modules.txt \
> > > --
> > > 2.45.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#8756): https://lists.yoctoproject.org/g/meta-virt=
ualization/message/8756
> > > Mute This Topic: https://lists.yoctoproject.org/mt/106287452/1050810
> > > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/uns=
ub [bruce.ashfield@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

