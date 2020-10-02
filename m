Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.4011.1601608330234130229
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Oct 2020 20:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=imBGTsI5;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 086AF38C07FA
	for <meta-virtualization@yoctoproject.org>; Thu,  1 Oct 2020 20:12:10 -0700 (PDT)
Received: by mail-qk1-f196.google.com with SMTP id o5so732259qke.12
        for <meta-virtualization@yoctoproject.org>; Thu, 01 Oct 2020 20:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=5HnO70Kf7ypXPrUSc264qFsIPlMVaDRt6Bht0a+Axyo=;
        b=imBGTsI5DfkkAbpYkvJyM3dbFWIoQSACxLuKuJ07sS30LjgDPcloUHaiut1zKY5H/V
         OGPm9pjLiFdPM9fKlX4GgAQEnYOiSQURGo988i8sIgEgsIiuWO2KkCSDwtsWFaJD56Fc
         5y/SA0nNRX/R3+7udkP17Fcic/1Ohj0GvVSPzxqXpwkKnDkNyAsMbjadvRBaG+9rmPGe
         MNJlO43jIsme14Y8QZMtdiGQt1PTiaQHqFS39MxxjGo+YWOG/VKrFpk9r0uE1v67Kqxj
         rnlxbKtIn6clHDB5iu9FrsvR+4o6/Dnlww9qNvvHE07xFDj/4NNeCC7xRdFEAtr/353j
         cFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5HnO70Kf7ypXPrUSc264qFsIPlMVaDRt6Bht0a+Axyo=;
        b=d3P8570l0/x/tRf80eeGmRqGo5aFMqQigWEmLzjOt8JrGkgk3BVY2RK3IzGSGztkM8
         HFUCvMvPhwO5crl5LFptaaPkGGp6nSqnPorEwRVBePdgSuejgdTvZcyV7xcrMThaOQPI
         mPFP3pi5CuSPI2k14xZfCJwoG9EPzE4d1IO1tcZu6ViOnecr9kK6nOt119qPhnfYAck6
         qoMrZm3NcckTgsGD0bD5NOSI1ivODOdcq1aQQzStXv7YlbZRB+es/ft2CPBV8yHUnzz+
         uy2DjTRvGWfTX9aopL1xtD90JhfYOj8T4YZrdSSSRW2/29ouRC0VDfN7sU4FpTxbyb1d
         RTnQ==
X-Gm-Message-State: AOAM5314V8jZrlZwxnwI2rUEfRAZe3So3MCNfbjVmqdEM39nT0spYeA0
	6aLgaSrthLoDmkSweQo2MsG6API9b6LfSSwY
X-Google-Smtp-Source: ABdhPJziRYz/KHk2/qDb0NqNZFjAxiDD1l7ZS9h3UMbh+Bw0E0XU2X8dNp1A2N5qelFT2XTiQ9/vpw==
X-Received: by 2002:a05:620a:69b:: with SMTP id f27mr196098qkh.309.1601608328975;
        Thu, 01 Oct 2020 20:12:08 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id k5sm207951qkc.45.2020.10.01.20.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 20:12:08 -0700 (PDT)
Date: Thu, 1 Oct 2020 23:12:06 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-xstatic-objectpath: change to python3
Message-ID: <20201002031206.GB53106@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1601349566-108443-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1601349593-108482-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1601349611-108532-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1601349622-108579-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1601349630-108615-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1601349638-108654-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-xstatic-objectpath: change to python3
on 29/09/2020 zhengruoqin wrote:

> Because python2 is no longer maintained, bb file is changed to python3 version.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  ...ectpath_1.2.1.0.bb => python3-xstatic-objectpath_1.2.1.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-openstack/recipes-devtools/python/{python-xstatic-objectpath_1.2.1.0.bb => python3-xstatic-objectpath_1.2.1.0.bb} (96%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-objectpath_1.2.1.0.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-objectpath_1.2.1.0.bb
> similarity index 96%
> rename from meta-openstack/recipes-devtools/python/python-xstatic-objectpath_1.2.1.0.bb
> rename to meta-openstack/recipes-devtools/python/python3-xstatic-objectpath_1.2.1.0.bb
> index bd2eefa..faf2858 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-objectpath_1.2.1.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-xstatic-objectpath_1.2.1.0.bb
> @@ -14,7 +14,7 @@ inherit setuptools3 pypi
>  # DEPENDS_default: python-pip
>  
>  DEPENDS += " \
> -        python-pip \
> +        python3-pip \
>          "
>  
>  # RDEPENDS_default: 
> -- 
> 2.25.1
> 
> 
> 

> 
> 
> 


