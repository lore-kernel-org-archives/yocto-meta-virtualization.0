Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4F0C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 15:48:04 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.12112.1645717682876994585
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 07:48:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vp2eeSZ6;
 spf=pass (domain: gmail.com, ip: 209.85.222.177,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id d84so2099044qke.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 07:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=P5bjBeWffGtqW/14Uc5Fk9/A62ZW818vrFTUKsw9COc=;
        b=Vp2eeSZ6vJdWP98cCc0cChE1JCFGmMDaOeuOLLX5BOgiREHFkT5MvoDznLhYiucCJ+
         MFzlrhDhOCA6VDh2bmqPhdfJGT8FGXel0AuXehqsh9Kamgxq7A1suOSuyQjpqqoC1leW
         QHRpuGD7UL8sTTGrTyv4wFNoJWhByiTvxjEqaaw0V9f99LfN7T1CeF3upS251sB+kG5+
         7sd4VXChxpAYik9xBQ0gEteN7bWb/to0py9GhoPj7cWoKMM1MpLBimKT8nKBN4YDv0hT
         EoLPek3MpzDc//Mtk+APajYIgDevj+uYNz+2pJvPE1gYI50HMgDo/21P5Z4sEIFK18xM
         1+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P5bjBeWffGtqW/14Uc5Fk9/A62ZW818vrFTUKsw9COc=;
        b=oPTnZ7EehxgkgnglwWo8/Q3MR/RwelJRknsYO9RPAMIoJBeH+u+aoEFpAyL3l9syT8
         TDFH3N5YOpcJ3bimeHokoDlUk/czbZwMovxdtog+aqAqZ8A0qieEHaZFXME5py1kvlfw
         doLmXWBju9UvzeB3NWSiz4JkdbBvV7Ly7FDJPNpqMkokJ1uA0REDy1/TCCGBvC3K2sxw
         9I3CDISpnwP57Jp0vDfov3JxWkej3UW7pP+33XJ56dIVovlrpwvyKNNOZ4TvF+2oqCWE
         +/bxriu8fLAh9TwAYmziUr52wB2+VNNvaLH14gG8A7fx+tv7CNPepOjGIqYCMRYhIXLk
         fVAA==
X-Gm-Message-State: AOAM532gehnfzuCvY3BpzqzJgquULsxs3m532OmVBvesJfdqW6hxq0jv
	nu7y+b1qeB1tyC8sxW3ZL74=
X-Google-Smtp-Source: 
 ABdhPJxt3jFtrB7y+OpDhr3UFiH043SsdmjpgVvIumvSyHx1QPiU/qZmMUCrMOUIqDQuSE3GCpRLpw==
X-Received: by 2002:a37:8644:0:b0:47e:b90:bf6c with SMTP id
 i65-20020a378644000000b0047e0b90bf6cmr2035404qkd.538.1645717681875;
        Thu, 24 Feb 2022 07:48:01 -0800 (PST)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 a20sm1829954qtx.6.2022.02.24.07.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 07:48:01 -0800 (PST)
Date: Thu, 24 Feb 2022 10:47:59 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Kasper <kasper@krinvent.dk>
Cc: meta-virtualization@lists.yoctoproject.org, mail@krevsbech.dk,
	Kasper Revsbech <kasper.revsbech.ext@siemensgamesa.com>
Subject: Re: [meta-virtualization] [PATCH] xvisor: Remove bb.error when
 builing for non-supported arch
Message-ID: <20220224154756.GA49422@gmail.com>
References: <20220215143123.56913-1-kasper@krinvent.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215143123.56913-1-kasper@krinvent.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Feb 2022 15:48:04 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7065

merged!

Bruce

In message: [meta-virtualization] [PATCH] xvisor: Remove bb.error when builing for non-supported arch
on 15/02/2022 Kasper wrote:

> From: Kasper Revsbech <kasper.revsbech.ext@siemensgamesa.com>
> 
> Change bb.error to bb.note when getting config and arch of target/host
> as it is not an error if arch is not supported that should flag when
> parsing the recipe.
> It is an error if trying to include in image and that is already handled
> in COMPATIBLE_HOST
> 
> Signed-off-by: Kasper Revsbech <kasper.revsbech.ext@siemensgamesa.com>
> ---
>  recipes-extended/xvisor/xvisor-configs.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-extended/xvisor/xvisor-configs.inc b/recipes-extended/xvisor/xvisor-configs.inc
> index f53bba2..cd873cb 100644
> --- a/recipes-extended/xvisor/xvisor-configs.inc
> +++ b/recipes-extended/xvisor/xvisor-configs.inc
> @@ -9,7 +9,7 @@ def get_oemake_config(a, d):
>      elif re.match('riscv32(eb|)$', a):        return 'generic-32b-defconfig'
>      elif re.match('riscv64(eb|)$', a):        return 'generic-64b-defconfig'
>      else:
> -        bb.error("cannot map '%s' to a Xvisor defconfig" % a)
> +        bb.note("cannot map '%s' to a Xvisor defconfig" % a)
>  
>  def map_xvisor_arch(a, d):
>      import re
> @@ -22,4 +22,4 @@ def map_xvisor_arch(a, d):
>      elif re.match('aarch64_be_ilp32$', a):      return 'arm'
>      elif re.match('riscv(32|64|)(eb|)$', a):    return 'riscv'
>      else:
> -        bb.error("cannot map '%s' to a Xvisor architecture" % a)
> +        bb.note("cannot map '%s' to a Xvisor architecture" % a)
> -- 
> 2.32.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7060): https://lists.yoctoproject.org/g/meta-virtualization/message/7060
> Mute This Topic: https://lists.yoctoproject.org/mt/89161541/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


