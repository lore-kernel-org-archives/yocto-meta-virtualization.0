Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C38C5ACA0
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 20:04:18 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.3715.1692302655959438826
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 13:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IgY/lXk+;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-76d7fcae611so12482485a.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Aug 2023 13:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692302655; x=1692907455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sUTBkwmhBdmruhY5kPFh2mHi63U/NhqCGI9ZyNvfQ+Q=;
        b=IgY/lXk+XcDAR85tHSRHTKEMRNqka7EhjdAFp1nLz4xhhZXg2LTxbsTVckSb+oS8Fy
         IVhZU12flNdmetvxkFkyGNnIZZMx3gVj6PTB36ULTzmu2mCK/8ZmqMqiQYzLvo5fGI4q
         yHTo9rSUPOk82AuwGliq2pwUVY7LbP8xpCDYvLh096GSIq6BDktC1pPZKMS8XD/NNX/s
         +rIDN3jCcPhhr21TqXp8Vk/QIV2kRnDW3O700blDD6FqBuAk1IMFKF2yYHASiCTxFuxe
         2aGSQAmAQbhlp3Hn3F9n7DfrrXDb85iGxwhGBTsUp8oFGHHJtJSNQo+3HhIzV56ZEFYo
         1Utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692302655; x=1692907455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUTBkwmhBdmruhY5kPFh2mHi63U/NhqCGI9ZyNvfQ+Q=;
        b=OaDHb0lYm1oCqBLkF9kiKXVnqIpckG8/u+fIr88vn239nzN0OXMud+voycMsaAagNW
         vjunkeCRsS7nIAYmXpNh0hlND+OKSmiVDxWwCz4D/7XDeaQ40gCmR4dMwpDxgbtFclDG
         EpmStWJD8A/n6g/QTBdHV9IDh0Aor5bo9jIlKg6RVsj1d5jVTvv05gf+rrw30fuMalSs
         QPBYskdPdrePRWx/KI+d6T+eD+QoBRw4AO/Y0J+JtMXZz5HM2YnnWyKf4NI4Yj4re2tW
         7d+/NTbT9nmf5gDCMDbIVjHgWpdpw8b714I/5N0Z+fAkWcMPhEZdBSdjISY3IN2pKRMp
         de3g==
X-Gm-Message-State: AOJu0YwY+IZwW4AeFGNUEIvHkTrxxpRCKpy0RaHaJJEzhmgyqoM2t38L
	CaWbKrKmJzIKRZvJcx0Enc0=
X-Google-Smtp-Source: AGHT+IGm/W+N0rksnuRCYIkII6yl7HU/gloMsfnaRVwVpjyigRoQ1nVLh3cP7Ry3JIQdDtv+aMZv+A==
X-Received: by 2002:a05:620a:c4d:b0:76c:b293:84f with SMTP id u13-20020a05620a0c4d00b0076cb293084fmr929946qki.21.1692302654893;
        Thu, 17 Aug 2023 13:04:14 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id g13-20020ae9e10d000000b0076827ce13f6sm45493qkm.10.2023.08.17.13.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 13:04:14 -0700 (PDT)
Date: Thu, 17 Aug 2023 20:04:12 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Erik Schilling <erik.schilling@linaro.org>
Cc: meta-virtualization <meta-virtualization@lists.yoctoproject.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [meta-virtualization][PATCH] vhost-device-gpio: only enable if
 meta-clang exists
Message-ID: <ZN59PKR1ZUFY9Ypm@gmail.com>
References: <20230816-vhost-device-clang-fix-v1-1-bbbd47b13e5b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816-vhost-device-clang-fix-v1-1-bbbd47b13e5b@linaro.org>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Aug 2023 20:04:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8211

It worked in my testing!

This has now merged.

Bruce

In message: [meta-virtualization][PATCH] vhost-device-gpio: only enable if meta-clang exists
on 16/08/2023 Erik Schilling wrote:

> This disables the recipe - which depends on clang-native - if meta-clang
> is not active.
> 
> Link: https://lore.kernel.org/yocto-meta-virtualization/ZNyErpfW8p2lX81Z@nuoska/
> Reported-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> As discussed in the linked thread.
> 
> Sorry for the inconveniences!
> ---
>  recipes-extended/vhost-device/vhost-device-gpio_0.1.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-extended/vhost-device/vhost-device-gpio_0.1.0.bb b/recipes-extended/vhost-device/vhost-device-gpio_0.1.0.bb
> index 4ef9de4..7993116 100644
> --- a/recipes-extended/vhost-device/vhost-device-gpio_0.1.0.bb
> +++ b/recipes-extended/vhost-device/vhost-device-gpio_0.1.0.bb
> @@ -10,6 +10,8 @@ DEPENDS += "libgpiod"
>  # libgpiod-sys generates bindings using bindgen, which depends on clang
>  DEPENDS += "clang-native"
>  
> +SKIP_RECIPE[vhost-device-gpio] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'clang-layer', '', 'Depends on clang-native from meta-clang which is not included', d)}"
> +
>  SRC_URI += "crate://crates.io/vhost-device-gpio/0.1.0"
>  SRC_URI[vhost-device-gpio-0.1.0.sha256sum] = "f4789dd127ce746d4f702d50256ff09e47b19fdb2bfee88a254b7e48efbf1100"
>  
> 
> ---
> base-commit: 28205358690f79e13c1970ea7d61bce0131da027
> change-id: 20230816-vhost-device-clang-fix-8348952fd3d8
> 
> Best regards,
> -- 
> Erik Schilling <erik.schilling@linaro.org>
> 

