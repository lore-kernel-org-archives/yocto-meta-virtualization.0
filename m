Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web11.3140.1596138421973573799
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 12:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JiC6yEPV;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id m9so13101467qvx.5
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Jul 2020 12:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fgt/7m48KYFIVkuZFXnEP05U9hKK0KEI20KBRH/fuE0=;
        b=JiC6yEPV3J1MhDItzLu8UqXUvpsZxgSBjyVscuRme1tBSOKcTzNUUnx8CP8bRx+hGG
         qZjfkR5XuLAVaPGcw+dvTGi7rkGKZaLYXOSAh7gnv9PrCMgQTML+0PRol5ZEpxnQ3Q+B
         iFVcXlwO5c+83KFvv6zEdyDJzoDGXYgesM/gT6GlOtATJxpJBtH//LdCD7S4SE/E8EOj
         onLw3nQVpvoINvfsqNfvdIqOQ9fRKY6n3dIC2Jh0xVzqaxCmzpH0cZ0Ufo5XpNHinVBl
         uBqdGt/rjPNDeuh+jb77+EYspaItS7XRYm1D0z8tvCsgg5lmVggVystHjZQ8A6h5JDgD
         7G8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fgt/7m48KYFIVkuZFXnEP05U9hKK0KEI20KBRH/fuE0=;
        b=L8KwEeqomHUEPcDO6HpuI0w/deKfb803Q4QRGkWeRQwaTHu4UwJX4RHvAgJ4tDvUba
         k97Remn+BOimn6KMS6rOzr1lGEMVnMqz8iBkUT8KtVAehXuz1yEvZgq73/NHkwiytwwE
         KFSAMeA2P7w8J6hQIxrRxTSg8d6MXV7X5szpYmqaOnHRi3LIvROIr/UDUkJ81AYy+a/6
         IVLG5Ka1dAjnwc6nrijiZ6IXctDPL+DzDuY6SdaoaNcWyNBmTzKUqhpWA3FgsNFizY9K
         gIgUebnX/p7dW/8vXpJaus2yhVpLHKAJ75nzdoelK4N1gfd1RsTBy0QmPcwFTidzzSzT
         3LGg==
X-Gm-Message-State: AOAM5310252jOr5WFhu2y2wxnAFr5CaCq37X+yDc9IInQkwurZ4E32tf
	EMqziG0b44rPU4B0z/F1e8tuPGPIpeYxiw==
X-Google-Smtp-Source: ABdhPJy5ZVz375peISrvtcNiYKZuuG3h75JaGbGZgup8Jz/a1DBW3fwBBUuwqWLMKBv8/iCQViz5Yg==
X-Received: by 2002:a0c:9e4f:: with SMTP id z15mr733990qve.119.1596138420871;
        Thu, 30 Jul 2020 12:47:00 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id w32sm3814301qtw.66.2020.07.30.12.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 12:47:00 -0700 (PDT)
Date: Thu, 30 Jul 2020 15:46:58 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] python3-oslo.vmware: Change python to python3
Message-ID: <20200730194658.GB28981@gmail.com>
References: <1595897107-20492-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1595897107-20492-1-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH] python3-oslo.vmware: Change python to python3
on 28/07/2020 Wang Mingyu wrote:

> Version updated to 3.4.0
> 
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../python/python-oslo.vmware_git.bb          | 41 -------------------
>  .../python/python3-oslo.vmware_git.bb         | 41 +++++++++++++++++++
>  2 files changed, 41 insertions(+), 41 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-oslo.vmware_git.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-oslo.vmware_git.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-oslo.vmware_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.vmware_git.bb
> deleted file mode 100644
> index 07345e7..0000000
> --- a/meta-openstack/recipes-devtools/python/python-oslo.vmware_git.bb
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -DESCRIPTION = "oslo.vmware library"
> -HOMEPAGE = "http://launchpad.net/oslo"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
> -
> -PV = "2.23.0+git${SRCPV}"
> -SRCREV = "95a30dfa24d259fe16f0fd43eb1b67b9f3fc0397"
> -
> -SRCNAME = "oslo.vmware"
> -SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit setuptools3
> -
> -DEPENDS += " \
> -        python-pip \
> -        python-pbr \
> -        "
> -
> -# Satisfy setup.py 'setup_requires'
> -DEPENDS += " \
> -        python-pbr-native \
> -        "
> -
> -RDEPENDS_${PN} += " \
> -        python-pbr \
> -        python-stevedore \
> -        python-netaddr \
> -        python-six \
> -        python-oslo.i18n \
> -        python-oslo.utils \
> -        python-oslo.concurrency \
> -        python-pyyaml \
> -        python-lxml \
> -        python-suds-jurko \
> -        python-eventlet \
> -        python-requests \
> -        python-urllib3 \
> -        "
> diff --git a/meta-openstack/recipes-devtools/python/python3-oslo.vmware_git.bb b/meta-openstack/recipes-devtools/python/python3-oslo.vmware_git.bb
> new file mode 100644
> index 0000000..99fd8a9
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-oslo.vmware_git.bb
> @@ -0,0 +1,41 @@
> +DESCRIPTION = "oslo.vmware library"
> +HOMEPAGE = "http://launchpad.net/oslo"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
> +
> +PV = "3.4.0+git${SRCPV}"
> +SRCREV = "32c8d43a20cb6a29f03324fbc2e6cad3bfb5a294"
> +
> +SRCNAME = "oslo.vmware"
> +SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit setuptools3
> +
> +DEPENDS += " \
> +        python3-pip \
> +        python3-pbr \
> +        "
> +
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python3-pbr-native \
> +        "
> +
> +RDEPENDS_${PN} += " \
> +        python3-pbr \
> +        python3-stevedore \
> +        python3-netaddr \
> +        python3-six \
> +        python3-oslo.i18n \
> +        python3-oslo.utils \
> +        python3-oslo.concurrency \
> +        python3-pyyaml \
> +        python3-lxml \
> +        python3-suds-jurko \
> +        python3-eventlet \
> +        python3-requests \
> +        python3-urllib3 \
> +        "
> -- 
> 2.25.1
> 
> 
> 

> 

