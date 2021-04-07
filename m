Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.402.1617755286492962396
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 17:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tD0qnuhJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id s2so12566664qtx.10
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Apr 2021 17:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=G7IvgewrY15oc+gBv0ClPvy9HCBfxNVend8mphegbTo=;
        b=tD0qnuhJuJ3Gei00f2f6PxkoVj1ECho9UTh3z5U+enQw3mkgAw+Az0Re68O52VzrGG
         OLhkV2S6sygT2XnqbIWQY/AvCglm41SqOXWMc0lVzbm4ShO2TTQz2qLcM5SdRUafgRz3
         VExJ8vKDlHw4VL7tpMDSNE7sZpwXOzyX/hoxIyUqlXZ8aFb71zeKdIx0LTmW5R3WUEF8
         WjfRVx7TwoHGYXAslk76r+FbbB7Q+/t08gZEyiblL8DyTsVjpcO8BbfxG6xNcPKDbqs9
         j9IqYaTJpSqgyC4wJEkSkKftHrg56CmsQtL6DzDty3QImb0nyvUaczMK9eHemyFng3hy
         mpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G7IvgewrY15oc+gBv0ClPvy9HCBfxNVend8mphegbTo=;
        b=XenPHQxAoon2+KKiJlbNlnrS6myMJFGKPMwIjTtUMOdhmNO8XEkpkZeVhwRTBU5nfb
         abwQ4ja4uhYZh5lFPj+AkKPfI4uzaA0EPXELXuJGlFSV5mJEmJgW20Hxxp7F0yoQGRjJ
         sPWeKcvJRV8iBen3CoOowxnXw2AXOLV0Bv73bAG6qxF2ttabjWoQiLSlH/KUQvO+y0jk
         vxl1A22WsZ+oo3phG8kHhrvEdBnHSUNRXSreEhmGw39TQ/COOJlVoVyMBbZgiaZlCS2N
         QqNZfj2cuf8Tmyl/f2B46chlXXWYNMmqcrIDxDnP9SygDRDA0CCdD57NP8cGvVVKhgDy
         qanQ==
X-Gm-Message-State: AOAM533RM3LhjExxqCPoEekmiQo/7q/0o5uYrQPf2m4lHoq2+7XJ6bJA
	En2G9XteB5Io2HhXj8YQ3UY=
X-Google-Smtp-Source: ABdhPJxDTffz5sDWUYRxOfTAaT5/qKTJC4Tw631jNWFoF5B/7EYdSBAaY71VKrTqT1Oa6dUkAEPdZA==
X-Received: by 2002:ac8:7089:: with SMTP id y9mr524902qto.264.1617755285667;
        Tue, 06 Apr 2021 17:28:05 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id j24sm17142460qka.67.2021.04.06.17.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 17:28:05 -0700 (PDT)
Date: Tue, 6 Apr 2021 20:28:03 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 1/2] packagegroup-kubernets: add seccomp to REQUIRED_DISTRO_FEATURES
Message-ID: <20210407002800.GA24839@gmail.com>
References: <20210402070244.2321014-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210402070244.2321014-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks Martin,

This is now merged.

Bruce

In message: [meta-virtualization][PATCH 1/2] packagegroup-kubernets: add seccomp to REQUIRED_DISTRO_FEATURES
on 02/04/2021 Martin Jansa wrote:

> * fixes world build:
> ERROR: Nothing RPROVIDES 'k3s-server' (but meta-virtualization/recipes-core/packagegroups/packagegroup-kubernetes.bb RDEPENDS on or otherwise requires it)
> k3s RPROVIDES k3s-server but was skipped: missing required distro feature 'seccomp' (not in DISTRO_FEATURES)
> NOTE: Runtime target 'k3s-server' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['k3s-server']
> ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'packagegroup-kubernetes', 'k3s-server']
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-core/packagegroups/packagegroup-kubernetes.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/recipes-core/packagegroups/packagegroup-kubernetes.bb b/recipes-core/packagegroups/packagegroup-kubernetes.bb
> index ec528e0..237e72e 100644
> --- a/recipes-core/packagegroups/packagegroup-kubernetes.bb
> +++ b/recipes-core/packagegroups/packagegroup-kubernetes.bb
> @@ -4,6 +4,10 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
>  
>  inherit packagegroup
>  
> +# k3s has this restriction
> +inherit features_check
> +REQUIRED_DISTRO_FEATURES ?= "seccomp"
> +
>  PACKAGES = "\
>      packagegroup-kubernetes-base \
>      packagegroup-k8s-host \
> -- 
> 2.30.2
> 

> 
> 
> 

