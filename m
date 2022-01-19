Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 642EDC433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 03:44:12 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.1863.1642563848392947480
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 19:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NaMr8WOE;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id t66so1482500qkb.4
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 19:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=2plwkBepgLtpDdBHzYZBDZNa/JLkEnxuBRfdj/tFoS8=;
        b=NaMr8WOEHWIr738skRsYXsgYtFeNIl/FHsrNb3yTW5IZdF7G1Rl7MNIhdQALw7ANEo
         StCJfEHPh6otrZjzlJyuXMdEnu4clznNm24mFzdhOMyvAHP0PTYk8XDgO9CO/UN07tYN
         FRg57Je+U5edoxopTk15hwSucmt107mC2IEi06jNhHkxSlsvhPg+DOo1aau8f9xTDUtW
         i6VuMJXFoyf84L8Vdl3VON2vX/oZGkjGuTBovbmfKksDiIx0hr2EX4i6TiYdvbdiWFaG
         rt6Cods8+SquKaiCEGLbG1rfpbP9gYEh9twcR8wchUeSJplzFWA7Xc1i033qU4l2Qx7S
         K4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2plwkBepgLtpDdBHzYZBDZNa/JLkEnxuBRfdj/tFoS8=;
        b=4yaKeaVe1xsD63PpPZZZQuQJQqRQzI2YzXG+YDsi+uStdFNzqFNVVe7E32mcdJRKcV
         Y9k1Ie/5IUZJGKok4h6y1P/R4Revb5QLjDVin4bGwKfOP+Bw4OFAOx9j0d1UJHYR0BJm
         ADX6p7wzR2ztctkMoYvZxi6VNNYp/GUlOe0HDgIjYn7d5PA++gAJxKupAYwXIvRPp+T4
         38V6oAO00QnY/Zz67+2AtczS6wqp0eLXn5mvbr70zAuDTweZ2mxhDHV2bXu5ELnd36/w
         /kQR3O3sNFkvc0dpeXZpCKbZWDqlOhI1hfi+X7Bcbkz6pyH44RebWAPiuTCJ4WayGMPT
         4WHg==
X-Gm-Message-State: AOAM531bWyQaVO9UdrcT4lkRD3MLASBE6+9i0kDUPR75hmXjdVKLr3Pb
	nvghwKQmk0hMtKcpeTMSLlQ=
X-Google-Smtp-Source: 
 ABdhPJxCDY9rD3w6zxtW2+2kTQB9vWYTF4zj5eWlJqV+Xfn+78OMRaZ7xtUMi13T/r/r9NHCs7ZRHA==
X-Received: by 2002:a05:620a:4450:: with SMTP id
 w16mr828606qkp.340.1642563847364;
        Tue, 18 Jan 2022 19:44:07 -0800 (PST)
Received: from gmail.com
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 t20sm11019943qto.94.2022.01.18.19.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 19:44:06 -0800 (PST)
Date: Tue, 18 Jan 2022 22:44:05 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Kamil Dziezyk <kamil.dziezyk@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	christopher.w.clark@gmail.com, cardoe@gentoo.org
Subject: Re: [meta-virtualization] [PATCH v3 1/2] xen-tools: Load xen related
 kernel modules during system boot
Message-ID: <20220119034402.GA51854@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113113059.20489-2-kamil.dziezyk@arm.com>
 <20220113113059.20489-1-kamil.dziezyk@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Jan 2022 03:44:12 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7014

merged.

Bruce

In message: [meta-virtualization] [PATCH v3 1/2] xen-tools: Load xen related kernel modules during system boot
on 13/01/2022 Kamil Dziezyk wrote:

> This patch changes the location of xen.conf file, that contains list of kernel
> modules to be loaded during system boot, to "${nonarch_libdir}". This is done
> by removing '--with-systemd-modules-load=' flag from EXTRA_OECONF variable.
> 
> Previous path based on "${systemd_unitdir}" was not considered by default by
> systemd-modules-load.service.
> 
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
> ---
>  recipes-extended/xen/xen-tools.inc | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
> index ca924f4..6e25046 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -653,10 +653,10 @@ FILES:${PN}-xm = "\
>      "
> 
>  FILES:${PN}-xencommons += "\
> +    ${nonarch_libdir}/modules-load.d/xen.conf \
>      ${sysconfdir}/default/xencommons \
>      ${sysconfdir}/init.d/xencommons \
>      ${sysconfdir}/xen/scripts/launch-xenstore \
> -    ${systemd_unitdir}/modules-load.d/xen.conf \
>      ${systemd_unitdir}/system/proc-xen.mount \
>      ${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service \
>      ${systemd_unitdir}/system/xenconsoled.service \
> @@ -744,7 +744,6 @@ SYSTEMD_SERVICE:${PN}-xendomains = "xendomains.service"
> 
>  EXTRA_OECONF += " \
>      --with-systemd=${systemd_unitdir}/system \
> -    --with-systemd-modules-load=${systemd_unitdir}/modules-load.d \
>      --with-initddir=${INIT_D_DIR} \
>      --with-sysconfig-leaf-dir=default \
>      --with-system-qemu=${bindir}/qemu-system-i386 \
> --
> 2.17.1
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6999): https://lists.yoctoproject.org/g/meta-virtualization/message/6999
> Mute This Topic: https://lists.yoctoproject.org/mt/88394698/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization] [PATCH v3 2/2] xen: Clear TUNE_CCARGS for Xen build for aarch64 machines
on 13/01/2022 Kamil Dziezyk wrote:

> Xen build may fail for arm machines that have enabled extra flags,
> that can be enabled only for specific architecture version, e.g. armv8-2a.
> 
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
> ---
>  recipes-extended/xen/xen-hypervisor.inc | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
> index cffd491..81e361f 100644
> --- a/recipes-extended/xen/xen-hypervisor.inc
> +++ b/recipes-extended/xen/xen-hypervisor.inc
> @@ -103,3 +103,7 @@ CROSS_CURSES_LIB += "-L${STAGING_LIBDIR_NATIVE}"
>  # Specify the root dir of the .config file for do_menuconfig and do_diffconfig
>  # tasks
>  KCONFIG_CONFIG_ROOTDIR = "${S}/xen"
> +
> +# Xen is setting all CC flags on its own. Make sure that they are not modified
> +# for aarch64, e.g. with architecture-specific optimizations.
> +TUNE_CCARGS:aarch64=""
> --
> 2.17.1
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7000): https://lists.yoctoproject.org/g/meta-virtualization/message/7000
> Mute This Topic: https://lists.yoctoproject.org/mt/88394702/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



