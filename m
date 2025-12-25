Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7CFE784BC
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 02:33:27 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.132103.1766630001589867143
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 18:33:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SRpUZNJG;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-34c71f462d2so6816353a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Dec 2025 18:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766630001; x=1767234801; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=977OakL54wH88kI57hosytQqFb3H6atchXUcmUs2EqE=;
        b=SRpUZNJGl9/m7p6rTLdPWJxNHDVuiiMu9Zm1rCoW3ClKlnuCXfttQlBno7BRIoBv9l
         tkaEs4CWUP8WDd7LTQ8tvOL4ye0HDZbANAfQPp7WJqSoZzFPBwAcuuh5LYP6pkVLT3xy
         i/9CuqGOGpruZiYWAWII2UuS6478Jbl89U5f2w2/bVzZECGAjruN69BT21pB+oZDZzHf
         xFdEKWtPO7A2+g6x+FbfgUVuwQc1AJqSoxFgrgovkFf9fskC1uKV7L14+1c4j/rwq7a0
         ombIy33O1ZzduXO0J3okzHibJqPwkloueMm4HEECnS9bo8+TEqV0LL/A2V30JbF5Oz+Q
         bYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766630001; x=1767234801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=977OakL54wH88kI57hosytQqFb3H6atchXUcmUs2EqE=;
        b=qADgMj7rGtuXapYRvfxRaMhiIkYg1jEHS6Vy2sfaLv7BlfFHsFbs1sfK0M0UAjFwkO
         p2/6JQ9LKFpVhU19hLOrSdaFPPAYd09rHcTyu+1WHK8ovCvRYq+WYL4DgrTzsroif+DE
         p35gLLRgsViKC+WawhA5eC32qh9DLXRilUAMce1MDoawmhw1/j0JyJdDNYcbZPc6rFRB
         r1ZZo962R2C9F1H2tbZ3q/jW9E2L52je8w3hOfuz/joC0u+3Dzc01u9HPWNNixPqjrV9
         LtCCtT++3eYRG+WbekB/4VhiNeJ7sf+K7cho5KHUkgOrdEScO4Ybj/NAsahGJIzz2Vdr
         Gx0A==
X-Gm-Message-State: AOJu0Yw60JD3+omZQNF70G8V86sOddMDf/uFtqP85ZkdZm7YGLYgsTwg
	2zvKSt/5jrCVJcbjV0/tGuO3cPr7NCBxKQ40+DEBNECol3xqzVDDgHfOYWQ1XKrBfnYeTNZOut+
	jC2X3IIzdMDQthXs7qlJVFOhND6KdsKg=
X-Gm-Gg: AY/fxX4GT0UGt0VtHpmFRGXHan/m+014baOffa37Ia6xDkyTtqakdgs+KjUHfwbGf+4
	dJU3xEkbK65DK14PIcUjPCuEoQC9K0mFj/3QUDYq8ipEMY//BXHl8KDDvHKhureVxR9pwN6c6bt
	x8w+GUvgrSUkwjIvigKJr/eoGGxuXeRYqRBb9l/ggLfxhZ8NOBzdWEB9bx6tk4J1IfN4ByYAhAH
	ZzvuEOi402qpFrNWQ4U1hHMW4LTlAMY3RxqGP6L9dkrXfhPzcWwbKPjdI6exNPbew9R3g==
X-Google-Smtp-Source: AGHT+IFW2BnaRSkYHf4Q2Cjli66ux0phEceTmSsbrj/PcusILXtb0EhuwuVbUZ+C/UUlP0mMZ4U5RiMYX6aOh3SjnGE=
X-Received: by 2002:a17:90b:56d0:b0:340:c4dc:4b70 with SMTP id
 98e67ed59e1d1-34e9211e586mr15855438a91.6.1766630000818; Wed, 24 Dec 2025
 18:33:20 -0800 (PST)
MIME-Version: 1.0
References: <20251224054744.3109658-1-Qi.Chen@windriver.com>
 <CADkTA4NK2AtaY0qfCKBP2T34N4+bTmyzKCtVf7tQjbkaCJEfdQ@mail.gmail.com> <CO6PR11MB560251C0260BAA43DCCD5CEBEDB3A@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB560251C0260BAA43DCCD5CEBEDB3A@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 24 Dec 2025 21:33:09 -0500
X-Gm-Features: AQt7F2qRudGF8YFDV1DHxPcSqaeCAm7iincnWWLAkWxBO1aMwn4AP-DZuJDwYQ8
Message-ID: <CADkTA4Mk5Xaf0QXpuSVgQFyPrMkn+bgrakm4s7+WCAz53PYstg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker: RDEPENDS on virtual-runc
To: "Chen, Qi" <Qi.Chen@windriver.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 25 Dec 2025 02:33:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9501

On Wed, Dec 24, 2025 at 10:21=E2=80=AFPM Chen, Qi <Qi.Chen@windriver.com> w=
rote:
>
> Runtime error.
>
> The scenario is that I want docker and podman to be installed together.

That's a scenario that I've explicitly made conflict.

> A few settings need to be there to have this done:
> CRUN_AS_RUNC =3D "false"
> PODMAN_FEATURES:remove =3D "docker"
> CONTAINER_PROFILE =3D "podman"
> (There's a patch to fix crun & runc installed together that I sent a few =
days ago.)
>
> On target, docker.servcie fails because runc cannot be found.
>
> Docker can work with crun because crun is somewhat compatible with runc. =
It's not like podman which does automatic search (crun first, then runc).
> And for docker to use crun, user needs to edit /etc/docker/daemon.json fi=
le. This is the normal way to do it.
>
> In summary, we need to support podman & docker installed on the same targ=
et.
> And for this to work, this patch, together with the crun fix patch, is ne=
eded.

See above.

Bruce

>
> Regards,
> Qi
>
> -----Original Message-----
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> Sent: Wednesday, December 24, 2025 9:05 PM
> To: Chen, Qi <Qi.Chen@windriver.com>
> Cc: meta-virtualization@lists.yoctoproject.org
> Subject: Re: [meta-virtualization][PATCH] docker: RDEPENDS on virtual-run=
c
>
> On Wed, Dec 24, 2025 at 1:48=E2=80=AFAM Chen Qi via lists.yoctoproject.or=
g <Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
> >
> > From: Chen Qi <Qi.Chen@windriver.com>
> >
> > docker tries to find 'runc' binary, and if 'runc' is not available,
> > things fail.
> >
> > The VIRTUAL-RUNTIME_container_runtime could be crun or virtual-runc.
> > This is not correct for docker. What docker wants is virtual-runc.
> >
>
> Hmn. no, what I had was intentional (if maybe incomplete). That is there =
so you can configure the stack to use docker and crun.
>
> Are you seeing a build. or runtime error  ?
>
> Bruce
>
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  recipes-containers/docker/docker.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/recipes-containers/docker/docker.inc
> > b/recipes-containers/docker/docker.inc
> > index 99535a77..39782b88 100644
> > --- a/recipes-containers/docker/docker.inc
> > +++ b/recipes-containers/docker/docker.inc
> > @@ -13,7 +13,7 @@ RDEPENDS:${PN} =3D "util-linux util-linux-unshare ipt=
ables \
> >                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '=
', 'cgroup-lite', d)} \
> >                    bridge-utils \
> >                   "
> > -RDEPENDS:${PN} +=3D "virtual-containerd ${VIRTUAL-RUNTIME_container_ru=
ntime}"
> > +RDEPENDS:${PN} +=3D "virtual-containerd virtual-runc"
> >
> >  RRECOMMENDS:${PN} =3D "kernel-module-dm-thin-pool \
> >                       kernel-module-nf-conntrack \
> > --
> > 2.49.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#9498):
> > https://lists.yoctoproject.org/g/meta-virtualization/message/9498
> > Mute This Topic: https://lists.yoctoproject.org/mt/116925968/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe:
> > https://lists.yoctoproject.org/g/meta-virtualization/unsub
> > [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

