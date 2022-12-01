Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB6BC4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 21:58:37 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.58858.1669931916547479146
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Dec 2022 13:58:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pKfNgWNP;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id fp23so2499056qtb.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Dec 2022 13:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuiNIVXK53CLBWL8cF7BXd5iwfYIuJCXYNyEGfL3zcw=;
        b=pKfNgWNPBxNgVU23SIHP4yh8ohnZXJApAl8LKWQd58cZIqjIdyL4d0+jM7hlAEe+/C
         i3jIVUcwud87TyMIYzjlU6eHKtlIGhxLh4GCVg93DaKlvyIEWG6ruDJ4RGR1Md3V/Cro
         nWwXeEeBU5aMoSlWY/7KNMkhqEdamL/74ndCM/rVuf/+Xv5Nv/3827DnKJv0Lc1gAlXy
         u0Svz+h08tiNcZP0kZtnR19zRdoOBKoTNrbz2923KQxgZf1z7Ctr7rgKlBAtlpUXjPti
         qvxi5jF1cKobkSGB5osBMfXbbufhZvUYTd16JeQlcqrRXagog4pxGkM1NjdOlH+QvVty
         oQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GuiNIVXK53CLBWL8cF7BXd5iwfYIuJCXYNyEGfL3zcw=;
        b=AzGs178/HG3jNqB7m9gALMt9JySoTpu8UrJvoHa5sjVu7g8BVS6FJWfKa/n7GrCtK5
         8Ssk+6Q3Q/vNa+fk5NRl8fv8bPmqtacKXBx2KGR4hO9Hr8ev7tvtuoo6SrB2OLz6sLoK
         fTw+t53+1clVOeLY3zc6rM5WRiYnAuqrgyAJxe8QlTpBSS9B8COVr3A7kgyceDQLasCT
         ZdzM2uaNPFADQ4Sk1v4G71U9mRFifc1+LXHZB6+3ToxAOqMuroEye+vlK+abvGcDjaN4
         9rm3fbSv0BQkYHygkdojovjaRBNUwnFtAo21aQVfqlx3nOpFUr6MYayxNADSj+JD3Vm3
         tmrg==
X-Gm-Message-State: ANoB5pnbiZbBf1/GOw3rzqzUv3CCUVix2Vel9zXlvStTBLDMHbzoEyme
	pRWXZxYycJ2RAPL8tADmgQ7HdawuMbWfiA==
X-Google-Smtp-Source: AA0mqf5S/vwLL/gClmaxynGtWdJ6RKZUpC7yPLPdpGpTbBpN3ViI7nYrcATHvRJSoufodpwBrD+qdw==
X-Received: by 2002:a05:622a:4a11:b0:3a6:54da:ff58 with SMTP id fv17-20020a05622a4a1100b003a654daff58mr43373542qtb.220.1669931915567;
        Thu, 01 Dec 2022 13:58:35 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id az15-20020a05620a170f00b006ce1bfbd603sm4081043qkb.124.2022.12.01.13.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 13:58:35 -0800 (PST)
Date: Thu, 1 Dec 2022 16:58:33 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] conmon: avoid host contamination by
 GOCACHE
Message-ID: <20221201215831.GA31292@gmail.com>
References: <20221201084041.2312838-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221201084041.2312838-1-changqing.li@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Dec 2022 21:58:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7726

merged.

Bruce

In message: [meta-virtualization][PATCH] conmon: avoid host contamination by GOCACHE
on 01/12/2022 Changqing Li wrote:

> From: Changqing Li <changqing.li@windriver.com>
> 
> By default GOCACHE is set to $HOME/.cache.
> 
> Fix:
> make[1]: Entering directory '/mnt/tmp-glibc/work/core2-64-wrs-linux/conmon/2.1.3+gitAUTOINC+19110c9746-r0/git/tools'
> | failed to initialize build cache at /home/build/.cache/go-build: mkdir /home/build: permission denied
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-containers/conmon/conmon_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-containers/conmon/conmon_git.bb b/recipes-containers/conmon/conmon_git.bb
> index a20af04..4c58dab 100644
> --- a/recipes-containers/conmon/conmon_git.bb
> +++ b/recipes-containers/conmon/conmon_git.bb
> @@ -20,6 +20,8 @@ S = "${WORKDIR}/git"
>  
>  inherit pkgconfig
>  
> +export GOCACHE = "${B}/.cache"
> +
>  EXTRA_OEMAKE = "PREFIX=${prefix} BINDIR=${bindir} LIBEXECDIR=${libexecdir}"
>  
>  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7719): https://lists.yoctoproject.org/g/meta-virtualization/message/7719
> Mute This Topic: https://lists.yoctoproject.org/mt/95377985/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


