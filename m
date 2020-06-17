Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.2086.1592354061057266113
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 17:34:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=caGqWzNv;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E6410E01D10; Tue, 16 Jun 2020 17:34:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,URIBL_RED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.219.66 listed in list.dnswl.org]
	*  0.0 URIBL_RED Contains an URL listed in the URIBL redlist
	*      [URIs: yoctoproject.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40CFCE01CCB
	for <meta-virtualization@yoctoproject.org>; Tue, 16 Jun 2020 17:34:20 -0700 (PDT)
Received: by mail-qv1-f66.google.com with SMTP id cv17so219806qvb.13
        for <meta-virtualization@yoctoproject.org>; Tue, 16 Jun 2020 17:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EtAL4AQeuovPIRAR9HwLSZ/D/Itq7pKP2LNuQP0sGoU=;
        b=caGqWzNvW6DhMxifTKXBj+3QoJ5mmOLPXw3weFG+7KADXWp0foNBgsBB0nPXYUbMNn
         LzFYflWJJB2A9zrK0yk1/LM56cF2KSnhmI/7KXJr9NjTVgf6mm3WlH/J6EpeLrUyFPJ6
         ybm2Eyr4CECsGLNnf1lkzIFns9fLheEgPuxD9PpUaDinVCxkIGHNc1WYWtZLuNRU3rIw
         oL/6/w9VPqBXYa60HeA6Pf0rLUKxCrS5YXnlcA+wQ8UWFMgJaSFhqaFZ0Q2A+diyXcf3
         IuhPuX0AZobYQq8jCFgkH8rYGCfMZClVOEYikOKLPaxw4LoFmMPH886YmZ57oWgLnsJS
         ZZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EtAL4AQeuovPIRAR9HwLSZ/D/Itq7pKP2LNuQP0sGoU=;
        b=LIbYvESt+JUILbxa87mZIvdg9kt69hsP+ZTX7Asq6qPMkZdP3CaoZ8zpzg1SM3lCU7
         3KGuoW30tOFxIJM65+CA1zOhpP1i+fmc8pyeoKAECff/sX8X0U3pEDAczn11+n3LiJQ6
         eC6Xeg4o/JXPqqaRT6k2B8ek6wTAEzjs1i1aQEHW33Fxz6XaeqA3/M67e+uGqvpiclU8
         d73OiX6OuhVkBk5v0oK1EfZF4gtYHJyj8LukSC1LdleFeTEIT2PjwQ4k1HmfVmbcwUYI
         b8rKbvQoJyqYgKDyeitPRiTHkvRsD6Qld5rXPjvV0jPfuo6oNMqI1f8/cR9kdb3FpIyI
         GfVA==
X-Gm-Message-State: AOAM533oP8zKh076nEVCpmzkzq7CGLhvYmu6qWV1yaaoLf+FsZwawipS
	4fH5/U5nBFHJ9DYYqTJk5wdAU6yHqKkHyA==
X-Google-Smtp-Source: ABdhPJxUrc8AEXB35+tG2iTfzGpQZwsvfUNw9BKjGdOyMATjFYbEcfwv8aLP8y/9mSvgUCbNOJYmWg==
X-Received: by 2002:ad4:50c8:: with SMTP id e8mr4964752qvq.98.1592354059588;
        Tue, 16 Jun 2020 17:34:19 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id 10sm15606760qkv.136.2020.06.16.17.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 17:34:19 -0700 (PDT)
Date: Tue, 16 Jun 2020 20:34:17 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization][meta-openstack][PATCH] python3-mox3: Change python to python3
Message-ID: <20200617003416.GB5232@gmail.com>
References: <1592316473-130293-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1592316473-130293-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce


In message: [meta-virtualization][meta-openstack][PATCH] python3-mox3: Change python to python3
on 16/06/2020 zhengruoqin wrote:

> upgrade 0.28.0 -> 1.1.0
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../{python-mox3_0.28.0.bb => python3-mox3_1.1.0.bb} | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-mox3_0.28.0.bb => python3-mox3_1.1.0.bb} (61%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-mox3_0.28.0.bb b/meta-openstack/recipes-devtools/python/python3-mox3_1.1.0.bb
> similarity index 61%
> rename from meta-openstack/recipes-devtools/python/python-mox3_0.28.0.bb
> rename to meta-openstack/recipes-devtools/python/python3-mox3_1.1.0.bb
> index 770569b..9608077 100644
> --- a/meta-openstack/recipes-devtools/python/python-mox3_0.28.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-mox3_1.1.0.bb
> @@ -4,21 +4,21 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://COPYING.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  
> -SRC_URI[md5sum] = "c930d8479996541b04447a67e96e4a62"
> -SRC_URI[sha256sum] = "8094868e70f814b4a526ecc592365437bc93a7dd60341321344987b3e8dba49d"
> +SRC_URI[md5sum] = "0eff74d3a85ec4d4dc6acf7f524ca816"
> +SRC_URI[sha256sum] = "8a526b7b9b6341f541a9aef3e08c93fd84a5373fe89d4cc51dd571f085b2363c"
>  
>  inherit setuptools3 pypi
>  
>  DEPENDS += "\
> -    python-pbr \
> +    python3-pbr \
>      "
>  
>  # Satisfy setup.py 'setup_requires'
>  DEPENDS += " \
> -    python-pbr-native \
> +    python3-pbr-native \
>      "
>  
>  RDEPENDS_${PN} += " \
> -    python-pbr \
> -    python-fixtures \
> +    python3-pbr \
> +    python3-fixtures \
>  "
> -- 
> 2.17.1
> 
> 
> 

> 

