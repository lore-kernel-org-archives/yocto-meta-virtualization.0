Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7351FE748F5
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 16:16:15 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.86341.1696263367770323347
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Oct 2023 09:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JFM4Lm4+;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7741b18a06aso1084882185a.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 02 Oct 2023 09:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696263367; x=1696868167; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cW4tVx/d570Dv/W7vEirGF6HMWIPc6B4vQBhtbcuuUM=;
        b=JFM4Lm4+xOv8hC9qO5IFpSJNW4FiAYBq2zHuoluJJrvdU3y2pZRV48hmywB9bMv2Zx
         QaBJCHcWTJMCeXcC+BmtMkckHWvEnmi2XEaTak5w+yr4ehbfktzpUEBs1HESHUHmOiHm
         9A53h1OYsQH+HBBxJyHltH6zo2OEsK41C7BVpGZPXwj4XMzIg9knC3eevf1uEVzeBCEd
         Ca/bTBM1fO4OlN6M6ng1E1P+4wRLmPxWX3hXWmQsve4ebDQRButGnDCExgnI0VRhHzXl
         6ERTSs/L7uoIWVYKd5O4b9Qx8jVf9j7MGWiZSFrKh2hByLldLW+ZHxyG2U6V4GXxV5+p
         zcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696263367; x=1696868167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cW4tVx/d570Dv/W7vEirGF6HMWIPc6B4vQBhtbcuuUM=;
        b=AFeLIm0iNZiyOPe0KO1yOSo8L42MCJnk03YaDdKGaZsis4C3NW+t+8/32CF4pcI86E
         38MAbBBFgU/UnIBSqeiPhBf0R907jMoArmoqJ4/yoHqOCk7YnhMxmpAtvp/yU6yZJ22N
         W0DgXE0+Do9ZTJJ3ITXKSbQx3TRV/TWCqeB46iEjYLM66krekmFGJS9V3OS+z92DEYAt
         +yvNr07f7tzISq9WHza1NhTpKF2Ji5Il5NESsoFYzoYoSSu0bpVvCTyGpmg4tAhSD7aE
         2F28gsURB4hEEUcJiis1ISEgGHq9TFxdBVsEoQN+SaEnUllj+jpF7/VEHqZT/2bOz1ir
         YfFg==
X-Gm-Message-State: AOJu0YwkT5rwp+s89nk95MYBVRjcUUw0XUJk80lakd9An6Nnd3g887Iw
	W3uLOYhbLuZ5CNfgzR9rMLk=
X-Google-Smtp-Source: AGHT+IF/G47vGtWao40+aPZ0uv+C7l45QunnKh7ifxnUV9gSbZBT3YG7SuTMZpa169OD5Wm5OYSQ1Q==
X-Received: by 2002:a05:620a:4249:b0:774:1d27:51f with SMTP id w9-20020a05620a424900b007741d27051fmr14722708qko.13.1696263366742;
        Mon, 02 Oct 2023 09:16:06 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t2-20020a05620a034200b0076ce061f44dsm9107662qkm.25.2023.10.02.09.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 09:16:06 -0700 (PDT)
Date: Mon, 2 Oct 2023 16:16:04 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH V2] docker-compose: fix textrel QA
 issue
Message-ID: <ZRrsxBp9WeQ3cZzj@gmail.com>
References: <20230927055410.1833651-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927055410.1833651-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 02 Oct 2023 16:16:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8332

merged.

Bruce

In message: [meta-virtualization][PATCH V2] docker-compose: fix textrel QA issue
on 26/09/2023 Chen Qi via lists.yoctoproject.org wrote:

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
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/docker-compose/docker-compose_git.bb | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/recipes-containers/docker-compose/docker-compose_git.bb
> index d528535c..f6a2502a 100644
> --- a/recipes-containers/docker-compose/docker-compose_git.bb
> +++ b/recipes-containers/docker-compose/docker-compose_git.bb
> @@ -38,6 +38,7 @@ PACKAGECONFIG ?= ""
>  
>  include relocation.inc
>  
> +GOBUILDFLAGS:append = " -mod=vendor"
>  do_compile() {
>      	cd ${S}/src/import
>  
> @@ -50,8 +51,6 @@ do_compile() {
>  	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>  	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>  
> -	export GOFLAGS="-mod=vendor -trimpath"
> -
>  	# our copied .go files are to be used for the build
>  	ln -sf vendor.copy vendor
>  	# inform go that we know what we are doing
> @@ -60,7 +59,7 @@ do_compile() {
>  	GO_LDFLAGS="-s -w -X internal.Version=${PV} -X ${COMPOSE_PKG}/internal.Version=${PV}"
>  	GO_BUILDTAGS=""
>  	mkdir -p ./bin
> -	${GO} build $GOFLAGS -tags "$GO_BUILDTAGS" -ldflags "$GO_LDFLAGS" -o ./bin/docker-compose ./cmd
> +	${GO} build ${GOBUILDFLAGS} -tags "$GO_BUILDTAGS" -ldflags "$GO_LDFLAGS" -o ./bin/docker-compose ./cmd
>  }
>  
>  do_install() {
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8324): https://lists.yoctoproject.org/g/meta-virtualization/message/8324
> Mute This Topic: https://lists.yoctoproject.org/mt/101612602/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


