Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.28311.1598559499208280187
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Aug 2020 13:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X3bsm1LD;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BEA0AE020B5; Thu, 27 Aug 2020 13:18:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,FREEMAIL_FROM,FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  3.9 FSL_HELO_FAKE FSL_HELO_FAKE
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.219.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.5 FAKE_REPLY_C FAKE_REPLY_C
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E74FE020B1
	for <meta-virtualization@yoctoproject.org>; Thu, 27 Aug 2020 13:18:15 -0700 (PDT)
Received: by mail-qv1-f65.google.com with SMTP id x7so3303373qvi.5
        for <meta-virtualization@yoctoproject.org>; Thu, 27 Aug 2020 13:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=N5DMBmRnQ0C2hYT7N9WNJqxY8Lh31lBxztfXZEOMl5E=;
        b=X3bsm1LDBNeFvaKeT3XBh1Kacg4NAFrvgVZkTRDJMG0hy75F/qrpUa7eDQjswXqrAp
         Lor9RzAYITfm+K/nzqMk3XjiTrJ1KRxTg18EjnlvkHfL3do66nueM8OOD8Ld91vTje2z
         BiDFEGPR+lgOuvRBpX5yvWk8Ryc0+BhqggM6ecJgbAB5UN2AhVbJ76jVYJJgD3XaXwZu
         m86APOFES7ahVrQoxZZtNWVldptVRzI3Iwtho8GDlR2ZPyhZ2d4wt6rtwqHFIFXFz1Mq
         QeToIMYcPz7NnUAm9Feib5BHxBMP1KG0YOFn9iICnaQ/Fyq4Uv3rSamkkjYETxJDRD1C
         pF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=N5DMBmRnQ0C2hYT7N9WNJqxY8Lh31lBxztfXZEOMl5E=;
        b=tzYAYF+nMVlpabWGGiYcW4trHmreCir3oAUmDV18iSENthoQNKRrjjbJ575nhHl+fh
         nlnoMa3c7euP18W9+htvNVpamP3jzCmI3UxqfUx7Ca9JTvmdLoP2VwHRMrlDsBQalLWr
         HEAQ56QRgadrG1f6eUzhHY/c00Ijm43IIi8wvvDNj6e628dS+XCZkGWTvtWL41PWinPq
         weYSl14ZghBb5X2U9QAf5jmb3eAlI4WKbp0Ywtntmudqj+1BKg9Oj7sgGWSc04lQBxbq
         x7fCjzjGHGpZDmjUFLB6ht17dN5eRShi3ZVjexqzZJ2F3h3x6fZdPhzuRsaimzlJE11V
         WOkQ==
X-Gm-Message-State: AOAM530VGj2xAb6doZofRC/TmAKMucAkyCeYCAum2pZGKDsrv6+5bGXM
	aNURYR8zOc8FMyTJWr/mZqgvusRQTSIie836
X-Google-Smtp-Source: ABdhPJxz4xZexEnuHGcXexYyVqXMmvuF/DAtrdCzL96G9b0a/ydy/YDgTGDmmnKPlOuC7YTOAzWIVA==
X-Received: by 2002:ad4:5812:: with SMTP id dd18mr20744067qvb.23.1598559494341;
        Thu, 27 Aug 2020 13:18:14 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id p205sm588059qke.2.2020.08.27.13.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 13:18:13 -0700 (PDT)
Date: Thu, 27 Aug 2020 16:18:11 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>,
	zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH v2] python3-xstatic-angular-cookies: Remove python recipe
Message-ID: <20200827201808.GA36539@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1598289935-121746-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1598290061-121886-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1598360914-77104-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1598318988-123302-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1598318998-123340-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I've merged the inline'd parts of this series.

If any of the removals were missed, please resend them, since my
email client threaded some of the v2's strangely and I can't tell
if I got them all.

Bruce

In message: [meta-virtualization] [PATCH v2] python3-xstatic-angular-cookies: Remove python recipe
on 25/08/2020 zhengruoqin wrote:

> Because python is no longer maintained, delete the python2 version of
> the recipe.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../python/python-xstatic-angular-cookies.inc | 22 -----------------
>  .../python-xstatic-angular-cookies_1.2.1.1.bb |  2 --
>  ...python3-xstatic-angular-cookies_1.2.1.1.bb | 24 +++++++++++++++++--
>  3 files changed, 22 insertions(+), 26 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies.inc
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies_1.2.1.1.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies.inc b/meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies.inc
> deleted file mode 100644
> index bc3923b..0000000
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies.inc
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -DESCRIPTION = "Angular-Cookies JavaScript library packaged for setuptools"
> -HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-Cookies"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=70856f1d03d62a3e0c0cb1b7f8c7fd00"
> -
> -PYPI_PACKAGE = "XStatic-Angular-Cookies"
> -
> -SRC_URI[md5sum] = "a67066fac5dfe9774ab163d44e5a896a"
> -SRC_URI[sha256sum] = "c8fc1a52549c601809fc9f25144e4fd346820412b6430e89256e7ec71fce0b4c"
> -
> -inherit pypi
> -
> -# DEPENDS_default: python-pip
> -
> -DEPENDS += " \
> -        ${PYTHON_PN}-pip \
> -        "
> -
> -# RDEPENDS_default: 
> -RDEPENDS_${PN} += " \
> -        "
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies_1.2.1.1.bb b/meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies_1.2.1.1.bb
> deleted file mode 100644
> index ee9591a..0000000
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies_1.2.1.1.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-xstatic-angular-cookies.inc
> -inherit setuptools3
> diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-angular-cookies_1.2.1.1.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-cookies_1.2.1.1.bb
> index ee9591a..001bde9 100644
> --- a/meta-openstack/recipes-devtools/python/python3-xstatic-angular-cookies_1.2.1.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-cookies_1.2.1.1.bb
> @@ -1,2 +1,22 @@
> -require python-xstatic-angular-cookies.inc
> -inherit setuptools3
> +DESCRIPTION = "Angular-Cookies JavaScript library packaged for setuptools"
> +HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-Cookies"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=70856f1d03d62a3e0c0cb1b7f8c7fd00"
> +
> +PYPI_PACKAGE = "XStatic-Angular-Cookies"
> +
> +SRC_URI[md5sum] = "a67066fac5dfe9774ab163d44e5a896a"
> +SRC_URI[sha256sum] = "c8fc1a52549c601809fc9f25144e4fd346820412b6430e89256e7ec71fce0b4c"
> +
> +inherit setuptools3 pypi
> +
> +# DEPENDS_default: python-pip
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pip \
> +        "
> +
> +# RDEPENDS_default: 
> +RDEPENDS_${PN} += " \
> +        "
> -- 
> 2.25.1
> 
> 
> 

> 


