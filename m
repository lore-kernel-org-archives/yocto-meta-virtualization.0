Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C58C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 19:44:23 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web12.1280.1646941462393373425
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 11:44:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Did1yXht;
 spf=pass (domain: gmail.com, ip: 209.85.219.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id kl20so5345755qvb.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 11:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WiqiMJ8lnrBoK9/4OoBrfk2O7RRlv4nG1yUPTN0EVq0=;
        b=Did1yXhtJss5aQEcF78NG2FxIJCXWQJF06TCXY2AHZk6DNvdjNRf1bZ6fZFQXmwkVQ
         Por9s7jFQ54u0Qf+v3bEIH9fonzZ/1kAL7zI89Sn6eTsDqi2kGQ3G412xq6plKmc/rRC
         WfUHPYH82z8NaEOvPrp3FpCUosK/urZlqqNnB50mLs1nTrIrevtLOwsnSZXnRHnnOltd
         3EH2c6/Lj84f0R6z6TVb1RlaG9Nueb1Sz4JJWbvFIHmvJJTdgzUq5ikIeH6ErC7p32+w
         tWGr08TMX4N0jgfglyi83IdTOOdOptXjml9TIAwEIX2qzKOOS8YHpW6saFyM6jgBOV9H
         29cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WiqiMJ8lnrBoK9/4OoBrfk2O7RRlv4nG1yUPTN0EVq0=;
        b=qkUDHfC69a6Mk+DO4r6z/zITc1OVYWTHM2aMkV3IIFEGgIAve1Edv3KB8BwSiIV/NE
         t5VVCem3YF2FyFqRYx/3p0faZuNH+Frm1YImrHlzjqxVMo3xp5hqaB3r7jvr/2eQEkJM
         4fUdOgq2dSUzInNAQZoFRBtoQmznBHg0h7ZHlyOdcxBH/Rlz/hmqBFCDycdTG4PNOg9Y
         ryGrGlEh1QUaGlL4OD/5ldLS6EbC/H/GCms0/TVyganI/wUJJI5KGw9NvR63Oo2l6OB2
         Q5VXCwdaNkTXxDdoJqt+EtnE4z1oPImP0nv+Ot11xIOXfsAcHwY7rr3Q7sGLtVPfA8bG
         /+eA==
X-Gm-Message-State: AOAM5303yzVRbL8XjHJ6mTP070N62VmQRSWaHlAJ4uw13XgQPWdoLWMa
	6foqxlQRz44vewFf6kBegzIwxatox4DpKQ==
X-Google-Smtp-Source: 
 ABdhPJzGXK+JzZ/RB2L2mk57Rf/sYxi8kV7GmjyNu7MgqqZNQ1s+MurBHmeUm5hPjzOHcTAJu4oDJA==
X-Received: by 2002:a05:6214:2625:b0:435:7c1d:f27 with SMTP id
 gv5-20020a056214262500b004357c1d0f27mr5135341qvb.116.1646941461481;
        Thu, 10 Mar 2022 11:44:21 -0800 (PST)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 i20-20020ac85c14000000b002de4b6004a7sm3704208qti.27.2022.03.10.11.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 11:44:21 -0800 (PST)
Date: Thu, 10 Mar 2022 14:44:19 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: wangmy <wangmy@fujitsu.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][meta-cloud-services][PATCH] layer.conf:
 Update to kirkstone namespace
Message-ID: <20220310194416.GA37856@gmail.com>
References: <1646905230-64641-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646905230-64641-1-git-send-email-wangmy@fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Mar 2022 19:44:22 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7087

merged.

Bruce

In message: [meta-virtualization][meta-cloud-services][PATCH] layer.conf: Update to kirkstone namespace
on 10/03/2022 wangmy wrote:

> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-openstack/conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
> index bd5a8ac7..b112030f 100644
> --- a/meta-openstack/conf/layer.conf
> +++ b/meta-openstack/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS += "openstack-layer"
>  BBFILE_PATTERN_openstack-layer := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_openstack-layer = "5"
> -LAYERSERIES_COMPAT_openstack-layer = "honister"
> +LAYERSERIES_COMPAT_openstack-layer = "kirkstone"
>  BB_DANGLINGAPPENDS_WARNONLY ?= "true"
>  
>  LAYERDEPENDS_openstack-layer = " \
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7081): https://lists.yoctoproject.org/g/meta-virtualization/message/7081
> Mute This Topic: https://lists.yoctoproject.org/mt/89682822/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


