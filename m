Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B432C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 18:01:00 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.1491.1714672856941585876
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 May 2024 11:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A0S1njGb;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6a0b4622ea0so27450856d6.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 02 May 2024 11:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714672856; x=1715277656; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m9UOlqFWFkrfslQQtjfHDNbiLGmCKhK78GOT7RrYxJo=;
        b=A0S1njGbPnnzG0FGV+BXe5P8bba7dj9krmu5EZP1mTx5jdtWwHkRqS6j04TlJHYBiL
         xhiydELd9EiLO+qVhlh3P9WoAX9JPJEzKv9o8jzcpWHJJ88Hk9H39tFQ9ZkLjXiDDWio
         ZU6dC5iR+srI2hqSIPi37H8m/K6Ghug8Slozko8v+I4eipfFbDGlejwC9H9P16qftdl/
         5vnGQW3dKhQDEXaYQ1XH8DI6pdRzZPJj6tPlp4q7q/DAFaGV6zuOx3TbqcJZjgEr9a/g
         PyklrbSvS0pt5IALR/57gY+V5hX9yENzmk2DUj5qPDVG5HGe7kjp+l4TZdwbEtPCW0av
         HT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714672856; x=1715277656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9UOlqFWFkrfslQQtjfHDNbiLGmCKhK78GOT7RrYxJo=;
        b=wgJ4dJReI6CDI2GZLDbGvWlGjIhm4KJv8JqgtLyA9hHoLXQ4ZW5zC+aw84ziXldgx0
         4a4fwsfEE4w340UwUmiiLfV0CrziKLryTJWr0/WK++6RWu/0M9Shns41XQTUfrJB7jH/
         3WmH6/oKDV9AIMHYTONGEL8L3F1akW973hNTJboIHIpcl5QEx27LoAjLTm+SWwaOF2mH
         LeFuEMUIMH4rLMq2O8yBNfun7aA9PqSJQh78S4wXX+7C8Ch/sTPVC9Fof1sBvy/voTx/
         pkHO4W+Bs5KwD52w484TvDDm52m6r3gIiePK7YYU/eJYdEj8yc3wZ9OsxJkpWNnoVRp7
         2jkA==
X-Gm-Message-State: AOJu0Yyb7SZ3m+dzWSF7obAIdXeAAUdrGWozMsEpK/fjCzXzzLI8ItH3
	9+R6YWLfP+2+GaXL0Z8fK/bqutZrzAgnDQfSqHcUaF9xqUBTcNQfipPDUw==
X-Google-Smtp-Source: AGHT+IFq7rSSX8lps6aL4nBMZh0WaF6lm55Kn3vs0Me5r0AayLxa7jWVV9euSI5ZMK7LgBI8r9NPiQ==
X-Received: by 2002:a05:6214:212f:b0:6a0:991b:cea1 with SMTP id r15-20020a056214212f00b006a0991bcea1mr510314qvc.5.1714672855801;
        Thu, 02 May 2024 11:00:55 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id o8-20020a0cfa88000000b006a0f2c25328sm525506qvn.40.2024.05.02.11.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 11:00:55 -0700 (PDT)
Date: Thu, 2 May 2024 18:00:53 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: changqing.li@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [master][scarthgap][meta-virtualization][PATCH] kubernetes: skip
 textrel QA warning
Message-ID: <ZjPU1aQrRd2rs7hR@gmail.com>
References: <20240430061733.3518484-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430061733.3518484-1-changqing.li@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 02 May 2024 18:01:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8714

merged.

Bruce

In message: [master][scarthgap][meta-virtualization][PATCH] kubernetes: skip textrel QA warning
on 30/04/2024 Changqing Li via lists.yoctoproject.org wrote:

> From: Changqing Li <changqing.li@windriver.com>
> 
> -buildmode=pie need cgo is enabled, but for kubernetes, some build
> targets are static, and cgo is disable in build script directly, refer
> [1]. If we add -buildmode=pie by default, will cause these static target
> build failed with error "-buildmode=pie requires external (cgo) linking,
> but cgo is not enabled".
> 
> This warning is acceptable, so just skip it.
> 
> [1] https://github.com/kubernetes/kubernetes/blob/master/hack/lib/golang.sh#L811
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-containers/kubernetes/kubernetes_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index d7874dfa..044175eb 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -126,7 +126,7 @@ PACKAGES =+ "kubeadm kubectl kubelet kube-proxy ${PN}-misc ${PN}-host"
>  ALLOW_EMPTY:${PN} = "1"
>  INSANE_SKIP:${PN} += "ldflags already-stripped"
>  INSANE_SKIP:${PN}-misc += "ldflags already-stripped textrel"
> -INSANE_SKIP:kubelet += "ldflags already-stripped"
> +INSANE_SKIP:${MLPREFIX}kubelet += "ldflags already-stripped textrel"
>  
>  # Note: we are explicitly *not* adding docker to the rdepends, since we allow
>  #       backends like cri-o to be used.
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8706): https://lists.yoctoproject.org/g/meta-virtualization/message/8706
> Mute This Topic: https://lists.yoctoproject.org/mt/105816435/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


