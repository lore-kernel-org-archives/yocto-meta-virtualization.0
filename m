Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BB1C43219
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 18:41:41 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.152.1649263501697811145
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 Apr 2022 09:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V4Lksc8g;
 spf=pass (domain: gmail.com, ip: 209.85.160.178,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id i4so5265687qti.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 Apr 2022 09:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6p5Un9HkWsB/rSwTEswbDBvZRJHwfOC1DhcMfaFbcuI=;
        b=V4Lksc8gjjQtb+WxIFCIvm8l7SlcLQAZL0fZZ7t50Vx9aFqmKDFwr7ZSrFaUY5NQQW
         dZ6uf4BbfKnjRDnrlqro9E6i8WT4ijtQ/y9bVxtCjgg3bwfWBv4DRPkqa06Dhu7WOa83
         E8z7IneAY0IYbk3idmZ/X+bVyMEIRlvQ+b5/vmjxpGcDzFP3eoJyTqe9PkEuoMk0oAXe
         qBjPr8gy3cesttbyPjMcx0LmJzlpKS58panL9cISVBXlEN3VPUmF3wFWe62P8NAZ7qw7
         hXEaL3wtvj1mh/RSEuX3I77XMgjLcKvkEJlnoGKqa4sJyZ3QYR0tez0bat+YsG0OslBE
         bHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6p5Un9HkWsB/rSwTEswbDBvZRJHwfOC1DhcMfaFbcuI=;
        b=j3Q3yl4ZQjkenRJHHTCZtwLjzx/sb65iou9wVZyS7Bz4XMptRB3JqBpz7/VJof5/zG
         LQZc1WXQuqVVQOx4azjUb2qS1yGtlBZb57aN0KJsUiFOFV1TWy0o21hfsEfwg9zaZdFR
         3X/Sdtuff0RTJzFHxCmYItoLonVefMpC5K9ZuF2nueUv3rUmkVfvZo8g2Tar737irT0N
         Wesz57JMPduKSetFPAKJjbf5lbkTc4hNJuJMV1x4DeT0ER21tOacKVkdDeyyD8MrbSAT
         RpReqjuWI9Qi1caDrIqdp5FsrHTDCC60Ws/ZQcZprX5Pxf0xJcXznQBf1fhCuaeRW96k
         GS/g==
X-Gm-Message-State: AOAM531u71dJBvVwQ/5V1quKmDPddY5JYRTvNsaOlFuoyg2YSzG9+UeU
	tXS0wgw6C07ywnmcw97NVmI6KVQKgvpqWQ==
X-Google-Smtp-Source: 
 ABdhPJx60Pe3SNG0LuxBNwJb7mQQFlSXHApPN6bocUOHDIzHDR115iWq25KTB6KEAdECzj31B5HBjg==
X-Received: by 2002:a37:6041:0:b0:680:f510:79c8 with SMTP id
 u62-20020a376041000000b00680f51079c8mr6459240qkb.570.1649263500716;
        Wed, 06 Apr 2022 09:45:00 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 b21-20020a05620a04f500b0067b4895472esm10231467qkh.5.2022.04.06.09.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 09:45:00 -0700 (PDT)
Date: Wed, 6 Apr 2022 12:44:58 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ross Burton <ross@burtonini.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] virt-what: add new recipe
Message-ID: <20220406164457.GB41737@gmail.com>
References: <20220406161440.2629415-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406161440.2629415-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 06 Apr 2022 18:41:41 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7127

I've always used systemd-detect-virt for this same use case.

Can you confirm if it works both on sysvinit and systemd based
init setups ?

Bruce

In message: [meta-virtualization] [PATCH] virt-what: add new recipe
on 06/04/2022 Ross Burton wrote:

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  recipes-extended/virt-what/virt-what_1.21.bb | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 recipes-extended/virt-what/virt-what_1.21.bb
> 
> diff --git a/recipes-extended/virt-what/virt-what_1.21.bb b/recipes-extended/virt-what/virt-what_1.21.bb
> new file mode 100644
> index 0000000..aa235b3
> --- /dev/null
> +++ b/recipes-extended/virt-what/virt-what_1.21.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "Detect if we are running in a virtual machine"
> +HOMEPAGE = "https://people.redhat.com/~rjones/virt-what/"
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "https://people.redhat.com/~rjones/virt-what/files/${BP}.tar.gz"
> +SRC_URI[sha256sum] = "12cb455334aa4cfd53ab78f27e2252e94d1f676dd093f48327ed94d8080d1f7b"
> +
> +DEPENDS = "perl-native"
> +
> +inherit autotools
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7125): https://lists.yoctoproject.org/g/meta-virtualization/message/7125
> Mute This Topic: https://lists.yoctoproject.org/mt/90293376/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


