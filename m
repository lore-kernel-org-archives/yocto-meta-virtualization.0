Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E29F106ACDA
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 18:44:21 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.126.1773341053019108105
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 11:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LxrnWUHN;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-89a1d7cc7f0so12435196d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Mar 2026 11:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773341052; x=1773945852; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N89HMtKGp8RnO5ZjbgWb04MW50sh7jxjkDh6sKwVMBQ=;
        b=LxrnWUHNDkNvKRE+nz+KwxzFo4CpG/1rI4CGM6WdNsttBZ+dWVVEb3u9s1x3zKS4EW
         iWws2yJC1cJ5D325VFUpewsF28kPmMiREHwuLUkG17sMSpMGX6UOhCdRYHDamjMU30sW
         K8iFgqD255nudOOV+fIzo2liVxy292OMjxhrt2dwY3bfWMjnZ3Cen4r+utlDWxUT22dA
         NM+RuEgGSNn1e6LiWyjAyVYnyTt4n/jKKculXabpsBFXzsWsmM4ZCLZpKNZVsoU7PIrR
         OGmYH8PnDKApeOo/hkbWQ4YxwCW7OmkM19g5ofMY7pjd9v500U+t7dYfl2flNGBsaFKu
         TbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773341052; x=1773945852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N89HMtKGp8RnO5ZjbgWb04MW50sh7jxjkDh6sKwVMBQ=;
        b=OZrnvHMFmtyqFzxN4SwH518vN1i+G+1GC1BvGgJL+MkUqPmqbqxRejGfZTSF9po3x1
         qQOboiEX4J4Y/NqpGuqBykOIrFdYCGNxJEqprn4oq2/HL+JPRBhALBx3gLLSUPMAmq2b
         13qDTGdB/ljoDJQ9I1yFv1lEkQ7OB4q1c8H1FVrTeH8xVcpVsr3GYeJ4uQQC1Wau32Zd
         uSxK3T47EXV1Z+7FPZvIMLx/IoLn3y3u1T3VKFET+AfsS3RpNsB72j4i7eRVW+BJ6yaV
         QaNQWOpY2a5/yuXupD/d/c3QQfHNkWZl5+rOUYqrf8FJ1t5N5CVHyglq6fk90N852QSM
         GtZw==
X-Gm-Message-State: AOJu0Yw0GCO3V95Wi3ggHbz9mmEsEfZsVtjrupev8JY7YtxxkT/3nWkM
	wzSzBy6JEbn3zqlcDVL/VfggwUx6azVXpyGPqzlRTyH3X9VGNbZdL/5j
X-Gm-Gg: ATEYQzwLiCN8kPoxVyCs+5FPH+CXYS0+Z6QB9EJyjPXekGxjVOgzj5T8fxEWNdDNTee
	pK2EKv9I+Kl6f7jkkmtL14SvW3kCeDVamJoABzeBz/yy+X23nJW2GDCnqy20TJXayFFRow8RwgL
	42YthSmXtvcRnIb2KtR/+W2zMU4osFrehMgmZimUWPrA8bsJc0SMYtwt60I/mEsYqjzs03pMwum
	u5kEMSCL9pswe4OYo2mJoQUWIwLfelpUd5JLEdYBSrQalBkja2i9AnvHPW1a3UQCsRPNYxW0iKD
	3scvMIuSdp8jTtTyDm/GmXSMcP58HD9nLgWhPCd1lbg2iUih3nMNWAlD79S0DoV9DBr99pFnNn8
	ptz4x2IX7JkGhVwVGc2qsuwz3dkUcByxtk+T5URblETYrwuVKGmNu4hnZA0NpJTxxAFLVS9VOZb
	GH74zL210MbDfQ6LJ95gW2rQkIya1yKUjCFs56vBeHsn/HmvPPu6Y4xJEJ6E9i2KXfDefS4IIaO
	cNcOshKb4w+b0i1znWtYLxm3YiYcukmFuiv
X-Received: by 2002:a05:622a:48f:b0:506:a624:1939 with SMTP id d75a77b69052e-50957e2c901mr7037511cf.51.1773341051661;
        Thu, 12 Mar 2026 11:44:11 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65beb131sm38331756d6.13.2026.03.12.11.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 11:44:11 -0700 (PDT)
Date: Thu, 12 Mar 2026 18:44:09 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: yongxin.liu@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] yocto-cfg-fragments: update to
 6.18.16
Message-ID: <abMJeXGN2AWIVTwQ@gmail.com>
References: <20260311010758.3694874-1-yongxin.liu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311010758.3694874-1-yongxin.liu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Mar 2026 18:44:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9651

In message: [meta-virtualization][PATCH] yocto-cfg-fragments: update to 6.18.16
on 11/03/2026 yongxin.liu@windriver.com wrote:

> From: Yongxin Liu <yongxin.liu@windriver.com>
> 
> Due to the introduce of kcfg-sysroot in commit a4625a1fa275
> ("kernel: inject local search path to fragment processing"), old
> yocto-cfg-fragments can overwrite the latest yocto-kernel-cache during
> kernel build.

I haven't merged this yet, since I'm trying to come up with
a new way to make these fragments available, but not come
first in the search path, so as to not clobber the ones in
a kernel with a meta= SRC_URI entry.

There's a lot of corner cases and testing, so it is taking
me a bit longer.

Bruce

> 
> Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> ---
>  recipes-kernel/linux/yocto-cfg-fragments-6.18.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-kernel/linux/yocto-cfg-fragments-6.18.bb b/recipes-kernel/linux/yocto-cfg-fragments-6.18.bb
> index e54c1139..7578cd26 100644
> --- a/recipes-kernel/linux/yocto-cfg-fragments-6.18.bb
> +++ b/recipes-kernel/linux/yocto-cfg-fragments-6.18.bb
> @@ -15,7 +15,7 @@ INHIBIT_DEFAULT_DEPS = "1"
>  LINUX_VERSION ?= "6.18"
>  PV = "v${LINUX_VERSION}+git${SRCREV}"
>  
> -SRCREV = "6ab6280418f524cda3e9f30ca0ac4367c58abdcf"
> +SRCREV = "8ef043d5cbfe1d4c6b6b92d6d884d23c4d3411a3"
>  SRC_URI = "\
>          git://git.yoctoproject.org/yocto-kernel-cache;branch=yocto-${LINUX_VERSION} \
>          "
> -- 
> 2.46.2
> 

