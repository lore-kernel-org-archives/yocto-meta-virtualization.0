Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D416C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 03:04:12 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web09.3832.1651028643170511405
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 20:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RBzQGLzR;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id o18so298862qtk.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 20:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ScStNTBJshU0r73SxcwMumh+r5u2FX4w9CZ0D3wptaE=;
        b=RBzQGLzRBGYlRLgeP38fR/9Mv/0cUgvzWHEkzT5sXIyzTR/Sryj3Qx2PiVWppXXUQn
         DyDQk0uIKNuX/eZgoj2XD/aSYZqujhJokeBb4V2QwUz4fmLWeGZBzh2fhYq1phUmMNno
         uLK9oTgatiu4qcbU7Zxm6CckcJC+u+b0xXryZxcHZZ89xJFc+b9jS4tVtRPcCcxKsi9H
         6NEd/5tPqytlBc/wqNqgB6e9WHIUfCWDCJerNxTRf+9G3e1yOdZPbs/eZkpA0gFi/r5F
         N3ewyVaBPHkswvhBiAUhfkFxadVyRhMaGt5PNjXDDdtyJO7KHNXHs1k6ja1DHYDJ+sQl
         DZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ScStNTBJshU0r73SxcwMumh+r5u2FX4w9CZ0D3wptaE=;
        b=2ThdCPQhbdMvjz3KeCxzRWHKqLz456sFZlApuq4p/bPChrVjXhK0jXipL4P3984FqZ
         JGg9p/N6E3uEnmBUYegL21YcRhv4QwdoUv28gJzZS81LDoGN6GQFhje3iyjfLJ5sHO7g
         wFoBCiOGo3MsUlb5VB7WcC1WoFkRUoE9WP/GCaetJ/ctEJWdiczNQbkGsLNtQActMf3D
         h6fZ7CTpCU4xYLMlbKTVpN9h/k0TKRWHapWf6cNjapJnVruDku52520fFJZnqJDW++mS
         2RgfD8zZfsm5mh7UrxtErYIVDVWkMvRbZfKtGAxhhWZhfy2T5cVw5FkN38Ly1VOV68oa
         NLjg==
X-Gm-Message-State: AOAM530dVA7DPAaft3t5ilzqICPTMGatxo0ZRY2I1cs7LWQd2gWuKrl6
	XMwVExxx7izhP5RVEmHEmgulht7NbkGeZA==
X-Google-Smtp-Source: 
 ABdhPJxU9DtD0CkWxXzA/wg6NyP43AKsxbF4XmgLOFSbD2NbcyIWz69yOseDzE6m6tagHDuGjVBNmA==
X-Received: by 2002:a05:622a:610a:b0:2f1:cce:15fb with SMTP id
 hg10-20020a05622a610a00b002f10cce15fbmr17329229qtb.436.1651028642226;
        Tue, 26 Apr 2022 20:04:02 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 e15-20020a05622a110f00b002f33d65b065sm9221651qty.73.2022.04.26.20.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 20:04:01 -0700 (PDT)
Date: Tue, 26 Apr 2022 23:04:00 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-virtualization] [PATCH] xen: Add missing space in append
 to IMAGE_INSTALL
Message-ID: <20220427030359.GD55546@gmail.com>
References: 
 <bba589c4be43035a5b84d5d470a0d62c2f14cd83.1650644264.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <bba589c4be43035a5b84d5d470a0d62c2f14cd83.1650644264.git.bertrand.marquis@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 27 Apr 2022 03:04:12 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7224

merged.

Bruce

In message: [meta-virtualization] [PATCH] xen: Add missing space in append to IMAGE_INSTALL
on 22/04/2022 Bertrand Marquis wrote:

> Add a space before doing an append in IMAGE_INSTALL on x86.
> This is solving issues happening if someone is using IMAGE_INSTALL in
> local.conf to add things to the generated image.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  recipes-extended/images/xen-image-minimal.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
> index f6fa5ed..3cf4230 100644
> --- a/recipes-extended/images/xen-image-minimal.bb
> +++ b/recipes-extended/images/xen-image-minimal.bb
> @@ -21,8 +21,8 @@ IMAGE_INSTALL += " \
>  do_build[depends] += "xen:do_deploy"
>  
>  # Networking for HVM-mode guests (x86/64 only) requires the tun kernel module
> -IMAGE_INSTALL:append:x86    = "kernel-module-tun"
> -IMAGE_INSTALL:append:x86-64 = "kernel-module-tun"
> +IMAGE_INSTALL:append:x86    = " kernel-module-tun"
> +IMAGE_INSTALL:append:x86-64 = " kernel-module-tun"
>  
>  # Linux kernel option CONFIG_XEN_PCIDEV_BACKEND depends on X86
>  XEN_PCIBACK_MODULE = ""
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7211): https://lists.yoctoproject.org/g/meta-virtualization/message/7211
> Mute This Topic: https://lists.yoctoproject.org/mt/90631753/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


