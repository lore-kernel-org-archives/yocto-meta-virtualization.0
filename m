Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2561FC4828D
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 14:16:02 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.16441.1706796958195354623
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Feb 2024 06:15:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PiBRh0wl;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-204235d0913so530504fac.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Feb 2024 06:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706796957; x=1707401757; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Yul5PiJXxOJQVazJihP8RQgAFlHHWGgxmNj+UTMA38=;
        b=PiBRh0wls3zTNMkmIy7Du5g5fw7R7+UBXTtb8HeBRb8dIlfKACVM4nqjQx6aPkKkLh
         h0qmDKl5l+kUyF6Dvr2bXJmrqOOd2Wm295nCm8HQAXvZDlG7wMO0ORBJDMBzF5A6PTRz
         S3YXDKVFy0YDZKf/co3IBXVjAUGyfx+VJpYuOg9ShYv29pwTREtBG5JFodLFcdH/WnkP
         mx9cpZjzHsy1EGGMXzUzpuw+y88l5v5YjNLAwojwDb+IUVFDGyk/6jryU69nk3Mzsn2f
         CYz9Jq7ITjbLyj/6l1SuZpKLC71eeQLQb8oKWA6rj03gX3DhZg7oR+fSXlODhINFmRrg
         0xBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706796957; x=1707401757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Yul5PiJXxOJQVazJihP8RQgAFlHHWGgxmNj+UTMA38=;
        b=XOJH4G8Dr6h5HpJwK5n5+/tYmGkm2ijmFUL9ccfvCEHsg/w9mJbw+B23NbKZcmI0x7
         trRSc8P6IxDDcT+LETa545Ok9H1mgt0YshbNAyGEC1Qo2e/N3aIPbwbpFQ9EjwZ+1kfe
         fLJ1AAXrZ8B4r7uxtQgzSE1LvHUwtojGPGsu2INcpdPt2H/ItA4OLeRK6k7ch4PIrIMM
         epc/kqD5+JZaahkOUo7A1+ZuP/rqCpU+NpW8uNe5Gr9+PtAh36WBQezElKl/nnAY2n6n
         nBla3ltrlGjw3QfLRM5zcTqk+LDlcsH8WG8oNArpeW5MsiGh2sgGjdkPSp+wETtAgZmH
         MpgQ==
X-Gm-Message-State: AOJu0YwfX6Lk9eiIe2j66Hozh3tviX0i6M/p+BLYCW0LJebYjeWG+aLT
	1qfHNnSXhKfB+Q+W0zkTOeBMHE/PZKZt4vrMzAhYwPJFrGFZwAEPqbfwR5MaogTqzw==
X-Google-Smtp-Source: AGHT+IF499lVAKmn7m2p/9YH8Rh5rzM2RHH2hFzfK9dZ5ZeOx88bS/nzyz/BzqkKgviXpdgqJVMqlg==
X-Received: by 2002:a05:6871:28c:b0:218:df68:87b2 with SMTP id i12-20020a056871028c00b00218df6887b2mr2881577oae.44.1706796957295;
        Thu, 01 Feb 2024 06:15:57 -0800 (PST)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id pj3-20020a0562144b0300b0068c68437655sm2070135qvb.115.2024.02.01.06.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 06:15:56 -0800 (PST)
Date: Thu, 1 Feb 2024 14:15:55 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Pavel Zhukov <pavel@zhukoff.net>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] python3-docker: Update to 7.0.0
Message-ID: <ZbunmwzZeHlaf3OE@gmail.com>
References: <20240121182243.631823-1-pavel@zhukoff.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240121182243.631823-1-pavel@zhukoff.net>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Feb 2024 14:16:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8558

merged!

Bruce

In message: [meta-virtualization][PATCH] python3-docker: Update to 7.0.0
on 21/01/2024 Pavel Zhukov wrote:

> Update package to fix compatibility fix docker from the layer.
> 
> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
> ---
>  .../{python3-docker_5.0.0.bb => python3-docker_7.0.0.bb} | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>  rename recipes-devtools/python/{python3-docker_5.0.0.bb => python3-docker_7.0.0.bb} (62%)
> 
> diff --git a/recipes-devtools/python/python3-docker_5.0.0.bb b/recipes-devtools/python/python3-docker_7.0.0.bb
> similarity index 62%
> rename from recipes-devtools/python/python3-docker_5.0.0.bb
> rename to recipes-devtools/python/python3-docker_7.0.0.bb
> index 44d65b05..ada94876 100644
> --- a/recipes-devtools/python/python3-docker_5.0.0.bb
> +++ b/recipes-devtools/python/python3-docker_7.0.0.bb
> @@ -3,10 +3,11 @@ HOMEPAGE = "https://github.com/docker/docker-py"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
>  
> -SRC_URI[md5sum] = "9cc5156a2ff6458a8f52114b9bbc0d7e"
> -SRC_URI[sha256sum] = "3e8bc47534e0ca9331d72c32f2881bb13b93ded0bcdeab3c833fb7cf61c0a9a5"
> +SRC_URI[md5sum] = "b08eeccf6a5efd11c316c08207edfeef"
> +SRC_URI[sha256sum] = "323736fb92cd9418fc5e7133bc953e11a9da04f4483f828b527db553f1e7e5a3"
>  
>  DEPENDS += "${PYTHON_PN}-pip-native"
> +DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>  
>  RDEPENDS:${PN} += " \
>          ${PYTHON_PN}-misc \
> @@ -14,6 +15,6 @@ RDEPENDS:${PN} += " \
>          ${PYTHON_PN}-docker-pycreds \
>          ${PYTHON_PN}-requests \
>          ${PYTHON_PN}-websocket-client \
> +	${PYTHON_PN}-packaging \
>  "
> -
> -inherit pypi setuptools3
> +inherit pypi python_setuptools_build_meta
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8549): https://lists.yoctoproject.org/g/meta-virtualization/message/8549
> Mute This Topic: https://lists.yoctoproject.org/mt/103871272/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


