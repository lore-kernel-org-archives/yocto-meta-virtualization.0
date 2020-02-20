Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web09.82.1582220641395845092
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 09:44:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rEUO6xzr;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id o28so4342856qkj.9
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Feb 2020 09:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bUcj68oe+OkArsOkJjjt0GiewbOQAVgbSQY4DLiqA00=;
        b=rEUO6xzrV0PcPDH0IkhL9tY9vSNcsR5eJlR+0+jrLLAFDJVG9ziovanyyAILXqOPMh
         Ozydc0/MjHmp4WMTEDs5WrN3bokwHvv9xRsi7crHqglgZZDZLoA0tCljDChGkqotp5JZ
         +scasta/fckP6jNPGwiWBVsOPOeUmbcsqizfFJ0lW4m8pXDdqb9luN6JCspjtr1+Zb8U
         tMoSnb7fkY0DylwgQx7+fLIFUx+XFPZu0womj9KCgMyV6idYjYqcjLwmhIQvBXsy4IXx
         3o4FS1TDAl89aAvwhhALrCIGolEbXEIdOXzaEUZWphLQV1YEC20PPgSwI/A8mbCKzyS2
         Px2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bUcj68oe+OkArsOkJjjt0GiewbOQAVgbSQY4DLiqA00=;
        b=c59tV7LBaawlcya2t9JwqZLgKRwEvsZ3CGLs3OsvwLLTHXY7LcSm27uCMB3Q/5rxCA
         THFdLfc+7LdtPpr4Hel7+Zl6OIujTbBOmTYIg0zCGmZN7Zy45UErQwBd/u4uYzB3swrE
         Q9UbNajr3aq5e3jrT1d5Hp+kHJCk69vIFkFtU5g6+7hQusxR6/+ifSZJS9r3Pesggfcn
         xUUBI2/XIo0Y/JMuQK9COu51IR5comPtx2wJkUgwtHl6OMz4ldiYj+qWoqaNB3QoyyXP
         sbBOSdlRCG6oI5sPdnJqxZHJa3ib3DPDVHCHmaDe0cnLef2dW0aOynBxmBmMVd4HJ0oH
         nDZA==
X-Gm-Message-State: APjAAAURKhSj6uAhXAigXV20LRYJojhO8UjjIcMvxRIJmC8KeQG/F6yJ
	aHf6A8rCswxDKezDr/5Hxxk=
X-Google-Smtp-Source: APXvYqzUDYBxuqMoUCJsx1RsVld0qXtyfXsZvv85U7Jn7YYLTMrGM7OPxL8sV08BZVW2nWCJiZXpWg==
X-Received: by 2002:a05:620a:135c:: with SMTP id c28mr3915405qkl.19.1582220640441;
        Thu, 20 Feb 2020 09:44:00 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id k5sm116587qkk.117.2020.02.20.09.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 09:43:59 -0800 (PST)
Date: Thu, 20 Feb 2020 12:43:58 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Ricardo Salveti <ricardo@foundries.io>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] docker-ce: allow custom build tags via packageconfig
Message-ID: <20200220174357.GB65133@gmail.com>
References: <20200218225913.30838-1-ricardo@foundries.io>
MIME-Version: 1.0
In-Reply-To: <20200218225913.30838-1-ricardo@foundries.io>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce


In message: [meta-virtualization] [PATCH] docker-ce: allow custom build tags via packageconfig
on 18/02/2020 Ricardo Salveti wrote:

> As done by the docker-moby recipe, move the definition of the default
> build tags outside do_compile and let the docker build tags be
> customized via the packageconfig options set by the recipe.
> 
> This is required for enabling seccomp support during build time.
> 
> Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
> ---
>  recipes-containers/docker/docker-ce_git.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
> index ef84069..3c8a339 100644
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
> 2.25.0
> 

> 

