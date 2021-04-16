Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.3768.1618539884885630809
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 19:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=USDoPqXs;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id l4so39798611ejc.10
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 15 Apr 2021 19:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=c0oYolZ6IT7CGgXV5zvQ3E688dhs0yW3sNm4G6sL5PQ=;
        b=USDoPqXsJ738zUELrjBiMRTxtnHOlACR6QCNPZhyDgN9wZpQ9UDwaE/ZB9pXobcsqV
         aMlKw+3gLAtINQSFruUA2XLR0+Fwz85IEamEj1ckq+/Q6OHBqyRjdRv9fETdwWIuGE2N
         2kKcHcPcGewTE+DAU1fNATK5tvN1yFyTf253QMdVgU+bezfBWDMa+CEm1i/pd1PZzJ0V
         m+JAawIlCWuRaM2MJic2H71+Szuu9ylPBQFYMd27MYL8ilcVL52XzwMM2AGb+UhzBa4O
         afpk02s/3N3LmhY/0KiL5EooIEFLaOVnHYRHuYQdqSQvKYZk5qVvRxyfeLKmZOBvpQkx
         yECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=c0oYolZ6IT7CGgXV5zvQ3E688dhs0yW3sNm4G6sL5PQ=;
        b=JergKXS7Zc6ab3mJnNOnF//UrBXUfM/tjNTGpRK6VJNu4yfN64x16U6kFmAdDHGMM8
         s+oEcXuhjZZx5uhm3LekoQY5gHh5cOGIdQqRjuN7jWojr7kMThoZxtmhnl65t8VLBvd1
         cJ/swlJDgbU3OEgAmAviDU842/NGMe25Yp7gLo1h21I6cAAvYfdvtxjz3TZJLMPiwJEi
         4rlo/ZqBPCxtNfRKAkJgcARJxgr8rIwKyxI4QJpLbcHavqJjgWhdUKoOIPOPhTnIYCbi
         fBqcYkPEiwHwv5VFymkmpXVd8q60p4L5ZWNU0lu2FlGC3nmP4A5GIVamRvbIZxs7TfiK
         qBrQ==
X-Gm-Message-State: AOAM530McTLe5BkgXYs+JqrX8lEfS65zOMwCoU19991qg/vhhvGi0z1T
	6VXp8IJCy/ve/wysoaH0YlIEFYnJsIGYKBnZLkc=
X-Google-Smtp-Source: ABdhPJyUeyWV3Sf9sa4dM7u6M57OuoRyQzgTJOdFuJnNjM6TRhzBKXU7pyuzLbQZ5EExD13FwCT9k/3y8FlJM61LIwE=
X-Received: by 2002:a17:906:2a16:: with SMTP id j22mr6327453eje.247.1618539883310;
 Thu, 15 Apr 2021 19:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210414233924.55589-1-christopher.w.clark@gmail.com>
 <20210414233924.55589-2-christopher.w.clark@gmail.com> <5B911C57-4D5E-40AA-B61A-8C07ACA3A5FE@arm.com>
 <CACMJ4GYkeZTD=QO8-B+mJ5vqneaK4KDN3iGhmVnnNkDYcgpCCA@mail.gmail.com>
In-Reply-To: <CACMJ4GYkeZTD=QO8-B+mJ5vqneaK4KDN3iGhmVnnNkDYcgpCCA@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 15 Apr 2021 22:24:32 -0400
Message-ID: <CADkTA4N8=WbiwzkiwsFoMO-WMgOdoU9rLRov_fqticwsuxRv2A@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2 2/6] xen, xen-tools: add recipes for new stable Xen 4.15 release
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	"cardoe@gentoo.org" <cardoe@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 3:24 PM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> On Thu, Apr 15, 2021 at 2:12 AM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
> >
> > Hi Christopher,
> >
> > > On 15 Apr 2021, at 00:39, Christopher Clark via lists.yoctoproject.o=
rg <christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
> > >
> > > Added as non-default, retaining the Xen 4.14 recipes as the default
> > > preferred version for the Hardknott release.
> > >
> > > Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> > > ---
> > > recipes-extended/xen/xen-tools_4.15.bb | 20 ++++++++++++++++++++
> > > recipes-extended/xen/xen_4.15.bb       | 21 +++++++++++++++++++++
> > > 2 files changed, 41 insertions(+)
> > > create mode 100644 recipes-extended/xen/xen-tools_4.15.bb
> > > create mode 100644 recipes-extended/xen/xen_4.15.bb
> > >
> > > diff --git a/recipes-extended/xen/xen-tools_4.15.bb b/recipes-extend=
ed/xen/xen-tools_4.15.bb
> > > new file mode 100644
> > > index 0000000..d8cb846
> > > --- /dev/null
> > > +++ b/recipes-extended/xen/xen-tools_4.15.bb
> > > @@ -0,0 +1,20 @@
> > > +SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
> > > +
> > > +XEN_REL ?=3D "4.15"
> > > +XEN_BRANCH ?=3D "stable-${XEN_REL}"
> > > +
> > > +SRC_URI =3D " \
> > > +    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> > > +    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> > > +    "
> > > +
> > > +LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b45013=
38e44a4e5"
> > > +
> > > +PV =3D "${XEN_REL}+stable${SRCPV}"
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +DEFAULT_PREFERENCE ??=3D "-1"
> >
> > we have a file meta-virt-default-versions.inc in conf/distro/include
> >
> > Shouldn=E2=80=99t we use that file and set PREFERRED_VERSION instead o=
f using default
> > preference in each recipe ?
>
> I wasn't aware of that file so hadn't considered it -- it's not
> obvious as a place to look to understand how the version of Xen is
> being set, or that it will change the default version of Xen according
> to whether the DISTRO_FEATURES includes 'virtualization'. So I am not
> sure that we should do that.

Having .inc files with lists of centralized versions is historically
what has been done and tcmode-default.inc still does.

We actually do only want those preferred versions to kick in when a
distro feature is set (xen, virtualization .. whatever), since that
means we can include the layer and it won't change anything unless the
features are turned on.

> (As an aside, there's meta-virt-xen.inc in that directory that I would
> like to retire and remove by making improvements elsewhere, for
> similar reasons.)
>
> > Something like:
> > PREFERRED_VERSION_xen ?=3D "4.14%"
> > PREFERRED_VERSION_xen-tools ?=3D "4.14%"
> >
> > This would prevent modifying the recipes when we change the default ve=
rsion.
>
> I think I would prefer to modify the recipes when the default version
> is changed, to make it a clear localized change in the Xen recipe
> directory.

I can see the advantage of both approaches.

The problem with the DEFAULT_PREFERENCE, is that just as many people
have no idea what it does, how layer ordering does (or doesn't) impact
it, etc.  It is a bit harder to grok than an explicitly listed version
(and you'll get a warning if a requested version isn't available,
etc).  But of course DEFAULT_PREFERENCE exists for a reason .. and
this is one of them. I think it does come down to preference and
consistency.

I do lean towards the .inc myself, since we need them for other
coordinating features in the layer(s), but I'm far from insisting on
that approach.

Bruce

> Would that be acceptable?
>
> Christopher
>
> >
> > Cheers
> > Bertrand
> >
> > > +
> > > +require xen.inc
> > > +require xen-tools.inc
> > > diff --git a/recipes-extended/xen/xen_4.15.bb b/recipes-extended/xen=
/xen_4.15.bb
> > > new file mode 100644
> > > index 0000000..49268cc
> > > --- /dev/null
> > > +++ b/recipes-extended/xen/xen_4.15.bb
> > > @@ -0,0 +1,21 @@
> > > +SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
> > > +
> > > +XEN_REL ?=3D "4.15"
> > > +XEN_BRANCH ?=3D "stable-${XEN_REL}"
> > > +
> > > +SRC_URI =3D " \
> > > +    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> > > +    file://xen-arm64-implement-atomic-fetch-add.patch \
> > > +    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses=
-location.patch \
> > > +    "
> > > +
> > > +LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b45013=
38e44a4e5"
> > > +
> > > +PV =3D "${XEN_REL}+stable${SRCPV}"
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +DEFAULT_PREFERENCE ??=3D "-1"
> > > +
> > > +require xen.inc
> > > +require xen-hypervisor.inc
> > > --
> > > 2.25.1
> > >
> > >
> > >=20
> > >
> >
> > IMPORTANT NOTICE: The contents of this email and any attachments are c=
onfidential and may also be privileged. If you are not the intended recipie=
nt, please notify the sender immediately and do not disclose the contents t=
o any other person, use it for any purpose, or store or copy the informatio=
n in any medium. Thank you.



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
