Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3CFC25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 08:34:19 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.12103.1716453258580358123
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 May 2024 01:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IZpOBwY5;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e6f33150bcso77034781fa.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 May 2024 01:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716453256; x=1717058056; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lT6YQ+HwLJz/rXhqrl8ZiGQCY9zOF1BzCg1ZiIkMfI=;
        b=IZpOBwY5qZfaLMdUKrcdSLbDT4LM9LEF3SxXztf2Rb+c+3gXiTVkqCJK94RjOgJkMV
         n4kwFJDw3raxqFUuqg6W6w6xL06OAskUN5dYsSovcDlkD92n7K7GDdl6Vv+0U+IcHhCt
         glPo9r1FPRyC2L0lo9tWiCq3C6h0lEDeB8+frtI1Z+CigQWasdqm37W6LiecizccEoit
         PK1MFjbakZtgqm757IpBe9gVmUK+SPRzKTLgOZEeg8EYzWzmpMpWiZ7hX5HT7vZjiPMo
         nZcWkbrkXPW4kEt+NoYJ82N3qFrxEqd969YzMn8y3hy1/LGbpkJViZS+/29hzAiEXihh
         0W+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716453256; x=1717058056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7lT6YQ+HwLJz/rXhqrl8ZiGQCY9zOF1BzCg1ZiIkMfI=;
        b=rMd4K5mUXMCqWGbTFWf8KZouEwX/GYWNCEpyb8GHaCeu+zzD6F2v73ukqXDzBIlTCw
         Ve5sw964K01xwinFsowxe+/Chqk9qlPgKYNwgkuIQ/tPl8GCcnUtoQeYG3HC5FqdIf52
         RB0TGiUtADdxoXZJgpLV3+mmXLx7SpRWazX13NRsGrnFoBlDZl9wJDJJEKKipqHBMOn3
         wZHzrApCCRnbbY8VaUIIc6gFr++NCXPoxqR6qEoOrEDl7wS+H4Au4KFLuqz4Za67pAqb
         G2BnQYfL8eadXwkllrEUGbrJ9702tGCpVgQ75TY22csT1AUMTS4YgvPV9oCmYKRH4BC6
         RaSg==
X-Forwarded-Encrypted: i=1; AJvYcCUZTPhEPDaEYmlVOD1KQ3uHrqPDaqh0AKLLNA+4SIG+jVJnpbSo/zb6I2wN4+dwTCReBox8Niq80yAYXUN01xfqpem+tSuexpImul+5B6u8GYn/P+hoM9rP5+0=
X-Gm-Message-State: AOJu0Yx7xlcsgcsmiVst5rrmwVSEnHyTTplrJ7nWCka7iaKMs6+Rqu47
	2VLIUv0JIsdOmHpQ7XghnPh3V63nMuIk03hD/BJwGdcvSlewVBue0FSDydQQsQ5cjMRpOBIGMA0
	2kvro+Pe3S9wOwP2ZFIbfPcInjIU=
X-Google-Smtp-Source: AGHT+IHczJKPJ0f7bldTTgZd92C7mw8xyqHwd8jb1/k31hDxoGWojAmMm3bCGpu41BQ0SnvUu7lFbuoPXgT3t1U62Jw=
X-Received: by 2002:a2e:2e17:0:b0:2d8:408c:3f5b with SMTP id
 38308e7fff4ca-2e94949c503mr28011651fa.5.1716453256221; Thu, 23 May 2024
 01:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAFMvBt2+s5a9BCnkYgmXvL9P83JDgkg5hg41q936JuEXHy568g@mail.gmail.com>
 <CA+chaQdXNXd_B3YiKXnvt0eV-i24hS1g7Jm6zW0buqN9n_3sZQ@mail.gmail.com>
 <CAFMvBt1p7DHLfeiNPA=F5__kkSyW9Z8Ouhkhpg9Kptnt=R-PQA@mail.gmail.com>
 <CA+chaQd=BcD17hyZg5VDCSajtQ56aG=YJeRmGr3s+tsRsRkS9g@mail.gmail.com> <CADkTA4P5u3NVBO-3itqOE931ik68caKdR-2kXgdseADr9v=9GQ@mail.gmail.com>
In-Reply-To: <CADkTA4P5u3NVBO-3itqOE931ik68caKdR-2kXgdseADr9v=9GQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 23 May 2024 10:33:59 +0200
Message-ID: <CA+chaQc94P6-yfmJRhM4Mi5gK9MVkq3MFGw4Z_Nvns_U78TdAw@mail.gmail.com>
Subject: Re: [meta-virtualization] breakages in go recipes
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "Theodore A. Roth" <troth@openavr.org>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 23 May 2024 08:34:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8742

FWIW: My world build with oe-core
master:094273bd7d1768e14fbdcd2f239bee14c630a625 (so before the main
UNPACKDIR changes) finished with these failures from
meta-virtualization:

ERROR: Task (meta-virtualization/recipes-containers/cri-tools/cri-tools_git=
.bb:do_patch)
failed with exit code '1'
ERROR: Task (meta-virtualization/recipes-containers/docker-compose/docker-c=
ompose_git.bb:do_populate_lic)
failed with exit code '1'
ERROR: Task (meta-virtualization/recipes-containers/docker/docker-moby_git.=
bb:do_patch)
failed with exit code '1'
ERROR: Task (meta-virtualization/recipes-containers/nerdctl/nerdctl_git.bb:=
do_patch)
failed with exit code '1'
ERROR: Task (meta-virtualization/recipes-containers/runc/runc-opencontainer=
s_git.bb:do_patch)
failed with exit code '1'
ERROR: Task (meta-virtualization/recipes-devtools/go/go-md2man_git.bb:do_co=
mpile)
failed with exit code '1'
ERROR: Task (meta-virtualization/recipes-devtools/go/go-md2man_git.bb:do_po=
pulate_lic)
failed with exit code '1'
ERROR: Task (meta-virtualization/recipes-devtools/yq/yq_git.bb:do_compile)
failed with exit code '1'
ERROR: Task (meta-virtualization/recipes-devtools/yq/yq_git.bb:do_populate_=
lic)
failed with exit code '1'
ERROR: Task (meta-virtualization/recipes-networking/cni/cni_git.bb:do_compi=
le)
failed with exit code '1'
ERROR: Task (meta-virtualization/recipes-networking/cni/cni_git.bb:do_popul=
ate_lic)
failed with exit code '1'
ERROR: Task (meta-virtualization/recipes-networking/netns/netns_git.bb:do_p=
atch)
failed with exit code '1'

the UNPACKDIR changes will probably cause few more issues, I've
already noticed one with linux-yocto_virtualization.inc and added
temporary work around here:
https://github.com/shr-project/meta-virtualization/commits/jansa/master/

will send what I have later today as a RFC (as I cannot even build
whole image yet) unless Theodore gets to it sooner.

On Thu, May 23, 2024 at 6:04=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
> Martin's advice is on point (as usual).
>
> I'll be travelling all day tomorrow, so I won't even have time to
> review or merge until Friday.
>
> I was aware of the pending changes, but I've been on the road for a
> bit now, and didn't have a chance to complete my changes.
>
> Bruce
>
> On Wed, May 22, 2024 at 6:54=E2=80=AFPM Martin Jansa via
> lists.yoctoproject.org <martin.jansa=3Dgmail.com@lists.yoctoproject.org>
> wrote:
> >
> > I think one per recipe (or few related ones like runc*bb) would be
> > easier to review in this case.
> >
> > On Thu, May 23, 2024 at 12:51=E2=80=AFAM Theodore A. Roth <troth@openav=
r.org> wrote:
> > >
> > >
> > > On Wed, May 22, 2024 at 4:05=E2=80=AFPM Martin Jansa <martin.jansa@gm=
ail.com> wrote:
> > >>
> > >> Hi,
> > >>
> > >> I can confirm that I'm seeing the same build failures since this
> > >> morning and agree that the recipes need to adapt to:
> > >> https://git.openembedded.org/openembedded-core/commit/?id=3Dcc4ec43a=
2b657fb4c58429ab14f1edc2473c1327
> > >>
> > >> I've started with some WIP changes and fixed some of them in:
> > >> https://github.com/shr-project/meta-virtualization/commit/30a85c0319=
c253632206b0d2c2c483f11a490939
> > >> but than got side tracked by some other build failures and not sure
> > >> when I'll be able to get back to it.
> > >>
> > >> I've also asked Bruce on IRC and he is aware of the issues, but migh=
t
> > >> not have time to resolve it soon, so if you have the changes ready,
> > >> then please send them to ML for Bruce to review when he has time and
> > >> I'll happily build test them as well.
> > >>
> > >> Cheers,
> > >
> > >
> > > Should I send a single patch fixing a bunch of recipes (aka many dest=
suffix fixes at once) or one patch per recipe?
> > >
> > > Ted Roth
> > >
> > >>
> > >>
> > >> On Wed, May 22, 2024 at 11:52=E2=80=AFPM Theodore A. Roth via
> > >> lists.yoctoproject.org <troth=3Dopenavr.org@lists.yoctoproject.org>
> > >> wrote:
> > >> >
> > >> > Hi,
> > >> >
> > >> > In our CI builds for multiple projects using meta-virtualization m=
aster branch, we are
> > >> > seeing some build failures for some recipes that use GO:
> > >> >
> > >> > * go-md2man
> > >> > * runc-opencontainers
> > >> > * docker-moby
> > >> > * podman
> > >> > * buildah
> > >> > * cni
> > >> >
> > >> > I think I've narrowed the breakages down to this commit to oe-core=
 from Richard Purdie:
> > >> >
> > >> > * https://lists.openembedded.org/g/openembedded-core/message/19961=
4
> > >> >
> > >> > The fixes for our builds seem simple enough. Just add ';destsuffix=
=3D${GO_SRCURI_DESTSUFFIX}'
> > >> > to the SRC_URI. For example:
> > >> >
> > >> > ---
> > >> >
> > >> > diff --git a/recipes-devtools/go/go-md2man_git.bb b/recipes-devtoo=
ls/go/go-md2man_git.bb
> > >> > index 1d96bb1b..73d8d167 100644
> > >> > --- a/recipes-devtools/go/go-md2man_git.bb
> > >> > +++ b/recipes-devtools/go/go-md2man_git.bb
> > >> > @@ -9,7 +9,7 @@ BBCLASSEXTEND =3D "native"
> > >> >  GO_IMPORT =3D "github.com/cpuguy83/go-md2man"
> > >> >  #GO_INSTALL =3D "${GO_IMPORT}/bin/go-md2man"
> > >> >
> > >> > -SRC_URI =3D "git://${GO_IMPORT}.git;branch=3Dmaster;protocol=3Dht=
tps"
> > >> > +SRC_URI =3D "git://${GO_IMPORT}.git;branch=3Dmaster;protocol=3Dht=
tps;destsuffix=3D${GO_SRCURI_DESTSUFFIX}"
> > >> >
> > >> >  SRCREV =3D "f79a8a8ca69da163eee19ab442bedad7a35bba5a"
> > >> >  PV =3D "1.0.10+git"
> > >> >
> > >> > ---
> > >> >
> > >> > I plan to finish my testing for our breakages and submit some patc=
hes, but it feels like there are many
> > >> > more recipes that will need this change made (basically anything t=
hat is using 'inherit go').
> > >> >
> > >> > I'm a bit reluctant to submit patches for recipes we are not using=
 (and testing) even if they seem like
> > >> > mechanical changes, but I wanted to let the list know what I have =
found.
> > >> >
> > >> > Ted Roth
> > >> >
> > >> >
> > >> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8740): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/8740
> > Mute This Topic: https://lists.yoctoproject.org/mt/106252100/1050810
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

