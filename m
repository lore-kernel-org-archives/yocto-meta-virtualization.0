Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F382CF11F2
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 13:14:00 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.42944.1728566030860376599
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 06:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dXvf50tM;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6cbce9e4598so6381646d6.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Oct 2024 06:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728566030; x=1729170830; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pYY7PAM9MSz01BStLYqlnHZQKN0rTOxzn1sx++zPnG0=;
        b=dXvf50tM79GowN42AAzb3M3dUf1DtRAfvNeBD7t6yEIc1alxGf2yGR/hxDEn4MRtPM
         F/ass0rmBX2vjEZvMl7KXAkHlpcLkboLOFNsii8vCwV09dcYs5sRVlu8RhWBuX+QGtED
         i3ZviP7VlYf4QAH4FOBgQgK2XapNXALymt2RMY883mhBu3E0N3V71xvvdu0uAMQCIMBY
         LOzvY9r+AT8fGlc74/xJcAby38u+RwwafjUYOQiVASN38lYofC7C93WNdjupfd1uMiHZ
         3N4v3VEyUUvaUNEViqOu1XQJWXqPfhesvMIocP+weW1bi1p7G37nwAzMGkM1PvrSERbT
         78iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728566030; x=1729170830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYY7PAM9MSz01BStLYqlnHZQKN0rTOxzn1sx++zPnG0=;
        b=IuCBud8YSIyHuk+IPvb/+MWFFzIg0MIGUYeAapUpgAE1c0PGRbmBBqABSQiCcyslRS
         EIE5RbwJEQkxvQmvtAUmzVL7aX5e2YFdNr/A/olRcjdgtcdGrhW53ORp7dqep9OXAWqo
         g4DJDabWBeGTI+pPLumVKI0MDm5vqenLKarzgsmxE1R2CoLrWFfxQ7yGep9ByzirFaKb
         r512JugHVAsq+HVGECMQO1Ecd/YjTnuS8HZmdcrQgOpszvY0Z0Oi87k9XZwUjpnPl41V
         BYtOeHDxH5DAQsR/iWBfiH0qAND+WB/S5EkoDiudACWsdru3VxIIl1ZAhzV4uOsnXB/g
         mzLw==
X-Gm-Message-State: AOJu0YxDrG4UH3LnAJtTUblJJlqR7FX9rJ0t0Vl8wJNHjBhcEfR9HDbA
	vUKas8gUQDIvZXtpgDLNp27X92zRCe3ev8IJsUfsspeCWPfPCMUi
X-Google-Smtp-Source: AGHT+IF+DuZDAJxdulrfL3/7chk/LRxhXKt5JiIGAUyFHvk8js9silLfQjaJ7ZSxYa9NdFl7aKUoRQ==
X-Received: by 2002:a05:6214:448b:b0:6cb:ee0b:47ba with SMTP id 6a1803df08f44-6cbee0b4941mr507366d6.10.1728566029778;
        Thu, 10 Oct 2024 06:13:49 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe860b783sm5151526d6.83.2024.10.10.06.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 06:13:49 -0700 (PDT)
Date: Thu, 10 Oct 2024 13:13:47 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	mark.hatle@kernel.crashing.org
Subject: Re: [meta-virtualization][master][scarthgap][PATCH v3] device-tree:
 Rename EXTRA_OVERLAYS to EXTRA_DT_INCLUDE_FILES
Message-ID: <ZwfTCySOu7KpnEa6@gmail.com>
References: <20241008201403.2660125-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008201403.2660125-1-sandeep.gundlupet-raju@amd.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Oct 2024 13:14:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8924

merged.

Bruce

In message: [meta-virtualization][master][scarthgap][PATCH v3] device-tree: Rename EXTRA_OVERLAYS to EXTRA_DT_INCLUDE_FILES
on 08/10/2024 Sandeep Gundlupet Raju wrote:

> Rename EXTRA_OVERLAYS to EXTRA_DT_INCLUDE_FILES as these variables
> are renamed in https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-bsp/device-tree/device-tree.bb
> recipe.
> 
> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> ---
> Changes in 3:
>    - Update merge branch.
> 
> Changes in v2:
>    - As per Bruce comments add link to device-tree recipe so that others
>      will known which one we are tracking.
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

