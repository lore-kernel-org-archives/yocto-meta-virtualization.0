Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web08.3807.1615521066262958118
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 11 Mar 2021 19:51:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rueNiBBJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id 73so2869071qtg.13
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 11 Mar 2021 19:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SbdzcQv/qjfFLmtHC6iDPZ4FIfFBZAJU4scl+3nQoKY=;
        b=rueNiBBJEXVXiQ1jPkziLMHoO2uBIQDRkDPusDjiIIfYM7ob5VxiNINhfZxsJEA8x7
         mw61KCOozNldiPgMKwJs7kpwuiOXMSiPMRkT3bITmYn4Evel5SSeFgmoDiMwnbTZrJyf
         f8Dbe+Hz19uowMtiwFSWpSrRreN8C9vk2OYiBjJbb3BS6eaMvqTpblBQ6jAv8h5ZwU+0
         F+1hqJWczmMI8d/6Q3pi0GJrs+hjnewcpV25krZMLUbuOG/2I+/MzyLxaYtikmSx+WVc
         J8oTwn7dSvScCTpyz6xKVx39ngvrqj7mIzxL+87QczdO5hCNDGmrBwt1zbCalAWbAreC
         TrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SbdzcQv/qjfFLmtHC6iDPZ4FIfFBZAJU4scl+3nQoKY=;
        b=K4au7jTwDvgOO7MhYeStpCMK02IBtt9ayYIs37pklo6uP1wvgm+nKSQeveQeVb+7N9
         AutnItEako/YMBKAYfR/MMpy+MzcMOL5CD6efWHsAQfvEQZJamxOoVy+KC1sduxvKvwm
         gwMmFwVJG6aYuYLwPSa/JvJCvTpLIG7aqcibyN26yElwHymah9a1H3dSCUfhzLd2/2qH
         30ZbE08d0ML0/86PUmNIttCjsnMbyssGZQyoed8YpBEsLRf7xpuvEnzsT6i4wCQbH441
         J26bzOrc1JENvuoM2Wih9gNC+w1O3B8QLGKIC4O3xJkENYTrPz8KwyAAmWnlqO8yx6qx
         IenA==
X-Gm-Message-State: AOAM530jpQAt1GX/taA/EUBM6yP4EGHDP8zoqLcc2m1cF2DcMXiU2qqr
	BZgmQ4SXnINYsaHnWCh2/NwBpQMhl0C7Hn5o
X-Google-Smtp-Source: ABdhPJwZ/i7lOcsyghKy99EtEdyiFA+zu/K6QJMmxrPRzF43ilCyIEcE1EO2uRKUmsz0GvXxbQ6r9g==
X-Received: by 2002:a05:622a:2c6:: with SMTP id a6mr10327268qtx.375.1615521065420;
        Thu, 11 Mar 2021 19:51:05 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id q64sm3106883qtd.32.2021.03.11.19.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 19:51:05 -0800 (PST)
Date: Thu, 11 Mar 2021 22:51:03 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: rburanyi@google.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] lxc: change download folder
Message-ID: <20210312035103.GB12488@gmail.com>
References: <20210311193040.621009-1-rburanyi@google.com>
MIME-Version: 1.0
In-Reply-To: <20210311193040.621009-1-rburanyi@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This will hit more than master, but for now, I've just merged this
there, and will wait for problem reports on the other branches.

Also, however this was sent, the Author field came through as
invalid and the yocto hooks wouldn't let me push.

I've manually updated the Author field, and this is now merged.

Bruce

In message: [meta-virtualization][PATCH] lxc: change download folder
on 11/03/2021 Robi Buranyi via lists.yoctoproject.org wrote:

> The URI has been changed to 'https://linuxcontainers.org/downloads/lxc'
> by the site maintainers recently. Updating the recipe to reflect the new
> path.
> 
> Signed-off-by: Robi Buranyi <rburanyi@google.com>
> ---
>  recipes-containers/lxc/lxc_4.0.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/lxc/lxc_4.0.6.bb b/recipes-containers/lxc/lxc_4.0.6.bb
> index ddff9af..b422909 100644
> --- a/recipes-containers/lxc/lxc_4.0.6.bb
> +++ b/recipes-containers/lxc/lxc_4.0.6.bb
> @@ -36,7 +36,7 @@ RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls bash libgcc"
>  
>  RDEPENDS_${PN}-networking += "iptables"
>  
> -SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
> +SRC_URI = "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
>  	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
>  	file://run-ptest \
>  	file://lxc-fix-B-S.patch \
> -- 
> 2.31.0.rc2.261.g7f71774620-goog
> 

> 
> 
> 

