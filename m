Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B6AC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 13:01:15 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.51248.1699016469926004043
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 06:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZnmTt44h;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7a694a365d9so85480739f.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Nov 2023 06:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699016469; x=1699621269; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTA1xYmm7MdFrfIuFDtdABjSlrUyThewjupL42EuOKY=;
        b=ZnmTt44hr2XrXdn7mztD2OVwT+DQaoBXF9wAJX8VDznMe9M3cljGczpkqaNjDzICtk
         JWjt40TwdkkV9p1ZZxdvcaz5/PqfkWeuTzq2nqEHNknTuKnGZ326ILoVmFqdomT2goD+
         ljJZ84fyNx6UUVXuQvn20EXF3T/HMV+VgWxUK1nlVD+e4VSaia7GZ5YTuSN5NyIDuj2n
         S6xuka3/pAgxb21SrYtLNEzmD+EzAZ/YBhi9fnd5/Ma1x1VzXs/POU4J+eIMeCZAq/OA
         yEsZLk4LS/fJAtb000PhU1Oxx6TH1abLJ7Qb3RjU+/HPfmKSsWn3OCJ5c/wj6uSEVqs9
         B+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699016469; x=1699621269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTA1xYmm7MdFrfIuFDtdABjSlrUyThewjupL42EuOKY=;
        b=Su5mYXN2OAYrKsbTLd6q5GYbJnfGFaabxJgNevp4gWTYYpvKmRBW/aLAnEYWlm3BCG
         aOMCp2Uxc+AEOQqojLKWYQBf47GB8qPFwGQdSyMGtIjV5sHeJi60NPY7jRlnLDO+PmAT
         OvApV6rC9Qf76d/vqLWVfbQUh+l8MQq5q8b22CL3IpA/wEv3Ghw2w3fbr4AR5VksNACP
         1ufPhJsHOtFvy1B5KUxfm/yOs3gka7M3FuVtYqoTQaXZSW0GR/jdIFhC0+axlkLplQOx
         ITl12I1+kI05PtMahOCCijnCC6FYB93r1tTu8hIIXdzCwkOhJOVywJPsgiqlE880EAHv
         DuQg==
X-Gm-Message-State: AOJu0YzKMelHTYwP+oAbPnTUeH5486kAcO0650/0JDHvO6RZv/aacY8R
	jSpdDaPbhhMWxqj+D2S9em7PASVm1PAlkebKazw=
X-Google-Smtp-Source: AGHT+IFNQjOc9rjt6Oa4DogxVBMmHEgh94sqc5NnTryV+n4moikaUOR6kINZlh2OPe4pTz7SzXDxtSUZ1GoEHb+MOhs=
X-Received: by 2002:a05:6602:2e8b:b0:7a9:b1ad:dddd with SMTP id
 m11-20020a0566022e8b00b007a9b1adddddmr25549156iow.12.1699016469046; Fri, 03
 Nov 2023 06:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <06ec1922fd901a02d492158a995cfbeeb158e379.camel@siemens.com>
 <CADkTA4Mgak8=Hg1eFjUfXiskt5=QO0-cGyOA6zLn4Ck9EUn3GA@mail.gmail.com>
 <e109a5972f41d6410f9680765fb2c5dd53fc8c4e.camel@siemens.com> <17941DFC88BEAF3E.3650@lists.yoctoproject.org>
In-Reply-To: <17941DFC88BEAF3E.3650@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 3 Nov 2023 09:00:57 -0400
Message-ID: <CADkTA4OcA=z3xwb4rCigLF331oiWyEEOgJoU07OpUpn9y8qKxQ@mail.gmail.com>
Subject: Re: [meta-virtualization] use of yocto-cfg-fragments
To: bruce.ashfield@gmail.com
Cc: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	"adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Nov 2023 13:01:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8417

On Fri, Nov 3, 2023 at 8:52=E2=80=AFAM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Fri, Nov 3, 2023 at 5:15=E2=80=AFAM Sverdlin, Alexander
> <alexander.sverdlin@siemens.com> wrote:
> >
> > Hello Bruce,
> >
> > thanks for the quick reply!
> >
> > On Thu, 2023-11-02 at 15:13 -0400, Bruce Ashfield wrote:
> > > > My current understanding is that
> > > > meta-virtualization/recipes-kernel/linux/linux-yocto_virtualization=
.inc
> > > > makes an assumption that any type=3Dkmeta will point to upstream
> > > > git://git.yoctoproject.org/yocto-kernel-cache but this doesn't hold
> > > > for my use case.
> > >
> > > close.
> > >
> > > The support assumes that if something is on the src_uri named
> > > "kernel-cache" that it is a complete, similarly formatted repository
> > > to the upstream / centralized one that I maintain
> > >
> > > If that is found, it is preferred over the yocto-kernel-cache provide=
d
> > > by the yocto-cfg-fragments recipe.
> >
> > [...]
> >
> > > > The only type=3Dkmeta is my local file:// storage and the following
> > > > linux-yocto_virtualization.inc part leads to fetch failure (fetch
> > > > from Internet not expected/forbidden):
> > > >
> > > > # if kernel-yocto has been inherited (how we can check for configur=
ation
> > > > # fragment merging suport at the moment, then add a dependency on t=
he
> > > > # configuration fragment repository. This allows us to be sure that=
 our
> > > > # features can be enabled via the fragments
> > > > do_kernel_metadata[depends] +=3D "${@['', 'yocto-cfg-fragments-nati=
ve:do_populate_sysroot'][(bb.data.inherits_class('kernel-yocto', d))]}"
> > > >
> > > > Summary: 1 task failed:
> > > > virtual:native:.../projects/ccp-sd-virt/../../meta-virtualization/r=
ecipes-kernel/linux/yocto-cfg-fragments.bb:do_fetch
> > >
> > > At a glance, I'm not seeing how your local kmeta is causing
> > > the full fragments recipe to fail to fetch.
> > >
> >
> > Fetch failure is expected, as there is simply no access to outside worl=
d and
> > all expected packages are mirrored.
> > Now the real issue is that providing local type=3Dkmeta pulls
> > git://git.yoctoproject.org/yocto-kernel-cache and currently we require =
no
> > of the upstream fragments, so there is no point in mirroring the yocto-=
kernel-cache
> > repo just to satisfy fetch as we don't require these features.
>
> if you are enabling the virtualization distro feature, and are including
> meta-virtualization, that repository is a requirement. That's how it
> ensures that subtle runtime errors don't creep in with incorrect kernel
> configurations.
>
> So why not just mirror it ?
>
> >
> > Currently I see no way to control this behaviour...
> >
> > > > When I read the comment "if the kernel-yocto meta-data routine auto=
matically
> > > > starts to add the recipe-sysroot-native..." I get a feeling that
> > > > this feature is still "work in progress". Are there any further dev=
elopments
> > > > I could test in this direction?
> > >
> > > There's nothing that would fix that issue. The in-progress part of th=
at
> > > is that I plan to remove all of the local fragments in the virtualiza=
tion
> > > layer and rely on the cloned kernel-cache from that recipe.
> > >
> > > I don't suppose there's a layer I can look at which has your fragment=
s
> > > and the related kernel bbappend ? I'd like to reproduce the issue
> > > locally so I can debug it in more detail.
> >
> > I cannot easily point you to something publicly available... But roughl=
y it's a
> > combination of meta-virtualization and a kernel recipe derived from ker=
nel-yocto.bbclass.
> >
> > Now I long as one doesn't have any type=3Dkmeta, meta-virtualization do=
esn't pull
> > git://git.yoctoproject.org/yocto-kernel-cache and adding
> > "file://features/debug;type=3Dkmeta;destsuffix=3Dfeatures/debug" to SRC=
_URI causes
> > yocto-kernel-cache to be pulled even though there is no logical reason =
for this.
>
> That's not what my local tests show. It is keying off an inherit of
> kernel-yocto,
> not kmeta, but even by extension, seeing that fragment merging is availab=
le
> (whether keyed of kmeta or the inherit of kernel-yocto), that is the logi=
c as to
> why it pulls it in (and the use of it is what I explained above).

Cancel that comment, I do see it now. And yes, if there's any kmeta fragmen=
ts
in the SRC_URI that is used to construct the kernel include file name, whic=
h
then double checks if kernel-yocto is inherited, and the combination of the=
 two
indicates that the fragments should be made available for the packages in t=
he
layer to be properly supported at runtime.

There should be a way for you to manipulate the do_kernel_metadata[depends]
value in your own bbappend to remove the dependency on the repo.

I can also try and think up another variable or a way to exclude that
dependency
.. but again, it is an intended dependency, and I was trying for a lighter =
touch
with the existing checks, and I don't want to make them too complex or intr=
oduce
a bug where the fragments stop being pulled in where they have currently be=
en
pulled as a dependency.

Bruce

>
> Unless I have a way to see the issue locally, I can't easily address it (=
if
> required).
>
> Bruce
>
> >
> > --
> > Alexander Sverdlin
> > Siemens AG
> > www.siemens.com
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
> View/Reply Online (#8416): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8416
> Mute This Topic: https://lists.yoctoproject.org/mt/102338788/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/leave/6=
693017/1050810/978058475/xyzzy [bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

