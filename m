Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.5373.1618553915178831194
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 23:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NTpqmKhX;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 101-20020a9d0d6e0000b02902816815ff62so18926969oti.9
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 15 Apr 2021 23:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jpqNv4I3hB03vm8O8DjhF+N6yRDfD9Uvr7FpypqUmpU=;
        b=NTpqmKhXXQmBRHXNbbbWCtPE7tW23tLjHHp7pIcxWWJmT4C/HDHp8EN9RQy9pbJBCZ
         Nncq/+gue1agwNDN7jXurzzkKvDjzPWY8QHNgWgmL+oQQl0iLBv8BRpamvuVe1yX7n1i
         BD7UjZw8LV1Oxmz+A3OWXwUjdPMEB7Lob2W6rrxOXlotjX4L59iGiUBpfEJWzGYXu8xm
         eGOt17JqYvcZdzpy2O9WC+oG3lgSHFBFhjwMFAuHbTUPDijxVxneoJBlFVXfw5MQSkw4
         6lkeGW2/FhkmyBb0ammUzMFWetVXbDqGh/FQoa4v9PT35tSyv9y2mkzWh9bxSwDM7P0k
         4Bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jpqNv4I3hB03vm8O8DjhF+N6yRDfD9Uvr7FpypqUmpU=;
        b=FCHoRI/clmuu8OKlscqEdfNBhPU23Wxm/n0EgCzh7r2HKyGttMoVmFHgaRGUUV69T1
         J23s3vVxGx9R3EezvKqqBfbBp69XvbgRKjPiSOIC1c9bNYQGPZuDAKR5BZQqlEGM/oOx
         rq9Wpi8fwSKl0SHywminCqn0DZ3lTRRogWoZazStznIDDv1/jZiy4nSQxUM/sitwdJj+
         SBJ3VKPHMK2gGY0Pv4QLj6arLW/fMyN5Y3lCcO4aBj2F+BZK8xBWwnukF3v19x6qcLEM
         9Lkcdik9Aow1L+mmNbJcxmwPeXbIIKdqRKx0yz1daUBZJErZwhtvfJNub6ApPk2hxCTR
         TCvA==
X-Gm-Message-State: AOAM533+/WOaYRZt2JPfpUpgNHptBMj/fvO9OaOWXpPv0Ii5WQNF4AgU
	EPh3v1+DDhe+1xzVEBz+I8KdxYwKHh2LFeMLmgk=
X-Google-Smtp-Source: ABdhPJwZoYtjuU1s+2tnbdv2tbSJfhvaahebuOf8Xir8R7b0dTkfcPbCNTayja40R7PvSbXPcxDvmAK78MH4P8Y66Dw=
X-Received: by 2002:a05:6830:241b:: with SMTP id j27mr2495742ots.17.1618553914480;
 Thu, 15 Apr 2021 23:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210414233924.55589-1-christopher.w.clark@gmail.com>
 <20210414233924.55589-2-christopher.w.clark@gmail.com> <5B911C57-4D5E-40AA-B61A-8C07ACA3A5FE@arm.com>
 <CACMJ4GYkeZTD=QO8-B+mJ5vqneaK4KDN3iGhmVnnNkDYcgpCCA@mail.gmail.com> <CADkTA4N8=WbiwzkiwsFoMO-WMgOdoU9rLRov_fqticwsuxRv2A@mail.gmail.com>
In-Reply-To: <CADkTA4N8=WbiwzkiwsFoMO-WMgOdoU9rLRov_fqticwsuxRv2A@mail.gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Thu, 15 Apr 2021 23:18:22 -0700
Message-ID: <CACMJ4GaLA1=wm5v8uHkNSMBNNqBnHhvKm6Lmf+zTa8Rz0o5tiA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2 2/6] xen, xen-tools: add recipes for new stable Xen 4.15 release
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	"cardoe@gentoo.org" <cardoe@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 7:24 PM Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
>
> On Thu, Apr 15, 2021 at 3:24 PM Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
> >
> > On Thu, Apr 15, 2021 at 2:12 AM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> > >
> > > Hi Christopher,
> > >
> > > > On 15 Apr 2021, at 00:39, Christopher Clark via lists.yoctoproject=
.org <christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
> > > >
> > > > Added as non-default, retaining the Xen 4.14 recipes as the defaul=
t
> > > > preferred version for the Hardknott release.
> > > >
> > > > Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> > > > ---
> > > > recipes-extended/xen/xen-tools_4.15.bb | 20 ++++++++++++++++++++
> > > > recipes-extended/xen/xen_4.15.bb       | 21 +++++++++++++++++++++
> > > > 2 files changed, 41 insertions(+)
> > > > create mode 100644 recipes-extended/xen/xen-tools_4.15.bb
> > > > create mode 100644 recipes-extended/xen/xen_4.15.bb
> > > >
> > > > diff --git a/recipes-extended/xen/xen-tools_4.15.bb b/recipes-exte=
nded/xen/xen-tools_4.15.bb
> > > > new file mode 100644
> > > > index 0000000..d8cb846
> > > > --- /dev/null
> > > > +++ b/recipes-extended/xen/xen-tools_4.15.bb
> > > > @@ -0,0 +1,20 @@
> > > > +SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
> > > > +
> > > > +XEN_REL ?=3D "4.15"
> > > > +XEN_BRANCH ?=3D "stable-${XEN_REL}"
> > > > +
> > > > +SRC_URI =3D " \
> > > > +    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> > > > +    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> > > > +    "
> > > > +
> > > > +LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b450=
1338e44a4e5"
> > > > +
> > > > +PV =3D "${XEN_REL}+stable${SRCPV}"
> > > > +
> > > > +S =3D "${WORKDIR}/git"
> > > > +
> > > > +DEFAULT_PREFERENCE ??=3D "-1"
> > >
> > > we have a file meta-virt-default-versions.inc in conf/distro/include
> > >
> > > Shouldn=E2=80=99t we use that file and set PREFERRED_VERSION instead=
 of using default
> > > preference in each recipe ?
> >
> > I wasn't aware of that file so hadn't considered it -- it's not
> > obvious as a place to look to understand how the version of Xen is
> > being set, or that it will change the default version of Xen according
> > to whether the DISTRO_FEATURES includes 'virtualization'. So I am not
> > sure that we should do that.
>
> Having .inc files with lists of centralized versions is historically
> what has been done and tcmode-default.inc still does.
>
> We actually do only want those preferred versions to kick in when a
> distro feature is set (xen, virtualization .. whatever), since that
> means we can include the layer and it won't change anything unless the
> features are turned on.

I see - that does make a difference then.

> > (As an aside, there's meta-virt-xen.inc in that directory that I would
> > like to retire and remove by making improvements elsewhere, for
> > similar reasons.)
> >
> > > Something like:
> > > PREFERRED_VERSION_xen ?=3D "4.14%"
> > > PREFERRED_VERSION_xen-tools ?=3D "4.14%"
> > >
> > > This would prevent modifying the recipes when we change the default =
version.
> >
> > I think I would prefer to modify the recipes when the default version
> > is changed, to make it a clear localized change in the Xen recipe
> > directory.
>
> I can see the advantage of both approaches.
>
> The problem with the DEFAULT_PREFERENCE, is that just as many people
> have no idea what it does, how layer ordering does (or doesn't) impact
> it, etc.  It is a bit harder to grok than an explicitly listed version
> (and you'll get a warning if a requested version isn't available,
> etc).  But of course DEFAULT_PREFERENCE exists for a reason .. and
> this is one of them. I think it does come down to preference and
> consistency.
>
> I do lean towards the .inc myself, since we need them for other
> coordinating features in the layer(s), but I'm far from insisting on
> that approach.

OK -- I'll make the change.

Christopher


>
> Bruce
>
> > Would that be acceptable?
> >
> > Christopher
> >
> > >
> > > Cheers
> > > Bertrand
> > >
> > > > +
> > > > +require xen.inc
> > > > +require xen-tools.inc
> > > > diff --git a/recipes-extended/xen/xen_4.15.bb b/recipes-extended/x=
en/xen_4.15.bb
> > > > new file mode 100644
> > > > index 0000000..49268cc
> > > > --- /dev/null
> > > > +++ b/recipes-extended/xen/xen_4.15.bb
> > > > @@ -0,0 +1,21 @@
> > > > +SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
> > > > +
> > > > +XEN_REL ?=3D "4.15"
> > > > +XEN_BRANCH ?=3D "stable-${XEN_REL}"
> > > > +
> > > > +SRC_URI =3D " \
> > > > +    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> > > > +    file://xen-arm64-implement-atomic-fetch-add.patch \
> > > > +    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurs=
es-location.patch \
> > > > +    "
> > > > +
> > > > +LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b450=
1338e44a4e5"
> > > > +
> > > > +PV =3D "${XEN_REL}+stable${SRCPV}"
> > > > +
> > > > +S =3D "${WORKDIR}/git"
> > > > +
> > > > +DEFAULT_PREFERENCE ??=3D "-1"
> > > > +
> > > > +require xen.inc
> > > > +require xen-hypervisor.inc
> > > > --
> > > > 2.25.1
> > > >
> > > >
> > > >=20
> > > >
> > >
> > > IMPORTANT NOTICE: The contents of this email and any attachments are=
 confidential and may also be privileged. If you are not the intended recip=
ient, please notify the sender immediately and do not disclose the contents=
 to any other person, use it for any purpose, or store or copy the informat=
ion in any medium. Thank you.
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
