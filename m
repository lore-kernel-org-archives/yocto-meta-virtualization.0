Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.467.1595610819693400758
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 Jul 2020 10:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HgIbM6Ka;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id b14so7575479qkn.4
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Jul 2020 10:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=lm/mTh9KdGC1Hlx6rNukyzn+X2v3ZKQPnI4zYAvtcTs=;
        b=HgIbM6Ka+MsB7j9pzJcbipU8GpTh8hQKMqM61oZOGmh++y1JxOd8SDWlQKn7Lp2Hpn
         8A8vpdS8wFV55XpaZMVoTt8uguR/cWVZpQPmWDR0VEuBQm29w9zmhk2V+4IvXKTh7ilR
         jfd2WC3nqgaxTqk3g3EAJTlglluVIUoqEHi3MICzPReto6A5+xFMOFOj8V6easX2Rlqg
         +nFNFzaSyJsbt8zMR6ARqWDrxC2o0atjYMqWE7TmneEIDseuQqfANOQcSo+sFyfWRDRI
         VLUsYHaQyWblcmsZQrJdiMPG7lD6hCCdgV33PlNCPK8mwOycffD65eWy/IuW4yaP9QQZ
         w5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lm/mTh9KdGC1Hlx6rNukyzn+X2v3ZKQPnI4zYAvtcTs=;
        b=VdqFKxre6k1ciZhcwzNdj/iCRsqX0B9UbnjuLZ12WLdi1fzWqxiiQvnccUWb5dTcyW
         B/PmX398DTcjYJILzkxKutUu1TV7KVqQxjGzJEiZpS5VXDm0m2DyKtNkaw+zNDDWYbd8
         U2ygR7cc8BjQVhCB+cG3kmId/SaFoSCLm73VseOQu336aKmvtO5kTeEAJ9U4eJT3we37
         neojxfy5yvdh9M1g3tl8OjFUO23D7z21B68lzYA4wQs2St5aK8XvcdhAcOb6jVp2TPPE
         jf7yzF/RiONPX2P2XZz9jd4dktjHTGMmjlVuLbf75n2s6SBMkgaAtX4iGHiqhsJU52qi
         fl0A==
X-Gm-Message-State: AOAM531JhFlTInEjTqmbcEcz5EbmINTmYlrbRD9my0ELk4vMzjDFQ7/g
	cw7EIUIMUywvTTg8f3bcxOk=
X-Google-Smtp-Source: ABdhPJy0Ugrx2OFJq86hV4gHYyBxBfyjH55Ye/PQFyNlD1ok+GwsywQyB+cVRe84q+kI325Wpf86UQ==
X-Received: by 2002:a05:620a:2442:: with SMTP id h2mr11887898qkn.108.1595610818472;
        Fri, 24 Jul 2020 10:13:38 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id m4sm2079903qtf.43.2020.07.24.10.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 10:13:37 -0700 (PDT)
Date: Fri, 24 Jul 2020 13:13:34 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 6/6] python3-oslo.middleware: Change python to python3
Message-ID: <20200724171331.GA30636@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1595311098-1934-3-git-send-email-wangmy@cn.fujitsu.com>
 <1595311098-1934-2-git-send-email-wangmy@cn.fujitsu.com>
 <1595311098-1934-5-git-send-email-wangmy@cn.fujitsu.com>
 <1595311098-1934-4-git-send-email-wangmy@cn.fujitsu.com>
 <1595311098-1934-1-git-send-email-wangmy@cn.fujitsu.com>
 <1595311284-1985-1-git-send-email-wangmy@cn.fujitsu.com>
 <1595311292-2022-1-git-send-email-wangmy@cn.fujitsu.com>
 <1595311300-2059-1-git-send-email-wangmy@cn.fujitsu.com>
 <1595311307-2096-1-git-send-email-wangmy@cn.fujitsu.com>
 <1595311315-2133-1-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks for the updates .. getting rid of the remaining python2 is a priority
and this helps a lot.

Cheers,

Bruce


In message: [meta-virtualization][PATCH 6/6] python3-oslo.middleware: Change python to python3
on 21/07/2020 Wang Mingyu wrote:

> Version updated to : 4.1.0
> 
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../python/python-oslo.middleware_git.bb      | 42 ------------------
>  .../python/python3-oslo.middleware_git.bb     | 43 +++++++++++++++++++
>  2 files changed, 43 insertions(+), 42 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-oslo.middleware_git.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-oslo.middleware_git.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-oslo.middleware_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.middleware_git.bb
> deleted file mode 100644
> index b5a6835..0000000
> --- a/meta-openstack/recipes-devtools/python/python-oslo.middleware_git.bb
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -DESCRIPTION = "Oslo Middleware library"
> -HOMEPAGE = "http://launchpad.net/oslo"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
> -
> -PV = "3.30.1+git${SRCPV}"
> -SRCREV = "d9ad4bae1e0d6c43a009d393ac94f7ff50116171"
> -
> -SRCNAME = "oslo.middleware"
> -SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit setuptools3
> -
> -# DEPENDS_default: python-pip
> -
> -DEPENDS += " \
> -        python-pip \
> -        python-pbr \
> -        "
> -# Satisfy setup.py 'setup_requires'
> -DEPENDS += " \
> -        python-pbr-native \
> -        "
> -
> -
> -# RDEPENDS_default: 
> -RDEPENDS_${PN} += " \
> -        python-pbr \
> -        python-jinja2 \
> -        python-oslo.config \
> -        python-oslo.context \
> -        python-oslo.i18n \
> -        python-oslo.utils \
> -        python-six \
> -        python-stevedore \
> -        python-webob \
> -        python-debtcollector \
> -        python-statsd \
> -        "
> diff --git a/meta-openstack/recipes-devtools/python/python3-oslo.middleware_git.bb b/meta-openstack/recipes-devtools/python/python3-oslo.middleware_git.bb
> new file mode 100644
> index 0000000..a481818
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-oslo.middleware_git.bb
> @@ -0,0 +1,43 @@
> +DESCRIPTION = "Oslo Middleware library"
> +HOMEPAGE = "http://launchpad.net/oslo"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
> +
> +PV = "4.1.0+git${SRCPV}"
> +SRCREV = "7355d905bc0e6b7d8884e290cc26895eed0f7179"
> +
> +SRCNAME = "oslo.middleware"
> +SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit setuptools3
> +
> +# DEPENDS_default: python3-pip
> +
> +DEPENDS += " \
> +        python3-pip \
> +        python3-pbr \
> +        "
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python3-pbr-native \
> +        "
> +
> +
> +# RDEPENDS_default: 
> +RDEPENDS_${PN} += " \
> +        python3-pbr \
> +        python3-jinja2 \
> +        python3-oslo.config \
> +        python3-oslo.context \
> +        python3-oslo.i18n \
> +        python3-oslo.utils \
> +        python3-six \
> +        python3-stevedore \
> +        python3-webob \
> +        python3-debtcollector \
> +        python3-statsd \
> +        python3-monotonic \
> +        "
> -- 
> 2.25.1
> 
> 
> 

> 


