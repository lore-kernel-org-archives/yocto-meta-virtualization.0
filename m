Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9028FC47DA2
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 15:22:05 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.17635.1705418524618677274
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 Jan 2024 07:22:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PTWgHZM0;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7bc32b0fdadso345976539f.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Jan 2024 07:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705418524; x=1706023324; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6urVTEwnEpF0p2VUcjdQ6fVpSlse/HmszmUYVCk8Yw=;
        b=PTWgHZM0gG4IIFaWFhATe5RZ5d42joQhGNMQG4C+9bJTabuqDsLnZ507dvOTTeEdN9
         lQE0Eh9jDB+phd395oOFE3A9uBqvhHFj0PLH+POdy1Vf16fAiyqakNxzLw8G3FUSPPxf
         pB2MNBgBYKTPtrwfWboJpS9/b8WXeCBVZ+jZ3NJ3RN1Zx2i8vaABG2UdbgrD4zOLJJEO
         iAW7/Gp/IL8mXANFZ5v7VlKlmZrAXG6Sjz6BPIGJpkSglDER+668EYjaSx5wt9aLTKCD
         K8X1uDMLtBB6gCHhdE77499t4bgdqNny2sBptiLtZu6K9Us6IwnI/rwN17Xygqn8cwc3
         cJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705418524; x=1706023324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6urVTEwnEpF0p2VUcjdQ6fVpSlse/HmszmUYVCk8Yw=;
        b=cwLqLn2WISe+xpdSZktdGpyU+JeJepF0Q5QkMuNv5jRApPDWmHiPKHlSaNFM9h26lx
         mUGSh4u57783EIHF18gFazIRSR9UGFEtaEFP4T+rBf6BM/0T/Vtr7lxGmm+BYLvbRXCx
         sjR0cUmDw+mbktiJ+Vhs1mErQfM7D5uDYYJsbj8Yq+yRj0i3hcsXutBqsVRawWiibn8h
         g5ErTLEBLKFbCfXVMShJbRfW0+j7In1HUc4x6kXQmkWfzR0CKKSPJYsE+lAN48TKGdnZ
         xFymaVckwri2GKnjy1jsybdnCOIe3ggOsu1ary2olbSHxl58uTspIIoiNRH+LmugkgZG
         9BdA==
X-Gm-Message-State: AOJu0Yy/zdP1CwXScHrYY524Ni87qYrQKxqKt+uqclIkyg6ivJr+470h
	zFgx2z4epSA5avgQNv67otB2R5AJwdNP8athALc=
X-Google-Smtp-Source: AGHT+IF1XxKcccP7yXUF/Y0qop7lFDuHhSAXE6D/rovClT/TFdGsFfjLBYMvve7j9WsjZR157GG28lbKB+bTUPGxcw8=
X-Received: by 2002:a6b:7e05:0:b0:7bb:6ed:1da with SMTP id i5-20020a6b7e05000000b007bb06ed01damr6096284iom.36.1705418523729;
 Tue, 16 Jan 2024 07:22:03 -0800 (PST)
MIME-Version: 1.0
References: <20240115170030.3531505-1-pkj@axis.com> <CADkTA4PkPBXp1tVuth0Cj8WvTTX4J-NhHmDHoHm-gGdiD3==MA@mail.gmail.com>
 <DB5PR02MB102132B690BBC1F8EE9F6DDF8EF732@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB102132B690BBC1F8EE9F6DDF8EF732@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 16 Jan 2024 10:21:52 -0500
Message-ID: <CADkTA4MDpubrL2R7a9UU5uQci7Fh6zxdvJa3HYhzOaWC5ZdE_w@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] containerd-opencontainers: Use
 RDEPENDS:${PN} instead of RDEPENDS:${BPN}
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Jan 2024 15:22:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8544

On Tue, Jan 16, 2024 at 6:35=E2=80=AFAM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Sent: den 15 januari 2024 18:10
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: meta-virtualization@lists.yoctoproject.org
> > Subject: Re: [meta-virtualization] [PATCH] containerd-opencontainers: U=
se
> > RDEPENDS:${PN} instead of RDEPENDS:${BPN}
> >
> > On Mon, Jan 15, 2024 at 12:00=E2=80=AFPM Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com> wrote:
> > >
> > > This avoids the following warning:
> > >
> > >   WARNING: .../containerd-opencontainers_git.bb: Variable key
> > >   RDEPENDS:${PN} (...) replaces original key
> > >   RDEPENDS:containerd-opencontainers
> > >   (  ${VIRTUAL-RUNTIME_container_runtime}).
> > >
> > > if, e.g., RDEPENDS:${PN}:append =3D " ..." is used in a bbappend or
> > > bbclass.
> >
> > All that the above commit message does is explain the syntax
> > of what you are fixing .. but not why.
> >
> > We had the BPN rdepends on purpose, showing why that
> > original purpose is not needed  ... should be in the commit
> > message.
>
> I have no idea why it was RDEPENDS:${BPN} rather than RDEPENDS:${PN},
> I only assumed it was a typo. There is nothing in the original commit
> that indicates that it was done on purpose.

I did a bit more digging, and at the time there were x32 multilibs at play,=
 and
I remember that solving some sort of inter package dependency .. but  I
also can't find the details.

>
> >
> > My answer right now would be .. .don't use PN in your bbappend
> > and you can avoid the warning.
>
> The problem in my case is that our addition to RDEPENDS:${PN} is done in
> a common bbclass, so I cannot control it per recipe.

Ah, so you have a class that is doing a generic RDEPENDS addition
to all packages and that triggers the double variable key warning.

I'll tweak the commit message a bit to explain the history and trigger
of the warning and queue it up.

Bruce

>
> //Peter
>
> >
> > Bruce
> >
> > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > ---
> > >  recipes-containers/containerd/containerd-opencontainers_git.bb | 2 +=
-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/recipes-containers/containerd/containerd-
> > opencontainers_git.bb b/recipes-containers/containerd/containerd-
> > opencontainers_git.bb
> > > index 5c1e127..1dadf28 100644
> > > --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> > > +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> > > @@ -95,6 +95,6 @@ INSANE_SKIP:${PN} +=3D "ldflags already-stripped"
> > >
> > >  COMPATIBLE_HOST =3D "^(?!(qemu)?mips).*"
> > >
> > > -RDEPENDS:${BPN} +=3D " ${VIRTUAL-RUNTIME_container_runtime}"
> > > +RDEPENDS:${PN} +=3D " ${VIRTUAL-RUNTIME_container_runtime}"
> > >
> > >  CVE_PRODUCT =3D "containerd"
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#8538): https://lists.yoctoproject.org/g/meta-
> > virtualization/message/8538
> > > Mute This Topic: https://lists.yoctoproject.org/mt/103743235/1050810
> > > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/uns=
ub
> > [bruce.ashfield@gmail.com]
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

