Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F93EC25B08
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 13:32:56 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web12.10657.1660311174632239564
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Aug 2022 06:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Nlj8eZsq;
 spf=pass (domain: gmail.com, ip: 209.85.160.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id y18so743357qtv.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Aug 2022 06:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=4tsCTEm23b6A/GuqluIYuAErrlM+X2rfyaYNox33vFc=;
        b=Nlj8eZsqgFzk66niKmLriDmx2QOMGspirKx4qKNajuIond/LH4Qrx0BOUI/Wgwd6fw
         Epw2GF5gPGPp635XyfSPNrZSLF8JtNsjL+aUC1NWYjSh2lly/vOXSxroZZQ9CRVuNKok
         8ib46kTOIDP3VsMpaq6U6Pd2qKyRnLwF7FBmedS3fXhQMEuIdSm7jaTZfl+LWz0fWZl/
         Q8J4JpFc99ikJDl6w2uQlDw2G46igPr1D02Ioboqq1O+0vvWSDQJ91nLfaG5KXORLLDS
         eAULPVxPYgwAjMmhWU2LvaEDX77ZjApG4Dmzru0J4wxhI/fImMW5s6l7sJVq69XwTTOE
         p8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=4tsCTEm23b6A/GuqluIYuAErrlM+X2rfyaYNox33vFc=;
        b=wH4aeZ6948EeYjPY/9w54jBPBcyTuGyX83vlgLqe6lpLEvVTS+MGn6cPE1D/6z1+dG
         RVZu7+n7GEVN32PZdkLZmX1f5Kpxf1RMtTLac2wa1/Jvuxu3l4y2MCTn26wD0Ehfp0M0
         5UfCgOkfAbA8yT+36cSgd8xD32dc2LUUQD8j4FwdgLVEzFFwZqP4kDaTT1oE2IR9PHR+
         pw802AdP3ahLW3xBHIssDTaE0Oj4EdzvXHHJny8RWXa0Cd3IGdO5cWHKNPslmu7QiMr+
         blpS+uOx+1Dr1CjQbWLBr4DpyHzho+iwxJxdlMGst2JWbEnzGYRVonCmgHvpe7s00QWE
         NlCA==
X-Gm-Message-State: ACgBeo3u5eapCBzYb2QI/cUDw+k1X34+HYQiH2drhnx0a7cBoV6zSkwt
	Fu9RB4HZh7JDa0fo9osWcvw=
X-Google-Smtp-Source: 
 AA6agR6VVUY1BQsNUfbSA7TZ3lSVogMxNFh8oQJ0Gff9wjXCRuIXC3yDcBQZ8MXA3T8rJuD9ErzgnA==
X-Received: by 2002:ac8:5c4d:0:b0:31e:f794:1b18 with SMTP id
 j13-20020ac85c4d000000b0031ef7941b18mr3491368qtj.282.1660311173512;
        Fri, 12 Aug 2022 06:32:53 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 do4-20020a05620a2b0400b006b640efe6dasm1661253qkb.132.2022.08.12.06.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 06:32:52 -0700 (PDT)
Date: Fri, 12 Aug 2022 09:32:51 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] dynamic-layers/raspberrypi: drop
 linux-yocto 5.10 bbappend
Message-ID: <20220812133251.GA530178@gmail.com>
References: <20220812082435.99083-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220812082435.99083-1-Martin.Jansa@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Aug 2022 13:32:56 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7521

merged.

Bruce

In message: [meta-virtualization] [PATCH] dynamic-layers/raspberrypi: drop linux-yocto 5.10 bbappend
on 12/08/2022 Martin Jansa wrote:

> * the inc file was dropped in:
>   58f5ac6 kernel: drop 5.10 .inc
>   but this .bbappend still causes parsing error, because 5.10 recipes
>   were removed from oe-core
> ---
>  .../recipes-kernel/linux/linux-yocto_5.10.bbappend          | 6 ------
>  1 file changed, 6 deletions(-)
>  delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend
> 
> diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend
> deleted file mode 100644
> index f279ef7..0000000
> --- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -# Enable use of the linux-yocto 5.10 kernel for the Raspberry Pi 4
> -KBRANCH:raspberrypi4-64 ?= "v5.10/standard/bcm-2xxx-rpi"
> -KMACHINE:raspberrypi4-64 ?= "bcm-2xxx-rpi4"
> -COMPATIBLE_MACHINE:raspberrypi4-64 = "(raspberrypi4-64)"
> -
> -require linux-yocto_xen-rpi.inc
> -- 
> 2.35.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7520): https://lists.yoctoproject.org/g/meta-virtualization/message/7520
> Mute This Topic: https://lists.yoctoproject.org/mt/92976015/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


