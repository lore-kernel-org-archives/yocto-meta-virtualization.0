Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88251C7619A
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 17:05:19 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.49407.1681319109569493884
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 12 Apr 2023 10:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=C3kxLe8s;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id y26so10434640qtv.9
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 12 Apr 2023 10:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681319108; x=1683911108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MxTnoTY/1OTY/hrO98qvEvWpJJA4vS7HOpztTNQS2wo=;
        b=C3kxLe8suh4zP/74Xexkgops/db7wAD4lKOUq/ldVeqiR/HRKIH5bSdwh/oI7g8NAI
         UtsUdgls8QDuq474UdG/luVz3MYThwL0THrP8W98tEKJJjpYzlRAfLYqG9nrRlyZ5pnQ
         AuBglC4LWPv2uWM5m+kd/3JSjy8tijmbb7bGyVYsDemA6Hse2K+J2/eYOSrOqS2SSq9Y
         Fsf3bfZQBevuLP88EJGWemJlk3c8w/5zyJuVZ7Bhyp8+64kE+vhOk4qdZOliigQivK/1
         6bQl1k31K/LPW29GrJpkJGgSra3s8CpE7JlXuptDaR8uuXLUn5onU9yPhBD5Di8ZUEa1
         ct8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681319108; x=1683911108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MxTnoTY/1OTY/hrO98qvEvWpJJA4vS7HOpztTNQS2wo=;
        b=Bewf8MyJtIh/wihML5UvCq6hwqYXSoSbFt8jDRXWeLxs1UKq5pZwxiE5fXTocuXZ9S
         l9fMYYOnxVfYX92m9e3xhERud/klpP9UmsVxLvMm7wFA6bXm76JGug1JajCNrlqFNcZG
         eDesJyzDmNnQmH9YH82q+4+UqFX/xlyKzVUkVtY7a62935UrMGC4nLleD7yo+IM5SXP4
         tWpZ+FSq7l6jSY6Yrw72SO1a19bu5qMpxnntDJOd4LcON1Kv5+dypZfLExDa5MkHSoPN
         s+feuj7uvT6yD2j1strgXugtN6d/DJeA/WUtLRK0Ikluii/5XF5thmoxZ3s8TiQ9PV/R
         s9jg==
X-Gm-Message-State: AAQBX9dTiLdAsrW1Fw1d+jcSpbsa4ylzSm/WdWaXt6s2mMSAP85A+fQB
	WulZpyfJDAOmMIlknnsXy3E=
X-Google-Smtp-Source: AKy350ZQmJeIyrCu/jv/LWPrNVf+U7wkhla+U6gZbGdaikIn2DY84mi08omacowaysoaA2vHcW0r+A==
X-Received: by 2002:ac8:5c05:0:b0:3e4:f002:2b6e with SMTP id i5-20020ac85c05000000b003e4f0022b6emr29330998qti.32.1681319108515;
        Wed, 12 Apr 2023 10:05:08 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id v16-20020ac87490000000b003e03178112dsm4373022qtq.13.2023.04.12.10.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 10:05:08 -0700 (PDT)
Date: Wed, 12 Apr 2023 13:05:06 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] buildah: add seccomp and ipv6 to
 REQUIRED_DISTRO_FEATURES
Message-ID: <ZDbkwv4BC5EdZYZb@gmail.com>
References: <20230401121513.3779028-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230401121513.3779028-1-Martin.Jansa@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 12 Apr 2023 17:05:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7985

In message: [meta-virtualization][PATCH] buildah: add seccomp and ipv6 to REQUIRED_DISTRO_FEATURES
on 01/04/2023 Martin Jansa wrote:

> * because it rdepends on podman with the same restriction
> 
> * BTW: .gitignore has:
>   build*/
>   which gets triggered for buildah as well:
>   meta-virtualization $ git add ./recipes-containers/buildah/buildah_git.bb
>   The following paths are ignored by one of your .gitignore files:
>   recipes-containers/buildah
> 
>   I've adjusted it to /build*/ only.

staged to master-next.

I admit to doing a git add -f when updating buildah last time around :)

Bruce

> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .gitignore                                | 2 +-
>  recipes-containers/buildah/buildah_git.bb | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitignore b/.gitignore
> index a61332e..daeb43d 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -1,4 +1,4 @@
> -build*/
> +/build*/
>  pyshtables.py
>  *.swp
>  *.orig
> diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
> index 3c17c98..8c6b8f3 100644
> --- a/recipes-containers/buildah/buildah_git.bb
> +++ b/recipes-containers/buildah/buildah_git.bb
> @@ -16,6 +16,10 @@ inherit go
>  inherit goarch
>  inherit pkgconfig
>  
> +# Rdepends on podman which needs seccomp and ipv6
> +inherit features_check
> +REQUIRED_DISTRO_FEATURES = "seccomp ipv6"
> +
>  GO_IMPORT = "github.com/containers/buildah"
>  GO_INSTALL = "${GO_IMPORT}"
>  GO_WORKDIR = "${GO_INSTALL}"
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7976): https://lists.yoctoproject.org/g/meta-virtualization/message/7976
> Mute This Topic: https://lists.yoctoproject.org/mt/97992318/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


