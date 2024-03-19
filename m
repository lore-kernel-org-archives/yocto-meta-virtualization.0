Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22048C6FD1F
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 17:11:21 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.21606.1710868273163045054
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Mar 2024 10:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GCLDMzlX;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5ca29c131ebso3716801a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Mar 2024 10:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710868272; x=1711473072; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGR8u1eYDGZZbjAjN5KTatkQizAxHSI1navge68iqYA=;
        b=GCLDMzlXxLmujHo4LB5hZriFG8cASQUASnkY+CLR7g05HfPaElcptMGM9M5w5mMtfh
         NthGMpOrWsF0fLNY3SzAGLP+H0dswq931bZouQLh3eqloF0YHCkLQmbB/WvOAjC1jJqL
         0HXxCwFSfFLFmrebMBxdCaheYWY3halZPK1qrFHUeS40RcwS1kHCyZvXPKSQb2udtll+
         eVPKFRHUNbD+FpyCqDr3DlxQKfrPpwJIetXYMnLCYC51aijMPYu1napNcNv1Io/UA60w
         ExaPrxoSER4GyUUQHxQ18/QEbU8xMDrY7qW/tu4mMbM+2fXBEJ8+rpOjsh7bws7uSyUx
         QCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710868272; x=1711473072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGR8u1eYDGZZbjAjN5KTatkQizAxHSI1navge68iqYA=;
        b=QSqmP04Hm9CDQWQhN6frMLy9EZ4Ek44czfM22Q4BrikQHo0HIgb/rSoCwC4N05NFbV
         CyefZHieNCd7uDNsnWedsKpfNT+0IOM05bA5o7grRNfXnCRxnqAifzoGaxnA73x0ElgU
         zmZ2Q3lhN0OqhcKFFGFJ6K/+HU2qdU99W3xKnqPb9bYJOL3ZKPu+nSFovleRxZDRvVFA
         tZYe70jRzI0YGMRfv5ITg2guChVQcfseT1gMMDeF1tVr9a5SenSX7MEjBnmcEHjoTbZS
         XZgSES0Zb08idm0HXgGyLoFJA3yzjG81HrDvrQIM5/8hCaN1+Zifhl3lemlmOD3zaKVG
         y4Yg==
X-Gm-Message-State: AOJu0Yx+2CBi/EJ8npEm9jqdFajD9QqaDEGUq8P48w0SIbkBb54pAUwf
	ZZlb57g4aot2mmbN4MjGMRvRWK2tWJT8wH4xfiYIM8AefBPGU/AqgFu0w8Q/Mf4n442f+w+EZI8
	u081vWQV2DRhPzQN8PJG1vbZnxJE=
X-Google-Smtp-Source: AGHT+IFwWmXDQd4JR1CX+CWPSAuPpwzs8PCRXMdIZ2YkrjUhGDHRGAPDodLP3M+VAop0JolYa+wihMkdlLloGP4agpk=
X-Received: by 2002:a17:90a:d30e:b0:29b:737e:fd77 with SMTP id
 p14-20020a17090ad30e00b0029b737efd77mr12837423pju.25.1710868272126; Tue, 19
 Mar 2024 10:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240319155432.2263227-1-ts@ferncast.de> <CADkTA4NL6jet8oUsi9gWUYB6hg0ZuVOJxBqKB30--haOQoZ6Ew@mail.gmail.com>
 <ac6c54a6-f9e6-4c4e-8da7-f74785b87f5c@ferncast.de>
In-Reply-To: <ac6c54a6-f9e6-4c4e-8da7-f74785b87f5c@ferncast.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 19 Mar 2024 13:11:00 -0400
Message-ID: <CADkTA4MZDhHkSyO0of5Rt8Bb1j03mPG93QhDtO-ng-A3Jedc8Q@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] Update runc-opencontainers to 1.1.12
 since old versions have a severe security issue
To: Thomas Schlien <ts@ferncast.de>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Mar 2024 17:11:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8649

Look further, there's two commits. 1.11 and 1.12.

https://git.yoctoproject.org/meta-virtualization/commit/?h=3Dmaster-next&id=
=3D9213f05f5591b499809b81a46b8d05e10935f001

I didn't bump runc-docker, since it is going away.

Bruce

On Tue, Mar 19, 2024 at 12:28=E2=80=AFPM Thomas Schlien <ts@ferncast.de> wr=
ote:
>
> Hi,
>
> I had a look at master-next and it only contains version 1.1.11, but not
> 1.1.12 with the CVE patches.
>
> Best regards,
> Thomas
>
> On 19.03.24 16:58, Bruce Ashfield wrote:
> > master-next is already updated to that version.
> >
> > The stack is ongoing release testing, but I do expect to push master sh=
ortly.
> >
> > Bruce
> >
> > On Tue, Mar 19, 2024 at 11:54=E2=80=AFAM Thomas Schlien <ts@ferncast.de=
> wrote:
> >> CVE-2024-21626 https://github.com/opencontainers/runc/security/advisor=
ies/GHSA-xr7r-f8xq-vfvv
> >> ---
> >>   recipes-containers/runc/runc-opencontainers_git.bb | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/reci=
pes-containers/runc/runc-opencontainers_git.bb
> >> index 61e7cfa6..88964276 100644
> >> --- a/recipes-containers/runc/runc-opencontainers_git.bb
> >> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> >> @@ -1,11 +1,11 @@
> >>   include runc.inc
> >>
> >> -SRCREV =3D "f3446b1e5fe75bf419c808d8705c899ab4968b6e"
> >> +SRCREV =3D "51d5e94601ceffbbd85688df1c928ecccbfa4685"
> >>   SRC_URI =3D " \
> >>       git://github.com/opencontainers/runc;branch=3Drelease-1.1;protoc=
ol=3Dhttps \
> >>       file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re=
.patch \
> >>       "
> >> -RUNC_VERSION =3D "1.1.10"
> >> +RUNC_VERSION =3D "1.1.12"
> >>
> >>   CVE_PRODUCT =3D "runc"
> >>
> >> --
> >> 2.40.1
> >>
> >>
> >>
> >>
> >
> >
> >
> >
> --
> Dr.-Ing. Thomas Schlien
> Ferncast GmbH
> Gallierstr. 41a, 52074 Aachen
> Germany
>
> Phone: +49 241 99034567
> Web:   www.ferncast.de
> --
> CEO: Detlef Wiese
> Court of Registration: Amtsgericht Aachen
> Commercial Register: HRB 22350
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8648): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8648
> Mute This Topic: https://lists.yoctoproject.org/mt/105026590/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

