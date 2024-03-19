Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 243C9C6FD1F
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 17:17:11 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.21778.1710868630818545662
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Mar 2024 10:17:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EVXePsin;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5dbcfa0eb5dso4796773a12.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Mar 2024 10:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710868630; x=1711473430; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9naM0q7ofvpSO8/pImTGBJYBJM+NuqA9NCyhljfNcA=;
        b=EVXePsinRadzjOgmgv2M46V02FFbUFGjn5a2fr1OD8snED3GCJqCyUTFKasST64TWS
         pcGdMV4sEW/LIvtIxbT6KIkcPYIa6IKkVpY70q2O4FWInJjfyPothwG/UYfB3fVIsvn0
         v1PaNzjVF9t0Gwgs1NAUqLIhwAFTep32LML0DzXKe80U49+oax3K/GIYKFU2f2xb6vxt
         ffvH6ntNFAgEDKULl1oOg61axLOWRMnsZNw/IwmhRKj6NDsb7p7/8HfFwK+7vDkLB5+w
         vo49gtJvsFarvsQVV3smtvpudh79fGuT3P9vXPEilf+CJ9hx2v4r730RZ3Ox2I2cokcG
         QFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710868630; x=1711473430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9naM0q7ofvpSO8/pImTGBJYBJM+NuqA9NCyhljfNcA=;
        b=ZhQ/bjeS/CvMbyQI79uPUm9fBg6SmoZry0ZMpt+YckVOswDxmJzRdw6sxxg4WErakO
         /epHLepONUFACw0OsJaCAN5MJYhlpsbvKeunfUoUj1/ilb2CDXXYFNwQ5WfN7ZxQ8Ibz
         guvp0wvQ8htR/9neVsQzsOCj8Cn0WfloccyX3J2c4EuVq7HjTrEmU0TcWTAo/+Kx0ker
         mpaDefuYbmmqCvetkNANdyslOCvCn9CV89xxSIR6DfYMeNlQfALQUVnZMf44isda+MZq
         J4jUn5VtC/uAd9qJe2RJOYZRYiO8Hv3E8WuRERSrN1mWFnfWn9QVUf9M7UXwlvP8geyA
         eDSw==
X-Forwarded-Encrypted: i=1; AJvYcCXWu3HzpYp+HE2J4ygK3vWhMY28OqUcXPaYraEzQxC4Whn47BuJFSJU2OBvbwGi5Q03WAMKcHrffy5o1sr28Dkm9FG+zvYR42E0fiB9GUjy+3cwdPRBzpMhwGc=
X-Gm-Message-State: AOJu0YxcvJKKOXyBJrUmGXffIoTr57YkUPDyQrVE6pYTyRQ4StLjuaTh
	58cf1J2yPj1tHQPYHTs7dq3h4pCkHHQN8PuTGE6mxXbcRe1gDleMuFXzEBnfTmcC3SrqbescVRq
	r9zLYXDQG2qUbEYYuMWDJprsHbCP2MBJQ
X-Google-Smtp-Source: AGHT+IFOH0QFOemNe96vxVPcvAmeKdWfRewAb9aG28tPgJ5LoYch5h9mfQAwFupa4jPE6nwd9Sqng98P51frHfxZh1Q=
X-Received: by 2002:a17:90a:17cf:b0:29c:6fc1:17e0 with SMTP id
 q73-20020a17090a17cf00b0029c6fc117e0mr13098643pja.10.1710868630222; Tue, 19
 Mar 2024 10:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240319155432.2263227-1-ts@ferncast.de> <CADkTA4NL6jet8oUsi9gWUYB6hg0ZuVOJxBqKB30--haOQoZ6Ew@mail.gmail.com>
 <ac6c54a6-f9e6-4c4e-8da7-f74785b87f5c@ferncast.de> <17BE39A1457CB4C5.24580@lists.yoctoproject.org>
In-Reply-To: <17BE39A1457CB4C5.24580@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 19 Mar 2024 13:16:58 -0400
Message-ID: <CADkTA4OOdxj6oLYM1EuCTvU7CwaeWBaVWdWdg1YNFsBS8Xj3NA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] Update runc-opencontainers to 1.1.12
 since old versions have a severe security issue
To: bruce.ashfield@gmail.com
Cc: Thomas Schlien <ts@ferncast.de>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Mar 2024 17:17:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8650

I should also add that I'll be doing one more bump on a few packages
in the next few weeks (including runc), but generally speaking I'm not
doing any more updates right now as the large stack in master-next is
being stabilized.

Bruce

On Tue, Mar 19, 2024 at 1:11=E2=80=AFPM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> Look further, there's two commits. 1.11 and 1.12.
>
> https://git.yoctoproject.org/meta-virtualization/commit/?h=3Dmaster-next&=
id=3D9213f05f5591b499809b81a46b8d05e10935f001
>
> I didn't bump runc-docker, since it is going away.
>
> Bruce
>
> On Tue, Mar 19, 2024 at 12:28=E2=80=AFPM Thomas Schlien <ts@ferncast.de> =
wrote:
> >
> > Hi,
> >
> > I had a look at master-next and it only contains version 1.1.11, but no=
t
> > 1.1.12 with the CVE patches.
> >
> > Best regards,
> > Thomas
> >
> > On 19.03.24 16:58, Bruce Ashfield wrote:
> > > master-next is already updated to that version.
> > >
> > > The stack is ongoing release testing, but I do expect to push master =
shortly.
> > >
> > > Bruce
> > >
> > > On Tue, Mar 19, 2024 at 11:54=E2=80=AFAM Thomas Schlien <ts@ferncast.=
de> wrote:
> > >> CVE-2024-21626 https://github.com/opencontainers/runc/security/advis=
ories/GHSA-xr7r-f8xq-vfvv
> > >> ---
> > >>   recipes-containers/runc/runc-opencontainers_git.bb | 4 ++--
> > >>   1 file changed, 2 insertions(+), 2 deletions(-)
> > >>
> > >> diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/re=
cipes-containers/runc/runc-opencontainers_git.bb
> > >> index 61e7cfa6..88964276 100644
> > >> --- a/recipes-containers/runc/runc-opencontainers_git.bb
> > >> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> > >> @@ -1,11 +1,11 @@
> > >>   include runc.inc
> > >>
> > >> -SRCREV =3D "f3446b1e5fe75bf419c808d8705c899ab4968b6e"
> > >> +SRCREV =3D "51d5e94601ceffbbd85688df1c928ecccbfa4685"
> > >>   SRC_URI =3D " \
> > >>       git://github.com/opencontainers/runc;branch=3Drelease-1.1;prot=
ocol=3Dhttps \
> > >>       file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-=
re.patch \
> > >>       "
> > >> -RUNC_VERSION =3D "1.1.10"
> > >> +RUNC_VERSION =3D "1.1.12"
> > >>
> > >>   CVE_PRODUCT =3D "runc"
> > >>
> > >> --
> > >> 2.40.1
> > >>
> > >>
> > >>
> > >>
> > >
> > >
> > >
> > >
> > --
> > Dr.-Ing. Thomas Schlien
> > Ferncast GmbH
> > Gallierstr. 41a, 52074 Aachen
> > Germany
> >
> > Phone: +49 241 99034567
> > Web:   www.ferncast.de
> > --
> > CEO: Detlef Wiese
> > Court of Registration: Amtsgericht Aachen
> > Commercial Register: HRB 22350
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8649): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8649
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

