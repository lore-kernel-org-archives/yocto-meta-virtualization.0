Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BE9C3DA59
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 22:25:17 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.31195.1721687114089105725
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Jul 2024 15:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EqebwrQS;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-260e12aac26so2875826fac.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Jul 2024 15:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721687113; x=1722291913; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lTcFgQcfqFuoTGEPkEVC+NwLwNNcyUWVZxmB/QfHUS0=;
        b=EqebwrQS2eC7RPdZwsVg0Yc1HntKPT2X2YLShyDxN5FyGCnK77x2np0B/gIYuyhrPk
         pAiUj3OlfzFrvozCrbcxrq3dutb1yMdepZ9XUBum7CY2myt/TjAXBENc9YZptoHcDE6w
         lo20s3Z4VBw+oa1TEf/NHYX83F/UMu+8Go6e2kA0/RMu8mMBO9CgCKodpmyxOIhmSjnw
         D+nnnzmRMGgjTzHR8XSWhWxRuJgE0cjx6+SA0R5JCO49CpVveyjifKj97Ji3mxLrZIqA
         oaor6joyc1u163kzg67wO9C70S7KDowjlKInkiGK1czD1x5EmO6DVP5ag7iUU2r34afg
         pY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721687113; x=1722291913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTcFgQcfqFuoTGEPkEVC+NwLwNNcyUWVZxmB/QfHUS0=;
        b=MG7j4riPz6i+466r7P+FkU7W/YJOOzzQfNFJ81t9tbuJlE3HYL5d8410cTa4VG/lyd
         nFYqftYqLUXT3/hbQnoAUDcSN+A1JsZGK2YC1IwEx8GUmb/KK4sfqyDMgVGQwc/U99Ux
         gXoP4FzLsWbbfebs8jAhw1If5HXtIyE6tsftTphUNwg1Y3wudG/bRTtpLHzxrPKaqIJD
         0XZmTynMFL3SaqwM3Y6VPvqw435iWas2wng2Nc/QOZedfFOwliJw9qkdBWNP5I0vKiUO
         jjYoVfHChnrscbHRixGGBIeBXPE8WeXK9HfBQdEUQzMy6XOQCtDxs9WS4D8nFClMXscN
         /+Vg==
X-Gm-Message-State: AOJu0YxNNMj2MJCLx64BUELB1Q3VCLQ+9IGI+y3p0XP7DWoP51UrOHna
	vv/8eMfZtlJyb7yfy777bOSWIhep5jE646PukQm/3pvTc87eaZAi
X-Google-Smtp-Source: AGHT+IEFZtEDbvFVsGXQnktb8qF4Df3bOxJ3oOC3JxYHYCzGtuuEyWpwwbBtQc98QYAhZdA2s9YdNA==
X-Received: by 2002:a05:6870:d93:b0:260:ea0c:acc with SMTP id 586e51a60fabf-264692a7423mr962337fac.49.1721687113145;
        Mon, 22 Jul 2024 15:25:13 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a198fbfbbbsm406578585a.42.2024.07.22.15.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 15:25:12 -0700 (PDT)
Date: Mon, 22 Jul 2024 22:25:10 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: mingli.yu@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH 1/2] docker-distribution: Enable
 support for riscv64
Message-ID: <Zp7cRu0H/zKyempY@gmail.com>
References: <20240709101657.601908-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709101657.601908-1-mingli.yu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Jul 2024 22:25:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8842

staged to master-next.

Bruce

In message: [meta-virtualization] [PATCH 1/2] docker-distribution: Enable support for riscv64
on 09/07/2024 Yu, Mingli via lists.yoctoproject.org wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Revert [1] to enable support for riscv64.
> 
> [1] https://git.yoctoproject.org/meta-virtualization/commit/?id=3626f2c9ccd56c6a3ee51304a7da7aafb395a588
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../docker-distribution/docker-distribution_git.bb              | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
> index 3ed91f12..4e64df4f 100644
> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
> @@ -73,5 +73,3 @@ SYSTEMD_AUTO_ENABLE:docker-registry = "enable"
>  RDEPENDS:${PN}-ptest:remove = "${PN}"
>  
>  CVE_PRODUCT = "docker_registry"
> -
> -COMPATIBLE_HOST:riscv64 = "null"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8820): https://lists.yoctoproject.org/g/meta-virtualization/message/8820
> Mute This Topic: https://lists.yoctoproject.org/mt/107119844/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


