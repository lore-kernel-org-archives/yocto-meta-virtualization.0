Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5240CC77B7A
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 13:46:14 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.49757.1685367969633739140
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 May 2023 06:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mv5U0NzZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-75ce1196bd7so53235585a.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 29 May 2023 06:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685367968; x=1687959968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0s63vcmGWTlQmukvRPK7WEbJIBq0ZneEWRKdDqXu4lo=;
        b=mv5U0NzZ1au4UymT+mA9IUbbzqYnQu+O5vGNNtxWFXkUcFn6rcAP3OZEvR0iemet1t
         mR26Pwsfq31Mu07cosIBz1CTRZon4YhI5a9USsZdbFgaxrL0U7Whj1lL+U5gfTnUb0+z
         aT9EqBhYg+lj6+om76V1Fk79SBeBqWDbZeWMEB0jzhVs439Ko4h/L9t2XN+mCtrwoBzN
         PQ6/GxyuhN/mvHz5eyAXW+bsT1wrMfmSm9TWyeKUzAwF8DAWRosSE4VrqHmgFl44ckBJ
         xVXwCavsg72u/6mrpus7mVm7lLiVnf+r4+mw3c4CGy32TAKCN13HXtFGOWGGX4FSGihZ
         6BlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685367968; x=1687959968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0s63vcmGWTlQmukvRPK7WEbJIBq0ZneEWRKdDqXu4lo=;
        b=jP89Xr31S15nPZhKe3T59moZI51GvFSIozK4ZMq8NMpNtR4vhfD4Ka8nkTTe8t/i3y
         qoJ2JpxXQyqPkKcIbozh1cwdIBV7kiGjTCxSEdvnSpm6zB5QY34vfnoniHz0dxIelLI1
         xW15H0Mvf0H8o6JxV+odrh7X+Y6qiRfLlb4eW+lBDCLbK0elnGYeRBca9y4WjHetxsyl
         tiawCYhFsP0RZmXDyeKindwVd9JEk+vylraPXeDrbo0SCiI5KeaMRXyBcrHtk9cuV4JT
         gXHenksj+ikHedzV1vp0+zueQ3T2++alCBqgzAzIPwu1gsQVi4DpcdelvXzBgP9hEw2x
         WG6g==
X-Gm-Message-State: AC+VfDytHYi3uqfSdKUq4VgTwQQ1ppoYZqq5yFSiXvX7AHsiL9kzlnny
	TEyUKdcsJab2xA/fVemCVrc=
X-Google-Smtp-Source: ACHHUZ4juS7+hlBLnXIwjofClefwFztuHMpgz3kcOnEbHvXsqLa0e2iNw4uUjTVQJ302oDaU7HvgBg==
X-Received: by 2002:a05:620a:2b82:b0:75b:23a0:d9ec with SMTP id dz2-20020a05620a2b8200b0075b23a0d9ecmr7466287qkb.66.1685367968562;
        Mon, 29 May 2023 06:46:08 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id f5-20020a05620a068500b00759554bbe48sm3371188qkh.4.2023.05.29.06.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 06:46:07 -0700 (PDT)
Date: Mon, 29 May 2023 09:46:06 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] rpi: linux-yocto: drop 5.15
 bbappend
Message-ID: <ZHSsnvXTbU/ONWzv@gmail.com>
References: <20230526173636.3039823-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526173636.3039823-1-Martin.Jansa@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 29 May 2023 13:46:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8085

I'm back from holidays and sorting things out now.

This is merged to master.

Bruce

In message: [meta-virtualization] [PATCH] rpi: linux-yocto: drop 5.15 bbappend
on 26/05/2023 Martin Jansa wrote:

> * 5.15 recipe was dropped from oe-core in:
>   https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=e30b37776d16cfd4ce7f79746427ccd95b306059
> ---
>  .../recipes-kernel/linux/linux-yocto_5.15.bbappend          | 6 ------
>  1 file changed, 6 deletions(-)
>  delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.15.bbappend
> 
> diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.15.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.15.bbappend
> deleted file mode 100644
> index 572f7ec..0000000
> --- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.15.bbappend
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -# Enable use of the linux-yocto 5.15 kernel for the Raspberry Pi 4
> -KBRANCH:raspberrypi4-64 ?= "v5.15/standard/bcm-2xxx-rpi"
> -KMACHINE:raspberrypi4-64 ?= "bcm-2xxx-rpi4"
> -COMPATIBLE_MACHINE:raspberrypi4-64 = "(raspberrypi4-64)"
> -
> -require linux-yocto_xen-rpi.inc
> -- 
> 2.40.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8076): https://lists.yoctoproject.org/g/meta-virtualization/message/8076
> Mute This Topic: https://lists.yoctoproject.org/mt/99154515/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


