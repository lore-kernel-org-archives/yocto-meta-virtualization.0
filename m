Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91D2CD6E6B
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 03:35:28 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.755.1780630518726925940
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 Jun 2026 20:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Er9mvlc8;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9156ceb55ffso127794385a.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Jun 2026 20:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780630518; x=1781235318; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Zd+4sx9CO9X2PRDMBUcnCDC6o/2EJACyXLbqLmF+GY=;
        b=Er9mvlc8+yYMowG2nNMcFpz/XJ677elQi0nqMnUN2mXXtG0dIVAE89qTMz/G3ZKtUz
         HO+PIwalEhnvTc0LV4IyO5Q07w6xl1e9ubArc+L5zXBKWc6Zp80r806zhQPHDy0O+Vwh
         dIqcZhTAV9kaD9d4OT8/OZoyqQew67SX+hRYrc4vxl78gBX3XJtYDBeAZUK6z8Q1drKG
         CfBcwi1vc0ZaeL6a+bnnQVs2Jhcy4lmUsN0dZBkWf4iCXJyudNpuRov2C1wrv0nbzZab
         4t3hciTzAZwm4HC/Jy/Rvtc4dwnZVusU0cnrH+rbJBMGfX6sZzwh/rbUh9FIRMWl2b/V
         r19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780630518; x=1781235318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Zd+4sx9CO9X2PRDMBUcnCDC6o/2EJACyXLbqLmF+GY=;
        b=AMchwYQG/gHpSwYalDn6Dacc/Eeskg3zcFXGWs69aVd0BcgHcjHvW8+QK3UgvIHHOx
         K6NWLOhD9IFYNVvtI+8yQcvjjgop9qlMz+Oo700K/0YrHKcfPkFOIxXgEU1C2By60i1s
         f0IGlKEDgpLT/FXt9nylXlG6b407PVX/F2AuwCWDzz5AXsHI2F1GqQwGrBB3R9RQyq9a
         z7qATOvPmrYTOzBll2lzxNADZCG2x2l1Q8ym6dYVbXQjdykm/VccyuQ+56FXWtVifthN
         WnJ58K521XKNZguPk9ej/FZDHa8sFDDJ6ZKJ8F5rmqwW4868XztdWJhK+T9+eIs4F539
         UdFA==
X-Gm-Message-State: AOJu0Ywg8dJIDiOSXIGG8rUwjp/JOo58x/f3Lc7ZZj7Hj+pdX4Myx8C+
	VKvQ7K7nu0VVb2iO91o8/6r7clAkkdcEwZXNhOqmrqlBSBfPcxMRT54NvVO7Dqb+
X-Gm-Gg: Acq92OErqNBO2s7L4DcADl1TksQXbB8MYyr5+9rl2jn1sHIvTmWtajXeG1cO0FqCB54
	nQtFmvjRw/4s/gkPnlFntgDV3mFT+/aYTC0EflY5LUg6plqwqoQQ+OJe4XirNMoaZJB/wNBySF7
	u4ogtsCVzvuIal8/bLTiK02mB2msbtQ17uGSRUTAnQfIVui0Xt32MCqZxbur5XSinEuP6ycHCSa
	HmFM5vET0qfRMesE5irOMFRVeCtJWrmJO5YRwiVDMd3QKBARY5o6MWI1a3H5Um8UMlmCZT8wNJ6
	XVJX/xlvI/HemxfbSNdjFi6sUg2+zpCdqSAQSqTFyUfIsmP5+s/Q7Qwi2lAbONsuhES7w+K6aJQ
	kuwEuyr784wna04vl4jZJB7L0ezHygKTwA5dFIho4aytQuHvEZ8CSWH3MX8Zw9fiphQRKMzUGyP
	9ndpsZNyz1RnmeU49KNPVtJrFugA2pYXAqndIg0351ldXLll/c/hdiwIN8/3XsRpMHPmbfn0DCE
	WJnu/8HxMkGpVk5pHGruH4GOswdC4tOFLvgiqnt2wZRnJva4JTjOQRjRjMlxe1Wv6ZTc5xztmSr
	2FG8GIbA2Szbp8vtTGnZ6WZFqwoSMa54I3IwyG6wPjw=
X-Received: by 2002:a05:620a:254a:b0:910:db3a:7bdb with SMTP id af79cd13be357-915a9d888demr364544085a.32.1780630517716;
        Thu, 04 Jun 2026 20:35:17 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a381febsm749139385a.23.2026.06.04.20.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 20:35:17 -0700 (PDT)
Date: Fri, 5 Jun 2026 03:35:15 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: haiqing.bai@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [wrynose][PATCH] sloci-image: upgrade
 v0.1.0 -> v0.1.2
Message-ID: <aiJD81hCkwBIfyiC@gmail.com>
References: <20260602084925.1052813-1-haiqing.bai@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602084925.1052813-1-haiqing.bai@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 05 Jun 2026 03:35:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9855

There's a bump pending in master-next, that needs to land first, and
then you can sumbit a cherry pick request for it.

Bruce

In message: [meta-virtualization] [wrynose][PATCH] sloci-image: upgrade v0.1.0 -> v0.1.2
on 02/06/2026 haiqing via lists.yoctoproject.org wrote:

> From: Haiqing Bai <Haiqing.Bai@windriver.com>
> 
> Upgrade sloci-image to the latest stable release v0.1.2.
> 
> Key upstream changes since v0.1.0:
> - Fix escaping issues when generating OCI image config files
> - Don't create top-level directory in tar archive (containerd compat)
> - Fix "--arch arm64" argument being incorrectly rewritten to "arm"
> 
> Recipe changes:
> - Update SRCREV to b45be2e (tag v0.1.2)
> - Update LIC_FILES_CHKSUM for updated LICENSE file
> 
> The existing variant quoting patch is retained as it remains
> applicable and is not addressed upstream (Upstream-Status:
> Inappropriate [embedded specific]).
> 
> Signed-off-by: Haiqing Bai <haiqing.bai@windriver.com>
> ---
>  .../0001-sloci-image-fix-variant-quoting.patch        | 11 ++++++-----
>  recipes-containers/sloci-image/sloci-image_git.bb     |  6 +++---
>  2 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/recipes-containers/sloci-image/sloci-image/0001-sloci-image-fix-variant-quoting.patch b/recipes-containers/sloci-image/sloci-image/0001-sloci-image-fix-variant-quoting.patch
> index 85aa6205..e1749b63 100644
> --- a/recipes-containers/sloci-image/sloci-image/0001-sloci-image-fix-variant-quoting.patch
> +++ b/recipes-containers/sloci-image/sloci-image/0001-sloci-image-fix-variant-quoting.patch
> @@ -1,4 +1,4 @@
> -From 55aebd87ee81f851d088beea8688e3e599c2bced Mon Sep 17 00:00:00 2001
> +From f153bc9b54b2d43e572873b7a5ca490b97d2353d Mon Sep 17 00:00:00 2001
>  From: Bruce Ashfield <bruce.ashfield@gmail.com>
>  Date: Fri, 17 Jul 2020 14:40:12 -0400
>  Subject: [PATCH] sloci-image: fix variant quoting
> @@ -14,12 +14,13 @@ when a variant is defined.
>  Upstream-Status: Inappropriate [embedded specific]
>  
>  Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> +Signed-off-by: Haiqing Bai <haiqing.bai@windriver.com>
>  ---
>   sloci-image | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>  
>  diff --git a/sloci-image b/sloci-image
> -index be8e79a..e0dc469 100755
> +index 7c0c3bd..a9bcd44 100755
>  --- a/sloci-image
>  +++ b/sloci-image
>  @@ -298,6 +298,7 @@ oci_image_config() {
> @@ -34,11 +35,11 @@ index be8e79a..e0dc469 100755
>   	      "digest": "$manifest_digest",
>   	      "platform": {
>   	        "architecture": "$(oci_arch $CFG_ARCH)",
> --	        ${CFG_ARCH_VARIANT:+"\"variant\": $(json_string "$CFG_ARCH_VARIANT"),"}
> -+		${CFG_ARCH_VARIANT:+$variant_string}
> +-	        ${CFG_ARCH_VARIANT:+"$(echo \"variant\"): $(json_string "$CFG_ARCH_VARIANT"),"}
> ++	        ${CFG_ARCH_VARIANT:+$variant_string}
>   	        "os": "$CFG_OS"
>   	      },
>   	      "annotations": {
>  -- 
> -2.19.1
> +2.51.0
>  
> diff --git a/recipes-containers/sloci-image/sloci-image_git.bb b/recipes-containers/sloci-image/sloci-image_git.bb
> index e0bdad39..7c72c7d6 100644
> --- a/recipes-containers/sloci-image/sloci-image_git.bb
> +++ b/recipes-containers/sloci-image/sloci-image_git.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "A simple CLI tool for packing rootfs into a single-layer OCI image"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=948cd8e59069fad992b0469af9ad7966"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=896c8ffa3d0539d0d980d0217269969d"
>  SRC_URI = "git://github.com/jirutka/sloci-image.git;branch=master;protocol=https \
>             file://0001-sloci-image-fix-variant-quoting.patch \
>            "
> @@ -8,8 +8,8 @@ SRC_URI = "git://github.com/jirutka/sloci-image.git;branch=master;protocol=https
>  
>  DEPENDS = ""
>  
> -SRCREV = "4015e49763e5a738026a5bbfcf32b38b5a4fa650"
> -PV = "v0.1.0+git"
> +SRCREV = "b45be2e049c5c55acb04a5edb017b793d2d9e677"
> +PV = "v0.1.2+git"
>  
>  do_compile() { 
>  	:
> -- 
> 2.53.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9839): https://lists.yoctoproject.org/g/meta-virtualization/message/9839
> Mute This Topic: https://lists.yoctoproject.org/mt/119608048/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


