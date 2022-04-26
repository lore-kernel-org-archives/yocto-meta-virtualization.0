Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454E6C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 21:03:48 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.438.1651007024965099042
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 14:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aCR9+y1L;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id e15so1681459qtp.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 14:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=J1J08JEaHSYiSyW0q3pwXjMpcYzq2+UE5862HGwr0Pk=;
        b=aCR9+y1LH0oK8uwABoZHnRq59i/9giEBlyr6LUdogK4ZTciO7zvYwtnNpZFiHZ7VI4
         9Xv2idiyQx6svVI5HadYmCpj4JDrhZayQxiIX+5n92zffMr+Eysy6TKkWRH53SqzEhuB
         apdixUfxkd/pOaQX4RRtuF4QdzqPuFMVaHOxO+U4NtVfQsWlzO/adzlWN9/clO4RDMdR
         BnCt24/BtEJ/FxhpY2qLZIVaOnjkWppsytyqdACFkjxwLo++S3WOpmxR+vRUy9WY98Sk
         juM+fkkLiB5cncQMkS8koHCiXCWbrCtt2qDC2GLCgUL7yrfgLeM9DoYRnwRN7OTadtdk
         eUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=J1J08JEaHSYiSyW0q3pwXjMpcYzq2+UE5862HGwr0Pk=;
        b=eSPURXgWtcTJVnMzAIf8sSTa1LqGqZbiAiJnZ8aXzrVkk9grMxk8TuTKQhzhAulrtx
         vujYu2fGNVYBo0i3TZ2JgliTstgFhnKwiiSMBUr62mxrmlRdOC6J8Ncf9Ng/iBVPBafZ
         5LRrSNTShn3zmvvs14LmC9GaLsV8/mUTPxMuPw6nNSu9JuglGZYrCvxVkFImHOvAtso7
         l/s7K8coLjlRfXoqu4BXurFATxYwiRBZ10eh5CO013qLs0XDFzU7PVYo9MF/LQXGJRr6
         ia3yCdidaNv76DZeAvZE1To9wbZ5vrjoBMsRbJBsJsEuWu3UMSO3iSGk13X1b4be4TN/
         8TDw==
X-Gm-Message-State: AOAM533DJHMHelCpOoKIe5ZYz8vaCFUUPq2A2GlU9fLdIk4Wfh2gntjY
	jiNLIvMbarsK0U79DiMsyGn3LmT7T9XEPg==
X-Google-Smtp-Source: 
 ABdhPJzemcJkWQjn5diMqz2L2IlktEXO2YLiSocMxkGOQEX/zHmB1KG2n5WGHVRSyr5g3VMNqWgYLQ==
X-Received: by 2002:ac8:588c:0:b0:2e1:ee12:3473 with SMTP id
 t12-20020ac8588c000000b002e1ee123473mr16785366qta.455.1651007024091;
        Tue, 26 Apr 2022 14:03:44 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c3-20020ac85a83000000b002f36b61b0d3sm3701288qtc.47.2022.04.26.14.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 14:03:43 -0700 (PDT)
Date: Tue, 26 Apr 2022 17:03:42 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] containerd-opencontainers: add
 CVE_VERSION setting
Message-ID: <20220426210341.GB55546@gmail.com>
References: <20220426042534.5132-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426042534.5132-1-Qi.Chen@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Apr 2022 21:03:48 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7221

merged.

Bruce

In message: [meta-virtualization][PATCH] containerd-opencontainers: add CVE_VERSION setting
on 26/04/2022 Chen Qi wrote:

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
> index edb5974..b0f92b1 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> @@ -16,6 +16,7 @@ LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d89"
>  
>  CONTAINERD_VERSION = "v1.6.1"
> +CVE_VERSION = "1.6.1"
>  
>  EXTRA_OEMAKE += "GODEBUG=1"
>  
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7217): https://lists.yoctoproject.org/g/meta-virtualization/message/7217
> Mute This Topic: https://lists.yoctoproject.org/mt/90701847/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


