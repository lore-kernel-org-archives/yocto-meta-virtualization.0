Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3921CC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 19:27:01 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.3878.1716578817010575463
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 May 2024 12:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bv96D0tB;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52961b77655so1385035e87.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 12:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716578815; x=1717183615; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDpelWN4W7UwpbTVjXnPcwqbnQV2GGmJFd2x8OS+wSI=;
        b=Bv96D0tB2sowiIZF/5dSHylQ4jHGDjXS6dYjq7Dh7AkDowDI4t6HuZl4RYncwZ3uG6
         Fk1YV7MZ8xm9fLNN2NexPyDs3bwKJ+JvMiZmCggM1JCgqJn29o5xf/TmiJ7sM/gEayQT
         GxU1JEeymYI8FaV6m+l2fR9Oez3ZoFo8uSiCgfJvwsAaDOHPMfb68cPLDoXtLvcsWweP
         DsNSEIVPOyXFDTfgFxtuuOF8gXbCH5+e0Nb6k4ufpHANL28l7Y4CbICiAalSYykCm35X
         upsqUE0cJLr8fNQrshvatg/aicLNCrYek9tYGE2+egGtAowdoqm8cUMToaK0E23kdGfX
         sL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716578815; x=1717183615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eDpelWN4W7UwpbTVjXnPcwqbnQV2GGmJFd2x8OS+wSI=;
        b=D1yQPgfqmhEjei3ArR113HULpq4WDnyrVFuV2NNALm+md/uf0TbgpqyWs+lhxs3vN7
         TK4BJ5KtObzM3z9NH0Lj2FY58OTpyjaNLsoywXASnKJtfDv0qXl5M7BL29LAbrFxtD2P
         vZ7YqVfR3UByF8Lt63KDBJM0Ukjs7alY3VB567wtnDNFjUw+8/VV98BzKIRuteSF/9Ul
         EoqWHsK/JdSAOhFte1n7Vk/s+fdmYqcEoqlqrhFHXxR1mrxts6YOtFntr5igz4uVzFXL
         h+uDbXbNZnt5Bu6OFY11WVFv+fdHucCLbZy8rQzmUj0+Howh4Kuk1H+WWC5yTfwN+No6
         G+vg==
X-Gm-Message-State: AOJu0Yxnc2IeeiKO42UUSnQGcN5w7q0Azp0/NCSbF41hN8+hjmtKEVIc
	INEOYEzE2erwoLQdvvPGt8t6J7cPqDtXvumOhINNbUk0If2NXNStWi/cS39isSWJZl4qKzduey0
	1QA1/B72NW8gdoCjcfKf4X8HQtv4=
X-Google-Smtp-Source: AGHT+IFrlzxAcDIdc/Wo1Uusj5hfpyJHPUChVPRauBMnOPtx2o/ySaWF8tmLOLRz0mnp0IrLj44WWw8mIUsK6d05zzs=
X-Received: by 2002:ac2:4daf:0:b0:518:9cbf:cd6b with SMTP id
 2adb3069b0e04-529644ec06bmr2002377e87.13.1716578814759; Fri, 24 May 2024
 12:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240524190915.1241716-1-martin.jansa@gmail.com>
 <20240524190915.1241716-2-martin.jansa@gmail.com> <CADkTA4MJRMzVBZ7vksRw_+oHusHvGJhu9dQaL3HbwNKTvfaNJA@mail.gmail.com>
In-Reply-To: <CADkTA4MJRMzVBZ7vksRw_+oHusHvGJhu9dQaL3HbwNKTvfaNJA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 24 May 2024 21:26:35 +0200
Message-ID: <CA+chaQeNR23+LHGka=cyQzkE-2s5+Fo7qjrPKp_8QTb64F1rSw@mail.gmail.com>
Subject: Re: [meta-virtualization] [RFC][PATCH 2/3] cni: use GO_SRCURI_DESTSUFFIX
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 19:27:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8761

It was failing yesterday, but today it built OK, I didn't do any
runtime testing (only checked buildhistory-diff).

Have similar change for nerdctl cri-tools, only yq and docker-moby are
still failing for me.

On Fri, May 24, 2024 at 9:22=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
> Did you get this to build with just that change ?
>
> My patches to cni are significantly larger to get it to build and
> create binaries.
>
> Bruce
>
> On Fri, May 24, 2024 at 3:09=E2=80=AFPM Martin Jansa via
> lists.yoctoproject.org <martin.jansa=3Dgmail.com@lists.yoctoproject.org>
> wrote:
> >
> > * see:
> >   https://lists.openembedded.org/g/openembedded-architecture/message/20=
07
> >   https://git.openembedded.org/openembedded-core/commit/?id=3Dcc4ec43a2=
b657fb4c58429ab14f1edc2473c1327
> >
> > * fixes:
> >   http://errors.yoctoproject.org/Errors/Details/772691/
> >   ERROR: QA Issue: cni: LIC_FILES_CHKSUM points to an invalid file: TOP=
DIR/tmp-glibc/work/core2-64-oe-linux/cni/v1.2.0-rc0+gitb62753aa2bfa365c1cea=
ff6f25774a8047c896b5/cni-v1.2.0-rc0+gitb62753aa2bfa365c1ceaff6f25774a8047c8=
96b5/src/import/LICENSE [license-checksum]
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> >  recipes-networking/cni/cni_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni=
/cni_git.bb
> > index b41b47cf..c0f316ec 100644
> > --- a/recipes-networking/cni/cni_git.bb
> > +++ b/recipes-networking/cni/cni_git.bb
> > @@ -14,7 +14,7 @@ SRCREV_plugins =3D "b6a0e0bc96906f0d3bd6bfcaab0b5ae72=
292f46c"
> >  SRCREV_flannel_plugin =3D "6464faacf5c00e25321573225d74638455ef03a0"
> >  SRCREV_FORMAT =3D "cni_plugins"
> >  SRC_URI =3D "\
> > -       git://github.com/containernetworking/cni.git;branch=3Dmain;name=
=3Dcni;protocol=3Dhttps \
> > +       git://github.com/containernetworking/cni.git;branch=3Dmain;name=
=3Dcni;protocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
> >          git://github.com/containernetworking/plugins.git;branch=3Dmain=
;destsuffix=3D${S}/src/github.com/containernetworking/plugins;name=3Dplugin=
s;protocol=3Dhttps \
> >          git://github.com/flannel-io/cni-plugin;branch=3Dmain;name=3Dfl=
annel_plugin;protocol=3Dhttps;destsuffix=3D${S}/src/github.com/containernet=
working/plugins/plugins/meta/flannel \
> >          file://modules.txt \
> > --
> > 2.45.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8756): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/8756
> > Mute This Topic: https://lists.yoctoproject.org/mt/106287452/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

