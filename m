Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEBDEC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 17:21:56 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.12112.1643995316179528274
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 09:21:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lq6nTZ/i;
 spf=pass (domain: gmail.com, ip: 209.85.219.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id d12so1068727qvl.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 09:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mHG2Qe7gkR1dWEXk2/3cDok0i5OIlL34ltt7tOdyS7o=;
        b=Lq6nTZ/iEkG8gLHzyXYsIDmR+v5QtDL0fgLiHvrNX8nIuAh4dy9Rs8Umywz19RB6Q4
         cf/XKFAKFxfFJQf9iKlOHiWS4A7NOgTUi44D+9Q/3tnVR+uDfpSQUn9DmCElsw2wK7cu
         TZ++fucbfYRUQObeU+M/8s+ptnYNvqHRw/ITl6vYLSLHrgNse/3o71oGQ1KIzoFFbYTi
         NHtPX+nLDBtvJ1BBm5pQhNEMUQCuyfIRy4CLH7P7OgEcDgKD3M8g/YnNytiuzXWmd/Rs
         ySyajB9ivftnbM+bvyv1UgXABV7/EAGEmwkPeGCm62CZlcM84OUIf66Qv1za97FrZvZc
         pFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mHG2Qe7gkR1dWEXk2/3cDok0i5OIlL34ltt7tOdyS7o=;
        b=wgk9b8X+AJHaA2Yq8qGiK347OVocYjqO51LZuhxr+HmgsYKcMbhJSCycO1yGeylzsm
         zJyW2hY2Oq6veg//sHcxVIxaHkY4Oq/I4+zCBqxbTHsJ6uCzeIfjnqGQqaQffYoYNE1A
         JqURxtXaReSMM3nGC6D7BeQUkaiBfxoGArEFqL1Y1SMx5c7Do7hrPzHHtSXmpHekF4HE
         RMILQo9tKAebgbF2erbezZZBATshX1csO7ht+CFwaNxK8eRjtTaajUc2mo5vAgd9FoyJ
         7BVQ251a3OdF00b1hIfylNZ0R/2/OeAVWvcgTe75BThurRM9jQFWWcY3OyHYlDa3KlJ/
         PUeQ==
X-Gm-Message-State: AOAM531eO0NDooUoknCHqhKaD7OlIZP6MCaYZ4X7uglhx7CsVOhlL0Gm
	xwp6kMbePq0H9lYfA1zhTLOWLeGFeZYEiw==
X-Google-Smtp-Source: 
 ABdhPJwRsgN2xO/cRq542Mf9tm5vGIIMU1tO+wHmxrsgPIcMjBEJHGxlYki6AwKn2pNq9dCMyvLPVQ==
X-Received: by 2002:a05:6214:d67:: with SMTP id 7mr2628960qvs.3.1643995315197;
        Fri, 04 Feb 2022 09:21:55 -0800 (PST)
Received: from gmail.com
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 w10sm1553418qtj.73.2022.02.04.09.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 09:21:54 -0800 (PST)
Date: Fri, 4 Feb 2022 12:21:53 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ross Burton <ross@burtonini.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] libibverbs: update LICENSE
Message-ID: <20220204172152.GB451@gmail.com>
References: <20220204123806.950149-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220204123806.950149-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Feb 2022 17:21:56 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7050

merged.

Bruce

In message: [meta-virtualization] [PATCH] libibverbs: update LICENSE
on 04/02/2022 Ross Burton wrote:

> As per COPYING, this is BSD-2-Clause or GPLv2.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  recipes-extended/libibverbs/libibverbs_1.2.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/libibverbs/libibverbs_1.2.1.bb b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
> index 90c424e..f40eccf 100644
> --- a/recipes-extended/libibverbs/libibverbs_1.2.1.bb
> +++ b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Libibverbs is a library that allows userspace processes to use In
>  HOMEPAGE = "http://www.openfabrics.org/downloads/verbs/"
>  SECTION = "libs/devel"
>  
> -LICENSE = "BSD"
> +LICENSE = "GPLv2 | BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=7c557f27dd795ba77cc419dddc656b51"
>  
>  # Official repo is at git://git.kernel.org/pub/scm/libs/infiniband/libibverbs.git
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7041): https://lists.yoctoproject.org/g/meta-virtualization/message/7041
> Mute This Topic: https://lists.yoctoproject.org/mt/88905255/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


