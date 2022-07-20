Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F599C43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 20:05:44 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web09.1990.1658347536843863711
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 13:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k0/OYUPa;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id l3so12376330qkl.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 13:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VHTbZUcDkjaFRlmPdCX74SaoWcomMdU4xSTwwVvTjwU=;
        b=k0/OYUPanps81BlH7uFeyCXdZqix9zB7fp7S0Gri4TD8+6Lr3vUlci+9aSN0gqp6nQ
         qFbUJjvy4A6suDqDCwOFKTNPeSnCpWuHQhX248al9hXtPiwK839r71xxA7eIKOlk/r+X
         cQOC4WUnyiBEsg6lrcm6DuTHJXL5N5+Ylb4AHXOEweorjhkRWTkxjDxXR64dXUcr5Ks5
         rvpzVvHJL+v1y5arXQ8vaSH1cw8fxfAa4pd0PRO22vxZF8S/2W642z2khuZZxkZc7ZJR
         Lv8iqryQuLKOar19z17ohoWJ/EBNIsNNf8SPeWZw2FIVSRxT56MSASrt911k28Wubjw+
         wKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VHTbZUcDkjaFRlmPdCX74SaoWcomMdU4xSTwwVvTjwU=;
        b=fCXOKrjeHW2LZcskJpEyaaGkbfu8xvijUDSI7IBoAQ3WTyKaNkswd5Qy0CcmuyPTEy
         V1X85I68qKG5cJmazoX6IXuP9cj1f3ErzNo3WGnPqXt8JY7WsDa5Z5BXPMdF7D2PzuxL
         LcwU/v+nCeP2eGNejlE+ruXK1/+XINn9Fp0fJB7kW6bZkn6SQ4kqCiGOXb9qupBEQ1eF
         WRucPnLNbPPID3i6F5LnMw14wG/qR1MKJbUIDeMfZOIaob1tnPOS27jEO1M6wrwnmquV
         2mz9z0ubMYWyYXfLXU1lSXO78yKIY2AwFvm4UOeo5DxC332KFNxyf309ucyxwxo2Mz7J
         pCVQ==
X-Gm-Message-State: AJIora+rWwirToIKrKFqhMsCMymO/0KXbnN4zIlH9BDYowYXSfggFmGv
	KGGHCJFFXzG/WR4qEMw882A=
X-Google-Smtp-Source: 
 AGRyM1ugdllTfJ+or2pHYVnO+BRup1S3CMILh8H1cEG+qMkSaXfdKQU2Qyl8tAZwqTQ/hP3UikTn+A==
X-Received: by 2002:a05:620a:4382:b0:6b5:e24a:c791 with SMTP id
 a2-20020a05620a438200b006b5e24ac791mr13232961qkp.133.1658347535745;
        Wed, 20 Jul 2022 13:05:35 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 h11-20020a05620a400b00b006b60c965024sm32422qko.113.2022.07.20.13.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 13:05:34 -0700 (PDT)
Date: Wed, 20 Jul 2022 16:05:33 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, cardoe@cardoe.com,
	Bertrand.Marquis@arm.com
Subject: Re: [meta-virtualization][PATCH] xen-image-minimal: reduce the x86
 wic build dependencies
Message-ID: <20220720200530.GA23459@gmail.com>
References: <20220718231547.4571-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220718231547.4571-1-christopher.w.clark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 20 Jul 2022 20:05:44 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7472

merged.

Bruce

In message: [meta-virtualization][PATCH] xen-image-minimal: reduce the x86 wic build dependencies
on 18/07/2022 Christopher Clark wrote:

> The Xen image recipe provides a default WKS_FILE for x86 builds to enable
> booting the image either in qemu or directly on hardware. Add settings
> for WKS_FILE_DEFAULT_DEPENDS that specify the wic image build
> dependencies, which are lower than the defaults used without it.
> 
> This change reduces the amount of build resources required for CI of
> this image and images that are derived from it.
> 
> Since WKS_FILE is specified separately for x86-64 and qemux86-64
> overrides, do the same for WKS_FILE_DEFAULT_DEPENDS, even though the
> dependencies for the two separate WKS_FILEs are currently the same.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
>  recipes-extended/images/xen-image-minimal.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
> index a8e72d1..ec0f2f5 100644
> --- a/recipes-extended/images/xen-image-minimal.bb
> +++ b/recipes-extended/images/xen-image-minimal.bb
> @@ -79,7 +79,9 @@ build_syslinux_cfg () {
>  
>  # Enable runqemu. eg: runqemu xen-image-minimal nographic slirp
>  WKS_FILE:x86-64 = "directdisk-xen.wks"
> +WKS_FILE_DEPENDS_DEFAULT:x86-64 = "syslinux-native"
>  WKS_FILE:qemux86-64 = "qemuboot-xen-x86-64.wks"
> +WKS_FILE_DEPENDS_DEFAULT:qemux86-64 = "syslinux-native"
>  QB_MEM ?= "-m 400"
>  QB_DEFAULT_KERNEL ?= "none"
>  QB_DEFAULT_FSTYPE ?= "wic"
> -- 
> 2.25.1
> 

