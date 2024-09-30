Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BD5CCFA16
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 18:43:23 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.62773.1727721801929428302
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 30 Sep 2024 11:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xtvl99ON;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6cb2458774dso34589476d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 30 Sep 2024 11:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727721801; x=1728326601; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UQAQHsY2Hk/fbYdMEObqPrzRkl07hgUuSYYjpDmV9qI=;
        b=Xtvl99ONAv/lERIPieXyYqJ8cc4aujzKeB3ubRN0/HfiejM330ML/oF16iDUmZr2BW
         1qobCtboi2hOJAeUGDPt9aJAm5yZGkwqXlKv1azs7ScCEx1gsvcb7uhftzDXNfYHJK/K
         0AM1LqUIWfCnzm6h5zF4PFP1NOBG7mbhGosWAFrONMy1KSH/2XnMGfC1QHs8kfdRlytj
         ARcQ5yeklVfMGO3DchtDkIfj20wpTjpRAw4puUrifMjozEXahrtYho7fdFsRwpxP9tMY
         l8l3KdPzdjdMTjvbLImX3UruKhMRptsWXmTmaDBpjjot/GwTfm19AavT9ZBceCd9cIw+
         1vZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727721801; x=1728326601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQAQHsY2Hk/fbYdMEObqPrzRkl07hgUuSYYjpDmV9qI=;
        b=FSr7IcU5VLu/KjJXr7ek8WGSqQpEO6vVxOfVcsOVzaOI0H+IGE81h18109W1QL/Sre
         0LhO+emYPqZ9tYhE4tiJvdx6v0YCzK70K68q55Qjng5drr9GISIYe69u2c21koXw/MJB
         TdRYPqqmZUTorHNgfBme2+L21XidARrT+B2y2RoxvEK2+5ICRO1e7YFy/p8rUFGMFaPT
         9BrcoiTWK2iFJXplOd2XMAamOIiV+lSopcyN4CzwlY7CpAkjiZRPBJEDS+Ve5P3xphMu
         m1Tv0KV0duwrXDpQybynV+WiuCCqD6Xpjxzt1jR4bmII2v20Y+iWo1uQFhFxsr10+95e
         9ChA==
X-Gm-Message-State: AOJu0YyUsbjR+qlvIHOd2pg74SdIgraFnG5Nsi2YXVjPlUlV17BbTB0b
	B58w2GW01Pgbnw0rl4axPbffGT1eD5X/ehSLEBrhaOM9IwzKmuEJ
X-Google-Smtp-Source: AGHT+IHbLOyUSrHrnkyWoHfoWVIGxqdinFwTlclF+vYWM/epR69mPml6chgyi0X7vBqHV8FzMblEZQ==
X-Received: by 2002:a05:6214:3bc3:b0:6cb:4e86:bb53 with SMTP id 6a1803df08f44-6cb4e86bc21mr156557256d6.43.1727721800891;
        Mon, 30 Sep 2024 11:43:20 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b681749sm42271096d6.123.2024.09.30.11.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 11:43:20 -0700 (PDT)
Date: Mon, 30 Sep 2024 18:43:18 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	mark.hatle@kernel.crashing.org
Subject: Re: [meta-virtualization][master][scathgap][PATCH] device-tree:
 Rename EXTRA_OVERLAYS to EXTRA_DT_INCLUDE_FILES
Message-ID: <ZvrxRiQoiRmJCVmx@gmail.com>
References: <20240928000622.586832-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240928000622.586832-1-sandeep.gundlupet-raju@amd.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 30 Sep 2024 18:43:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8903

In message: [meta-virtualization][master][scathgap][PATCH] device-tree: Rename EXTRA_OVERLAYS to EXTRA_DT_INCLUDE_FILES
on 27/09/2024 Sandeep Gundlupet Raju wrote:

> Rename EXTRA_OVERLAYS to EXTRA_DT_INCLUDE_FILES as these variables
> are renamed in device-tree recipe.

Which device tree recipe is that ? We should include a link to that
base recipe in this commit, so that others will know which one we
are tracking.

I checked meta-virt and OE-core and didn't see any variable renames.

Other than that, no concerns with this patch.

Bruce

> 
> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> ---
>  .../device-tree/device-tree.bbappend          | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend b/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
> index e235826..813c08f 100644
> --- a/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
> +++ b/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
> @@ -3,17 +3,17 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
>  ENABLE_XEN_DTSI ?= ""
>  ENABLE_XEN_QEMU_DTSI ?= ""
>  
> -XEN_EXTRA_OVERLAYS = ""
> -XEN_EXTRA_QEMU_OVERLAYS = ""
> +XEN_EXTRA_DT_INCLUDE_FILES = ""
> +XEN_EXTRA_QEMU_DT_INCLUDE_FILES = ""
>  
> -XEN_EXTRA_OVERLAYS:zynqmp = "zynqmp-xen.dtsi"
> -XEN_EXTRA_QEMU_OVERLAYS:zynqmp = "zynqmp-xen.dtsi zynqmp-xen-qemu.dtsi"
> +XEN_EXTRA_DT_INCLUDE_FILES:zynqmp = "zynqmp-xen.dtsi"
> +XEN_EXTRA_QEMU_DT_INCLUDE_FILES:zynqmp = "zynqmp-xen.dtsi zynqmp-xen-qemu.dtsi"
>  
> -XEN_EXTRA_OVERLAYS:versal = "versal-xen.dtsi"
> -XEN_EXTRA_QEMU_OVERLAYS:versal = "versal-xen.dtsi versal-xen-qemu.dtsi"
> +XEN_EXTRA_DT_INCLUDE_FILES:versal = "versal-xen.dtsi"
> +XEN_EXTRA_QEMU_DT_INCLUDE_FILES:versal = "versal-xen.dtsi versal-xen-qemu.dtsi"
>  
> -XEN_EXTRA_OVERLAYS:versal-net = "versal-net-xen.dtsi"
> -XEN_EXTRA_QEMU_OVERLAYS:versal-net = "versal-net-xen.dtsi versal-net-xen-qemu.dtsi"
> +XEN_EXTRA_DT_INCLUDE_FILES:versal-net = "versal-net-xen.dtsi"
> +XEN_EXTRA_QEMU_DT_INCLUDE_FILES:versal-net = "versal-net-xen.dtsi versal-net-xen-qemu.dtsi"
>  
> -EXTRA_OVERLAYS:append = "${@' ${XEN_EXTRA_OVERLAYS}' if d.getVar('ENABLE_XEN_DTSI') == '1' else ''}"
> -EXTRA_OVERLAYS:append = "${@' ${XEN_EXTRA_QEMU_OVERLAYS}' if d.getVar('ENABLE_XEN_QEMU_DTSI') == '1' else ''}"
> +EXTRA_DT_INCLUDE_FILES:append = "${@' ${XEN_EXTRA_DT_INCLUDE_FILES}' if d.getVar('ENABLE_XEN_DTSI') == '1' else ''}"
> +EXTRA_DT_INCLUDE_FILES:append = "${@' ${XEN_EXTRA_QEMU_DT_INCLUDE_FILES}' if d.getVar('ENABLE_XEN_QEMU_DTSI') == '1' else ''}"
> -- 
> 2.34.1
> 

