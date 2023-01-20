Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 133B1C05027
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 17:57:10 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.81692.1674237425682305405
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 20 Jan 2023 09:57:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GUbDWNBY;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id q15so4792825qtn.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 20 Jan 2023 09:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zDKV3eu35Qqpz1r8R1NUo2kjZ7xukX6lkTlrUlw2xNk=;
        b=GUbDWNBY5PRwcnNJIjb2T2zdFMLCHSjk1uc/Bp6858p8dnNMHX+DmlHi6ddHWSZDX0
         tnkU2APyT5cdvbAxtABMdfVUKuwJJSNv3N/6YrYK+nPSmPQdny/W8QV6cJgNmsNokNDh
         e3b5XLHOYoJS9fdszyjBcvx4NEBGDEFIok5Pilia7JVcB9hx6BVnJqZU/ptQ5YGuZjna
         DT4CbgFGAOUSNxMxtTmqssAa7vLO2ILdRVAJmcKJw9c3HQOLDjInuiz5NrxPoQieu0g4
         HLdHpqxKUDUAoTlW/Kujxg1Co7vg2sNotBp06U60x7oydgAgDkqVVskbMqBzNN6Pj3FS
         MYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDKV3eu35Qqpz1r8R1NUo2kjZ7xukX6lkTlrUlw2xNk=;
        b=aIBDrpkeIbv2aHS67mn5Bb/cWexzXOV+uhY1yxHqzWzqmTe9Jfck9MWYGV+Ju3ANrX
         oeKHyEEEPq7wE7Aqtm8n1gLtYgR2qi3xWuRBpWCHS0tN+A+/Q5K9ChQW0N7ABLoRmuMR
         PE4GARIJCXcEn085t0PplchcibZAmRNObZ33cfA3tK5HN2hhkQf7JLjptsLKk2ZNQqhs
         XYeCfnK9imUUtXh6wTKOJxaVQMN2Pek5DIkBbLW+K5rFbSBjwhQCaaLHJWwOtSO3tBfa
         Q2jzSs6Q7drPUyVzbplDal9JIx3QL0wf/JhKZyssDuR5pZOXwTBL48x/oS+pResnTIq3
         wx+A==
X-Gm-Message-State: AFqh2koO+H/XbicW/vJJf8IVqXhQXQSYFUWOcMIFY5iyd+QCJ6qJ1uyb
	VlXqr2TQcpooOOxT1T21+O8=
X-Google-Smtp-Source: AMrXdXulhy2b2cJeXS918r/rSLcXqB9IJUeJQfYbIxuJbBxppUSgp+MjbWdd/RGOYzzIXqQMaOgecg==
X-Received: by 2002:a05:622a:260a:b0:3ad:96d:98db with SMTP id ci10-20020a05622a260a00b003ad096d98dbmr22150112qtb.62.1674237424603;
        Fri, 20 Jan 2023 09:57:04 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id u6-20020a05620a0c4600b007054feab4aesm26469687qki.27.2023.01.20.09.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:57:04 -0800 (PST)
Date: Fri, 20 Jan 2023 12:57:02 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] libvirt: skip buildpath QA check
 for libvirt-python-dbg
Message-ID: <Y8rV7r9amF19GaKw@gmail.com>
References: <20230120073709.477410-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120073709.477410-1-xiangyu.chen@eng.windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 20 Jan 2023 17:57:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7828

merged.

I had also tried to fix this in December, but couldn't come up
with anything better than ignoring the warning.

Bruce

In message: [meta-virtualization][PATCH] libvirt: skip buildpath QA check for libvirt-python-dbg
on 20/01/2023 Xiangyu Chen wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> The /usr/lib64/python3.11/site-packages/.debug/libvirtmod_lxc*.so
> libraries with build path embedded, and the setup.py doesn't respect
> our CFLAGS with -ffile-prefix-map argument, so try to skip the
> libvirt-python-dbg buildpath check until that solved.
> 
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
> index 6e2c367..772decb 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -15,6 +15,9 @@ FILES:${PN}-python-dev += "${PYTHON_SITEPACKAGES_DIR}/*.la"
>  FILES:${PN}-python-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug/"
>  FILES:${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
>  
> +# Currently the libvirt-python debug libraries contain buildpaths
> +INSANE_SKIP:${PN}-dbg += "buildpaths"
> +
>  SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
>  
>  SRC_URI[libvirt_python.sha256sum] = "a21ecfab6d29ac1bdd1bfd4aa3ef58447f9f70919aefecd03774613f65914e43"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7826): https://lists.yoctoproject.org/g/meta-virtualization/message/7826
> Mute This Topic: https://lists.yoctoproject.org/mt/96395941/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


