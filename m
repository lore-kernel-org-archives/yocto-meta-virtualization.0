Return-Path: <erik.schilling@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B66C001DF
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 08:32:17 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.156339.1692174733516294574
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Aug 2023 01:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bUG8bBvN;
 spf=pass (domain: linaro.org, ip: 209.85.218.54, mailfrom: erik.schilling@linaro.org)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-99bdcade7fbso809455366b.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Aug 2023 01:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692174732; x=1692779532;
        h=in-reply-to:references:message-id:from:to:cc:subject:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGjwfuUXxciPiSUj8N8gWcUM+4V8G0ZHvqXTME3fXVE=;
        b=bUG8bBvNjMcazgSE/hJLICRHB020zaBMlge3O+U5eLF7Ykonxx88zgzKPZygsRIAsE
         22oLqSlEXu9FLW9tmL4b47T48UBHe9xyI1LbrvYSZ9ADtjx8IoWAr7frJ16P9b0WAGIR
         mqdxlS3Sv0tkI7hflpizk3kWBH7PWZvtgKlzzc3hW4FyYJAApuG2EmD7rVilkU5qgH2H
         VyCCR52YBk5sKeudBouNl7XdUMU+5NLhQ+rJILuUwDfaqQvKV1TLmpydC+MjiGY053tS
         OlI4BSy0dTeWomMLVwlqAebwhj+XNfYk8G65B/jqEHhtfIgH5IN2gJkbaSYn+avnu73z
         tETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692174732; x=1692779532;
        h=in-reply-to:references:message-id:from:to:cc:subject:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gGjwfuUXxciPiSUj8N8gWcUM+4V8G0ZHvqXTME3fXVE=;
        b=NQ+YgU7JZuaBgPdNHqfhBatro0RqJVwYy4gVliJZ6ECvmBU+wN3UhVL/j5lzfR3kmy
         locqqKCoizUJ3yCGQf1R0jiXUdOMIRYDPsX929+sw9G+oqymhJFbNmphC1+NL/7bEdTX
         Y9wbsTCvPKkYRjZfNfInWRyoF5+l9MoGmfTdPuPpnxg5SQsW+/6LCQQOdVQ3oqCyvk9W
         qqb7bPwjKGuydmAS2aVidEr//0AsgAGFj8dRiv8xQM2GpxJ+PIxNBExEJzn5oivGTr2c
         HIbnqp+4nxVrikFyszlCcRoKtfqjnhyUjFlgCfVdD1cx9NlL2eTXtqw5zdS6yYjfPcmc
         B5TQ==
X-Gm-Message-State: AOJu0Yy62R54EktTd2LcLrE/S5Af4/7XVptXWdQ7hIyH0S3rAvbGRSg2
	2nKfYlJA25LihJwIelqBxugXVQ==
X-Google-Smtp-Source: AGHT+IF4FRMyIQUO3h6qBGgQpoI07UQ8tCzmG8TS7uyvRcmdnQs2fU6vITZm/wcNk8yrTFt1WwdwXw==
X-Received: by 2002:a17:906:113:b0:99d:de25:89bb with SMTP id 19-20020a170906011300b0099dde2589bbmr1011288eje.0.1692174731132;
        Wed, 16 Aug 2023 01:32:11 -0700 (PDT)
Received: from localhost (i5387890C.versanet.de. [83.135.137.12])
        by smtp.gmail.com with ESMTPSA id c17-20020a170906695100b0099297782aa9sm8143271ejs.49.2023.08.16.01.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 01:32:10 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Aug 2023 10:32:10 +0200
Subject: Re: [meta-virtualization][PATCH v2] vhost-device: add recipes for
 vhost-device daemons
Cc: "meta-virtualization" <meta-virtualization@lists.yoctoproject.org>
To: "Mikko Rapeli" <mikko.rapeli@linaro.org>, "Bruce Ashfield"
 <bruce.ashfield@gmail.com>
From: "Erik Schilling" <erik.schilling@linaro.org>
Message-Id: <CUTTTZWVTFSB.37XU7VSAOVZKZ@fedora>
X-Mailer: aerc 0.15.2
References: <20230814-vhost-device-v2-1-4ec4b7a005a9@linaro.org>
 <ZNyErpfW8p2lX81Z@nuoska>
In-Reply-To: <ZNyErpfW8p2lX81Z@nuoska>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Aug 2023 08:32:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8198

On Wed Aug 16, 2023 at 10:11 AM CEST, Mikko Rapeli wrote:
> Hi,
>
> On Mon, Aug 14, 2023 at 10:04:06AM +0200, Erik Schilling wrote:
> > This adds recipes for the first tagged release of the vhost-device
> > daemons of the rust-vmm project.
> >=20
> > While the initial release was done for all daemons at the same time,
> > the daemons all have indepentend version numbers and will be released
> > on their own schedules in the future. Therefore, I splitted them into
> > independent recipes.
> >=20
> > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > ---
> > These are a bunch of daemons that implement various vhost-user virtio
> > devices. Currently, they are mostly tested with QEMU, but we are also
> > working on Xen support (most bits are upstream already).
> > ---
> > Changes in v2:
> > - Added README.md to explain generation of dependency .inc files
> > - Link to v1: https://lore.kernel.org/r/20230728-vhost-device-v1-1-d9f8=
1124b66a@linaro.org
> > ---
> >  README.md                                          |  14 ++
> >  .../vhost-device/vhost-device-gpio-crates.inc      | 184 +++++++++++++=
++
> >  .../vhost-device/vhost-device-gpio_0.1.0.bb        |  20 ++
> >  .../vhost-device/vhost-device-i2c-crates.inc       | 126 ++++++++++
> >  .../vhost-device/vhost-device-i2c_0.1.0.bb         |  16 ++
> >  .../vhost-device/vhost-device-rng-crates.inc       | 158 +++++++++++++
> >  .../vhost-device/vhost-device-rng_0.1.0.bb         |  17 ++
> >  .../vhost-device/vhost-device-scsi-crates.inc      | 166 +++++++++++++
> >  .../vhost-device/vhost-device-scsi_0.1.0.bb        |  16 ++
> >  .../vhost-device/vhost-device-vsock-crates.inc     | 258 +++++++++++++=
++++++++
> >  .../vhost-device/vhost-device-vsock_0.1.0.bb       |  16 ++
> >  11 files changed, 991 insertions(+)
> <snip>
> > +++ b/recipes-extended/vhost-device/vhost-device-gpio_0.1.0.bb
> > @@ -0,0 +1,20 @@
> > +SUMMARY =3D "vhost gpio backend device"
> > +DESCRIPTION =3D "A vhost-user backend that emulates a VirtIO GPIO devi=
ce"
> > +HOMEPAGE =3D "https://github.com/rust-vmm/vhost-device"
> > +LICENSE =3D "Apache-2.0 | BSD-3-Clause"
> > +LIC_FILES_CHKSUM =3D "\
> > +    file://LICENSE-APACHE;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
> > +    file://LICENSE-BSD-3-Clause;md5=3D2489db1359f496fff34bd393df63947e=
 \
> > +"
> > +DEPENDS +=3D "libgpiod"
> > +# libgpiod-sys generates bindings using bindgen, which depends on clan=
g
> > +DEPENDS +=3D "clang-native"
>
> As Richard mentioned on #yocto, this recipe adds a new layer dependency f=
rom
> meta-virtualization to meta-clang. This could be documented and test buil=
d jobs
> changed to include meta-clang, or these recipes could be moved to build c=
onditionally
> only when meta-clang is available by moving the recipes to directory
> dynamic-layers/meta-clang/recipes-extended
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1528/s=
teps/23/logs/stdio

Hm... I guess moving vhost-device-gpio to dynamic-layers/ is the least
invasive option?

@Bruce: Which option do you prefer? I can draft a patch.

> Or how hard is the dependency to clang-native?

vhost-device-gpio depends on libgpiod which generates the bindings at
build time with bindgen [1]. So it is a hard dependency for that daemon.
The other daemons are fine without it.

[1] https://github.com/rust-lang/rust-bindgen

- Erik


