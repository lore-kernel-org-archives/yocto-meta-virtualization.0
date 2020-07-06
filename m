Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.1974.1594067493341572357
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2020 13:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WWvePsJg;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id u12so30051162qth.12
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2020 13:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=ERq+VayzkJzk5FUkOCgzlGaOIb1OWAZmqdaBO6+IBhM=;
        b=WWvePsJgmea1VnFNE51ji+MT3E6qHNuTZbfBN+txdyH0xdRhj7mTTxvmrEfMgOReZl
         +lHU9JM6j8sa8uHhDLEQVBdXeRB6omqQaaeMhQP9iRyqferA0P1Zej/wXlVU7YDmT4Hs
         BTEhW4cKDkRaPENBkgXiHe6ijMTNKCJBgs9M/MWtf289/5Eonf2S5F29PvxTgHGNoL7Q
         AVZFYHdOjh8Us3nB8azqbizVVLfVboisXv/YLG5Nj0Z1oBsiW2iLnirMUlOkHH1N/MRn
         wGhZReUrh7pfC4qXJ10wEIwCDjDwI2/EH9Y8QHXgsO4vw766Z9EcBomJfpzchDDrygD/
         HeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ERq+VayzkJzk5FUkOCgzlGaOIb1OWAZmqdaBO6+IBhM=;
        b=QC+7ivmXww/VIMZ0xZf6D3aV8TgzKUHz2dTvnLN9esbYwUeTWnXscoBHXBx9jeEupc
         1tmPB0qHXhrUu6j2UGvep3r7bWLqZCBWwkvTihrBFxObl04wIxD/37btYWhvn7Vew5Fk
         dEDOEHas9Vzcwb3KPsJ15MCcHXAxiK6YTuEGJzurnAhj2fjLavd7soqWqvG0K7vYdUP5
         4bLTOTFlwajNQh7jjpW4GtHw47PZ6tYDHJ5NmHbFMn5po23MhfGYWapatlnjGrfz6V6u
         MDQ9vijGj7C2aWjKD1er6OMNoD/Er6eFmef21/Gob47qa3Ee4gB1L94GJ2qTd7VnAeqe
         2IqQ==
X-Gm-Message-State: AOAM531nnjAo2Npbe6irN9C4QBGnodLGoSQa7rlwxtciCSQOsOhQaEUV
	QccVWKGr6fzj5XSNgTxg+MlohnwhhqmYIw==
X-Google-Smtp-Source: ABdhPJx+oZH7qHN0t/7DDg8TwrcIzFwAKmkC7bRNeGr5P+IkxIvueR3pGHfTmL4t25oiHAGxHBsC0A==
X-Received: by 2002:ac8:314c:: with SMTP id h12mr51489889qtb.128.1594067492354;
        Mon, 06 Jul 2020 13:31:32 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id j52sm24684194qtc.49.2020.07.06.13.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 13:31:31 -0700 (PDT)
Date: Mon, 6 Jul 2020 16:31:30 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][meta-cloud-services][PATCH] python3-kazoo: Change python to python3
Message-ID: <20200706203127.GA50063@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1593496973-20225-1-git-send-email-wangmy@cn.fujitsu.com>
 <1593586793-23074-4-git-send-email-wangmy@cn.fujitsu.com>
 <1593586793-23074-3-git-send-email-wangmy@cn.fujitsu.com>
 <1593586793-23074-2-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization][meta-cloud-services][PATCH] python3-kazoo: Change python to python3
on 01/07/2020 Wang Mingyu wrote:

> upgrade 2.0 -> 2.7.0
> 
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../{python-kazoo_2.0.bb => python3-kazoo_2.7.0.bb}  | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-kazoo_2.0.bb => python3-kazoo_2.7.0.bb} (65%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-kazoo_2.0.bb b/meta-openstack/recipes-devtools/python/python3-kazoo_2.7.0.bb
> similarity index 65%
> rename from meta-openstack/recipes-devtools/python/python-kazoo_2.0.bb
> rename to meta-openstack/recipes-devtools/python/python3-kazoo_2.7.0.bb
> index db7c023..adfec92 100644
> --- a/meta-openstack/recipes-devtools/python/python-kazoo_2.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-kazoo_2.7.0.bb
> @@ -5,17 +5,19 @@ LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
>  
>  # Archived version so we have to overwrite what the pypi class will derive
> -PYPI_SRC_URI = "https://pypi.python.org/packages/source/k/${SRCNAME}/kazoo-${PV}.zip"
> +SRCNAME = "kazoo"
>  
> -SRC_URI[md5sum] = "4b172de456c102b0e33f661e7e2b3583"
> -SRC_URI[sha256sum] = "f0c42cc7752a331ba59269827bd19cb271210399a9dcab32b6a91465b4431a18"
> +PYPI_SRC_URI = "https://pypi.python.org/packages/source/k/${SRCNAME}/kazoo-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "073445f65d71520de2b6275530d88c4e"
> +SRC_URI[sha256sum] = "6883f6dd3e8d4e1741076dd3b23b0861592f13759072e3835f035bcb72b077cb"
>  
>  inherit setuptools3 pypi
>  
> -# DEPENDS_default: python-pip
> +# DEPENDS_default: python3-pip
>  
>  DEPENDS += " \
> -        python-pip \
> +        python3-pip \
>          "
>  
>  # RDEPENDS_default: 
> -- 
> 2.17.1
> 
> 
> 

> 


