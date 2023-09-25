Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEDF7CE7A91
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 01:17:26 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.52040.1695604638620585945
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 24 Sep 2023 18:17:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ejcs7ZXg;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7740c520847so355877185a.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 24 Sep 2023 18:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695604637; x=1696209437; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yLTYnJu8yGnB55k3EfcRTH73erfcsJ2zEFBaQhQaeNM=;
        b=ejcs7ZXgAK1mP2X+Ti6helpI8j0AF4TIaUcKJsDknUyQDtfYavY34n84mUSBjeXv7j
         WX+s7e7UZ7RbQhjlE7sMtod6u/QpF8hPPgkfNSa+2MRTqN3RzvO4+6hCX50mgcIQBBSA
         C5V/MjDzxVQ8Eu6rJ8ajCJOJ0Woa/hzAbS/gSiBnKd8QbKE+DbcgmeK7UYjjiZkZOmrR
         muFKTj8s1BZV8y+WPTY3LABBsRNs1RRdN31A/Sgrop/ZXnC9+KWHGBLJqGdnW1oEtQjt
         bP1d/VtfyBc2NL1jpawy5E1K3tkdioi8uKXexYRz4h/2v01mg69cE5c91PHIBDUutfRO
         kDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695604637; x=1696209437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLTYnJu8yGnB55k3EfcRTH73erfcsJ2zEFBaQhQaeNM=;
        b=Dz+D+sJbfXC4RkQyXUVayNFZtLEN9q12dGzXu0/5So1gVntRU2B2zK2cQqvdgkjbG4
         e/TlXoTF2x7p/EolOUbApwOLgWcf0R7K9plKIDxOaVqfAB2NXBdK/8hgZH74AFLaueS/
         U+t7V++jI+fo6iNADCcZPp/TJJKrsmcwIopQo0CaMBQRHS7jK6NyALTjRxO/G/pNIMS2
         bKdnpD280ojgnZNyhMJ6f3/eUAf0x/HcnHQjEK3RpBmWMe6HNZENZkEAIHC3uQcvRW7h
         mqhQHBWQdPAj69T53esEUomB2L6LegRrZ2G1xQixiX2XSqo5AINSXH5vvu9HFJ8GBbAT
         OwBg==
X-Gm-Message-State: AOJu0YxWjnLUrXw6whZDPYn08CskK1N7ROI1+WySw7oTu/SeCBn39u3p
	qGI5Bv9IdPSTXdwcAodzKw0TK83sx589/IbC
X-Google-Smtp-Source: AGHT+IHpxYlXwyw8cYecbLzP0wgSsOivE+koF6uJAtvBQORmHWDUDg7NQ5TMblI6GCtajJDCUaygdw==
X-Received: by 2002:a0c:e2cd:0:b0:655:d6af:1c37 with SMTP id t13-20020a0ce2cd000000b00655d6af1c37mr5495480qvl.65.1695604637474;
        Sun, 24 Sep 2023 18:17:17 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t15-20020ac8738f000000b0040324785e4csm3394675qtp.13.2023.09.24.18.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 18:17:16 -0700 (PDT)
Date: Mon, 25 Sep 2023 01:17:15 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] docker-compose: fix textrel QA issue
Message-ID: <ZRDfmy0es8iFFztx@gmail.com>
References: <20230918065101.1104194-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918065101.1104194-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Sep 2023 01:17:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8318

In message: [meta-virtualization][PATCH] docker-compose: fix textrel QA issue
on 17/09/2023 Chen Qi via lists.yoctoproject.org wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
> 
> Fix textrel QA issue like below:
> 
>   ERROR: QA Issue: docker-compose: ELF binary /usr/lib/docker/cli-plugins/
>          docker-compose has relocations in .text [textrel]
> 
> The problem could be fixed by adding -buildmode=pie, as this option has
> already been in GOBUILDFLAGS except for mips and riscv32, let's make
> use of GOBUILDFLAGS.

I tend to not use (or like) the defaults in the bbclass, but in this
case, it is probably ok.

> 
> Also, make use of GO_EXTRA_LDFLAGS to hold our this recipe's specific ldflags.

I much prefer the explicit GO_LDFLAGS on the build line, versus the
internally consumed GO_EXTRA_LDFLAGS. So I'd prefer to keep that
as-is.

Bruce

> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/docker-compose/docker-compose_git.bb | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/recipes-containers/docker-compose/docker-compose_git.bb
> index 274fb520..8c0ddccf 100644
> --- a/recipes-containers/docker-compose/docker-compose_git.bb
> +++ b/recipes-containers/docker-compose/docker-compose_git.bb
> @@ -40,6 +40,8 @@ PACKAGECONFIG ?= ""
>  
>  include relocation.inc
>  
> +GOBUILDFLAGS:append = " -mod=vendor"
> +GO_EXTRA_LDFLAGS = "-s -w -X internal.Version=${PV} -X ${COMPOSE_PKG}/internal.Version=${PV}"
>  do_compile() {
>      	cd ${S}/src/import
>  
> @@ -52,17 +54,14 @@ do_compile() {
>  	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>  	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>  
> -	export GOFLAGS="-mod=vendor -trimpath"
> -
>  	# our copied .go files are to be used for the build
>  	ln -sf vendor.copy vendor
>  	# inform go that we know what we are doing
>  	cp ${WORKDIR}/modules.txt vendor/
>  
> -	GO_LDFLAGS="-s -w -X internal.Version=${PV} -X ${COMPOSE_PKG}/internal.Version=${PV}"
>  	GO_BUILDTAGS=""
>  	mkdir -p ./bin
> -	${GO} build $GOFLAGS -tags "$GO_BUILDTAGS" -ldflags "$GO_LDFLAGS" -o ./bin/docker-compose ./cmd
> +	${GO} build ${GOBUILDFLAGS} -tags "$GO_BUILDTAGS" -o ./bin/docker-compose ./cmd
>  }
>  
>  do_install() {
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8312): https://lists.yoctoproject.org/g/meta-virtualization/message/8312
> Mute This Topic: https://lists.yoctoproject.org/mt/101428849/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


