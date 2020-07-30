Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.3122.1596138383077323571
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 12:46:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TwD5+Vvx;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id b14so25051342qkn.4
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Jul 2020 12:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=yKi1QD2BeLR5w/Gz9qgSqIsBEeEYhRE6AIK2zzZHiVs=;
        b=TwD5+Vvxz9D/4a9fJjvlUhjjxwk+vP3c7GRfrO5zQw3TxuYi0Nie+oHI2S5CAY0tYs
         Lx3YnpNUZeCTOYJBdgd400vXhlNSWT2Qqnxz3mHbYhKjLzRPAd3pyPAMjNXr1N+IzYHW
         6Vxy2TKi9QOgyCbcBUoXANKy+FchaEAnX33ulSHEej0DJ5EgCXHD1ctW0/8JFCMHzPHc
         sb5rZ802xgpC0KQcyiko298f9dPhEladbFT/k/953HUe1N1ASSKT8fKOUV8aLNA++0it
         SC9Me3Q1TXL+PkpTkD2DAa9B4YYcQWRgmDmrcd3MWDzoL3u3Pekz1FjsFh48KtmQ8aPo
         0v4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yKi1QD2BeLR5w/Gz9qgSqIsBEeEYhRE6AIK2zzZHiVs=;
        b=MJNGgtwe8EmfG8O7EdBoOAPVrXwmkjCNVjeL8NAWqfvknK1kUhAHmfBevOTHDRyrY3
         nMUolmUAelv638N0Bnlhvq/QkMTqWuDFkveArmDtFmQ3beH/rMoR/pYnt6b5NogXwXur
         xFnYPsKdn2xyaTQD8bE1ZohlBXENfl1d+bexmzAXeu3vO+rQ0JpxPJ4mVMuK9rsd/H0C
         kERk5Clz0xhscrZyOcWpu7uMIXNVNL27qXkB5beGEJ23wUm4ILfiPMw9vSmw3rwQtug5
         vvDilrLlF54+D4Bk95285AXj719Idc4rY4oZD35o5b1B+z6xy4OyZ1/+Xs4XWzVBQrGP
         ZNvQ==
X-Gm-Message-State: AOAM533IZuli+B/Xk9PO3w/hnpkHoBqIhmoRB+gSSSBCnqNA05HejGw7
	pduHlA1XW1DvaIZXwrJ0pmU=
X-Google-Smtp-Source: ABdhPJxZN/DeIDJNUUwuiSNODJgnbHTxpvV3PfWSnwgXVI6SQiOKwBWnnh39sFCbuSHHFUy6V/YItg==
X-Received: by 2002:a37:556:: with SMTP id 83mr836597qkf.208.1596138381924;
        Thu, 30 Jul 2020 12:46:21 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id y7sm5601711qta.36.2020.07.30.12.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 12:46:21 -0700 (PDT)
Date: Thu, 30 Jul 2020 15:46:19 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [PATCH 1/3] [meta-virtualization][PATCH] python3-keystoneclient: Change python to python3
Message-ID: <20200730194616.GA28981@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1595897097-20455-2-git-send-email-wangmy@cn.fujitsu.com>
 <1595897097-20455-3-git-send-email-wangmy@cn.fujitsu.com>
 <1595897097-20455-1-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [PATCH 1/3] [meta-virtualization][PATCH] python3-keystoneclient: Change python to python3
on 28/07/2020 Wang Mingyu wrote:

> Version updated to 3.13.1
> 
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../keystone-api-check.sh                     |  0
>  ...t_git.bb => python3-keystoneclient_git.bb} | 40 ++++++++++---------
>  2 files changed, 21 insertions(+), 19 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-keystoneclient => python3-keystoneclient}/keystone-api-check.sh (100%)
>  rename meta-openstack/recipes-devtools/python/{python-keystoneclient_git.bb => python3-keystoneclient_git.bb} (59%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-keystoneclient/keystone-api-check.sh b/meta-openstack/recipes-devtools/python/python3-keystoneclient/keystone-api-check.sh
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python-keystoneclient/keystone-api-check.sh
> rename to meta-openstack/recipes-devtools/python/python3-keystoneclient/keystone-api-check.sh
> diff --git a/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb b/meta-openstack/recipes-devtools/python/python3-keystoneclient_git.bb
> similarity index 59%
> rename from meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
> rename to meta-openstack/recipes-devtools/python/python3-keystoneclient_git.bb
> index c7bfef4..c8fe38a 100644
> --- a/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-keystoneclient_git.bb
> @@ -6,12 +6,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4a4d0e932ffae1c0131528d30d419c55"
>  
>  SRCNAME = "keystoneclient"
>  
> +SRC_URI = "file://keystone-api-check.sh"
> +
>  SRC_URI = "\
> -	git://github.com/openstack/python-keystoneclient.git;branch=stable/pike \
> -	file://keystone-api-check.sh \
> -	"
> +        git://github.com/openstack/python-keystoneclient.git;branch=stable/pike \
> +        file://keystone-api-check.sh \
> +        "
>  
> -PV = "3.13.0+git${SRCPV}"
> +PV = "4.1.0+git${SRCPV}"
>  SRCREV = "7ff05baa1fa56f152173651f16fc6fd181291292"
>  S = "${WORKDIR}/git"
>  
> @@ -20,28 +22,28 @@ inherit setuptools3 monitor
>  FILES_${PN}-doc += "${datadir}/keystoneclient" 
>  
>  DEPENDS += " \
> -        python-pip \
> -        python-pbr \
> +        python3-pip \
> +        python3-pbr \
>          "
>  
>  # Satisfy setup.py 'setup_requires'
>  DEPENDS += " \
> -        python-pbr-native \
> +        python3-pbr-native \
>          "
>  
>  RDEPENDS_${PN} += " \
>          bash \
> -        python-pbr \
> -        python-debtcollector \
> -        python-keystoneauth1 \
> -        python-oslo.config \
> -        python-oslo.i18n \
> -        python-oslo.serialization \
> -        python-oslo.utils \
> -        python-positional \
> -        python-requests \
> -        python-six \
> -        python-stevedore \
> +        python3-pbr \
> +        python3-debtcollector \
> +        python3-keystoneauth1 \
> +        python3-oslo.config \
> +        python3-oslo.i18n \
> +        python3-oslo.serialization \
> +        python3-oslo.utils \
> +        python3-positional \
> +        python3-requests \
> +        python3-six \
> +        python3-stevedore \
>          "
>  
>  do_install_append() {
> @@ -53,7 +55,7 @@ PACKAGES =+ " ${SRCNAME}-tests"
>  FILES_${SRCNAME}-tests = "${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/examples \
>          "
>  RDEPENDS_${SRCNAME}-tests += " \
> -	python-httpretty \
> +	python3-httpretty \
>          bash \
>  	"
>  
> -- 
> 2.17.1
> 
> 
> 

> 


