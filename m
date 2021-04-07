Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web09.480.1617755721397530147
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 17:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=polaL1Q4;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id g24so12581172qts.6
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Apr 2021 17:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bRu+E59ZefETI+jKnsx2ETtnf+Z4UUSVp8iPWlBnk7w=;
        b=polaL1Q4eJb1RnvgogJye6KR5WU/XgrtFgOSBdgi663P7E+gbvSxoMBWknJ31rjqWd
         KWnA1aUuR5ZWpLkwgdKkP+xjsvFOtXj44ej3TmFDAbkVXeej1Y6DA/y4xORq8FrGHKbP
         zAjfgw3lhnQnCxmZreYVJNV7mC7Bvj1LG66L3WzIVPFrX3dPZq4YZf78tJnlqS6OAHeA
         H5RhacxYCTIdKrT/pMJXbg3+1Sa/8OZ3Lj+GreU5FBBZUhBNZlN+HvE3KTZ8+pDPGrqf
         zH7LMld0/NI0q46Mq6Icx8G3p/2zfVZLZ9+un4DBZMjdi7m2/QLhl59nw6kCyBFcfsXT
         3SIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bRu+E59ZefETI+jKnsx2ETtnf+Z4UUSVp8iPWlBnk7w=;
        b=JN0Hsr1Xfm4INI5gfx8uJwEuG/Bxc4+Zi/oXCJmJFio47fKYpfrPp4VsOF6TCFZ4uY
         IwUex6hA7ym4xpx/v9KEkwbtWYaIXwrK8fqzFeyKWVwt73RoNckksbkCHrfb5aoBFrh3
         uQvXAFikArVSYK+yY/9cvfo7mMs880kV+d8U32CZqY9vmvmprKWZ/n4m4hMdNFTFelld
         9C6ilNJTGx6VEGwHC1X22k9+KzRUoDmq4kx5fi0Z3xw7fjdpJ0oKDjV4tkCHiHxywTh5
         7aR76e1BP6ECEMHfbmOVSuLEeBG3afcNN0IYPtXtHyTFcRV1O1J07Mh/DHUbLRUFSzc2
         p6BA==
X-Gm-Message-State: AOAM533j4uk+nJKrd7w38mrdu23A0gQZN70LwsDmWCVW09k6tSMOyy7h
	btpaevaop4MSq8IYExfpsdNTIufW5YQKGw==
X-Google-Smtp-Source: ABdhPJxWXJ0ggzzJ8fmnXpZ+kWJjWPlkOFB5+LA5wd27GRdtsggF4+ZqGAw6flaUyFAF52vfv1dQfQ==
X-Received: by 2002:ac8:4415:: with SMTP id j21mr540950qtn.87.1617755720456;
        Tue, 06 Apr 2021 17:35:20 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id 75sm16896373qkd.114.2021.04.06.17.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 17:35:20 -0700 (PDT)
Date: Tue, 6 Apr 2021 20:35:18 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 1/5] nagios-*: add conditional PNBLACKLIST, because of the dependency on meta-webserver
Message-ID: <20210407003515.GA25009@gmail.com>
References: <20210403195133.1401406-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210403195133.1401406-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

All 5 in the series are now merged

Bruce

In message: [meta-virtualization][PATCH 1/5] nagios-*: add conditional PNBLACKLIST, because of the dependency on meta-webserver
on 03/04/2021 Martin Jansa wrote:

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-extended/nagios/nagios-core_4.4.6.bb    | 2 ++
>  recipes-extended/nagios/nagios-nrpe_4.0.2.bb    | 2 ++
>  recipes-extended/nagios/nagios-nsca_2.9.2.bb    | 2 ++
>  recipes-extended/nagios/nagios-plugins_2.2.1.bb | 2 ++
>  4 files changed, 8 insertions(+)
> 
> diff --git a/recipes-extended/nagios/nagios-core_4.4.6.bb b/recipes-extended/nagios/nagios-core_4.4.6.bb
> index 8bcd6c0..fc3d2c5 100644
> --- a/recipes-extended/nagios/nagios-core_4.4.6.bb
> +++ b/recipes-extended/nagios/nagios-core_4.4.6.bb
> @@ -38,6 +38,8 @@ RDEPENDS_${PN} += "\
>      nagios-base \
>  "
>  
> +PNBLACKLIST[nagios-core] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'webserver', '', 'Depends on apache2 from meta-webserver which is not included', d)}"
> +
>  acpaths = "-I ${S}/autoconf-macros"
>  
>  # Set default password for the hardcoded Nagios admin user "nagiosadmin".
> diff --git a/recipes-extended/nagios/nagios-nrpe_4.0.2.bb b/recipes-extended/nagios/nagios-nrpe_4.0.2.bb
> index d9c7b15..7f81172 100644
> --- a/recipes-extended/nagios/nagios-nrpe_4.0.2.bb
> +++ b/recipes-extended/nagios/nagios-nrpe_4.0.2.bb
> @@ -26,6 +26,8 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
>  
>  inherit autotools-brokensep update-rc.d systemd update-alternatives
>  
> +PNBLACKLIST[nagios-nrpe] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'webserver', '', 'Depends on nagios-core which depends on apache2 from meta-webserver which is not included', d)}"
> +
>  # IP address of server which proxy should connect to
>  MONITORING_PROXY_SERVER_IP ??= "192.168.7.2"
>  
> diff --git a/recipes-extended/nagios/nagios-nsca_2.9.2.bb b/recipes-extended/nagios/nagios-nsca_2.9.2.bb
> index 66f8da5..1fce198 100644
> --- a/recipes-extended/nagios/nagios-nsca_2.9.2.bb
> +++ b/recipes-extended/nagios/nagios-nsca_2.9.2.bb
> @@ -22,6 +22,8 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
>  
>  inherit update-rc.d autotools-brokensep systemd dos2unix
>  
> +PNBLACKLIST[nagios-nsca] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'webserver', '', 'Rdepends on nagios-base provided by nagios-core which depends on apache2 from meta-webserver which is not included', d)}"
> +
>  DEPENDS = "libmcrypt"
>  
>  EXTRA_OECONF += "--with-nsca-user=${NAGIOS_USER} \
> diff --git a/recipes-extended/nagios/nagios-plugins_2.2.1.bb b/recipes-extended/nagios/nagios-plugins_2.2.1.bb
> index 0793365..b97d80c 100644
> --- a/recipes-extended/nagios/nagios-plugins_2.2.1.bb
> +++ b/recipes-extended/nagios/nagios-plugins_2.2.1.bb
> @@ -18,6 +18,8 @@ S = "${WORKDIR}/${BPN}-${PV}"
>  
>  inherit autotools gettext
>  
> +PNBLACKLIST[nagios-plugins] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'webserver', '', 'Depends on nagios-core which depends on apache2 from meta-webserver which is not included', d)}"
> +
>  EXTRA_OECONF += "--with-sysroot=${STAGING_DIR_HOST} \
>                   --with-nagios-user=${NAGIOS_USER} \
>                   --with-nagios-group=${NAGIOS_GROUP} \
> -- 
> 2.30.2
> 

> 
> 
> 

