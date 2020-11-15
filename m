Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.15852.1605413907326849995
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 14 Nov 2020 20:18:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sq7GsTZz;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 80DEB38C086C
	for <meta-virtualization@yoctoproject.org>; Sun, 15 Nov 2020 04:18:26 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id o66so242760qkd.4
        for <meta-virtualization@yoctoproject.org>; Sat, 14 Nov 2020 20:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=Yh+bTxo/J40GqbNAJ3YKMHnaKIKrJzxrMuqurfgmIXY=;
        b=sq7GsTZzoVGHqXq1rjgsZXPcPrl6x2saljlo2+SNxU7kBriRwDxxAse13+85TbXka2
         FgFEB45EhuSEHl7+TOShTLUL2mweQazX3zZlVFKeKfOL1DAhorGrrLx+pzvdj5fGZSod
         i2IOPhymCsb29Uzr8UpilWvuEyIB3Lz8miaax1ModXq20Zsl3rDyMt5RvddsC10HAPZj
         /SdCfOqjP0j9WyZt8bmptUq5fha5hZeuUKwzYH3nbfzpT+vuZ3t2Y43yD7JMjsGurEmd
         ybgIoBqlY0HNQ48ZwcqwIMK6LtMG/VT5yQXlCDjqCcpwWHMKtDWiMRU3//XhL+5Pf94A
         GcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Yh+bTxo/J40GqbNAJ3YKMHnaKIKrJzxrMuqurfgmIXY=;
        b=e1AYH51eh6R951apvCjvvU5919byHhaLD8Bt/KO1UDLcViRO3gTeBC7qVGDYtHxozW
         /Glow6r5oOSVZYGTXoj/bNm9NPDBuV0WjuVQ/ma18uFvsGBiDDrSRDj1RYvMjMn/57Mj
         PcOrALLEes2beCQlxztaDrqfXHIZi6WhBMfdK0NV03UCdCh7W93Rto7T6BT7HIZDAzWG
         J/WpRseVE+T+VPOlHA3SY0OGGMomn5gT8r7OC6wtV2Xjxm9MGT06cjPStLS032ttFjA7
         Pni9frbP8NKkPkN8DV0YhEHlGn2GzwOsBdRJFmEinIhTxNUolW9G6ViekdB49xo5B+xz
         N1qw==
X-Gm-Message-State: AOAM532yceCSFbtdM8xm7LHBoGZ0P4s5xK/b3GEA2eWm2nwK4Cs875VQ
	whaeTKGXWA9H2MIOtPUJB78z26BD3Uyv1gUT
X-Google-Smtp-Source: ABdhPJyJe4Z4ZmlnoNxWr/4CsJamI3foZeMgS2ABMenFd+UbqResTGvxUKwWsiV1wm3qGWVrtg3R5w==
X-Received: by 2002:a37:660e:: with SMTP id a14mr9316474qkc.330.1605413905568;
        Sat, 14 Nov 2020 20:18:25 -0800 (PST)
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id i64sm10170999qtb.43.2020.11.14.20.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 20:18:25 -0800 (PST)
Date: Sat, 14 Nov 2020 23:18:23 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-kazoo: upgrade 2.7.0 -> 2.8.0
Message-ID: <20201115041822.GB20764@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1604990888-97067-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1604990879-97031-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1604990860-96957-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1604990851-96918-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1604990804-96864-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1604990740-96816-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-kazoo: upgrade 2.7.0 -> 2.8.0
on 10/11/2020 zhengruoqin wrote:

> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../python/{python3-kazoo_2.7.0.bb => python3-kazoo_2.8.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python3-kazoo_2.7.0.bb => python3-kazoo_2.8.0.bb} (79%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python3-kazoo_2.7.0.bb b/meta-openstack/recipes-devtools/python/python3-kazoo_2.8.0.bb
> similarity index 79%
> rename from meta-openstack/recipes-devtools/python/python3-kazoo_2.7.0.bb
> rename to meta-openstack/recipes-devtools/python/python3-kazoo_2.8.0.bb
> index adfec92c..554e1659 100644
> --- a/meta-openstack/recipes-devtools/python/python3-kazoo_2.7.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-kazoo_2.8.0.bb
> @@ -9,8 +9,8 @@ SRCNAME = "kazoo"
>  
>  PYPI_SRC_URI = "https://pypi.python.org/packages/source/k/${SRCNAME}/kazoo-${PV}.tar.gz"
>  
> -SRC_URI[md5sum] = "073445f65d71520de2b6275530d88c4e"
> -SRC_URI[sha256sum] = "6883f6dd3e8d4e1741076dd3b23b0861592f13759072e3835f035bcb72b077cb"
> +SRC_URI[md5sum] = "5b2667e9c3f7b92675aef16c14cef97c"
> +SRC_URI[sha256sum] = "588e27868e4a0ed70ae4a7a5b0f3bca4cec5e5c49dbd7e41349c0883182bf2fe"
>  
>  inherit setuptools3 pypi
>  
> -- 
> 2.25.1
> 
> 
> 

> 
> 
> 


