Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.11667.1605802338313037451
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 08:12:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ANE7giRy;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	by mail.yoctoproject.org (Postfix) with ESMTPS id C368638C08DD
	for <meta-virtualization@yoctoproject.org>; Thu, 19 Nov 2020 16:12:17 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id k4so5802328qko.13
        for <meta-virtualization@yoctoproject.org>; Thu, 19 Nov 2020 08:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=NtD4R6oGq0LdE7EXNPZ/08pJbp/pJVyxjbvMkxSTnxM=;
        b=ANE7giRy3ChJaoNJ77UcYW5SIqTajOBD5xZ3gEFE8bBz8uUxtEhmkia/lkigcDRceY
         NBvQ0vFiqPKI6deGSFPkK5HUfSJ4Gdc4Wtuk1yZ7YtDPiN130AG4v4mJKNXVLh60Vcz1
         9Ot2kRXnmCFNxpmxHxUN7ZqpACjF3A4QULKG4tsapJxwgKBQ2ySYKXzqyylJHx+vbj0P
         eINKug7Q+el8NNh9E0yTQYCjRSVM+S1IVG/9HnpZhgrgXQ7LPK3jK5oUxeJtfIDYVkgL
         7K73IcjslBbUtdFHKYnBaorAj3OW5ucHQ/YwSKxszfzpLuM0Lv/yk6GkcLtm9YWxrAkD
         CVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NtD4R6oGq0LdE7EXNPZ/08pJbp/pJVyxjbvMkxSTnxM=;
        b=XVEN7zrD92/mp1jjEGiqkehtr9w1jVxB0B5fR5IiSZ/yIRQTJP+iZcr1XAZ7wtMYlo
         woK01fd+IvKN+6Jzj0GjW3Si7UHAXVhQbaFXzbwx8r3U6E/n7Qwv7kpLBogxezZqdtia
         3/S0GkA59U62VDCU9wpF6PN0q69dTjuXzejm4aEGYMtmKBEXi40PT3RteAzhwh2/j0lU
         EknuYOCoKG7npYPx+gifU7zRREbrt25zo9YMcCpLCYKV7/aYNIGfBPzDbhy75u+j0Um0
         HkZOLDxJIfmcK31p1N/MwpWLcbESETL1iGsPNq3PbQQqsHO9NZALpPfmGjv0bJZvpyuQ
         cSAw==
X-Gm-Message-State: AOAM531PoK/8Dk0epZqLkCp04M+ZnYCrO68n5CUTA8Hyjv6pDuSXlUgs
	PbLptg6n7Fm45whTWsX+cJc3BAshEgWC78QS
X-Google-Smtp-Source: ABdhPJzwFbAQVDt9Mnpj+D5SymZKKbKk2wE1SDv/1M5qbUqW4a+byzPJBtQrZhNzCJCDHQ6QXn6hUw==
X-Received: by 2002:a37:4f0a:: with SMTP id d10mr12057163qkb.184.1605802336676;
        Thu, 19 Nov 2020 08:12:16 -0800 (PST)
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id k17sm135480qkj.51.2020.11.19.08.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 08:12:16 -0800 (PST)
Date: Thu, 19 Nov 2020 11:12:14 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH 1/7] python3-pyscss: Change to python3
Message-ID: <20201119161213.GB26762@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1605622407-3718-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1605622356-3663-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1605622326-3580-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1605622302-3504-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1605622280-3455-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1605622236-3389-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1605622185-3281-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH 1/7] python3-pyscss: Change to python3
on 17/11/2020 zhengruoqin wrote:

> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  ...thon-pyscss_1.3.4.bb => python3-pyscss_1.3.7.bb} | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-pyscss_1.3.4.bb => python3-pyscss_1.3.7.bb} (61%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-pyscss_1.3.4.bb b/meta-openstack/recipes-devtools/python/python3-pyscss_1.3.7.bb
> similarity index 61%
> rename from meta-openstack/recipes-devtools/python/python-pyscss_1.3.4.bb
> rename to meta-openstack/recipes-devtools/python/python3-pyscss_1.3.7.bb
> index 60e300de..0c7528a5 100644
> --- a/meta-openstack/recipes-devtools/python/python-pyscss_1.3.4.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-pyscss_1.3.7.bb
> @@ -6,22 +6,25 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=28155276e8df3f75bbd327335f66f2fa"
>  
>  PYPI_PACKAGE = "pyScss"
>  
> -SRC_URI[md5sum] = "9527b4864cd6023f77a8277e6fb773d7"
> -SRC_URI[sha256sum] = "d0323110ecc7d3ead6b99cfec31301306928130e4d0a9eb13226bf390aba8c0e"
> +SRC_URI[md5sum] = "c75fa4ea88d3c9df57a11679f337a939"
> +SRC_URI[sha256sum] = "f1df571569021a23941a538eb154405dde80bed35dc1ea7c5f3e18e0144746bf"
>  
>  inherit setuptools3 pypi
>  
>  # DEPENDS_default: python-pip
>  
>  DEPENDS += " \
> -        python-pip \
> +        python3-pip \
>          libpcre \
> -        python-six \
> +        python3-six \
>          "
>  
>  # RDEPENDS_default: 
>  RDEPENDS_${PN} += " \
> -        python-enum \
> +	python3-logging \
> +	python3-six \
> +	python3-numbers \
> +	python3-image \
>          "
>  
>  CLEANBROKEN = "1"
> -- 
> 2.25.1
> 
> 
> 

> 
> 
> 


