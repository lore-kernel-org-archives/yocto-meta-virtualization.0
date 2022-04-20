Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B19C64E7C
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web09.11197.1650478352867658177
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 11:12:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eWRN6/uX;
 spf=pass (domain: gmail.com, ip: 209.85.217.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id m14so2306139vsp.11
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 11:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BTZzaUrAcjfPYATfvopLntrcWeJj8F3yoaHFlP/0l+g=;
        b=eWRN6/uXMq9oiiW8afto6Bm5HM8lQFWuSbQcsVriCzQ/Q7Eyo1ycY5LOMyIAt0tazL
         YSOh79bfg0zD8f80hTNqe7Gi/oRWcMnUYuROXbuEZ6UFK+gYRQktqwT3yp9aBTtvuq08
         UkU1fqaC0Ywjg0Zs4yL3eba0W2oPRVMstqb+PZ++OnsCajBpTuhKKy4I3A/U+JfcFw9b
         YNPLB+npa2/xSdeiQI675V92OOfCvdCcHMu04taSXHa1OuUEID7oXfLjRURsAqzKg4wj
         TCO3IdJZC2jAd8SkXJebJPsKAfCL0CzAt5mYN2ZMZ4Vt3T19AZFOiwQaTmQzh5tzjAby
         1GPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BTZzaUrAcjfPYATfvopLntrcWeJj8F3yoaHFlP/0l+g=;
        b=HLIsscFUEWtxUO6C6nrwjhb4FMIrVGmZYifmZJ9HWuJexyy7TeeVa7IU9Gj4rwirNX
         K8o0I12l7bEM9pEBdpyoSGe8x/SDlibIx1W65qLR4gFJHBOGAN4M7Vqsf9yBOR9C25tT
         n4pglSDsJ1x55KzmlB9eufP1rGW/JNE4pJGkXC2iQZkt1YVZni4MGgvAaKY7p2dp+iFs
         jfeBmTqMLrwpLgRAxzX7JbNiABEjRPQZm1cbu96pgffPkmryVYM1GSZ6YCFo0O4ghQo1
         fRCxXBBT9YVUcUnVcCdhxBeroCMFl5hLY31o1LWnLjfesNmZWrZqIm/DvdUKigBkMIPi
         2Qfw==
X-Gm-Message-State: AOAM532YjqRlXar3tWqmIngI17i/IeGeo/xB3aNVWzg/0xSivHUSSgsL
	0kJV54V6e82CJcZdC5VGIZ0=
X-Google-Smtp-Source: 
 ABdhPJzh+4Wnai1WZEYDqNwyJlptsQ79HjtqEXg33+esVelEBCwxs1xdHrlCplP6CWJrqvBPWcm+rA==
X-Received: by 2002:a67:d717:0:b0:32a:2b35:fc8 with SMTP id
 p23-20020a67d717000000b0032a2b350fc8mr7009104vsj.67.1650478351988;
        Wed, 20 Apr 2022 11:12:31 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 x32-20020ab048a3000000b00342b5e4ab73sm462453uac.7.2022.04.20.11.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 11:12:31 -0700 (PDT)
Date: Wed, 20 Apr 2022 14:12:29 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Neill <richard.neill@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-virtualization] [PATCH] k3s: Add missing IP Virtual Server
 (ip_vs) feature to the kernel config
Message-ID: <20220420181229.GC60199@gmail.com>
References: <20220414101712.19354-1-richard.neill@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414101712.19354-1-richard.neill@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7204

staged on master-next.

Bruce

In message: [meta-virtualization] [PATCH] k3s: Add missing IP Virtual Server (ip_vs) feature to the kernel config
on 14/04/2022 Richard Neill wrote:

> K3s (and Kubernetes) supports load balancing via IPVS, and by default reports
> errors when IPVS kernel modules cannot be loaded.
> 
> This patch adds the missing reported kernel modules to the k3s recipe:
> 
>     * ip-vs
>     * ip-vs-rr
>     * ip-vs-wrr
>     * ip-vs-sh
> 
> The modules are configured by including the ip_vs kernel feature.
> 
> Signed-off-by: Richard Neill <richard.neill@arm.com>
> ---
>  recipes-containers/k3s/k3s_git.bb               | 4 ++++
>  recipes-kernel/linux/linux-yocto/kubernetes.scc | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s_git.bb
> index 53a8677..a20092c 100644
> --- a/recipes-containers/k3s/k3s_git.bb
> +++ b/recipes-containers/k3s/k3s_git.bb
> @@ -2704,6 +2704,10 @@ RRECOMMENDS:${PN} = "\
>                       kernel-module-xt-nflog \
>                       kernel-module-xt-limit \
>                       kernel-module-nfnetlink-log \
> +                     kernel-module-ip-vs \
> +                     kernel-module-ip-vs-rr \
> +                     kernel-module-ip-vs-sh \
> +                     kernel-module-ip-vs-wrr \
>                       "
> 
>  RCONFLICTS:${PN} = "kubectl"
> diff --git a/recipes-kernel/linux/linux-yocto/kubernetes.scc b/recipes-kernel/linux/linux-yocto/kubernetes.scc
> index 1e93b70..a94ae84 100644
> --- a/recipes-kernel/linux/linux-yocto/kubernetes.scc
> +++ b/recipes-kernel/linux/linux-yocto/kubernetes.scc
> @@ -1,2 +1,3 @@
>  include docker.scc
> +include cgl/cfg/net/ip_vs.scc
>  kconf non-hardware kubernetes.cfg
> --
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7174): https://lists.yoctoproject.org/g/meta-virtualization/message/7174
> Mute This Topic: https://lists.yoctoproject.org/mt/90436886/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


