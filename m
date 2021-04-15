Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web08.237.1618514680913622506
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 12:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aUe1fbdi;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id n140so25379333oig.9
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 15 Apr 2021 12:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Zn6QGcl69GuLEez+l/K/C08vW9QPhHBGYhBjwpwvT3I=;
        b=aUe1fbdiCzRAnkX3XjV7bSwB2iV9RQtMeafpLoSkLTLFPD07PKbk/Py9st1nm6+sBY
         48uNR6A4LGsud7IK5CrfCjHyeA1lCs+jRlvQqJpABurQWKGO6js1uBJgFFn5w+kv2PF1
         fewhVzHjLCDpBNNQLQxDQ1wN7TQvxzThh3ZxUbbtzyOZIwQ1PTyZDwlUj7wyLyqfxu5f
         cqTnjSy0+oGpJH93CT7Q6rt66qVl7est2J7eZZS71NJZNn7wup7uqPUObw9J4pyx4aeH
         JD6LI2bMrkF20nAnyahbHUq9ez8YJypo42ovQjIMUrapAvx2AdDEAHS1//Q90IxCHgOB
         2tpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Zn6QGcl69GuLEez+l/K/C08vW9QPhHBGYhBjwpwvT3I=;
        b=msWpvepP8hFDxvMHRl1phY8MvoWpz7dU2qT6ROlHG+EQRbLeNKtnaC8mTbnyNemQwb
         uy5Mapu2VHP6COvpmuZj3vZckfRBXtjzb63tjfztqjvapu9HN270WHdat500KLohATSN
         OWbDLBEjk44r4nD7KY9J5k4uOYhh/j1SBCfeWAcNPNo0aAAWgM72uFpMofkK2lEDLqGq
         TLwELWqFeZFDaMYgpp00+qnJHbyOaBhwN3aDMvMZpVdRzuHRKkxRcdODs3Tyd8qMs2Jm
         5AsiiPaB2Xxf2fr94MfwdoUADucslAkh7L4QvTR9q9eJNhpXVXQWOaHdRawsC2oq8cJH
         6Bpg==
X-Gm-Message-State: AOAM533WtHYyt3x9bXOF2R+6uicYz6A78XXWq876TLOK2ythRTLxkAMO
	k+zDJ9sLG0IZ4Uol4yoewKdWC2GnkPoqshQhS4U=
X-Google-Smtp-Source: ABdhPJwZswsTqrmt/4fkUpVvbBTpwntJ9eXL3Tjb6eehzk3nSIsHxhmmw54NzDkdHFV9LywPZER4J3DPo21lFXUWQaE=
X-Received: by 2002:aca:534d:: with SMTP id h74mr3693773oib.152.1618514680236;
 Thu, 15 Apr 2021 12:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210414233924.55589-1-christopher.w.clark@gmail.com>
 <20210414233924.55589-2-christopher.w.clark@gmail.com> <5B911C57-4D5E-40AA-B61A-8C07ACA3A5FE@arm.com>
In-Reply-To: <5B911C57-4D5E-40AA-B61A-8C07ACA3A5FE@arm.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Thu, 15 Apr 2021 12:24:28 -0700
Message-ID: <CACMJ4GYkeZTD=QO8-B+mJ5vqneaK4KDN3iGhmVnnNkDYcgpCCA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2 2/6] xen, xen-tools: add recipes for new stable Xen 4.15 release
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	"cardoe@gentoo.org" <cardoe@gentoo.org>, "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 2:12 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Christopher,
>
> > On 15 Apr 2021, at 00:39, Christopher Clark via lists.yoctoproject.org=
 <christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > Added as non-default, retaining the Xen 4.14 recipes as the default
> > preferred version for the Hardknott release.
> >
> > Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> > ---
> > recipes-extended/xen/xen-tools_4.15.bb | 20 ++++++++++++++++++++
> > recipes-extended/xen/xen_4.15.bb       | 21 +++++++++++++++++++++
> > 2 files changed, 41 insertions(+)
> > create mode 100644 recipes-extended/xen/xen-tools_4.15.bb
> > create mode 100644 recipes-extended/xen/xen_4.15.bb
> >
> > diff --git a/recipes-extended/xen/xen-tools_4.15.bb b/recipes-extended=
/xen/xen-tools_4.15.bb
> > new file mode 100644
> > index 0000000..d8cb846
> > --- /dev/null
> > +++ b/recipes-extended/xen/xen-tools_4.15.bb
> > @@ -0,0 +1,20 @@
> > +SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
> > +
> > +XEN_REL ?=3D "4.15"
> > +XEN_BRANCH ?=3D "stable-${XEN_REL}"
> > +
> > +SRC_URI =3D " \
> > +    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> > +    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> > +    "
> > +
> > +LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338=
e44a4e5"
> > +
> > +PV =3D "${XEN_REL}+stable${SRCPV}"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +DEFAULT_PREFERENCE ??=3D "-1"
>
> we have a file meta-virt-default-versions.inc in conf/distro/include
>
> Shouldn=E2=80=99t we use that file and set PREFERRED_VERSION instead of =
using default
> preference in each recipe ?

I wasn't aware of that file so hadn't considered it -- it's not
obvious as a place to look to understand how the version of Xen is
being set, or that it will change the default version of Xen according
to whether the DISTRO_FEATURES includes 'virtualization'. So I am not
sure that we should do that.
(As an aside, there's meta-virt-xen.inc in that directory that I would
like to retire and remove by making improvements elsewhere, for
similar reasons.)

> Something like:
> PREFERRED_VERSION_xen ?=3D "4.14%"
> PREFERRED_VERSION_xen-tools ?=3D "4.14%"
>
> This would prevent modifying the recipes when we change the default vers=
ion.

I think I would prefer to modify the recipes when the default version
is changed, to make it a clear localized change in the Xen recipe
directory.
Would that be acceptable?

Christopher

>
> Cheers
> Bertrand
>
> > +
> > +require xen.inc
> > +require xen-tools.inc
> > diff --git a/recipes-extended/xen/xen_4.15.bb b/recipes-extended/xen/x=
en_4.15.bb
> > new file mode 100644
> > index 0000000..49268cc
> > --- /dev/null
> > +++ b/recipes-extended/xen/xen_4.15.bb
> > @@ -0,0 +1,21 @@
> > +SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
> > +
> > +XEN_REL ?=3D "4.15"
> > +XEN_BRANCH ?=3D "stable-${XEN_REL}"
> > +
> > +SRC_URI =3D " \
> > +    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> > +    file://xen-arm64-implement-atomic-fetch-add.patch \
> > +    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-l=
ocation.patch \
> > +    "
> > +
> > +LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338=
e44a4e5"
> > +
> > +PV =3D "${XEN_REL}+stable${SRCPV}"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +DEFAULT_PREFERENCE ??=3D "-1"
> > +
> > +require xen.inc
> > +require xen-hypervisor.inc
> > --
> > 2.25.1
> >
> >
> >=20
> >
>
> IMPORTANT NOTICE: The contents of this email and any attachments are con=
fidential and may also be privileged. If you are not the intended recipient=
, please notify the sender immediately and do not disclose the contents to =
any other person, use it for any purpose, or store or copy the information =
in any medium. Thank you.
