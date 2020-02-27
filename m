Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.1590.1582842016078425672
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Feb 2020 14:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bK0CXdrb;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id l14so408915qvu.12
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Feb 2020 14:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=A0Jhi83TfquYxc8eWMpzk9E1Gx3q6hepAflh1zKj97g=;
        b=bK0CXdrbz63/KI5gwhI80rSwTpfu/wGMZA4NEsjbHsLbWjuVPwW/CP0IH0GVF6EvAt
         wcJlJXSJIyC4ytMavv5+0g0iukLc2FyTvvXdDLKf6c6GtPGru+BX+iEuJujDc5gaOpyF
         LpaYyJJhIWMHWOatq6490rwIIOqg7f2B8esz4HOnCoQUb9nVioneIYWFOZLmc2PwSBJ+
         cuqhTbGPdDDIg5tzM31E86n8KVccCVZ63M4NfPnRr/H9pmNOlHkOvGNIBPNE4Zlh1gSn
         SuihEIkj7iJDRcOrifSN5m7RTcKBQEQbjv5UXzSJHPJVj6li9BF2k7NiT3LmtnGTmdQF
         q8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=A0Jhi83TfquYxc8eWMpzk9E1Gx3q6hepAflh1zKj97g=;
        b=idM1SQbYEe76NQlmynGo/KQxCVkPoyEGxESrqYp0bhXcZgjB6yr7IDT1aRikUnhlSe
         i8vuLFEqSgtK3idX9P2EXZeXJgcs/2CaEnLYnVgB9qWNiEOIzh3ZRLki51CIvAIG/hcf
         +yMPBImH+HfhdfM1fb6e24dTN0MkIORetk+35mFx6vcJxP0Wx7hjCxLU15vilQkkNL+N
         tzVr8W9fIJ8NpYSE48gktW3LlU/9JJNno83uZc9hUguFvPd94JZeKrvV5k00k1rNBtGI
         d0lse1hTJ8mb69rW1JQhPvTXxeNc0dBAgN+ZBSfSnVuZT46bfPIft2ccRk5Ossqwbp50
         uYgA==
X-Gm-Message-State: APjAAAW2AjKAA/fjNyQaRjXauwEZ9uQz2ugACEHE6bwL3kTPcJLowIdk
	NoRyRftLpvmiNJ/O/4EA6CY=
X-Google-Smtp-Source: APXvYqw0hJQcKH7reT1LOeK2F201OEkSrwxg1hH2WfQhldjYLSg8/gqKWgY6PJ3Fkn1AgtB4uAgy2Q==
X-Received: by 2002:ad4:580e:: with SMTP id dd14mr1266717qvb.84.1582842014997;
        Thu, 27 Feb 2020 14:20:14 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE98dac44fc29f-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.255.134])
        by smtp.gmail.com with ESMTPSA id u13sm3820884qtg.64.2020.02.27.14.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 14:20:14 -0800 (PST)
Date: Thu, 27 Feb 2020 17:20:12 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Nathan Hartman <nathan.hartman@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Nathan Hartman <hnathan918@gmail.com>
Subject: Re: [meta-virtualization][m-c-s][PATCH 1/3] tox: Add python3 version
Message-ID: <20200227222012.GB38669@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200213194816.31473-2-nathan.hartman@windriver.com>
 <20200213194816.31473-3-nathan.hartman@windriver.com>
 <20200213194816.31473-1-nathan.hartman@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Thanks Nathan,

These are now merged.

Bruce

In message: [meta-virtualization][m-c-s][PATCH 1/3] tox: Add python3 version
on 13/02/2020 Nathan Hartman wrote:

> From: Nathan Hartman <hnathan918@gmail.com>
> 
> Signed-off-by: Nathan Hartman <nathan.hartman@windriver.com>
> ---
>  .../{python-tox_1.9.2.bb => python-tox.inc}     | 17 +++++++----------
>  .../python/python3-tox_3.14.3.bb                |  5 +++++
>  2 files changed, 12 insertions(+), 10 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-tox_1.9.2.bb => python-tox.inc} (56%)
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-tox_3.14.3.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-tox_1.9.2.bb b/meta-openstack/recipes-devtools/python/python-tox.inc
> similarity index 56%
> rename from meta-openstack/recipes-devtools/python/python-tox_1.9.2.bb
> rename to meta-openstack/recipes-devtools/python/python-tox.inc
> index 8184fb5..66b1355 100644
> --- a/meta-openstack/recipes-devtools/python/python-tox_1.9.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-tox.inc
> @@ -2,21 +2,18 @@ DESCRIPTION = "virtualenv-based automation of test activities"
>  HOMEPAGE = "http://tox.testrun.org"
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=2d0fc2c2c954dc4d41043e67d4a8d8e7"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f24505dfbdd8c22c61de6383f2e74bf9"
>  
> -SRC_URI[md5sum] = "f4db4d6a82d6a651e457ba55ef370258"
> -SRC_URI[sha256sum] = "3125a15da7381f59f835a25bd259a84acb7a69858c81e386c50027bd842bb91b"
> -
> -inherit setuptools3 pypi
> +inherit pypi
>  
>  DEPENDS += " \
> -        python-pip \
> +        ${PYTHON_PN}-pip \
>          "
>  
>  RDEPENDS_${PN} += " \
> -        python-virtualenv \
> -        python-py \
> -        python-pytest \
> +        ${PYTHON_PN}-virtualenv \
> +        ${PYTHON_PN}-py \
> +        ${PYTHON_PN}-pytest \
>          "
>  
>  do_install_append() {
> @@ -24,7 +21,7 @@ do_install_append() {
>      install -d ${D}/${sysconfdir}/${SRCNAME}
>      cp ${S}/tox.ini    ${D}/${sysconfdir}/${SRCNAME}
>      cp ${S}/setup.py   ${D}/${sysconfdir}/${SRCNAME}
> -    cp ${S}/README.rst ${D}/${sysconfdir}/${SRCNAME}
> +    cp ${S}/README.md ${D}/${sysconfdir}/${SRCNAME}
>  
>      ln -s ${PYTHON_SITEPACKAGES_DIR}/tox ${D}/${sysconfdir}/${SRCNAME}/tox
>  }
> diff --git a/meta-openstack/recipes-devtools/python/python3-tox_3.14.3.bb b/meta-openstack/recipes-devtools/python/python3-tox_3.14.3.bb
> new file mode 100644
> index 0000000..678413a
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-tox_3.14.3.bb
> @@ -0,0 +1,5 @@
> +inherit setuptools3
> +require python-tox.inc
> +
> +SRC_URI[md5sum] = "8b695d482786dd51643e10953bbd8c89"
> +SRC_URI[sha256sum] = "06ba73b149bf838d5cd25dc30c2dd2671ae5b2757cf98e5c41a35fe449f131b3"
> -- 
> 2.20.1
> 

> 


