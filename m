Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 728A6EB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 19:12:58 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.4805.1689102768898694290
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Jul 2023 12:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=iChWiZiD;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-76731802203so555591685a.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Jul 2023 12:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689102768; x=1691694768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zCmYKnI7hx4iYrOurM6RcveDAcxKH0eo1GLUavZGzuk=;
        b=iChWiZiDn1P1jcd1SMCfJgoJBgP0KyyZM36CAwFiv5EkUBTzbQZNzYxzI/246yMHPN
         +oaj2yQvc4yIR4nnTcjKMWr3xbhWl7bVTYX0hqHVCk3hhRKYtnUb78nf8aIxp3cJ9cYz
         LshWguJgVQgyp0ul+EKYFken1BRB1y6rclWHGD+XZgslJtNrnAaShrJuLPSEYrYUmGb5
         X97SF/TWiGAGUxqahBdv8FBbsSUbLNsVi31imWGm74hWf91QjKuojS+7PazUyuLK4n7b
         mlmgYz8bRiLjmoyka4CHOS+nA7u0esmd1rZjLyzmF9Y2lCmkJbuRBChbWPele3WBl1BE
         geHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689102768; x=1691694768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCmYKnI7hx4iYrOurM6RcveDAcxKH0eo1GLUavZGzuk=;
        b=ZXfj085RTKZSXvahIKln5jS4m2Pi4EaIbJcY+xy5QB04yRR1oxB/cbVwgu8kc0PjhJ
         qONuM15dG2WQ/59qpB9bgGMdMInGu8NUFjGVnoeFfBNV/bLSGlJh9XgC2WDUExY/hLdk
         SKPJ4r5Cr9McGYtvj8ZcIu32FF7bEVS+b5yLEi6OnLFB0mi5ROLC+VpXSSgkv48bHpHP
         Op0ufCgdGo1Vdt/hB/bYBbKgDrUFXUEYVzBJCfo56SoTqBMTWHgQwCGncjsJNrrrpVpk
         9csUnaQpCF3524AdfDKfOL5i72mvhnteB/Eg0mMvu9R1bL7mfnBF+gTy2QdarXWErd6N
         xZNQ==
X-Gm-Message-State: ABy/qLb2E7MoW06NSe/dK+hhr4BmNuoFZOfSr0TEOKuWN95RGpmtBGud
	tvvOvQMXQ4DZ1FL+lgACRxk=
X-Google-Smtp-Source: APBJJlHkdHhX54xn67FRwlWX20tDEsDuTskDy7JYJFgWJmCkZqII/8Cr/9NtItuGRucrTu2CyFTjXA==
X-Received: by 2002:a05:620a:448b:b0:767:47f9:f8a3 with SMTP id x11-20020a05620a448b00b0076747f9f8a3mr20144515qkp.23.1689102767880;
        Tue, 11 Jul 2023 12:12:47 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t2-20020a05620a034200b007623c96430csm1300146qkm.111.2023.07.11.12.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 12:12:47 -0700 (PDT)
Date: Tue, 11 Jul 2023 19:12:45 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: ml@calgera.com
Cc: meta-virtualization@lists.yoctoproject.org,
	Renato Caldas <renato@calgera.com>
Subject: Re: [meta-virtualization][PATCH] crun: fix compilation with musl
Message-ID: <ZK2praSNNXDAoEF9@gmail.com>
References: <20230706144047.2644707-1-ml@calgera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230706144047.2644707-1-ml@calgera.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Jul 2023 19:12:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8127

In message: [meta-virtualization][PATCH] crun: fix compilation with musl
on 06/07/2023 Renato Caldas via lists.yoctoproject.org wrote:

> From: Renato Caldas <renato@calgera.com>
> 
> Requires either libargp or argp-standalone.

While we don't fully support mulsc in meta-virt, I see no reason
to not fix the easy issues.

This is now merged.

Bruce

> 
> Signed-off-by: Renato Caldas <renato@calgera.com>
> ---
>  recipes-containers/crun/crun_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/crun_git.bb
> index 2ff8586..a26de16 100644
> --- a/recipes-containers/crun/crun_git.bb
> +++ b/recipes-containers/crun/crun_git.bb
> @@ -26,12 +26,12 @@ inherit autotools-brokensep pkgconfig features_check
>  
>  PACKAGECONFIG ??= ""
>  
> -
>  DEPENDS = "yajl libcap go-md2man-native m4-native"
>  # TODO: is there a packageconfig to turn this off ?
>  DEPENDS += "libseccomp"
>  DEPENDS += "systemd"
>  DEPENDS += "oci-image-spec oci-runtime-spec"
> +DEPENDS:append:libc-musl = " argp-standalone"
>  
>  do_configure:prepend () {
>      # extracted from autogen.sh in crun source. This avoids
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8121): https://lists.yoctoproject.org/g/meta-virtualization/message/8121
> Mute This Topic: https://lists.yoctoproject.org/mt/99986709/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


