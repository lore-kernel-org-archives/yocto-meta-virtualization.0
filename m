Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 462E8E7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 03:46:46 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.2363.1733802405540009416
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 19:46:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LR3aadzO;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-46750537450so20546801cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Dec 2024 19:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733802404; x=1734407204; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IKZnkJje46j8t5o6s9mCiDn4NPGjt1Hu22lKjdHmJhc=;
        b=LR3aadzOKAwvuKiik+MnyDPU6yE7Zsc+3pKr8nzv512ZYqNTIB+w9vBO1/H5u6s9IT
         RvwZ0mXhplf5YcVKuj1PTDDyS+favtcNA+Jh4/G8sf+24VHDqdJANEAc8N+QXJRllVTD
         4QqHz5WB8MMMZuksONeZgzsa9Mud8m+ZHZ7ZJha8YqsdQsC4IQYWsN1ZRBh/oy9HjN9/
         bTV1U03RU+Whwuwn8W5L8QfA3K1Nmz59eEhT5atvngkNXNIPZUij/uM1ix4Ww6qw475p
         OmrjiRNPWQkGqMWHoszI6POUfU+GOWSrJ0Pn4gsxBmTjnWpgSV9YrP5DWILvB1SF2LVD
         qnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733802404; x=1734407204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKZnkJje46j8t5o6s9mCiDn4NPGjt1Hu22lKjdHmJhc=;
        b=hzMe/4wQYlzC3axYOUMxmqkR6TMm7uQi9uIi4tiOixe/FJg+PFpYC9LrcU73+ps7G7
         Cru6EmOw+L4qNEl1eLi9NpH5BbHL3CaPEOTXgTFITollzV73thGLCN2LLB51n24urnS9
         1smTcvE+qwyqhwSe7qXhHZSdCPKBlECBpN5Qn+EMzvysNSVsroBroHH+UZMaNoq51xML
         dyymSgKNsWTtAiITPS0LOI/BW3vJpdFiPWRzhUzEfrezD9zlBq/XC0w8VQRWBDJJxHxP
         nlJ9pO+lkl5sTO/dl6JWYQ8t9aUP22LofjSjfLfnev5xv7KS5kkDTud1ABPX0gLl1e0N
         cRLg==
X-Gm-Message-State: AOJu0YzMnxylQddr/OIxEHsWhNeq2EOp+EXegpIyb6UpDCCRevyzfdUw
	x8PQj21I6BWdtNS4GsAqRFgccWDwARG5HvnIyFmaV/QESEHi99vmDCTFCWzF
X-Gm-Gg: ASbGncukTdajs1sP9sXbGDjxPhNeDaqaQ7iiNt8c0y+pSaCXdmJBNZWDApJgAqiYq5J
	Kz1uT49X8mG45V7tZZ3cjSJnynOvc2Z2eSIE9i2BxA317G1j2ZcDiBiK84XQrRC2Hscz6S/YUpM
	gRoh6ZMPeYH959u9+C/RiOiNcQ8sT/f+6fSmpPBczITAdBjMCGkd+3XWFskxgSO/x9AAHY3mvpa
	vlew1TC6XLRqKsMsr27ofnnEYiM4Ri9Yu5CnSd7JXVsZxcE83R/XinOLGzL/0r6qekX1hyQnB5t
	GtGhIW+9dundRqhgklVk35g9YOsBKjmX
X-Google-Smtp-Source: AGHT+IEKQSmy2HQQbZjvbGFw8GPWXT5+IVPsgb5RPcBhqTqfoOj24I5DfC4iVIJjk80gx7tMW8w4+w==
X-Received: by 2002:a05:622a:1454:b0:467:614a:b6d with SMTP id d75a77b69052e-46772028ad5mr50228791cf.45.1733802404456;
        Mon, 09 Dec 2024 19:46:44 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46749077e48sm33029741cf.87.2024.12.09.19.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 19:46:43 -0800 (PST)
Date: Tue, 10 Dec 2024 03:46:41 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: vanusuri@mvista.com
Cc: meta-virtualization@lists.yoctoproject.org,
	Anand Je Sypureddy <anandje@mvista.com>
Subject: Re: [meta-virtualization][m-c-s][scarthgap][PATCH] mod-wsgi: upgrade
 4.9.0 -> 4.9.1
Message-ID: <Z1e5oZUi4s+EDq/L@gmail.com>
References: <20241203122618.3728824-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203122618.3728824-1-vanusuri@mvista.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Dec 2024 03:46:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9053

merged.

Bruce

In message: [meta-virtualization][m-c-s][scarthgap][PATCH] mod-wsgi: upgrade 4.9.0 -> 4.9.1
on 03/12/2024 Vijay Anusuri via lists.yoctoproject.org wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
> 
> mod-wsgi version 4.9.0 doesn't build against python 3.12
> update it to 4.9.1 which does build.
> 
> Signed-off-by: Anand Je Sypureddy <anandje@mvista.com>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb b/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
> index b0daf54d..71886624 100644
> --- a/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
> +++ b/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
> @@ -9,8 +9,8 @@ HOMEPAGE = "https://github.com/GrahamDumpleton/mod_wsgi"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  
> -SRCREV = "df9faf954a1ab6208f45ba6fde90f0b41f605483"
> -PV = "4.9.0+git${SRCPV}"
> +SRCREV = "0497f0c29e8dd06608378e6fc814a6037e8c6906"
> +PV = "4.9.1+git${SRCPV}"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9034): https://lists.yoctoproject.org/g/meta-virtualization/message/9034
> Mute This Topic: https://lists.yoctoproject.org/mt/109898892/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


