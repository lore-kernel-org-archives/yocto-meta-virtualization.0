Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web11.2109.1592354137044134207
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 17:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b0zgyds5;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id g7so226903qvx.11
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Jun 2020 17:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=DiP9gSpMvAr+HMpEN6H0ryz79yfVaz0X+rgEI+UdH1g=;
        b=b0zgyds5nbTKbIG4Ilfdw/BCdu2A+mF7w2M8+5eASkLgcVpaeZvXxmwM7u9t1yu6BD
         b6NMjW/9FeWkRzEFkH2P86z52nm2xJ/Qy8AmZM1f9Gc34wzynjK6UZVYDfNLp7O32SxQ
         FhYP3gdLoOHodWyp5dA/4cUGokG8xyL4KI1ttfhfO0NpO/5hA0DzSQIrklj65uNGDzlC
         179qcoLFkUHjmOcMSH1ebiXYr3+mqrXmui9su4nlN6zI7rGNDi5H8jTXIY6dset3xuLT
         9AEXhSXwrC+Z+Ij+QlO3MriKQoRk2hOX0R2SCEfjY42jMzapr8u2J6Ofe4cCoT/S4m5q
         nQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DiP9gSpMvAr+HMpEN6H0ryz79yfVaz0X+rgEI+UdH1g=;
        b=PwmXvYFxbINV2UXQri1PFTwqS457Jw59Ed8tRVqaaV6fP0A7sCyzV1hAUS6PL1xut0
         I/vRCMM+FgOw9BuVkofjtfuacfEMMSWumKndHlE06ydVOAWpTBAmrW/qq4YxmQm67ebp
         bXzglkR7PlTC5eiG5e6mzKcLE9VorDeB/aOkYWn9dwSO7pFbwYOmOR0Krgd2HbYUO/BG
         P8OpQD44IDR0jvnAie1MtCdybho417OtOeP2bq9jCNr6AQTJrlW310imWnCd3SPU4omX
         iovezt+XBVKR1EFJ5vGps2NjqO13hVRD95X7YzBDIq10jUrwnFqc4ohZZ7cxZXsXP+xk
         aeOQ==
X-Gm-Message-State: AOAM531rj/9cXT4SrSueVUdUyjM9pob0lRxazkGV+yDTI3e0uNgJwhDA
	s/ekRlD9Mx/zapp7+sUU3iKnUSAXNLAhGg==
X-Google-Smtp-Source: ABdhPJwUQr+h0mnX3T0ne+P1j6YQ50QAS/qIGlN7CvdDv5CydG7WrwsAgEssZWnCl9cO0Y0sdaRLxA==
X-Received: by 2002:ad4:49aa:: with SMTP id u10mr5262560qvx.162.1592354136174;
        Tue, 16 Jun 2020 17:35:36 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id m26sm15881551qtm.73.2020.06.16.17.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 17:35:35 -0700 (PDT)
Date: Tue, 16 Jun 2020 20:35:33 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][meta-cloud-services][PATCH] python3-fixtures: Change python to python3
Message-ID: <20200617003531.GA5428@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1592190472-47315-2-git-send-email-wangmy@cn.fujitsu.com>
 <1592190472-47315-3-git-send-email-wangmy@cn.fujitsu.com>
 <1592190472-47315-4-git-send-email-wangmy@cn.fujitsu.com>
 <1592190472-47315-1-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][meta-cloud-services][PATCH] python3-fixtures: Change python to python3
on 15/06/2020 Wang Mingyu wrote:

> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  ...python-fixtures_3.0.0.bb => python3-fixtures_3.0.0.bb} | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-fixtures_3.0.0.bb => python3-fixtures_3.0.0.bb} (86%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-fixtures_3.0.0.bb b/meta-openstack/recipes-devtools/python/python3-fixtures_3.0.0.bb
> similarity index 86%
> rename from meta-openstack/recipes-devtools/python/python-fixtures_3.0.0.bb
> rename to meta-openstack/recipes-devtools/python/python3-fixtures_3.0.0.bb
> index c8883be..c2e098f 100644
> --- a/meta-openstack/recipes-devtools/python/python-fixtures_3.0.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-fixtures_3.0.0.bb
> @@ -15,14 +15,14 @@ DISTUTILS_INSTALL_ARGS = "--root=${D} \
>      --install-data=${datadir}"
>  
>  DEPENDS += " \
> -	python-pbr \
> +	python3-pbr \
>  	"
>  
>  # Satisfy setup.py 'setup_requires'
>  DEPENDS += " \
> -        python-pbr-native \
> +        python3-pbr-native \
>          "
>  
> -RDEPENDS_${PN} += "python-testtools \
> -	python-pbr \
> +RDEPENDS_${PN} += "python3-testtools \
> +	python3-pbr \
>  	"
> -- 
> 2.17.1
> 
> 
> 

> 


