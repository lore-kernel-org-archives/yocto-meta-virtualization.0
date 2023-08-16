Return-Path: <erik.schilling@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 894CCC001E0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 14:14:39 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.161591.1692195276485276252
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Aug 2023 07:14:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ucWHfdWD;
 spf=pass (domain: linaro.org, ip: 209.85.208.54, mailfrom: erik.schilling@linaro.org)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5234f46c6f9so8741041a12.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Aug 2023 07:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692195275; x=1692800075;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORs08zJfKmEm0H6odKmy5vPReHQt1ELWDXxoXpF9LNk=;
        b=ucWHfdWD7oCzlhd43Xih351qAnlU+yJELRawYiwx3+gszFOfeMLs1QloIVa9hLXQfx
         sx5r/ceK+B8yds1gynAH2hvXOKrYIXiGEZSXSgtfCKNQIHFnkqSNZnZIznnV/S69xHjU
         XBpdpUnuKlaZ8AZ2oMQrPnl6mV71vA0hrZ4g8QySg53YTjUskmdoJmNIh9X/wkt+qTMb
         2ZL5meUYxYEF9WIcbvwrd8S0pVeHieHwMQeM+uWxV2myGXMURvkRc7JjZJ04AObzzP0Z
         okk5NjZ/QYSvQjxpuQUAiCwa7nzv75B6qDcZfvPEp67bCwlJvmjMiwgRuvDp3Qd5Mg2N
         Soqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692195275; x=1692800075;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ORs08zJfKmEm0H6odKmy5vPReHQt1ELWDXxoXpF9LNk=;
        b=GFfbjgJ72FaiKKt2NJQ9gkpQexrbLnCWLI/poaRkfSWgGOjWeEgtvVS2g4fl24GtXr
         D0JDgC0ALZg7vm2Tc1a8nU7vGFMcQ0rZR7laEy74GN4iLtJGCpJmPW/lDLT4OC240r3B
         kHuFms931r1CGLHQlkwR4uYOZcsiW1UcXIGpBl153d8XmUKxAAYbE68DihDDC3bvz3zU
         1kCrnIjSN6sAV3YcVVQeWygYQ83FIik9mEiNItVeITZQAxyvS+bb3AYahhtDYqfgbrLp
         rrHoJkAOgyoYtpiCp9IuIQprpsaUlkGNM2nM5d116YOEvbyo+lBannzLHpuCyox0B1CC
         SqAg==
X-Gm-Message-State: AOJu0YxAHorf8eeXyoKwmF2nbrFl58UnxfHnA+soIrXmpr5tPqclvirt
	jGF+ah3TZ1Gi4MCDTlADuQqtUQ==
X-Google-Smtp-Source: AGHT+IEcoIFcSiWxsbgvKScJaTaETG4hQhIquo44crHvSvu3kENInGgUB3i5PV0d9U7v9OcT7r/D3Q==
X-Received: by 2002:a17:906:318b:b0:982:26c5:6525 with SMTP id 11-20020a170906318b00b0098226c56525mr1624624ejy.60.1692195274852;
        Wed, 16 Aug 2023 07:14:34 -0700 (PDT)
Received: from localhost (i5387890C.versanet.de. [83.135.137.12])
        by smtp.gmail.com with ESMTPSA id p22-20020a170906229600b00977c7566ccbsm8528302eja.164.2023.08.16.07.14.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 07:14:34 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Aug 2023 16:14:33 +0200
Message-Id: <CUU15SVB275M.CYT5K4RSGF1P@fedora>
Subject: Re: [meta-virtualization][PATCH v2] vhost-device: add recipes for
 vhost-device daemons
Cc: "Mikko Rapeli" <mikko.rapeli@linaro.org>, "meta-virtualization"
 <meta-virtualization@lists.yoctoproject.org>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
From: "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.15.2
References: <20230814-vhost-device-v2-1-4ec4b7a005a9@linaro.org>
 <ZNyErpfW8p2lX81Z@nuoska> <CUTTTZWVTFSB.37XU7VSAOVZKZ@fedora>
 <CADkTA4Oxrz9EZtc7KtwRAuNQGcooekZbzASk11u4Ckw5HgbLgg@mail.gmail.com>
In-Reply-To: <CADkTA4Oxrz9EZtc7KtwRAuNQGcooekZbzASk11u4Ckw5HgbLgg@mail.gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Aug 2023 14:14:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8201

On Wed Aug 16, 2023 at 3:34 PM CEST, Bruce Ashfield wrote:
> On Wed, Aug 16, 2023 at 4:32=E2=80=AFAM Erik Schilling
> <erik.schilling@linaro.org> wrote:
> >
> > On Wed Aug 16, 2023 at 10:11 AM CEST, Mikko Rapeli wrote:
> > > Hi,
> > >
> > > On Mon, Aug 14, 2023 at 10:04:06AM +0200, Erik Schilling wrote:
> > > > This adds recipes for the first tagged release of the vhost-device
> > > > daemons of the rust-vmm project.
> > > >
> > > > While the initial release was done for all daemons at the same time=
,
> > > > the daemons all have indepentend version numbers and will be releas=
ed
> > > > on their own schedules in the future. Therefore, I splitted them in=
to
> > > > independent recipes.
> > > >
> > > > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > > > ---
> > > > These are a bunch of daemons that implement various vhost-user virt=
io
> > > > devices. Currently, they are mostly tested with QEMU, but we are al=
so
> > > > working on Xen support (most bits are upstream already).
> > > > ---
> > > > Changes in v2:
> > > > - Added README.md to explain generation of dependency .inc files
> > > > - Link to v1: https://lore.kernel.org/r/20230728-vhost-device-v1-1-=
d9f81124b66a@linaro.org
> > > > ---
> > > >  README.md                                          |  14 ++
> > > >  .../vhost-device/vhost-device-gpio-crates.inc      | 184 +++++++++=
++++++
> > > >  .../vhost-device/vhost-device-gpio_0.1.0.bb        |  20 ++
> > > >  .../vhost-device/vhost-device-i2c-crates.inc       | 126 +++++++++=
+
> > > >  .../vhost-device/vhost-device-i2c_0.1.0.bb         |  16 ++
> > > >  .../vhost-device/vhost-device-rng-crates.inc       | 158 +++++++++=
++++
> > > >  .../vhost-device/vhost-device-rng_0.1.0.bb         |  17 ++
> > > >  .../vhost-device/vhost-device-scsi-crates.inc      | 166 +++++++++=
++++
> > > >  .../vhost-device/vhost-device-scsi_0.1.0.bb        |  16 ++
> > > >  .../vhost-device/vhost-device-vsock-crates.inc     | 258 +++++++++=
++++++++++++
> > > >  .../vhost-device/vhost-device-vsock_0.1.0.bb       |  16 ++
> > > >  11 files changed, 991 insertions(+)
> > > <snip>
> > > > +++ b/recipes-extended/vhost-device/vhost-device-gpio_0.1.0.bb
> > > > @@ -0,0 +1,20 @@
> > > > +SUMMARY =3D "vhost gpio backend device"
> > > > +DESCRIPTION =3D "A vhost-user backend that emulates a VirtIO GPIO =
device"
> > > > +HOMEPAGE =3D "https://github.com/rust-vmm/vhost-device"
> > > > +LICENSE =3D "Apache-2.0 | BSD-3-Clause"
> > > > +LIC_FILES_CHKSUM =3D "\
> > > > +    file://LICENSE-APACHE;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
> > > > +    file://LICENSE-BSD-3-Clause;md5=3D2489db1359f496fff34bd393df63=
947e \
> > > > +"
> > > > +DEPENDS +=3D "libgpiod"
> > > > +# libgpiod-sys generates bindings using bindgen, which depends on =
clang
> > > > +DEPENDS +=3D "clang-native"
> > >
> > > As Richard mentioned on #yocto, this recipe adds a new layer dependen=
cy from
> > > meta-virtualization to meta-clang. This could be documented and test =
build jobs
> > > changed to include meta-clang, or these recipes could be moved to bui=
ld conditionally
> > > only when meta-clang is available by moving the recipes to directory
> > > dynamic-layers/meta-clang/recipes-extended
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/15=
28/steps/23/logs/stdio
> >
> > Hm... I guess moving vhost-device-gpio to dynamic-layers/ is the least
> > invasive option?
> >
> > @Bruce: Which option do you prefer? I can draft a patch.
>
> Definitely not a dynamic layer :)
>
> Can you expand on the dependency a bit more for me ? I find it odd that l=
ibgpiod
> is in meta-oe, but there's no mention (that I can see) about any clang
> dependencies.
>
> I know very little about the way rust is stitching the bits together.
>
> Should libgpod really be in the DEPENDS ? Is libgpiod-sys a clang thing ?=
 And
> libgpiod is somehow conditionally using it ?

Yeah, this is a bit confusing...

Here is a (hopefully) better attempt at explaining what is going on:

vhost-device-gpio depends on libgpiod (the Rust crate, not the C lib).
which in its turn depends on libgpiod-sys - a helper crate that provides
binding to the libgpiod (C) lib.

Now, libgpiod-sys does not really consist of any _real_ code. Instead,
it is a recipe to generate the bindings at build time. This happens
by reading the pkg-config info from libgpiod (the C lib), parsing the
headers and linking to it.

So: libgpiod (the C lib) - as it is in meta-oe - does not depend on
clang-native, only libgpiod-sys (the Rust lib) does.

The final result is two dependencies being required for building
libgpiod-sys: libclang (for bindgen) and libgpiod (the C lib) (for
pkg-config, the headers and linking).

In Rust - in contrast to how C libs are typically packaged - libgpiod
(the Rust lib) and libgpiod-sys (Rust lib again) are built and linked
into vhost-device-gpio all during the build of this recipe. So the
dependencies are required here.

The final result is:

=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
=E2=94=82          vhost-device-gpio           =E2=94=82
=E2=94=82                                      =E2=94=82
=E2=94=82 libgpiod (Rust), libgpiod-sys (Rust) =E2=94=82 =E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=96=BA  libgpiod (C)
=E2=94=82           (static linking)           =E2=94=82 (dynamic link)    =
  =E2=96=B2
=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98               =
      =E2=94=82
                   =E2=96=B2                           the usual libgpiod r=
ecipe
                   =E2=94=82
   this is the build result of this recipe


Overall, the generation of bindings at build time is fairly common in
the Rust ecosystem. parsec in meta-security, for example, also does the
same thing. There the situation seems to be solved by putting parsec
into it's own layer within the meta-security repo.

> Either way, we used to do this same dance with meta-security, and we did =
that
> via SKIP_RECIPE. So that's how I'd solve this. But obviously none of the =
core
> packagesgroups, etc,  in meta-virt can have the vhost* packages if that i=
s the
> case. Barring that, we add the dependency, if it becomes a widespread use=
 case,
> it'll end up in core anyway.

This would require users of the layer to undo the SKIP_RECIPE? Or am I
misunderstanding what you mean? Just trying to understand the proposal,
I got no opinions on the best solution to resolve this. I am happy with
what seems best for the greater world.

> But I still need to understand this a bit better before I will firmly
> land one way
> or the other.

Let me know if you got further questions :)

- Erik


