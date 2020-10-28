Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.3480.1603855748272529971
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 20:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pGUbD39s;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 1271B38C1433
	for <meta-virtualization@yoctoproject.org>; Tue, 27 Oct 2020 20:29:08 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id i7so2679239qti.6
        for <meta-virtualization@yoctoproject.org>; Tue, 27 Oct 2020 20:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=Q9rG9RY1QtYOVQ7iwSFBHR9DCwQIQFaP0k5U1+EeGHg=;
        b=pGUbD39spfIDj8AouNYotVvq0dHCEYLTaF+BUbWdwaN2X2WsLibo9dw8sg48Pmwxqx
         frLXz/L95ljd5aGqFouh2UuINVrrqTkZfd5r028mGXpyTtARRtqKlqTObvGv7xYHjoSS
         tI5TscGMqLz6axf85c8ACHoXxd8r9tW++NnaFrqIBH7H0hi8fpBog5oloUvmmrAZLDFp
         ddvMDOZu7fTRRhiffX7sFs1Jdit4MJtorNH2iKgW3KfcOH3HlZHt0k6HN06V9BGw0Zjq
         JY1bCMrVz/VIf2XsNWfQrbA6FCgKGaIj83OCZhBHveE2duvw+/BpUW739adKNDjz0EpK
         +5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Q9rG9RY1QtYOVQ7iwSFBHR9DCwQIQFaP0k5U1+EeGHg=;
        b=J5Bx/pCo/FEpFjPjDgAXNGHWWZuEqQR72Luv7eSMOuuLWm2QZyKgeKNqnbDDrB0zR2
         +Ze534bGAwRSfOjqtWG07YdGJYyLk0zVOPCwbecOjOgYG1u1svT721QJOHH9L81/4l2u
         UrmOnLBZbsTeetOoIEaqzQKjGeJO/HNExPqiZHZni2ZCJAAGhL2o79x+ZfXvcOaH2F9U
         Njlvo0wIKx6FOhrQYSmUKYBtcGa5LgOdEDiGuiv5ZyZWa8VwI5vdLzNQcle1fpRAdIJF
         m3vljbs4zrnY1PBPrw+s5kLpUq/p+Toj44wIwqYIKf1g74xe1h68IWC6nHzvu/yvxWWZ
         C5rA==
X-Gm-Message-State: AOAM530vkaAwdEI+RiHQKDb1Aa/I939F27SngPJjqp7WZly95yP/CdAy
	jSLVj3O5gFW/RQ3W3yNXIrg=
X-Google-Smtp-Source: ABdhPJxLyLtWwyfUDZLH7Y1rAhClIe0ugHxxxLVGvDYoWE9O2liHD9CAMQo3nR/xmYIGTMezbDXiGg==
X-Received: by 2002:ac8:588d:: with SMTP id t13mr5340323qta.380.1603855746874;
        Tue, 27 Oct 2020 20:29:06 -0700 (PDT)
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id p77sm2109564qke.39.2020.10.27.20.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 20:29:06 -0700 (PDT)
Date: Tue, 27 Oct 2020 23:29:04 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-statsd: Consolidate in a single file
Message-ID: <20201028032903.GD46280@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1603176682-40793-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1603176694-40858-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1603176706-40928-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1603176714-40980-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1603176719-41027-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged!

Bruce

In message: [meta-virtualization] [PATCH] python3-statsd: Consolidate in a single file
on 20/10/2020 zangrc wrote:

> Consolidate inc and bb files into a single bb file.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-statsd.inc     | 13 -------------
>  .../python/python3-statsd_3.3.0.bb                | 15 +++++++++++++--
>  2 files changed, 13 insertions(+), 15 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-statsd.inc
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-statsd.inc b/meta-openstack/recipes-devtools/python/python-statsd.inc
> deleted file mode 100644
> index 33257b9..0000000
> --- a/meta-openstack/recipes-devtools/python/python-statsd.inc
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -DESCRIPTION = "A simple statsd client."
> -HOMEPAGE = "https://github.com/jsocol/pystatsd"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=4d8aa8ac1dc54b8aee4054bd5e5c61bd"
> -
> -inherit pypi
> -
> -SRC_URI[md5sum] = "b397ccf880f37cf099e775907ebf7a46"
> -SRC_URI[sha256sum] = "e3e6db4c246f7c59003e51c9720a51a7f39a396541cb9b147ff4b14d15b5dd1f"
> -
> -RDEPENDS_${PN} += " \
> -        "
> diff --git a/meta-openstack/recipes-devtools/python/python3-statsd_3.3.0.bb b/meta-openstack/recipes-devtools/python/python3-statsd_3.3.0.bb
> index 3e430a1..0c0cc6a 100644
> --- a/meta-openstack/recipes-devtools/python/python3-statsd_3.3.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-statsd_3.3.0.bb
> @@ -1,2 +1,13 @@
> -inherit setuptools3
> -require python-statsd.inc
> +DESCRIPTION = "A simple statsd client."
> +HOMEPAGE = "https://github.com/jsocol/pystatsd"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4d8aa8ac1dc54b8aee4054bd5e5c61bd"
> +
> +inherit setuptools3 pypi
> +
> +SRC_URI[md5sum] = "b397ccf880f37cf099e775907ebf7a46"
> +SRC_URI[sha256sum] = "e3e6db4c246f7c59003e51c9720a51a7f39a396541cb9b147ff4b14d15b5dd1f"
> +
> +RDEPENDS_${PN} += " \
> +        "
> -- 
> 2.25.1
> 
> 
> 

> 
> 
> 


