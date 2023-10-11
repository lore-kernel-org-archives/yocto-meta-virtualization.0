Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E005CDB47A
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 18:53:13 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.24975.1697050388139374400
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 11:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IXnYfXpL;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-66cfd3a0e61so837926d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Oct 2023 11:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697050387; x=1697655187; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nfolfQyR3Hk67Lydwq898B9x7o2B4Kl1rHgW9DwJqPQ=;
        b=IXnYfXpL2o7m1IvXBWQWfsKjVBF8VaJOYxVImI8TFG6rlDMJiljz+VUZEVlpHCLyYq
         2NHAKodWGzCslje7om2fRTD/iPR9LgoR9XoiVaE3Ji51MOn+J1wlWG0C+LS6c9+CSIQo
         KUiEFiEecGec3ppcZauw7xaPQ97nSlue/yl4MjkBwpkEr16GQa144bu6nfIkWKL38W6v
         yEK5O9obEjdDx0fCe0V23rR5hcSwS05GvV1PiHaIMGkqCcL7GuBaWU4Kv+AcLNAz7VIs
         NdS/xEGAvu3ckn7Ecbk8y5R6/HElyzsdn53qYgeyMnie+0tw30WEs4CrVTE8F51TED5q
         XXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050387; x=1697655187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfolfQyR3Hk67Lydwq898B9x7o2B4Kl1rHgW9DwJqPQ=;
        b=e0LPTlroVNnD9kme0gStlE0jXKildCJKAUw8q4axa7wxEx8foqGRpvcOmpx5Dc9w4N
         UvBDLDazxPLsBDogqD5VF5XycRQW6LISGklBwedes0Rn85dHBIJAEoOm4/tTFn/ivsxj
         rP1KlwBAqUM2oEWqn+tl31YXzSsIwCxuQiLOTpxXYNQa4g8tsXHxYHtBLpnadOYWuVS0
         v10z68Qc+AyPwbOXvkJ+2A8kpZZuGoyO7g4rdA94u8ODuF3J3aKw5HNkAh6FSCBpfRIq
         Mpv0hmeTAyr68xF75C/tTkoWbL0lpH12xZB+i5TftIBTEPKtGJPKMxhkbgLhdNSfqDFn
         ctjA==
X-Gm-Message-State: AOJu0Yx2df5AQFqk3qVslwrVW6e7SHUDsr5dyPR6Wy7IViir2aWk2Nbn
	x41P5PjW711kNgbjId5i5nI=
X-Google-Smtp-Source: AGHT+IGD99RfXVwZQr1DDDcfkBBDztRYnRYRmB9nYMiJ/edZb2NMCoXMN+bVdeQvnbRdlXfhgaSqcw==
X-Received: by 2002:a0c:a619:0:b0:631:f9ad:1d43 with SMTP id s25-20020a0ca619000000b00631f9ad1d43mr20435995qva.14.1697050387036;
        Wed, 11 Oct 2023 11:53:07 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id a12-20020a0ce38c000000b006365b23b5dfsm5812942qvl.23.2023.10.11.11.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:53:06 -0700 (PDT)
Date: Wed, 11 Oct 2023 18:53:05 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] umoci: Remove the buildpath issue
Message-ID: <ZSbvEb1TjJ8De+hG@gmail.com>
References: <20231008080259.3346765-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231008080259.3346765-1-mingli.yu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Oct 2023 18:53:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8349

In message: [meta-virtualization] [PATCH] umoci: Remove the buildpath issue
on 08/10/2023 Yu, Mingli wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Pass -trimpath to the build to fix the below build path issue:
>   WARNING: umoci-v0.4.7+git-r0 do_package_qa: QA Issue: File /usr/sbin/umoci in package umoci contains reference to TMPDIR [buildpaths]
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  recipes-containers/umoci/umoci_git.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-containers/umoci/umoci_git.bb b/recipes-containers/umoci/umoci_git.bb
> index feaf6dff..e2116892 100644
> --- a/recipes-containers/umoci/umoci_git.bb
> +++ b/recipes-containers/umoci/umoci_git.bb
> @@ -68,6 +68,7 @@ do_compile() {
>  
>      export GO111MODULE=off
>  
> +    export BUILD_FLAGS="-trimpath"
>      cd ${S}
>  
>      oe_runmake umoci
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8340): https://lists.yoctoproject.org/g/meta-virtualization/message/8340
> Mute This Topic: https://lists.yoctoproject.org/mt/101829789/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


