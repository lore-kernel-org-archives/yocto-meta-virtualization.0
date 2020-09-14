Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.51977.1600050080130105304
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 13 Sep 2020 19:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eWgWHb0R;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id n18so12427959qtw.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 13 Sep 2020 19:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=LZQ0zl6fwc5jhXSF6xk8Nrh1VDoH483XL9TM9K9E+50=;
        b=eWgWHb0R22tUId683H+qe/UjfgcW0w/x0lcx/wT+7kiU75SyMwf5RXXK2GbaDNgARw
         TZ47Muy/eZEip7vte1Rsx3y8ZtMwMiXh+EC4OdCGEdhCsyOfMISE0uEDYo4y//LK7YQV
         9+dKEUSkUCzvqdmDfYdOoSzjjxnHfjIeWR2hBYIOMJh6rvxTvLlnWoGUG6jFJCpT/v3R
         ImXJi+2cFBIfBFzZLZQKm/S1vwmLKlJ4Vt7pSJkQQN02xS0ZR3sJEXPXmrVn4ithy40F
         RhTR+HCU96klgfBagp3fD/8tEk6aJMgaHNQ24vlsIp5P/uDrLMhJgia7Mn1/ft5GjX/U
         UM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LZQ0zl6fwc5jhXSF6xk8Nrh1VDoH483XL9TM9K9E+50=;
        b=SBo4cqdNmvlK78vtW+G9qWoxH8/pJPgzcazW7o4MTIq0pxGikPMtQZv1gDh3XdiVAA
         msTRO2TB4m/7mwAyI/pNPNLdz5+yJNXM7swhLjWeyiU3wDgOXK89eJDFrsEa3DT/Z88u
         l+bBVlJcnpHwaX+23oVoj1xAmD09m0id2sNGp6y5Evv+8UpoUB2bY6qinWae2yYM1MNQ
         XD7bInE5ISNOYxz6XNIU1e4tawEdHzF/RQSFj20N73tOi6ujVM8EiwxXIElDd8ZSr6aY
         vMMoAZRRsF8KbRc/teT7tIwm36TFVvYfrjECApFFzl7+DTVhsY4vv9ZEZqIfnIwuvjV3
         xIbQ==
X-Gm-Message-State: AOAM530vkIm3xymLIqS0/jZiHZgoveSNrxGcljA0hENA3/pbCLtj+dHM
	nJyuWmaZN0hBLXKX5R3fAsk=
X-Google-Smtp-Source: ABdhPJzyC1HGIc+O4H5YtQ348pXJaMUIM+REvkqq+WJKSJTG+ja6k5cab0X40bgny0xlVrdJIM1uug==
X-Received: by 2002:ac8:47d3:: with SMTP id d19mr11547193qtr.263.1600050079254;
        Sun, 13 Sep 2020 19:21:19 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id e23sm12274739qkl.67.2020.09.13.19.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 19:21:18 -0700 (PDT)
Date: Sun, 13 Sep 2020 22:21:16 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Ben Gampe <bengampe@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [m-c-s][PATCH] python3-distro: include as RDEPEND for salt-master
Message-ID: <20200914022115.GA5940@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200909011231.14564-1-bengampe@gmail.com>
 <20200909010801.13579-1-bengampe@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks for the two variants of the patch.

Merged to master and dunfell.

Bruce

In message: [meta-virtualization] [m-c-s][PATCH] python3-distro: include as RDEPEND for salt-master
on 09/09/2020 Ben Gampe wrote:

> Required for salt-key with python version > 3.7
> ---
>  meta-openstack/recipes-support/salt/salt_3001.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-openstack/recipes-support/salt/salt_3001.bb b/meta-openstack/recipes-support/salt/salt_3001.bb
> index 4beef5ba..04ef1c7c 100644
> --- a/meta-openstack/recipes-support/salt/salt_3001.bb
> +++ b/meta-openstack/recipes-support/salt/salt_3001.bb
> @@ -127,7 +127,7 @@ FILES_${PN}-api = "${bindir}/${PN}-api ${CONFFILES_${PN}-api} ${systemd_system_u
>  
>  SUMMARY_${PN}-master = "remote manager to administer servers via salt"
>  DESCRIPTION_${PN}-master ="${DESCRIPTION_COMMON} This particular package provides the salt controller."
> -RDEPENDS_${PN}-master = "${PN}-common (= ${EXTENDPKGV}) python3-msgpack"
> +RDEPENDS_${PN}-master = "${PN}-common (= ${EXTENDPKGV}) python3-msgpack python3-distro"
>  RDEPENDS_${PN}-master += "${@bb.utils.contains('PACKAGECONFIG', 'zeromq', 'python3-pycrypto python3-pyzmq (>= 13.1.0)', '',d)}"
>  RDEPENDS_${PN}-master += "${@bb.utils.contains('PACKAGECONFIG', 'tcp', 'python3-pycrypto', '',d)}"
>  CONFFILES_${PN}-master="${sysconfdir}/init.d/${PN}-master  ${sysconfdir}/${PN}/master"
> -- 
> 2.25.1
> 

> 


