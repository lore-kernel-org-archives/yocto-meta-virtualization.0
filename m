Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70AB7CAC597
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 02:15:23 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.6349.1758248116978743977
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 19:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MI78iTOz;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-82946485d12so146420985a.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Sep 2025 19:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758248116; x=1758852916; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sq5Va6coktxvOIh7wCoCcEbJuTxCNtzmg+s9J+VM6jY=;
        b=MI78iTOz51++kl4QYmr8pVjZAfpQo7aIf9YaTUDo2yhNwiJ2LGdNJIeRAJBHMDAoT4
         VtS/c3ygIuEodApmSVcfqa6LeKc9ZH4qqxyQsjzT7sT5UqQsC4GmNIsJmhGSfVll5C1y
         xa/ZWC2WQooBcCm0xVKQEtWeYOQQoEkEz06rXxRLzw9Zs17rGAwGmv1an2vNsPdAH9Mf
         FEv2vKy/dBAz8e88Br9ARiLDcDreQAx9qyo6iMXNHIDixdOt+iYlrK7/NzAekFjqPHhl
         OPvLEvVX7wpqiHzqefVamsvrfBVjz0lOL7SvdfgFHnGBZcbnh2D5fJeXKRTcVAPCwdYh
         3IWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758248116; x=1758852916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sq5Va6coktxvOIh7wCoCcEbJuTxCNtzmg+s9J+VM6jY=;
        b=EcegWPQq5epECISUI5mwvCQS/WbUsxTJrdAvTk3YgcC+8ty4flKNKHqLWY20PmtR1S
         sMF8tuEOq4itM7qpyUUGjUB02yurP11QcUrQRVMxebFTV9x24UXzxjviF3xdTrXq8mZH
         Nz1GgVf3ddCz2L4/d8JPZlcKNN2j3JIHQl6PkpVfS4MHB0XwCj66FVv2cwfj7AT1vU2W
         opW/ec52gXL5iJ39YWlYvJNX92dio/1PiulvpFJkCddStSpnu91ljTfj4FTHFh2b6i6B
         3I3WXGGESJliSEaZ9ZNs6KVBopCsRa6HWRUoMmgcB8iDlMVtyDFCuaJK4k+/6cvsGkfB
         oXjA==
X-Gm-Message-State: AOJu0Yx5XlzVVwq6iFjGLd0097GWv3QJx/hg2MF3Zu5Xzcmg78/zJVGA
	FvcJCCncDk8pUxvNeOwikpH9PciyikSBoRTvXUPLHOmOgU2MVdwOSOS6
X-Gm-Gg: ASbGncsJuE/dFtFZ2Ki47yf0g1Cf9fEsO7NRdwbxZjDfEJeI+nnJf2NnhpQ6L36G2D6
	wvVjwwD1++S9UFid3Nt4a5vvDISKcYbKBm6nFbovgUC2HpqnE+YuLcK1/J+kwjBdmw/MAQdCfJD
	lcdKKwljttcxnA11bxfNpq1Mnzmgu51h/4zp8ac9982Y6wRoKDvtqd7FX7T3pknNu3e9FWs4e/O
	lbSruqSXmCAmwqwGRxvWuL5hHX4XRPCZnBI9ZVKQEVcL64h4GRr8JEO63TWE7eOkHoGi3njUlSL
	5XZhJqhMM7SGUMXQ0R4ah/Dmxx00q7ic9ZfI8+1Og7GiaGwkuRtn1YavpJcYN5kuk4n16+QNp6y
	2Bqb+prTHJBIUjhSUB6K058gxrJx9rsgVGkZfO4uubh5mVlnzDQ11c8t7vk46916/YjMpUXshfj
	k+2IcoDJpC0NXwlWAakklG6IWVkUWnxsV+
X-Google-Smtp-Source: AGHT+IEE6haevmFE+01khmcDF+vUCxknK10uIHXycUIG+7nhuTgvSLi/+6Zi65ZyN4QPQmHGDPdJsQ==
X-Received: by 2002:a05:620a:628f:b0:80f:a776:1051 with SMTP id af79cd13be357-83ba29b6734mr175490285a.7.1758248115797;
        Thu, 18 Sep 2025 19:15:15 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-836304820f4sm260460385a.38.2025.09.18.19.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 19:15:15 -0700 (PDT)
Date: Thu, 18 Sep 2025 22:15:13 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: spushpka@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org, vchavda@cisco.com,
	deeratho@cisco.com
Subject: Re: [meta-virtualization] [Scarthgap] [PATCH] grpc-go 1.59.0+git:
 Mark CVE-2023-44487 as Patched
Message-ID: <aMy8sf5mcevGrEVg@gmail.com>
References: <20250905133553.1087661-1-spushpka@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905133553.1087661-1-spushpka@cisco.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Sep 2025 02:15:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9401

In message: [meta-virtualization] [Scarthgap] [PATCH] grpc-go 1.59.0+git: Mark CVE-2023-44487 as Patched
on 05/09/2025 Shubham Pushpkar via lists.yoctoproject.org wrote:

> Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2023-44487
> Type: Security Advisory
> CVE: CVE-2023-44487
> Score: 7.5
> 
> Analysis:
> - CVE fix is available at [1][2].
> - Current grpc-go v1.59.0 source has the fix integrated.[3]
> - So, marking this CVE as Patched.

Same comment. Either the version is or isn't impacted, so why
are we marking this as patched.

Bruce

> 
> Reference:
> [1] https://nvd.nist.gov/vuln/detail/CVE-2023-44487
> [2] https://github.com/grpc/grpc-go/pull/6703
> [3] https://github.com/grpc/grpc-go/commit/e88f12e0517d [v1.59.x]
> 
> Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
> ---
>  recipes-devtools/go/grpc-go_git.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-devtools/go/grpc-go_git.bb b/recipes-devtools/go/grpc-go_git.bb
> index fdfc2307..0f52988d 100644
> --- a/recipes-devtools/go/grpc-go_git.bb
> +++ b/recipes-devtools/go/grpc-go_git.bb
> @@ -48,3 +48,4 @@ CVE_PRODUCT += "grpc"
>  # grpc-go (Go implementation in meta-virtualization) does not
>  # contain the affected HPACK code path.
>  CVE_STATUS[CVE-2024-7246] = "not-applicable-config: CVE is for grpc (C-core), not grpc-go."
> +CVE_STATUS[CVE-2023-44487] = "fixed-version: Fix for the vulnerability is already integrated as part of v1.59.x source."
> -- 
> 2.44.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9376): https://lists.yoctoproject.org/g/meta-virtualization/message/9376
> Mute This Topic: https://lists.yoctoproject.org/mt/115082031/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


