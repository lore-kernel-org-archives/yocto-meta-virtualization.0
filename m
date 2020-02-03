Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.5715.1580767919979923779
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 03 Feb 2020 14:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I+Lg1AcD;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id l19so12753108qtq.8
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 03 Feb 2020 14:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JmFBM0k3ZoNDZoqQGc+tCe8d7T5OksjAH0/gAINkTgU=;
        b=I+Lg1AcD9ymC4+tQ5Ac0O7xUnAlfqKVOTsImzMVAb1Hn/3ImXetMCL4qTHPvdP/0/M
         kxYUhaRfrZO5jHJz+jtnUySWKkAc6SmrQxIEXXLe95L7ksXcp6NUEJNcVArfk9ufZDTK
         wo3LRvAqQ51s/Ns9V+25KdSyn+hicwnfRfuvUEXlkvuypuFWVInqSpLoedyJDxicE3xu
         fzt0vsyoElbyp4jEJQdb4qpL5W+xI9TwTJ2iKERdLHFKQqOFXLyGwe7bLP0LXV7+a1DL
         nZYkmvUzvDPop0f7ZI25gyL/nd+O8+qgahz97mfpJc+xfPsM5jnm8MlCFQnhot1gpTeC
         3ioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JmFBM0k3ZoNDZoqQGc+tCe8d7T5OksjAH0/gAINkTgU=;
        b=X78gzIhXklzG0F3hfiDkwBUfufw/lBfyH3HGyr2tPQdEoJxQF0RPPOcSFBiKXyp4Dk
         a1DuXxpY/4mhZeHgvYlY6faRaCQnYj0XPRw8MTj0lqzyf5WkqMN+jjAGI2RlM2LDYY2k
         nhSAANpRRmQpbscCq81yDrWWvK6be5YJcNpY+JB+C8Ze1rVyfQXZv35rvTnT2UkpS3Uw
         wEKQdIk0t+c2gXD/S4WmP5QSQcqUWCoWPO+bzvy60iof796W5KMx28v1jYYuSKuHBru+
         UYgaW+uYhb1STKY12xeKRMJuyp1+N1/RwPQn9VNnKV4Zv+YsXlHTGtL8YaA2E1V4FLbo
         1C+Q==
X-Gm-Message-State: APjAAAXkZXdWdHfX+zotV1MY3+V4X+MQ3jVUEdNF8jd8Ip3Us3YcC+wU
	51MqAT8BUmAf/wldkUwJfAc=
X-Google-Smtp-Source: APXvYqzEwirJwElnMhrXLBomFJjuBrh9QqR9FaVxgYXwVH4srYgACa6Lo3GHdWdaYOQfrKGzXOhIYQ==
X-Received: by 2002:aed:376a:: with SMTP id i97mr20248792qtb.44.1580767919069;
        Mon, 03 Feb 2020 14:11:59 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id v50sm11162762qtb.20.2020.02.03.14.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 14:11:58 -0800 (PST)
Date: Mon, 3 Feb 2020 17:11:56 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, stefan.agner@toradex.com,
	simon.bueler@toradex.com
Subject: Re: [meta-virtualization][PATCH 1/2] python3-fastentrypoints: add recipe
Message-ID: <20200203221155.GB58444@gmail.com>
References: <1580579240-12882-1-git-send-email-liu.ming50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1580579240-12882-1-git-send-email-liu.ming50@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

both patches are merged.

Bruce


In message: [meta-virtualization][PATCH 1/2] python3-fastentrypoints: add recipe
on 01/02/2020 Ming Liu wrote:

> From: Ming Liu <liu.ming50@gmail.com>
> 
> python3-fastentrypoints is a python module that make entry_points
> specified in setup.py load more quickly.
> 
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  .../python/python3-fastentrypoints_0.12.bb             | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 recipes-devtools/python/python3-fastentrypoints_0.12.bb
> 
> diff --git a/recipes-devtools/python/python3-fastentrypoints_0.12.bb b/recipes-devtools/python/python3-fastentrypoints_0.12.bb
> new file mode 100644
> index 0000000..7bd1651
> --- /dev/null
> +++ b/recipes-devtools/python/python3-fastentrypoints_0.12.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Make entry_points specified in setup.py load more quickly"
> +DESCRIPTION = "Using entry_points in your setup.py makes scripts that start \
> +really slowly because it imports pkg_resources, which is a horrible \
> +thing to do if you want your trivial script to execute more or less \
> +instantly. fastentrypoints aims to fix that bypassing pkg_resources, \
> +making scripts load a lot faster."
> +HOMEPAGE = "https://github.com/ninjaaron/fast-entry_points"
> +SECTION = "devel/python"
> +
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://README.rst;md5=f212a0cb34eb678477972d2011fb365a"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "390ad9a9229164a06156a5b1f0ef1b22"
> +SRC_URI[sha256sum] = "ff284f1469bd65400599807d2c6284d5b251398e6e28811f5f77fd262292410b"
> +
> +BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.7.4
> 

> 

