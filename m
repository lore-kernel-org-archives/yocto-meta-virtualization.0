Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7A9C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 03:03:32 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.3780.1651028609278898002
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 20:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bNvn2IV6;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id n185so456346qke.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 20:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gch1k1EfarIs56s8Uf3VIrZp3aDTUuZclUrq+W3c6gE=;
        b=bNvn2IV6jbhqXoLM8o3N8yUFABq8JupImpOt2vNE4Edm44wQJ9M2mtlL8DQO8drG+g
         +wE2MXbf/a4UarHJOIwzBWjcWY9Kbqu6LODuMPcf1XAEwLZHe9rc2n4KaZ7C4Uv7ltsc
         Y98aqA7U/ub4fWddE5AliHxZh1gJtxqr65dCOk2T0peofkV+1l9q1I+oNNQveXZtIkOt
         uBe59z9+VP+fa7q92nN1gpwadAU55c+7W0EiKVY0CPQIAvOD4hpd467Ju5rEJPi55i6o
         uMX1OxjrGszPd/LppKjOLuNQzDaDicaFibsSYYFfkH5eEV6ZogkuET4LBqQBvGQZiJW3
         wJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gch1k1EfarIs56s8Uf3VIrZp3aDTUuZclUrq+W3c6gE=;
        b=eNbXiaN/e9DFYzfS7AhmKBrnJpod7+AXeuNnpzm68etj/CWQ65buE/1rB9AxWmDRaX
         4D5rNYpRf9oj5ORp3+iLf/L/UpaRG79GN65MZqd3oZFV4y/48l97oD1rPd10ZnM1WC5v
         wH0vb/6I455SziCde4CM3jLG5LQeb59oYDc7CjVCBCfbu9b14bf3imN4xPcdmtb7bL6F
         JdxFcklOmHKvEBlV/1/zh+O66459N7hnSPausphGOFBAnnc33VZiMaKDd0yOnYraAyPS
         ibwsNhc15nFQvROrMx95nI7l0fqAU7QpxAFOzrAz5w7pnqndFyoQlJvqilLQStap1phZ
         vr6w==
X-Gm-Message-State: AOAM531oDD+sm72DI59gQto7KYbMNXf4P+S1WhwjnjI05AhhhzgwEDiQ
	Vslc0Fg2+0GEoloVKvnTFWzq1ffrLt4itg==
X-Google-Smtp-Source: 
 ABdhPJxRiNZv3Ut9wnAfj02gk4LPsHMs4gZx0Ayw3J0rxP2C1JBpQ8cMd2sTffevAprDnAMGTFuE8A==
X-Received: by 2002:a05:620a:1a9a:b0:69c:4a99:ea50 with SMTP id
 bl26-20020a05620a1a9a00b0069c4a99ea50mr14895556qkb.632.1651028608328;
        Tue, 26 Apr 2022 20:03:28 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 p5-20020a378d05000000b0069beaffd5b3sm7470276qkd.4.2022.04.26.20.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 20:03:27 -0700 (PDT)
Date: Tue, 26 Apr 2022 23:03:26 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][hardknott][PATCH]
 containerd-opencontainers: add CVE_VERSION setting
Message-ID: <20220427030325.GC55546@gmail.com>
References: <20220426042507.104803-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426042507.104803-1-Qi.Chen@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 27 Apr 2022 03:03:32 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7223

merged.

Bruce

In message: [meta-virtualization][hardknott][PATCH] containerd-opencontainers: add CVE_VERSION setting
on 25/04/2022 Chen Qi wrote:

> The NVD database uses version without a prefixing 'v'
> for containerd.
> 
> e.g.
> https://nvd.nist.gov/vuln/detail/CVE-2022-23648
> 
> So we need to explictly set CVE_VERSION.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/containerd/containerd-opencontainers_git.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
> index 40b03163..2beeaf8f 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> @@ -16,6 +16,7 @@ LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d89"
>  
>  CONTAINERD_VERSION = "v1.4.13"
> +CVE_VERSION = "1.4.13"
>  
>  EXTRA_OEMAKE += "GODEBUG=1"
>  
> -- 
> 2.33.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7216): https://lists.yoctoproject.org/g/meta-virtualization/message/7216
> Mute This Topic: https://lists.yoctoproject.org/mt/90701842/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


