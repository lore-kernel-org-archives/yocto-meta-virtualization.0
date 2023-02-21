Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD26DC636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 15:14:17 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.45054.1676992451929660219
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 07:14:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MTfTP89Q;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id bt6so4560466qtb.4
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Feb 2023 07:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Su5aKRjyhXIbJhepgrQFf5wOHpJP9U3inE6Fz/Qs1gc=;
        b=MTfTP89QKvXpkig2kPDhGEbXBU3lJoOIFarpVWmRyhuW+LQ6CgbWSXRemnE8ZJlu6E
         SAyubhIZYd6WHYOsW1sWPPZgPBf/O5cMhzBMjlubuZQlHdERZGq0Psyi7+Myj4l5RHT7
         otI5kuZI+dVDxg+NKx++dXu6zy8Q+Mj+wGhAMN6WW0eOnhI5DI+TqyPj/wNDbyW7buWK
         AynWfXZT39pczeXuPKzrsrXkWwGRzwT4PG0G/8AXVmhFTOmIH87oYzmlMiCb/eZIZNPc
         SS9QL0OOeW6fcZSfzkpzpFDwmEhBBqt6oilJtWh2j7bxBhK9vmAk9FkZCi5DeEt7AzrA
         rOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Su5aKRjyhXIbJhepgrQFf5wOHpJP9U3inE6Fz/Qs1gc=;
        b=69KwYxqAe4ZuscLuysXZwe6bxG3w1XQ/MMw9SUMvN/kxYuVgJG+q+2hbSz/m+Zb1Fo
         p12mGCPqQrImXXONQOaok0YS01P37Czqhw8+yTn87aDaazsINWcixMYnSf/ylTcd1wLp
         7cRVKiGTRvB9G89q1VIvyQmZ5HaOpoNHDiNr2JYmjoSo4aNld5VdwWugZR72+Yf4fLlG
         W60t+bXfcssxhcpDMf8hbtP5fi+Z/e1ra/qjSQHPYuBuV9be9FyutRt4AdGzZl1Sjhhj
         /iz69I5s8I7f6/7UNQnDaBELk0m9ca5SDIn3O5iJiDda4foDnZr/U/D7NdKdcVkBXPhc
         oHGw==
X-Gm-Message-State: AO0yUKV6/yi2bfx2w3yBRIWYRWhhX2y3qluTfnGlOkenCB/fHaft5OL1
	Z+t6fwiuOyS11spninbtMbR/dVYF/Yzw6w==
X-Google-Smtp-Source: AK7set/756hpNUGgp9OvyT2mcCRkvgJQEelSm7O06Lwgias2ozXJjnCEFo3P6BpDYJT+A4zmJpx9dw==
X-Received: by 2002:a05:622a:349:b0:3b9:bc8c:c1f9 with SMTP id r9-20020a05622a034900b003b9bc8cc1f9mr16766756qtw.4.1676992450945;
        Tue, 21 Feb 2023 07:14:10 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id 201-20020a3708d2000000b0073b27323c6dsm863268qki.136.2023.02.21.07.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 07:14:10 -0800 (PST)
Date: Tue, 21 Feb 2023 10:14:09 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][master-next][PATCH 3/3]
 container-host-config: extend to native and nativesdk
Message-ID: <Y/TfwYIYnaw54yju@gmail.com>
References: <20230220045423.84802-1-Qi.Chen@windriver.com>
 <20230220045423.84802-3-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220045423.84802-3-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Feb 2023 15:14:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7887

I had also meant to include this in my original recipe, but
cleaned too much up!

This is now staged on master-next.

Bruce

In message: [meta-virtualization][master-next][PATCH 3/3] container-host-config: extend to native and nativesdk
on 19/02/2023 Chen Qi wrote:

> skopeo rdepends on it, and skopeo has been extended to native and
> nativesdk, so container-host-config needs also be extended.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../container-host-config/container-host-config.bb              | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-containers/container-host-config/container-host-config.bb b/recipes-containers/container-host-config/container-host-config.bb
> index c2f17bf..80abddf 100644
> --- a/recipes-containers/container-host-config/container-host-config.bb
> +++ b/recipes-containers/container-host-config/container-host-config.bb
> @@ -18,3 +18,5 @@ do_install() {
>  	install ${WORKDIR}/registries.conf ${D}/${sysconfdir}/containers/registries.conf
>  	install ${WORKDIR}/policy.json ${D}/${sysconfdir}/containers/policy.json
>  }
> +
> +BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.37.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7882): https://lists.yoctoproject.org/g/meta-virtualization/message/7882
> Mute This Topic: https://lists.yoctoproject.org/mt/97080775/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


