Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E644CC636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 20:10:12 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.3542.1676491804570750997
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 12:10:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ikRX2Roi;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id 5so23075297qtp.9
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Feb 2023 12:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fn0At+Ump3YSMtXkTbs/60m3qVN09xIpxfiTRsnJ8Ek=;
        b=ikRX2Roioln/rBp1cjIMO1hrFQigV8QmTx0S9PTPnWOpJh9FyuvfHPkVAW/89qdegv
         XV5UDNVOthSe766czVM4KA53VlMG/B7FqIfDp0RZ4eehT3wSS/2fa2+eUGfmBZ3ZQ6cw
         Sn1lUqPjEXBgbZMJ2yO0SC7hie6DhG2pIaauS6UXkrJz9iwwis54XcKPlsjAkrqIw2Xm
         0dCCWW6i6hT1YFPjJZF2TQ2dsL3KxYJCh6h2zVZf3RUWFGIbqefR9iqOZ2xIV9+DGX7R
         xY/M5J0gp+KBTxiwDESGrPKIm91TVYLLkCahsbVu/fuSWMwrrKVCaBA29vTWdaKQXWsy
         3YsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fn0At+Ump3YSMtXkTbs/60m3qVN09xIpxfiTRsnJ8Ek=;
        b=JQ/DkInLu7JiPoR5GQm+6iUUe+X1SqoyvOu9Fb3di9QPyqo5IQYi3QKgK6a4C/wTmT
         3BVY4HAg6MUMUDS78JpGsiTchF4t2WnbLHHLmoAOmIQ1MEaiLcnkAn2PjtVqybtgF0Ws
         H3qaYDGY5XTgJOpmQY2s//IGXFbxIeJPC0SKTvIFBIi91yU54RJua5F3wDoWY2mQym1w
         reaUtQWhORdc/fLpf87tYXcoGAfn3OAgPopkXYnYro3q2Z8Z50cQ61MAcdx3uVbtnUPS
         2NKcN97Onp3flE5QPb8qj535aIaRw8Zs5Lmog/J2Nlpb63f3Ly+MFnil33OGsmBeSdpk
         u54w==
X-Gm-Message-State: AO0yUKXGK6a4s9Gu7O2WXlvDUvXxX4JxJV9IwFaL1lvJ4uymf5WXefcQ
	Jxbk0qiTHhzyuWo8uoo3cYv9mlFZE+QsuA==
X-Google-Smtp-Source: AK7set++TGNmXMflL75tlpWDY3SKBaoSYKOA8oTIQDO3BePEj0hzyUI9NhX1S7UPyrv2hq1MCKVA/Q==
X-Received: by 2002:a05:622a:1651:b0:3ba:6595:863f with SMTP id y17-20020a05622a165100b003ba6595863fmr5203388qtj.60.1676491803520;
        Wed, 15 Feb 2023 12:10:03 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id p62-20020a378d41000000b0073b58be89c1sm4393632qkd.88.2023.02.15.12.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 12:10:03 -0800 (PST)
Date: Wed, 15 Feb 2023 15:10:01 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] meta-virt: sync SRC_URIs between
 k8s and k3s
Message-ID: <Y+08GYBBFNBvoQD4@gmail.com>
References: <20230214062818.103627-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214062818.103627-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Feb 2023 20:10:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7856

A good optimization.

I'm still working on testing and merging my WIP k8s and the pending
patches, but no need to make this wait for that effort.

merged.

Bruce

In message: [meta-virtualization][PATCH] meta-virt: sync SRC_URIs between k8s and k3s
on 13/02/2023 Chen Qi wrote:

> k3s is using a lot of SRC_URIs and some of them have corrsponding
> recipe in meta-virt, which are used by k8s. These components'
> SRC_URIs are better to be kept in sync, because this avoids two
> local git repos (Yocto supports fetching locally) which are totally
> the same. Remove the '.git' suffix from these recipes to sync the
> SRC_URIs.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/go-digest/go-digest_git.bb               | 2 +-
>  recipes-containers/go-errors/go-errors_git.bb               | 2 +-
>  recipes-containers/go-spf13-cobra/spf13-cobra_git.bb        | 2 +-
>  recipes-containers/go-spf13-pflag/spf13-pflag_git.bb        | 2 +-
>  recipes-containers/oci-image-spec/oci-image-spec_git.bb     | 2 +-
>  recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/recipes-containers/go-digest/go-digest_git.bb b/recipes-containers/go-digest/go-digest_git.bb
> index c06a1420..ad2da25d 100644
> --- a/recipes-containers/go-digest/go-digest_git.bb
> +++ b/recipes-containers/go-digest/go-digest_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE.code;md5=9cd86830b557232ce55e
>  SRCNAME = "go-digest"
>  
>  PKG_NAME = "github.com/opencontainers/${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
> +SRC_URI = "git://${PKG_NAME};destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
>  
>  SRCREV = "b6234c321f263c503268e3b205f3d9755f9d14ed"
>  PV = "v1.0.0-rc0+git${SRCPV}"
> diff --git a/recipes-containers/go-errors/go-errors_git.bb b/recipes-containers/go-errors/go-errors_git.bb
> index f1d7ef3b..678b0242 100644
> --- a/recipes-containers/go-errors/go-errors_git.bb
> +++ b/recipes-containers/go-errors/go-errors_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=6fe682a02df52c6653f33bd0f
>  SRCNAME = "errors"
>  
>  PKG_NAME = "github.com/pkg/${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
> +SRC_URI = "git://${PKG_NAME};destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
>  
>  SRCREV = "5dd12d0cfe7f152f80558d591504ce685299311e"
>  PV = "v0.8.1+git${SRCPV}"
> diff --git a/recipes-containers/go-spf13-cobra/spf13-cobra_git.bb b/recipes-containers/go-spf13-cobra/spf13-cobra_git.bb
> index b272f164..b2ae9191 100644
> --- a/recipes-containers/go-spf13-cobra/spf13-cobra_git.bb
> +++ b/recipes-containers/go-spf13-cobra/spf13-cobra_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE.txt;md5=920d76114a32b0fb75b3f
>  SRCNAME = "cobra"
>  
>  PKG_NAME = "github.com/spf13/${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
> +SRC_URI = "git://${PKG_NAME};destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
>  
>  SRCREV = "b5d8e8f46a2f829f755b6e33b454e25c61c935e1"
>  PV = "v0.0.1+git${SRCPV}"
> diff --git a/recipes-containers/go-spf13-pflag/spf13-pflag_git.bb b/recipes-containers/go-spf13-pflag/spf13-pflag_git.bb
> index ea63029a..5d66de3a 100644
> --- a/recipes-containers/go-spf13-pflag/spf13-pflag_git.bb
> +++ b/recipes-containers/go-spf13-pflag/spf13-pflag_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=1e8b7dc8b906737639131047a
>  SRCNAME = "pflag"
>  
>  PKG_NAME = "github.com/spf13/${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
> +SRC_URI = "git://${PKG_NAME};destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
>  
>  SRCREV = "d5e0c0615acee7028e1e2740a11102313be88de1"
>  PV = "v1.0.5+git${SRCPV}"
> diff --git a/recipes-containers/oci-image-spec/oci-image-spec_git.bb b/recipes-containers/oci-image-spec/oci-image-spec_git.bb
> index d13e3d63..22cb8913 100644
> --- a/recipes-containers/oci-image-spec/oci-image-spec_git.bb
> +++ b/recipes-containers/oci-image-spec/oci-image-spec_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=27ef03aa2da6e424307f102e8
>  SRCNAME = "image-spec"
>  
>  PKG_NAME = "github.com/opencontainers/${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=main;protocol=https"
> +SRC_URI = "git://${PKG_NAME};destsuffix=git/src/${PKG_NAME};branch=main;protocol=https"
>  
>  SRCREV = "02efb9a75ee11e05937b535cc5f228f9343ab2f5"
>  PV = "v1.0.2+git${SRCPV}"
> diff --git a/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb b/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
> index 5e0be285..e5a9ef04 100644
> --- a/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
> +++ b/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=b355a61a394a504dacde901c9
>  SRCNAME = "runtime-spec"
>  
>  PKG_NAME = "github.com/opencontainers/${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=main;protocol=https"
> +SRC_URI = "git://${PKG_NAME};destsuffix=git/src/${PKG_NAME};branch=main;protocol=https"
>  
>  SRCREV = "7ceeb8af52593e37d8ef28bd350f50044b7adf1d"
>  PV = "v1.0.2+git${SRCPV}"
> -- 
> 2.37.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7852): https://lists.yoctoproject.org/g/meta-virtualization/message/7852
> Mute This Topic: https://lists.yoctoproject.org/mt/96954816/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


