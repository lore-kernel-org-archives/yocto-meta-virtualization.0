Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web12.9122.1630075931419646920
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 27 Aug 2021 07:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EvJ51xk+;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id eh1so4088823qvb.11
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 27 Aug 2021 07:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gk+SZ5IWS/ENV/Z/l5lRmzUl/ufpaLumi3IBxVjgGpw=;
        b=EvJ51xk+jOdj+vWBIC9doVWbrApPQIeK3pzSzPtZ+KKklmUrAAt52IqKd4JPA5NoeP
         cSpnCXGc2BJCMcZYtxcbJ1JuzK6hVzipe/9pImjNGtA0ovR9bdyBTu6e8dQI0hheExlw
         Igqp4yVjOCQuWKJ6WMu8GfpQAKc8egiJjblwt7x/YOjLMK5OxSZjUBPwZ8CRshWonHEX
         Hbav1/IqxFQ/4Fjz8prjH2P5+o6QQJpXt3hjFCjpkmA22BBttEOafmxuX138J/lgP6uA
         T/y7RCEkrvT7NWXa0lSKEaHcntwKnfK7pJgQphFpNoPbg9MXUIh/uvCSldevLyO5B2lE
         DIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gk+SZ5IWS/ENV/Z/l5lRmzUl/ufpaLumi3IBxVjgGpw=;
        b=m38hx5sebQv7OOrKqbTm8bkucYiHqeK9HhmO9RfeJYzBYo6XLg09yTvHdw+2m4NuiX
         xCyI1umY/zJpm/z2wYKxVYXs3PjdoUgz89tvu3PoIxD72NeTkksAiqLEAl/qy/xMDTdf
         80yVO5GGTJL8+NRpNY7OzomNoEhWYsBsNYAcVyq45o/8mQgyHkcyXGGUVtAQ95iaoBy+
         +sVcNthx7ftmOhFzctNTDQ16mUqLjUO3k0wni240r1hZzEXZpXrB87hNalfq85s7kh+V
         Vtb5jmTINQ1GrYXMiZX5AaEIVS9+l+FOYSyaSNOc03+NlhR5ZWA/cIBa3MD5xR4xDqt1
         JcmA==
X-Gm-Message-State: AOAM530Q/SxuaTex8KMGgX33YDI+jwGwawXqUE8k1/Wjb5FyYNGH/3P4
	EacdYFKL+DOm+knC84qlywk=
X-Google-Smtp-Source: ABdhPJzdW+esYvS3vs8j3aU3rQhAdPcZKT23xphU/2mBtRUZhee/35CuAZrTgEak3RSfes51pbfWfw==
X-Received: by 2002:ad4:522c:: with SMTP id r12mr10072836qvq.17.1630075930589;
        Fri, 27 Aug 2021 07:52:10 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id w6sm4825942qkw.91.2021.08.27.07.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 07:52:10 -0700 (PDT)
Date: Fri, 27 Aug 2021 10:52:08 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] busybox-initrd: rename to match 1.34.0 version from oe-core
Message-ID: <20210827145208.GB23331@gmail.com>
References: <20210827131913.3314816-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210827131913.3314816-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

beat me to it!

This is now merged.

Bruce

In message: [meta-virtualization][PATCH] busybox-initrd: rename to match 1.34.0 version from oe-core
on 27/08/2021 Martin Jansa wrote:

> Upgraded in:
> https://git.openembedded.org/openembedded-core/commit/?id=d0e694ef4ec7bd862bdefee494210e3878152b44
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../{busybox-initrd_1.33.1.bb => busybox-initrd_1.34.0.bb}        | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename recipes-core/busybox/{busybox-initrd_1.33.1.bb => busybox-initrd_1.34.0.bb} (100%)
> 
> diff --git a/recipes-core/busybox/busybox-initrd_1.33.1.bb b/recipes-core/busybox/busybox-initrd_1.34.0.bb
> similarity index 100%
> rename from recipes-core/busybox/busybox-initrd_1.33.1.bb
> rename to recipes-core/busybox/busybox-initrd_1.34.0.bb
> -- 
> 2.30.2
> 

> 
> 
> 

