Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC52C5479B
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 20:03:57 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.3707.1692302631508254424
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 13:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GZpaCgzn;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-645181e1eaeso741476d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Aug 2023 13:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692302630; x=1692907430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j4wUohswTOdqX9YJj5woomkWXoQdHPp8dgbl/4Jb/5Y=;
        b=GZpaCgzn3/jo176ET0kER16DSNHkZeu3rI+fK6Im1Qtcv1WIo0ygX7DyvI7OuZN0Vc
         Byj9GPxWLH4x3ZbgrG/e6ZETGPvh+Qt34vFlWZVMh0kVG9eKtz58rUcPpuJb0kN1dEOK
         jMd9bQ9G58y9eHJm7DemqtYlC/QjJ+RonnBDX+NmAI0UPGyNn/DMG5NErsrKf4N4eqZH
         k67JyoNwRSfjpo5qQpYLH7ezrlD7j8Fvs1T4EhmsXjqyqC0XZhT8DcudaCHTtGDuZM3x
         NsIPBPk9lXGSt17k1iYxhu+hBzpaDG9vpvvGCGxCp//KkmQ+DbHXlQHy2nXCWD9SUtI2
         dqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692302630; x=1692907430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4wUohswTOdqX9YJj5woomkWXoQdHPp8dgbl/4Jb/5Y=;
        b=Hzl+aqiPr1f+Ev34pc8pDp0s7AQGMyupWE9sd1HiNU2wyIjgRLyHwQs9hO7YfEu3Ic
         EevVNVM7v02n8Ro9DyMuDVmC6eJU0kAjMvGzmpJ51o214pG0s9vKafHBD7HNjSzSSyyy
         377Oa7RWVDXiAupuTs2YN7wfwGUnCwXZw7I8gsbw+btB5ZtA3TlG8UADtKYch4jIFA1Y
         9cRgWkOuh865Zugt9JqGOZTHvv8m+4UVrRC7OlG2sVQnORRqcovTZYiek6PNfoajgsJL
         t+0ILfgwTm66LLR8MgD6utu1/a8BsKjvDP2HfLEIRDN18fcLlqxkJCryu2LfJMppEPOP
         PlQQ==
X-Gm-Message-State: AOJu0YwGMJnwU1KIDMwGGwMUZUvdubcS0kLJHl45Th0tOYQ3Wir+zE5X
	c+mX4mrVPqMNYM/qqLbMO0E=
X-Google-Smtp-Source: AGHT+IGlZxyKBcpfb16bvupNFfTbGsMG01DSwitq5YrPjA5Kd9gcRue+OK5MWXBtOREBeJs20QOPfg==
X-Received: by 2002:a0c:e7cb:0:b0:635:eff8:2b4c with SMTP id c11-20020a0ce7cb000000b00635eff82b4cmr714141qvo.31.1692302630474;
        Thu, 17 Aug 2023 13:03:50 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id s12-20020a0ce30c000000b0063d30c10f1esm115741qvl.70.2023.08.17.13.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 13:03:50 -0700 (PDT)
Date: Thu, 17 Aug 2023 20:03:48 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	christopher.w.clark@gmail.com, mark.hatle@kernel.crashing.org
Subject: Re: [meta-virtualization][master][PATCH] xen-boot-cmd: Remove hard
 assigment for ramdisk image
Message-ID: <ZN59JM4fDzx8oSNv@gmail.com>
References: <20230816204255.1120358-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816204255.1120358-1-sandeep.gundlupet-raju@amd.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Aug 2023 20:03:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8210

merged.

Bruce

In message: [meta-virtualization][master][PATCH] xen-boot-cmd: Remove hard assigment for ramdisk image
on 16/08/2023 Sandeep Gundlupet Raju wrote:

> Setting hard assignment for RAMDISK_IMAGE will take precedence during
> variable pre-expansion. Hence set RAMDISK_IMAGE variable with soft
> assignment.
> 
> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> ---
>  dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> index 38f6f267..b2b76120 100644
> --- a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> +++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> @@ -18,7 +18,7 @@ XEN_LOAD_ADDRESS ?= "${@append_baseaddr(d,d.getVar('XEN_OFFSET'))}"
>  
>  # If dom0-ramdisk is used for Xen boot then set RAMDISK image to cpio.gz
>  XEN_IMAGE_NAME ?= "xen"
> -RAMDISK_IMAGE = "rootfs.cpio.gz"
> +RAMDISK_IMAGE ?= "rootfs.cpio.gz"
>  
>  # Set the amount of memory for dom0 depending on total available memory size(DDR).
>  DOM0_MEM ?= "1500M"
> -- 
> 2.34.1
> 

