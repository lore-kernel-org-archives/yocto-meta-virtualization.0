Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.2470.1574715897978466700
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Nov 2019 13:04:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t9v+iDzz;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id 14so18877738qtf.5
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Nov 2019 13:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xNKaORqbFzSiLvkTif/Br+Zg4pnZlGyIRKC9YEion8s=;
        b=t9v+iDzzFV2CsOiDOe7F07+X1EAUC/47csSL8VI4NF9nMISoEZVih+ZJVBfWh5Sfm1
         UO/eYAn0Es8PMorIQi0vo5ygfwGW1iBEY34sZkvEg1xc6wjBkmeIecKroXq8vU5uY5tR
         KzqTw4aq+rctY5LVuUodpkICRCX6ELQfdk6BkBLeyRFkrPU1ZeGFu9eUEEKeylyYtBwz
         wjGGvrUdgdjujV7FGIt7IRs/8GHIKC3hM2G1x3tkHmKvaS4g0S74+OXzGoexBO7y3aPc
         JSm5/xchu8J6c70bl+LDJ7y9/qwRAD/uvHWOnKKGMEqW5ZbvW4+5gbkDbLXpNml57lF7
         ZRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xNKaORqbFzSiLvkTif/Br+Zg4pnZlGyIRKC9YEion8s=;
        b=iHC6+iCF+VDxE1f2qdmXLN2dA35Yndz29QAk8Wp0fR0bXatGX4S96E0qFMT9Ac6tpE
         MSzy4v657hXFAK64VZv8cDGSPS8TmHrp0UZNOQ2d2d0GGa+wZBOsB49LmIxj5kDfUkuA
         pampA6C2+aHXBRbExE2RDNAATqxRoRDiHuSf33nXMIWs7FZzOzj9fI7/dnRKgrj/8bsV
         TotjdzkcDrXnIjsb5bH7OvTqUYwQ8EZbVOlo/QNYual4fP5Xd+SlNKyvMXurCSnNhE5z
         o4gYRGw+Fr5fNTmgCZaPeiPGeutT1qJBoVbimUSbAvkRb+ggjnDbSCoYZ0vKhV4dj1PX
         Wzgw==
X-Gm-Message-State: APjAAAW6HULoR2HfYIruYY3pTejN3ocYpPnSdWZzJiLb2G8+eqhltF5I
	5cjY3qewAel5oQfv+dTWTzI=
X-Google-Smtp-Source: APXvYqxcNa0Hz2ldjw9Wd055P7zxelyZJgaNyD1ezYPKOfAq8GsVv2BP8RAB4d0Ty/H6TDj97/KNuw==
X-Received: by 2002:aed:3467:: with SMTP id w94mr31659687qtd.166.1574715896924;
        Mon, 25 Nov 2019 13:04:56 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id v21sm3960219qka.116.2019.11.25.13.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 13:04:56 -0800 (PST)
Date: Mon, 25 Nov 2019 16:04:54 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, stefan.agner@toradex.com
Subject: Re: [meta-virtualization][PATCH] xen-guest-image-minimal: do not inherit distro_features_check
Message-ID: <20191125210453.GB27677@gmail.com>
References: <1574711766-6295-1-git-send-email-liu.ming50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1574711766-6295-1-git-send-email-liu.ming50@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


In message: [meta-virtualization][PATCH] xen-guest-image-minimal: do not inherit distro_features_check
on 25/11/2019 Ming Liu wrote:

> From: Ming Liu <liu.ming50@gmail.com>
> 
> Change to inherit features_check, since distro_features_check has been
> deprecated in OE.

I had a similar changed staged, but have grabbed yours instead.

Bruce

> 
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  recipes-extended/images/xen-guest-image-minimal.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/images/xen-guest-image-minimal.bb b/recipes-extended/images/xen-guest-image-minimal.bb
> index d311eae..63c7510 100644
> --- a/recipes-extended/images/xen-guest-image-minimal.bb
> +++ b/recipes-extended/images/xen-guest-image-minimal.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "A Xen guest image."
>  
> -inherit core-image distro_features_check
> +inherit core-image features_check
>  
>  IMAGE_INSTALL += " \
>      packagegroup-core-boot \
> -- 
> 2.7.4
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4737): https://lists.yoctoproject.org/g/meta-virtualization/message/4737
> Mute This Topic: https://lists.yoctoproject.org/mt/61947126/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-

