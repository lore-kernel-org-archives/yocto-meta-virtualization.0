Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web12.4102.1615347408411833043
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Mar 2021 19:36:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=arzLuTxE;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id v3so12057167qtw.4
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Mar 2021 19:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eNC9+NGRq5abY3NyCOnLZFiwbtk51RteiIuZnpP8U40=;
        b=arzLuTxEZ4Oy1ezVXzolHSnSTouVMDyhEZsFb1Z6zxevUufftB3ofAbOGnuDfiTOEN
         srdfV+FnnI2Hv52ehsclFfFujiCaB+aso57s/1myOObPpZgV80gCD7ITQhMCGI0MFgZY
         bS1YZrEW+sY17+5JPTPdpYFWRbcvnv6YIp7IdCABv/hjElLZZCxhGCtyUxfLriFKMJVb
         rrrK9eT5MqBBX/UXMQqOKveTLHdf84KFa843nLBVe1I68fEE+vIzkYNvrPcZsU2+psjM
         PXJTY2j57mTnvABTpOSyM5xR23FWxr+iAbMSbz64ueon2LpzUhxH3JrBar/o8Z8ooOJC
         kDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eNC9+NGRq5abY3NyCOnLZFiwbtk51RteiIuZnpP8U40=;
        b=Ds5gITGFqWJ6TFt4h+6JZgYo8Bze+r4B7XSpDyxzVmZXfywwqauAjX6haoQz2TIGWU
         NfbTezCPXtUBMdgaid0mizwLuEm/xzrBmAkwQfk3cQOCiV8NWbh69nYYlvyyUGL+t5Qv
         5TEBz7nAK2y438WZaB8/TjN1iGUZk/EXFKHyVK+Q0rV+Bxa6qldD5D7VifDO2B8uIvJ7
         bqN5qILAcTluzatEYYQqD7vV0FvN0d53bjjFEzvD50JlMZQP/S+n7gO3gOLAjwYX+Ulc
         d4bfhI6WWdpdD7isecs+Z5IYoZdYwR/zEbrrtNLQ+PaliqQ00pM0wxZiv+qNEG3hej99
         svJA==
X-Gm-Message-State: AOAM533aHG3REn3XRhdZ/o7XxuO7FRs3Ajjw+Va40HPceAD9w3NiJiB9
	c6mpgA49USob4QI82f3FbuQ=
X-Google-Smtp-Source: ABdhPJwhr1750UxqK6P4nAbRa2uIrA3d7R67OQaNEVwRrLrS2WouqKLXENlejo3iD05wSti/pn1Xrw==
X-Received: by 2002:ac8:698f:: with SMTP id o15mr1140364qtq.39.1615347407522;
        Tue, 09 Mar 2021 19:36:47 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id q2sm11503591qkq.59.2021.03.09.19.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 19:36:47 -0800 (PST)
Date: Tue, 9 Mar 2021 22:36:45 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] irqbalance: upgrade 1.6.0 -> 1.7.0
Message-ID: <20210310033644.GC15907@gmail.com>
References: <20210308081915.504129-1-yanfei.xu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210308081915.504129-1-yanfei.xu@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH] irqbalance: upgrade 1.6.0 -> 1.7.0
on 08/03/2021 Xu, Yanfei wrote:

> From: Yanfei Xu <yanfei.xu@windriver.com>
> 
> Miscellaneous bug fix release, consisting of:
> 
>   Strlen checking for IRQBALANCE_BANNED_CPU env var
>   Typo cleanup in SOCKET_TMPFS
>   consolidation of numa node creation on non-numa systems
>   fix uninitialized use of package_mask in affinity setup
>   use num_online_cpus instead of core_count
>   fix a null ptr crash in do_one_cpu
>   make list searching common from glib
>   fix a calloc parameter bug
>   remove some unused variables
>   use g_list_free_full
>   remove redundant call to free_cl_opts
>   fix some resource leaks in main()
>   fix some use after free issues in check_for_irq_ban
>   fix resource leaks in irqballance-ui, and in add_one_node
> 
> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> ---
>  recipes-extended/irqbalance/irqbalance_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-extended/irqbalance/irqbalance_git.bb b/recipes-extended/irqbalance/irqbalance_git.bb
> index 7755e8ea..1a96c169 100644
> --- a/recipes-extended/irqbalance/irqbalance_git.bb
> +++ b/recipes-extended/irqbalance/irqbalance_git.bb
> @@ -4,10 +4,10 @@
>  
>  require irqbalance.inc
>  
> -# commit tagged as version 1.6.0
> +# commit tagged as version 1.7.0
>  #
> -SRCREV = "b47eea84cbb93f533b0cba2f1aaf9ca4da8706b9"
> -PV = "1.6.0"
> +SRCREV = "641edc6f5d56f1b3eb8be0fa8a8e9b6a22e53218"
> +PV = "1.7.0"
>  
>  SRC_URI = "git://github.com/Irqbalance/irqbalance \
>             file://add-initscript.patch \
> -- 
> 2.27.0
> 

> 
> 
> 

