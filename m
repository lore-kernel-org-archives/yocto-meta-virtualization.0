Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C045C3DA59
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 22:17:18 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.31004.1721686634875014586
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Jul 2024 15:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aiAsG5EN;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6b6199ef089so29378456d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Jul 2024 15:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721686634; x=1722291434; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SYlk1IO9UNPoRGG11/VzFN6/ZFnFM3vzf3nqSFJc3hw=;
        b=aiAsG5ENO2IGGC/1LvjGlMkCozKLjAlNWFhV0LtkzyrDltPnJ4HLN3S2lXHIkr8vfE
         nYDFRVOzqwlK7WKPn4oUIdaI0jRZrlJzEVnXI5vWtcO90PASDeExNVv/as5hpRBqPKIT
         D3+0geX6+IhZYXn5Bp4d/N1pk042nOd1M+S+g+pc1+zhhRSnCZWf5YuxbEz3xmvaHx6P
         YNLgWlgSIQiSdIIOSOxgHF4S8+Uh0W9ecKDW6pfbFevTT/udQZ/k5VKaqjePtpUoTutZ
         nbwg9GvsSCVzBx4RxLGVMDgQ5vKTcVFcgJ6YjZgjSZxzu1etO7DOJjJ0qm9P9pq2DVIk
         /y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721686634; x=1722291434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYlk1IO9UNPoRGG11/VzFN6/ZFnFM3vzf3nqSFJc3hw=;
        b=mD1eDpfnO4tdYB/G9kCkHCJTuoM+qiT//+uW3ndIAHHdMoL1K+A1rJ8ckwpV5SvMSS
         49yP/UxwkOgDpPbHoWQR4MDGEm3CIXAvpeiWgGYeX6y+pqXFmX/h4sdRsEWY3D1FaDOI
         T/g/O9L0yu7B/dAq1joAHaZAVNA4ZFeobqtiFUNs8bEvz4JeFThezxuSJrMd+sGTXZym
         bL811vXNWExtvU2HRS35j1pgq2VLfIDOVOlZ1VUPfibnZ1hwrR3MYVg4oXNXmTFyd7/G
         heJCDHetJ9fIbtg1BeOVj2tPdyT67eAzn32FASkd/lDDRWo/jpDM8S3ikMujXC2KH5IY
         ArXA==
X-Gm-Message-State: AOJu0Ywxg7stY/d/2ZabP+QH0jGhiBNBlc8n2ueQjCzsbq0qpGrbiQ4V
	hbVlYQbPhll+SSdDx1lRPAK5/s7UJ6Y2qcBhZTWpuJu2JvdmtGVW
X-Google-Smtp-Source: AGHT+IFLTEraa7bhd34YQDvb83mjYv/eXAxHvlicTnWl2+3jRdXfEiOiiKXR82o/BCCsVssW484SVg==
X-Received: by 2002:ad4:5de2:0:b0:6b5:a5:f5f2 with SMTP id 6a1803df08f44-6b981a5eee3mr12679326d6.55.1721686633657;
        Mon, 22 Jul 2024 15:17:13 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b7acae401asm39506806d6.111.2024.07.22.15.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 15:17:13 -0700 (PDT)
Date: Mon, 22 Jul 2024 22:17:11 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: tim.orling@konsulko.com
Cc: meta-virtualization@lists.yoctoproject.org,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [meta-virtualization][PATCH] xen-rpi-u-boot-scr: WORKDIR ->
 UNPACKDIR transition
Message-ID: <Zp7aZ7XA6Hly1evR@gmail.com>
References: <20240721061254.3674810-2-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240721061254.3674810-2-tim.orling@konsulko.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Jul 2024 22:17:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8838


merged to mater-next

I finally finished a week long battle with ceph, so I expect
to get master-next -> master this week.

Bruce

In message: [meta-virtualization][PATCH] xen-rpi-u-boot-scr: WORKDIR -> UNPACKDIR transition
on 20/07/2024 Tim Orling via lists.yoctoproject.org wrote:

> From: Tim Orling <tim.orling@konsulko.com>
> 
> Borrowed from Leon Anavi <leon.anavi@konsulko.com>
> meta-raspberrypi: commit 434ed33c90b7659152b1e8d7c2d4d785db85105f
> 
> and from Martin Jansa <martin.jansa@gmail.com>
> meta-raspberrypi: commit c39c2b165e68388767f54dc86acf4595a33ee1e1
> 
> This adapts to the oe-core rework to enforce a separate directory
> for unpacking local sources (UNPACKDIR) instead of directly using
> WORKDIR.
> 
> Follows the preliminary guideline from:
> https://lists.openembedded.org/g/openembedded-architecture/message/2007
> 
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  .../recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb     | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
> index 87619d01..3f83c7f8 100644
> --- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
> +++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
> @@ -17,13 +17,16 @@ do_compile() {
>          -e 's/@@KERNEL_BOOTCMD@@/${KERNEL_BOOTCMD}/' \
>          -e 's/@@RPI_DOM0_MEM@@/${RPI_DOM0_MEM}/' \
>          -e 's/@@RPI_DEBUG_XEN_ARGS@@/${RPI_DEBUG_XEN_ARGS}/' \
> -        "${WORKDIR}/boot.cmd.xen.in" > "${WORKDIR}/boot.cmd"
> +        "${UNPACKDIR}/boot.cmd.xen.in" > "${WORKDIR}/boot.cmd"
>  
>      mkimage -A ${UBOOT_ARCH} -T script -C none -n "Boot script" -d "${WORKDIR}/boot.cmd" boot.scr
>  }
>  
>  inherit kernel-arch deploy nopackages
>  
> +S = "${WORKDIR}/sources"
> +UNPACKDIR = "${S}"
> +
>  do_deploy() {
>      install -d ${DEPLOYDIR}
>      install -m 0644 boot.scr ${DEPLOYDIR}
> -- 
> 2.45.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8837): https://lists.yoctoproject.org/g/meta-virtualization/message/8837
> Mute This Topic: https://lists.yoctoproject.org/mt/107463785/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


