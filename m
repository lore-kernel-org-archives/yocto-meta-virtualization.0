Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.10787.1627570870747533499
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 Jul 2021 08:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=izs05JhC;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d9so4099762qty.12
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Jul 2021 08:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3g4vB9hmPl7eB1vHQmsiLhC0w21+SDKgRQ/wce5/KA0=;
        b=izs05JhC7+UKn90CDXzmF7IFMxlWCnYDdMOW+RyaVJ5qLqB4tKv3ia2S6vOLqvYFdI
         ur8qBfKWpAhPk3MFuDLnImpHJyHeyGdWZy7fO0e2vtURN4qAsXfQ+POQEbq31x0qyWlS
         dkUSh7wEuqvf2P+2N0i+skHl9dreary5G5lJqSyUh5v9yzq+0shaeKaWpx6KrA2D+Qrs
         Z6mzp0VNf/1IoRemcHHthuuQe+lvgyGGNFac7C5nJr6wCa44AVwHgbmROLYVsrkvYFY8
         V2lLpXYHI5R3g/CPUvWKhMxHxchZjdxIa3k3C15FRbq32gE2u7/K7CSJLC5YSJD4f1v+
         YceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3g4vB9hmPl7eB1vHQmsiLhC0w21+SDKgRQ/wce5/KA0=;
        b=S3BLMVylzMKMCt64LuLV6VrJoj4hwFkbIIzBB1tvoFgYOUDfwYmpSNgMTLPqXESkK9
         tnrE2L9N7Rj5tBCBvFH9dDZFNsH80AeQTJ6L08M+AjA9ijPPnLV8SsZ8+fJJ+AhwdVHO
         K5aZLwwi9AdburLRvpvw6bwdkCFDnABHCU4lVOUHqSY9ionxTUFMKj4tdVKrwK6KBbSe
         LMMgcKVngvN4Lv1HGZ9R8pxA1jEu1pBPGm2R+EmRIrD2FkTGNwgZlRYLs5GDl6W4dKzG
         69/EAQTbjHcPrhXBFd/hRAz1iDxXBejxlEvQeDy412RfgU/tFLpAFNR8D/odTWkbRp8r
         lsPw==
X-Gm-Message-State: AOAM530VchJUZfqkESQ9nloyTe9fCOfS1KO2TEbDjMrZdjZZrq95sTTU
	Bl9Mw4Cs3YwjvkYVuNU8XSDhQywBDesxNRNX
X-Google-Smtp-Source: ABdhPJxTWGOOdXPouZGNyhBeCjnrLGdtQCr6+QWLc+T7xK2xMTG9ETPUX0ZZLC1xDh3PpSiqErxdwg==
X-Received: by 2002:ac8:4a13:: with SMTP id x19mr4559619qtq.61.1627570869806;
        Thu, 29 Jul 2021 08:01:09 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id v17sm120840qtk.83.2021.07.29.08.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 08:01:09 -0700 (PDT)
Date: Thu, 29 Jul 2021 11:01:07 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: qiang.zhang@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] k8s: update kernel configuration features
Message-ID: <20210729150107.GD40673@gmail.com>
References: <20210721031414.14596-1-qiang.zhang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210721031414.14596-1-qiang.zhang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I've merged this for now, but in the next month, I'll be moving all of
the layer fragments to the kernel-cache, and at that time, we should
be re-using fragments that already provide similar options, versus simply
listing them all in the k8s fragment.

I'll take care of those changes, but I just wanted to give a heads up.

Bruce

In message: [meta-virtualization] [PATCH] k8s: update kernel configuration features
on 21/07/2021 qiang.zhang@windriver.com wrote:

> From: Zqiang <qiang.zhang@windriver.com>
> 
> Add kernel config fragment according to the requirement from the file
> types_unix.go in source codes of kubernetes.
> 
> Signed-off-by: Zqiang <qiang.zhang@windriver.com>
> ---
>  .../linux/linux-yocto/kubernetes.cfg           | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-kernel/linux/linux-yocto/kubernetes.cfg b/recipes-kernel/linux/linux-yocto/kubernetes.cfg
> index c3e90d43..2d4e1f54 100644
> --- a/recipes-kernel/linux/linux-yocto/kubernetes.cfg
> +++ b/recipes-kernel/linux/linux-yocto/kubernetes.cfg
> @@ -16,4 +16,20 @@ CONFIG_IP_VS_RR=m
>  CONFIG_NETFILTER_XT_MATCH_COMMENT=m
>  CONFIG_NETFILTER_XT_MATCH_MARK=m
>  CONFIG_NETFILTER_XT_CONNMARK=m
> -
> +CONFIG_NAMESPACES=y
> +CONFIG_NET_NS=y
> +CONFIG_PID_NS=y
> +CONFIG_IPC_NS=y
> +CONFIG_UTS_NS=y
> +CONFIG_CGROUPS=y
> +CONFIG_CGROUP_CPUACCT=y
> +CONFIG_CGROUP_DEVICE=y
> +CONFIG_CGROUP_FREEZER=y
> +CONFIG_CGROUP_SCHED=y
> +CONFIG_SMP=y
> +CONFIG_CPUSETS=y
> +CONFIG_MEMCG=y
> +CONFIG_INET=y
> +CONFIG_EXT4_FS=y
> +CONFIG_PROC_FS=y
> +CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
> -- 
> 2.29.2
> 
