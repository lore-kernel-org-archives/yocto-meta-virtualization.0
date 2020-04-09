Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.2381.1586401870355726912
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 20:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mNxro1Xw;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id l25so2652042qkk.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Apr 2020 20:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PJ7nhUnGEjKkjdkEdQg9o3fA03ZV0oOnK5s4Z8xbWeA=;
        b=mNxro1Xw17XMry+EiT5bJRzaVk+mzo8Ease/WAHuMUTPle14NkuH3eLk1yKP59YMTF
         KXeoXnuQ4WBOZYyVWNMgZ+Y03qYLmDbWf+1hpx+MGNIssnHKl5iee6kcathNZbVwMxGR
         QeCsb3S/A7HKPm3jHrLFOil1uTKtxY2UjYOp1bDHOYlxiUokpkYN0QtGDdTYKFfqD2Ig
         0Q/MIr3r8rLb1UnGU+MaCjIgYJdhMY8jtWaHF4a78lcAW9d5yPL39sFf0Dq+pLTMrsgX
         K6HYbLDPA+NnGslwfYpSva1rzku66FKjCvG2MOmoUBnwpnNiE1ocMUCbSj1AiH5R5R7H
         i7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PJ7nhUnGEjKkjdkEdQg9o3fA03ZV0oOnK5s4Z8xbWeA=;
        b=OonFTcgXI4wWqdNq+0S0bkszSddkqwey7ud719cUGW4O3nQJj3tXiOdoLFOX3BBGUa
         WcOMCTD+C9eemXaiyVcJ45aF+A6LqrrmWXNuNho2QwRI39QM3ql7Y3XNXYsv6i7gt/N5
         tr9riiDmKrrm9vjiJ+SRqCzk8c6WV5tWaVyMl2t9aSfo/pWU3DJk5bwcTyh1P1jRAEe6
         I5+cgWx1M13DZUzxUoalHu1E+jaVCZFWvpExiZa3zNhUHE6rnrNXg4CqQlJmo4SvyKYR
         r0Aaw31dcR42N3lwAymq/8IYQUpBXQuR5w74WBGUqDC4GWO71LkUukLaIxT1GefQ9cKH
         Vw2w==
X-Gm-Message-State: AGi0PuYEzGvstrhDNm2YggO80F5v/oCha6fdh9qjbWSc1HJKLfpdC3N7
	4URrr6LssDb4XjJvtVV0PX+ARlvBzM+qgQ==
X-Google-Smtp-Source: APiQypJ1wuTrazp/qXonD47rxPl+BuWMvduzRR/A003wrR+0DQx3s01YgWrvW8r7iIaV4TjQFBze9g==
X-Received: by 2002:a05:620a:1362:: with SMTP id d2mr10081176qkl.221.1586401869447;
        Wed, 08 Apr 2020 20:11:09 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id l189sm8125620qkd.112.2020.04.08.20.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 20:11:08 -0700 (PDT)
Date: Wed, 8 Apr 2020 23:11:07 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [meta-openstack][PATCH] python3-debtcollector: add six and wrapt to RDEPENDS
Message-ID: <20200409031103.GA9508@gmail.com>
References: <20200408162137.2657013-1-trevor.gamblin@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200408162137.2657013-1-trevor.gamblin@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [meta-openstack][PATCH] python3-debtcollector: add six and wrapt to RDEPENDS
on 08/04/2020 Trevor Gamblin wrote:

> Add python3-wrapt and python3-six to RDEPENDS as
> debtcollector requires them for some functionality,
> e.g.:
> 
> |root@qemux86-64:~# python3
> |Python 3.7.6 (default, Apr  6 2020, 18:11:01)
> |[GCC 9.2.0] on linux
> |Type "help", "copyright", "credits" or "license" for more information.
> |>>> from debtcollector import removals
> |Traceback (most recent call last):
> |  File "<stdin>", line 1, in <module>
> |  File "/usr/lib64/python3.7/site-packages/debtcollector/removals.py", line 19, in <module>
> |    import wrapt
> |ModuleNotFoundError: No module named 'wrapt'
> |>>>
> 
> python3-six isn't needed for the python3 version of debtcollector,
> but add it to the RDEPENDS for consistency in backports of this patch
> (as python2 does require it).
> 
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  meta-openstack/recipes-devtools/python/python-debtcollector.inc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-debtcollector.inc b/meta-openstack/recipes-devtools/python/python-debtcollector.inc
> index d519bfd..d6d18e3 100644
> --- a/meta-openstack/recipes-devtools/python/python-debtcollector.inc
> +++ b/meta-openstack/recipes-devtools/python/python-debtcollector.inc
> @@ -22,4 +22,6 @@ DEPENDS += " \
>  # RDEPENDS_default:
>  RDEPENDS_${PN} += " \
>          ${PYTHON_PN}-pbr \
> +        ${PYTHON_PN}-wrapt \
> +        ${PYTHON_PN}-six \
>          "
> -- 
> 2.25.1
> 

> 

