Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.7828.1609214075411073408
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Dec 2020 19:54:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J1lZmxpZ;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	by mail.yoctoproject.org (Postfix) with ESMTPS id A457A38C03D7
	for <meta-virtualization@yoctoproject.org>; Tue, 29 Dec 2020 03:54:34 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id et9so5875147qvb.10
        for <meta-virtualization@yoctoproject.org>; Mon, 28 Dec 2020 19:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Yc8uCoUgU8i8fD0NRv6MmEH634UNhz+YYmkEWsGvcwk=;
        b=J1lZmxpZXroAZkMg2UUrnAEvvHCNtetZ70dljzRuoDPcqppfUohs/xuuXKzlytAZaU
         bf6xCpWLlkFaX4inkBPmyUnFyAXjpUPck6uZGzC76GkgFMruxCd+JT3vV2hCVCG0IGVd
         TOJSFrFv5BfSE4C+607P3raC6PUZPFkDT7UAwTdSHocLOmOn5oCaE7pScijc/5kDyv7k
         EWxVMR/mSAMdcMSNjq3AVKxfFnGg49oO+LkM/hbQQFSM1DqT71UO7T16FgK4lvm4OwJG
         705N0nQCqqyOUCxVzieSqvuKAncnfN2oK4kSKuIkes9dP/gtmbSsZo4jloSCTUSkGPSN
         XpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Yc8uCoUgU8i8fD0NRv6MmEH634UNhz+YYmkEWsGvcwk=;
        b=lTt8iv0NBoH9AciW02Mb6jdgstEFoiWoI8ZFc1k4fbXagvmlm+QqsNJnMNS5PeoYvK
         7UJBQKnL9ydamuKy30OhAKF5Bvn+qPSn4A5SPUHlbjhK7wC76Vc6bMduPh7mKsab68K1
         Dm0CR2HGqwmgrETbxfqHLLJu9Ka9mHkFziCOsGzNWiU/a6eYyAYJbSkwdhRmso1TTTuA
         wiMAZNV9MjDtKH5ymzzgrv0JeJyJQSuhvq87NrqNfGL4IMYYyyNRSZiC1ffpYeQjWimM
         H1RDB2IDkR/u6pJJ3zKayo/ebyOr0KCjHuIjIeYm3fO/35U67FDuQ36mVvBzA0rWeUeu
         Ujvw==
X-Gm-Message-State: AOAM53099cp6EkoF3G0fBU+Kc0zHwiz8GI/nUBjjFrav7W0zAorBC9SE
	RlPkEoGec3+g2h1gGACQ9bo=
X-Google-Smtp-Source: ABdhPJwqefNY5ggA3mU1yUEkcTQcVP6gtXcUIIq3BtPklsXA9p0qIdrUlUP9KY9n3i9Idkwq8iiLLw==
X-Received: by 2002:a05:6214:1764:: with SMTP id et4mr49853289qvb.2.1609214073747;
        Mon, 28 Dec 2020 19:54:33 -0800 (PST)
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id c28sm24765709qtv.2.2020.12.28.19.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 19:54:33 -0800 (PST)
Date: Mon, 28 Dec 2020 22:54:31 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@yoctoproject.org, cardoe@gentoo.org
Subject: Re: [PATCH] xen, linux-yocto-dev, RPi4: weaker assign for KBRANCH and KMACHINE
Message-ID: <20201229035428.GA14464@gmail.com>
References: <20201224010310.13962-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201224010310.13962-1-christopher.w.clark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [PATCH] xen, linux-yocto-dev, RPi4: weaker assign for KBRANCH and KMACHINE
on 23/12/2020 Christopher Clark wrote:

> Switch to use ?= to set KBRANCH_raspberrypi4-64 to make it easier to
> override elsewhere when needed for switching to a different kernel branch.
> Also make the same change for KMACHINE_raspberrypi4-64 to match how it is
> assigned in the meta-yocto-bsp layer.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
>  .../raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
> index 85d6feb..2a0416f 100644
> --- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
> +++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
> @@ -5,6 +5,6 @@ DEFAULT_CMDLINE := "${CMDLINE}"
>  XEN_LINUX_CMDLINE ?= "console=hvc0 clk_ignore_unused earlycon=xenboot debug root=/dev/mmcblk0p2 rootwait"
>  CMDLINE = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '${XEN_LINUX_CMDLINE}', '${DEFAULT_CMDLINE}', d)}"
>  
> -KBRANCH_raspberrypi4-64 = "standard/bcm-2xxx-rpi"
> -KMACHINE_raspberrypi4-64 = "bcm-2xxx-rpi4"
> +KBRANCH_raspberrypi4-64 ?= "standard/bcm-2xxx-rpi"
> +KMACHINE_raspberrypi4-64 ?= "bcm-2xxx-rpi4"
>  COMPATIBLE_MACHINE_raspberrypi4-64 = "(raspberrypi4-64)"
> -- 
> 2.17.1
> 
