Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F51BC433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 04:33:32 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.12843.1669178004960005472
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Nov 2022 20:33:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iJ3cxKpx;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id w4so10665852qts.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Nov 2022 20:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQgKooAVCVRF9qZoLnLi+Gl2UYzWRhl1r7etn25s65A=;
        b=iJ3cxKpx433oXy4/NwIMIpiBrykJnu+3Caju0yn43kli7AG3+OnYG2gFOuNEInuLVD
         NHBcOk3yOJhkXTdktuGCHDuZHU+NHmMBKHpefh/yLNQXinAiZ0HNY16kdiCp7JbNb3xh
         8YuG9AiHm9YYWFnsQ504AwD8LAEUG3vwCJ+9SFnAbJid68jE33F3v4tYxy8t2M263LI3
         0EiFrdfRZvB3GxmwPns7G2oOH6Cvxpd9owMvuDQ1ucjV0M46NzXIHo2IlfVFImzBr6c5
         MZ8/qSRz6fA2/k73/ntVxwMjs8WtE+y9MZ6MUdjNhhxr15qPXFrTJCRgsibUJTrYU+ge
         hsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQgKooAVCVRF9qZoLnLi+Gl2UYzWRhl1r7etn25s65A=;
        b=guMTjNhGXWmEYAaM2NsYSeoqS5P+KLyRvy2X4yxQKLWpg7QCJstazIbIZyJjzzVzVT
         UR+VW1PHFRnn+PdqH/YMjFnZuD6jCCHyKhUrul1L/C89WbkK4znFDGGoI2lOFL567vry
         /QP6krGX6YEUL2nJG7MJPjfRzQ3u8t4rTRIjhTkuNTsU8C5zylQpjGATXgri3FSNXjqk
         /iR2S0niGcWE/qLKRVnJaZjl1mQroJMIq1A7EElyagExI7LxahwJXxEWXIMxGznP3sTA
         PA5o8bt1R0Qcd0HIJOd+UaruDtUJyd3EYKBLMZg3ra3Q5vrUjbov5J4a9/17RsUdABzk
         DiTw==
X-Gm-Message-State: ANoB5pmB7gYE3TQ6VJao4G/w+mjFg8SBqbbBOIC7mp+xlLnx3Wp81Z1X
	AeTRcKtQvAsQSTFYlXiaBPARa3P8Y4gn9w==
X-Google-Smtp-Source: AA0mqf6LgLMDP4rl2LyWa0qlPZA/7lAw/A2Og5+WSwHsuLXGIUn8Mav5ZdA7a0ckiBLw0wsThr8yEA==
X-Received: by 2002:a05:622a:174b:b0:3a5:8668:988b with SMTP id l11-20020a05622a174b00b003a58668988bmr9135604qtk.184.1669178003978;
        Tue, 22 Nov 2022 20:33:23 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id fz10-20020a05622a5a8a00b003a50d92f9b4sm9338277qtb.1.2022.11.22.20.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 20:33:23 -0800 (PST)
Date: Tue, 22 Nov 2022 23:33:22 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] docker-distribution: do not build
 for riscv64
Message-ID: <20221123043321.GB59995@gmail.com>
References: <20221121014856.31761-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121014856.31761-1-Qi.Chen@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Nov 2022 04:33:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7692

merged.

Bruce

In message: [meta-virtualization][PATCH] docker-distribution: do not build for riscv64
on 20/11/2022 Chen Qi wrote:

> Currently docker-distribution has a do_compile error for riscv64.
> The problem could be reproduced by:
>   MACHINE=qemuriscv64 bitbake docker-distribution
> 
> So explicitly set COMPATIBLE_HOST here to avoid it building for
> riscv64. When someone interested in using this recipe for riscv64
> fixes the compile issue, this setting could be removed.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../docker-distribution/docker-distribution_git.bb              | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
> index d0cd8f3..86fcd62 100644
> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
> @@ -73,3 +73,5 @@ SYSTEMD_AUTO_ENABLE:docker-registry = "enable"
>  RDEPENDS:${PN}-ptest:remove = "${PN}"
>  
>  CVE_PRODUCT = "docker_registry"
> +
> +COMPATIBLE_HOST:riscv64 = "null"
> -- 
> 2.37.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7690): https://lists.yoctoproject.org/g/meta-virtualization/message/7690
> Mute This Topic: https://lists.yoctoproject.org/mt/95164454/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


