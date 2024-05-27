Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB46C25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 20:38:07 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.6868.1716842281862683737
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 May 2024 13:38:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aqz8KIF/;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2b9702e05easo78668a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 May 2024 13:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716842281; x=1717447081; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzzCWMm8pQ5C/q9VdneWpnBHvKq60Hp1YIiyTVu3WlU=;
        b=aqz8KIF/W8f4o5DWiRbMLV7ybRNdc5wqyKbY8YW5l2Dbgdyz25KgGbci4eQO64w9Tm
         x3mwIcTY9vmHxH3SmvLzXIhxaI/jrTnZFp1myT6Hi3eTrb9L1pOnL3a6wKIseAxxLYQu
         ripqeYsIxdN070xI1xnltZJtf1KDelLhknWvkHytXHstyNmu7YH7l5wLkPLUiftXsGiw
         Ylb61iLwsjnJcMMaMOgHNBjbZSokGuwPJwdi6m3iZD7Sad+Pl2M+1JcBc2eQiLMTi4c5
         mZ3TgdU5AttQHZihhUC4AUPKWnobWqIueo8fY5EEsZerSUSTNBFlEZmtFNxh7CQIH8VE
         YeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716842281; x=1717447081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzzCWMm8pQ5C/q9VdneWpnBHvKq60Hp1YIiyTVu3WlU=;
        b=PDBMCpmv9LWfj8X6h9gZuR6CHRzybPN4Ldg7jk1ZLzhKCOeiQPVegnZe56ShrRLu8c
         6WZA4n1pCPNBb+RJxchm2Kcle1pklgCTC7M7b+jThOLdxVPxrQqgf2sbbSc/mag2g2WV
         ElvZoPl+S2zWqKnG6kvj88PAWcuwFA431dxKQqLR9chSUf5RdphS/wc1Jx6ct0zbJlFw
         qxSiHtp3PvFLfOurd17kgT9iMSknYkXpgq3OJBEhxVzhoPcclEuo115kjzGQkXemW9oS
         jDW4b+aL0aY/R/9vhprypmsU3/2kzyJGMSNO7R0kwYc/MUlJ2crDbrwZ6Ch/+TMSGuHq
         weWA==
X-Gm-Message-State: AOJu0YxkP0sg+Kq3wbrxvJ52hF8fBZX9MjII5TYZ7gf+/hWxuBCSXFf3
	VaWRlkPv68ZFFjTs/qAJtx0z1OiDb5K+t9GUr86UwxN70aFCPkOUPcrA+pxihfW/Zspb6XAUlOa
	WfIGmJ/jeCKQjfHBXgrnHcAzotxo=
X-Google-Smtp-Source: AGHT+IECwcxvieQbPWTPcQRkheoSkJI7SzZORe94IPWatotUdmlUwPho3Li78e3PBzhw5d6itNlF6g+rOvGQE8HV4Fk=
X-Received: by 2002:a17:90a:c58a:b0:2b6:7e55:2aad with SMTP id
 98e67ed59e1d1-2bf5e944a51mr8740206a91.7.1716842281062; Mon, 27 May 2024
 13:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240524190915.1241716-1-martin.jansa@gmail.com>
 <20240524190915.1241716-2-martin.jansa@gmail.com> <CADkTA4MJRMzVBZ7vksRw_+oHusHvGJhu9dQaL3HbwNKTvfaNJA@mail.gmail.com>
 <CA+chaQeNR23+LHGka=cyQzkE-2s5+Fo7qjrPKp_8QTb64F1rSw@mail.gmail.com>
 <CADkTA4Pnpohs_L7_fyu+XLKZLNPF6j=YW+5GHb-duPR__5M7Yg@mail.gmail.com> <CA+chaQe9dY205PvWwyPBHe0cYJs7it1OrL25F7+xhtoW42Z=4g@mail.gmail.com>
In-Reply-To: <CA+chaQe9dY205PvWwyPBHe0cYJs7it1OrL25F7+xhtoW42Z=4g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 27 May 2024 16:37:49 -0400
Message-ID: <CADkTA4OVX8p1bU5nRKT3LBUvfHJ3aCA1ZbAcUpEbFXQwMBYY=w@mail.gmail.com>
Subject: Re: [meta-virtualization] [RFC][PATCH 2/3] cni: use GO_SRCURI_DESTSUFFIX
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 May 2024 20:38:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8769

As an update. My patience is wearing thin.

The posted patches don't build for me, my changes don't build for me,
if I hack things, the runtime is broken.

I'm seeing different fetching and source management based on the
number of git repositories in the SCR_URI, which means I'm running
into everything from missing source to license checksum failures when
I reorganize the code.

I'm stubborn about this sort of thing, there's no sense in me just
merging patches that don't build on my machines, and/or patches that I
don't understand how they fix issues, since I'll never be able to
maintain things afterwards.

I am still working on this, but I'm no debugging oe-core code to try
and understand what is happening and why the behaviour is changing, so
everything is extremely hacked up and I'm not even near a RFT branch
yet.

Summary: it will be quite some time before I have meta-virt working
again, since I feel like I've had a bag of rocks dumped right on top
of me and changes to core that I don't have straight in my head yet.

Bruce

On Fri, May 24, 2024 at 3:40=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> On Fri, May 24, 2024 at 9:32=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gm=
ail.com> wrote:
> >
> > Interesting.
> >
> > I've been through the layer now and have done all the simple semantic
> > changes to adjust things.
> >
> > I'm almost to runtime testing, but expect that by Monday I'll have
> > everything sorted.
>
> OK, looking forward to the master-next update (and kirkstone update)
> to have a bit greener world builds again :).
>
> >
> > Bruce
> >
> > On Fri, May 24, 2024 at 3:26=E2=80=AFPM Martin Jansa <martin.jansa@gmai=
l.com> wrote:
> > >
> > > It was failing yesterday, but today it built OK, I didn't do any
> > > runtime testing (only checked buildhistory-diff).
> > >
> > > Have similar change for nerdctl cri-tools, only yq and docker-moby ar=
e
> > > still failing for me.
> > >
> > > On Fri, May 24, 2024 at 9:22=E2=80=AFPM Bruce Ashfield <bruce.ashfiel=
d@gmail.com> wrote:
> > > >
> > > > Did you get this to build with just that change ?
> > > >
> > > > My patches to cni are significantly larger to get it to build and
> > > > create binaries.
> > > >
> > > > Bruce
> > > >
> > > > On Fri, May 24, 2024 at 3:09=E2=80=AFPM Martin Jansa via
> > > > lists.yoctoproject.org <martin.jansa=3Dgmail.com@lists.yoctoproject=
.org>
> > > > wrote:
> > > > >
> > > > > * see:
> > > > >   https://lists.openembedded.org/g/openembedded-architecture/mess=
age/2007
> > > > >   https://git.openembedded.org/openembedded-core/commit/?id=3Dcc4=
ec43a2b657fb4c58429ab14f1edc2473c1327
> > > > >
> > > > > * fixes:
> > > > >   http://errors.yoctoproject.org/Errors/Details/772691/
> > > > >   ERROR: QA Issue: cni: LIC_FILES_CHKSUM points to an invalid fil=
e: TOPDIR/tmp-glibc/work/core2-64-oe-linux/cni/v1.2.0-rc0+gitb62753aa2bfa36=
5c1ceaff6f25774a8047c896b5/cni-v1.2.0-rc0+gitb62753aa2bfa365c1ceaff6f25774a=
8047c896b5/src/import/LICENSE [license-checksum]
> > > > >
> > > > > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > > > > ---
> > > > >  recipes-networking/cni/cni_git.bb | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networki=
ng/cni/cni_git.bb
> > > > > index b41b47cf..c0f316ec 100644
> > > > > --- a/recipes-networking/cni/cni_git.bb
> > > > > +++ b/recipes-networking/cni/cni_git.bb
> > > > > @@ -14,7 +14,7 @@ SRCREV_plugins =3D "b6a0e0bc96906f0d3bd6bfcaab0=
b5ae72292f46c"
> > > > >  SRCREV_flannel_plugin =3D "6464faacf5c00e25321573225d74638455ef0=
3a0"
> > > > >  SRCREV_FORMAT =3D "cni_plugins"
> > > > >  SRC_URI =3D "\
> > > > > -       git://github.com/containernetworking/cni.git;branch=3Dmai=
n;name=3Dcni;protocol=3Dhttps \
> > > > > +       git://github.com/containernetworking/cni.git;branch=3Dmai=
n;name=3Dcni;protocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
> > > > >          git://github.com/containernetworking/plugins.git;branch=
=3Dmain;destsuffix=3D${S}/src/github.com/containernetworking/plugins;name=
=3Dplugins;protocol=3Dhttps \
> > > > >          git://github.com/flannel-io/cni-plugin;branch=3Dmain;nam=
e=3Dflannel_plugin;protocol=3Dhttps;destsuffix=3D${S}/src/github.com/contai=
nernetworking/plugins/plugins/meta/flannel \
> > > > >          file://modules.txt \
> > > > > --
> > > > > 2.45.1
> > > > >
> > > > >
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > Links: You receive all messages sent to this group.
> > > > > View/Reply Online (#8756): https://lists.yoctoproject.org/g/meta-=
virtualization/message/8756
> > > > > Mute This Topic: https://lists.yoctoproject.org/mt/106287452/1050=
810
> > > > > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > > > > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization=
/unsub [bruce.ashfield@gmail.com]
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > >
> > > >
> > > >
> > > > --
> > > > - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
> > > > thee at its end
> > > > - "Use the force Harry" - Gandalf, Star Trek II
> >
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

