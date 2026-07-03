Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351D0C43602
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 13:45:12 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92784.1783086302845988540
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 06:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FKQvinc/;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-517dc520840so3942911cf.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 06:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783086302; x=1783691102; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s0i53TyWXQRcKO6SR2tv5ZaoCSMFax7M1A8yKZHz93I=;
        b=FKQvinc/BT5PY5wQlUZ4rWfLrnFywUxXRwQ0xMa3LJ6DutpKkRmJoiIMvLBxwCQj/9
         RoAd6/SzFR3Vpxq2NKSHcuU/oFdikoRJByjj8nOSSO1dpibxzS6cNhxKuKlfu0KXyb/a
         Hf9eMOB6wHIRbZYKehOaDhm5UqitJw+yTnMwPV0d6gGWIfP4XevioPOD97Mh0u72uwG/
         qTEisKBaPvuO3q/HmrxSbSsLMBEoMzoFW7TsFOed/+N7EMetSG9o9eHar/rSopec9xwn
         gqVcxhqVUOpDqrF9bFbzJv8zKY0CDufZQwtoXgwKfzdo4fNFiC5EyBFWfktIJC1pHWir
         2RsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086302; x=1783691102;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s0i53TyWXQRcKO6SR2tv5ZaoCSMFax7M1A8yKZHz93I=;
        b=af6/LOYM506jMaBMM8ZGClTjFA75z0HxPV9Fpn83wquvor4G9fL9xYLkzzTYUPB5oX
         zIC8/3jkNJCY0x/gb5PyZyYh5HG5KE/vBFx8JfNcPSNypgz7uqM+wB9SqzZYGQA8B/TP
         0dfFKIt1YcszPAG8Bezc6R9R9/fw0ua4WVS5RG3hN55tp7fxRqhD2yrnzGT3BPzjO7XJ
         +kd0qhhm535GWf8M+tc1DxJLrdai2bkxve7SLShSTvKuehJKAxaENJSNj7LXQrtX1xQt
         72heoXZiHGxfRIKok0jc3BaZ7aWG6tFouhKNhFfrrgSl8mslWctnSyGIfNM62GE6Aipm
         fPOg==
X-Gm-Message-State: AOJu0YwXAhr8SxNU3nH+9DicM+vPIVY7mcWSmxgV2+TU58CSZIZkoKxT
	hVTMCpG0v2J56pOLMgzhxHcM7q8sCyrskidHLUC6/ZESfXYfecwbm60cjGAV4w==
X-Gm-Gg: AfdE7cmRYxYlDNmSukFv9BD3fnBwoQccmXFKZoI3nWH+06MGKroRPjZvn6lpw7gVnNB
	4L/iILQbvvvLwE1B6mwdyJvyP2GTtJHSZhtjM/kOLU0/RBaYt0Okey926nbXr5X1/G+YcpLugUc
	fL23vj9voIvS7uM8AyUUh1vFcikJkLTWiDVuwBrjGxoyvnpgfISFgeKP5KcqGa149fT686bWGZE
	MFMk7y/l5CwyRCKt16cg/HS1iIgMWYro3+y+01COAZutG0xdrLzUtrKj63dCTXupCMdk+4dDG/U
	7PP/nFQ9FSKFPRgi2XIq039w0hvdpHa4N/6srI8yevhiyEFdMO68pqXDKXRXSqHPUh6ANE8LE6m
	V+xdIizFb0RsZ+ax1hTzvq5HeIZJyYZMIbMIy5BM1LWAT8trWeKF+R44PPME3ycm8E+hOINOxs1
	IX7GpDB1DIE5KBPPSVKdwmiVRWlswl70Wjf/LYBkmgK0D/cuNVWQp7v2X33r5/67jLojMW2bVyr
	Kjeg9xewF6Ew1z+53C4zps/aWzlQ4dFAqC79FfFhaA4jUuE8TRE57Pf/jxKALGktRK25ZMiypxC
	+tDbP1ql3ZvH9Wmf2qxaNg==
X-Received: by 2002:a05:622a:11ce:b0:51c:1a17:eba4 with SMTP id d75a77b69052e-51c26a4a727mr131820961cf.24.1783086301520;
        Fri, 03 Jul 2026 06:45:01 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f4724bad04sm61379606d6.44.2026.07.03.06.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 06:45:00 -0700 (PDT)
Date: Fri, 3 Jul 2026 09:44:59 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: mingli.yu@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] libvirt: Set COMPATIBLE_HOST to
 64bit arch
Message-ID: <ake8200ueYPGcZqg@gmail.com>
References: <20260616093613.1817112-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616093613.1817112-1-mingli.yu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 13:45:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9913

merged.

Bruce

In message: [meta-virtualization] [PATCH] libvirt: Set COMPATIBLE_HOST to 64bit arch
on 16/06/2026 Yu, Mingli via lists.yoctoproject.org wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> qemu sets COMPATIBLE_HOST to 64bit arch [1], so set the COMPATIBLE_HOST
> accordingly to fix the build failure.
> ERROR: Nothing PROVIDES 'qemu' (but /build/layers/meta-virtualization/recipes-extended/libvirt/libvirt_git.bb DEPENDS on or otherwise requires it)
> qemu was skipped: incompatible with host arm-wrs-linux-gnueabi (not in COMPATIBLE_HOST)
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=f74d4025
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_git.bb | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
> index fb7e5293..837f9660 100644
> --- a/recipes-extended/libvirt/libvirt_git.bb
> +++ b/recipes-extended/libvirt/libvirt_git.bb
> @@ -139,6 +139,11 @@ PACKAGECONFIG:remove:mipsarchn32 = "qemu"
>  PACKAGECONFIG:remove:mipsarchn64 = "qemu"
>  PACKAGECONFIG:remove:powerpc = "qemu"
>  PACKAGECONFIG:remove:riscv32 = "qemu"
> +# QEMU 11.0.0+ requires 64-bit host architecture
> +PACKAGECONFIG:remove:arm = "qemu"
> +PACKAGECONFIG:remove:armeb = "qemu"
> +PACKAGECONFIG:remove:mipsarch = "qemu"
> +PACKAGECONFIG:remove:x86 = "qemu"
>  
>  # numactl is NOT compatible with arm
>  PACKAGECONFIG:remove:arm = "numactl"
> -- 
> 2.54.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9893): https://lists.yoctoproject.org/g/meta-virtualization/message/9893
> Mute This Topic: https://lists.yoctoproject.org/mt/119830656/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


