Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E792D75BB9
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 04:43:10 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.3858.1732164180656318876
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Nov 2024 20:43:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z0A+VlUV;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b1b224f6c6so29916085a.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 20 Nov 2024 20:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732164180; x=1732768980; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8xQov37APhUEf63hTnShrnBqq6NFAalOjD3owFJDTxk=;
        b=Z0A+VlUVmqFfXa4QLCPeWCJ2emF7HakrEskdQ+l4UYrjFGE6fvkEqfma5a7YlH2YBV
         zLu+gJm3Z0nro7CI443I1154adDwE6v0Z0OaZScmbYL1m218UrgVxEPwiJ3xaSLrU746
         iUPRq7Qg7Ksqq8WXnKQ+luBaXr6PnLqKHC0g5WkjigU0dKGQhg7Jr7+cAWbp0UALv7aY
         weDI8xp/cN54WMEN/gU2GnxB/bUiKYTbPg+qVVSYka8345XSL22gm2vYsSKCDXjzThXn
         bQVwal4VSdyeteATPAMwKZmXVNMKRD2scIsImIakK/SR3eT//qQTVwEAyLMJO/D+d5Mr
         pTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732164180; x=1732768980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xQov37APhUEf63hTnShrnBqq6NFAalOjD3owFJDTxk=;
        b=Su89Ol04TyPVoOZUJn0q56+wibArP2UolLnzCnURMAv7dIf5S6fi7K5RDZuOrNL12m
         /pdAV8pq7/JGNPbmMpOP2vKATDT0jGe1dVolaGMYuvu3iZ78h83SHjLFa6hBo7bJwMiP
         znQxRdi/4DwYTwiUwxw9+7AcryK+X8Ad8EeJIvffwIgR7Ww7F/HPyl3bT+dmNv3xKMSN
         XT3QkMzcz5T9VHPXswrLuDnQmDTXZZa9r8ifjkTooCGJNBPM+RA7LUUsXOG1AGn5kRav
         meID+7Vgu5zfUyDhsuHi191dsHpdqoxgisaz/8+5mHyPJ/Q3FdIOQ0AiiN7n7kl708HL
         nJMg==
X-Gm-Message-State: AOJu0YwQATPyVZYsY7PyuqjvXenSuM3bZi/ISa3wjclSqo5ECzJSItiW
	VsI4OFbHbvyqAC3D7tWFpbIosWmQUNDVZohc/6h/PfgLTpJLRwNF
X-Gm-Gg: ASbGncuXWWgMY84dYLas16zoij5MDFl2QfX9Wv14xOvhmERGrUUgXeEdez2u398xdDk
	w725CPRjvIcmd4LEVQjsOclpoKrIA1DuZ8lhuAaARnAf97ELJKvdweK7hSboOp7e4gIKBDNl2oW
	J17mFuaEwqOdlwLKE6VdiuWia7fuKzqjWeX97x6tykE0DsQZIPruRPKJIUCUi37wGr7Cyp6NFpv
	SVlkIyc+Up4Xznkk2nqYKYnb+a+Ey40AsKRniyaboxnyaZV/aLHh0wzZ5NN0x/zwgAlcK5BORsJ
	gsECcvaKAViWB5/pQvXeEhQFcA1E
X-Google-Smtp-Source: AGHT+IGLh0g0Yf4V9Tz1HRlo1leP/6HvcUj701GB0bvTsqmkSh5tOwFdz9B1WvOnGUnjzeHHvRwkXg==
X-Received: by 2002:a05:6214:19c3:b0:6d4:2267:61c2 with SMTP id 6a1803df08f44-6d4377df59cmr65904966d6.15.1732164178103;
        Wed, 20 Nov 2024 20:42:58 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d43812acf9sm18451586d6.82.2024.11.20.20.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 20:42:57 -0800 (PST)
Date: Thu, 21 Nov 2024 04:42:55 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	mark.hatle@kernel.crashing.org
Subject: Re: [meta-virtualization][master][scarthgap][styhead][PATCH 4/6]
 u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen
Message-ID: <Zz66Tw7AuYZ5eTpC@gmail.com>
References: <20241119051203.3841577-1-sandeep.gundlupet-raju@amd.com>
 <20241119051203.3841577-5-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119051203.3841577-5-sandeep.gundlupet-raju@amd.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 04:43:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8992

In message: [meta-virtualization][master][scarthgap][styhead][PATCH 4/6] u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen
on 18/11/2024 Sandeep Gundlupet Raju wrote:

> Include xen-boot-env.inc file if BOOTMODE="xen" and also remove xen
> u-boot boot script variables from xen-boot-cmd.inc.

Is the BOOMODE variable documented somewhere ? In the main
uboot recipes ?

Bruce

> 
> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> ---
>  .../u-boot/u-boot-xlnx-scr.bbappend           |  7 +++-
>  .../recipes-bsp/u-boot/xen-boot-cmd.inc       | 35 -------------------
>  2 files changed, 6 insertions(+), 36 deletions(-)
> 
> diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
> index ec64d246..4e39c316 100644
> --- a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
> +++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
> @@ -1,4 +1,9 @@
> -# Include xen-boot-cmd.inc only if ENABLE_XEN_UBOOT_SCR is set from configuration
> +# Include xen-boot-cmd.inc only if BOOTMODE = "xen" is set from configuration
>  # file and xen enabled in DISTRO_FEATURES.
> +include ${@'xen-boot-env.inc' if d.getVar('BOOTMODE') == 'xen' and bb.utils.contains('DISTRO_FEATURES', 'xen', True, False, d) else ''}
> +
> +# Include xen-boot-cmd.inc only if ENABLE_XEN_UBOOT_SCR is set from configuration
> +# file and xen enabled in DISTRO_FEATURES. xen-boot-cmd.inc is supports multiple
> +# boot modes such as JTAG and SD(ext4 and ramdisk).
>  ENABLE_XEN_UBOOT_SCR ?= ""
>  include ${@'xen-boot-cmd.inc' if d.getVar('ENABLE_XEN_UBOOT_SCR') == '1' and bb.utils.contains('DISTRO_FEATURES', 'xen', True, False, d) else ''}
> diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> index 7a4e41a6..6fccc7b4 100644
> --- a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> +++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> @@ -1,38 +1,3 @@
>  FILESEXTRAPATHS:append := ":${THISDIR}/u-boot-xlnx-scr"
>  
>  SRC_URI += "file://boot.cmd.xen"
> - 
> -# Image offsets for Xen boot
> -KERNEL_OFFSET:zynqmp ?= "0xE00000"
> -KERNEL_OFFSET:versal ?= "0xE00000"
> -
> -DEVICETREE_OFFSET:zynqmp ?= "0xC000000"
> -DEVICETREE_OFFSET:versal ?= "0xC000000"
> -
> -RAMDISK_OFFSET:zynqmp ?= "0x2600000"
> -RAMDISK_OFFSET:versal ?= "0x2600000"
> -
> -XEN_OFFSET:zynqmp ?= "0xBA00000"
> -XEN_OFFSET:versal ?= "0xBA00000"
> -XEN_LOAD_ADDRESS ?= "${@append_baseaddr(d,d.getVar('XEN_OFFSET'))}"
> -
> -# If dom0-ramdisk is used for Xen boot then set RAMDISK image to cpio.gz
> -XEN_IMAGE_NAME ?= "xen"
> -RAMDISK_IMAGE ?= "rootfs.cpio.gz"
> -
> -# Set the amount of memory for dom0 depending on total available memory size(DDR).
> -DOM0_MEM ?= "1500M"
> -
> -# Specify which UART console Xen should use. You can sepecify the devicetree
> -# alias or full path to a node in the devicetree
> -# XEN_SERIAL_CONSOLES ?= "serial0" or XEN_SERIAL_CONSOLES ?= "/axi/serial@ff000000"
> -XEN_SERIAL_CONSOLES ?= "serial0"
> -
> -# Specify additional Xen paramaters which will be appended to xen-bootargs
> -# This can alos be used for debugging purposes.
> -# Examples: XEN_CMDLINE_APPEND ?= "sched=credit loglvl=all guest_loglvl=debug"
> -XEN_CMDLINE_APPEND ?= ""
> -
> -# Specify the max number of vcpus for dom0
> -# Example usage: DOM0_MAX_VCPUS = "2" or DOM0_MAX_VCPUS = "2-4"
> -DOM0_MAX_VCPUS ?= "1"
> -- 
> 2.34.1
> 

