Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5ADDC25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 13:29:16 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.8605.1717075752817233740
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 May 2024 06:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B9ez3V/c;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2bf62b121ccso622364a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 May 2024 06:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717075752; x=1717680552; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuHKqG0NPK41qVnWyU+dhpmqujicVAQYRmQtDi/PZz8=;
        b=B9ez3V/cbxGLmyCmYlxTrBtKQTj1feIyxErSG/W01QWQj33jycWOVyVRdEi9Du7wuC
         Ye9sX81og1rcYUGVJhuQSdzphgOoVmvSx5TjLGWA7vnfp16ZWvkqYx7tYr2rKezAaeNC
         /hTMa5asI297w69STieHFAId2Xee0XrBIXsGV3JStL5FEyTuZMZlMXKdO02LG9saB52+
         8LvP1tmdjlAw7n6LHUrqmX+wnFJuPM0jwNOQV0MsVLcAINYfOqU2q09JkZj1ljmgSlUc
         G7wKJaXHJOAOzf3wFbCbfchwjGEt+t8UJ1XA2hP8tCEvTYUC5Zs3watavzT4+BubCNuI
         EqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717075752; x=1717680552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kuHKqG0NPK41qVnWyU+dhpmqujicVAQYRmQtDi/PZz8=;
        b=LtxqQf21yOTWslxiL17YDQMX3YNfJ9hO+Ua3Mh8rmUqbc+9FozZvdKp18+W5jL2Egp
         iQ+MBb2+lzco2DGRl6sHG/hnzKM8Ig0XEN1zL0GY92PioCYrdJN2f8kgx6x7mWClS0ia
         03KQiCBqu03CWul5bFLixy14VBOGG8McJchyWI9yOHnPkoa1O8Kr6rRKFh23BOs/q7O7
         rEI7NFcjLruWPMDEI+TGXV0+i4lMh9KgDzKq/i0v/BG6yVX+faEuE6S26Dy4Q8QF26dD
         sFUc6t3406TD/km4lZ8qbbDMWcUg5ccNt4xBTPds8xGFaqY+yGJ9OEafoz0xTK3Q+40q
         y80w==
X-Gm-Message-State: AOJu0YznpC6QiGeM2enretalFIwubqUFa+ei0wse3IODWiP2UqfNblc5
	KOreaUVmCfM00BBNjkh7mWkQfuD0KHaI6qcS39iDZ66tSy8Yi0lx7AHDtUjAdzQ8rG9nFOrd7od
	8Nt8zDUQ6i0woIjd2tAJKcSoifGE=
X-Google-Smtp-Source: AGHT+IFerAEkcz4ODtb8k5K4Z/vCAIrzVy41ZWG+DioQysLsDLzzOYeK3KL+iz1vgIv0EiduG60QngANUJsHO8o+d5I=
X-Received: by 2002:a17:90a:b00a:b0:2c1:5e90:5e6e with SMTP id
 98e67ed59e1d1-2c1acc914cbmr2800271a91.19.1717075752146; Thu, 30 May 2024
 06:29:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240530124706.17491-1-martin.jansa@gmail.com>
 <CADkTA4O2a7DmbDOW2DxjXhXExgzZPMLfAp9nbtN2emL85K-EmA@mail.gmail.com> <CA+chaQdzX4WGA8LSb00wPzoqw5Z8A4hQ5n_uOb=nF8-Ccd4kNw@mail.gmail.com>
In-Reply-To: <CA+chaQdzX4WGA8LSb00wPzoqw5Z8A4hQ5n_uOb=nF8-Ccd4kNw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 30 May 2024 09:29:00 -0400
Message-ID: <CADkTA4NK5yCBu0BQ-5No0ppA8Pcq1EWc8nTLPcHn9wUsKwCMEw@mail.gmail.com>
Subject: Re: [meta-virtualization] [master-next][PATCH] libvirt: convert more
 WORKDIR references to UNPACKDIR
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Hieu Van Nguyen <hieu2.nguyen@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 30 May 2024 13:29:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8787

On Thu, May 30, 2024 at 9:21=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> On Thu, May 30, 2024 at 3:11=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gm=
ail.com> wrote:
> >
> > On Thu, May 30, 2024 at 8:47=E2=80=AFAM Martin Jansa via
> > lists.yoctoproject.org <martin.jansa=3Dgmail.com@lists.yoctoproject.org=
>
> > wrote:
> > >
> > > From: Hieu Van Nguyen <hieu2.nguyen@lge.com>
> > >
> > > unpacked source files are now in UNPACKDIR, so we adjust our
> > > operations to match.
> > >
> > > Some references were missed in previous commit as they
> > > are behind conditional.
> > >
> > > Signed-off-by: Hieu Van Nguyen <hieu2.nguyen@lge.com>
> > > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > > ---
> > >  recipes-extended/libvirt/libvirt-python.inc |  4 ++--
> > >  recipes-extended/libvirt/libvirt_10.0.0.bb  | 18 +++++++++---------
> > >  2 files changed, 11 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-ex=
tended/libvirt/libvirt-python.inc
> > > index 6fb2b68c..12041df0 100644
> > > --- a/recipes-extended/libvirt/libvirt-python.inc
> > > +++ b/recipes-extended/libvirt/libvirt-python.inc
> > > @@ -46,7 +46,7 @@ do_compile:append() {
> > >                 # the syroot staged pkgconfig entries. So we clear th=
e sysroot
> > >                 # for just this portion.
> > >                 export PKG_CONFIG_SYSROOT_DIR=3D
> > > -               cd ${WORKDIR}/${BPN}-python-${PV} && \
> > > +               cd ${UNPACKDIR}/${BPN}-python-${PV} && \
> > >                   ${STAGING_BINDIR_NATIVE}/python3-native/python3 set=
up.py build
> > >         fi
> > >  }
> > > @@ -57,7 +57,7 @@ do_install:append() {
> > >                 # the syroot staged pkgconfig entries. So we clear th=
e sysroot
> > >                 # for just this portion.
> > >                 export PKG_CONFIG_SYSROOT_DIR=3D
> > > -               cd ${WORKDIR}/${BPN}-python-${PV} && \
> > > +               cd ${UNPACKDIR}/${BPN}-python-${PV} && \
> >
> > Indeed, I did miss these behind the pkgconfig.
> >
> > >                   ${STAGING_BINDIR_NATIVE}/python3-native/python3 set=
up.py install \
> > >                         --install-lib=3D${D}/${PYTHON_SITEPACKAGES_DI=
R} ${LIBVIRT_INSTALL_ARGS}
> > >         fi
> > > diff --git a/recipes-extended/libvirt/libvirt_10.0.0.bb b/recipes-ext=
ended/libvirt/libvirt_10.0.0.bb
> > > index 9ad1f798..ababbf1b 100644
> > > --- a/recipes-extended/libvirt/libvirt_10.0.0.bb
> > > +++ b/recipes-extended/libvirt/libvirt_10.0.0.bb
> > > @@ -286,21 +286,21 @@ do_install:append() {
> > >
> > >         if ${@bb.utils.contains('PACKAGECONFIG','gnutls','true','fals=
e',d)}; then
> > >             # Generate sample keys and certificates.
> > > -           cd ${WORKDIR}
> > > -           ${WORKDIR}/gnutls-helper.py -y
> > > +           cd ${UNPACKDIR}
> > > +           ${UNPACKDIR}/gnutls-helper.py -y
> >
> > I had left these on purpose. Not everything has to be in UNPACKDIR
> > (from my understanding and point of view)
> >
> > Since these are generated files as part of the build, I don't see the i=
ssue
> > with them being in WORKDIR.
> >
> > That's what my comment about "generated files" was referring to in the
> > commit message.
>
> I see it's already in master-next, do you want v2 which will call
> gnutls-helper.py from UNPACKDIR but doesn't 'cd' there?

That sounds like a good idea. I'll drop the current patch from master-next.

I was guilty of building it while looking at the change, so I pushed
it out of habit :)

>
> With libvirt-python-${PV} being built under UNPACKDIR already it's a
> bit confusing I agree, maybe it would be clearer to unpack all these
> files and libvirt-python-${PV} under ${BPN} destdir and use ${S}
> everywhere?

That also sounds like a good cleanup / clarification.

Bruce



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

