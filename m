Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C21C83F2D
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 03:06:30 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.40781.1693796784922843838
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 03 Sep 2023 20:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iwhu3d71;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-412137ae07aso5347851cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 03 Sep 2023 20:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693796784; x=1694401584; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UMp2aZBgGju9oCLeXUOcDoD1O46igf9UPP1Q3b2Xskg=;
        b=iwhu3d71yCTBDYYSb02rGBGCxd4Rwb1TPGq70bDZpYxS/f5ADW1l+0B0ljGtGznnCh
         HE/OeiKcsQnbnm7Q2HzOGUPFVXmDgy9IrdhG1gAqsEg5nrg3cO3QGojBGwpoWgOrNmeM
         iBcoKfVWftKyaPpUkWdDIgAdy8g5+bek3SNHtEEZug34vTvkaFgRM0lw9cyX/d9pJ/tO
         yFMf4OZvfB7XZkLMwwP5Ma5F19YuzIbKw+lIrqpM6uq5PNz5ST/bRX5NiKVpTL39uAr6
         HWdgqyN3FyAtkT9Plszwja4zqzRHFy9GRiPcxP9M5FMeiJdzanPvsKYur9qxTnh2Mcfz
         lZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693796784; x=1694401584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMp2aZBgGju9oCLeXUOcDoD1O46igf9UPP1Q3b2Xskg=;
        b=hAYyMwOY13DlAO80/OngUGTCvqxIrZA20aOeWHHQ8jf68EeWMZadyITkHuLNod35Ha
         9eof7sGwtJXKuZuABlq8i/g0O8XkkYDt9UNlzmDUbs6xA0snAj3+AFZQ2VBE7Gvtr5Uc
         0m6hdon7Qlj8V7RWMRStO5RZWFYZFg+s0ly8RH4/1jdHp5x4bN0ExGtbbZQHCMj5GgYm
         /XWCBfSl6MDqL7xxexqtW9r2WVEx71Mguzs7WN4kShcKspPVGSS0JEC2XXhT0n4Hed/I
         8jg0SbzPd0WY45irqD9sqkWVKKp1Xe0+YGUNa+PHyxgfgfZ92KLu4CHYYJVLGdd09U78
         E+iQ==
X-Gm-Message-State: AOJu0Yzspl4V2aJf7jTuLaND54Md6I2/KOiFIcu9XfSyH9vVuSPrViV7
	aC7gjHpOJTbVNV/PzgwF/NgEa97VBkY=
X-Google-Smtp-Source: AGHT+IGrAF+IaeAodtRfWi1H+JB4OLc7NZYI/3rUX84mZYZ+yPPY8zdoLvTsrNEVN2TVvMhJuQ05aQ==
X-Received: by 2002:ac8:5815:0:b0:412:1aa7:795 with SMTP id g21-20020ac85815000000b004121aa70795mr8394967qtg.19.1693796783828;
        Sun, 03 Sep 2023 20:06:23 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id d7-20020a05620a158700b0076cb3690ae7sm3068697qkk.68.2023.09.03.20.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 20:06:23 -0700 (PDT)
Date: Mon, 4 Sep 2023 03:06:21 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [master-next][PATCH] virtiofsd: add
 seccomp to REQUIRED_DISTRO_FEATURES
Message-ID: <ZPVJraZB5laJIJBV@gmail.com>
References: <20230901190101.3898929-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901190101.3898929-1-Martin.Jansa@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 04 Sep 2023 03:06:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8268

Thanks Martin,

This is on master-next (soon to become master)

Bruce

In message: [meta-virtualization] [master-next][PATCH] virtiofsd: add seccomp to REQUIRED_DISTRO_FEATURES
on 01/09/2023 Martin Jansa wrote:

> * otherwise causes world build failures for DISTROs without seccomp:
> 
>   ERROR: Nothing PROVIDES 'libseccomp' (but meta-virtualization/recipes-extended/virtiofsd/virtiofsd_1.7.0.bb DEPENDS on or otherwise requires it)
>   libseccomp was skipped: missing required distro feature 'seccomp' (not in DISTRO_FEATURES)
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-extended/virtiofsd/virtiofsd_1.7.0.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-extended/virtiofsd/virtiofsd_1.7.0.bb b/recipes-extended/virtiofsd/virtiofsd_1.7.0.bb
> index 7224888..b8a9382 100644
> --- a/recipes-extended/virtiofsd/virtiofsd_1.7.0.bb
> +++ b/recipes-extended/virtiofsd/virtiofsd_1.7.0.bb
> @@ -6,8 +6,11 @@ LIC_FILES_CHKSUM = " \
>      file://LICENSE-APACHE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
>      file://LICENSE-BSD-3-Clause;md5=b1ed361f9fc790c1054d81a7ef041a34 \
>  "
> -DEPENDS += "libseccomp"
> -DEPENDS += "libcap-ng"
> +
> +DEPENDS = "libseccomp libcap-ng"
> +
> +inherit features_check
> +REQUIRED_DISTRO_FEATURES = "seccomp"
>  
>  SRC_URI += "crate://crates.io/virtiofsd/1.7.0"
>  SRC_URI[virtiofsd-1.7.0.sha256sum] = "6f043afa23aedbb18f36084b9df831796a9e4c62e73a16fe557de0cf30d7708d"
> -- 
> 2.42.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8264): https://lists.yoctoproject.org/g/meta-virtualization/message/8264
> Mute This Topic: https://lists.yoctoproject.org/mt/101101651/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


