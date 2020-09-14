Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.52772.1600050287109197887
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 13 Sep 2020 19:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d3TUa15G;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	by mail.yoctoproject.org (Postfix) with ESMTPS id E496F38C1192
	for <meta-virtualization@yoctoproject.org>; Sun, 13 Sep 2020 19:24:46 -0700 (PDT)
Received: by mail-qk1-f193.google.com with SMTP id v123so15524776qkd.9
        for <meta-virtualization@yoctoproject.org>; Sun, 13 Sep 2020 19:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=PQ7PprY7luYU4aCBRQH2L4VgCyUILsIQLEDuZ8Etix4=;
        b=d3TUa15GSNVdH9dn8b5ProQR2ZAlGHkcAjyc2y2kFmGEZIZ+mtipb/+qWg4KWLQZx/
         YPilgpK55IMVNWigZW5SuJ8t8PnjAiXhJqEH+SF78QG5vnWYZykCaWBzMoZyOWgDJUxE
         7AqiVWsJg6UtyG+eXvp0c4hCogX5dWgbe+JmS8khQmK+MZzJl4+31TJdsqsG8gFKOqSP
         yCZk32QZEVVmIN20WRf4WQkDNNjzcFkZyjyb4kOC7Nr8dYojsY98h+g3EcwexX2fSw5q
         M9nGMNPvf36Lm2eRtuZs6DUHSsCrhlTdkdSqiPLX2x0tZ553xwp/C7/GBMG5KHLiae2Y
         WkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PQ7PprY7luYU4aCBRQH2L4VgCyUILsIQLEDuZ8Etix4=;
        b=Kq76GTxEdnTGTzTGY2Vu/KiQMqlx4hEoLivLpEADjua/68hK7E46y8Onyyx75y3I6m
         VmDeF/acB2LVOGZ4XDtAp3hMg0Tu/zbPCnbMxx7izbOeXmf5FCQcnDAKsdkIu0278fIZ
         QdHVVQhVrkKnNiZSHq8kAL0UFdbDjkowpQ23cVw9qh9okkSVhK6Bv+r/TDu+S3zJRiiv
         /BsOTPsGeh2aVrSqYO8cYq+ZW9TflgpuuXkWB5/MinujPclXzUoEKV/ai2i2tFoSOw/E
         ViOHCnNT/7OgFCh/CTmfx21D54lfVF3XXl+Bo25K9tziwoGjdxrv7zrLE6VsitWnc0Cb
         guuw==
X-Gm-Message-State: AOAM5331XapbNJRufGJq4fF+HwyZbZUEl4aqc9C9aPIZY7I4G+VDAMcF
	S1CIW4ILyhRPsm9YRU67oeEMNMw85p1DzCSo
X-Google-Smtp-Source: ABdhPJyINrIlkec0Iqh0rNfkyoAI7TaOmgo8yuBdNdssgaXpXFd+Ggg6dQyyva8AZtMq4TjFxVPJFA==
X-Received: by 2002:a05:620a:218b:: with SMTP id g11mr10713200qka.494.1600050285961;
        Sun, 13 Sep 2020 19:24:45 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id z74sm13366527qkb.11.2020.09.13.19.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 19:24:45 -0700 (PDT)
Date: Sun, 13 Sep 2020 22:24:43 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-xstatic-angular-schema: Remove python2 recipe
Message-ID: <20200914022442.GC5940@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1599532933-124300-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1599532944-124344-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1599532952-124380-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1599532979-124418-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1599532994-124479-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-xstatic-angular-schema: Remove python2 recipe
on 08/09/2020 zhengruoqin wrote:

> Since python2 is no longer maintained, the recipe of python2 is removed.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../python-xstatic-angular-schema-form.inc    | 22 -----------------
>  ...on-xstatic-angular-schema-form_0.8.13.0.bb |  2 --
>  ...n3-xstatic-angular-schema-form_0.8.13.0.bb | 24 +++++++++++++++++--
>  3 files changed, 22 insertions(+), 26 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form.inc
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form_0.8.13.0.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form.inc b/meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form.inc
> deleted file mode 100644
> index 7bfa957..0000000
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form.inc
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -DESCRIPTION = "Angular Schema Form packaged for setuptools (easy_install) / pip."
> -HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-Schema-Form"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0e4430cb0dfdb98d3008c66d8339f31a"
> -
> -PYPI_PACKAGE = "XStatic-Angular-Schema-Form"
> -
> -SRC_URI[md5sum] = "d0faab81c36f4cfc03e092fedc30018d"
> -SRC_URI[sha256sum] = "7c08634901751267fe26d266fc027cf6ed2e5f422696985cec750594b3f4e300"
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
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form_0.8.13.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form_0.8.13.0.bb
> deleted file mode 100644
> index eae97b2..0000000
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-schema-form_0.8.13.0.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-xstatic-angular-schema-form.inc
> -inherit setuptools3
> diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-angular-schema-form_0.8.13.0.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-schema-form_0.8.13.0.bb
> index eae97b2..aa49f61 100644
> --- a/meta-openstack/recipes-devtools/python/python3-xstatic-angular-schema-form_0.8.13.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-xstatic-angular-schema-form_0.8.13.0.bb
> @@ -1,2 +1,22 @@
> -require python-xstatic-angular-schema-form.inc
> -inherit setuptools3
> +DESCRIPTION = "Angular Schema Form packaged for setuptools (easy_install) / pip."
> +HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-Schema-Form"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0e4430cb0dfdb98d3008c66d8339f31a"
> +
> +PYPI_PACKAGE = "XStatic-Angular-Schema-Form"
> +
> +SRC_URI[md5sum] = "d0faab81c36f4cfc03e092fedc30018d"
> +SRC_URI[sha256sum] = "7c08634901751267fe26d266fc027cf6ed2e5f422696985cec750594b3f4e300"
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


