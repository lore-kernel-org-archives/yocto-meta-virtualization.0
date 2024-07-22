Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB818C3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 22:25:57 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.31202.1721687150527593774
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Jul 2024 15:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LjPcPlZm;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-79ef8fe0e90so317837585a.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Jul 2024 15:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721687149; x=1722291949; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dEtHXururfI3z7YE5f14lmeZvkHLZ7aoy0zPimg7e14=;
        b=LjPcPlZmU5FssF1S+Z31OyDabOCCoqvUMdxCvR7yIT3NI3KV1mhOaloxGuDUHiSMHS
         hpuXH1K7O1hyTKEMw2b/VUCfnImqB8jUM1hwOOFildKbb5d8+FCYMlgZAr/4Ur4Vqd/L
         /l+wK43LQj2FmETf1PETTQikSrjjOdkW0jR49dbfgk5r5zlCXZsI5MPSE1VSKRLksaK4
         8C/716grmjq/tHGWhj9By+4aKjN4fSoDh0p3csVS8G+RtNABfMXxkkCbbmhA/5ratOyq
         gH/XEOs25LQrPMWrb7+CWewJ8DRX8B7mxMed62rjA8CJU9s6qvv/lfRd8uWXj3+Vx+Qp
         n8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721687149; x=1722291949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEtHXururfI3z7YE5f14lmeZvkHLZ7aoy0zPimg7e14=;
        b=Rccv3f3eUxtZ+Mqg0J5qhg+ed5rJJpPEeogU6MsQBCchO25vZCgYCAdF9TcU0c29rr
         0rnkHcgoHA2w1BZbcM++CXKeQ13Ne8aW2ftLCAXu9uo9DvGeIVtNBgzzjBwplLSG2+Nj
         FM5sONO6sDGDzB/sXixv1SrBu1ae/XusoKFeLYe3b9YYOtGOpnVK93vyf3IKGX9Ce4yS
         ekMFzV+SDolNbghABPLRI2TquvfP8jqQFO/Nm6pcwODxnBanJIhrRAhpydsRgv6AYALP
         6ccp3jqAwodCH+H71hnNQc+VHBSnZj7qzMU7f3WjPwSroJfU02ISvgzm37qY0R59DiCg
         THOw==
X-Gm-Message-State: AOJu0Yzb7a/Q4jwgFcdntmyDC57N9aIs7JBODfS5LgyrctJEnHrm7t0D
	ej5xHEiCIobPX6rrpWVZZviqNS9FDgBnFPAliOAQEGYLKJJrj+kXeK37v/TV
X-Google-Smtp-Source: AGHT+IGJ2iY2B/2XpgBUJd+vQ8R5SaWEmbJJIIWvlqQI+fpt7bqRZvHRtCC2VWCWsuZ/lFjP7pVnIQ==
X-Received: by 2002:a05:620a:4144:b0:79d:532a:fcbb with SMTP id af79cd13be357-7a1a131c6e8mr1171035385a.2.1721687149419;
        Mon, 22 Jul 2024 15:25:49 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a19907a6b2sm407573185a.101.2024.07.22.15.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 15:25:48 -0700 (PDT)
Date: Mon, 22 Jul 2024 22:25:47 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: mingli.yu@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [scarthgap][PATCH 1/2]
 docker-distribution: Enable support for riscv64
Message-ID: <Zp7ca2m6JBnENNZW@gmail.com>
References: <20240710053841.2981650-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710053841.2981650-1-mingli.yu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Jul 2024 22:25:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8843

staged locally, once master-next -> master, I'll push this
as well.

Bruce

In message: [meta-virtualization] [scarthgap][PATCH 1/2] docker-distribution: Enable support for riscv64
on 10/07/2024 Yu, Mingli via lists.yoctoproject.org wrote:

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
> index dbca0d55..48f78689 100644
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
> View/Reply Online (#8830): https://lists.yoctoproject.org/g/meta-virtualization/message/8830
> Mute This Topic: https://lists.yoctoproject.org/mt/107137587/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


