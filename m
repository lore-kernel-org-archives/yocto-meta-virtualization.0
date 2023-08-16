Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57465C04A6A
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 13:34:29 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.160596.1692192864010785940
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Aug 2023 06:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=UlBkT7Y2;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1c0fff40ec6so4457934fac.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Aug 2023 06:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692192863; x=1692797663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCHNElzxg5V8609kbjP/qx42YGmpj9H9rul/LtnSyn0=;
        b=UlBkT7Y2DQag8e/NTQLTJYHE1lwY4LA29Sq0X2V6Ct05/qcENqPKHGZTySSDFLKsdV
         G1q48uj0L9M8XGUzeD5F9wCAkYQnVzjdaV5LW/GPfmIiJffPb6egP57+sTdq9eN9Pm+5
         QJScTD0406omAe941n59lNhIlBQHwA3kBUO7gH3PVH16onP4c/LRRBoq8ACeqLmiAWuN
         TbXtqfT/rYi8GBHrqj+iCisBBAWSWVCnsyzfmYp2RSC7rz5Y/yTy61iwGKK/oKIa/yUU
         xnMWgkqyFmonwKBFfnXm7uwYyNKSrqJ4wLluw5C9CKv1Qk0gj3MyRbOzJzllTFzT54Vl
         IUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692192863; x=1692797663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCHNElzxg5V8609kbjP/qx42YGmpj9H9rul/LtnSyn0=;
        b=Tw5gdY4iqJ6zFYx1Q7OwKTTsSfy7B9WPgAP7Hx3W2XLwMTxTkurVA+3mO0Aqk+YXJ3
         JNf3bdRDGSl27pDxmHK0yFL6zBgo26dZQIbfri2EhsneUN5yoVhd5zQ+19Gu/kke+Qks
         h21hHCqAruxBAD4HTfy4xGbMSKkYmkGdsMtEfHfpVXtEu0UkEbEEbO9/NIB71pGNUwcT
         M6on3/MfzkjcxkJaGGvp6aF0uVFTCyuz00nhIsVk/rMbkLA716o+GDOqipOrg+MT0n+e
         3x4y0r3pIVlOJHwxP1SYHSz+o8vAmD3NmgSvuF1+mv091yoNNoUpNviMKGG3ZPB8uaGz
         mAJg==
X-Gm-Message-State: AOJu0Ywa20ExqxYgf3MOFBIdUcI2i8UhPG4cqabgafB5I8DVaGnkrAGd
	//cFmKS6bYJBZdwUOW+W+eSpjd5Eb+6tjSRCT64=
X-Google-Smtp-Source: AGHT+IEHtrGuenNDL48RHzzIKDZcc1rnoip7FS3uT0Qn39klPA7ARb4LWUdinpbTI5Mpbmd5gCSM+KQExjnpPkWllck=
X-Received: by 2002:a05:6871:886:b0:1be:ccce:7991 with SMTP id
 r6-20020a056871088600b001beccce7991mr2366517oaq.13.1692192863200; Wed, 16 Aug
 2023 06:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230814-vhost-device-v2-1-4ec4b7a005a9@linaro.org>
 <ZNyErpfW8p2lX81Z@nuoska> <CUTTTZWVTFSB.37XU7VSAOVZKZ@fedora>
In-Reply-To: <CUTTTZWVTFSB.37XU7VSAOVZKZ@fedora>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 16 Aug 2023 09:34:12 -0400
Message-ID: <CADkTA4Oxrz9EZtc7KtwRAuNQGcooekZbzASk11u4Ckw5HgbLgg@mail.gmail.com>
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
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Aug 2023 13:34:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8199

On Wed, Aug 16, 2023 at 4:32=E2=80=AFAM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> On Wed Aug 16, 2023 at 10:11 AM CEST, Mikko Rapeli wrote:
> > Hi,
> >
> > On Mon, Aug 14, 2023 at 10:04:06AM +0200, Erik Schilling wrote:
> > > This adds recipes for the first tagged release of the vhost-device
> > > daemons of the rust-vmm project.
> > >
> > > While the initial release was done for all daemons at the same time,
> > > the daemons all have indepentend version numbers and will be released
> > > on their own schedules in the future. Therefore, I splitted them into
> > > independent recipes.
> > >
> > > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > > ---
> > > These are a bunch of daemons that implement various vhost-user virtio
> > > devices. Currently, they are mostly tested with QEMU, but we are also
> > > working on Xen support (most bits are upstream already).
> > > ---
> > > Changes in v2:
> > > - Added README.md to explain generation of dependency .inc files
> > > - Link to v1: https://lore.kernel.org/r/20230728-vhost-device-v1-1-d9=
f81124b66a@linaro.org
> > > ---
> > >  README.md                                          |  14 ++
> > >  .../vhost-device/vhost-device-gpio-crates.inc      | 184 +++++++++++=
++++
> > >  .../vhost-device/vhost-device-gpio_0.1.0.bb        |  20 ++
> > >  .../vhost-device/vhost-device-i2c-crates.inc       | 126 ++++++++++
> > >  .../vhost-device/vhost-device-i2c_0.1.0.bb         |  16 ++
> > >  .../vhost-device/vhost-device-rng-crates.inc       | 158 +++++++++++=
++
> > >  .../vhost-device/vhost-device-rng_0.1.0.bb         |  17 ++
> > >  .../vhost-device/vhost-device-scsi-crates.inc      | 166 +++++++++++=
++
> > >  .../vhost-device/vhost-device-scsi_0.1.0.bb        |  16 ++
> > >  .../vhost-device/vhost-device-vsock-crates.inc     | 258 +++++++++++=
++++++++++
> > >  .../vhost-device/vhost-device-vsock_0.1.0.bb       |  16 ++
> > >  11 files changed, 991 insertions(+)
> > <snip>
> > > +++ b/recipes-extended/vhost-device/vhost-device-gpio_0.1.0.bb
> > > @@ -0,0 +1,20 @@
> > > +SUMMARY =3D "vhost gpio backend device"
> > > +DESCRIPTION =3D "A vhost-user backend that emulates a VirtIO GPIO de=
vice"
> > > +HOMEPAGE =3D "https://github.com/rust-vmm/vhost-device"
> > > +LICENSE =3D "Apache-2.0 | BSD-3-Clause"
> > > +LIC_FILES_CHKSUM =3D "\
> > > +    file://LICENSE-APACHE;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
> > > +    file://LICENSE-BSD-3-Clause;md5=3D2489db1359f496fff34bd393df6394=
7e \
> > > +"
> > > +DEPENDS +=3D "libgpiod"
> > > +# libgpiod-sys generates bindings using bindgen, which depends on cl=
ang
> > > +DEPENDS +=3D "clang-native"
> >
> > As Richard mentioned on #yocto, this recipe adds a new layer dependency=
 from
> > meta-virtualization to meta-clang. This could be documented and test bu=
ild jobs
> > changed to include meta-clang, or these recipes could be moved to build=
 conditionally
> > only when meta-clang is available by moving the recipes to directory
> > dynamic-layers/meta-clang/recipes-extended
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1528=
/steps/23/logs/stdio
>
> Hm... I guess moving vhost-device-gpio to dynamic-layers/ is the least
> invasive option?
>
> @Bruce: Which option do you prefer? I can draft a patch.

Definitely not a dynamic layer :)

Can you expand on the dependency a bit more for me ? I find it odd that lib=
gpiod
is in meta-oe, but there's no mention (that I can see) about any clang
dependencies.

I know very little about the way rust is stitching the bits together.

Should libgpod really be in the DEPENDS ? Is libgpiod-sys a clang thing ? A=
nd
libgpiod is somehow conditionally using it ?

Either way, we used to do this same dance with meta-security, and we did th=
at
via SKIP_RECIPE. So that's how I'd solve this. But obviously none of the co=
re
packagesgroups, etc,  in meta-virt can have the vhost* packages if that is =
the
case. Barring that, we add the dependency, if it becomes a widespread use c=
ase,
it'll end up in core anyway.

But I still need to understand this a bit better before I will firmly
land one way
or the other.

Bruce


>
> > Or how hard is the dependency to clang-native?
>
> vhost-device-gpio depends on libgpiod which generates the bindings at
> build time with bindgen [1]. So it is a hard dependency for that daemon.
> The other daemons are fine without it.
>
> [1] https://github.com/rust-lang/rust-bindgen
>
> - Erik
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

