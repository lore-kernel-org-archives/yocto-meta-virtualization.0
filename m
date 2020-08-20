Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.117433.1597951555745662637
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Aug 2020 12:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tyDqcJmi;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9AD37E0205C; Thu, 20 Aug 2020 12:25:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,FREEMAIL_FROM,FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE,URIBL_RED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.195 listed in list.dnswl.org]
	*  0.0 URIBL_RED Contains an URL listed in the URIBL redlist
	*      [URIs: yoctoproject.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FSL_HELO_FAKE FSL_HELO_FAKE
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.5 FAKE_REPLY_C FAKE_REPLY_C
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E1992E02059
	for <meta-virtualization@yoctoproject.org>; Thu, 20 Aug 2020 12:25:53 -0700 (PDT)
Received: by mail-qk1-f195.google.com with SMTP id i20so2535564qkk.8
        for <meta-virtualization@yoctoproject.org>; Thu, 20 Aug 2020 12:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=1udmFKTT5k52bFKL44FB61wmymEs0Ob1e+6u4m+HRtE=;
        b=tyDqcJmim8l+jjNfro5SLktJpj6MEqwHP4Gx2hqYCEyiI364VB1CQPEZkatcMhBDBA
         ODMczr08Npug/uiGq7f2znsr3AU9RtIO6F1vNND4vgKaX9aVLfrEAw1dRkTiZscml5C3
         sU5ccjei854dP6B1rNpNKBDa5oVJVwzw2GJHR466PRSn4zedGB1PcIyAkCkmotU4+FvG
         2F6/HGdY7ksdrg7gJON/zeIEqk73SPI/+UDveRwB/cNjb5RQ3b65ybNA9h00vdQZm6i9
         eSXrvG90CYLiA0Kioh23P4Prr0pa+p9/SjZgpup59daI51m4ir6ShSn8UVrjLtt2xJpt
         lGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1udmFKTT5k52bFKL44FB61wmymEs0Ob1e+6u4m+HRtE=;
        b=ZWABWlO5ZALCdTchOCOclR3/X1yqCnVaBBH2qjxDZY4VGsiP9vnmBmoc5Hj/jJMM2u
         5VLhMbpMWRfckBKwzXbHXYmg6BMYwJpuvd3xtgoRKeT/xa/I7YEEVpb/cuwea35rby2m
         NcjeR2VClP7mw0zzbYPYlHrAAHzIgzoeage4zYj6F8gg96T8gTgbemfjw2oTLjFw006c
         n7H0jzWecRLiccjhIZGI0zMRy3YIfbzpMh16F54mpgKTob1zgB7Rr8b7dpa2yUuBUMBG
         TRbBwWna6HLOL3f2KhrF43vw2FFmWyP4cfdS+Vrc8zlYrWTdQOvWT7D88JQwlahpvHsu
         9G1g==
X-Gm-Message-State: AOAM531YN8QhoRVSB1Wvedk1B0HbFJnGvB3Dk/oGfLDMi+ceIk75SztS
	G9jFjxnhBR3T6hZW3df1Yxo=
X-Google-Smtp-Source: ABdhPJzMAUKjXiDrJbwsB0p7iOZZVOdKzeFkhl/xuD9gajX+my206uDercLAAXjeqvi9gA01JjpMFA==
X-Received: by 2002:a37:9c89:: with SMTP id f131mr3691234qke.283.1597951552822;
        Thu, 20 Aug 2020 12:25:52 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id h144sm3071051qke.83.2020.08.20.12.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 12:25:52 -0700 (PDT)
Date: Thu, 20 Aug 2020 15:25:50 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-xstatic-mdi: upgrade 1.4.57.0 -> 1.6.50.2
Message-ID: <20200820192549.GB23190@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1597775803-10541-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1597775816-10586-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1597776077-10674-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1597776083-10713-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1597776091-10750-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1597776104-10786-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-xstatic-mdi: upgrade 1.4.57.0 -> 1.6.50.2
on 19/08/2020 zhengruoqin wrote:

> -License-Update: Update PKG-INFO.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
> ---
>  ...ic-mdi_1.4.57.0.bb => python3-xstatic-mdi_1.6.50.2.bb} | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-xstatic-mdi_1.4.57.0.bb => python3-xstatic-mdi_1.6.50.2.bb} (56%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-mdi_1.4.57.0.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-mdi_1.6.50.2.bb
> similarity index 56%
> rename from meta-openstack/recipes-devtools/python/python-xstatic-mdi_1.4.57.0.bb
> rename to meta-openstack/recipes-devtools/python/python3-xstatic-mdi_1.6.50.2.bb
> index 9ea1473..3354f47 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-mdi_1.4.57.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-xstatic-mdi_1.6.50.2.bb
> @@ -2,17 +2,17 @@ DESCRIPTION = "mdi javascript library packaged for setuptools3 (easy_install) /
>  HOMEPAGE = "https://pypi.python.org/pypi/XStatic-mdi"
>  SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=898ae9ca7b59edc4521f10be07c6b622"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=af9320964a0ddf3bd33eccd79c29f964"
>  
>  PYPI_PACKAGE = "XStatic-mdi"
>  
> -SRC_URI[md5sum] = "f3d3d58603178e5898ee1ea4737826ee"
> -SRC_URI[sha256sum] = "19b4d522f8fa62fee2893b39147fcf45ebaba8b95d63f3708ebdf34e130a8a53"
> +SRC_URI[md5sum] = "aa720e603fce607681cc69989fbd41a9"
> +SRC_URI[sha256sum] = "be1005af7a593b0b3a349aadb05e4160ea65894248a47b246c6658345e2f10c1"
>  
>  inherit setuptools3 pypi
>  
>  DEPENDS += " \
> -        python-pip \
> +        python3-pip \
>          "
>  
>  RDEPENDS_${PN} += " \
> -- 
> 2.25.1
> 
> 
> 

> 


