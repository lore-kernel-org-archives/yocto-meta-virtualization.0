Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101C6E677E3
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 04:10:27 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.11193.1730520621027327069
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 01 Nov 2024 21:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TyQzE7yM;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b153047b29so183778385a.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 01 Nov 2024 21:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730520620; x=1731125420; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BSuNaWKfIaQa4UakFKTsT8S7vBVLwl5QU4DRb4WwYGU=;
        b=TyQzE7yMMt/OVaDS8n0EtPIbvTyq4HVutJd62E3rnosnj1AnMUyp7FqWuvFS9ZGcT+
         rkCPH69vxgUgH0D7HQgoRnSySlGQPKl6o2G9nZVwZcREy0W/h8AcDkabe7/XjI9LTn44
         a2AmSC/McdgWMnpL9CxHnyJlGPZPiHIOBt7LmNlq1alU0FfivUgeRUPTPloIYcMGDG6O
         +bLgKEu9liG2HOE18t9tnhlocCX6Tlkhx70CF5hPPPQsX5bFPnnnzd8C/1Ya/LnJf86M
         5IBwNITiaToBzadTnwlX52p8zrWkO5l2I6LpZlUOXuUyjGEChbpIISNLpHTguJRg7O+X
         zhFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730520620; x=1731125420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSuNaWKfIaQa4UakFKTsT8S7vBVLwl5QU4DRb4WwYGU=;
        b=SdrosjRvY4TVkqtb+7vvasPAxy4j2CXCdcjaLEIwb4F+TtcspSSNe9jdDR2G6utoIe
         c4A88P99p/JrHnalSjkGPT1vzgH+0Mci3Y+pXutb4+Oi4H2DhNzAGF9uqUKbZrLdD/Ei
         Xr6yYV8jdXyrmsL3o9YnouvYgEqoJPaEgZ+WcN7uu+6s/DI+GvDIvrcpGxi9GjjbX8B4
         RF/pE67ORMM26NTgvDEUIGD+Aa2lKH2DL05zrKB+uncbtU8kmh1AQUk0uY4z8YYWz4q+
         7N00qa7vfTm5t4/c+TFHSIgPzZeEKBgyMujxKAr0SM3enPtn0GpClcTMewWrdmm4+WcO
         Or9g==
X-Gm-Message-State: AOJu0Yw8zBl6QXsPy3Spt5+IQbR6bYjPHL0Pm0HzMrvqVdAs1z+gFHYn
	kzh6Z+idNv8cU3mYy28PciL0rWi3wNTb6Wksm41B9ccwNohj1RTczrWvNA==
X-Google-Smtp-Source: AGHT+IEXBdzGGKloTf3V4ce0vJWYm+iCvq+r6Ljvg4HcMCurpKauVpPSWJwhoGuU16hOTIraap9lHQ==
X-Received: by 2002:a05:620a:24c6:b0:7a9:b021:ee6 with SMTP id af79cd13be357-7b193ed7ee4mr3282139085a.11.1730520619968;
        Fri, 01 Nov 2024 21:10:19 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ad19b963sm25079601cf.80.2024.11.01.21.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 21:10:19 -0700 (PDT)
Date: Sat, 2 Nov 2024 00:10:17 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Divya.Chellam@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH 1/1] runc-docker: upgrade
 1.1.12 -> 1.1.14
Message-ID: <ZyWmKZoEleitHu+z@gmail.com>
References: <20241016110225.1487727-1-divya.chellam@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016110225.1487727-1-divya.chellam@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 02 Nov 2024 04:10:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8953

merged.

Bruce

In message: [meta-virtualization][scarthgap][PATCH 1/1] runc-docker: upgrade 1.1.12 -> 1.1.14
on 16/10/2024 dchellam via lists.yoctoproject.org wrote:

> From: Divya Chellam <divya.chellam@windriver.com>
> 
> Includes fix for CVE-2024-45310 and other bug fixes
> 
> Changelog:
> ==========
> https://github.com/opencontainers/runc/blob/v1.1.14/CHANGELOG.md
> 
> Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
> ---
>  recipes-containers/runc/runc-docker_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
> index 8d078e85..c00eaf39 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -2,13 +2,13 @@ include runc.inc
>  
>  # Note: this rev is before the required protocol field, update when all components
>  #       have been updated to match.
> -SRCREV_runc-docker = "a9833ff391a71b30069a6c3f816db113379a4346"
> +SRCREV_runc-docker = "2c9f5602f0ba3d9da1c2596322dfc4e156844890"
>  SRC_URI = "git://github.com/opencontainers/runc;branch=release-1.1;name=runc-docker;protocol=https \
>             file://0001-runc-Add-console-socket-dev-null.patch \
>             file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
>             file://0001-runc-docker-SIGUSR1-daemonize.patch \
>            "
>  
> -RUNC_VERSION = "1.1.12"
> +RUNC_VERSION = "1.1.14"
>  
>  CVE_PRODUCT = "runc"
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8930): https://lists.yoctoproject.org/g/meta-virtualization/message/8930
> Mute This Topic: https://lists.yoctoproject.org/mt/109041586/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


