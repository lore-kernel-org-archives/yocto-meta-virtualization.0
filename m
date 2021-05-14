Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.5246.1620975021014417403
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 May 2021 23:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lboOmZuK;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id l4so43204638ejc.10
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 13 May 2021 23:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Vmhj1xseS+EnUc7U/G0sNKIKQyV9l6MYF6n0KFiABtk=;
        b=lboOmZuKjc95yd73WPNOmQBax48rACLbH4+Zb6KtUbp90paYyPiV1JrU3q2Ss/JZc1
         sCCHXb387i4MwaNQi+qa+THDJz1gGUwGU7cjoG1ON7KURY/A+fnhgAuohEfq31aS2rTz
         GVHNY2gP4A1OUZi6mMipcsIO4r0mFDPMSj5uu+stmsyk4Ei4IbuwuzrK/Dkmoz79ikDg
         ohnQac8wgaQuCxQvOJBqBL/dezNuXg92RndF9s0GsbgstofqbfoN7EWTyCWiPO8UrUNI
         Xz9dr+feOHGMCYigyQcxpFK43GQ20xyDpxV8iUur6najK1L0Dr38Q9MKNJLaVOaKR0ix
         BFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Vmhj1xseS+EnUc7U/G0sNKIKQyV9l6MYF6n0KFiABtk=;
        b=rS81hk2Eend4bnhjN8Cuf72QZZbjwBm9it3k5EHDOL9O4Rpm2wetjHEfxTadyqgIZ9
         3lSxcos+YSBmn0iaTikos0mVIkJ/geyzng8Dz5yIlCFwtS67kZZ+/85mHcH4eRPa2SKh
         oFEOIpw3csO8kZRgTu7P3mXnzZkGjJV+vB25Q/Ih/JYlN9Ywsszm71/v4VHXNBjs7t9Z
         n+XSYVJNWM7gay1iKvhmeaMS5QyQnRWXQZ7SIenCgCFgHWwdMDI3GDLtnWJGsD7GLnc+
         xUWY67nAUpWibaXgYH4kSpKDuegX9raPCaV9vemb2RB/N6s65TLfRxZIVuHKaLAFz2xS
         Mibg==
X-Gm-Message-State: AOAM530jeGLlsVM1q0WpEuds5ldLPmZgmoHu1AoAYdgQgNQOcI63fp13
	8t7DsjSaYpOc65+dIci5g04=
X-Google-Smtp-Source: ABdhPJxvPoSTKUNgc4I3WjipcShBXGzli7nsL0ncWJ5dzyl6yIzsHU0CnD3wmIM7fCLgdHu0NsaQWA==
X-Received: by 2002:a17:907:204b:: with SMTP id pg11mr15490217ejb.433.1620975019492;
        Thu, 13 May 2021 23:50:19 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ga12sm2987113ejc.13.2021.05.13.23.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 23:50:18 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 14 May 2021 08:50:18 +0200
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] Revert "runc-opencontainers: use bfd even with ld-is-gold"
Message-ID: <20210514065018.oyfzrvriattx2zyl@jama>
References: <20210513105212.1446927-1-Martin.Jansa@gmail.com>
 <CADkTA4MirjyDNy-+oV1zrJf5H1XeWsNFqszC4ViY6cW9qK5wRQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4MirjyDNy-+oV1zrJf5H1XeWsNFqszC4ViY6cW9qK5wRQ@mail.gmail.com>
X-Groupsio-MsgNum: 6512
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qftdvddsjjgdde5r"
Content-Disposition: inline

--qftdvddsjjgdde5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 11:08:50PM -0400, Bruce Ashfield wrote:
> merged.

Thanks for merge, now please push it as well :).

("xen, rpi4: fix typo in raspberrypi dynamic-layers inclusion" is also
missing in master branch)

Cheers,

> On Thu, May 13, 2021 at 6:52 AM Martin Jansa <Martin.Jansa@gmail.com> wr=
ote:
> >
> > This reverts commit dda5ae36b44c61e61439341ea3153e6be5cb015e.
> >
> > binutils gold linker was fixed with:
> > https://git.openembedded.org/openembedded-core/commit/?id=3Dd07d4d739a=
e17787017f771dd2068fda0e836722
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  recipes-containers/runc/runc-opencontainers_git.bb | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/reci=
pes-containers/runc/runc-opencontainers_git.bb
> > index 51ba7c9..f3ff9a8 100644
> > --- a/recipes-containers/runc/runc-opencontainers_git.bb
> > +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> > @@ -8,10 +8,3 @@ SRC_URI =3D " \
> >  RUNC_VERSION =3D "1.0.0-rc93"
> >
> >  CVE_PRODUCT =3D "runc"
> > -
> > -# use BFD when ld-is-gold is used to work around:
> > -# http://errors.yoctoproject.org/Errors/Details/580099/
> > -# CGO_ENABLED=3D1 x86_64-oe-linux-go build -trimpath  -tags "seccomp =
seccomp                       netgo osusergo" -ldflags "-w -extldflags -sta=
tic -X main.gitCommit=3D"fce58ab2d5c488bc573d02712db476a6daa9a60c-dirty" -X=
 main.version=3D1.0.0-rc93+dev " -o runc .
> > -# TOPDIR/tmp-glibc/work/core2-64-oe-linux/runc-opencontainers/1.0.0-r=
c93+gitAUTOINC+fce58ab2d5-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/=
../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/11.0.1/ld: internal error=
 in format_file_lineno, at ../../gold/dwarf_reader.cc:2278
> > -# collect2: error: ld returned 1 exit status
> > -LDFLAGS_append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-go=
ld', ' -fuse-ld=3Dbfd ', '', d)}"
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

--qftdvddsjjgdde5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYJ4dqAAKCRA3VSO3ZXaA
HBSTAJ9MOYERk0OLBMEvmE5QXAv1X5uQ8gCeKxwDjgpIl0brP5C/4T/uEW6weNc=
=/rLP
-----END PGP SIGNATURE-----

--qftdvddsjjgdde5r--
