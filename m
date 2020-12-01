Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.468.1606858266152475238
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Dec 2020 13:31:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UYXf8fuI;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
	by mail.yoctoproject.org (Postfix) with ESMTPS id CDCB238C1107
	for <meta-virtualization@yoctoproject.org>; Tue,  1 Dec 2020 21:31:05 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id z9so184124qtn.4
        for <meta-virtualization@yoctoproject.org>; Tue, 01 Dec 2020 13:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=Yczw1zsJVgSnd2Bpk2XW5GQ1s/vHbg6taEGODbHxORY=;
        b=UYXf8fuICEV9x6c0JPfn0JaIFGhE8pxt5sXYClzK8/vhg26NsmRRdNWAi9ov9tufqM
         DI18F81z5MncH4OzW/cxlp9kg2dt5L/cr1pKhiVT0Qz/mZ9TmPkgDYm/Dt6Yp/NW+Okg
         NX2Uc8/uHHOaTU4uT1YWUBA0k1M9CnIlwz6HFqb2HVDz25Qx1x9T0ra+qUAhO5z/ALJT
         ITXclVGOZiolq1sb1TbRWtjSRo2VmCSiAzBZxuM8cdoXfJLVMRppNrZOTh6zAjr2QZlU
         DhFqw3cmW3Fqpmcrbc7/vZXPhKahpW41DFyhAMM7X/63zSmKDRbyO+onam/oYGSZ4/0B
         6UlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Yczw1zsJVgSnd2Bpk2XW5GQ1s/vHbg6taEGODbHxORY=;
        b=rRfRjmifgP5tkRL8tp5Abc/GCthdhSuIIVSzGBrnqyweHsDBQoAfpJqCH0crdtSUtz
         XeHNdd3oVxYd339WZ6QBNBgp2reX6KuKeZVn1zU45O0waNN1IKH6dD84+jth0zCZuEg1
         pQBKn/fzTFrAB9njzq6m2ZlRuvxNTN/11OXBdIM7GdYDELL8zTfdwk42LifprGtGHjTh
         TSWnSwi/df/2pFl1ox/dbKFdpHyglwldPJc96iRkQtKotpiSq49lf5/n/UWOlBvivcMe
         OQvLHAeOqFTkX4i7PSrr+nQAr1T56o8gP69KjCMtKhQeoknNgJZWWfeIwWp5a8wfU1yF
         QVbg==
X-Gm-Message-State: AOAM533xBzrqMKV9WnSyzfKmMzUlFeyc3blNihVfF7ehmq5GWDDlNrj+
	iIPWr5ZjClogM8nyObSgZJ4=
X-Google-Smtp-Source: ABdhPJzodz/DPg8lhXbFiZEOoUD9Of28x4QQvIY5yRRlJ271tsVz7sO2im87s0LGYQ3JqP2UZMfCMQ==
X-Received: by 2002:aed:2b47:: with SMTP id p65mr4963527qtd.337.1606858264867;
        Tue, 01 Dec 2020 13:31:04 -0800 (PST)
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id 189sm928112qkn.125.2020.12.01.13.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 13:31:04 -0800 (PST)
Date: Tue, 1 Dec 2020 16:31:02 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python-enum: Remove recipe
Message-ID: <20201201213101.GB1140@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1606142444-3585-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1606142513-3634-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1606142527-3679-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1606142536-3715-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1606142563-3752-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1606142569-3789-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1606142583-3826-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1606142588-3870-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python-enum: Remove recipe
on 23/11/2020 zhengruoqin wrote:

> Superseded by Python standard library.
> 
> Python 3 now has in its standard library an enum implementation (also available for older Python versions as the third-party enum34 distribution) that supersedes this library.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../python/python-enum_0.4.4.bb               | 20 -------------------
>  1 file changed, 20 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-enum_0.4.4.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-enum_0.4.4.bb b/meta-openstack/recipes-devtools/python/python-enum_0.4.4.bb
> deleted file mode 100644
> index 4eb1ed5a..00000000
> --- a/meta-openstack/recipes-devtools/python/python-enum_0.4.4.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -SUMMARY = "Robust enumerated type support in Python"
> -DESCRIPTION = "This package provides a module for robust enumerations in Python."
> -HOMEPAGE = "https://pypi.python.org/pypi/enum"
> -SECTION = "devel/python"
> -LICENSE = "GPLv2 | PSFv2"
> -LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=4325afd396febcb659c36b49533135d4 \
> -                    file://LICENSE.PSF;md5=1ad8a43fc3bbfea1585223c99f4c3e6f \
> -"
> -
> -SRC_URI[md5sum] = "ce75c7c3c86741175a84456cc5bd531e"
> -SRC_URI[sha256sum] = "9bdfacf543baf2350df7613eb37f598a802f346985ca0dc1548be6494140fdff"
> -
> -inherit setuptools3 pypi
> -
> -DEPENDS += " \
> -        python-pip \
> -"
> -
> -RDEPENDS_${PN} += " \
> -"
> -- 
> 2.25.1
> 
> 
> 

> 
> 
> 


