Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC76C25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 04:04:08 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.7571.1716437045276902516
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 22 May 2024 21:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KEUsXnVT;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2bdefdeb545so6061a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 22 May 2024 21:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716437045; x=1717041845; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXg/+sVKqybL/3UqevR+hyePkulrCI2pRGRJDmr3jgE=;
        b=KEUsXnVTDx6HFEgOEN0mY8vEVHmW7rP+d5A1jJGhIuMcDpsx8w6u73RvXpqYAL9yYp
         d6FKYP9yiDo3AnmS4kYR3dzotVmptRmh0YS6pEZH+ysc4jnzQwB9/A1uHWCLDneQopx6
         1Cf7o2lvZxFyvflWYLJdu0W4WraJ3NKsfW750jpOpsDGNqmNILYifACO1xBJEKqXbalj
         PVqRA2MUoi0nGVFASGLtOCyuar2OB+6hkj6XsvTRSULwa1KoSQj5suZtI2A7nsklY+sZ
         ZdF8XyLUtGAkle4ELggM09i6UuuVId7wscP1am8cWSXRwOwaQjwP/aAx1rVm7+fDNloK
         LRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716437045; x=1717041845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXg/+sVKqybL/3UqevR+hyePkulrCI2pRGRJDmr3jgE=;
        b=GMtzKi9i5cx1IJfpbEqicpeZ7StRyRmXu7pC6wRR4YLYgEL67bJM7krWZNuN7oCNh8
         yOJnxWpfUCIxn9x5B1SmdGHPyM3RzfT6vEc/lQ+OlRUMbsGdplUQYoMEvc9sk0FY+yKc
         tcpKFSz94ntqVG+s/CNkoA2r9Rxt22d3nQ6R8sgUlbLeUtC/uEyhtZLreGifYaPsObp6
         JjbVsfzVCmAMbl3d16m4WNCsukT/5LsU/uDvwKU7W9HrNahN71XcEFKSB1eoBwvIZxtR
         1mV/zC0mCtWOw8wqGZytKl5GwTah8NH2F7De84olVL6/3LScsnGpc8imDnn7+KmsJIVO
         S+zg==
X-Forwarded-Encrypted: i=1; AJvYcCUzbUBgp+veL6FHydlIFgofk4spjAAvZxoq6xrkakDcIgvQ4QMOCkBDgczFtNMmYEZU1naEjlDVNyle8GK8xRbUvglBC54UgkomKGQgjQ4imPUCrklTNCPpWcI=
X-Gm-Message-State: AOJu0Yy5seugnSutkYM2acOczTxFnTTznIGNKhamxjnwsY7ZVXH21459
	5HeTBSF2Pvie1xWwsbiKsWqBXcj6tRoIjNzPu+QUWQCywYokQRtSY39cQzwQ7loCGC3kcAUndEl
	uEtPP0yJ2rh+T/4IxjoabITDfPAI=
X-Google-Smtp-Source: AGHT+IERxP6j5Xxrq2QDiQsIQmVJL0D9aMXdMNXOzWWheFuJdRZiRplAGXCqHD9003Tm5Ec8Oc0weVcMalnR0SBWLIE=
X-Received: by 2002:a17:90b:2381:b0:2b1:e314:a5e6 with SMTP id
 98e67ed59e1d1-2bd9f46994emr4145245a91.7.1716437044486; Wed, 22 May 2024
 21:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAFMvBt2+s5a9BCnkYgmXvL9P83JDgkg5hg41q936JuEXHy568g@mail.gmail.com>
 <CA+chaQdXNXd_B3YiKXnvt0eV-i24hS1g7Jm6zW0buqN9n_3sZQ@mail.gmail.com>
 <CAFMvBt1p7DHLfeiNPA=F5__kkSyW9Z8Ouhkhpg9Kptnt=R-PQA@mail.gmail.com> <CA+chaQd=BcD17hyZg5VDCSajtQ56aG=YJeRmGr3s+tsRsRkS9g@mail.gmail.com>
In-Reply-To: <CA+chaQd=BcD17hyZg5VDCSajtQ56aG=YJeRmGr3s+tsRsRkS9g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 23 May 2024 00:03:53 -0400
Message-ID: <CADkTA4P5u3NVBO-3itqOE931ik68caKdR-2kXgdseADr9v=9GQ@mail.gmail.com>
Subject: Re: [meta-virtualization] breakages in go recipes
To: martin.jansa@gmail.com
Cc: "Theodore A. Roth" <troth@openavr.org>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 23 May 2024 04:04:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8741

Martin's advice is on point (as usual).

I'll be travelling all day tomorrow, so I won't even have time to
review or merge until Friday.

I was aware of the pending changes, but I've been on the road for a
bit now, and didn't have a chance to complete my changes.

Bruce

On Wed, May 22, 2024 at 6:54=E2=80=AFPM Martin Jansa via
lists.yoctoproject.org <martin.jansa=3Dgmail.com@lists.yoctoproject.org>
wrote:
>
> I think one per recipe (or few related ones like runc*bb) would be
> easier to review in this case.
>
> On Thu, May 23, 2024 at 12:51=E2=80=AFAM Theodore A. Roth <troth@openavr.=
org> wrote:
> >
> >
> > On Wed, May 22, 2024 at 4:05=E2=80=AFPM Martin Jansa <martin.jansa@gmai=
l.com> wrote:
> >>
> >> Hi,
> >>
> >> I can confirm that I'm seeing the same build failures since this
> >> morning and agree that the recipes need to adapt to:
> >> https://git.openembedded.org/openembedded-core/commit/?id=3Dcc4ec43a2b=
657fb4c58429ab14f1edc2473c1327
> >>
> >> I've started with some WIP changes and fixed some of them in:
> >> https://github.com/shr-project/meta-virtualization/commit/30a85c0319c2=
53632206b0d2c2c483f11a490939
> >> but than got side tracked by some other build failures and not sure
> >> when I'll be able to get back to it.
> >>
> >> I've also asked Bruce on IRC and he is aware of the issues, but might
> >> not have time to resolve it soon, so if you have the changes ready,
> >> then please send them to ML for Bruce to review when he has time and
> >> I'll happily build test them as well.
> >>
> >> Cheers,
> >
> >
> > Should I send a single patch fixing a bunch of recipes (aka many destsu=
ffix fixes at once) or one patch per recipe?
> >
> > Ted Roth
> >
> >>
> >>
> >> On Wed, May 22, 2024 at 11:52=E2=80=AFPM Theodore A. Roth via
> >> lists.yoctoproject.org <troth=3Dopenavr.org@lists.yoctoproject.org>
> >> wrote:
> >> >
> >> > Hi,
> >> >
> >> > In our CI builds for multiple projects using meta-virtualization mas=
ter branch, we are
> >> > seeing some build failures for some recipes that use GO:
> >> >
> >> > * go-md2man
> >> > * runc-opencontainers
> >> > * docker-moby
> >> > * podman
> >> > * buildah
> >> > * cni
> >> >
> >> > I think I've narrowed the breakages down to this commit to oe-core f=
rom Richard Purdie:
> >> >
> >> > * https://lists.openembedded.org/g/openembedded-core/message/199614
> >> >
> >> > The fixes for our builds seem simple enough. Just add ';destsuffix=
=3D${GO_SRCURI_DESTSUFFIX}'
> >> > to the SRC_URI. For example:
> >> >
> >> > ---
> >> >
> >> > diff --git a/recipes-devtools/go/go-md2man_git.bb b/recipes-devtools=
/go/go-md2man_git.bb
> >> > index 1d96bb1b..73d8d167 100644
> >> > --- a/recipes-devtools/go/go-md2man_git.bb
> >> > +++ b/recipes-devtools/go/go-md2man_git.bb
> >> > @@ -9,7 +9,7 @@ BBCLASSEXTEND =3D "native"
> >> >  GO_IMPORT =3D "github.com/cpuguy83/go-md2man"
> >> >  #GO_INSTALL =3D "${GO_IMPORT}/bin/go-md2man"
> >> >
> >> > -SRC_URI =3D "git://${GO_IMPORT}.git;branch=3Dmaster;protocol=3Dhttp=
s"
> >> > +SRC_URI =3D "git://${GO_IMPORT}.git;branch=3Dmaster;protocol=3Dhttp=
s;destsuffix=3D${GO_SRCURI_DESTSUFFIX}"
> >> >
> >> >  SRCREV =3D "f79a8a8ca69da163eee19ab442bedad7a35bba5a"
> >> >  PV =3D "1.0.10+git"
> >> >
> >> > ---
> >> >
> >> > I plan to finish my testing for our breakages and submit some patche=
s, but it feels like there are many
> >> > more recipes that will need this change made (basically anything tha=
t is using 'inherit go').
> >> >
> >> > I'm a bit reluctant to submit patches for recipes we are not using (=
and testing) even if they seem like
> >> > mechanical changes, but I wanted to let the list know what I have fo=
und.
> >> >
> >> > Ted Roth
> >> >
> >> >
> >> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8740): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8740
> Mute This Topic: https://lists.yoctoproject.org/mt/106252100/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

