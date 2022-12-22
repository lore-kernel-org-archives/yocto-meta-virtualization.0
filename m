Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBD6C4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 15:35:22 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.48066.1671723318270368696
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Dec 2022 07:35:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LNsypkNX;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id h21so1571798qta.12
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Dec 2022 07:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1XmM/aEx0qD+mf2HVgW2fFd3LjU3gFpuolz4ial0WE=;
        b=LNsypkNX0NImnsHdnLHVN8vPdNin2Abw1W0iqyL0DxeSg4z9EADw18ORwVpgsb/xT9
         88QaMqk3UwmgxoCHSOooi9ZnimISeq3EAviRPvv4P2t7VtSZ0/vFer2MGQOBBkgFVnFl
         z4QRl1ev3gOO+37PJBIYZRukGz+nrG+vjNDqzOlOF1xxM74rC7SFMiqQPin/XMjvSpWh
         xNes8hhWi3aKEYNYP8YRM3c69IKQmnfx2f41ZNPzfezaB0RlYmn3KrKK4dDQXrpIilk5
         uF59KayUm+ceME1x6Fu+dgln9dFhXeLK6SEv/oCcarKIphqB3uoVuTG8b1Cg4Klu8ssy
         H6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1XmM/aEx0qD+mf2HVgW2fFd3LjU3gFpuolz4ial0WE=;
        b=Q2+28KONVnL391q4BLifyCqe1RxCotum76SFn1dOXsm//R0WmsLgVD2CH8oRM0BEgK
         v/NArIfHplVsoyAdqnbdqpGSOY5HSnb8NuwqJg3udg22OihzLh7JVcV2l7nSq8x5PdTW
         iJyuJ/246AA7i50VTuz9XWZcUHonD7+Coc6ydyjP0K+IuEatjbk1CQCn37Mj6kLhqgmG
         xjIjEdMluWW0FFsmEWrxf6YVAtg8XHgfBKlkYPBwswO29NEujnnnk6JsefSaTu0LxMKl
         yL+S7a2hmrxbFVSWFGhvkovRPMK0HW86eocLEX2AHUKB2CCTYnG9t+/KPs2icvClhF/T
         gWow==
X-Gm-Message-State: AFqh2kpO1jR8uX4yAzfh9t4j+eDIzAvm+FDkg8tgTjHpTbGyg/HcUwsr
	SppgF4xve+OE1DFhjm9nvS/lmK5IMtE=
X-Google-Smtp-Source: AMrXdXvDgscc11lHxtevFJrnNQVjpBUKpebLFsAd4pD2q2REA0zMjeegDHlwpKQtls9J3isKi1nu3A==
X-Received: by 2002:a05:622a:1c09:b0:3a8:1e9f:47f5 with SMTP id bq9-20020a05622a1c0900b003a81e9f47f5mr7040782qtb.45.1671723317091;
        Thu, 22 Dec 2022 07:35:17 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id t3-20020ac85303000000b0039cba52974fsm485572qtn.94.2022.12.22.07.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 07:35:16 -0800 (PST)
Date: Thu, 22 Dec 2022 10:35:15 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: mingli.yu@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] layer.conf: add meta-virtualization
 to LAYERDEPENDS
Message-ID: <20221222153512.GA42787@gmail.com>
References: <20221212023520.2601170-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221212023520.2601170-1-mingli.yu@eng.windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Dec 2022 15:35:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7780

I could have sworn that I already did this change .. but I can't
find any record of it in my branches.

So I've gone ahead and merged the change.

Bruce

In message: [meta-cloud-services][PATCH] layer.conf: add meta-virtualization to LAYERDEPENDS
on 12/12/2022 mingli.yu@eng.windriver.com wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Fix the below yocto compliance issue, the libibverbs under
> meta-virtualization provides virtual/libibverbs.
>   ERROR: Nothing PROVIDES 'virtual/libibverbs' (but /build/layers/meta-cloud-services/recipes-extended/glusterfs/glusterfs_6.1.bb DEPENDS on or otherwise requires it). Close matches:
>     virtual/libc
>     virtual/libiconv
>     virtual/librpc
>   ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
>   Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'glusterfs', 'virtual/libibverbs']
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  conf/layer.conf | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/conf/layer.conf b/conf/layer.conf
> index dca6a109..e089b7d1 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -8,4 +8,8 @@ BBFILE_COLLECTIONS += "cloud-services-layer"
>  BBFILE_PATTERN_cloud-services-layer := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_cloud-services-layer = "5"
>  LAYERSERIES_COMPAT_cloud-services-layer = "langdale"
> -LAYERDEPENDS_cloud-services-layer = "core filesystems-layer networking-layer"
> +LAYERDEPENDS_cloud-services-layer = "core \
> +    filesystems-layer \
> +    networking-layer \
> +    virtualization-layer \
> +"
> -- 
> 2.25.1
> 

