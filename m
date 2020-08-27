Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.28320.1598559538721230364
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Aug 2020 13:18:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J3JI2wYi;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 92050E020B5; Thu, 27 Aug 2020 13:18:58 -0700 (PDT)
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
	*      [209.85.160.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.5 FAKE_REPLY_C FAKE_REPLY_C
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 880A2E020B1
	for <meta-virtualization@yoctoproject.org>; Thu, 27 Aug 2020 13:18:57 -0700 (PDT)
Received: by mail-qt1-f196.google.com with SMTP id u2so1221585qtf.11
        for <meta-virtualization@yoctoproject.org>; Thu, 27 Aug 2020 13:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=cmW7Mlri/WS9WdCuvBrIyjl817uO+TEbmLXLy0B0wYI=;
        b=J3JI2wYibCFhEpN/ngPOtyRc7oSoSEwK3hdKcAMj0+SB3THcFxHhSLmFRO2f3VqkzA
         yjiy4uPS3jmYWAwdBKHOqQV9mmq2QWf5wzSEVp+gX++FQN2gPsKYX8HlU7rKJsxP9XfU
         NizENAz7tq1tfhvRJhmWSKqMU39/2LNyDJxterwKHLr3gI3XQK7wgclOdUMQEfTAK2mt
         S92rRT/Y/sHn/Lpj2uIlR3iCZSmZTcgbrwzIHj1QSvoxR8P0BXLhDWiKbKjBuSBhWTNO
         y+bycZ5a4j6URVYcOsKajOIXqBGBg8K9mD6qiigDmsqu720u+8qU8WK5kvALXZsK2elx
         zZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cmW7Mlri/WS9WdCuvBrIyjl817uO+TEbmLXLy0B0wYI=;
        b=sEFEkvJvJTQ8u0cW3/4TkuIJJmpUy4uUcIkgK1jmsGFvPFo4hE3p660c2S/HD6xvHx
         Z2arKrNH+c7Bch6eoZI3zOgTFOTv+RUsVfm764eOITub85RzCWmFjMe6qThru6nrKUAt
         5vPbGnB6qW4vvQBPCAfrrXOi5ev0zCkq5x/vN07SkR4eBriRAmLolbBvvIfH9qLW35D9
         yl/TQJhN3irg9K1eYSgS3ord8iAf+KonHhxclD0BjABm3HYm8hFl2oii9f+4KaMn/+EI
         odEAWsKU3LE1avXcffJh4apA1zX4ZAXsLHDEOBjNTyUuG83DHpl2KZcx3wQET/neLmjJ
         huEA==
X-Gm-Message-State: AOAM5311WCLf6G3p+6e1Gjj0et5Xviita58mwPT+eX/5jpRjojJzIpvh
	sQt+34jcygBTLHIhyPvGMkROA58YXZYZ+BnT
X-Google-Smtp-Source: ABdhPJwYel0uuPcNrB0F84G/SWq78u9FZQqniElKKzvQd5wiW+AYrvd0iFT0Dr4QYDtINdW2lEWkxw==
X-Received: by 2002:ac8:6c49:: with SMTP id z9mr21311637qtu.110.1598559536561;
        Thu, 27 Aug 2020 13:18:56 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id i10sm2736111qkh.15.2020.08.27.13.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 13:18:55 -0700 (PDT)
Date: Thu, 27 Aug 2020 16:18:53 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-xstatic-bootstrap-scss: upgrade 3.3.7.1 -> 3.4.1.0
Message-ID: <20200827201850.GA36671@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1598299693-63275-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1598299693-63275-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1598299693-63275-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-xstatic-bootstrap-scss: upgrade 3.3.7.1 -> 3.4.1.0
on 25/08/2020 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-xstatic-bootstrap-scss_3.3.7.1.bb         | 2 --
>  .../python/python3-xstatic-bootstrap-scss_3.3.7.1.bb        | 2 --
>  ...p-scss.inc => python3-xstatic-bootstrap-scss_3.4.1.0.bb} | 6 +++---
>  3 files changed, 3 insertions(+), 7 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-scss_3.3.7.1.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python3-xstatic-bootstrap-scss_3.3.7.1.bb
>  rename meta-openstack/recipes-devtools/python/{python-xstatic-bootstrap-scss.inc => python3-xstatic-bootstrap-scss_3.4.1.0.bb} (68%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-scss_3.3.7.1.bb b/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-scss_3.3.7.1.bb
> deleted file mode 100644
> index 20eab88..0000000
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-scss_3.3.7.1.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-xstatic-bootstrap-scss.inc
> -inherit setuptools3
> diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-bootstrap-scss_3.3.7.1.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-bootstrap-scss_3.3.7.1.bb
> deleted file mode 100644
> index 20eab88..0000000
> --- a/meta-openstack/recipes-devtools/python/python3-xstatic-bootstrap-scss_3.3.7.1.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-xstatic-bootstrap-scss.inc
> -inherit setuptools3
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-scss.inc b/meta-openstack/recipes-devtools/python/python3-xstatic-bootstrap-scss_3.4.1.0.bb
> similarity index 68%
> rename from meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-scss.inc
> rename to meta-openstack/recipes-devtools/python/python3-xstatic-bootstrap-scss_3.4.1.0.bb
> index 2987919..3102979 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-scss.inc
> +++ b/meta-openstack/recipes-devtools/python/python3-xstatic-bootstrap-scss_3.4.1.0.bb
> @@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
>  
>  PYPI_PACKAGE = "XStatic-Bootstrap-SCSS"
>  
> -SRC_URI[md5sum] = "cc0d26647d10e1de84ba6649d3264f77"
> -SRC_URI[sha256sum] = "4d388df037293163bf3242e0b60c79d06e1f743af8b0be8473f92676340e5acd"
> +SRC_URI[md5sum] = "01b41f33c6c57d1a5d59f41ce360bdd0"
> +SRC_URI[sha256sum] = "5cb56f0090cb6489d643730de57c68d8a6714f2b9fe526ac89bb68f5d77dfe10"
>  
> -inherit pypi
> +inherit setuptools3 pypi
>  
>  # DEPENDS_default: python-pip
>  
> -- 
> 2.25.1
> 
> 
> 

> 


