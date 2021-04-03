Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.27904.1617438788576797922
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 03 Apr 2021 01:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fLBGF0vw;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id n2so3885241ejy.7
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 03 Apr 2021 01:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=G4mQUM0uClom8dO64b5hTRdnSPkozhWldlzG7xGO81E=;
        b=fLBGF0vwqAohudubPnGcoUQKrjERNIidnezcAypJF6CwGFgtpOT3WltTZMP/qg01Hh
         0sjx+LXMb22TWHS0eZp8v7ZUmqozQ9mMijlCiwMncb2PYC2J1oTr25a5ILTmPqfzqYKE
         3hwh41ESIRNu94Th5G5yD0vJfb5qKeI0PTRIfTcIUBjDcXotuTUR5iZOfNdcY/hZzLNO
         OoMA9cJsEZ7uE9SNiGK9eID0bOxRuQO5MWDPwjn3h+ZnmsXzoFPo+zcPNKLzm7X8uZvm
         WGZPsqJ+r+OR7ji8BKvFDG8UWY0jviV7cCHfK6eIsVm/HTJvDdYxY2ElMrYXPGlgVPT0
         oZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G4mQUM0uClom8dO64b5hTRdnSPkozhWldlzG7xGO81E=;
        b=STHDgNDDAMapxYMB/UBlJ7ZWJL+0pTSgTAy2CprVlrmetkHlGLJ1I7rBo+SlEh1+kb
         h8QjIE/JHU1ouRdJi6m2BFd+0v3idkZZ9RZMVDIvrAoudMRAf8V9Tr+jOffDl2rLrtW1
         617tjlFyPEMYHWV+nUK0mTkxHDavP6dUDP2YBcFiBU9GGLzRBUqYsIbrrG2m6ZiRzFhx
         d4ghTSqSVjpKh7LIi5/9/ov3spgbpM5C2g5HXMeP00XjLdmp48rsM/rlQ+AqVALsqHMa
         lN2xTx7N3nCxXFWbS2RjNxt2m9rT98Qa2YGwkrMJQFdW/rNeAhsFIwzDI1eA4hCbPt0k
         u8dQ==
X-Gm-Message-State: AOAM530KMKjmvqMmCap6kVJTZYggAV1zViZDBnZOPSxze/3KZEp5Lqwj
	GKNWD31keOqGXkvCCv9kI6g=
X-Google-Smtp-Source: ABdhPJwecBY2jR0RnJoTCeG6fVOgUlt3+LZNy8XT5YXsdGt4yxtxGow5ddAe1ML4ADBrqGJ9spBUmQ==
X-Received: by 2002:a17:906:938f:: with SMTP id l15mr17821010ejx.15.1617438787065;
        Sat, 03 Apr 2021 01:33:07 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id cy5sm6792642edb.46.2021.04.03.01.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 01:33:06 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 3 Apr 2021 10:33:05 +0200
To: akuster808 <akuster808@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 2/2] packagegroup-container: skip without meta-security because of podman
Message-ID: <20210403083305.nsxuymrw5ezxvolt@jama>
References: <20210402070244.2321014-1-Martin.Jansa@gmail.com>
 <20210402070244.2321014-2-Martin.Jansa@gmail.com>
 <7d69bafb-d26d-0d79-2e22-1987911c1500@gmail.com>
MIME-Version: 1.0
In-Reply-To: <7d69bafb-d26d-0d79-2e22-1987911c1500@gmail.com>
X-Groupsio-MsgNum: 6300
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tx5pxcj5zlytcjlj"
Content-Disposition: inline

--tx5pxcj5zlytcjlj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 02, 2021 at 11:32:14AM -0700, akuster808 wrote:
>=20
>=20
> On 4/2/21 12:02 AM, Martin Jansa wrote:
> > * copy the skip from podman recipe, because this packagegroup
> >   depends on podman
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  recipes-core/packagegroups/packagegroup-container.bb | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/re=
cipes-core/packagegroups/packagegroup-container.bb
> > index d425ac5..b3b0d4c 100644
> > --- a/recipes-core/packagegroups/packagegroup-container.bb
> > +++ b/recipes-core/packagegroups/packagegroup-container.bb
> > @@ -44,3 +44,12 @@ RDEPENDS_packagegroup-containerd =3D " \
> >      virtual/containerd \
> >  "
> >  
> > +python __anonymous() {
> > +    msg =3D ""
> > +    # ERROR: Nothing PROVIDES 'libseccomp' (but meta-virtualization/r=
ecipes-containers/podman/ DEPENDS on or otherwise requires it).
> > +    # ERROR: Required build target 'meta-world-pkgdata' has no builda=
ble providers.
> > +    # Missing or unbuildable dependency chain was: ['meta-world-pkgda=
ta', 'podman', 'libseccomp']
> > +    if 'security' not in d.getVar('BBFILE_COLLECTIONS').split():
> > +        msg +=3D "Make sure meta-security should be present as it pro=
vides 'libseccomp'"
> > +        raise bb.parse.SkipRecipe(msg)
> > +}
>=20
> That reminds me that the libsecomp pkg should move to meta-oe so this
> other layers don't have to do these kinds of things.

there are also nagios recipes depending on meta-webserver which is
listed in LAYERRECOMMENDS_virtualization-layer but it would be better to
skip them like this when meta-webserver isn't included as well.

>=20
> -armin
> >
> >=20
> >
>=20

--tx5pxcj5zlytcjlj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYGgoPwAKCRA3VSO3ZXaA
HBWAAJwOXaJJhitxnRY+ODeKY3/pjUdCDgCfUWKWwDnGk2qClxIR/l+qt3Er2zM=
=P3bf
-----END PGP SIGNATURE-----

--tx5pxcj5zlytcjlj--
