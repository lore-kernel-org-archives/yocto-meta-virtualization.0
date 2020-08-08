Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.3384.1596852649747846655
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 19:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RpnVU2Vr;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 378CAE01FB0; Fri,  7 Aug 2020 19:10:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	URIBL_RED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.219.68 listed in list.dnswl.org]
	*  0.0 URIBL_RED Contains an URL listed in the URIBL redlist
	*      [URIs: yoctoproject.org]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.5 FAKE_REPLY_C FAKE_REPLY_C
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4C5CEE01FAE
	for <meta-virtualization@yoctoproject.org>; Fri,  7 Aug 2020 19:10:47 -0700 (PDT)
Received: by mail-qv1-f68.google.com with SMTP id x6so1656059qvr.8
        for <meta-virtualization@yoctoproject.org>; Fri, 07 Aug 2020 19:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=n4eM4FLLWnGicON6HBfnRMTWwOR3iLiMPmJSTwG0vE4=;
        b=RpnVU2Vrp9wEDbcwgP3ejPOjx1KxxUoZ9twXPRz2qwSLtKbG6YrLbKUF5HHDv1eB53
         t5/S4CJT787Z1+RnNRKxUgN0wVWShDeOMSSV3P3bv8mYpeao2PVAEp7CYq+mSpl14xnv
         +K01fmclQ2OKxt0HdGt8H1ZtgLlgCBLi84mmnzdK5uNbZQr/WOA7h+WsHSIe+BVPhpe1
         adKUfEwUItPONHw3EVP0rEJqUMHMROcH71DZJoNAqXz8RQQuJXT4hMF5LJoXmjbMxE7G
         DJMBwAYzmSmpaTe3I0sEAr7VTcQlp2jxfcqXV0pbeiP6wwJanCgvNxrbgPQah74+Uyxl
         pcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=n4eM4FLLWnGicON6HBfnRMTWwOR3iLiMPmJSTwG0vE4=;
        b=FwtRybbXNHp7fFH4eHoHN3OeY+KxC68Cu5I41s0c7J2N4MaRlTA6WCPlEe2EfHQiQi
         T+58BLAGRiEWkf2S047ctlHySIIj3UCsRYYWnrGLUnw4pa7O6RYXwz87A+urcaksNOnl
         9a6KH+N/Q/r/4u7IzZshDoSQxpBrpETr00C2iyK2M8oHxlEff0a0MY6xJQSngy4pQDau
         5H8SZcNeoU9x5rcvz68sEuAIK0Uor0FQTZKhm1DEzVzX69XeKjhn8ZScNf5SBI5WQitD
         PnmbX+irDHIAJGZk5RQrjutzY1nNliVJe6v8TIdjJuCUhnh8OtWIc36ocecEc/EqtmGH
         0z4Q==
X-Gm-Message-State: AOAM532rrPGhQgfpfXHy04MbgTILGvivThoDqAgX2/j2CwwhdO2Byv+z
	FoIawSlPQiie4cpjlerucrI=
X-Google-Smtp-Source: ABdhPJyYJWzowCWdVV/d1xwK4UHwkMgXgsPw+smycwwqW34IfoBPpDi4ZyZStaOVALKt2kaFocUu4A==
X-Received: by 2002:a0c:fb11:: with SMTP id c17mr16936695qvp.113.1596852646273;
        Fri, 07 Aug 2020 19:10:46 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id h55sm9977470qte.16.2020.08.07.19.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 19:10:45 -0700 (PDT)
Date: Fri, 7 Aug 2020 22:10:43 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-os-traits: change to python3
Message-ID: <20200808021040.GA1371@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1596552033-78898-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1596552033-78898-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1596552033-78898-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1596552033-78898-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Merged!

Bruce



In message: [meta-virtualization] [PATCH] python3-os-traits: change to python3
on 04/08/2020 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-os-traits_git.bb            | 29 -------------------
>  .../python/python3-os-traits_2.4.0.bb         | 22 ++++++++++++++
>  2 files changed, 22 insertions(+), 29 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-os-traits_git.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-os-traits_2.4.0.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-os-traits_git.bb b/meta-openstack/recipes-devtools/python/python-os-traits_git.bb
> deleted file mode 100644
> index 70b7b69..0000000
> --- a/meta-openstack/recipes-devtools/python/python-os-traits_git.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -DESCRIPTION = "OpenStack library containing standardized trait strings."
> -HOMEPAGE = "https://github.com/openstack/os-traits"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
> -
> -SRC_URI = "\
> -	git://github.com/openstack/os-traits.git;branch=stable/pike \
> -	"
> -
> -PV = "0.3.3+git${SRCPV}"
> -SRCREV = "3e8b4a77aaf2d8b64f89ba3b479113d0b44bbe2f"
> -S = "${WORKDIR}/git"
> -
> -inherit setuptools3
> -
> -DEPENDS += " \
> -        python-pbr \
> -        "
> -
> -# Satisfy setup.py 'setup_requires'
> -DEPENDS += " \
> -        python-pbr-native \
> -	"
> -
> -RDEPENDS_${PN} += " \
> -        python-pbr \
> -        python-six \
> -	"
> diff --git a/meta-openstack/recipes-devtools/python/python3-os-traits_2.4.0.bb b/meta-openstack/recipes-devtools/python/python3-os-traits_2.4.0.bb
> new file mode 100644
> index 0000000..72bd1b2
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-os-traits_2.4.0.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "OpenStack library containing standardized trait strings."
> +HOMEPAGE = "https://github.com/openstack/os-traits"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
> +
> +SRC_URI[sha256sum] = "af1df9485a3119c2a6647639c8bb8bb852cb839ad9c12fa1d9e72f402c66af49"
> +
> +inherit setuptools3 pypi
> +
> +DEPENDS += " \
> +        python3-pbr \
> +        "
> +
> +DEPENDS += " \
> +        python3-pbr-native \
> +	"
> +
> +RDEPENDS_${PN} += " \
> +        python3-pbr \
> +        python3-six \
> +	"
> -- 
> 2.25.1
> 
> 
> 

> 


