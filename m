Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F6DEC48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 16:00:40 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.9972.1707753636218248815
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 08:00:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hz3KzEEL;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d76671e5a4so27694185ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Feb 2024 08:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707753635; x=1708358435; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpdYSrU1opEKwsY7I2QGRR1GxGB52IWGvpfEZSAB+Bo=;
        b=hz3KzEELmkz372roxVPKGfsC5w8WYHxFzwLLb0Us1CwVYsgfJwgykAyNeBvcvuWcqb
         +8ayj839g31+yGSrQVmY+xCyOFiP/Hs4gSUuRjsEEQTlWK6Yk8fkjuds/sHFr1pco9Af
         MRie5CsNKO6/0eHq7xhp+vmXJYZ4GhZ9cfceBwz0AxNyH6m9j1oHfXXmwNo2YozMtkCb
         M3x9YiYCmjLPCSM23W4+WVS8OKmjMDcNg2H7urk4blRG2t2gaCZvv+Sb8gk3gP4dPEJO
         LeE5tI8tsoeMM/83EeoO8claxatMiL+QjfgKrTnK47sfKxNTMOGxXR60vQ9puymJMmiH
         Adrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707753635; x=1708358435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpdYSrU1opEKwsY7I2QGRR1GxGB52IWGvpfEZSAB+Bo=;
        b=p34Gn/8HjABNyzRV/VS7upRpdKEeOB5bDHWawEAso0sIPR7/Xn42fC9Zd963MoGZqQ
         d+1qV1nzKGKggi+v78g3VqKmSVsdzKBPW1Zq7nepAH2rewHibIEqqTat0AKh6J1GxbIH
         islTNe6V1cjkYZVX2zlFlD22o7jZvbrTVzeaS3cUZ67NzQIDWleqKzhtfdg18NGX8Lun
         mTVccxj9fU3Tt3C8x7m+oUxUHSw5s6fPw7OGDukgK47saBiow1xQjenKunQKCd8flFBN
         LDEJlxPAL0tY8UqEX6uS7pJtiM8vaClFsHUcFyueWzKXpWqBDxh6V5C9PnpL+IvOyQDj
         duKA==
X-Gm-Message-State: AOJu0Yy0D1prbppsFXl9NyT79kSm4DpY0VvsEHEqdDz661eKUUPi/BlL
	tUCiUAtrcxAp9toOwyKJ0AHyi3opAj4K29ZavVjsy0+K8v5Rn4d6ijBrAF3VBNm+s64BR7n9McJ
	Q8qcCsD0bRxhEIHtCfbCP4fqPtXY=
X-Google-Smtp-Source: AGHT+IHmt1r6blvRMlBpWRCK9MDhEvu9H0uhB8SAf9kqNz18mJoh50KrPlLfwQpucqMS7qHod/kAtTMjDwfw8XFyop0=
X-Received: by 2002:a17:90a:fb8f:b0:28c:8eaa:e5e3 with SMTP id
 cp15-20020a17090afb8f00b0028c8eaae5e3mr4781061pjb.17.1707753635230; Mon, 12
 Feb 2024 08:00:35 -0800 (PST)
MIME-Version: 1.0
References: <20240212145243.35052-1-fathi.boudra@linaro.org>
 <CADkTA4O=+5248CMDpnSQuZ=Exr9LdzgCoOOscU8sy7397E98kg@mail.gmail.com> <CAGNsrLByF3O5ZE__gvYJFfzqWPEAFt-a1zXRCUMZmh8pYr8B2w@mail.gmail.com>
In-Reply-To: <CAGNsrLByF3O5ZE__gvYJFfzqWPEAFt-a1zXRCUMZmh8pYr8B2w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 12 Feb 2024 11:00:23 -0500
Message-ID: <CADkTA4ONr5V9m___z91ErfQC8dHrO1rh1pMGpBxp+s0kj7GKxA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] upx: bump to 4.2.2 release
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Feb 2024 16:00:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8566

On Mon, Feb 12, 2024 at 10:53=E2=80=AFAM Fathi Boudra <fathi.boudra@linaro.=
org> wrote:
>
> Hi Bruce,
>
> On Mon, 12 Feb 2024 at 16:21, Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
> >
> > On Mon, Feb 12, 2024 at 9:52=E2=80=AFAM Fathi Boudra <fathi.boudra@lina=
ro.org> wrote:
> > >
> > > Update upx recipe from 3.96 to 4.2.2 release.
> > > Use the released tarball instead of git repositories.
> > > Rewrite the recipe, simplified by using the latest released tarball.
> > > Update the homepage.
> >
> > I don't mind the update, but I do pretty much insist on git
> > repositories versus tarballs.
> >
> > So I'd take an update, but not the change of format of the recipe.
>
> Sure I can revert to using the git repositories. Do you mind expand on
> the rationale so I can add a note within the recipe? Thanks.

Having the individual SRCREVs makes maintenance much easier when we
have CVEs or other issues. Grabbing patches and putting them in the
SRC_URI is suboptimal, when there's a perfectly good git repository
available that already has them available.

Also, being able to easily access the history of a repository for
bisection and debug is important when I'm debugging system issues.

Bruce

>
> > Cheers,
> >
> > Bruce
> >
> > >
> > > Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> > > ---
> > >  recipes-extended/upx/upx_4.2.2.bb | 14 ++++++++++
> > >  recipes-extended/upx/upx_git.bb   | 45 -----------------------------=
--
> > >  2 files changed, 14 insertions(+), 45 deletions(-)
> > >  create mode 100644 recipes-extended/upx/upx_4.2.2.bb
> > >  delete mode 100644 recipes-extended/upx/upx_git.bb
> > >
> > > diff --git a/recipes-extended/upx/upx_4.2.2.bb b/recipes-extended/upx=
/upx_4.2.2.bb
> > > new file mode 100644
> > > index 00000000..cb46d19c
> > > --- /dev/null
> > > +++ b/recipes-extended/upx/upx_4.2.2.bb
> > > @@ -0,0 +1,14 @@
> > > +SUMMARY =3D "Ultimate executable compressor."
> > > +HOMEPAGE =3D "https://upx.github.io/"
> > > +LICENSE =3D "GPL-2.0-only"
> > > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D353753597aa110e0ded350840=
8c6374a"
> > > +DEPENDS =3D "libucl zlib xz"
> > > +
> > > +SRC_URI =3D "https://github.com/upx/upx/releases/download/v${PV}/upx=
-${PV}-src.tar.xz"
> > > +SRC_URI[sha256sum] =3D "42ee0455eea610ef7ee732aa1f657b34a351ebcfa64a=
24c1e2a7aaec74c1e038"
> > > +
> > > +S =3D "${WORKDIR}/upx-${PV}-src"
> > > +
> > > +inherit pkgconfig cmake
> > > +
> > > +BBCLASSEXTEND =3D "native"
> > > diff --git a/recipes-extended/upx/upx_git.bb b/recipes-extended/upx/u=
px_git.bb
> > > deleted file mode 100644
> > > index 2a5f08be..00000000
> > > --- a/recipes-extended/upx/upx_git.bb
> > > +++ /dev/null
> > > @@ -1,45 +0,0 @@
> > > -HOMEPAGE =3D "http://upx.sourceforge.net"
> > > -SUMMARY =3D "Ultimate executable compressor."
> > > -
> > > -SRCREV_upx =3D "8d1a98e03bf281b2cee459b6c27347e56d13c6a8"
> > > -SRCREV_vendor_doctest =3D "666e648b68fda2deb141a1fe93e3fd1e2795dd0f"
> > > -SRCREV_vendor_lzma_sdk =3D "9ebf8f468c689d83504e6c08c6bc26c4a1cf180f=
"
> > > -SRCREV_vendor_ucl =3D "4b58d592199dc1e5db691e1a54fb0e5e9af0ecaf"
> > > -SRCREV_vendor_zlib =3D "2a5b338eb173a701ed179e951d4c390e75e8d4c7"
> > > -SRCREV_FORMAT =3D "upx"
> > > -SRC_URI =3D "git://github.com/upx/upx;name=3Dupx;branch=3Ddevel;prot=
ocol=3Dhttps \
> > > -           git://github.com/upx/upx-vendor-doctest;name=3Dvendor_doc=
test;subdir=3Dgit/vendor/doctest;branch=3Dupx-vendor;protocol=3Dhttps \
> > > -           git://github.com/upx/upx-vendor-lzma-sdk;name=3Dvendor_lz=
ma_sdk;subdir=3Dgit/vendor/lzma-sdk;branch=3Dupx-vendor;protocol=3Dhttps \
> > > -           git://github.com/upx/upx-vendor-ucl;name=3Dvendor_ucl;sub=
dir=3Dgit/vendor/ucl;branch=3Dupx-vendor;protocol=3Dhttps \
> > > -           git://github.com/upx/upx-vendor-zlib;name=3Dvendor_zlib;s=
ubdir=3Dgit/vendor/zlib;branch=3Dupx-vendor;protocol=3Dhttps \
> > > -"
> > > -
> > > -LICENSE =3D "GPL-2.0-only"
> > > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D353753597aa110e0ded350840=
8c6374a"
> > > -
> > > -DEPENDS =3D "zlib libucl xz cmake-native"
> > > -
> > > -# inherit cmake
> > > -
> > > -S =3D "${WORKDIR}/git"
> > > -
> > > -PV =3D "3.96+"
> > > -
> > > -EXTRA_OEMAKE +=3D " \
> > > -    UPX_UCLDIR=3D${STAGING_DIR_TARGET} \
> > > -    UPX_LZMADIR=3D${STAGING_DIR_TARGET} \
> > > -"
> > > -
> > > -# FIXME: The build fails if security flags are enabled
> > > -SECURITY_CFLAGS =3D ""
> > > -
> > > -do_compile() {
> > > -    oe_runmake -C src all
> > > -}
> > > -
> > > -do_install:append() {
> > > -    install -d ${D}${bindir}
> > > -    install -m 755 ${B}/build/release/upx ${D}${bindir}/upx
> > > -}
> > > -
> > > -BBCLASSEXTEND =3D "native"
> > > --
> > > 2.43.0
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#8563): https://lists.yoctoproject.org/g/meta-virt=
ualization/message/8563
> > > Mute This Topic: https://lists.yoctoproject.org/mt/104312316/1050810
> > > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/uns=
ub [bruce.ashfield@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>
> Cheers,
> --
> Fathi Boudra



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

