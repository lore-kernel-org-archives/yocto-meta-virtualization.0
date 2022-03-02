Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F66FC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 20:47:51 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.2778.1646254066992247548
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 12:47:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O5jRga1c;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id j78so2356132qke.2
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 12:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Rs7pAoD3IJHNQqBnHP8erXL15pvyiol1nBvw7fF62XY=;
        b=O5jRga1cAZA+662RS6zoWGh+nlCBNJhcLci33lzgToveRf0AGazxgZ6kzJy8gupCBq
         whDvkZFQWnSheQ2opBvE95SHcWzsF0fsG2Ao64nYIuIIWXwPfyqytihx+V/hKKv7kTAe
         zPVfjbdLYpl4DYmiJBtaR0ApEfzWHTr308A/ukafoHga76XQYXvwVVl5ed44h3EtgKd9
         r0TwGO/HzgcI1cJMPlqAAerbA4ALCXThsuj8kFKtVLssYSJWoIz0mGnGEs2TJNyCdfQQ
         IhVPlkImZbfZBxHEp9Dl7FIO7qWsKVOOGiFFD9LpKWoio6jGE/IfWFV12VPJ+fpLOS8q
         mMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Rs7pAoD3IJHNQqBnHP8erXL15pvyiol1nBvw7fF62XY=;
        b=fju8fODG0SFujX5YZ6ksW7ifk2IJFsnlDW2vVnbIL/1PGvB/6lEbOypcwXcU3ZEa49
         +lBDZDE2An+JJzHXuoYupMCkK02UooyxvHGjFtquCFqiyTeIOY3QfNuuSiX2OhI2LVmf
         BMJbvMAlrKbNgQX59EmU1/qsJQOrG/nQnad07ytUtqOkYHvm5iSHV0j74BQC1skTq7tq
         Gb6uhWWQnZcAA2NNgQIZ/iPvx7x16h4Y7M+aOT86niQs1n53ACPR+QK3+I6MtnBMjo/v
         EnT1ARsjZMYDX7dDmGbBoZeCUa18jCflhASQG3SaAx9a/99jbnIo2bBg2HxRfNFbjmVQ
         v/zQ==
X-Gm-Message-State: AOAM530jiFLBXfBmnvKGSPtJbqf0Cew9myboRTPhCSI5p9MpB2B4B5AJ
	7WxMMvwGktjwE/p6yxsEPx0=
X-Google-Smtp-Source: 
 ABdhPJwIBPJcC1enOz0KhqkI/HZTidyWkcJnu1oVUg2Zw3I3GWV/P8bfP0IYkOiJV8ZegGcwepO6Hg==
X-Received: by 2002:a05:620a:284d:b0:5ff:320d:c0a5 with SMTP id
 h13-20020a05620a284d00b005ff320dc0a5mr17469128qkp.681.1646254066026;
        Wed, 02 Mar 2022 12:47:46 -0800 (PST)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 n18-20020a05620a223200b00476534e4fdbsm49881qkh.95.2022.03.02.12.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:47:45 -0800 (PST)
Date: Wed, 2 Mar 2022 15:47:43 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Kamil Dziezyk <kamil.dziezyk@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	christopher.w.clark@gmail.com, cardoe@gentoo.org
Subject: Re: [meta-virtualization][PATCH] xen-*image-minimal: Install
 *xen-acpi-processor package only for x86* machines
Message-ID: <20220302204743.GC51621@gmail.com>
References: <20220302135624.3012-1-kamil.dziezyk@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302135624.3012-1-kamil.dziezyk@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Mar 2022 20:47:51 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7073

Looks fine to me, so we have some ARM servers that have the ACPI feature that
are broken.

I've queued it to master-next, and will wait a bit to hear frmo Christopher.

Bruce

In message: [meta-virtualization][PATCH] xen-*image-minimal: Install *xen-acpi-processor package only for x86* machines
on 02/03/2022 Kamil Dziezyk wrote:

> Kernel module xen_acpi_processor is built only for x86* architectures,
> therefore 'kernel-module-xen-acpi-processor' package is compatible only with
> x86* machines.
> 
> Issue-Id: SCM-3892
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
> Change-Id: I8dde00e3c78a1f9eea50b19fbc1981f5e26df133
> ---
>  recipes-extended/images/xen-guest-image-minimal.bb | 6 +++++-
>  recipes-extended/images/xen-image-minimal.bb       | 5 ++++-
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-extended/images/xen-guest-image-minimal.bb b/recipes-extended/images/xen-guest-image-minimal.bb
> index ca111b4..fced763 100644
> --- a/recipes-extended/images/xen-guest-image-minimal.bb
> +++ b/recipes-extended/images/xen-guest-image-minimal.bb
> @@ -4,9 +4,13 @@ inherit core-image features_check
> 
>  IMAGE_INSTALL += " \
>      packagegroup-core-boot \
> -    ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', 'kernel-module-xen-acpi-processor', '', d)} \
> +    ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', '${XEN_ACPI_PROCESSOR_MODULE}', '', d)} \
>      "
> 
> +XEN_ACPI_PROCESSOR_MODULE = ""
> +XEN_ACPI_PROCESSOR_MODULE:x86    = "kernel-module-xen-acpi-processor"
> +XEN_ACPI_PROCESSOR_MODULE:x86-64 = "kernel-module-xen-acpi-processor"
> +
>  IMAGE_INSTALL += "${@bb.utils.contains('IMAGE_FEATURES', 'x11', ' xf86-video-fbdev', '', d)}"
> 
>  # Install xf86-video-vesa on x86 platforms.
> diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
> index ea596ce..f6fa5ed 100644
> --- a/recipes-extended/images/xen-image-minimal.bb
> +++ b/recipes-extended/images/xen-image-minimal.bb
> @@ -5,7 +5,7 @@ INITRD_IMAGE = "core-image-minimal-initramfs"
>  XEN_KERNEL_MODULES ?= "kernel-module-xen-blkback kernel-module-xen-gntalloc \
>                         kernel-module-xen-gntdev kernel-module-xen-netback kernel-module-xen-wdt \
>                         ${@bb.utils.contains('MACHINE_FEATURES', 'pci', "${XEN_PCIBACK_MODULE}", '', d)} \
> -                       ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', 'kernel-module-xen-acpi-processor', '', d)} \
> +                       ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', '${XEN_ACPI_PROCESSOR_MODULE}', '', d)} \
>                        "
> 
>  IMAGE_INSTALL += " \
> @@ -28,6 +28,9 @@ IMAGE_INSTALL:append:x86-64 = "kernel-module-tun"
>  XEN_PCIBACK_MODULE = ""
>  XEN_PCIBACK_MODULE:x86    = "kernel-module-xen-pciback"
>  XEN_PCIBACK_MODULE:x86-64 = "kernel-module-xen-pciback"
> +XEN_ACPI_PROCESSOR_MODULE = ""
> +XEN_ACPI_PROCESSOR_MODULE:x86    = "kernel-module-xen-acpi-processor"
> +XEN_ACPI_PROCESSOR_MODULE:x86-64 = "kernel-module-xen-acpi-processor"
> 
>  LICENSE = "MIT"
> 
> --
> 2.17.1
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7070): https://lists.yoctoproject.org/g/meta-virtualization/message/7070
> Mute This Topic: https://lists.yoctoproject.org/mt/89501286/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


