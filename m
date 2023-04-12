Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939FAC7619A
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 17:07:29 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.49721.1681319241289859164
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 12 Apr 2023 10:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BfXsP3Wt;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id cg4so3555228qtb.11
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 12 Apr 2023 10:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681319240; x=1683911240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vpa86d2C+p7YFI5kZnfhoooiH5rCsNJERhyFq7RaSLk=;
        b=BfXsP3Wtpkis+PK40uo+VcZUmuzJ6JBQ5Av5LBaD7RmrMhwE+d52C+gZFyio3dhi6v
         U7nkn+M6bdM50KHZGN/D6hTiNoJG72FzVgUrutRCF+o4pLkoL1nTbYPKW+KYQ/5eSucW
         ZxZJy7whMat3ptNl5kgZgoMZen7JHZ8pHIr2nka+kwHybyDgJBJU5jH83suOlAkFH5wL
         Jb1GSK8j8ZjOGcJPCYTcFa5iVa20hNfNL/Fh6yyFUNT636OiA+hb1taWJecIxii2nzlq
         msljrgHCPYRWcVJiKQ0/bNunqlP2yH7O1S574vnjl+OBcs2aNlNDK0VNzmNy4iU6hvL5
         lb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681319240; x=1683911240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vpa86d2C+p7YFI5kZnfhoooiH5rCsNJERhyFq7RaSLk=;
        b=IpCI2hWF3dJpJpsFa3ruSqv3Tn7KnMtgZvj3He2ax9HMV1i5UzH1lND8OPsLXzGEnn
         v6Lfg+Ta3KbtbeBzjp0Jlx/ratQjp/auB7ckB/9zIB5wsNPrm/yHwpPE2IOBjI5Umgus
         NblhXFnVJyMFmUWtNLcsycfgZ2jKhCxf4WL4zz/1bl/PH3ym0un5gXUfQll8gNanzMhY
         WDUUPAFWr/mNN5smE1ryDkF74jXH029z1SvM1CPL42fvpsWz83EaxWtm0hjMVA3r5hw9
         QFtW2vzc7susXbYyxuwHBHHWjdWMwaY2xBS8vU0oHht16dhElvEb8q+CVUwiKH/ak27Y
         cAiA==
X-Gm-Message-State: AAQBX9c/1xop3r1lfzt5KrcvNTskZJwOW111RNkbQ6p2KdRHOksusE7h
	mgaRs7iMHjD5dtaIb37TYPlMF5ZQsab36w==
X-Google-Smtp-Source: AKy350aCbPHxYYF9YYl1zirqKLm7i5WMI09ZzEsUuBHt9NloreQPEtrem8+3W2YxAhjASh737UcT6w==
X-Received: by 2002:a05:622a:1a95:b0:3e2:b529:e800 with SMTP id s21-20020a05622a1a9500b003e2b529e800mr5043862qtc.5.1681319240272;
        Wed, 12 Apr 2023 10:07:20 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id g189-20020a37b6c6000000b00745a78b0b3asm4725404qkf.130.2023.04.12.10.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 10:07:19 -0700 (PDT)
Date: Wed, 12 Apr 2023 13:07:18 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] crun: fix REQUIRED_DISTRO_FEATURES
Message-ID: <ZDblRj0QhiyuNkZu@gmail.com>
References: <20230401221027.2776494-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230401221027.2776494-1-Martin.Jansa@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 12 Apr 2023 17:07:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7986

Staged to master-next.

These two Bruce guys should talk once and a while, that'd help
not have duplicates in the recipe!

Bruce

In message: [meta-virtualization][PATCH] crun: fix REQUIRED_DISTRO_FEATURES
on 02/04/2023 Martin Jansa wrote:

> * features_check was inherit twice and REQUIRED_DISTRO_FEATURES
>   was set twice as well but both with ?= so the 2nd one was ignored
> 
> * seccomp was added in:
>   commit b8f2edd39af6b7ac4461158b0d0382e88e93d6f1
>   Author: Bruce Ashfield <bruce.ashfield@gmail.com>
>   Date:   Wed Jun 30 11:22:42 2021 -0400
>   Subject: crun: add seccomp distro features check
> 
>   but there was already systemd from:
> 
>   commit 144d1ae8973e8c67709d7b544dc53b80bf924754
>   Author: Bruce Ashfield <bruce.ashfield@gmail.com>
>   Date:   Fri Apr 23 10:32:24 2021 -0400
>   Subject: crun: use REQUIRED_DISTRO_FEATURES to indicate systemd dependency
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-containers/crun/crun_git.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/crun_git.bb
> index 7db609e..15c18a1 100644
> --- a/recipes-containers/crun/crun_git.bb
> +++ b/recipes-containers/crun/crun_git.bb
> @@ -20,14 +20,12 @@ SRC_URI = "git://github.com/containers/crun.git;branch=main;name=crun;protocol=h
>  PV = "1.8.1+git${SRCREV_crun}"
>  S = "${WORKDIR}/git"
>  
> -REQUIRED_DISTRO_FEATURES ?= "systemd"
> +REQUIRED_DISTRO_FEATURES ?= "systemd seccomp"
>  
>  inherit autotools-brokensep pkgconfig features_check
>  
>  PACKAGECONFIG ??= ""
>  
> -inherit features_check
> -REQUIRED_DISTRO_FEATURES ?= "seccomp"
>  
>  DEPENDS = "yajl libcap go-md2man-native m4-native"
>  # TODO: is there a packageconfig to turn this off ?
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7977): https://lists.yoctoproject.org/g/meta-virtualization/message/7977
> Mute This Topic: https://lists.yoctoproject.org/mt/98004497/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


