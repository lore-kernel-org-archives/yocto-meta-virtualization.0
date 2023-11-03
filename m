Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89427C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 12:52:15 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web11.50189.1699015929724888209
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 05:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HVqoY+X/;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7a66a7fc2d4so82386639f.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Nov 2023 05:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699015929; x=1699620729; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lt08yOp/8n5Up2j/kv6PoGPVhDSgbXXdNjYRnE2I4/8=;
        b=HVqoY+X/5zjsQqYl1HrBip53l1vDpbXQIPcUn25zGlZGrHbat3wRmHZWWzEsvbHg+7
         ogCpyLso8CeD+8r8tRw23D4tjGfG15Aksnd+/LpDrAxUWSNX2Lfc6gn5LvjjpUiO8EzN
         gfq4Jrdt37ESyh/HTUixH1dOUYMHXAvqx5EuYLxjPCAgg0wh7VHfxGuK7R3nT7Hhw0IM
         uxYIiyrF7Kj67zFP0kPRAvv+Q9hX3+eZZeyucYyqkGC0N5j61XV2K/6hXAvFe2HMAqdS
         HkG77hGoUINHEwEgoyMLSc+dvV+Ta6n45dINFzC6lZRPff+MGTSk56iAtI7DaMJdIWe9
         7zwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699015929; x=1699620729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lt08yOp/8n5Up2j/kv6PoGPVhDSgbXXdNjYRnE2I4/8=;
        b=UH7oEVHK/ZDhSRa6K0CHwhHYe5k896suk7rBVQS8Y9ldK+n6JZnNED+pHt6cGXZh/W
         12Sa1xTl3VFgQOJzy1/niAmjRvVHwhX/GJbgd7frmNoANRc2tyHeb6oq9KTgJKwvUCLu
         2zwA8mme5jWrCEqP2+UvCC9Lz3dqgzY8ohYg30Gs6Ij+mknePw6AK7y+vyLKcmOlINKc
         ZOz2sf6UeQeO1PWIDHHQvyr1GbPpSiAYEDIlcbrL9WG9M1snAaIijCtUx5xXObuzwvbG
         Uvnm9L+83FST4Jba0yaptKe0shkZh8PfPkKXEg5gTMnC4NWM/wIbwHS9V9SZjH9szXJ9
         HUWw==
X-Gm-Message-State: AOJu0YyGxJ5cur0dO0e6UhKAMRWlVFo+UDnX994263CTOKAjZzjrY6AW
	XTUaLOm2RxrmG+BapomeZUnz4DpWKjgfIuioT1I=
X-Google-Smtp-Source: AGHT+IGQuj4l41kE/famgHBskWnDX33krUiSGb4enoJAnx5Mb27JPq6FPdLdyxwwbl9EVYkEW8CBkowvjt1PeBOLXqU=
X-Received: by 2002:a05:6602:3fc3:b0:794:eaef:f43e with SMTP id
 fc3-20020a0566023fc300b00794eaeff43emr30103469iob.1.1699015928820; Fri, 03
 Nov 2023 05:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <06ec1922fd901a02d492158a995cfbeeb158e379.camel@siemens.com>
 <CADkTA4Mgak8=Hg1eFjUfXiskt5=QO0-cGyOA6zLn4Ck9EUn3GA@mail.gmail.com> <e109a5972f41d6410f9680765fb2c5dd53fc8c4e.camel@siemens.com>
In-Reply-To: <e109a5972f41d6410f9680765fb2c5dd53fc8c4e.camel@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 3 Nov 2023 08:51:57 -0400
Message-ID: <CADkTA4NOdV-PK77CBZNoTeEjcs6XfeAQnS16WCvjUUmBoYBOgA@mail.gmail.com>
Subject: Re: use of yocto-cfg-fragments
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	"adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Nov 2023 12:52:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8416

On Fri, Nov 3, 2023 at 5:15=E2=80=AFAM Sverdlin, Alexander
<alexander.sverdlin@siemens.com> wrote:
>
> Hello Bruce,
>
> thanks for the quick reply!
>
> On Thu, 2023-11-02 at 15:13 -0400, Bruce Ashfield wrote:
> > > My current understanding is that
> > > meta-virtualization/recipes-kernel/linux/linux-yocto_virtualization.i=
nc
> > > makes an assumption that any type=3Dkmeta will point to upstream
> > > git://git.yoctoproject.org/yocto-kernel-cache but this doesn't hold
> > > for my use case.
> >
> > close.
> >
> > The support assumes that if something is on the src_uri named
> > "kernel-cache" that it is a complete, similarly formatted repository
> > to the upstream / centralized one that I maintain
> >
> > If that is found, it is preferred over the yocto-kernel-cache provided
> > by the yocto-cfg-fragments recipe.
>
> [...]
>
> > > The only type=3Dkmeta is my local file:// storage and the following
> > > linux-yocto_virtualization.inc part leads to fetch failure (fetch
> > > from Internet not expected/forbidden):
> > >
> > > # if kernel-yocto has been inherited (how we can check for configurat=
ion
> > > # fragment merging suport at the moment, then add a dependency on the
> > > # configuration fragment repository. This allows us to be sure that o=
ur
> > > # features can be enabled via the fragments
> > > do_kernel_metadata[depends] +=3D "${@['', 'yocto-cfg-fragments-native=
:do_populate_sysroot'][(bb.data.inherits_class('kernel-yocto', d))]}"
> > >
> > > Summary: 1 task failed:
> > > virtual:native:.../projects/ccp-sd-virt/../../meta-virtualization/rec=
ipes-kernel/linux/yocto-cfg-fragments.bb:do_fetch
> >
> > At a glance, I'm not seeing how your local kmeta is causing
> > the full fragments recipe to fail to fetch.
> >
>
> Fetch failure is expected, as there is simply no access to outside world =
and
> all expected packages are mirrored.
> Now the real issue is that providing local type=3Dkmeta pulls
> git://git.yoctoproject.org/yocto-kernel-cache and currently we require no
> of the upstream fragments, so there is no point in mirroring the yocto-ke=
rnel-cache
> repo just to satisfy fetch as we don't require these features.

if you are enabling the virtualization distro feature, and are including
meta-virtualization, that repository is a requirement. That's how it
ensures that subtle runtime errors don't creep in with incorrect kernel
configurations.

So why not just mirror it ?

>
> Currently I see no way to control this behaviour...
>
> > > When I read the comment "if the kernel-yocto meta-data routine automa=
tically
> > > starts to add the recipe-sysroot-native..." I get a feeling that
> > > this feature is still "work in progress". Are there any further devel=
opments
> > > I could test in this direction?
> >
> > There's nothing that would fix that issue. The in-progress part of that
> > is that I plan to remove all of the local fragments in the virtualizati=
on
> > layer and rely on the cloned kernel-cache from that recipe.
> >
> > I don't suppose there's a layer I can look at which has your fragments
> > and the related kernel bbappend ? I'd like to reproduce the issue
> > locally so I can debug it in more detail.
>
> I cannot easily point you to something publicly available... But roughly =
it's a
> combination of meta-virtualization and a kernel recipe derived from kerne=
l-yocto.bbclass.
>
> Now I long as one doesn't have any type=3Dkmeta, meta-virtualization does=
n't pull
> git://git.yoctoproject.org/yocto-kernel-cache and adding
> "file://features/debug;type=3Dkmeta;destsuffix=3Dfeatures/debug" to SRC_U=
RI causes
> yocto-kernel-cache to be pulled even though there is no logical reason fo=
r this.

That's not what my local tests show. It is keying off an inherit of
kernel-yocto,
not kmeta, but even by extension, seeing that fragment merging is available
(whether keyed of kmeta or the inherit of kernel-yocto), that is the logic =
as to
why it pulls it in (and the use of it is what I explained above).

Unless I have a way to see the issue locally, I can't easily address it (if
required).

Bruce

>
> --
> Alexander Sverdlin
> Siemens AG
> www.siemens.com



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

