Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA13CC5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 18:59:04 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.1478.1709924340139688107
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Mar 2024 10:59:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TtOz293t;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-68f9c01a148so9689106d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Mar 2024 10:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709924339; x=1710529139; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3l2oSmFKztzZp+n1bZJVCtm+FXksR6DXtJ18pho8Dx8=;
        b=TtOz293tBP9v5EYWisNCqzrIcdhKHWF2Z/wb2NNxCKvMs8UW+4q3OsZml7rLWfd0Kr
         w9qfV6v9S1rEXeBZxW3/YzCrLXhJPt36coxSPJXLRyNZmI1Jkip7k/8L/PBOVfiDJkmZ
         pH5mlbWbdV4H50asV+xXHZ//wvCFrCbJaSvSpYgYqklo0AfytUFscHS+1a6+ngdL3M2m
         BvXYgaXlLqflE+XRIkT/V4t44hz0BNagCGIsrqLaKa4I/R+kx7l3u7L58nuTJjShDw2q
         yMfpWBmhscu902vOWkRt2cWJaG1Ef+f+OjZ1irOK/tPfwjYNz+Kxke2n1hJIpMzYLz55
         H+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709924339; x=1710529139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3l2oSmFKztzZp+n1bZJVCtm+FXksR6DXtJ18pho8Dx8=;
        b=WKRm+7uXusp7J9hmei4CRa/Czm6TNPrbAI1655CoQeZ1R6HsxGQM/i1RBTM/xUjdio
         O7TRbGN22wwB8ZBg7CS5bkHYOzYSDH0LIIrJRz/AcwWOv7KmeYyTAkrUzP8E+KOAcQWw
         2PMUzFiTl9qMr16PmZzX8h3D8au6doMi242xSJRr3I6SegnaTSP+NSzOwosNhnKKhndx
         j/lAbT6OBOLNebnCx/EkAADLK4zIS57uusBn5+6cBIoDKvo1j9bx39tAyO+OyUUk9dqu
         L/L1YroNhcYStR8kGt+sE8YKNAsBwMDwN95CI8eh9UhrzbwXPkd5ktP7v9uA0uQFHvju
         LMnw==
X-Gm-Message-State: AOJu0YwbK1QIgoKlHi0zlWVqBYGBp1RvkgC9fryezIjH9h8xlgWY7Nks
	j6OJWdsPpRX8N4d8EHcv53hnRWSXZmwCRHJGzThTogaZzN640gor
X-Google-Smtp-Source: AGHT+IF6HAUMtx0Ywufw0FQOgLvO60H+Y6+2ntAg/zcfCafNXZmehQKIycE37YGfRErQENhlPCzqPg==
X-Received: by 2002:a05:6214:809:b0:690:b523:7a40 with SMTP id df9-20020a056214080900b00690b5237a40mr2532662qvb.35.1709924339198;
        Fri, 08 Mar 2024 10:58:59 -0800 (PST)
Received: from gmail.com ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id b17-20020a0c9b11000000b00690494d2766sm13092qve.96.2024.03.08.10.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 10:58:58 -0800 (PST)
Date: Fri, 8 Mar 2024 18:58:57 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Taedcke, Christian" <christian.taedcke-oss@weidmueller.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Christian Taedcke <christian.taedcke@weidmueller.com>
Subject: Re: [meta-virtualization][PATCH] kernel: lxc: drop HVC_DRIVER
Message-ID: <Zetf8XzD8Gw8azjc@gmail.com>
References: <20240304155227.613062-1-christian.taedcke-oss@weidmueller.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304155227.613062-1-christian.taedcke-oss@weidmueller.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Mar 2024 18:59:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8615

In message: [meta-virtualization][PATCH] kernel: lxc: drop HVC_DRIVER
on 04/03/2024 Taedcke, Christian wrote:

> From: Christian Taedcke <christian.taedcke@weidmueller.com>
> 
> HVC_DRIVER cannot be selected directly since it has no prompt.

I'm attempting to move all of the fragments to the centralized
kernel-cache repository.

I'll take care of synchronizing this change with the repo, since
the lxc fragments I moved there didn't have this patch applied.

Bruce

> 
> Signed-off-by: Christian Taedcke <christian.taedcke@weidmueller.com>
> ---
>  recipes-kernel/linux/linux-yocto/lxc.cfg | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-yocto/lxc.cfg b/recipes-kernel/linux/linux-yocto/lxc.cfg
> index e195c15b..ab75cbf0 100644
> --- a/recipes-kernel/linux/linux-yocto/lxc.cfg
> +++ b/recipes-kernel/linux/linux-yocto/lxc.cfg
> @@ -16,9 +16,6 @@ CONFIG_NET_CLS_CGROUP=m
>  CONFIG_BLK_CGROUP=y
>  CONFIG_CGROUP_NET_PRIO=y
>  
> -# Virtual drivers
> -CONFIG_HVC_DRIVER=y
> -
>  # Base support for live boot
>  CONFIG_BLK_DEV_LOOP=y
>  CONFIG_NLS_CODEPAGE_437=y
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8602): https://lists.yoctoproject.org/g/meta-virtualization/message/8602
> Mute This Topic: https://lists.yoctoproject.org/mt/104724750/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


