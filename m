Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF87C25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 13:21:36 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.8426.1717075294278376427
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 May 2024 06:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EQa/4doY;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52b79447c58so1243468e87.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 May 2024 06:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717075292; x=1717680092; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIvfWBOAGgrbDyiCE28QRgI8J7lDazJxdcx74AoUKiw=;
        b=EQa/4doYN+y8Z9iSKpUT8oGrkdvJ54VaEbqOxmFk9XKG0VmwS/wPxhgYcXz/GEDYU0
         DWO3YPjfIlv4u4UHeRjVjA1Rcq5B5OtaU5sZEOOT71ByBwizPJB5qRaAx45iJ5S018Yp
         LWMpc7tcQyBvANKElFvnFWDAqFcGfmGKccAQdrczXcQLqR79tnNd61wx6NNiQFBzMrtY
         OcWx9SW5EqAs32HHDeJEc2T5osaaTgkWYRKv6f63g23b62P/V0Yo330CITW+YO0WHPt1
         tzfFAi3kZKpFk45kge1qIR3HVNmy/YlfKMu8KxA0+o5XGgzv6jcudckEQ8GtSb3/dGvI
         7twQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717075292; x=1717680092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIvfWBOAGgrbDyiCE28QRgI8J7lDazJxdcx74AoUKiw=;
        b=azqzXgzYKgPr4gkzIJNetdBKuSI8EDWdY8JEBFhC9FUDUqUKX3c9XvEF0i3nchrpX0
         UC9Br0d86Cewv4yxa9zVp9rp9z28fZaVJUwDN+EcCpMKncC3gLglFJGrnNBKGg0nTyyo
         l8oyblkx32lOOwyKJhvnuvGL2i1c/HkDylNCxdYBM8anNyop0CZl25Dvvfk4qmf1SGcv
         FAwioDOY8coewCNuKz5XMvkr+pFWYuqws3r2AZEe5aIaWszIDBnZ/SGnVGeM5D+baPzr
         kXkCra6DvY/hGYacf2B2mPpfGjUU8o0AZyDQ4zIycynN/6rx56kMgdT6+dSzCFOsvv1+
         AZLw==
X-Gm-Message-State: AOJu0YwDGdiIvMKLWW+urXMmLYRYzGL/Mu96NEWw2Nz7Cptz6TVfX5rs
	3P5OW5TE7x9+v5tQhjLNWpn+Z53KxsKPgubRDJC82u+TOWh8Pqho1oMHO4ggO4EBX5mlxmRScip
	dDUilXetlewkZ8/vpJqrQTbVcjTI=
X-Google-Smtp-Source: AGHT+IEPoDaaecvhgPewcKVhDuP6INjxM6cCCPEFEHPj3MBgqcn5TQu0aoKeVHAEq5e2+2IwUcwb9vvs0xmkDU4IXls=
X-Received: by 2002:ac2:42c7:0:b0:51d:d630:365c with SMTP id
 2adb3069b0e04-52b7d419a32mr1566212e87.4.1717075290665; Thu, 30 May 2024
 06:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240530124706.17491-1-martin.jansa@gmail.com> <CADkTA4O2a7DmbDOW2DxjXhXExgzZPMLfAp9nbtN2emL85K-EmA@mail.gmail.com>
In-Reply-To: <CADkTA4O2a7DmbDOW2DxjXhXExgzZPMLfAp9nbtN2emL85K-EmA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 30 May 2024 15:21:06 +0200
Message-ID: <CA+chaQdzX4WGA8LSb00wPzoqw5Z8A4hQ5n_uOb=nF8-Ccd4kNw@mail.gmail.com>
Subject: Re: [meta-virtualization] [master-next][PATCH] libvirt: convert more
 WORKDIR references to UNPACKDIR
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Hieu Van Nguyen <hieu2.nguyen@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 30 May 2024 13:21:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8786

On Thu, May 30, 2024 at 3:11=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
> On Thu, May 30, 2024 at 8:47=E2=80=AFAM Martin Jansa via
> lists.yoctoproject.org <martin.jansa=3Dgmail.com@lists.yoctoproject.org>
> wrote:
> >
> > From: Hieu Van Nguyen <hieu2.nguyen@lge.com>
> >
> > unpacked source files are now in UNPACKDIR, so we adjust our
> > operations to match.
> >
> > Some references were missed in previous commit as they
> > are behind conditional.
> >
> > Signed-off-by: Hieu Van Nguyen <hieu2.nguyen@lge.com>
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> >  recipes-extended/libvirt/libvirt-python.inc |  4 ++--
> >  recipes-extended/libvirt/libvirt_10.0.0.bb  | 18 +++++++++---------
> >  2 files changed, 11 insertions(+), 11 deletions(-)
> >
> > diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-exte=
nded/libvirt/libvirt-python.inc
> > index 6fb2b68c..12041df0 100644
> > --- a/recipes-extended/libvirt/libvirt-python.inc
> > +++ b/recipes-extended/libvirt/libvirt-python.inc
> > @@ -46,7 +46,7 @@ do_compile:append() {
> >                 # the syroot staged pkgconfig entries. So we clear the =
sysroot
> >                 # for just this portion.
> >                 export PKG_CONFIG_SYSROOT_DIR=3D
> > -               cd ${WORKDIR}/${BPN}-python-${PV} && \
> > +               cd ${UNPACKDIR}/${BPN}-python-${PV} && \
> >                   ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup=
.py build
> >         fi
> >  }
> > @@ -57,7 +57,7 @@ do_install:append() {
> >                 # the syroot staged pkgconfig entries. So we clear the =
sysroot
> >                 # for just this portion.
> >                 export PKG_CONFIG_SYSROOT_DIR=3D
> > -               cd ${WORKDIR}/${BPN}-python-${PV} && \
> > +               cd ${UNPACKDIR}/${BPN}-python-${PV} && \
>
> Indeed, I did miss these behind the pkgconfig.
>
> >                   ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup=
.py install \
> >                         --install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR}=
 ${LIBVIRT_INSTALL_ARGS}
> >         fi
> > diff --git a/recipes-extended/libvirt/libvirt_10.0.0.bb b/recipes-exten=
ded/libvirt/libvirt_10.0.0.bb
> > index 9ad1f798..ababbf1b 100644
> > --- a/recipes-extended/libvirt/libvirt_10.0.0.bb
> > +++ b/recipes-extended/libvirt/libvirt_10.0.0.bb
> > @@ -286,21 +286,21 @@ do_install:append() {
> >
> >         if ${@bb.utils.contains('PACKAGECONFIG','gnutls','true','false'=
,d)}; then
> >             # Generate sample keys and certificates.
> > -           cd ${WORKDIR}
> > -           ${WORKDIR}/gnutls-helper.py -y
> > +           cd ${UNPACKDIR}
> > +           ${UNPACKDIR}/gnutls-helper.py -y
>
> I had left these on purpose. Not everything has to be in UNPACKDIR
> (from my understanding and point of view)
>
> Since these are generated files as part of the build, I don't see the iss=
ue
> with them being in WORKDIR.
>
> That's what my comment about "generated files" was referring to in the
> commit message.

I see it's already in master-next, do you want v2 which will call
gnutls-helper.py from UNPACKDIR but doesn't 'cd' there?

With libvirt-python-${PV} being built under UNPACKDIR already it's a
bit confusing I agree, maybe it would be clearer to unpack all these
files and libvirt-python-${PV} under ${BPN} destdir and use ${S}
everywhere?

