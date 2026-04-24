Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B032BFB44B6
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 06:15:08 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15420.1777011299605678344
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 23:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hMnq3V63;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso69319555e9.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Apr 2026 23:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777011298; x=1777616098; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DpXVaEUwHoXFQ8+WTbcUCI58lvDBBzo8ea0H1g077Cc=;
        b=hMnq3V63JqSB5q7aC0TL/MxiLluaxsCst0/0tLX8bmSVbWYvIX+4uTcKzHJzQduf9V
         4pmxbZV7q/r4uvM2hHyeWEAjqSTCwRE1YoPTJt5KT1wCjptxCmFtOpTBOpvwhaXJhNK3
         DahkP0EdKGPLS5F6lDy2VOReGBqHksZOlBnUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777011298; x=1777616098;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DpXVaEUwHoXFQ8+WTbcUCI58lvDBBzo8ea0H1g077Cc=;
        b=FtdalfNIHzkV2u3bZp1PA3zWqg+XQEPVYjzgHN5wRoUTh2yIqWmzTJmC1mIApUHu3o
         05Pk2kNyyQw1C/MEEJ7YO4nqaCko+DNzmf+ToQdS50p8U8HYp9YLeVqyAKiONCFNNeRc
         Wm6v2RxfyCfGi6T6iFGWD6wQgrS96B3cOyPatSaB/tveFAOJMj49B7y9gkOaDJEhy3Z+
         IuJ6PIPFSo1pbrLKTRB1xfdYncjbl0wnqzZN542Y9KF7bzA0yotNUcSOtmDQIhRHejcn
         wDHRPI6XdOvokNT9eTRP8s5SH1w9ikD7JUFwbcesMQNJUwyOx1JaZZ9rDB35HAm9uX/p
         XGGg==
X-Gm-Message-State: AOJu0YxOTEIEWNiMnlyo9Kykc22jYN62q+uvyEHX06xaGTH2qTrJaQcr
	wwoZIRwuDg3Dwgl2t1R35wWH7ZgNPtxCQ7Ih3AYHfMH+9NZyqUlkDYhTHDVtIeGefUA=
X-Gm-Gg: AeBDietipDEjluCcYL78lA2Du7ZYesSQtdN5aw1PUD783kuG4ryQE/CUvXjbywnIn5x
	6MUDRR8+jg9xecYZOR/wMoY5XoJHnwXMWbA+1aEInPr2Egq+E5EP2CxFMeEZrrNHq7YU2/x3v8r
	RdYYlbrcU9e42dBqgLluJigwWRJE/4Nlr81nlAbkDVzA1GkZtbOz43A1vaJZf3XQ5AdAnTgyWIt
	j1DYfwJgurd8RrBX6zLIvzOgruAgyEwqdhBz50mSYDjABLi/Dw2QEegm1hINPf1CfpWiZASeopo
	/bpWa+ycW4zpEYMZP7XfOZhefVRCvhYXyf3isg0Q0vBGhv7zcgh4Xwh9GacWJkCNAbUCmmf5OCS
	Jix8qtPL4B7R/toMnr8M8RCaC8vv/9kiXUsUGlbc8GlvwaZyYLRqL39yeNFlYh70dqw7d3LiVoX
	FE3LyS6cHggCv20gHmfK5Z9M0yqKaKJn2amCxPUgeeRPohtJShrpOly+ytfNZjYThmup9W3iL6r
	STDjX5SuuSR1YQJMV89iUmZI9U=
X-Received: by 2002:a05:600c:498a:b0:489:ad:7b5b with SMTP id 5b1f17b1804b1-48900ad7b76mr214117525e9.24.1777011297798;
        Thu, 23 Apr 2026 23:14:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6633:2b7d:813b:8534? ([2001:8b0:aba:5f3c:6633:2b7d:813b:8534])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a52583fe7sm267220945e9.13.2026.04.23.23.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 23:14:57 -0700 (PDT)
Message-ID: <6efbb64def5f38fd31a4089e48f6abb465e80a5e.camel@linuxfoundation.org>
Subject: Re: [meta-virtualization] [PATCH] lasyer.conf/qemu-system-native:
 Improve native DISTRO_FEATURE handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Date: Fri, 24 Apr 2026 07:14:55 +0100
In-Reply-To: <CADkTA4Pr6QPDa3iByS1EPaOJCB19G_x+mX1qLSy0N8aXiO29kA@mail.gmail.com>
References: <20260423154741.2094781-1-richard.purdie@linuxfoundation.org>
	 <CADkTA4Pr6QPDa3iByS1EPaOJCB19G_x+mX1qLSy0N8aXiO29kA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Apr 2026 06:15:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9738

On Thu, 2026-04-23 at 21:01 -0400, Bruce Ashfield wrote:
>=20
>=20
> On Thu, Apr 23, 2026 at 11:47=E2=80=AFAM Richard Purdie via lists.yoctopr=
oject.org <richard.purdie=3Dlinuxfoundation.org@lists.yoctoproject.org> wro=
te:
> > OE-Core needs to make some improvements to the way DISTRO_FEATURES is b=
eing built
> > but this will break the way meta-virtualization is handling native prop=
agation.
> >=20
> > Use DISTRO_FEATURES_FILTER_NATIVE which is designed for this.
> >=20
> > That then means updating the bbappend just to look at DISTRO_FEATURES a=
nd to
> > look for both possible values.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 +-
> > =C2=A0recipes-devtools/qemu/qemu-system-native_%.bbappend | 6 +++---
> > =C2=A02 files changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/conf/layer.conf b/conf/layer.conf
> > index eababe00..2a4a4c91 100644
> > --- a/conf/layer.conf
> > +++ b/conf/layer.conf
> > @@ -72,7 +72,7 @@ HOSTTOOLS_NONFATAL +=3D "getent"
> >=20
> > =C2=A0# Propagate virtualization/vcontainer to native DISTRO_FEATURES f=
or qemu virtfs support
> > =C2=A0# This enables virtio-9p in qemu-system-native for container-cros=
s-install batch imports
> > -DISTRO_FEATURES_NATIVE:append =3D " ${@bb.utils.contains_any('DISTRO_F=
EATURES', 'vcontainer virtualization', 'virtualization', '', d)}"
> > +DISTRO_FEATURES_FILTER_NATIVE:append =3D " vcontainer virtualization"
> >=20
>=20
>=20
> I'm good to use DISTRO_FEATURES_FILTER_NATIVE, but it was less the
> mapping of vcontainer -> virtualization I was going for (although I
> did like the simplicity of just checking one), it was the yocto
> compat question.
>
> Doesn't that change now make it an unconditional update to that
> variable (and everyone that had meta-virt in their layers now gets
> those two variables filtered )? Or is by the native of it being
> distro features there is special handling and it won't cause
> compatibility issues ?

The problem isn't an unconditional update in itself, it would be an
unconditional update to a variable things actually depend upon.

If that breaks YP compat, I think we globally exclude
DISTRO_FEATURES_FILTER_NATIVE from hashes since the piece that matters
is DISTRO_FEATURES itself. I don't think that dependency should be
picked up but I'm not 100% sure and there may be a path the dependency
code can find.

DISTRO_FEATURES is the thing which would change than code would
actually be depending upon.

Unfortunately meta-virtualization YP compat was already failing with
another issue so we need to fix that one first before we can test this.

Cheers,

Richard



