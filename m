Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.3335.1608588942424729017
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Dec 2020 14:15:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DBL900u8;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 57C3138C156D
	for <meta-virtualization@yoctoproject.org>; Mon, 21 Dec 2020 22:15:41 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id z20so7748869qtq.3
        for <meta-virtualization@yoctoproject.org>; Mon, 21 Dec 2020 14:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=sOmwGuxxN7C5MB1RpwUhFRI21UD2rddElPr+6BQnito=;
        b=DBL900u8vmFjbpjqQFegufRcAKJI2scQC3T+T+Z0YFHO3kqmEjwxseU9vDme80JrmK
         smbL70LllV7zzesoeFx/EBEYqb5qDaAqA9FAVT6mA2h6DoHgdSpuSyjuHNOYawWsE9L9
         5W3jffY/spmyMX+eLSpSrB8IT6HyyOp/S0u1lZceqo5JKi8uXPYXtWO1l3fJeOI47yJ6
         BHNeNjIURqIPA4NPDmsP/Z8eSypP01CbJSXrYXDCupaK8olnTv1vJN/VHdZkno5USyG5
         cxF7pNSKhCZxQStFnP0BxR54emYW758TA5OcmGdwbpzXxPP3vO3OruPqBs3r72oHc6tS
         7CbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sOmwGuxxN7C5MB1RpwUhFRI21UD2rddElPr+6BQnito=;
        b=J+Op2yUidJ5OAu1HnDDkhCRpZKbRcYA0T8+8MvzcMAZ1T2Y3QK5YBkWOPgEOj1rcvu
         SKdii8YxZA9m+9kzTcyY3s+WyAlZA2mm4o3sZfk+Myj/Ktr7Cfd+osOutkYI+VhyVC+b
         4DbXLOMnZzJNzYQ50IM4gpiJz9Koss1gaukK0X/vFvJRsfqnjgssOouXQKqtR+AQr5ZM
         JFlEX8ZbE6aKFdyv0R6FgMjU+C32Atj/LEtKBvVd4Vp6eAkQTL4DC270038b2ltvivGZ
         PXBd9YZ9ENeJuEgEte4PPofJNEyRP+T3CESbdF8ofg8OhZKJblu7H6eOHtHKwLI0X8r2
         upMA==
X-Gm-Message-State: AOAM5320KddSlMJkfG1ZylsHmglHiO3w/lXfxEZW1jbfqPXgIo4T+Y+k
	UdehdQe3xn+ftm/htAXiTcM=
X-Google-Smtp-Source: ABdhPJxd14yXZJdIWzEh1aIzCbxzvyUkouE6qzSu5ybj9/LN7jRy8iV3Kf5cCRcyuBlN+RnEEvG2pA==
X-Received: by 2002:aed:2123:: with SMTP id 32mr19102106qtc.325.1608588940391;
        Mon, 21 Dec 2020 14:15:40 -0800 (PST)
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id 102sm10706008qtg.45.2020.12.21.14.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 14:15:39 -0800 (PST)
Date: Mon, 21 Dec 2020 17:15:38 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python-functools32: Remove recipe
Message-ID: <20201221221535.GA22844@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1608016153-57351-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1608016178-57413-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1608016190-57478-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python-functools32: Remove recipe
on 15/12/2020 zangrc wrote:

> This is a backport of the functools standard library module from Python 3.2.3 for use on Python 2.7 and PyPy. It includes new features lru_cache (Least-recently-used cache decorator).But the current version of python3 is 3.9.0, so remove this recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-functools32_git.bb          | 30 -------------------
>  1 file changed, 30 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-functools32_git.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-functools32_git.bb b/meta-openstack/recipes-devtools/python/python-functools32_git.bb
> deleted file mode 100644
> index 9744b522..00000000
> --- a/meta-openstack/recipes-devtools/python/python-functools32_git.bb
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -SUMMARY = "Python higher-order functions and operations on callable objects"
> -HOMEPAGE = "https://pypi.python.org/pypi/functools32"
> -SECTION = "devel/python"
> -LICENSE = "PSFv2"
> -
> -PV = "3.2.3-2"
> -SRCREV = "ad90fa86e2f4f494a3aedb0571274f3bbc6d7ab5"
> -
> -SRCNAME = "functools32"
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=27cf2345969ed18e6730e90fb0063a10"
> -SRC_URI = "git://github.com/MiCHiLU/python-${SRCNAME}.git"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit distutils3
> -
> -DISTUTILS_INSTALL_ARGS = "--root=${D} \
> -    --prefix=${prefix} \
> -    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
> -    --install-data=${datadir}"
> -
> -DEPENDS += " \
> -	python-pbr \
> -	"
> -
> -RDEPENDS_${PN} += "python-testtools \
> -	python-pbr \
> -	"
> -
> -- 
> 2.25.1
> 
> 
> 

> 
> 
> 


