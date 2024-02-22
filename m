Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43755C48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 17:15:49 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.18623.1708622148150324681
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Feb 2024 09:15:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O/cLq8e7;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-42c78ba62aaso52007001cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 09:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708622147; x=1709226947; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nM/+ktSpj0r0A398QSOijGxFByMhePD3ZVDxG0A3uYs=;
        b=O/cLq8e7gvO5fhPosqSScnjFqrWxw4mZVqmHIeveYIl6joqRcA5o1cZjfMzzR2kDJJ
         NrDxgfh9HqmRCb5VNtI6OMvsbjlJq8l23WSgLs0RucavWzNq2wiQTjblEidwEg18OWmc
         bbvd8BFvRVytHsMz6Ke/kAZBC5UQreM0bmzyfovgypMt+zuohW1/MrAPsPdFpZTD2bbY
         /kd074c4yRhosr9IT4V7DBVo3bOrweGzjGzO222SOx4MTWe+U8O9VYeK8sd+EKuJktZH
         OHzBWPpvmhbQgjK8nwleYHPisDTs5wx4y+jFHa5mca+n2XElN9PTirTIAkLeqtxoL6Cv
         Aleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708622147; x=1709226947;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nM/+ktSpj0r0A398QSOijGxFByMhePD3ZVDxG0A3uYs=;
        b=LJIot192PCyQ9+E28GcFKF3BBDilUmVefhp2jBAosJCjOJ3Qo7zWJaserIL0LiPZJO
         96NBSiaOU1HwRbQ8ORJ/HiLGAXcouM4jhouL9VFjf/sil/AwPOEQTAH7r+KPN/ESMrbX
         6w18C6qcgoAgmqMNN8m12D7914u+pEJ9xtH4VY2vqk3bcvDWqk7+zBv7/4QrO7en0Z2G
         CUtAo/70SUehIyK73lMCOZLtMl5V5KPaGw/nT9DcJg5EEi6ohIEQmwmz61/sYFIdWIMO
         g+BnaTzo92bfaYp4jKZ2+S3sJo2pRIua9Gy0wrhIFl5Rl7/8Vj1z1tejo2cacxdT+vvC
         mjvg==
X-Gm-Message-State: AOJu0Yxv6g2ekxeRhnMv8jelYsAhEqRHd1YB/+YHVC4qLQSgmOZGY38z
	wSOKI4jZ1Krt8RevC8rQAWT+zOyBUoCWzihvmL41bmjvkG8MKSzH
X-Google-Smtp-Source: AGHT+IFEh6IjwmTTT9oyrKbYWQSCGxfj6E54kVAkmMzh11PZ9SzJDes425ST8JX4TK2Dxp7G0IKzPg==
X-Received: by 2002:a05:622a:199b:b0:42e:142b:5473 with SMTP id u27-20020a05622a199b00b0042e142b5473mr14456908qtc.1.1708622147104;
        Thu, 22 Feb 2024 09:15:47 -0800 (PST)
Received: from gmail.com ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id kc13-20020a05622a44cd00b0042c7e72746esm5625393qtb.8.2024.02.22.09.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 09:15:46 -0800 (PST)
Date: Thu, 22 Feb 2024 17:15:44 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] xen-boot-cmd.inc: Fix initrd boot
 issue with 6.6 kernel
Message-ID: <ZdeBQFvet94Jb6Kv@gmail.com>
References: <20240222013230.1183593-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240222013230.1183593-1-sandeep.gundlupet-raju@amd.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 17:15:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8574

merged.

Bruce

In message: [meta-virtualization][PATCH] xen-boot-cmd.inc: Fix initrd boot issue with 6.6 kernel
on 21/02/2024 Sandeep Gundlupet Raju wrote:

> Due to increase in 6.6 kernel image size xen ramdisk offset was
> overlapping with kernel image. This causes xen randisk image boot
> failures. Hence increase the ramdisk offset to fix initrd boot
> issue.
> 
> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> ---
>  dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> index b2b76120..7a4e41a6 100644
> --- a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> +++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> @@ -9,8 +9,8 @@ KERNEL_OFFSET:versal ?= "0xE00000"
>  DEVICETREE_OFFSET:zynqmp ?= "0xC000000"
>  DEVICETREE_OFFSET:versal ?= "0xC000000"
>  
> -RAMDISK_OFFSET:zynqmp ?= "0x2400000"
> -RAMDISK_OFFSET:versal ?= "0x2400000"
> +RAMDISK_OFFSET:zynqmp ?= "0x2600000"
> +RAMDISK_OFFSET:versal ?= "0x2600000"
>  
>  XEN_OFFSET:zynqmp ?= "0xBA00000"
>  XEN_OFFSET:versal ?= "0xBA00000"
> -- 
> 2.34.1
> 

