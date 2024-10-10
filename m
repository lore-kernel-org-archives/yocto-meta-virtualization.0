Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CC3CF11F4
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 13:17:40 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.43210.1728566253091328401
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 06:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bbEdUKqj;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6cbc08e7495so7415216d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Oct 2024 06:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728566252; x=1729171052; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7s/LxW+p2wV7z/sPqwvc3j4r19+A5AQqcy4nwgLVCqY=;
        b=bbEdUKqjDeQWtxTk7qdPK5+f0rPqh5ZvwcO6jSfsH+xneeqgJTenOozeWNyvj8t/7B
         +mFbWxVAd+TVijs/+pyW3u67hdhs62AHiOC+uBvR9lXwXR8mzFR8iwL2uiPnqpgctly1
         uvtSn7yhLHr1bKAPFRNUmp/weApdqLBW67HQG+TAtNhvkf/HcOGxZgb1Bdl73whJvH3N
         aDkYyfs2r/+h9oB+i4yt3NDMg1EtGn0/73SVKFlhwWYP/8LSXl6KvgRTyw9ZyXtDF1L7
         bSbtJTGd/imZKDdMN/883nAmvizoyu2ey2TL5Wv+PDR+uulUT0879UDZKrp6r/bdH+L/
         vs6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728566252; x=1729171052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7s/LxW+p2wV7z/sPqwvc3j4r19+A5AQqcy4nwgLVCqY=;
        b=O8wc9fZeTNytSc8nJVwmCo7+vmJGpub4VZ/ewup4D6kgpCMd8QvI3VAPqi/dou0b58
         S6s1UazPcholZiTSiF3ZvwRHc5eJ2KYy7S2AXYoqYbbF/Rgbw0JLJPcwlgmsRinJMQyX
         6nR2DPScmUsvFtCoJdyWk8cDTPKgmLOYRH0/IxQjRkkEyaL3Fl+3WbtskwWCsCPuaf+M
         RXsXeqtFXSH5DZ4Nu9qMtq+/scYrKX/HcX7ndXlNkUo9GKBU01Hoggn7JvQR6Z5tuCiN
         0ayabRdou1LoQTiCJD7tmq7RqHVt5Uw6IT8mk5XrILgqfZ1sg8e//nuxzU8P2lFIbE9o
         z89g==
X-Gm-Message-State: AOJu0YwmGLg4e6C/3Lni0QpiyY6KF6HrOZU7LSqIHAa3NwglUc62qVmO
	M1QV1LdMZhKAsWyHh9HHSV1mdj/9/IGnhZCUk6/ancvUGXsU7SFw
X-Google-Smtp-Source: AGHT+IFZ5ywnw7LZmGLqDEFjgWftAhmc3zecc5XacgHu3sYcil1EZ7UtWDXhLWtcnKfCIrbtD+ymoA==
X-Received: by 2002:ad4:4431:0:b0:6cb:d63c:e38 with SMTP id 6a1803df08f44-6cbd63c0fd3mr50866556d6.30.1728566252096;
        Thu, 10 Oct 2024 06:17:32 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe85d8f85sm5230746d6.74.2024.10.10.06.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 06:17:31 -0700 (PDT)
Date: Thu, 10 Oct 2024 13:17:30 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: mark.hatle@kernel.crashing.org
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH]
 linux-yocto_virtualization.inc: If using externalsrc adjust dependency
Message-ID: <ZwfT6m8YpLYe4w+9@gmail.com>
References: <1727908743-22316-1-git-send-email-mark.hatle@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1727908743-22316-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Oct 2024 13:17:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8926

merged (and typo fixed)

Bruce

In message: [meta-virtualization][scarthgap][PATCH] linux-yocto_virtualization.inc: If using externalsrc adjust dependency
on 02/10/2024 Mark Hatle via lists.yoctoproject.org wrote:

> From: Mark Hatle <mark.hatle@amd.com>
> 
> When using externalsrc, the system will disable a number of tasks such as
> do_validate_branches, do_unpack and do_patch.  The do_kernel_metadata task
> is configured to run after do_validate_branches do_unpack and before
> do_patch.  Since all of these have been removed, the task will never
> run.
> 
> The do_kernel_metadata task is responsible for populating the
> recipe-sysroot-native/kcfg directory via it's own dependency to
> yocto-cfg-fragments-native:do_populate_sysroot.
> 
> Without do_kernel_metadata running, do_kernel_configme will fail to run
> with errors like:
>   ERROR: linux-xlnx-6.6.40+git-r0 do_kernel_configme: Feature '../recipe-sysroot-native/kcfg/cfg/virtio.scc' not found, this will cause configuration failures.
>   ERROR: linux-xlnx-6.6.40+git-r0 do_kernel_configme: Check the SRC_URI for meta-data repositories or directories that may be missing
>   ERROR: linux-xlnx-6.6.40+git-r0 do_kernel_configme: Set KERNEL_DANGLING_FEATURES_WARN_ONLY to ignore this issue
> 
> Fix this issue by detecting if we're running with externalsrc, and then
> adding the task do_kernel_metadata (from the current recipe) as a
> dependency of do_kernel_configme.
> 
> To reproduce th original issue:
> 
>   $ . ./oe-initbuild-env
>   $ bitbake linux-yocto -c patch
>   $ cp -r tmp/work-shared/<machine>/kernel-source linux-yocto
> 
>   edit the conf/local.conf adding:
>   DISTRO_FEATURES:append = " virtualization"
>   INHERIT += "externalsrc"
>   EXTERNALSRC:pn-linux-yocto = "${TOPDIR}/linux-yocto"
> 
>   $ rm -rf tmp
>   $ bitbake linux-yocto -c menuconfig
> 
> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> ---
>  recipes-kernel/linux/linux-yocto_virtualization.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/recipes-kernel/linux/linux-yocto_virtualization.inc
> index 9a6554d..f0ec80c 100644
> --- a/recipes-kernel/linux/linux-yocto_virtualization.inc
> +++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
> @@ -49,6 +49,12 @@ KERNEL_FEATURES:append = " ${KERNEL_CACHE_FEATURES}"
>  # features can be enabled via the fragments
>  do_kernel_metadata[depends] += "${@['', 'yocto-cfg-fragments-native:do_populate_sysroot'][(bb.data.inherits_class('kernel-yocto', d))]}"
>  
> +# if externalsrc is enabled, do_kernel_metadata dependency on
> +# yocto-cfg-fragments-native won't be run to populate
> +# recipe-sysroot-native/kcfg because do_patch is not run.  Manully add
> +# the dependency to do_kernel_configme for this special case
> +do_kernel_configme[depends] += "${@['', d.getVar('PN') + ':do_kernel_metadata'][(bb.data.inherits_class('externalsrc', d))]}"
> +
>  # xen kernel support
>  # SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
>  KERNEL_FEATURES:append = "${@distro_cond_feature('cfg/xen.scc', 'xen', d )}"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8912): https://lists.yoctoproject.org/g/meta-virtualization/message/8912
> Mute This Topic: https://lists.yoctoproject.org/mt/108789783/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


