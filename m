Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE6AC4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 15:54:00 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.9777.1707753229821979740
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 07:53:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XonM+5zz;
 spf=pass (domain: linaro.org, ip: 209.85.208.52, mailfrom: fathi.boudra@linaro.org)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so4395469a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Feb 2024 07:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707753228; x=1708358028; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bmz6B58MpUAW2jVE2QDmkXLKuZhgzCZikF4I7nqHEf0=;
        b=XonM+5zzgMTUm+XE6ui4whP88mYQUA6LUyiB1oyEL5zHN/iVytFRapkMeP9IBwN2+g
         g9A6umGsryvKKR2aiDepKvOX0Cj89g/riCBEffm+C9mQAQzzalbbLhnPueuCbhjDjfdR
         Th6AKqtzVKzARen40xf99xIfcZNuwiOM6P8KwM3SBez6zYiy8xChol8yDy9xqNqtagrA
         9kd6K1E2CKB5qp/+JrRe6zhvwgYgD9hSXazC9tRnRrBtb74y3TaUfo10Bl2GTq1taKNf
         SdBbv8+9r+Fkvdsm6cLkKrxZcUzQEBJ/EL8V0GUBeuDYVk1TdGMHRD0nmFOnbpU95XYo
         H63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707753228; x=1708358028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bmz6B58MpUAW2jVE2QDmkXLKuZhgzCZikF4I7nqHEf0=;
        b=LU7s7R2IXoIgir1l5/agJdCmy9XsjCbVywsgCOg2AV+rUdyh6leHITSMqD6ldDhWJx
         VhgYIwU/QqjU1oO9Uvk85MXrkgmFt9PziColyEE1WlW0RO+8Y2ArVk9lOyWBoOrgCyol
         WzvFI8JJuwA7XQ8obilD8HIReSDDVK1uEeKkCTGBJn8zLinU4Cp98cmkj8L7stsY9CpR
         Hfu1z5hgNzpF9moVidbWNJnKoul4FYSiH13BoZt15KED7SJo9zSU0o/dIEzF9Ahtmh9A
         CD0LRbt0LdsJlHqpcchFCG/q8JItT6aFdxZUka580q6pvLDF9heCoKTcOuaEk/4Euq7k
         wghw==
X-Gm-Message-State: AOJu0YzvfpcionkRujSC2pZeNpTKDIYFRY+EFI7LChTZlicUc/r1VBxM
	Gv9C+zgCcMdP3DcJ6RYw5ko6RT6SMJ2r7OpGybHk49PlLXaWZoTq92TKz8HJNFeuv5eVHy0pg2Y
	t16Pds2Xe6YUEE0diUH3BxCHbwRbO1l6LbQo3yg==
X-Google-Smtp-Source: AGHT+IHEsz/ASSGCY9O89rnZzGRFsQTjmdrKIBzJx9XBcp0j1tQJ04sgldJxx55hemghsr6IYdyqzwPgJxEFj0uGxAU=
X-Received: by 2002:a17:906:16d6:b0:a38:89a9:4206 with SMTP id
 t22-20020a17090616d600b00a3889a94206mr4877471ejd.75.1707753227894; Mon, 12
 Feb 2024 07:53:47 -0800 (PST)
MIME-Version: 1.0
References: <20240212145243.35052-1-fathi.boudra@linaro.org> <CADkTA4O=+5248CMDpnSQuZ=Exr9LdzgCoOOscU8sy7397E98kg@mail.gmail.com>
In-Reply-To: <CADkTA4O=+5248CMDpnSQuZ=Exr9LdzgCoOOscU8sy7397E98kg@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Mon, 12 Feb 2024 16:53:37 +0100
Message-ID: <CAGNsrLByF3O5ZE__gvYJFfzqWPEAFt-a1zXRCUMZmh8pYr8B2w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] upx: bump to 4.2.2 release
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Feb 2024 15:54:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8565

Hi Bruce,

On Mon, 12 Feb 2024 at 16:21, Bruce Ashfield <bruce.ashfield@gmail.com> wro=
te:
>
> On Mon, Feb 12, 2024 at 9:52=E2=80=AFAM Fathi Boudra <fathi.boudra@linaro=
.org> wrote:
> >
> > Update upx recipe from 3.96 to 4.2.2 release.
> > Use the released tarball instead of git repositories.
> > Rewrite the recipe, simplified by using the latest released tarball.
> > Update the homepage.
>
> I don't mind the update, but I do pretty much insist on git
> repositories versus tarballs.
>
> So I'd take an update, but not the change of format of the recipe.

Sure I can revert to using the git repositories. Do you mind expand on
the rationale so I can add a note within the recipe? Thanks.

> Cheers,
>
> Bruce
>
> >
> > Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> > ---
> >  recipes-extended/upx/upx_4.2.2.bb | 14 ++++++++++
> >  recipes-extended/upx/upx_git.bb   | 45 -------------------------------
> >  2 files changed, 14 insertions(+), 45 deletions(-)
> >  create mode 100644 recipes-extended/upx/upx_4.2.2.bb
> >  delete mode 100644 recipes-extended/upx/upx_git.bb
> >
> > diff --git a/recipes-extended/upx/upx_4.2.2.bb b/recipes-extended/upx/u=
px_4.2.2.bb
> > new file mode 100644
> > index 00000000..cb46d19c
> > --- /dev/null
> > +++ b/recipes-extended/upx/upx_4.2.2.bb
> > @@ -0,0 +1,14 @@
> > +SUMMARY =3D "Ultimate executable compressor."
> > +HOMEPAGE =3D "https://upx.github.io/"
> > +LICENSE =3D "GPL-2.0-only"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D353753597aa110e0ded3508408c=
6374a"
> > +DEPENDS =3D "libucl zlib xz"
> > +
> > +SRC_URI =3D "https://github.com/upx/upx/releases/download/v${PV}/upx-$=
{PV}-src.tar.xz"
> > +SRC_URI[sha256sum] =3D "42ee0455eea610ef7ee732aa1f657b34a351ebcfa64a24=
c1e2a7aaec74c1e038"
> > +
> > +S =3D "${WORKDIR}/upx-${PV}-src"
> > +
> > +inherit pkgconfig cmake
> > +
> > +BBCLASSEXTEND =3D "native"
> > diff --git a/recipes-extended/upx/upx_git.bb b/recipes-extended/upx/upx=
_git.bb
> > deleted file mode 100644
> > index 2a5f08be..00000000
> > --- a/recipes-extended/upx/upx_git.bb
> > +++ /dev/null
> > @@ -1,45 +0,0 @@
> > -HOMEPAGE =3D "http://upx.sourceforge.net"
> > -SUMMARY =3D "Ultimate executable compressor."
> > -
> > -SRCREV_upx =3D "8d1a98e03bf281b2cee459b6c27347e56d13c6a8"
> > -SRCREV_vendor_doctest =3D "666e648b68fda2deb141a1fe93e3fd1e2795dd0f"
> > -SRCREV_vendor_lzma_sdk =3D "9ebf8f468c689d83504e6c08c6bc26c4a1cf180f"
> > -SRCREV_vendor_ucl =3D "4b58d592199dc1e5db691e1a54fb0e5e9af0ecaf"
> > -SRCREV_vendor_zlib =3D "2a5b338eb173a701ed179e951d4c390e75e8d4c7"
> > -SRCREV_FORMAT =3D "upx"
> > -SRC_URI =3D "git://github.com/upx/upx;name=3Dupx;branch=3Ddevel;protoc=
ol=3Dhttps \
> > -           git://github.com/upx/upx-vendor-doctest;name=3Dvendor_docte=
st;subdir=3Dgit/vendor/doctest;branch=3Dupx-vendor;protocol=3Dhttps \
> > -           git://github.com/upx/upx-vendor-lzma-sdk;name=3Dvendor_lzma=
_sdk;subdir=3Dgit/vendor/lzma-sdk;branch=3Dupx-vendor;protocol=3Dhttps \
> > -           git://github.com/upx/upx-vendor-ucl;name=3Dvendor_ucl;subdi=
r=3Dgit/vendor/ucl;branch=3Dupx-vendor;protocol=3Dhttps \
> > -           git://github.com/upx/upx-vendor-zlib;name=3Dvendor_zlib;sub=
dir=3Dgit/vendor/zlib;branch=3Dupx-vendor;protocol=3Dhttps \
> > -"
> > -
> > -LICENSE =3D "GPL-2.0-only"
> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D353753597aa110e0ded3508408c=
6374a"
> > -
> > -DEPENDS =3D "zlib libucl xz cmake-native"
> > -
> > -# inherit cmake
> > -
> > -S =3D "${WORKDIR}/git"
> > -
> > -PV =3D "3.96+"
> > -
> > -EXTRA_OEMAKE +=3D " \
> > -    UPX_UCLDIR=3D${STAGING_DIR_TARGET} \
> > -    UPX_LZMADIR=3D${STAGING_DIR_TARGET} \
> > -"
> > -
> > -# FIXME: The build fails if security flags are enabled
> > -SECURITY_CFLAGS =3D ""
> > -
> > -do_compile() {
> > -    oe_runmake -C src all
> > -}
> > -
> > -do_install:append() {
> > -    install -d ${D}${bindir}
> > -    install -m 755 ${B}/build/release/upx ${D}${bindir}/upx
> > -}
> > -
> > -BBCLASSEXTEND =3D "native"
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8563): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/8563
> > Mute This Topic: https://lists.yoctoproject.org/mt/104312316/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

Cheers,
--=20
Fathi Boudra

