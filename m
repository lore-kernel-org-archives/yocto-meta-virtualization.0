Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3566C433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 04:02:29 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web09.358.1652328148142689135
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 May 2022 21:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MYIf4Q5Q;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id b20so3796069qkc.6
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 May 2022 21:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vegOdyVVB8QhNoEbOHYZ1VKX+lvFQdtzo4hIrgguN7I=;
        b=MYIf4Q5QJ3RR05sqc8fTHzr5CV9iMSxpX7lgMZ/2fZ+AsInLxAvSOVsB0VaT4xq18V
         m/B8SlxGTEcNzD4JeItIlN4XunwX8y3VzNcO4uN0fQmHteUofLvAmoGMgr1/kaoZO1wf
         C6FlhPaj0e+XxlzKJ6QJWX7O8MCWVoblFkwX8+xBYkgUG6zzBSSINW1ulkwH+2CufBEO
         TvIAUkQV+mQ+xsis4vZsUcC9mQcEnTeFGR2zu3OpT11BIfMjJQvgg0xINE6GSHcC6nAW
         c6HoyD2BH+n6uQb9l94OihUP/hZ7TqeghKXN6Da83DNhEIe6zdyNmBSS0NhhjxhRygQ4
         3rIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vegOdyVVB8QhNoEbOHYZ1VKX+lvFQdtzo4hIrgguN7I=;
        b=DsPoMSRYMEJED2oovmOGAGsHV7b4XvMfIRkQgNu7uE5A/WEFGYMx7dLQEEmUoZ3tdx
         ZMeUKGQOVQ5XGkbprFZnVWz2VsWiOC6Ev86uY5Gu8yWyrBAo+smTYx8OlpWMnUASMXhS
         s6n3zThPWpRcQXWLAvQdc+1+1D0Is0UU1ylXTRsYbj67Szp12SkXNykmwGo8lEwHNsMH
         BvHBBXr9+66+jkqdif4ufTAYHl+k3SS2fXMtT3ITs4QQBBf/iYCsUhS+3t/WeZYG0dky
         yppt1rEycyZPIsa6Lt9LW8ChEtDal+FPlKhUWEQOud2PwZb4OuXD/g1nU/qM6Qrxf5EH
         IPcA==
X-Gm-Message-State: AOAM531GTwKG7exCWJsdqoENjYOdMJ1cwnaDYB7PZG8tLsxm8MGNTEW8
	GxukrMVPaJZK9Nx/nFsBXHw=
X-Google-Smtp-Source: 
 ABdhPJxkxGapjaYK2XYdj9kHSQTjYWzSJQoK9Ql0NGJ3G/pfouXc+NEVExPUfI5y7d5cOW+mI0q2uQ==
X-Received: by 2002:a37:b741:0:b0:69e:689f:7639 with SMTP id
 h62-20020a37b741000000b0069e689f7639mr20415703qkf.160.1652328147148;
        Wed, 11 May 2022 21:02:27 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 191-20020a3703c8000000b0069fc13ce240sm2337693qkd.113.2022.05.11.21.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 21:02:26 -0700 (PDT)
Date: Thu, 12 May 2022 00:02:25 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] ipxe: Pin to use gcc
Message-ID: <20220512040224.GB18930@gmail.com>
References: <20220509172417.2803867-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509172417.2803867-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 May 2022 04:02:29 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7277

merged.

Bruce

In message: [meta-virtualization][PATCH] ipxe: Pin to use gcc
on 09/05/2022 Khem Raj wrote:

> Use single quote instead of double quotes to help bitabake syntax
> highlighter do right job
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  recipes-extended/ipxe/ipxe_git.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/ipxe_git.bb
> index ff46184..7565c21 100644
> --- a/recipes-extended/ipxe/ipxe_git.bb
> +++ b/recipes-extended/ipxe/ipxe_git.bb
> @@ -23,13 +23,13 @@ SRC_URI = " \
>  
>  FILES:${PN} = "/usr/share/firmware/*.rom"
>  
> -EXTRA_OEMAKE = " \
> +EXTRA_OEMAKE = ' \
>      ISOLINUX_BIN="${STAGING_DIR_TARGET}/usr/share/syslinux/isolinux.bin" \
>      CROSS_COMPILE="${TARGET_PREFIX}" \
>      EXTRA_HOST_CFLAGS="${BUILD_CFLAGS}" \
>      EXTRA_HOST_LDFLAGS="${BUILD_LDFLAGS}" \
>      NO_WERROR="1" \
> -"
> +'
>  
>  S = "${WORKDIR}/git/src"
>  
> @@ -44,3 +44,5 @@ do_install() {
>      install -d ${D}/usr/share/firmware
>      install ${S}/bin/*.rom ${D}/usr/share/firmware/
>  }
> +
> +TOOLCHAIN = "gcc"
> -- 
> 2.36.1
> 

