Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169FFCF11F3
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 13:14:40 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.43136.1728566070936133496
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 06:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Di1NuU4j;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5e56759e6d7so481028eaf.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Oct 2024 06:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728566070; x=1729170870; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rkUm8RNkV+J8hX77OHdY4ed90Pdoea5AsYD1GdWBo3w=;
        b=Di1NuU4jWdW7NiTITqwTEbK8O5oNjZnE2B+0rq4DedylSkoXMyttGFBlvVY8xaeOMm
         fnwGROgs/Bixy8Lq6V1HO4bgjbyUJbTG85gvFiwvuLvGX2SMa4M6o900UDJtRx3MBkWQ
         z2ezA0J7+Iu+E/Lk2ezSlOKaXPzR9y13DLS7Il6l130zDnLHaLUWK3rjWpnmI+Cq/j7o
         EsupyzVr2Sd/UBc4tQRiLLLumSWqGkIkpuDdchuN17ClydDiUPamodEGnbcmg3Fm+2EP
         fzNF8FLRDzBPOjDQeEWSlDp6zb9OuPElfDHrMgJLPyIdvkWd+HOYpv0Cs3B+dVQmOWYY
         y6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728566070; x=1729170870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkUm8RNkV+J8hX77OHdY4ed90Pdoea5AsYD1GdWBo3w=;
        b=EWIK15pe6VM3cnZ441ACbrgbNM5kKUOjOMEHCeEIFGmvfmfjprx6hFd/upBz3uySxp
         X/fjU9kZ39VErSIvPKIkZ/gxKTJeV3yztcc4atoKpDn1TYmBFDOUzMBNZ44Ji3AbEIV+
         dQaH7mihcNch2rZp65QjdF1V457yaS9Mg3Hq7iA1+7RyuQP4uI4tMTzELxxhMN5xRc6V
         ejrMW6j1rYuPyBPhnI8LZShwwnhJbPkPfEMohM1IVBNa1TNlVs5ir5Rp88jw8cnGbsfd
         do+7Yb867G+p4UPcM8PAzSrtdf6WpzJSxMZJCMwz8s06F4dYcJhLrbCw/s8Ca/Mr6Ram
         qB9w==
X-Gm-Message-State: AOJu0Ywyk/FMxwXE2U/q5ab9JqvXetJRViXFM3nnjMGY38CRxk0CMCRk
	+LIx0Trc19PtME8g2Co8YWkqEtv1QZwC5Rfb50AVQOzoT8ZDlUuM1L75YQ==
X-Google-Smtp-Source: AGHT+IHCD9D5RNO49qWYOJPK81dM84KK/A+i9bxPO/Js3G6Lhfcrejbm309KL3dFns98BzhBOIMB+w==
X-Received: by 2002:a05:6358:784:b0:1c2:f41e:dbca with SMTP id e5c5f4694b2df-1c3080c3426mr299403055d.7.1728566069745;
        Thu, 10 Oct 2024 06:14:29 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe85b79e9sm5174556d6.32.2024.10.10.06.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 06:14:29 -0700 (PDT)
Date: Thu, 10 Oct 2024 13:14:27 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: mark.hatle@kernel.crashing.org
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][master][PATCH]
 linux-yocto_virtualization.inc: If using externalsrc adjust dependency
Message-ID: <ZwfTM4oSRT8KSS9B@gmail.com>
References: <1727908736-22275-1-git-send-email-mark.hatle@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1727908736-22275-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Oct 2024 13:14:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8925

merged to master

Bruce

In message: [meta-virtualization][master][PATCH] linux-yocto_virtualization.inc: If using externalsrc adjust dependency
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
> index e729c3b2..d678021b 100644
> --- a/recipes-kernel/linux/linux-yocto_virtualization.inc
> +++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
> @@ -59,6 +59,12 @@ KERNEL_FEATURES:append = " ${KERNEL_CACHE_FEATURES}"
>  # features can be enabled via the fragments
>  do_kernel_metadata[depends] += "${KERNEL_CFG_DEPENDS}"
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
> View/Reply Online (#8911): https://lists.yoctoproject.org/g/meta-virtualization/message/8911
> Mute This Topic: https://lists.yoctoproject.org/mt/108789782/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


