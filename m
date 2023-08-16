Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87734C001E0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 14:19:19 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.162018.1692195558320520219
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Aug 2023 07:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=X8AESZm3;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d682d2d1f0dso4587399276.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Aug 2023 07:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692195557; x=1692800357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JztVhT+cOScrVs2NHEFCOm9nmRRwK45owN6E2bNITgA=;
        b=X8AESZm38M5V73/6o4ejZ2ud5Xj2YiZrDtW1q5xnuVcUxdDmMbESh7mwrnXTegRwEM
         8swswoUkucYUsUpxIACREtTILf0moYBqBXp34tjdSu/+FkPqAE/c2mcp5vpQO8Qax1ZO
         sujWLDLBqTO5SC56z7g6I4OPuw7VJ7sB1JQfOXpY7H/PoOrcI7hhwhYx20LX9f/MJcNG
         yO8VyD/ZLj1xINKSaj+YffC6v5XT9ubNmS6CQsAKtMHFsouiHz59L4twDlSaoYaldhpl
         DF2QmqTTcxpVz49/OOrtFVYuIaFFN7gO/qTlvAuyZ9qaiaVS0tUmjqodbhJMW+vAiBzZ
         78dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692195557; x=1692800357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JztVhT+cOScrVs2NHEFCOm9nmRRwK45owN6E2bNITgA=;
        b=Uyf6cWFKxTdDJS3stkEo/XTd56UFPpN3ZQMO7rACJT1KFNoZewtyrCWZlfYFH2YW+q
         nUBHGrnbUNurB+dJfdgoYJZ1s4yGPR9rJY0gItXqH/CwESIGqQg7y0JWKYzXo/2D3U+Z
         gevylX183DjnPHQSsDAnwYrF/FHy9M+BdQjeefqDfd+B/3lE0cvOu4VaaEoAYoN547q+
         GDMo09ZQShFwE69Fqutf5sm/cfpmZee37bhXB/3wwFNo/yvOHSlXP0avVBWwGPxkK2/G
         kOteYi2wvu0IlDfbmHqiCU9tJ9qFpVLWQ+NEu42xNG/KegFlhfYOJo+sZbqO+TGoPlB9
         MEqQ==
X-Gm-Message-State: AOJu0YwlJdgwyZzbjFKSO0XmzAn0DZIxg3SbRgPbUFAL27u1Ypii4E3o
	9VV/5UmmQpFPpiUjmR+nf0XArm911A8bFnjoKMfxEm+jk+tuqQ==
X-Google-Smtp-Source: AGHT+IHcE2b6sE0Nv3lxa4mZ+FYe/y+vL9g5HU9QAXAiVtxgwXFDrpHELVwdPTtgaxOiVSa/U3l8HYnvaSmvzVwukFM=
X-Received: by 2002:a25:d386:0:b0:d0f:cc89:3c0e with SMTP id
 e128-20020a25d386000000b00d0fcc893c0emr1692845ybf.10.1692195557337; Wed, 16
 Aug 2023 07:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230814-vhost-device-v2-1-4ec4b7a005a9@linaro.org>
 <ZNyErpfW8p2lX81Z@nuoska> <CUTTTZWVTFSB.37XU7VSAOVZKZ@fedora>
 <CADkTA4Oxrz9EZtc7KtwRAuNQGcooekZbzASk11u4Ckw5HgbLgg@mail.gmail.com> <CUU15SVB275M.CYT5K4RSGF1P@fedora>
In-Reply-To: <CUU15SVB275M.CYT5K4RSGF1P@fedora>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 16 Aug 2023 10:19:05 -0400
Message-ID: <CADkTA4O4+=t4cF4_Yq6igCCbweG_oq-SWrTLyckwYmUH3B1_vw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] vhost-device: add recipes for
 vhost-device daemons
To: Erik Schilling <erik.schilling@linaro.org>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, 
	meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Aug 2023 14:19:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8202

On Wed, Aug 16, 2023 at 10:14=E2=80=AFAM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> On Wed Aug 16, 2023 at 3:34 PM CEST, Bruce Ashfield wrote:
> > On Wed, Aug 16, 2023 at 4:32=E2=80=AFAM Erik Schilling
> > <erik.schilling@linaro.org> wrote:
> > >
> > > On Wed Aug 16, 2023 at 10:11 AM CEST, Mikko Rapeli wrote:
> > > > Hi,
> > > >
> > > > On Mon, Aug 14, 2023 at 10:04:06AM +0200, Erik Schilling wrote:
> > > > > This adds recipes for the first tagged release of the vhost-devic=
e
> > > > > daemons of the rust-vmm project.
> > > > >
> > > > > While the initial release was done for all daemons at the same ti=
me,
> > > > > the daemons all have indepentend version numbers and will be rele=
ased
> > > > > on their own schedules in the future. Therefore, I splitted them =
into
> > > > > independent recipes.
> > > > >
> > > > > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > > > > ---
> > > > > These are a bunch of daemons that implement various vhost-user vi=
rtio
> > > > > devices. Currently, they are mostly tested with QEMU, but we are =
also
> > > > > working on Xen support (most bits are upstream already).
> > > > > ---
> > > > > Changes in v2:
> > > > > - Added README.md to explain generation of dependency .inc files
> > > > > - Link to v1: https://lore.kernel.org/r/20230728-vhost-device-v1-=
1-d9f81124b66a@linaro.org
> > > > > ---
> > > > >  README.md                                          |  14 ++
> > > > >  .../vhost-device/vhost-device-gpio-crates.inc      | 184 +++++++=
++++++++
> > > > >  .../vhost-device/vhost-device-gpio_0.1.0.bb        |  20 ++
> > > > >  .../vhost-device/vhost-device-i2c-crates.inc       | 126 +++++++=
+++
> > > > >  .../vhost-device/vhost-device-i2c_0.1.0.bb         |  16 ++
> > > > >  .../vhost-device/vhost-device-rng-crates.inc       | 158 +++++++=
++++++
> > > > >  .../vhost-device/vhost-device-rng_0.1.0.bb         |  17 ++
> > > > >  .../vhost-device/vhost-device-scsi-crates.inc      | 166 +++++++=
++++++
> > > > >  .../vhost-device/vhost-device-scsi_0.1.0.bb        |  16 ++
> > > > >  .../vhost-device/vhost-device-vsock-crates.inc     | 258 +++++++=
++++++++++++++
> > > > >  .../vhost-device/vhost-device-vsock_0.1.0.bb       |  16 ++
> > > > >  11 files changed, 991 insertions(+)
> > > > <snip>
> > > > > +++ b/recipes-extended/vhost-device/vhost-device-gpio_0.1.0.bb
> > > > > @@ -0,0 +1,20 @@
> > > > > +SUMMARY =3D "vhost gpio backend device"
> > > > > +DESCRIPTION =3D "A vhost-user backend that emulates a VirtIO GPI=
O device"
> > > > > +HOMEPAGE =3D "https://github.com/rust-vmm/vhost-device"
> > > > > +LICENSE =3D "Apache-2.0 | BSD-3-Clause"
> > > > > +LIC_FILES_CHKSUM =3D "\
> > > > > +    file://LICENSE-APACHE;md5=3D3b83ef96387f14655fc854ddc3c6bd57=
 \
> > > > > +    file://LICENSE-BSD-3-Clause;md5=3D2489db1359f496fff34bd393df=
63947e \
> > > > > +"
> > > > > +DEPENDS +=3D "libgpiod"
> > > > > +# libgpiod-sys generates bindings using bindgen, which depends o=
n clang
> > > > > +DEPENDS +=3D "clang-native"
> > > >
> > > > As Richard mentioned on #yocto, this recipe adds a new layer depend=
ency from
> > > > meta-virtualization to meta-clang. This could be documented and tes=
t build jobs
> > > > changed to include meta-clang, or these recipes could be moved to b=
uild conditionally
> > > > only when meta-clang is available by moving the recipes to director=
y
> > > > dynamic-layers/meta-clang/recipes-extended
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/=
1528/steps/23/logs/stdio
> > >
> > > Hm... I guess moving vhost-device-gpio to dynamic-layers/ is the leas=
t
> > > invasive option?
> > >
> > > @Bruce: Which option do you prefer? I can draft a patch.
> >
> > Definitely not a dynamic layer :)
> >
> > Can you expand on the dependency a bit more for me ? I find it odd that=
 libgpiod
> > is in meta-oe, but there's no mention (that I can see) about any clang
> > dependencies.
> >
> > I know very little about the way rust is stitching the bits together.
> >
> > Should libgpod really be in the DEPENDS ? Is libgpiod-sys a clang thing=
 ? And
> > libgpiod is somehow conditionally using it ?
>
> Yeah, this is a bit confusing...
>
> Here is a (hopefully) better attempt at explaining what is going on:
>
> vhost-device-gpio depends on libgpiod (the Rust crate, not the C lib).
> which in its turn depends on libgpiod-sys - a helper crate that provides
> binding to the libgpiod (C) lib.
>
> Now, libgpiod-sys does not really consist of any _real_ code. Instead,
> it is a recipe to generate the bindings at build time. This happens
> by reading the pkg-config info from libgpiod (the C lib), parsing the
> headers and linking to it.
>
> So: libgpiod (the C lib) - as it is in meta-oe - does not depend on
> clang-native, only libgpiod-sys (the Rust lib) does.
>
> The final result is two dependencies being required for building
> libgpiod-sys: libclang (for bindgen) and libgpiod (the C lib) (for
> pkg-config, the headers and linking).
>
> In Rust - in contrast to how C libs are typically packaged - libgpiod
> (the Rust lib) and libgpiod-sys (Rust lib again) are built and linked
> into vhost-device-gpio all during the build of this recipe. So the
> dependencies are required here.
>
> The final result is:
>
> =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> =E2=94=82          vhost-device-gpio           =E2=94=82
> =E2=94=82                                      =E2=94=82
> =E2=94=82 libgpiod (Rust), libgpiod-sys (Rust) =E2=94=82 =E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=96=BA  libgpiod (C)
> =E2=94=82           (static linking)           =E2=94=82 (dynamic link)  =
    =E2=96=B2
> =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98            =
         =E2=94=82
>                    =E2=96=B2                           the usual libgpiod=
 recipe
>                    =E2=94=82
>    this is the build result of this recipe
>

Aha. Yes, I see why my dependency investigation got tangled up
in the "normal" libgpiod in meta-openembedded.

>
> Overall, the generation of bindings at build time is fairly common in
> the Rust ecosystem. parsec in meta-security, for example, also does the
> same thing. There the situation seems to be solved by putting parsec
> into it's own layer within the meta-security repo.

Layers with a single or few recipes are a pet peeve of mine :)

>
> > Either way, we used to do this same dance with meta-security, and we di=
d that
> > via SKIP_RECIPE. So that's how I'd solve this. But obviously none of th=
e core
> > packagesgroups, etc,  in meta-virt can have the vhost* packages if that=
 is the
> > case. Barring that, we add the dependency, if it becomes a widespread u=
se case,
> > it'll end up in core anyway.
>
> This would require users of the layer to undo the SKIP_RECIPE? Or am I
> misunderstanding what you mean? Just trying to understand the proposal,
> I got no opinions on the best solution to resolve this. I am happy with
> what seems best for the greater world.

It is similar to a layer, but it keeps everything centralized. It'll
automatically
be undone if meta-clang is available (with the appropriate changes of
course).

We used to have this for selinux and security:

SKIP_RECIPE[cri-o] ?=3D "${@bb.utils.contains('BBFILE_COLLECTIONS',
'security', bb.utils.contains('BBFILE_COLLECTIONS', 'selinux', '',
'Depends on libselinux from meta-selinux which is not included', d),
'Depends on libseccomp from meta-security which is not included', d)}"

SKIP_RECIPE[cri-o] ?=3D "${@bb.utils.contains('BBFILE_COLLECTIONS',
'selinux', '', 'Depends on libselinux from meta-selinux which is not
included', d)}"

Cheers,

Bruce

>
> > But I still need to understand this a bit better before I will firmly
> > land one way
> > or the other.
>
> Let me know if you got further questions :)
>
> - Erik
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

