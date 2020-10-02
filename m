Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.3988.1601608250154948535
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Oct 2020 20:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n5/USmaK;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	by mail.yoctoproject.org (Postfix) with ESMTPS id E817638C07FA
	for <meta-virtualization@yoctoproject.org>; Thu,  1 Oct 2020 20:10:49 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id f11so103124qvw.3
        for <meta-virtualization@yoctoproject.org>; Thu, 01 Oct 2020 20:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=RybTd64hVQ4CxgN10xxJFLt9DEOIzSRtyhElnDfPLA8=;
        b=n5/USmaK63nHZr5ES7xwBeJa5sdeQAHQywmk6bwegTRQ31Ucv79K4u/EkaVbaslSgw
         NeV8GLRmCEKHBX7hsiFsNf0fjbt9btTqfW4odnhdaMoVY9wCuu/Zv0WyUOKow1mElBUn
         Mtwvme/G3+bx7duvLrat9DZ0OwSSr7doxprwfD+gKpqhOQjgvxqGwLiqhMcPDyX2oj13
         1bN9QmRmYhCu7iWTu93lHLurZfwnNRzKyPCmqQMhH4pV7OTt5Yh9MJVKnXDs5HsMbENG
         5YSPnKywVPlDK3p2xGTYdmxt7VYcxzW7MzH4E5HWzOJmCA+WGTeClY8LslrXwd+iQDDb
         1VEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RybTd64hVQ4CxgN10xxJFLt9DEOIzSRtyhElnDfPLA8=;
        b=TPNZpJxiPJ3dZkj6o9MsltG8i2XdNM7p1Gxq7AbtaH+2k6QQ+MC2x8Dj01dLBeBTm8
         iST4PltRoG7htZMY225aZ9gvedoHOQcfzsAQlQHO02jloZ7EF6lRpn3b7AICZOA8RYv/
         Crpa60Co7L/ogH32kcymgD9B/QYaAjrfFIWiP5eCCYD+2rEBuDMJuKreVvofPuA5jR3g
         BZlFkSBIv2TyLQXrlWHahqyvGy99OKH8kRj12+k/1ZyYr9LvY6N3mkYbQrzWPwxSgnxv
         eCwII9I9ixJ14cp6xRyS8vcVEIfusC+ppfd4888jf8+8u/L4KJ1vyhkyk7r2H1XT7RkC
         rP3g==
X-Gm-Message-State: AOAM530G3c7rqhn+Njo/kWm9TjWKsWU+kQHuqZoF339lfYx9zXyxxRl/
	c8s3SgxoCz4fbNcAr50hcs0RRrBs5ZWjLmB3
X-Google-Smtp-Source: ABdhPJyaWYZh/LJPZQ0Ym+w3LlSmbVdhA26EMBwjFrxB7LIx1OR/QHsHKoieCun57sKU/OhOzeZG1A==
X-Received: by 2002:a05:6214:292:: with SMTP id l18mr248554qvv.3.1601608248733;
        Thu, 01 Oct 2020 20:10:48 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id r48sm167531qtb.26.2020.10.01.20.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 20:10:48 -0700 (PDT)
Date: Thu, 1 Oct 2020 23:10:46 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-ovs: upgrade 2.7.2 -> 2.13.0
Message-ID: <20201002031043.GA53106@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1601391499-4953-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1601391487-4886-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1601391475-4834-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1601391514-5000-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1601391525-5062-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1601391542-5125-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1601391549-5177-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1601391559-5262-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-ovs: upgrade 2.7.2 -> 2.13.0
on 29/09/2020 zangrc wrote:

> Consolidate inc and bb files into a single bb file.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-ovs.inc => python3-ovs_2.13.0.bb}        | 6 +++---
>  meta-openstack/recipes-devtools/python/python3-ovs_2.7.2.bb | 2 --
>  2 files changed, 3 insertions(+), 5 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-ovs.inc => python3-ovs_2.13.0.bb} (58%)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python3-ovs_2.7.2.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-ovs.inc b/meta-openstack/recipes-devtools/python/python3-ovs_2.13.0.bb
> similarity index 58%
> rename from meta-openstack/recipes-devtools/python/python-ovs.inc
> rename to meta-openstack/recipes-devtools/python/python3-ovs_2.13.0.bb
> index d9303f2..4f372bc 100644
> --- a/meta-openstack/recipes-devtools/python/python-ovs.inc
> +++ b/meta-openstack/recipes-devtools/python/python3-ovs_2.13.0.bb
> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
>  
> -SRC_URI[md5sum] = "8551ed58f4e5878db9a599e2d7792d98"
> -SRC_URI[sha256sum] = "24cc9e324b03ba8d5799f07edf6c8eef013d6cbf741707f42200b1674fd60928"
> +SRC_URI[md5sum] = "a4a252b3c1c7d3d2d4d622179cff178e"
> +SRC_URI[sha256sum] = "c158aaaddbad1f122222f45def50e2bb2f9af4e21a101f5be8488da66d4391f5"
>  
> -inherit pypi
> +inherit setuptools3 pypi
> diff --git a/meta-openstack/recipes-devtools/python/python3-ovs_2.7.2.bb b/meta-openstack/recipes-devtools/python/python3-ovs_2.7.2.bb
> deleted file mode 100644
> index 9c9b82b..0000000
> --- a/meta-openstack/recipes-devtools/python/python3-ovs_2.7.2.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-ovs.inc
> -inherit setuptools3
> -- 
> 2.25.1
> 
> 
> 

> 
> 
> 


