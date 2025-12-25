Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23EF4E784BF
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 04:03:18 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.133663.1766635396571349924
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 20:03:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KGIKehtS;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-34c565b888dso7099411a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Dec 2025 20:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766635396; x=1767240196; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDL89LZsd+aIxr3sBb7i03bEynYwN5dRflqZhv1auDw=;
        b=KGIKehtS2/667RBZISpD0Aa/hztjRhGotFFz49NTLzrlMH6+Gc629qhZXqg07SICzu
         ATgdDU9OEEmTA/TZPOgdY4rSEuNinnJ1H7LbiZQhvGWUGiNRC7bMd4ZI09uO5EAuWntX
         R6203+wz/GhL46F2RXN/Irc05oBhmMGWqy4DgG38SUHH8pgIXBVOX89fxB0uzgNk+ZIA
         O6M49pk7A80zhXa3BK6IjR3+TvljUWgfFqDuchdETNDGfh+n4nxdlgsckK5kA4CB9LUB
         Y5SEnJWNrphRPlQHfKvtqfMknFojXJWe2wlP2F518IcK12QYIV2qcJZbmZv/S8Jt46Ju
         OeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766635396; x=1767240196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MDL89LZsd+aIxr3sBb7i03bEynYwN5dRflqZhv1auDw=;
        b=a1Eq+BGKLBBKVOwSMV5icVOAdFKEGdA7c4xl++BKmbUvtmbmDw+S0JukGbTK3EpKvW
         UxXeUsnrn6q7ptces8nBQynRNzuQkoFMtdvWaxWZuLXm4Q+ojG8z1jZJt7ZDXt0vyU05
         BbZkRKt+y7FL4ZEwcA3mXcC1dx2ejPXz4DevRkvs/eFg1IhCspDONXnAjrMdhzzb9CCj
         D0K4CNsl6jxXjHcctx+18CwcI2YyKYGH39WTGaAJHmO7AclUQVCjRMbcLRWzguu9qRlE
         pgV/zJTG59d5KkYkvLEAVTeCBAujSE05iolczpgp1sMcVHql1PS4pF8tHAey8eQ9Kwtn
         K2XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuKaomyR06Roz4tjXvObjIfwjbSnpG1SoYs9hq8ZW9yoKUGLO6kHab2/Jd0k0BG2XMmQKR4QXrD9Z2sKdhu5eXI4rO@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy/XiL0q2R30a984p+EXf3TeOEUvVk9FJG09m2PPxl6B0PDk6+Y
	Z5DosAUHn176z2kX09yYRA+ejGpOb0Q5NogqTB3kEJ4AMjF3XGwt3RLVmiCCeDVwYNrGeyDn0hD
	8N4HSoec/qY7dr4Z0mE0WnnaQyTW1cgg=
X-Gm-Gg: AY/fxX7j2WTSIrGqE5QYn1AeG/Y8bc14ImTjAyq12S5iKl6NAh+FQzll/AlEq5+PdAe
	97s06nv6XXmKXWSUPig6OD00Yxea1iFBM8vH9J2o7bmr5dYudZgnsCKwQNEA+4rYYVljviH1Jef
	c0/tainvlNOqwCUEqPOxDj644xMXj/7OfkyaxwIbt+x5VssZOZUnI2nlhI2Qpf3OYC0Idy6nEWN
	HM0D3C5G1AcaFONb40zxAmpawzoWUGa8UZ4GUzz420GXQg4Y+qtBatP+gYpC0pI7sfyPVvhqfRb
	ST5t
X-Google-Smtp-Source: AGHT+IFNwslkx5FzQfoCNzRBncBTanoLCE9GElpCc5ichBXwlpv4RSPlRRWCx5nFwhWS/1o4OZypLNCHSUeU+GPQMD0=
X-Received: by 2002:a17:90b:5703:b0:329:ca48:7090 with SMTP id
 98e67ed59e1d1-34e921f8ad9mr16791310a91.37.1766635395833; Wed, 24 Dec 2025
 20:03:15 -0800 (PST)
MIME-Version: 1.0
References: <20251224054744.3109658-1-Qi.Chen@windriver.com>
 <CADkTA4NK2AtaY0qfCKBP2T34N4+bTmyzKCtVf7tQjbkaCJEfdQ@mail.gmail.com>
 <CO6PR11MB560251C0260BAA43DCCD5CEBEDB3A@CO6PR11MB5602.namprd11.prod.outlook.com>
 <188454A06472FA76.1342979@lists.yoctoproject.org>
In-Reply-To: <188454A06472FA76.1342979@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 24 Dec 2025 23:03:04 -0500
X-Gm-Features: AQt7F2qGuD0C96eAbGsqJ30_zZvQJqnSZ3BAztkdEsMU_iGaDog0OwiXa3-jmOE
Message-ID: <CADkTA4Pza_UFhXfaJc83o+KP0ys2z+eqc3zmfoKqSpP-UqnqLw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker: RDEPENDS on virtual-runc
To: bruce.ashfield@gmail.com
Cc: "Chen, Qi" <Qi.Chen@windriver.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 25 Dec 2025 04:03:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9502

On Wed, Dec 24, 2025 at 10:33=E2=80=AFPM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Wed, Dec 24, 2025 at 10:21=E2=80=AFPM Chen, Qi <Qi.Chen@windriver.com>=
 wrote:
> >
> > Runtime error.
> >
> > The scenario is that I want docker and podman to be installed together.
>
> That's a scenario that I've explicitly made conflict.
>
> > A few settings need to be there to have this done:
> > CRUN_AS_RUNC =3D "false"
> > PODMAN_FEATURES:remove =3D "docker"
> > CONTAINER_PROFILE =3D "podman"
> > (There's a patch to fix crun & runc installed together that I sent a fe=
w days ago.)
> >
> > On target, docker.servcie fails because runc cannot be found.
> >
> > Docker can work with crun because crun is somewhat compatible with runc=
. It's not like podman which does automatic search (crun first, then runc).
> > And for docker to use crun, user needs to edit /etc/docker/daemon.json =
file. This is the normal way to do it.
> >
> > In summary, we need to support podman & docker installed on the same ta=
rget.
> > And for this to work, this patch, together with the crun fix patch, is =
needed.
>
> See above.

And what I mean by that comment is that the configuration you are
describing isn't working by design.

So you need some solid/strong justification to change that, and it will
be more than just changing a few bits and pieces, I need to rework parts
of the container stack configurations and add them to the test matrix.

crun is also more than "somewhat compatible" with runc, it is for all
intents and purposes a drop in replacement. If there's a specific runtime
issue with it in place of runc, send the details and I can look into it.

Cheers,

Bruce

>
> Bruce
>
> >
> > Regards,
> > Qi
> >
> > -----Original Message-----
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Sent: Wednesday, December 24, 2025 9:05 PM
> > To: Chen, Qi <Qi.Chen@windriver.com>
> > Cc: meta-virtualization@lists.yoctoproject.org
> > Subject: Re: [meta-virtualization][PATCH] docker: RDEPENDS on virtual-r=
unc
> >
> > On Wed, Dec 24, 2025 at 1:48=E2=80=AFAM Chen Qi via lists.yoctoproject.=
org <Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
> > >
> > > From: Chen Qi <Qi.Chen@windriver.com>
> > >
> > > docker tries to find 'runc' binary, and if 'runc' is not available,
> > > things fail.
> > >
> > > The VIRTUAL-RUNTIME_container_runtime could be crun or virtual-runc.
> > > This is not correct for docker. What docker wants is virtual-runc.
> > >
> >
> > Hmn. no, what I had was intentional (if maybe incomplete). That is ther=
e so you can configure the stack to use docker and crun.
> >
> > Are you seeing a build. or runtime error  ?
> >
> > Bruce
> >
> > > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > ---
> > >  recipes-containers/docker/docker.inc | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/recipes-containers/docker/docker.inc
> > > b/recipes-containers/docker/docker.inc
> > > index 99535a77..39782b88 100644
> > > --- a/recipes-containers/docker/docker.inc
> > > +++ b/recipes-containers/docker/docker.inc
> > > @@ -13,7 +13,7 @@ RDEPENDS:${PN} =3D "util-linux util-linux-unshare i=
ptables \
> > >                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',=
 '', 'cgroup-lite', d)} \
> > >                    bridge-utils \
> > >                   "
> > > -RDEPENDS:${PN} +=3D "virtual-containerd ${VIRTUAL-RUNTIME_container_=
runtime}"
> > > +RDEPENDS:${PN} +=3D "virtual-containerd virtual-runc"
> > >
> > >  RRECOMMENDS:${PN} =3D "kernel-module-dm-thin-pool \
> > >                       kernel-module-nf-conntrack \
> > > --
> > > 2.49.0
> > >
> > >
> > >
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
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
> View/Reply Online (#9501): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/9501
> Mute This Topic: https://lists.yoctoproject.org/mt/116925968/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

