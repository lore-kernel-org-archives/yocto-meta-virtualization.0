Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CC3C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 20:46:24 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.2846.1646253983562596259
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 12:46:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fqQPtiPm;
 spf=pass (domain: gmail.com, ip: 209.85.222.177,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id g24so2353228qkl.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 12:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vYv9uDDEgk22J00VcL7bHzSY4C18dw/Nj19ErewTNAo=;
        b=fqQPtiPmfe2hgpoH8qxh1Jt2lXs9NHvFV4lI/zjri1DWItx6tBqP1jvJq1qzin9ULs
         ezCvHRm5c3IkBU9EeawoItG1cyhfgR0z4rqd/dGSUBp8KH4/HdntO29+Mo1i3XenTFuK
         AAweDmSt9er+sLXiXNL/ZCcqrIpXUfJIYTva5/waZFedstKUUoPqiyXA0j0UkN8K9Eup
         4S5iiHuNVLeTiH2dvYJ/Ib+I5UL50KGRUAkrny1jFOHX03AviZqEcSYgKs2rJWo4gZ9c
         mshdsnxdPXwbKw5AhqM1FIsRQrSUriTyQMyg1fW5b+081Mmr4tFH9D7J/nPqDqW+WCmf
         NiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vYv9uDDEgk22J00VcL7bHzSY4C18dw/Nj19ErewTNAo=;
        b=FaEIPGMxVK8NfzK/JpWddkwhzVC4G5cW1/I2UYvXSVMYYwVC407z2f04A5xA4SfDNj
         K2fW+lGDDMsoU/kEHM91sMvgnj3dVsE4A8odJs0KniGL2YGtXtz6wY7r/guX2eU46tKs
         apo4+RGDXOcleso2lYCCMIQaK+I4b0/EiPdmnA0YJp9SfS7LvgzKry71+d2ia2atSVOm
         vDzgksdej1IWZEncdhHroLQR3oSMmAh+4kMYfdJzL+AS7ZquTvOwMZcOuq7LNfq5oo/a
         gQw9hPpht+ugTy1HNGv+c7cWEsYhoZFBuXumon6ug32GBVuhXgFV7nmwi9hU0fv8VWen
         FObg==
X-Gm-Message-State: AOAM530gLaMF8sEFwTj7S3N4oqNrOuwLvSB9aobGt6Vg1pzH0fK1i8vC
	iICuCrnNaZGffNuzgkRWfMmpW5aKjLt9tg==
X-Google-Smtp-Source: 
 ABdhPJwGmhttxcg6uyjtP/pSkmDU5dvxkuBFDYuMtHFTnSlu9yIfiYVu1/B2FsthpO+aA6D8YhMycg==
X-Received: by 2002:a37:886:0:b0:60b:57d8:3192 with SMTP id
 128-20020a370886000000b0060b57d83192mr17429757qki.67.1646253982600;
        Wed, 02 Mar 2022 12:46:22 -0800 (PST)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 n7-20020a05622a040700b002ddea69efb8sm38690qtx.56.2022.03.02.12.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:46:22 -0800 (PST)
Date: Wed, 2 Mar 2022 15:46:20 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ross Burton <ross@burtonini.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-dtc: fix missing files in
 sysroot
Message-ID: <20220302204619.GB51621@gmail.com>
References: <20220301115248.1782156-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220301115248.1782156-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Mar 2022 20:46:24 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7072

queued to master-next along side of Tim's fixes.

Bruce

In message: [meta-virtualization] [PATCH] python3-dtc: fix missing files in sysroot
on 01/03/2022 Ross Burton wrote:

> There is a bug in SWIG/setuptools where 'pip install' doesn't build
> libfdt.py unless the build tree is already dirty, which makes using
> the library impossible.
> 
> Bump the SRCREV to incorporate the upstream workaround for this issue.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  recipes-kernel/dtc/python3-dtc_1.6.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-kernel/dtc/python3-dtc_1.6.1.bb b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
> index 671d280..a868bd0 100644
> --- a/recipes-kernel/dtc/python3-dtc_1.6.1.bb
> +++ b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
> @@ -14,7 +14,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>  
>  LIC_FILES_CHKSUM = "file://pylibfdt/libfdt.i;beginline=1;endline=6;md5=afda088c974174a29108c8d80b5dce90"
>  
> -SRCREV = "4048aed12b81c5a0154b9af438edc99ec7d2b6a1"
> +SRCREV = "c001fc01a43e7a06447c06ea3d50bd60641322b8"
>  
>  PV = "1.6.1+git${SRCPV}"
>  S = "${WORKDIR}/git"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7069): https://lists.yoctoproject.org/g/meta-virtualization/message/7069
> Mute This Topic: https://lists.yoctoproject.org/mt/89473720/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


