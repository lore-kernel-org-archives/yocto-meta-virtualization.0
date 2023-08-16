Return-Path: <erik.schilling@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE1BC19F4F
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 19:05:40 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.169213.1692212733323411011
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Aug 2023 12:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eGGTGCDw;
 spf=pass (domain: linaro.org, ip: 209.85.218.45, mailfrom: erik.schilling@linaro.org)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so930026566b.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Aug 2023 12:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692212732; x=1692817532;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ui53Hl8mihjXl2soV1TefKKkgHKNvBkp1ng/Puuu5t0=;
        b=eGGTGCDw05c70t9lw7SFZb3U+YikfS4xwpGtoUvHKFMxrguSaP5yANkI1JrZ9C9FRP
         dSmXloeXiwFsYYwn/ZS9t8opw9S9sa73Qe12CLqO+RH0bFL1bUXFMEC6i+snyDlmBBuq
         V9fT/acnMQgw9Un88Rm4yDjVHVRzDJuSLM8utohVlDzYQjYLrJuDgqgvruYvIbtWyV/N
         5Qu1gnGJ97lx7lEzVPYncjkz316OjI6JnEooWvlu6FiFy3j6yQmeYvIjjIulAnX8ErgM
         jkR7SSxm1om3r2tIFrxgWGZL+IY4gFNphS7wE4W0swBlMDr1ZsCUGY65ocW144oCmyeK
         Ycfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692212732; x=1692817532;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ui53Hl8mihjXl2soV1TefKKkgHKNvBkp1ng/Puuu5t0=;
        b=KIfOstu/m58I0dGdcZh1CO0FEzI7VFCSzoWd2OO/u6gaL1rKPV6MirOkbiTHL7GyFy
         AhAQPBZ1q6S+NaSED3vuoGfckxADkZVvAVQx3sUSkNu/qiwBe/xqcjVmZBHv6M31HLLy
         0wQQLozUaidRt57e03Vh36uhbVQl66ihrBHUiMC+O1XqU2K/SQehTPl8YKZCGoDMsQOo
         uZhMvr40S8ToovfJmdhsDxDUCUBsbOWYtkLj/Vxbsw1KZId/gEiqzWnCM3xRRrMdGKie
         LUGBNrYHETdvMt9NZd90c1FEziT8kpXZlXfzuUVNv2NTiWg9bHEZTyqoDWqLi0APSmme
         VLYQ==
X-Gm-Message-State: AOJu0Yw5BosVmm60sfGRCKG4oXeH8kQkxQuIFUeFAR6PZtOluBx+Uieo
	7CAgTcesVAw11kv1dr1CAHYFnA==
X-Google-Smtp-Source: AGHT+IF4pCvD+i+zR4AGkdZRJXzgxh3zKHcpNTCk6YqVL2RyvzWv46oorppFkMKl/qAzy4Gyl6Hn+g==
X-Received: by 2002:a17:906:dac2:b0:99d:e8a5:45d6 with SMTP id xi2-20020a170906dac200b0099de8a545d6mr2477204ejb.34.1692212731650;
        Wed, 16 Aug 2023 12:05:31 -0700 (PDT)
Received: from localhost (i5387890C.versanet.de. [83.135.137.12])
        by smtp.gmail.com with ESMTPSA id g11-20020a170906868b00b0099bca8b9a31sm8844206ejx.100.2023.08.16.12.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 12:05:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Aug 2023 21:05:30 +0200
Message-Id: <CUU7CKHJMASB.1MMPKO7V033VS@fedora>
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
 <CUU15SVB275M.CYT5K4RSGF1P@fedora>
 <CADkTA4O4+=t4cF4_Yq6igCCbweG_oq-SWrTLyckwYmUH3B1_vw@mail.gmail.com>
In-Reply-To: <CADkTA4O4+=t4cF4_Yq6igCCbweG_oq-SWrTLyckwYmUH3B1_vw@mail.gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Aug 2023 19:05:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8204

On Wed Aug 16, 2023 at 4:19 PM CEST, Bruce Ashfield wrote:
> On Wed, Aug 16, 2023 at 10:14=E2=80=AFAM Erik Schilling
> <erik.schilling@linaro.org> wrote:
> >
> > On Wed Aug 16, 2023 at 3:34 PM CEST, Bruce Ashfield wrote:
> > > On Wed, Aug 16, 2023 at 4:32=E2=80=AFAM Erik Schilling
> > > <erik.schilling@linaro.org> wrote:
> > > >
> > > > On Wed Aug 16, 2023 at 10:11 AM CEST, Mikko Rapeli wrote:
> > > > > Hi,
> > > > >
> > > > > On Mon, Aug 14, 2023 at 10:04:06AM +0200, Erik Schilling wrote:
> > > > > > This adds recipes for the first tagged release of the vhost-dev=
ice
> > > > > > daemons of the rust-vmm project.
> > > > > >
> > > > > > While the initial release was done for all daemons at the same =
time,
> > > > > > the daemons all have indepentend version numbers and will be re=
leased
> > > > > > on their own schedules in the future. Therefore, I splitted the=
m into
> > > > > > independent recipes.
> > > > > >
> > > > > > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > > > > > ---
> > > > > > These are a bunch of daemons that implement various vhost-user =
virtio
> > > > > > devices. Currently, they are mostly tested with QEMU, but we ar=
e also
> > > > > > working on Xen support (most bits are upstream already).
> > > > > > ---
> > > > > > Changes in v2:
> > > > > > - Added README.md to explain generation of dependency .inc file=
s
> > > > > > - Link to v1: https://lore.kernel.org/r/20230728-vhost-device-v=
1-1-d9f81124b66a@linaro.org
> > > > > > ---
> > > > > >  README.md                                          |  14 ++
> > > > > >  .../vhost-device/vhost-device-gpio-crates.inc      | 184 +++++=
++++++++++
> > > > > >  .../vhost-device/vhost-device-gpio_0.1.0.bb        |  20 ++
> > > > > >  .../vhost-device/vhost-device-i2c-crates.inc       | 126 +++++=
+++++
> > > > > >  .../vhost-device/vhost-device-i2c_0.1.0.bb         |  16 ++
> > > > > >  .../vhost-device/vhost-device-rng-crates.inc       | 158 +++++=
++++++++
> > > > > >  .../vhost-device/vhost-device-rng_0.1.0.bb         |  17 ++
> > > > > >  .../vhost-device/vhost-device-scsi-crates.inc      | 166 +++++=
++++++++
> > > > > >  .../vhost-device/vhost-device-scsi_0.1.0.bb        |  16 ++
> > > > > >  .../vhost-device/vhost-device-vsock-crates.inc     | 258 +++++=
++++++++++++++++
> > > > > >  .../vhost-device/vhost-device-vsock_0.1.0.bb       |  16 ++
> > > > > >  11 files changed, 991 insertions(+)
> > > > > <snip>
> > > > > > +++ b/recipes-extended/vhost-device/vhost-device-gpio_0.1.0.bb
> > > > > > @@ -0,0 +1,20 @@
> > > > > > +SUMMARY =3D "vhost gpio backend device"
> > > > > > +DESCRIPTION =3D "A vhost-user backend that emulates a VirtIO G=
PIO device"
> > > > > > +HOMEPAGE =3D "https://github.com/rust-vmm/vhost-device"
> > > > > > +LICENSE =3D "Apache-2.0 | BSD-3-Clause"
> > > > > > +LIC_FILES_CHKSUM =3D "\
> > > > > > +    file://LICENSE-APACHE;md5=3D3b83ef96387f14655fc854ddc3c6bd=
57 \
> > > > > > +    file://LICENSE-BSD-3-Clause;md5=3D2489db1359f496fff34bd393=
df63947e \
> > > > > > +"
> > > > > > +DEPENDS +=3D "libgpiod"
> > > > > > +# libgpiod-sys generates bindings using bindgen, which depends=
 on clang
> > > > > > +DEPENDS +=3D "clang-native"
> > > > >
> > > > > As Richard mentioned on #yocto, this recipe adds a new layer depe=
ndency from
> > > > > meta-virtualization to meta-clang. This could be documented and t=
est build jobs
> > > > > changed to include meta-clang, or these recipes could be moved to=
 build conditionally
> > > > > only when meta-clang is available by moving the recipes to direct=
ory
> > > > > dynamic-layers/meta-clang/recipes-extended
> > > > >
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/121/build=
s/1528/steps/23/logs/stdio
> > > >
> > > > Hm... I guess moving vhost-device-gpio to dynamic-layers/ is the le=
ast
> > > > invasive option?
> > > >
> > > > @Bruce: Which option do you prefer? I can draft a patch.
> > >
> > > Definitely not a dynamic layer :)
> > >
> > > Can you expand on the dependency a bit more for me ? I find it odd th=
at libgpiod
> > > is in meta-oe, but there's no mention (that I can see) about any clan=
g
> > > dependencies.
> > >
> > > I know very little about the way rust is stitching the bits together.
> > >
> > > Should libgpod really be in the DEPENDS ? Is libgpiod-sys a clang thi=
ng ? And
> > > libgpiod is somehow conditionally using it ?
> >
> > Yeah, this is a bit confusing...
> >
> > Here is a (hopefully) better attempt at explaining what is going on:
> >
> > vhost-device-gpio depends on libgpiod (the Rust crate, not the C lib).
> > which in its turn depends on libgpiod-sys - a helper crate that provide=
s
> > binding to the libgpiod (C) lib.
> >
> > Now, libgpiod-sys does not really consist of any _real_ code. Instead,
> > it is a recipe to generate the bindings at build time. This happens
> > by reading the pkg-config info from libgpiod (the C lib), parsing the
> > headers and linking to it.
> >
> > So: libgpiod (the C lib) - as it is in meta-oe - does not depend on
> > clang-native, only libgpiod-sys (the Rust lib) does.
> >
> > The final result is two dependencies being required for building
> > libgpiod-sys: libclang (for bindgen) and libgpiod (the C lib) (for
> > pkg-config, the headers and linking).
> >
> > In Rust - in contrast to how C libs are typically packaged - libgpiod
> > (the Rust lib) and libgpiod-sys (Rust lib again) are built and linked
> > into vhost-device-gpio all during the build of this recipe. So the
> > dependencies are required here.
> >
> > The final result is:
> >
> > =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> > =E2=94=82          vhost-device-gpio           =E2=94=82
> > =E2=94=82                                      =E2=94=82
> > =E2=94=82 libgpiod (Rust), libgpiod-sys (Rust) =E2=94=82 =E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=96=BA  libgpiod (C)
> > =E2=94=82           (static linking)           =E2=94=82 (dynamic link)=
      =E2=96=B2
> > =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98         =
            =E2=94=82
> >                    =E2=96=B2                           the usual libgpi=
od recipe
> >                    =E2=94=82
> >    this is the build result of this recipe
> >
>
> Aha. Yes, I see why my dependency investigation got tangled up
> in the "normal" libgpiod in meta-openembedded.
>
> >
> > Overall, the generation of bindings at build time is fairly common in
> > the Rust ecosystem. parsec in meta-security, for example, also does the
> > same thing. There the situation seems to be solved by putting parsec
> > into it's own layer within the meta-security repo.
>
> Layers with a single or few recipes are a pet peeve of mine :)
>
> >
> > > Either way, we used to do this same dance with meta-security, and we =
did that
> > > via SKIP_RECIPE. So that's how I'd solve this. But obviously none of =
the core
> > > packagesgroups, etc,  in meta-virt can have the vhost* packages if th=
at is the
> > > case. Barring that, we add the dependency, if it becomes a widespread=
 use case,
> > > it'll end up in core anyway.
> >
> > This would require users of the layer to undo the SKIP_RECIPE? Or am I
> > misunderstanding what you mean? Just trying to understand the proposal,
> > I got no opinions on the best solution to resolve this. I am happy with
> > what seems best for the greater world.
>
> It is similar to a layer, but it keeps everything centralized. It'll
> automatically
> be undone if meta-clang is available (with the appropriate changes of
> course).
>
> We used to have this for selinux and security:
>
> SKIP_RECIPE[cri-o] ?=3D "${@bb.utils.contains('BBFILE_COLLECTIONS',
> 'security', bb.utils.contains('BBFILE_COLLECTIONS', 'selinux', '',
> 'Depends on libselinux from meta-selinux which is not included', d),
> 'Depends on libseccomp from meta-security which is not included', d)}"
>
> SKIP_RECIPE[cri-o] ?=3D "${@bb.utils.contains('BBFILE_COLLECTIONS',
> 'selinux', '', 'Depends on libselinux from meta-selinux which is not
> included', d)}"

Ah. Did not know this works within a recipe! Patch posted:

https://lore.kernel.org/r/20230816-vhost-device-clang-fix-v1-1-bbbd47b13e5b=
@linaro.org

Thanks!

- Erik


