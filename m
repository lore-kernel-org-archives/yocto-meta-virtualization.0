Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.3592.1594263835822816593
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Jul 2020 20:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HhjcBzy1;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id di5so336010qvb.11
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Jul 2020 20:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=kZ2KO/BjxFzeMa5NuZjLCZsup0De5/eEP9t3X05RCW4=;
        b=HhjcBzy13rbXyijzPTmDOoaCV89FdOHjINPDXtarvc67ExLJziy/qtlAxmGChDx8GU
         LKUf8p4Lb5vJ6t3WLUzxfiJDm9pb8w0LJYxc1AgUcHoVa8Ht3DG96q9mp0QPIqTQrdA3
         64iNg8+kyKjHHZ9QZ6hcEYSVMWDPQjJoPjO+qnkeqmMc5mDw/df8utuiEeTO/tDmmye0
         Lz38ZsFtOuUaVJNfebPmQnKk5b8ZZP5o6c4qziB2vmCpuKV868iW+1XAX7Xs2UVu8dj0
         Fpc29EHydsRF823IeNkpU2JaTywRLxucGPoJi/4x016nTwsVXsp+Sw9epPqaz6sO75LE
         2hCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kZ2KO/BjxFzeMa5NuZjLCZsup0De5/eEP9t3X05RCW4=;
        b=Hc4GymC5raaDQvw3nCufCXzB7NawdLV0WulbDH0IHmzBvI0v1hjyY1s+6JAlByUF0t
         Ii/eJJc1uBaJi77dZj5gVwc8BUdjhHku136iCF5tsWHRYRv+5/3fg1nsrGRccWzfW+A3
         vamuWBLLMVtV4pm6fEv7R56IJnsCaj/YlIvdUJu3eHy9WGnJ6ottb3THG0sYZ2hda2Cy
         lvadgmNe7f9DigaQEV1NwM9Q1qJpBsWNa2Bp+U6Q4I9lz3fnXIhvoMgTItbbN8SHdY78
         qfucH1nJZIIw9gsNIK98oUTIYeKM0wpKM+y5AHi6vb7VCBWlhs1syEutd5EbJHneh9Pz
         CzzQ==
X-Gm-Message-State: AOAM533O7EidG8x/YuyAXxuRs949h946LWPrBFsWPEUH8Fzti4NXXmli
	mHC721ZlJbCMpUdeIhsoI80=
X-Google-Smtp-Source: ABdhPJxIhL3NPdXl50r/RG8Iu1BagJDYPPmaAXaC68h3FG4UNDnMRUQ5WK8ujpuv8aQw/avB9Mxt9A==
X-Received: by 2002:a0c:83c4:: with SMTP id k62mr46239154qva.19.1594263834560;
        Wed, 08 Jul 2020 20:03:54 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id c9sm2133875qko.24.2020.07.08.20.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 20:03:54 -0700 (PDT)
Date: Wed, 8 Jul 2020 23:03:52 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][meta-cloud-services][PATCH] python3-falcon: Change python to python3
Message-ID: <20200709030349.GA7843@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1594198463-42395-2-git-send-email-wangmy@cn.fujitsu.com>
 <1594198463-42395-3-git-send-email-wangmy@cn.fujitsu.com>
 <1594198463-42395-4-git-send-email-wangmy@cn.fujitsu.com>
 <1594198463-42395-1-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce


In message: [meta-virtualization][meta-cloud-services][PATCH] python3-falcon: Change python to python3
on 08/07/2020 Wang Mingyu wrote:

> upgrade 0.2 -> 2.0.0
> 
> python-mimeparse is only for Python 2, so remove it.
> 
> content of README.rst is changed.
> 
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  ...ython-falcon_0.2.bb => python3-falcon_2.0.0.bb} | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-falcon_0.2.bb => python3-falcon_2.0.0.bb} (51%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-falcon_0.2.bb b/meta-openstack/recipes-devtools/python/python3-falcon_2.0.0.bb
> similarity index 51%
> rename from meta-openstack/recipes-devtools/python/python-falcon_0.2.bb
> rename to meta-openstack/recipes-devtools/python/python3-falcon_2.0.0.bb
> index b014a72..648a7dd 100644
> --- a/meta-openstack/recipes-devtools/python/python-falcon_0.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-falcon_2.0.0.bb
> @@ -2,10 +2,10 @@ DESCRIPTION = "An unladen web framework for building APIs and app backends."
>  HOMEPAGE = "http://falconframework.org"
>  SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://README.rst;md5=2bf705a48be7b7799862ffe602c94b87"
> +LIC_FILES_CHKSUM = "file://README.rst;md5=a0c7260e38287caff6c266d1f287e962"
>  
> -SRC_URI[md5sum] = "bf9e8bdd20700f1ff7ce6397cd441fbd"
> -SRC_URI[sha256sum] = "92bb899bf6e58e2299e3b1de1e628b90c38544ba3354a0141d108318b50c3402"
> +SRC_URI[md5sum] = "77c52c144dd284e6259d257c6f008072"
> +SRC_URI[sha256sum] = "eea593cf466b9c126ce667f6d30503624ef24459f118c75594a69353b6c3d5fc"
>  
>  inherit setuptools3 pypi
>  
> @@ -15,10 +15,12 @@ do_install_append() {
>  }
>  
>  DEPENDS += " \
> -        python-pip \
> +        python3-pip \
>          "
>  
>  RDEPENDS_${PN} += " \
> -        python-six \
> -        python-mimeparse \
> +        python3-six \
> +        python3-json \
> +        python3-xml \
> +        python3-netserver \
>          "
> -- 
> 2.17.1
> 
> 
> 

> 


