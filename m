Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AFDC4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 21:49:17 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.58398.1669931348532972202
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Dec 2022 13:49:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MaZPJqnP;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id l15so2745048qtv.4
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Dec 2022 13:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eRl4OYo/1U1TWwBg+IDh0x52PFuQb52Gy/gD1GG+oaY=;
        b=MaZPJqnPkjcgBqzmwiLkedWmJHNz9Ywdy8t2XFUyhm4C/vziA6kxcMwH+mHtF3MwB9
         zxv5IhUDxn/WGcuYWuuOSa//mJHjHlbReR9qNz4ntzFTVMvJ/XWLcYRmfOpYymUr/QI9
         LHRjgemc1jY2qgo/RCOLdgime5oZ9mAjoGHOFyxdYuos8lv6Dx/mkWgUnvxufbbTQXQs
         lD/uL1x8zuKmMxTzdE3GyZ5IX7KkQB5XxJiB+wGE86kKxGJFfxtMbEDxYdJZOUXnnGDP
         44dq5BGhV8wFUPscmpThhWQUlGr1Idd1f1XQdTehTHh2byB9wKWLqqbnVM7uRpefxy2Y
         CEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRl4OYo/1U1TWwBg+IDh0x52PFuQb52Gy/gD1GG+oaY=;
        b=HBVgkS4onzsbE4KgC/xgnbSZHaqZ2RwAi0rHMFFI8ObktoSBuyCIXx28zuxMRnjaEm
         szerdJjoY+oxPH7ke5VNc55iyWC1rQY7OjCk66aXx8bmf38YPnQhu/3NUe5X78DfZMgG
         0fnuBWgAhlQIKYfulxfb5dZbPtTbCjwuZ9qVVe7NgvEKcRvWhinVcg8OcJHHZc9uuqIj
         U41Mw8ZGO5oqmul5LN6Moy1LPzMADq2K0euXZw8xcrxlRhNpO82l2CuLYYL0gTBM0UjN
         F/J5i70K+vVFsAHfT0L6F5MTe978MMAHGejZ9rs0Z2rkOYBUaVJppto8dv/YRtKjHILD
         CVYQ==
X-Gm-Message-State: ANoB5pkG8tMA+Ws8XgsdWcY50+2rBoZXCL9bYJ2YIQ/TdF/yH1vZX+ye
	PYa7J+5zqXLwlQ5Kd/Ow7X/SJyIMPbcXhg==
X-Google-Smtp-Source: AA0mqf6/X4IpFyMXVwdnlugRWVLXfUb5sN4/Uzw2YEMrP4rErMifLgQvLQ39PNgrFmhjEco2aC8jog==
X-Received: by 2002:ac8:5245:0:b0:3a5:3623:3714 with SMTP id y5-20020ac85245000000b003a536233714mr44968493qtn.337.1669931347458;
        Thu, 01 Dec 2022 13:49:07 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id v20-20020a05620a0f1400b006ee7923c187sm4279529qkl.42.2022.12.01.13.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 13:49:07 -0800 (PST)
Date: Thu, 1 Dec 2022 16:49:05 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: dylantdmt@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org,
	Dylan Turner <dylan.turner@ni.com>
Subject: Re: [meta-virtualization] [PATCH] python-psycopg: switched from
 distutils to setuptools
Message-ID: <20221201214903.GA30616@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128222527.13035-1-dylantdmt@gmail.com>
 <20221128232300.14201-1-dylantdmt@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Dec 2022 21:49:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7723

both of these are merged.

Thanks for the changes, I've been trying to make time to get m-c-s
cleaned up, and this helps a lot!

Bruce

In message: [meta-virtualization] [PATCH] python-psycopg: switched from distutils to setuptools
on 28/11/2022 dylantdmt@gmail.com wrote:

> From: Dylan Turner <dylan.turner@ni.com>
> 
> ---
>  meta-openstack/recipes-devtools/python/python-psycopg2_2.7.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-psycopg2_2.7.5.bb b/meta-openstack/recipes-devtools/python/python-psycopg2_2.7.5.bb
> index d054214b..94787e6f 100644
> --- a/meta-openstack/recipes-devtools/python/python-psycopg2_2.7.5.bb
> +++ b/meta-openstack/recipes-devtools/python/python-psycopg2_2.7.5.bb
> @@ -12,7 +12,7 @@ SRC_URI += " \
>  SRC_URI[md5sum] = "9e7d6f695fc7f8d1c42a7905449246c9"
>  SRC_URI[sha256sum] = "eccf962d41ca46e6326b97c8fe0a6687b58dfc1a5f6540ed071ff1474cea749e"
>  
> -inherit distutils3 pypi
> +inherit setuptools3 pypi
>  
>  DEPENDS += " \
>      postgresql \
> -- 
> 2.38.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7702): https://lists.yoctoproject.org/g/meta-virtualization/message/7702
> Mute This Topic: https://lists.yoctoproject.org/mt/95323888/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization] [PATCH] qpid-python: switch from distutils3 to setuptools3
on 28/11/2022 dylantdmt@gmail.com wrote:

> From: Dylan Turner <dylan.turner@ni.com>
> 
> ---
>  meta-openstack/recipes-extended/qpid/qpid-python_0.20.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-openstack/recipes-extended/qpid/qpid-python_0.20.bb b/meta-openstack/recipes-extended/qpid/qpid-python_0.20.bb
> index 9db46859..3a486b4f 100644
> --- a/meta-openstack/recipes-extended/qpid/qpid-python_0.20.bb
> +++ b/meta-openstack/recipes-extended/qpid/qpid-python_0.20.bb
> @@ -12,4 +12,5 @@ SRC_URI[sha256sum] = "3ca55a5aa11fbbd4e26cb4cdafc9658489c159acadceac60c89d4bfb5c
>  
>  S = "${WORKDIR}/qpid-${PV}/python"
>  
> -inherit distutils3
> +inherit setuptools3
> +
> -- 
> 2.38.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7701): https://lists.yoctoproject.org/g/meta-virtualization/message/7701
> Mute This Topic: https://lists.yoctoproject.org/mt/95322675/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



