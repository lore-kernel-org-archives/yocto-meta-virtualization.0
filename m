Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 05E23E00D83; Tue, 24 Sep 2019 14:55:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.67 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 817FDE00D68
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Sep 2019 14:55:14 -0700 (PDT)
Received: by mail-io1-f67.google.com with SMTP id j4so8242477iog.11
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Sep 2019 14:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=cM1mEyGvd9m+JngI0Ix1Ergt0n5ich8bP+MZ6lgzbrE=;
	b=u89vn/W/humyicGmimJ+yhqmaajwA1F4/FM70Nye4EWx/gDBsOCtHCh1ETtFJfcDjX
	sgtV3aPTmOCpIJKmdJDSp4JCkvNUnscljVCaRIk9sFwP4veZxIoUOTj5w1cAJFiBx5H7
	JtmVxzoODpIMHlhzzddNQZDJF15zouL1uOZ7dR5hMAAZ4jkdsK794uSVGcg3oFvqr+eD
	cgnZpbKELTzy/xxygQv261vpdQ52gdnwwuDr8UAtPvk3K+5q/KUVWpDhfe8G5SkSHaw7
	QJzN22fGV/ZBPibIR2D3KyosI8X8bm7XR+OD9A//pUQiFkwg1nUNwtmkMTdUsGVr2Snq
	bXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=cM1mEyGvd9m+JngI0Ix1Ergt0n5ich8bP+MZ6lgzbrE=;
	b=YcG7EWwx+wCbmFpSx3YU9rflmlcZqg6mwBU7B8Nl/XSqe6/xUnPqJCAqNDfYt3KLOQ
	UpoqN5vgR2hmFePomPkq2KXw0Wq54zrJYk1Au2w3DTST1kezb/sRmjYRSws9Qu30DZWJ
	vnTZdcqI+jeuJtyy/xxIFZap9GS6lvRm/2BCDhDajFkOhui/tspf4eKvvpYTnGh5zGRx
	pIizKE6vIJmMA7LnBLgQLsHUjI6i746n80sA6ss5yK2rrvZW9lK/+g9i40K9oO068jri
	wI7JwXhm/rPd5UpqRK9IGNUjmLUfK4vHJVKypzSypWSSeGZHzdOAhZNzz6SGVqm4Br01
	7M+Q==
X-Gm-Message-State: APjAAAUQqZ6eyToKHpKso2H0ko8Rqsi21UYSM0ru1rsekSMnl2ls6c0j
	DuKIfa8T2TEd6qbzSdz36bU=
X-Google-Smtp-Source: APXvYqzYjqcZCGmQhPlygVTUJkpTS8mK5MrNOEYA42UhqZdFXJYyrQhNqZSiTMiodzAbzWQwjgJYuw==
X-Received: by 2002:a5e:8a0a:: with SMTP id d10mr5970980iok.121.1569362113862; 
	Tue, 24 Sep 2019 14:55:13 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id q18sm2564608ion.3.2019.09.24.14.55.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 14:55:13 -0700 (PDT)
Date: Tue, 24 Sep 2019 17:55:11 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Message-ID: <20190924215510.GB54158@gmail.com>
References: <20190923083808.27539-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20190923083808.27539-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-dogpile.cache: upgrade 0.7.1 -> 0.8.0
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Sep 2019 21:55:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization] [PATCH] python-dogpile.cache: upgrade 0.7.1 -> 0.8.0
on 23/09/2019 Zang Ruochen wrote:

> --License-Update: Copyright year updated to 2019,and streamlined description of LICENCE.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-dogpile.cache.inc        | 6 +++---
>  ...dogpile.cache_0.7.1.bb => python-dogpile.cache_0.8.0.bb} | 0
>  ...ogpile.cache_0.7.1.bb => python3-dogpile.cache_0.8.0.bb} | 0
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-dogpile.cache_0.7.1.bb => python-dogpile.cache_0.8.0.bb} (100%)
>  rename meta-openstack/recipes-devtools/python/{python3-dogpile.cache_0.7.1.bb => python3-dogpile.cache_0.8.0.bb} (100%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc b/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc
> index 13e4b03..020b171 100644
> --- a/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc
> +++ b/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc
> @@ -2,10 +2,10 @@ DESCRIPTION = "Python Dogpile Cache: A caching front-end based on the Dogpile lo
>  HOMEPAGE = "https://pypi.python.org/pypi/dogpile.cache"
>  SECTION = "devel/python"
>  LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=9b4ca25e52ccc9b1601e8fe6d4fb4ba7"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e8d5890806254a2648269bb4029f74c6"
>  
> -SRC_URI[md5sum] = "88043b337eb609214dbd8fa498300b38"
> -SRC_URI[sha256sum] = "691b7f199561c4bd6e7e96f164a43cc3781b0c87bea29b7d59d859f873fd4a31"
> +SRC_URI[md5sum] = "62512dea6839d2fd1f88532fb573077c"
> +SRC_URI[sha256sum] = "70f5eae4aec908f76188a2c287e07105f60c05d879bb9a4efcc5ba44563d8de6"
>  
>  inherit pypi
>  
> diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.7.1.bb b/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.8.0.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python-dogpile.cache_0.7.1.bb
> rename to meta-openstack/recipes-devtools/python/python-dogpile.cache_0.8.0.bb
> diff --git a/meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.7.1.bb b/meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.8.0.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.7.1.bb
> rename to meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.8.0.bb
> -- 
> 2.20.1
> 
> 
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

