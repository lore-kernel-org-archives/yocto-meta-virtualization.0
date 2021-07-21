Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web12.342.1626907109336749289
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 21 Jul 2021 15:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=liRcFjjv;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id i4so1733902qvq.10
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 21 Jul 2021 15:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NKAMaCynKeQbO12N5QNpF1vx0tIBn2U9dzhgXQZ0mVg=;
        b=liRcFjjvbDGJbK4c1DqPGapUkcEkTI4/u/SldACefW9NWaj96DGE+ZRcUhQjEaHN8I
         IK50ISemEbCDmJWT793Wb/bJowYAfFKPEkMtRJEbxyrs0kfKzhuRg2AXW86zMDb/eYxt
         gwrB7oybJF+1X/4+YMbe5ipZPl/R7wgyARIgEGOsx8SEmPueNunmg26NNetFLdP9UJXl
         o73aDiZ7aRM1eZoe35vUhb70IP9QrX7WpgPpc0IM0EOQq0FpBfwZjsB7G559Gs3wRD2W
         pJNRXaaNjkR9Rhu1/yT/4/ecYj+B9k5p7LPR7Dv6UPTirwjVLEFm4RzRTShZaXOhplmY
         zftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NKAMaCynKeQbO12N5QNpF1vx0tIBn2U9dzhgXQZ0mVg=;
        b=sguOeZGuXfAORcZhC8ljNcuDAzlAhbTfyh0SDT95+Wqv3uMrKa1BlEnMw3g5LC5Gzw
         /5QGNjnht8CZOnhKMwOKupZBKGzPTZsS9pdq/XbHdkoOePx8JX63R4k3LQD8uZ+/zCp4
         JztHth/MqiSQbp49Tcl3cghgPAGeMfVtMDQHtICTsuqeXQI17/DMbFO1TtgyttYAFwzP
         JdKProdCfvi4CsfKHCfWrnLLCM37zGnUypoyXZhf7ZilelMS9///ZaFok750J+jFQCCA
         AWPDE4lMk3tBdotxxu4NiQC6DfuuofhJaqr3aOkQUaZBmPzKVzE6E0sf55ddPxbXAShj
         QRMQ==
X-Gm-Message-State: AOAM533Lr/CJpjpFsnDVgSfHrXP/2uY9kvHpKnvk6sNKUTL5hWx1MmsP
	OThtvyWB3tTXioZKSclU1Eo=
X-Google-Smtp-Source: ABdhPJzItO30u7qpiMDdLtGGG5nFy7pKZgR2Rm3VLckAG9kRHa4wq/WqC0rh+RyY2BNPm7D9blcxtw==
X-Received: by 2002:a05:6214:7cf:: with SMTP id bb15mr38082547qvb.29.1626907108362;
        Wed, 21 Jul 2021 15:38:28 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id o27sm7719276qkk.124.2021.07.21.15.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 15:38:27 -0700 (PDT)
Date: Wed, 21 Jul 2021 18:38:26 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-virtualization][PATCH hardknott] busybox-initrd: Update to 1.33.1
Message-ID: <20210721223823.GA47431@gmail.com>
References: <7a455f0667201311d7112840f8952aacf6ffc699.1626860249.git.diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <7a455f0667201311d7112840f8952aacf6ffc699.1626860249.git.diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH hardknott] busybox-initrd: Update to 1.33.1
on 21/07/2021 Diego Sueiro wrote:

> In oe-core hardknott branch busybox was updated to 1.33.1. Hence, do the same
> for busybox-initrd recipe.
> 
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  .../{busybox-initrd_1.33.0.bb => busybox-initrd_1.33.1.bb}        | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename recipes-core/busybox/{busybox-initrd_1.33.0.bb => busybox-initrd_1.33.1.bb} (100%)
> 
> diff --git a/recipes-core/busybox/busybox-initrd_1.33.0.bb b/recipes-core/busybox/busybox-initrd_1.33.1.bb
> similarity index 100%
> rename from recipes-core/busybox/busybox-initrd_1.33.0.bb
> rename to recipes-core/busybox/busybox-initrd_1.33.1.bb
> -- 
> 2.17.1
> 

> 
> 
> 

