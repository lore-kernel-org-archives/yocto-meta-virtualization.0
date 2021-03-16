Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web12.7937.1615899542970050631
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 Mar 2021 05:59:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bkvt80iG;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id s2so11500360qtx.10
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Mar 2021 05:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4B6e2ky3jfbrxm4xE9ZbK6tTk2QCsMRZodqjDggFhhY=;
        b=bkvt80iG/t/AWTayBIOGhXjmkZtwp0/rJq0Lf6RFEwwMz3ymeyPEfPqKn/TgLPXaPd
         NY14fhU1p5nRmilq5Ti6g/1XQty/TQNcOn74oCj+YeOHpk7bkUHpCZHwkE8yzUszW8rW
         +j6gn3BmT0cTs7W5A8FPDxAIm/SWe/ZMD2WrUpnV/t/ioZEjXGJvMQZ4Awc10+9cC8AJ
         WFJMkK3TCzEysbwbnsxABjSmGBjoEq8S2mwaTikbpy6WsyER4X+K6qVo7NV20xcRKulz
         lDVJa/rt/CRjN4HPeKK1JXtIksCvMqIXdRNKxCaTlDwCKuWuIoNeORdLe8EHYjaMwAGv
         mqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4B6e2ky3jfbrxm4xE9ZbK6tTk2QCsMRZodqjDggFhhY=;
        b=b/3o6c8ozp+sFgQjDucQ0RMd9yPLKayLB+p095Xlan40KDth/iiE+0clm1Q+EgDye0
         86NSTyOlI6ptXazt7689jfXmZEqitBnkpR6WFtwUkNoC7imTxODoi4vFDvSTxYTylmfp
         Vg4y2qOcc+6X38ImIqXbpQx1Yy6yMMczF3K2dPW4ZYXg73iyZLtxiXo6WgZNtU7d9BbS
         zahIa1FtakTdE5d39YD/rVnqsu1WGSu62yTucQhSrwZ9hmJroPxYtLOLKyL2VHq0kUEh
         0//Ww1yjvi4eO0kHNTVnJEAA76vp1j075hAbmZPbsOkjbtfsTz2kiQRD+sicnLgQDqLz
         uyyg==
X-Gm-Message-State: AOAM532Tp38Uy+vixPemSnesLCObrCxdj8tOD+WfSY2wMapkhB1jSZ1Z
	GJU0wSh7ObnMD3bL8aBzXVI=
X-Google-Smtp-Source: ABdhPJyGdAL1tu+mpyEMngPghS0XvBZtpR6DsxhGn1GUViJKvZtjAtih0Z5yqHNDKIsAkVdxcWvryA==
X-Received: by 2002:aed:3781:: with SMTP id j1mr24882922qtb.88.1615899541702;
        Tue, 16 Mar 2021 05:59:01 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id m3sm14433238qkk.15.2021.03.16.05.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 05:59:01 -0700 (PDT)
Date: Tue, 16 Mar 2021 08:58:59 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] consul: export GO111MODULE=off
Message-ID: <20210316125857.GA62608@gmail.com>
References: <20210316060525.27955-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210316060525.27955-1-Qi.Chen@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] consul: export GO111MODULE=off
on 16/03/2021 Chen Qi wrote:

> With the latest go version bump in oe-core export GO111MODULE is
> on by default. Our build is not setup to use go modules, so we
> disable it and avoid configuration errors.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-connectivity/consul/consul_git.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/recipes-connectivity/consul/consul_git.bb b/recipes-connectivity/consul/consul_git.bb
> index b96499c4..f4955e2a 100644
> --- a/recipes-connectivity/consul/consul_git.bb
> +++ b/recipes-connectivity/consul/consul_git.bb
> @@ -28,6 +28,10 @@ COMPATIBLE_HOST_mipsarch = "null"
>  SYSTEMD_SERVICE_${PN} = "consul.service"
>  SYSTEMD_AUTO_ENABLE_${PN} = "disable"
>  
> +do_compile_prepend () {
> +    export GO111MODULE=off
> +}
> +
>  do_install_append() {
>      install -d ${D}/${systemd_unitdir}/system
>      cp ${WORKDIR}/consul.service ${D}/${systemd_unitdir}/system
> -- 
> 2.30.2
> 

> 
> 
> 

