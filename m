Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94879FC037D
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:42:50 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16846.1777020161205641715
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:42:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GqmBBeTa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d75312379so5468266f8f.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Apr 2026 01:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777020159; x=1777624959; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MGke1gRG9Ay7886xqGi87H0fCRhfern4DAYn2AAxGHc=;
        b=GqmBBeTaR5qEEZAFFoG+aXSr5zDhc8VuQwknvqFeU/3rkyG6kZylPMzRwjGJ8NqDgC
         t2MWImux27N17vYCy+ERcVZLd2q5cjpFfQbeH92BscnQZo6AflDq0JYLoIuwiWNK7ZS2
         tQ8I5uXWjP+28EQCzGXDWONiGwUyhm9CGcMUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777020159; x=1777624959;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MGke1gRG9Ay7886xqGi87H0fCRhfern4DAYn2AAxGHc=;
        b=JrOiSdyhmwjMj7ZkX46OIjzVui58frO7mI/adB07eKx4R64Ko54BVdJXQYzBGAsf9z
         MvztD//9BvsXFgam+XEg7r54DmkZqHB+nxwwTcdlwvHQSXCZnV3HXhPjQs+fqyWKKpQQ
         EDt860IBCdmDHciozfRWy4o52b50BPI6yN1IeCEX5mvV33a07wfehhCwaExxUTIIp6Bn
         DxaZhwpyPH+Mdz+jzJD0yGL4ennbemg3MXpp7AK+43Gvdin1JJwhPi7+943Gje0VvZT9
         quNnTNi+WzYXNMwQTWRBabp2VqO+4Gh8VxLs/6thGOzVcuJxuA5niVDeAnPktte+oSSm
         6ikA==
X-Gm-Message-State: AOJu0YwWDevqSHQ0uk4mfCvy1WrPlArKfy4jxkx/M1KemDgwTE51XKDL
	2SAiyOUu1PyF6Kj0GqncyVVpygHIXrsLCAXK+5WCqrQWLj3QZDYdjsyINVPU+iAoBYo=
X-Gm-Gg: AeBDieuRykXZCFx7gfUFlZInbCkkJeVnmAM7KHuDB2xyWuqa8e0B/Pcjhc/y8q0/6uV
	CWcjRdLVomWWtZWNxquvAklxSiFbnELhsXzjaQfrGKRZbIOwuC6RaQAzCto0g/m2StE7PORRIcy
	rqvvXWqvzECif1LJ7vg2lwMC29yorXhB5fjHb2BOHPEcr+VLnEhbilJKb8o4nrPgu8pQsZk7OdL
	Jl5/t3PfkJiUD+TPHUSoZr6vkM/d3WUehLfxiOq6z8/9fXG8qwmxbk+zvuk94OGAZeTZ8GjwHfa
	G6Os7lwiUD2v0jqnXztMY96HIbqKMiFyxnPg4pM8FSh5R7B6OSZ87DjOPVP/4vADW5hZO5bqrXE
	JZasE+0RN1ab9RfsGi2+i4L8pBADRsU+IptPG8WyPZV1Zl7uN4Yam6Jb1RkgGDe1SOkqB7UCmiR
	dB9Ed+FfVhtvI/b+COz/FH1grS4R4KgJ+kcX1KndbKIIamKTZOFDz9ydmrFuHgG761vntm2j2rZ
	Dek/q1NrKkDno9kUWxbp9sHHrE=
X-Received: by 2002:a05:6000:4709:b0:441:2397:f40f with SMTP id ffacd0b85a97d-4412397f431mr19036781f8f.4.1777020159434;
        Fri, 24 Apr 2026 01:42:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6633:2b7d:813b:8534? ([2001:8b0:aba:5f3c:6633:2b7d:813b:8534])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a79esm61532136f8f.17.2026.04.24.01.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 01:42:38 -0700 (PDT)
Message-ID: <7236dc0ea04a07ec47bd19e8cb4aee8823a7cb3f.camel@linuxfoundation.org>
Subject: Re: [meta-virtualization] [PATCH] lasyer.conf/qemu-system-native:
 Improve native DISTRO_FEATURE handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Date: Fri, 24 Apr 2026 09:42:38 +0100
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
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:42:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9740

On Thu, 2026-04-23 at 21:01 -0400, Bruce Ashfield wrote:
> On Thu, Apr 23, 2026 at 11:47=E2=80=AFAM Richard Purdie via lists.yoctopr=
oject.org <richard.purdie=3Dlinuxfoundation.org@lists.yoctoproject.org> wro=
te:
> > OE-Core needs to make some improvements to the way DISTRO_FEATURES
> > is being built
> > but this will break the way meta-virtualization is handling native
> > propagation.
> >=20
> > Use DISTRO_FEATURES_FILTER_NATIVE which is designed for this.
> >=20
> > That then means updating the bbappend just to look at
> > DISTRO_FEATURES and to
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
> > =C2=A0# Propagate virtualization/vcontainer to native DISTRO_FEATURES
> > for qemu virtfs support
> > =C2=A0# This enables virtio-9p in qemu-system-native for container-
> > cross-install batch imports
> > -DISTRO_FEATURES_NATIVE:append =3D "
> > ${@bb.utils.contains_any('DISTRO_FEATURES', 'vcontainer
> > virtualization', 'virtualization', '', d)}"
> > +DISTRO_FEATURES_FILTER_NATIVE:append =3D " vcontainer
> > virtualization"
> >=20
>=20
>=20
> I'm good to use DISTRO_FEATURES_FILTER_NATIVE, but it was less the
> mapping of vcontainer -> virtualization I was going for (although I
> did like the simplicity of just checking one), it was the yocto
> compat question.
>=20
> Doesn't that change now make it an unconditional update to that
> variable (and everyone that had meta-virt in their layers now gets
> those two variables filtered )? Or is by the native of it being
> distro features there is special handling and it won't cause
> compatibility issues ?

Just to follow up, I fixed the ca-certificates issue (patch sent) and
once I did that, I could confirm that after my patch, yocto-check-layer
still passes. We're therefore good on that front.

I also compiled a list of usability issues we need to fix in yocto-
check-layer:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16266

Cheers,

Richard


