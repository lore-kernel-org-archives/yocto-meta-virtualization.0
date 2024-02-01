Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DE5C4828F
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 14:17:52 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.16317.1706797063442036059
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Feb 2024 06:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zy2c1etR;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-68c44100327so4456726d6.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Feb 2024 06:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706797062; x=1707401862; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mWSfD64d0zDXNliwJAq26AOFHq44XQdv3YQBNmD6Bdw=;
        b=Zy2c1etR0e5MSN2ZvgQDBv9lQboQ2V/XbqT2XTgja3LhOJ+xTJaNOTjV+Vo+6cEzW5
         L9S0qX7dki9scnfLVlLTdmkF8Ub5BIuFZxo7/SwTWU8mZYbpDyMiy7pgKQbTq/Q1ngbz
         WdqOFOECARhdFKPepz24WrLcbnT5qlS1zWW2QlS6cFXQY0d5N9RAvhX56bdvQmXGlAm3
         RnTKW8aF2WDHu5U1UW4InkhIl4DZruk128ruHlAl+qdu/SKiN7UWBOLgQGcjoKk4Y40F
         qFWxEG/frpOD9hNMemer0p6TuY9CN2UaTdeecq0eEV5ZwYebvjd9hsaT/sFd7mwvGN9y
         Rh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706797062; x=1707401862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWSfD64d0zDXNliwJAq26AOFHq44XQdv3YQBNmD6Bdw=;
        b=dMJrHXMfOj6YCZ+mdh0kuC6vUmjq5yBBHMs6pMwZtBHXOrGd6B2OMKEcS4AhIkgQL7
         yO4edvxauRTdNRhT4D0591ynokRS6DOzFYJjOWx5FZ+CYQZSYDCI5XRHoYr0M1itrXzu
         lzHRG01c19enUKRHSPTtt7znR6AJaOrybNGW1HPfaCqLVv/QY95mQOwgM6vZ00Unb8lN
         uhEwhsJE6jw8OmnGyHEiKNZWI5Yo4mSDjSgsYLmBxR6f9G2+qHOtnfMsLjADQJuvEJ1B
         M/tPxZZl5CpvWebY78+uOWdxTb1uPZDx6XJDMbsfK08d6GpJbicgCuJiaF8dDJm7MRpS
         X2vQ==
X-Gm-Message-State: AOJu0YwQACsRsgkqHNsQGzP6Hfx6cQNkkW6s7Hu/kj7TxBez6SWgHwG8
	328EWtdKcwIbWBOUNkj8YhJz3A9rnY0uVSIAauijnTJT9UMp9f5I
X-Google-Smtp-Source: AGHT+IEzvZsNFvWYOY4FFiFevVwFBT8e41Xr7gAtzidc6IL/3mLVTduUaE9zb44FcjCHIwFKa9uN+g==
X-Received: by 2002:ad4:5aa4:0:b0:68c:6a65:895f with SMTP id u4-20020ad45aa4000000b0068c6a65895fmr5861309qvg.10.1706797062459;
        Thu, 01 Feb 2024 06:17:42 -0800 (PST)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id om31-20020a0562143d9f00b0068c657e68b6sm2326651qvb.143.2024.02.01.06.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 06:17:41 -0800 (PST)
Date: Thu, 1 Feb 2024 14:17:40 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [nanbield][PATCH]
 containerd-opencontainers: Use RDEPENDS:${PN} instead of RDEPENDS:${BPN}
Message-ID: <ZbuoBDkJ+8w98nCX@gmail.com>
References: <20240130210738.3679348-1-pkj@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240130210738.3679348-1-pkj@axis.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Feb 2024 14:17:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8560

merged.

Bruce

In message: [meta-virtualization] [nanbield][PATCH] containerd-opencontainers: Use RDEPENDS:${PN} instead of RDEPENDS:${BPN}
on 30/01/2024 Peter Kjellerstedt wrote:

> From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> 
> The original purpose of using BPN vs PN in the RDEPENDS was due to
> 32bit multilib issues. Those problems are no longer present, so we
> can adjust this recipe to use the standard PN in rdepends.
> 
> This change avoids the following warning:
> 
>   WARNING: .../containerd-opencontainers_git.bb: Variable key
>   RDEPENDS:${PN} (...) replaces original key
>   RDEPENDS:containerd-opencontainers
>   (  ${VIRTUAL-RUNTIME_container_runtime}).
> 
> if, e.g., RDEPENDS:${PN}:append = " ..." is used in a bbappend or
> bbclass.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  recipes-containers/containerd/containerd-opencontainers_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
> index 78fe694..d365820 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> @@ -98,6 +98,6 @@ INSANE_SKIP:${PN} += "ldflags already-stripped"
>  
>  COMPATIBLE_HOST = "^(?!(qemu)?mips).*"
>  
> -RDEPENDS:${BPN} += " ${VIRTUAL-RUNTIME_container_runtime}"
> +RDEPENDS:${PN} += " ${VIRTUAL-RUNTIME_container_runtime}"
>  
>  CVE_PRODUCT = "containerd"

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8557): https://lists.yoctoproject.org/g/meta-virtualization/message/8557
> Mute This Topic: https://lists.yoctoproject.org/mt/104062968/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


