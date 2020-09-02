Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.10005.1599268823851613274
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Sep 2020 18:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oWuS+q2u;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	by mail.yoctoproject.org (Postfix) with ESMTPS id A7DD138C0035
	for <meta-virtualization@yoctoproject.org>; Fri,  4 Sep 2020 18:20:23 -0700 (PDT)
Received: by mail-qk1-f194.google.com with SMTP id n133so8181780qkn.11
        for <meta-virtualization@yoctoproject.org>; Fri, 04 Sep 2020 18:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=0QjR+tamchdw+cdg3Hg+6tWZYElVz6G5oIGtILvm2Mk=;
        b=oWuS+q2uE0ejjYFiFUQhTFcpWlnbpyS5thUO5xZ7zbw2NWXtHLkkW6kqdci1q1dd53
         giOiL0v+c0M5aCbgT+s0Vpr1AwZXtl2QNAKPJJpnlTQmc/lH0W7rW5RvWbwkaSOk+EYi
         ltqjmUu8yDudYC+YY248KHotcvboNsXwQR+TqYSBPDuMN2aZlz9Mcclsj9hnizEAK6zI
         2amsdwXb27Q0zGgXRL14XSXk4lqrXe9qS4fnHh0nQUFO1TQIqeZphvBAvoe71/819nHi
         NyHlmoIJkqB/G7WybtYhhLXz/FOWdFg61X6u/GRxt3f8rjtOo4FqahJYwj4pujmxwQN2
         fjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0QjR+tamchdw+cdg3Hg+6tWZYElVz6G5oIGtILvm2Mk=;
        b=RYfk7aX8ezyUtoRDHr0kXjJ2j9vQii6pgQaKj9/LgwlI/E1njrRKLN3/fY5nE8rUd6
         qNUcCzuU89FI7sfibAWpmgQ7QUkTKia8nXH0WEm+CkY6ENIUnKu2G+m03v0uuXvwGsQ0
         xLFwoA2rmh21gtFIODTiRi6h+3c5IZOAhVP/Canmw7Njdjcq1xRl5huATBurDOgSaHk5
         tUO4hUY9feeUAJ5tHh0pNJlQF4LeZYLJ//kT5vbPnKorMjAqR10G+u3X4T6Yo3aqKbG9
         7a0bAXl2KG2f1KqDx69+tCMxoqMNqtzif28bo2/zmo9vIKeyXngQzW/LxPECEao3eQ46
         xmFQ==
X-Gm-Message-State: AOAM530ys4gXgH0K6gBk9rbn5HxnDKOtot4vdb/c/l5WdhkpCHsV6fiD
	xeFfiPfXFkIzmuZENw1hROOMqELSsdj8QA==
X-Google-Smtp-Source: ABdhPJzrpSuorVnSaljtPwqd0A6+vC2YFFsDufLgcKkd0J7l/jWQTltS0WBqQGVqOiLFhQcp7IjehQ==
X-Received: by 2002:aed:26a7:: with SMTP id q36mr26170qtd.57.1599078896017;
        Wed, 02 Sep 2020 13:34:56 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id l64sm598354qkc.21.2020.09.02.13.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 13:34:55 -0700 (PDT)
Date: Wed, 2 Sep 2020 16:34:53 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python-enum-compat: Remove python2 recipe
Message-ID: <20200902203452.GD18324@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1598928363-124309-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1598928405-124353-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1598928420-124391-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1598928430-124427-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1598928464-124474-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1598928479-124512-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


merged.

Bruce

In message: [meta-virtualization] [PATCH] python-enum-compat: Remove python2 recipe
on 01/09/2020 zhengruoqin wrote:

> Since python2 is no longer maintained, the recipe of python2 is removed.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-enum-compat.inc   | 10 ----------
>  .../python/python-enum-compat_0.0.3.bb               |  2 --
>  .../python/python3-enum-compat_0.0.3.bb              | 12 ++++++++++--
>  3 files changed, 10 insertions(+), 14 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-enum-compat.inc
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-enum-compat_0.0.3.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-enum-compat.inc b/meta-openstack/recipes-devtools/python/python-enum-compat.inc
> deleted file mode 100644
> index 9fa8c52..0000000
> --- a/meta-openstack/recipes-devtools/python/python-enum-compat.inc
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -DESCRIPTION = "Python enum/enum34 compatibility package"
> -HOMEPAGE = "https://github.com/jstasiak/enum-compat"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> -
> -SRC_URI[md5sum] = "74c19a80356825e5351aba8c4c1b00e6"
> -SRC_URI[sha256sum] = "3677daabed56a6f724451d585662253d8fb4e5569845aafa8bb0da36b1a8751e"
> -
> -inherit pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-enum-compat_0.0.3.bb b/meta-openstack/recipes-devtools/python/python-enum-compat_0.0.3.bb
> deleted file mode 100644
> index a9bff30..0000000
> --- a/meta-openstack/recipes-devtools/python/python-enum-compat_0.0.3.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit setuptools3
> -require python-enum-compat.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.3.bb b/meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.3.bb
> index a9bff30..a1c0ef6 100644
> --- a/meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.3.bb
> @@ -1,2 +1,10 @@
> -inherit setuptools3
> -require python-enum-compat.inc
> +DESCRIPTION = "Python enum/enum34 compatibility package"
> +HOMEPAGE = "https://github.com/jstasiak/enum-compat"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +SRC_URI[md5sum] = "74c19a80356825e5351aba8c4c1b00e6"
> +SRC_URI[sha256sum] = "3677daabed56a6f724451d585662253d8fb4e5569845aafa8bb0da36b1a8751e"
> +
> +inherit setuptools3 pypi
> -- 
> 2.25.1
> 
> 
> 

> 


