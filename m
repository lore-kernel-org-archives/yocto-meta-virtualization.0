Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE984C38150
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 03:55:16 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.6227.1720583712137673819
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 20:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W3Fi6Kx2;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6b5f3348f05so25982056d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Jul 2024 20:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720583711; x=1721188511; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YJNUbYRpMHPQywpuXqt1kl0UZtEJM7Gt2nLuV8k2shc=;
        b=W3Fi6Kx2I7daBGjinh/QUFnktKV/1T0cJrQhPikOkzMC8EeS3c97L80iB6JwHi157l
         9VQ8U9uD/4alJ1VjFBKRhi2IcRwpPR2OXVfdkuuejrqrAHvIINgK1Uc3j1KCTsoMsa8X
         mOIhR6r239jX7tdz3r33m+e+J+rQojDs+EFaBDkp6IF5cb5K+vT5denUX0Yhmo4XUq+x
         QSe4C8lJBmapDkDcQ3CR2aSKtZeA0nI8M7PI7pfS8QeZ59TCYajPNGSJ0zZA8b0S5lL4
         3ce92M3ScaKyPEgi9XXfKFd1DAcBfypPdtV27eJCa4sV5HRaz5qFTLsDWf7ZZxz+0YXl
         NDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720583711; x=1721188511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJNUbYRpMHPQywpuXqt1kl0UZtEJM7Gt2nLuV8k2shc=;
        b=uuLMRUCt/tzu5BywzM/rv5v2Nlt4/6qjGQfcuQ/KD55Heyr9rhkmmQ+9WirDu1v87u
         peD+XNPkrefHCrUWpn4peJUtddxGbJZmMbI01P100uL5wSe8bp+3fmSnguWn15lMESTV
         qUa4ypa/orJMCJOY4dqnxf+x+ZkyabBEd87Jw7W8Eh6FKgFNntNY4Uif/kEl2cMyHiAw
         hLSCdUo6RE6dIO4vc+qlkf1XxZ/Pns/TmlG49HCZbHbT1vLkyCGfH+Psz08jh8c7zZQV
         +smRj0JuB/EGPyeeUuyssuybKflbdfEhN4cmEBTKdblq3CgO7Hzdz0mSU2ykrOoveKFP
         DCrg==
X-Gm-Message-State: AOJu0YwSX+NOxCKArvOqvWiVHG8YXsSVR8jh7HUU8JiPCM5rKrA8GIFB
	qvOwU/QfEs8365qhu2KNu30bT+eZ5PGjXxYSLS4mnO3w9ozDQMvw+iVAZ6pz
X-Google-Smtp-Source: AGHT+IGPDZ49Qx6CIht5SlXvSqMJQt0unjwnSHWlwIte27tGU6+ZSk/dkhhp8S5Y2I82dOClZD7dog==
X-Received: by 2002:a05:6214:2587:b0:6b0:743b:71f5 with SMTP id 6a1803df08f44-6b61c1b2b3bmr60468556d6.44.1720583710916;
        Tue, 09 Jul 2024 20:55:10 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b61ba8c9f1sm14074226d6.123.2024.07.09.20.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 20:55:10 -0700 (PDT)
Date: Wed, 10 Jul 2024 03:55:08 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: kai.kang@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] virt-manager: update RDEPENDS
Message-ID: <Zo4GHPqSd2owKwi7@gmail.com>
References: <20240704060158.282957-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704060158.282957-1-kai.kang@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jul 2024 03:55:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8825

staged on master-next

Bruce

In message: [meta-virtualization] [PATCH] virt-manager: update RDEPENDS
on 04/07/2024 Kai Kang via lists.yoctoproject.org wrote:

> From: Kai Kang <kai.kang@windriver.com>
> 
> Update RDEPENDS to fix following errors when run virt-manager:
> 
> |   File "/usr/share/virt-manager/virtManager/virtmanager.py", line 13, in <module>
> |     import gi
> | ModuleNotFoundError: No module named 'gi'
> 
> |   File "/usr/lib/python3.12/site-packages/gi/__init__.py", line 122, in require_version
> |     raise ValueError('Namespace %s not available' % namespace)
> | ValueError: Namespace LibvirtGLib not available
> 
> |   File "/usr/share/virt-manager/virtinst/xmlapi.py", line 7, in <module>
> |     import libxml2
> | ModuleNotFoundError: No module named 'libxml2'
> 
> |   File "/usr/share/virt-manager/virtinst/install/urlfetcher.py", line 16, in <module>
> |      import requests
> | ModuleNotFoundError: No module named 'requests'
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  recipes-extended/virt-manager/virt-manager_4.1.0.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/virt-manager/virt-manager_4.1.0.bb b/recipes-extended/virt-manager/virt-manager_4.1.0.bb
> index a2395012..aa3df215 100644
> --- a/recipes-extended/virt-manager/virt-manager_4.1.0.bb
> +++ b/recipes-extended/virt-manager/virt-manager_4.1.0.bb
> @@ -28,7 +28,13 @@ RDEPENDS:${PN}-common += " \
>    libosinfo \
>  "
>  
> -RDEPENDS:${PN} = "${PN}-common"
> +RDEPENDS:${PN} = " \
> +  ${PN}-common \
> +  libvirt-glib \
> +  libxml2-python \
> +  python3-pygobject \
> +  python3-requests \
> +"
>  RDEPENDS:${PN}-install = "${PN}-common"
>  
>  SETUPTOOLS_INSTALL_ARGS += "${PACKAGECONFIG_CONFARGS}"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8817): https://lists.yoctoproject.org/g/meta-virtualization/message/8817
> Mute This Topic: https://lists.yoctoproject.org/mt/107033395/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


