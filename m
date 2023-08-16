Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB73EC001DF
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 08:11:37 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.156395.1692173490286214912
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Aug 2023 01:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BS0SoGUT;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4fe655796faso10061953e87.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Aug 2023 01:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692173488; x=1692778288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R7XpIN96e8B/1hC1vPTB90JxOQNpMn5SZ/1xFTkYFi0=;
        b=BS0SoGUTiSy8yOjrbMwUzuSWH77D0hbp0gWL3Du4eL6XI99bb2gsTZn7mNEtnQlxMZ
         vNDfWC/gS0AeTP8T1BRKP58kKDDOkTqDfGM4dXSbk3h9AHDCeHrRAaNaO838aIJpNrVl
         U7ZDXxXfxv9fwV70ecK78hGKmF8Vh/EmDa+rVFwmysQK8FEw4m9aaOO3UUc5As4USQiP
         roDTvRzfYG0PAIkvADeuPTESJyu9s65XM+fkTMI9spwvF8hZ5Jlxy5F7cAyMP6zlvLOh
         +LWhsNLeE7IndApBWoD84L6jrWkT8oddEIq3t1MjkMxtzipRIJpcbBfWLXcpIvyglEOY
         h8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692173488; x=1692778288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7XpIN96e8B/1hC1vPTB90JxOQNpMn5SZ/1xFTkYFi0=;
        b=QcSLURUGJjbgsq6fxHn1Ut22godWNnxgS5zZY5hDGodKMuFPr/yYB9tAvAf/2HNPy1
         qlYrw+IkCkmAcTdMMGI8jRHO3Ovk0f9Dj1lLP/AcI2vxaHCjm9apNd0Fg0tbeHvlaIjJ
         hDV+x0k+OjLeZQaOWqTiBV/40C7QWXseUfQBIGKKnI3U/wvPTPduQXAWNGywa5Kfi3ND
         xE/tz6nU1Aec34P64X24AXGA6Ez9XzsmZWtRboiag63QQe+CUt9hCJgNYsp0R3uvdxVX
         imLWbPKhlSr89aq05Aye8NNw3HxEI/d+Lfo9h4o+5SA2QvPEsXB78X6fxJitOQXkX2YZ
         3Cxg==
X-Gm-Message-State: AOJu0YyHyWjqecCtPqkfYp+xrQscvX+2kwYgTTuKAxxQ7r+zxwETW/Kk
	3fcyXp9BjCjxzeODzINi+4uGhQ==
X-Google-Smtp-Source: AGHT+IFYcNRL97jt00G1fp965ACH/tOEmp6KA1aHmRrYO8XDKgEgJE6dMMkdwYiGpA/ZQ8YvCZ5hKg==
X-Received: by 2002:ac2:4204:0:b0:4fe:3e89:fcac with SMTP id y4-20020ac24204000000b004fe3e89fcacmr904972lfh.34.1692173488417;
        Wed, 16 Aug 2023 01:11:28 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id t7-20020a19ad07000000b004fe3a8a9a0bsm2852939lfc.202.2023.08.16.01.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 01:11:27 -0700 (PDT)
Date: Wed, 16 Aug 2023 11:11:26 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Erik Schilling <erik.schilling@linaro.org>
Cc: meta-virtualization <meta-virtualization@lists.yoctoproject.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] vhost-device: add recipes for
 vhost-device daemons
Message-ID: <ZNyErpfW8p2lX81Z@nuoska>
References: <20230814-vhost-device-v2-1-4ec4b7a005a9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814-vhost-device-v2-1-4ec4b7a005a9@linaro.org>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Aug 2023 08:11:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8197

Hi,

On Mon, Aug 14, 2023 at 10:04:06AM +0200, Erik Schilling wrote:
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
> - Link to v1: https://lore.kernel.org/r/20230728-vhost-device-v1-1-d9f81124b66a@linaro.org
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
>  .../vhost-device/vhost-device-vsock-crates.inc     | 258 +++++++++++++++++++++
>  .../vhost-device/vhost-device-vsock_0.1.0.bb       |  16 ++
>  11 files changed, 991 insertions(+)
<snip>
> +++ b/recipes-extended/vhost-device/vhost-device-gpio_0.1.0.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "vhost gpio backend device"
> +DESCRIPTION = "A vhost-user backend that emulates a VirtIO GPIO device"
> +HOMEPAGE = "https://github.com/rust-vmm/vhost-device"
> +LICENSE = "Apache-2.0 | BSD-3-Clause"
> +LIC_FILES_CHKSUM = "\
> +    file://LICENSE-APACHE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
> +    file://LICENSE-BSD-3-Clause;md5=2489db1359f496fff34bd393df63947e \
> +"
> +DEPENDS += "libgpiod"
> +# libgpiod-sys generates bindings using bindgen, which depends on clang
> +DEPENDS += "clang-native"

As Richard mentioned on #yocto, this recipe adds a new layer dependency from
meta-virtualization to meta-clang. This could be documented and test build jobs
changed to include meta-clang, or these recipes could be moved to build conditionally
only when meta-clang is available by moving the recipes to directory
dynamic-layers/meta-clang/recipes-extended

https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1528/steps/23/logs/stdio

Or how hard is the dependency to clang-native?

Cheers,

-Mikko

