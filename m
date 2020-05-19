Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web12.337.1589923147848715160
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 May 2020 14:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SF8gNHi9;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id ee19so337570qvb.11
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 19 May 2020 14:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+n8CgSl7EhaDUePnVTNE7BqNDkGaCuAsLO97FyJxvRE=;
        b=SF8gNHi9vprO3xT17OSIj+ksWg0+/6vayu/m2byqCV392awhlLcITeses2jVhFdvf7
         Ci+0jW4QQWpj3aGSO9WEdcBkAb8KVq3piwGxyHmHgZXsppBQWvC8QzBJKPEwl71FMQSZ
         9cAoMJOtn8z+HOcrtsIQ95OgOrmOon6nHscAnSiTv8bB3ZIJ0S62ylNPChBbGYzKGARo
         t/oNEP5VS8Wl3qM1OgJtYVdOGttVlhqSXIVHTNOmdj+cX/sQy7uVG1F/mMTEu3Pk+Ufs
         XZ6Jn+F0dBxabdPgkaj1By23XwAugs91H0a0yxT9XYkh+lwbPcFRmKhBsSFngfj1bJxV
         7ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+n8CgSl7EhaDUePnVTNE7BqNDkGaCuAsLO97FyJxvRE=;
        b=qFiOYOoHdx/hpqTugKMvr61acd26Mqz3h0goQU9tPP2S5e2MhUTfq6X9xWJGv0wUeA
         7SeQ5iY8RpRr1vzuaYSJECiU6Mrls4ezpfCYHCwN9ii+nicKByRs136qWbBeopQB8Tg+
         trj+9CCdHaOZx1+caeYIJ7xAb5JBIWqSDYhyJBSkIcT9AAO6/bapdzh9/l8LGvRivB2G
         EQBGnshO/YM8gzlsCV0n+IO7D+T7M8/O/4vtZwTJbZido7L3EeKztXcrALxL3DsMK4QD
         ymFPkBjpqLxWtQR7Y2T5WSL/IgINGvVOL9DC6o2+t9psQm2piydhJkAHhQ7apV7W0zvO
         tKiA==
X-Gm-Message-State: AOAM530kR1wF+CXEYuG2/w6IZga8r1MwCWHbAlx6Jx0i4pIymQZtBMHW
	WlMtCSSZZ5G5HryH8LN8PWs=
X-Google-Smtp-Source: ABdhPJxagxUVAanE3C7wp+I67Qsf1trFtvzVS4F+LrVRdqtAI3BvuHDge5puXiVUmpHGWIp2kMuHHg==
X-Received: by 2002:a05:6214:42f:: with SMTP id a15mr1679637qvy.170.1589923146922;
        Tue, 19 May 2020 14:19:06 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id f198sm637830qke.46.2020.05.19.14.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 14:19:05 -0700 (PDT)
Date: Tue, 19 May 2020 17:19:03 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-fastentrypoints: add the missing rdepends
Message-ID: <20200519211900.GA22460@gmail.com>
References: <20200518020554.30534-1-mingli.yu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200518020554.30534-1-mingli.yu@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization] [PATCH] python3-fastentrypoints: add the missing rdepends
on 18/05/2020 Yu, Mingli wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Add the missing rdepends to fix below error:
>  # python3
>  [snip]
>  >>> import fastentrypoints
>  [snip]
>  ModuleNotFoundError: No module named 'pickle'
> ---
>  recipes-devtools/python/python3-fastentrypoints_0.12.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-devtools/python/python3-fastentrypoints_0.12.bb b/recipes-devtools/python/python3-fastentrypoints_0.12.bb
> index a96bd15..53bed18 100644
> --- a/recipes-devtools/python/python3-fastentrypoints_0.12.bb
> +++ b/recipes-devtools/python/python3-fastentrypoints_0.12.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://README.rst;md5=f212a0cb34eb678477972d2011fb365a"
>  
>  inherit pypi setuptools3
>  
> -RDEPENDS_${PN} += "${PYTHON_PN}-setuptools"
> +RDEPENDS_${PN} += "${PYTHON_PN}-setuptools ${PYTHON_PN}-pickle"
>  
>  SRC_URI[md5sum] = "390ad9a9229164a06156a5b1f0ef1b22"
>  SRC_URI[sha256sum] = "ff284f1469bd65400599807d2c6284d5b251398e6e28811f5f77fd262292410b"
> -- 
> 2.24.1
> 

> 

