Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12C1C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 20:45:55 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.2750.1646253954548653792
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 12:45:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ODd0njc/;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id c7so2323895qka.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 12:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=jYsE98ucdit0ZBg1gvCIu0ZqeO1WLPJisXCTyjaU8lA=;
        b=ODd0njc/xNohzQISfkgABzEH466mRvScOUJDS1EB/OE/syFEIl02fQ1nz/VhvPip7X
         5bsdIj29XylwAJjfyxlDQ7sFmGRUZIeLNMVbMACT27OJ9htwn6Ct59mAM4yStW/eHoQO
         cnusR8tGIH+sBaYLNqJLohas6CsgWKuxx4WEDTi8W4laL77O5ohhvZ/33RrYjbidTEmZ
         Qs/1FlIKOEWUtrtLN2HJv0BZa0GsMTQjiQfY5zMwtM6NKFT/mC76S3QKoW1hRjX1wAYx
         tTnRYYTEqbxRT2lDtGWoYB0WlUKKNIynU0ovOFHRCsLxdcZxAulZ/TylGWrE8re88jgD
         asJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jYsE98ucdit0ZBg1gvCIu0ZqeO1WLPJisXCTyjaU8lA=;
        b=do1KLGk6nwOGC7K156coSwein6RGyYG+bV6Cx7ZiqJb2DHUt7UK82nfAvIqXprSAEL
         2OcGcdjE7TD0KfaIRsn4Pv8S3jMjpncQR+s7jtpy+kq8mHkx0hehsPrburcxGpWZQ8Nl
         ySx7Sku15/oDn8P8dtj1boGofZvNC6fU/njfSRdp3+EiLzY3X0x/+dSP8dMWc28GRpdq
         WeG+YnA0/vIVaDmGcj2YayFwO4HopYK8+Wwt++cJXyPrONbOmOYKHf+Nym9j0KVZJjGj
         /oG20+eLW4S0FgT8oOpFfUFFNqTaGBYzBWbPfzObCsAxm2+V1ejQwyRg75+pLVQj+4GI
         7RUQ==
X-Gm-Message-State: AOAM53079djOJHijDk76FhtMUFSKny0uoxjmv2dHllKLKlpy8RtOrwLi
	GOU1bghwuJk1gQ2+gHK2gJk=
X-Google-Smtp-Source: 
 ABdhPJxnAt8kHrWRSDM0tM0Rr24gCFgRfyqDXvXDpKt6cMEiCyjpU8h81/D2FT+bdXiTu6TSRuuJxw==
X-Received: by 2002:a05:620a:48d:b0:47e:17f5:a33f with SMTP id
 13-20020a05620a048d00b0047e17f5a33fmr17792917qkr.727.1646253953504;
        Wed, 02 Mar 2022 12:45:53 -0800 (PST)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a378d04000000b0047cfa3a0cffsm65749qkd.34.2022.03.02.12.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:45:53 -0800 (PST)
Date: Wed, 2 Mar 2022 15:45:51 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Tim Orling <tim.orling@konsulko.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] python3-dtc: fix wheel build
Message-ID: <20220302204548.GA51621@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220227232818.1085145-2-tim.orling@konsulko.com>
 <20220227232818.1085145-1-tim.orling@konsulko.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Mar 2022 20:45:55 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7071

queued to master-next. I'm still seeing some issues on a couple of builders,
but will take are of sorting that out. I'll push the changes when I've
figured it out.

Bruce

In message: [meta-virtualization] [PATCH 1/2] python3-dtc: fix wheel build
on 27/02/2022 Tim Orling wrote:

> The wheel that is built is ${S}/dist/libfdt-1.6.2.dev39+g4048aed.d20220103-cp310-cp310-linux_x86_64.whl
> Set PYPA_WHEEL to match this.
> 
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  recipes-kernel/dtc/python3-dtc_1.6.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-kernel/dtc/python3-dtc_1.6.1.bb b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
> index 449d071..671d280 100644
> --- a/recipes-kernel/dtc/python3-dtc_1.6.1.bb
> +++ b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
> @@ -19,6 +19,8 @@ SRCREV = "4048aed12b81c5a0154b9af438edc99ec7d2b6a1"
>  PV = "1.6.1+git${SRCPV}"
>  S = "${WORKDIR}/git"
>  
> +PYPA_WHEEL = "${S}/dist/libfdt-1.6.2*.whl"
> +
>  inherit setuptools3 pkgconfig
>  
>  BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7066): https://lists.yoctoproject.org/g/meta-virtualization/message/7066
> Mute This Topic: https://lists.yoctoproject.org/mt/89439727/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization] [PATCH 2/2] lopper: fix wheel build
on 27/02/2022 Tim Orling wrote:

> The wheel that is built is:
> lopper-1.0-py3-none-any.whl
> 
> Set BASEVERSION to 1.0 and use this to set PV and the value for PYPA_WHEEL
> (the path to the wheel filename).
> 
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  recipes-kernel/lopper/lopper_git.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-kernel/lopper/lopper_git.bb b/recipes-kernel/lopper/lopper_git.bb
> index 606dab6..e96bac7 100644
> --- a/recipes-kernel/lopper/lopper_git.bb
> +++ b/recipes-kernel/lopper/lopper_git.bb
> @@ -7,7 +7,10 @@ SRC_URI = "git://github.com/devicetree-org/lopper.git;branch=master;protocol=htt
>  SRCREV = "3c81fcce08eeb64cbbde1535abd83572985a8689"
>  S = "${WORKDIR}/git"
>  
> -PV="v1.0+git${SRCPV}"
> +BASEVERSION = "1.0"
> +PV="v${BASEVERSION}+git${SRCPV}"
> +
> +PYPA_WHEEL = "${PIP_INSTALL_DIST_PATH}/${BPN}-${BASEVERSION}-*.whl"
>  
>  LIC_FILES_CHKSUM = "file://LICENSE.md;md5=8e5f5f691f01c9fdfa7a7f2d535be619"
>  
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7067): https://lists.yoctoproject.org/g/meta-virtualization/message/7067
> Mute This Topic: https://lists.yoctoproject.org/mt/89439729/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



