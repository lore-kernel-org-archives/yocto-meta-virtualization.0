Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.116.1586800471726076246
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 10:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u6HGoxB4;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id v38so4803799qvf.6
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Apr 2020 10:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CG4niudyVjg5IVxXuMTHZe1xae/oETUbAr8Ih6u1HJg=;
        b=u6HGoxB4Hd/QJ6W+kE9khpdbWW7EcO5ciVHFY7PLd/uvqbeUdc2oAMxmEX68zuFJ97
         MsE5802zHVOjq5YAu+JAj/ZxDW0BFZH+2WUMDypdLEAd0JPCahA2bGv+zABDHcNCSz0h
         OwhXlCZ0TyuuSv9RR5okhary3wF/rVcWCYR2jU8WCfYrm2SQBbpGuWRMWzUiRjpwbwYb
         OPqruu6qXGl8/2smADRPmpUnEuKPeLX8PzyccEAOkh0usObGvZE2uIVhBFLHSoekqAeR
         hMjV/6Y8PIcP4aA9aGTmsXZah5OXFmxWdTqwQ36BbjxdBwcJiqhINLCsdmz99677AdY4
         NA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CG4niudyVjg5IVxXuMTHZe1xae/oETUbAr8Ih6u1HJg=;
        b=RqVdUDAqBgTUIxwTI42HMKbUKC+/HcjlKb14npz25VqLWNeHrplUKG5xaHB9nVwC/u
         eVDNzDPFA3Lt8MOzSyfXNAlMn78NLjhXivgIRmEnGnHK6RmITCscf6Qmg/zu4w23r52a
         fUt/bQY9DUvhnDKnfHePZtRkBOQHqpVq7XIRscbGqI5tHnehf5sHrkxDu7zO40J8XvQO
         ENNWchc3aLZYx8EOydXdN2CQ5k78XO0n4UsIHZRml6RW7c+AnRb7uoUOtLkH3kuyAShM
         jjFGxUF3RaV0xnKe5eVAQQcLhIn3hjhxvxt2ZAuxsxPeEAYi2PbqFEY7aAv8T7C1TEfY
         mwRw==
X-Gm-Message-State: AGi0PubkuufvTjvg/Tog0UqhMyErYLR89XFca1MxmunG6snw5HA79ahh
	Y5J6LsVk3iWN8CVqZItDE+E=
X-Google-Smtp-Source: APiQypJidQSnSd+FrkIelBcLCCzB+pW5neJy5omBC7IPXlh/Bw5TfMwDXOw5ymj82/xfRdrMASAwoQ==
X-Received: by 2002:ad4:45ae:: with SMTP id y14mr4109274qvu.145.1586800470812;
        Mon, 13 Apr 2020 10:54:30 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id b42sm1626664qta.29.2020.04.13.10.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 10:54:30 -0700 (PDT)
Date: Mon, 13 Apr 2020 13:54:28 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: liu.ming50@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org, stefan.agner@toradex.com,
	Ricardo Salveti <ricardo@foundries.io>
Subject: Re: [meta-virtualization][zeus][PATCH] docker-ce: allow custom build tags via packageconfig
Message-ID: <20200413175427.GB2012@gmail.com>
References: <20200409184251.11114-1-liu.ming50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200409184251.11114-1-liu.ming50@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Cherry picked to Zeus.

Bruce

In message: [meta-virtualization][zeus][PATCH] docker-ce: allow custom build tags via packageconfig
on 09/04/2020 liu.ming50@gmail.com wrote:

> From: Ricardo Salveti <ricardo@foundries.io>
> 
> As done by the docker-moby recipe, move the definition of the default
> build tags outside do_compile and let the docker build tags be
> customized via the packageconfig options set by the recipe.
> 
> This is required for enabling seccomp support during build time.
> 
> Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  recipes-containers/docker/docker-ce_git.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
> index 817795f..2746e3f 100644
> --- a/recipes-containers/docker/docker-ce_git.bb
> +++ b/recipes-containers/docker/docker-ce_git.bb
> @@ -44,6 +44,8 @@ PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
>  PACKAGES =+ "${PN}-contrib"
>  
>  DOCKER_PKG="github.com/docker/docker"
> +# in order to exclude devicemapper and btrfs - https://github.com/docker/docker/issues/14056
> +BUILD_TAGS = "exclude_graphdriver_btrfs exclude_graphdriver_devicemapper"
>  
>  inherit go
>  inherit goarch
> @@ -71,8 +73,7 @@ do_compile() {
>  	export CGO_ENABLED="1"
>  	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>  	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> -	# in order to exclude devicemapper and btrfs - https://github.com/docker/docker/issues/14056
> -	export DOCKER_BUILDTAGS='exclude_graphdriver_btrfs exclude_graphdriver_devicemapper'
> +	export DOCKER_BUILDTAGS='${BUILD_TAGS} ${PACKAGECONFIG_CONFARGS}'
>  
>  	export DISABLE_WARN_OUTSIDE_CONTAINER=1
>  
> -- 
> 2.26.0
> 
