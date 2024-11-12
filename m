Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B693AD597B9
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 23:16:00 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.101046.1731453351110258187
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Nov 2024 15:15:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U3aCSHvv;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6cbe700dcc3so43486206d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Nov 2024 15:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731453350; x=1732058150; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D58c2E4TVldqtQQwg+QVpkSm6R7iO4mPsTn/2fMuuiw=;
        b=U3aCSHvv6UVk7uZ6aXGlqUNMUFFGelm16vrNamV6hs9y3cBvqpUAtWCjltrKRJUyPL
         acskyvLwvfdxG/Yly0Oyp1GS8gEuPk6D7FqK+FPP3jbF5s7d7B5SSMWWAUwocNzrvSS6
         QiiBIBqUe31DSb1PcOvRTfsgoPqxioIkpAiQb8LYSQu0/QUd6fEYbJuB9Fu+FONZf1J5
         m0CJWi0Tm7IfC+bXAsm2Eet3Q1tKi/y2rHLrP3bCQ3w1uRo4SF0z9cb5HMTAt9vdxnOE
         8iJx2OvdQuEYqMuHGBhdG5e4jt5L4cR6neGUecGPGtUvQOcQUL+bCKF8h7dZBpx4IrZv
         ClAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731453350; x=1732058150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D58c2E4TVldqtQQwg+QVpkSm6R7iO4mPsTn/2fMuuiw=;
        b=FqoL9OgpeVyinD182wLpLdkI997OTInDP+KBUrcPBLLeDA22CjMi/y+bfgqCHlNqkf
         Pj2lHb/EJYDxdydDTPhizuMwZEjbnZrIJOp0jVpSCPJexaeglxP0GhG8jUW39AHRUbJk
         qMflwD5DPuTH4CQofMo+P4IPeKzllOeWQVs7h+mEixD7OWWSOfccK4HGJj80qg6FqNUg
         FAynOZiwzcnfO/RpCmvoC7Cqea02kzTpccXivhzeYWMIGsORv3dZpteYKJlBVFjiFojQ
         TTrjVHKxQ4Lq1vZIQRq2Wau1CpBBHpw/VYYgQllVBhjmz2vOrbV+P/ryuhhSoqIMfd6r
         DLxQ==
X-Gm-Message-State: AOJu0YzcrmU9MWL5JcmZUUY2yIRX03Om3S3l1Im/jq6iUdT+B9aIS5d/
	ypmJ+3e/sQzXMzc1aP8umTMBThla3rj7fnXM+6poTg0EUr2B9XOD
X-Google-Smtp-Source: AGHT+IEZ6NQW4NYlvArjtdKzzi/lNqbWaaNtIUQr6eBY3agaN0k7pPxujOMDR7C/QNXQwUPltjyiew==
X-Received: by 2002:a05:6214:2d44:b0:6d3:4553:49ac with SMTP id 6a1803df08f44-6d39e1cf0b6mr262767656d6.30.1731453350135;
        Tue, 12 Nov 2024 15:15:50 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d39643b5cfsm77257996d6.92.2024.11.12.15.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 15:15:49 -0800 (PST)
Date: Tue, 12 Nov 2024 23:15:48 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: chris.laplante@agilent.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 1/2] app-container: add space for
 IMAGE_INSTALL:append
Message-ID: <ZzPhpOtJYGaVcHfC@gmail.com>
References: <20241106011124.3978621-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106011124.3978621-1-chris.laplante@agilent.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Nov 2024 23:16:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8965

The reference containers are changing quite a bit right now, but
I've left the demo ones untouched.

So the patch is still valid, and merged!

Bruce

In message: [meta-virtualization][PATCH 1/2] app-container: add space for IMAGE_INSTALL:append
on 05/11/2024 Chris Laplante via lists.yoctoproject.org wrote:

> From: Chris Laplante <chris.laplante@agilent.com>
> 
> Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
> ---
>  recipes-demo/images/app-container.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-demo/images/app-container.bb b/recipes-demo/images/app-container.bb
> index 22d2ab9f..8188d57a 100644
> --- a/recipes-demo/images/app-container.bb
> +++ b/recipes-demo/images/app-container.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
>  OCI_IMAGE_ENTRYPOINT = "/usr/bin/flask-app"
>  CONTAINER_SHELL = "busybox"
>  
> -IMAGE_INSTALL:append = "helloworld-flask"
> +IMAGE_INSTALL:append = " helloworld-flask"
>  
>  IMAGE_FSTYPES = "container oci"
>  inherit image
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8958): https://lists.yoctoproject.org/g/meta-virtualization/message/8958
> Mute This Topic: https://lists.yoctoproject.org/mt/109417849/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


