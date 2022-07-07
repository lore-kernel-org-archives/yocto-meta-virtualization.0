Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A7DC433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 14:56:35 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.6574.1657205790826206807
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 Jul 2022 07:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aGxmaVoo;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id c20so784844qtw.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 Jul 2022 07:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6bvMdxuKSvzzp6q3Sjswq16kceIIT4UVu3LbPiqeUgo=;
        b=aGxmaVoou/mcjf1lCHc7QW2YoZ0r5r5oYysWnW2zDZvlbKT9vKJD2pL1DwFgEKxguG
         /krpFl+iiFCAnbCltSwn13FN0c6EPcOPTJjVAfVEdm/5qPwEFrgy6PAeFdxQPT4V7ve/
         ZjBevfecsYXJr0TXlbTVEW20JRgxwo9J/4WUtX37T9sj8gfbJl8STNFE6XqIo7OfWJAg
         hwgOYm/uMy4XziKn6/3qdl9ftPx2Tbq1bPbTPDProdwfaxLxJSBjK8dn0yXSv8lUVPC4
         Sl5rkp7JRWle7rRzsiILnBxBuEHlIQTTjje946MQ/lYGvoG7/q5M1q9A6syBeOeA0+OL
         MOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6bvMdxuKSvzzp6q3Sjswq16kceIIT4UVu3LbPiqeUgo=;
        b=ShRIQa7/X4sFeQRD2dZtAhp3B4DqoQuloEoC4ZMPX1dTWWTmCIcEfyGGOr2xl86Bxh
         Ei9OE8aux8R/odnFXfk7rJx6afmCv/oUgM/VzTGrd2yz4GUcytNimy5/Q1mx6UHosc1o
         czh3hQ1nQQ5nskqJ9EFa0eg/amto9Z0t/IoTxNrFGgQtg6ILNsDI6h0LVouIHrazhxd/
         CckcMot9q5aBQ+gSib/a2C9urn9ZKfLt3wwsNy6wpyLEhQcSY8K0uwGH6CSSXTXiroAN
         ulNN0Jzg+fvz0LNK5BI4wWujMldt++HZebFGBAgiHR2e44scmo4RWO5UJz9f88u919CO
         bw+Q==
X-Gm-Message-State: AJIora+Aszh6V3mWBCjp8SbBLLikEQg7ZsI1YjAhh3F+UYBYQi9bqE5h
	5FNjoMUm02Tg/epzGs373dE=
X-Google-Smtp-Source: 
 AGRyM1tW8j0gtLKt9wd1sYbb0zY/A4zzufLsled3VE7MDY/gymyi1f27gdCsHDpgWDo3tOF5yFK44Q==
X-Received: by 2002:a05:6214:1d2b:b0:473:2501:4575 with SMTP id
 f11-20020a0562141d2b00b0047325014575mr5881158qvd.42.1657205789764;
        Thu, 07 Jul 2022 07:56:29 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 n4-20020a05620a294400b006b24d912ab7sm18213685qkp.46.2022.07.07.07.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 07:56:29 -0700 (PDT)
Date: Thu, 7 Jul 2022 10:56:27 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd@arm.com,
	christopher.w.clark@gmail.com
Subject: Re: [meta-virtualization] [PATCH] xen/sysvinit: add hvc0 console
 only if not there already
Message-ID: <20220707145624.GA40251@gmail.com>
References: 
 <09a42f2562420f11d3187606418a73af07690f98.1656417819.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <09a42f2562420f11d3187606418a73af07690f98.1656417819.git.bertrand.marquis@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 07 Jul 2022 14:56:35 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7416

merged to master and kirkstone.

Bruce

In message: [meta-virtualization] [PATCH] xen/sysvinit: add hvc0 console only if not there already
on 28/06/2022 Bertrand Marquis wrote:

> The base inittab recipe is creating inittab entries for consoles listed
> in SERIAL_CONSOLES.
> For qemu, this contains "115200,hvc0" so an entry is created in inittab
> for it.
> Prevent to create a second entry if hvc0 is present in SERIAL_CONSOLES.
> 
> On qemuarm, this solves issues with the console when starting on top of
> Xen as dom0.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  recipes-core/sysvinit/sysvinit-inittab_xen.inc | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-core/sysvinit/sysvinit-inittab_xen.inc b/recipes-core/sysvinit/sysvinit-inittab_xen.inc
> index 7f92bd1..724f47d 100644
> --- a/recipes-core/sysvinit/sysvinit-inittab_xen.inc
> +++ b/recipes-core/sysvinit/sysvinit-inittab_xen.inc
> @@ -1,4 +1,10 @@
> +
> +
>  do_install:append() {
> -                echo "" >> ${D}${sysconfdir}/inittab
> -                echo "X0:12345:respawn:${base_sbindir}/getty-wrapper 115200 hvc0" >> ${D}${sysconfdir}/inittab
> +    # if SERIAL_CONSOLES contains hvc0, it is already added in inittab so do
> +    # not add it twice
> +    if echo "${SERIAL_CONSOLES}" | grep -vq "hvc0"; then
> +        echo "" >> ${D}${sysconfdir}/inittab
> +        echo "X0:12345:respawn:${base_sbindir}/getty-wrapper 115200 hvc0" >> ${D}${sysconfdir}/inittab
> +    fi
>  }
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7400): https://lists.yoctoproject.org/g/meta-virtualization/message/7400
> Mute This Topic: https://lists.yoctoproject.org/mt/92046232/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


