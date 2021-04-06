Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web09.11920.1617715174268136290
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 06:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ToZPLFZC;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id s15so1563094edd.4
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Apr 2021 06:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gl5Y6uA8xDiE4M2iwPj8dU4CIKzLp6zHLozrNGidK14=;
        b=ToZPLFZCSfnJGBAPDYRF9TJbnjFvl7TOQX0z7F1d8Yv3oyJvmjutmIc8Ch+JbH1LGc
         e4e5wq/9+DkkaSqdyGYWPcLzWg5HSbDwauzrBi4jVzsRIx2xX/3BHYv4sAwGL7+c94+U
         LbBD0EDZMEtdLz+l8WGCuTgkVT5KE3QTMNZMLzjcfWL1yNpqvTX7+X6fqCB9ZLIZHULV
         bmgmfmWtE4foUOI9wbks7jJyv9qakMSbGmRJ6XNb3LnuBOqGRzPWQEQ1RBwC/N00c13K
         zLfFaaQOv5j9CcR2Vf0Y6z0+WMCQicZyB9rwNXrngIOO7u6uYzZpFC9nrzKLJ59MvrIj
         LVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gl5Y6uA8xDiE4M2iwPj8dU4CIKzLp6zHLozrNGidK14=;
        b=Cho/gd5aqM6Yt055KkTzSDiMae7xbRARXdKVo6S0YolwJZwo3ZL4T/97nhvvO1rNcy
         1k9ffRQZbgeqDPK0W5ifRD3XiYwX4gPLTkUYuKrwLy9hetZSuwGRakfnjmKRS0sysi+6
         An2zkE6wGdUCwKv35LfoFwlPR28UyKdXHEKDKeH3tCbzx/vTG3PVH8a5+9dNUQ59QLak
         bixyvNbUXINrPTgcjvG7kdXfUGCQTThM1/Z57vZrd+8QYyctUXAm7jKvtMe+esMmQW4T
         ozjfq/ddE0HDzVhfx9OZLNrzRmAyIWGG1Whi0t5l2hGG5bVKWvPRcoo5e0iR5/A5n0B1
         at/w==
X-Gm-Message-State: AOAM531QU3SgnroWpi1alK7I35UlM7iW7jWwFyDrkiMQsvYqp2GAg8pq
	zYKPAHdDst97VnFx3a35r8o=
X-Google-Smtp-Source: ABdhPJxOFW2dLASfalMiwkOkrll39RiupQffk416jg4OkqZkCDQDf3aMxyVSUt3K2KUiCFDv9SvmdA==
X-Received: by 2002:aa7:c98f:: with SMTP id c15mr38390056edt.231.1617715172732;
        Tue, 06 Apr 2021 06:19:32 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j7sm7072501ejf.74.2021.04.06.06.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 06:19:32 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 Apr 2021 15:19:31 +0200
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 3/5] cri-o, podman, packagegroup-container: replace anonymous python function calling bb.parse.SkipRecipe with conditional PNBLACKLISTs
Message-ID: <20210406131931.lwwhis6hw2j6klex@jama>
References: <20210403195133.1401406-1-Martin.Jansa@gmail.com>
 <20210403195133.1401406-3-Martin.Jansa@gmail.com>
 <CADkTA4OUZYj1GfcRr3zXQCjru4LA_a2EgCx+qRbFozgx4q1QAA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4OUZYj1GfcRr3zXQCjru4LA_a2EgCx+qRbFozgx4q1QAA@mail.gmail.com>
X-Groupsio-MsgNum: 6317
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ky3ka5cg3f5icehp"
Content-Disposition: inline

--ky3ka5cg3f5icehp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2021 at 08:58:13AM -0400, Bruce Ashfield wrote:
> On Sat, Apr 3, 2021 at 3:51 PM Martin Jansa <Martin.Jansa@gmail.com> wro=
te:
> >
> > * PNBLACKLISTs are IMHO a bit easier to read and easier to override fr=
om distro
> >   which e.g. provides own recipe for libseccomp
>=20
> Thanks Martin,
>=20
> I'm trying to decide if I should just give up and make meta-security a
> hard/full layer dependency. More and more of the container components
> just don't work if we don't have seccomp enabled.

Agreed, but Armin also mentioned that he plans to send libseccomp to
meta-oe, so this PNBLACKLIST change should be only temporary until that ha=
ppens.

And I can imagine some people pulling libseccomp to their layer already
(instead of adding whole meta-security) and then being able to simply
set PNBLACKLIST to empty for these recipes would be much easier than
undoing the anonymous python (witch is imho impossible without
overlaying whole recipe except the function).

> But I agree that the blacklist technique is easier to read than the
> proliferating anonymous python. I'll merge it while I ponder the above
> question.
>=20
> On that topic, would adding meta-security as a layer dependency cause
> any issues in your setup/distros/builds ?

I wouldn't call it my setup anymore, but I'm just going through
PNBLACKLISTs used in webOS OSE:
https://github.com/webosose/meta-webosose/blob/master/meta-webos/conf/dist=
ro/include/webos-recipe-blacklist.inc
https://github.com/webosose/meta-webosose/blob/master/meta-webos-virtualiz=
ation/conf/layer.conf#L19

and fixing some of them or moving them to the layer where the issue is
introduced.

In webOS OSE setup this libseccomp issue is kind of special, because it
already includes meta-security layer, but BBMASKs all its content except
smack recipes which are actively used:
https://github.com/webosose/meta-webosose/blob/master/meta-webos-smack/con=
f/layer.conf#L10
so these 3-4 PNBLACKLISTs will need to stay in OSE anyway even with the
conditional on security-layer, I'll just move it to meta-webos-smack
where the BBMASK is being set:
https://github.com/shr-project/meta-webosose/commit/430589dbae6c8616d69692=
e65a3da40d2b192277
at least until libseccomp is in meta-oe and I'll be able to drop this as
well.

And who know when LGE will update webOS OSE from currently used dunfell
release, so whatever you decide in meta-virtualization is fine with me
:).

Cheers,

> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  recipes-containers/cri-o/cri-o_git.bb            | 16 +--------------=
-
> >  recipes-containers/podman/podman_git.bb          | 10 +---------
> >  .../packagegroups/packagegroup-container.bb      | 10 +---------
> >  3 files changed, 3 insertions(+), 33 deletions(-)
> >
> > diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-container=
s/cri-o/cri-o_git.bb
> > index 2d6187a..0ac5ddc 100644
> > --- a/recipes-containers/cri-o/cri-o_git.bb
> > +++ b/recipes-containers/cri-o/cri-o_git.bb
> > @@ -43,21 +43,7 @@ RDEPENDS_${PN} =3D " \
> >      libdevmapper \
> >      "
> >
> > -python __anonymous() {
> > -    msg =3D ""
> > -    # ERROR: Nothing PROVIDES 'libseccomp' (but /buildarea/layers/met=
a-virtualization/recipes-containers/cri-o/cri-o_git.bb DEPENDS on or otherw=
ise requires it).
> > -    # ERROR: Required build target 'meta-world-pkgdata' has no builda=
ble providers.
> > -    # Missing or unbuildable dependency chain was: ['meta-world-pkgda=
ta', 'cri-o', 'libseccomp']
> > -    if 'security' not in d.getVar('BBFILE_COLLECTIONS').split():
> > -        msg +=3D "Make sure meta-security should be present as it pro=
vides 'libseccomp'"
> > -        raise bb.parse.SkipRecipe(msg)
> > -    # ERROR: Nothing PROVIDES 'libselinux' (but /buildarea/layers/met=
a-virtualization/recipes-containers/cri-o/cri-o_git.bb DEPENDS on or otherw=
ise requires it).
> > -    # ERROR: Required build target 'meta-world-pkgdata' has no builda=
ble providers.
> > -    # Missing or unbuildable dependency chain was: ['meta-world-pkgda=
ta', 'cri-o', 'libselinux']
> > -    elif 'selinux' not in d.getVar('BBFILE_COLLECTIONS').split():
> > -        msg +=3D "Make sure meta-selinux should be present as it prov=
ides 'libselinux'"
> > -        raise bb.parse.SkipRecipe(msg)
> > -}
> > +PNBLACKLIST[cri-o] ?=3D "${@bb.utils.contains('BBFILE_COLLECTIONS', '=
security', bb.utils.contains('BBFILE_COLLECTIONS', 'selinux', '', 'Depends =
on libselinux from meta-selinux which is not included', d), 'Depends on lib=
seccomp from meta-security which is not included', d)}"
> >
> >  PACKAGES =3D+ "${PN}-config"
> >
> > diff --git a/recipes-containers/podman/podman_git.bb b/recipes-contain=
ers/podman/podman_git.bb
> > index a552a7f..62ae024 100644
> > --- a/recipes-containers/podman/podman_git.bb
> > +++ b/recipes-containers/podman/podman_git.bb
> > @@ -14,15 +14,7 @@ DEPENDS =3D " \
> >      ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> >  "
> >
> > -python __anonymous() {
> > -    msg =3D ""
> > -    # ERROR: Nothing PROVIDES 'libseccomp' (but meta-virtualization/r=
ecipes-containers/podman/ DEPENDS on or otherwise requires it).
> > -    # ERROR: Required build target 'meta-world-pkgdata' has no builda=
ble providers.
> > -    # Missing or unbuildable dependency chain was: ['meta-world-pkgda=
ta', 'podman', 'libseccomp']
> > -    if 'security' not in d.getVar('BBFILE_COLLECTIONS').split():
> > -        msg +=3D "Make sure meta-security should be present as it pro=
vides 'libseccomp'"
> > -        raise bb.parse.SkipRecipe(msg)
> > -}
> > +PNBLACKLIST[podman] ?=3D "${@bb.utils.contains('BBFILE_COLLECTIONS', =
'security', '', 'Depends on libseccomp from meta-security which is not incl=
uded', d)}"
> >
> >  SRCREV =3D "288fb688964cb7fc7086d0728daa1f5f6b726dd6"
> >  SRC_URI =3D " \
> > diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/re=
cipes-core/packagegroups/packagegroup-container.bb
> > index b3b0d4c..b06a7c7 100644
> > --- a/recipes-core/packagegroups/packagegroup-container.bb
> > +++ b/recipes-core/packagegroups/packagegroup-container.bb
> > @@ -44,12 +44,4 @@ RDEPENDS_packagegroup-containerd =3D " \
> >      virtual/containerd \
> >  "
> >
> > -python __anonymous() {
> > -    msg =3D ""
> > -    # ERROR: Nothing PROVIDES 'libseccomp' (but meta-virtualization/r=
ecipes-containers/podman/ DEPENDS on or otherwise requires it).
> > -    # ERROR: Required build target 'meta-world-pkgdata' has no builda=
ble providers.
> > -    # Missing or unbuildable dependency chain was: ['meta-world-pkgda=
ta', 'podman', 'libseccomp']
> > -    if 'security' not in d.getVar('BBFILE_COLLECTIONS').split():
> > -        msg +=3D "Make sure meta-security should be present as it pro=
vides 'libseccomp'"
> > -        raise bb.parse.SkipRecipe(msg)
> > -}
> > +PNBLACKLIST[packagegroup-container] ?=3D "${@bb.utils.contains('BBFIL=
E_COLLECTIONS', 'security', '', 'Depends on podman which depends on libsecc=
omp from meta-security which is not included', d)}"
> > --
> > 2.30.2
> >
> >
> >=20
> >
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

--ky3ka5cg3f5icehp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYGxf4QAKCRA3VSO3ZXaA
HPwMAJ4gODqNKx3hdGVYwGfJ1WnsZb1XIQCffXCWNhq3MD8yHYiCY8ld43NrCV8=
=lDj/
-----END PGP SIGNATURE-----

--ky3ka5cg3f5icehp--
