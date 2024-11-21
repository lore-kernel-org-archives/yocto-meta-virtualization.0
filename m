Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88904D75BB8
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 04:41:00 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.3830.1732164053874271391
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Nov 2024 20:40:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R3vyh9Sh;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-460dce6fff9so3200571cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 20 Nov 2024 20:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732164053; x=1732768853; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YvmTjkQT4a6kWAom70eEsU05f8Sd0upGIS//rdl+MA0=;
        b=R3vyh9ShRp6h2dozwLebwpKefFJIDq+xisbo2O2hXQP4GJqOxjuRL1t5tOFl4OshpP
         OlJQ3qvrsNy4VdMc8fodJK/I7SJzxNf/pBvLm1AJOuH6THWkCFYpD5/OqnAM8RmQddiB
         FEKdnUvJ3kqTjSXfu08p9TU7bHdflcFDEZO8jR6oQpk9ZYdw1gorHfsADv5fq+cA6lw4
         Tzdw218n2UN7K/Vezj+SKwcQnbq5m6RXlV9A6bJctY5zHSuD/ZmdO/WmoisX+mLkJwwF
         Wy5Ghkdymjjy19BwMp6CiNSvtPOapVJ4NrTnwBsvcfeEcFA9O05EU4Tvdbop8dlBd4/A
         i7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732164053; x=1732768853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvmTjkQT4a6kWAom70eEsU05f8Sd0upGIS//rdl+MA0=;
        b=Qgi9dCEhEvG1g1p1XmdGO1zc/Q22jte3zxOYs8ygsvso/cpZeUtoh0pk5yQhvPvQji
         /DPeHYewuDK6vbarEOxl6gs8M7ADD97ymE6sG0/Mp7oLVT61iv3WUxKUes5sXT1oOaMQ
         6QH645dD7yDle6Rzh+zhUl49b/X3jZpO+laBB8He3eNc4hH74cGEbxdYnzrysp5uoLss
         5sUR8UxIaSrHmjY8uSG3XXSXvEtuG0NIxBSR9msBx4tzNoVNfD9amxsSMl+1H10VwqvJ
         897FvdovwjUvK2zroICikqj0MUVq5GscfoKBfn9DjX6p23FkYVfqkZFvD8gV4xc4elbW
         8esg==
X-Gm-Message-State: AOJu0YzD1TSVO98xAqntWPPi4BG0Na3smt7Af0825WVL5b//3f2bJ1Sk
	fJKILA6GL9l7t0QElX9lSvvB9wye73Yjfxq7WJw+TSjeXjIuA1a5
X-Google-Smtp-Source: AGHT+IGIlGfufcyG3HGkwGWN+4oDeDZbzGRMjX5yAMJUAdDVtLhrvmPbMDk24lO/QkzA/+IeWSMxGg==
X-Received: by 2002:a05:622a:5105:b0:461:48f9:4287 with SMTP id d75a77b69052e-46479e27e57mr70155891cf.46.1732164052794;
        Wed, 20 Nov 2024 20:40:52 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4646aa2c16esm17254091cf.74.2024.11.20.20.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 20:40:52 -0800 (PST)
Date: Thu, 21 Nov 2024 04:40:50 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	mark.hatle@kernel.crashing.org
Subject: Re: [meta-virtualization][master][PATCH 1/6]  xen-u-boot-scr: Add
 bbclass for xen boot script variables
Message-ID: <Zz650spUU9SEUE1c@gmail.com>
References: <20241119051203.3841577-1-sandeep.gundlupet-raju@amd.com>
 <20241119051203.3841577-2-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119051203.3841577-2-sandeep.gundlupet-raju@amd.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 04:41:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8991

In message: [meta-virtualization][master][PATCH 1/6]  xen-u-boot-scr: Add bbclass for xen boot script variables
on 18/11/2024 Sandeep Gundlupet Raju wrote:

> Add a new bbclass for xen boot script variables. This bbclass provides
> common xen u-boot boot script variables which can be inherited by any
> vendor specific u-boot boot script recipes. Also these variable are
> configurable from recipes, global and machine configuration files.

This is this just for configuration, I'd prefer if the
class was called: xen-uboot-scr-variables or xen-uboot-scr-configuration

That way when I see it inherited from the recipes is it very clear
what it will be providing.

Bruce

> 
> Variable nomenclature is aligned with xen documentation.
> https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
> 
> Currently it supports Xen Dom0 boot and can be extended for DomU
> or Dom0less boot.
> 
> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> ---
>  classes-recipe/xen-u-boot-scr.bbclass | 43 +++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 classes-recipe/xen-u-boot-scr.bbclass
> 
> diff --git a/classes-recipe/xen-u-boot-scr.bbclass b/classes-recipe/xen-u-boot-scr.bbclass
> new file mode 100644
> index 00000000..df8287e1
> --- /dev/null
> +++ b/classes-recipe/xen-u-boot-scr.bbclass
> @@ -0,0 +1,43 @@
> +# Copyright (C) 2024, Advanced Micro Devices, Inc.  All rights reserved.
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +# This bbclass defines u-boot script variables required for xen boot which can be
> +# inherited u-boot boot scripts recipes and also allows to configure these variables
> +# from recipes, global and machine configurations files.
> +
> +# Variable nomenclature is aligned with
> +# https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
> +
> +# Image Load Address for Xen Dom0 boot
> +KERNEL_LOAD_ADDRESS ??= "0x00400000"
> +XEN_LOAD_ADDRESS ??= "0x00200000"
> +DEVICETREE_LOAD_ADDRESS ??= "0xC000000"
> +RAMDISK_LOAD_ADDRESS ??= "0x2600000"
> +
> +# Xen boot image types.
> +# KERNEL_IMAGETYPE: Specifies DomU kernel image file to be loaded by u-boot.
> +# XEN_IMAGETYPE: Specifies xen hypervisor binary to be loaded by u-boot.
> +#                Example: xen or xen.efi or xen.gz
> +# DOM0_RAMDISK_IMAGETYPE: Specifies DOM0 ramdisk to be used, Example: cpio.gz
> +XEN_IMAGETYPE ??= "xen"
> +DOM0_RAMDISK_IMAGETYPE ??= "rootfs.cpio.gz"
> +
> +# Set the amount of memory for dom0 depending on total available memory size(DDR).
> +DOM0_MEM ??= "256M"
> +
> +# Specify which UART console Xen should use. You can sepecify the devicetree
> +# alias or full path to a node in the devicetree
> +# XEN_SERIAL_CONSOLES = "/soc/serial@7e215040" or
> +# XEN_SERIAL_CONSOLES = "serial0" or
> +# XEN_SERIAL_CONSOLES = "/axi/serial@ff000000"
> +XEN_SERIAL_CONSOLES ??= "/soc/serial@7e215040"
> +
> +# Specify additional command line arguments used for Xen and this will be appended
> +# to xen-bootargs cariable. This can also be used for passing debug cmd line arguments.
> +# Examples: XEN_CMDLINE_APPEND ?= "sched=credit loglvl=all guest_loglvl=debug"
> +XEN_CMDLINE_APPEND ??= "sync_console bootscrub=0"
> +
> +# Specify the max number of vcpus for dom0
> +# Example usage: DOM0_MAX_VCPUS = "2" or DOM0_MAX_VCPUS = "2-4"
> +DOM0_MAX_VCPUS ??= "1"
> -- 
> 2.34.1
> 

