Return-Path: <erik.schilling@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02560EB64DD
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 08:13:48 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.182462.1692260024048217661
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 01:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=X4iYyqcv;
 spf=pass (domain: linaro.org, ip: 209.85.218.44, mailfrom: erik.schilling@linaro.org)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-99c3c8adb27so1004286866b.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Aug 2023 01:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692260022; x=1692864822;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juMYiIPV06zuQGsg/J4yHfA3Bb37Re5Scthg7zbR+8U=;
        b=X4iYyqcvNVzkMtYeFYMY7nF47qOovCVrqlRMqpyXZ0wM30NLzYjj2Zbp3BEG/urGoF
         IJT3cfEmPWkxBDpuvFhnBkwkb+vB3LaamcD2rg6rXfXQwLbnYK6FFfkImzRU65ae8Rpj
         8xT4/GKT8uWR8qsGPIyqOdZMDBdNT1k6brcFYLBqKOf/LFyXpcKho38eeQLkZcX35p3o
         tgHlkaPHT2T38ySB6JFQlc4GLXJWMWGNbKCqJ+nmpyTf4Fq6mufwqn2jszm76abiC+eh
         amE+ugLx0kKUimOJHHfdSAbfL/uYr2u+YQQSq56CGu16ISxw2g/gm8p1CNbLXGECasGq
         okcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692260022; x=1692864822;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=juMYiIPV06zuQGsg/J4yHfA3Bb37Re5Scthg7zbR+8U=;
        b=K6lAzbODFMG0c9PWOEKu+DgGgGB8h23MvcZDQGbQb90oWPD+1dN5Z2KANcc7b8ZOZF
         6G6ywXMZDp5r/WvqS11muR4E29OSo+WFcqIv6r+EyAzChnnYPJGLAXrvxvmQtMntOZ3x
         SKLdhtjUB2Xrr/p5XPukhTihrEj12yJAfLajWRIvhBKSUV9fztUrI6OR70k16KPlKMlG
         j3wmTvFEs32IZoBUPbt7RIkRaEaLf+eOqV7xIhTotUDyqNUHqKidHsEY3YGFovsmwfcb
         p0SKI0N5y/vIZ0ZNJSyFTgr9Js5YDeI0zeyn8oXYdNgEHriJoJW/clSVYQQ3yisNX5rL
         QHtQ==
X-Gm-Message-State: AOJu0YxlRP2Vshsz8ThZNOGYPjAuU13w8ANXmxUGjFGQ0iNltuCrhWMC
	NdA88KZuvIEkeiBIFHtVR4AOaA==
X-Google-Smtp-Source: AGHT+IEzf/bHtBcZ14wUL/iAgZhoX4wZjKIOo9tHjYTim+HzjxBBHHjp7TvVRXkdb4Lx9Jo6IJ12yQ==
X-Received: by 2002:a17:907:7706:b0:99b:c2b2:e4ac with SMTP id kw6-20020a170907770600b0099bc2b2e4acmr3124361ejc.33.1692260022352;
        Thu, 17 Aug 2023 01:13:42 -0700 (PDT)
Received: from localhost (i5387890C.versanet.de. [83.135.137.12])
        by smtp.gmail.com with ESMTPSA id q12-20020a17090622cc00b009929d998abcsm9727772eja.209.2023.08.17.01.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 01:13:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Aug 2023 10:13:41 +0200
Message-Id: <CUUO41I813NY.CPU5GWIZUCC4@fedora>
Cc: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: "Erik Schilling" <erik.schilling@linaro.org>, "meta-virtualization"
 <meta-virtualization@lists.yoctoproject.org>
From: "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [meta-virtualization][PATCH v2] vhost-device: add recipes for
 vhost-device daemons
X-Mailer: aerc 0.15.2
References: <20230814-vhost-device-v2-1-4ec4b7a005a9@linaro.org>
In-Reply-To: <20230814-vhost-device-v2-1-4ec4b7a005a9@linaro.org>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Aug 2023 08:13:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8206

On Mon Aug 14, 2023 at 10:04 AM CEST, Erik Schilling wrote:
> This adds recipes for the first tagged release of the vhost-device
> daemons of the rust-vmm project.
>
> While the initial release was done for all daemons at the same time,
> the daemons all have indepentend version numbers and will be released
> on their own schedules in the future. Therefore, I splitted them into
> independent recipes.
>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> These are a bunch of daemons that implement various vhost-user virtio
> devices. Currently, they are mostly tested with QEMU, but we are also
> working on Xen support (most bits are upstream already).
> ---
> Changes in v2:
> - Added README.md to explain generation of dependency .inc files
> - Link to v1: https://lore.kernel.org/r/20230728-vhost-device-v1-1-d9f811=
24b66a@linaro.org
> ---
>  README.md                                          |  14 ++
>  .../vhost-device/vhost-device-gpio-crates.inc      | 184 +++++++++++++++
>  .../vhost-device/vhost-device-gpio_0.1.0.bb        |  20 ++
>  .../vhost-device/vhost-device-i2c-crates.inc       | 126 ++++++++++
>  .../vhost-device/vhost-device-i2c_0.1.0.bb         |  16 ++
>  .../vhost-device/vhost-device-rng-crates.inc       | 158 +++++++++++++
>  .../vhost-device/vhost-device-rng_0.1.0.bb         |  17 ++
>  .../vhost-device/vhost-device-scsi-crates.inc      | 166 +++++++++++++
>  .../vhost-device/vhost-device-scsi_0.1.0.bb        |  16 ++
>  .../vhost-device/vhost-device-vsock-crates.inc     | 258 +++++++++++++++=
++++++
>  .../vhost-device/vhost-device-vsock_0.1.0.bb       |  16 ++
>  11 files changed, 991 insertions(+)
>
> diff --git a/README.md b/README.md

Eh... Not sure how this happened... This should obviously have gone to
the vhost-device folder...

Will send a follow-up fix.

- Erik


