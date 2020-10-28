Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.3470.1603855702392235142
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 20:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WuqCHg0s;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 18B0F38C1433
	for <meta-virtualization@yoctoproject.org>; Tue, 27 Oct 2020 20:28:22 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id q199so3369388qke.10
        for <meta-virtualization@yoctoproject.org>; Tue, 27 Oct 2020 20:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=f4RccT5o7G31oDNlbft9/BMvYYzpt9qMMtkPMs8QmNU=;
        b=WuqCHg0sDZXUuiw3uIzqj82DKpWQtmQ6EiRJkpRnFsmwdJB6u6DX7WxSBxLpv5YZou
         5/CNU06XKxePlwEhxruuYo1mhAoW/Jd9fphwXpJc3Mms9exVcTpRtM9r9287hHt4k7p6
         1IIL3BDGTZGBfgNgqKLjtTpxcxIW7gySGaVi5nbNSGBGqKGd0Od79f0O3lG7qD5hEeZ9
         YJn+gTl0KrCCZwmkBvxmLEBDDoJC81pZ8wvypxP+Oq0ofX8Ud+NBGx6CttVkmlQP9tTR
         T9osZGeh96QRTqXulCw8UCd8bi7SmXeqmjiSSYLepwlXrVLshg0uyjXHUGZG44NIFnZd
         HhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=f4RccT5o7G31oDNlbft9/BMvYYzpt9qMMtkPMs8QmNU=;
        b=QPefK1aSvgAWMg5S+ZkCpwew7ZVny9/UN10p79NduEXiPu42X7Thi0LoBVZGgeyFT0
         c2GXdrqv98T8k8sr7VfgvYURO2lB9jBMsKcui3AnfkHSZsPYD/V9sHGx0p0i8wAkXNue
         xzmjbZG/Bg553m73zPPDQ8ZCXOvisylSJ/K0PxjNBWKLsD9L8jHO668YRiaPO5jl08LA
         xAaB+Mr000RVcQ+m6foIohcHlJ3zVIhhOwjkq61DHVJMXpeTyGKeLIQfpna1663eUduh
         NjwluOEcBOCo94vKrsYJ4WxbXfOYqzVfmpzmHGREDEpajdqR5hro0HDoZPF6l33CJ2Xh
         Zp0A==
X-Gm-Message-State: AOAM533vZyYtvzodVv+UsktgowMPV3fHm40gu9L//W+a2xMGJXZ7VNvA
	umJkGhxw2YmdE0p6y8Kj8do=
X-Google-Smtp-Source: ABdhPJzTT4ezsj8J0t96neTlMZvV8kwbtqN0iSCi3fZCJRKzdvrXOA6W3QIpNdXrQvlm52Gd0W+K/Q==
X-Received: by 2002:a05:620a:2202:: with SMTP id m2mr5342400qkh.58.1603855700864;
        Tue, 27 Oct 2020 20:28:20 -0700 (PDT)
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id w45sm2405526qtw.96.2020.10.27.20.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 20:28:20 -0700 (PDT)
Date: Tue, 27 Oct 2020 23:28:18 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-webtest: upgrade 2.0.33 -> 2.0.35
Message-ID: <20201028032817.GC46280@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1603176096-40364-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1603176138-40410-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1603176148-40446-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1603176157-40482-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1603176184-40527-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1603176202-40565-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1603176207-40601-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1603176227-40638-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1603176243-40682-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1603176256-40720-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1603176262-40756-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1603176285-40793-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks for the fixes / updates / cleanups!

These are now merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-webtest: upgrade 2.0.33 -> 2.0.35
on 20/10/2020 zhengruoqin wrote:

> Consolidate inc and bb files into a single bb file.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../python/python3-webtest_2.0.33.bb                 |  2 --
>  ...{python-webtest.inc => python3-webtest_2.0.35.bb} | 12 ++++++++++--
>  2 files changed, 10 insertions(+), 4 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python3-webtest_2.0.33.bb
>  rename meta-openstack/recipes-devtools/python/{python-webtest.inc => python3-webtest_2.0.35.bb} (55%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python3-webtest_2.0.33.bb b/meta-openstack/recipes-devtools/python/python3-webtest_2.0.33.bb
> deleted file mode 100644
> index aaf0b42..0000000
> --- a/meta-openstack/recipes-devtools/python/python3-webtest_2.0.33.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit setuptools3 pypi
> -require python-webtest.inc
> diff --git a/meta-openstack/recipes-devtools/python/python-webtest.inc b/meta-openstack/recipes-devtools/python/python3-webtest_2.0.35.bb
> similarity index 55%
> rename from meta-openstack/recipes-devtools/python/python-webtest.inc
> rename to meta-openstack/recipes-devtools/python/python3-webtest_2.0.35.bb
> index d4e9e07..5fd4f5a 100644
> --- a/meta-openstack/recipes-devtools/python/python-webtest.inc
> +++ b/meta-openstack/recipes-devtools/python/python3-webtest_2.0.35.bb
> @@ -8,5 +8,13 @@ PYPI_PACKAGE = "WebTest"
>  
>  RDEPENDS_${PN} += "${PYTHON_PN}-beautifulsoup4"
>  
> -SRC_URI[md5sum] = "dd0385c725b85ac1e8079f38d2acd7b1"
> -SRC_URI[sha256sum] = "41348efe4323a647a239c31cde84e5e440d726ca4f449859264e538d39037fd0"
> +SRC_URI[md5sum] = "a5d027ffa0991fdf20e305c62bd37791"
> +SRC_URI[sha256sum] = "aac168b5b2b4f200af4e35867cf316712210e3d5db81c1cbdff38722647bb087"
> +
> +RDEPENDS_${PN} += " \
> +	python3-html \
> +	python3-logging \
> +	python3-webob \
> +"
> +
> +inherit setuptools3 pypi
> -- 
> 2.25.1
> 
> 
> 

> 
> 
> 


