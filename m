Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D31FEB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 21:43:04 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.30682.1686865383190816570
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 14:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dmDKazOn;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-3f9b8f1c2fdso623041cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 15 Jun 2023 14:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686865382; x=1689457382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QxYzCKywM85/pexXxE6MibhmpYWNDv00d6pDwLq53T8=;
        b=dmDKazOnnMuPbkeZCiiVvZgMaP+SPKfJTDLzMGYTbBfHGuc6Y26eRCUtXEdNI2iepe
         1h78vgbOzXMNVupqjPwAnr69O/KRf7Kul0XEgF48nRIVlGukonaHV6d/3s2hBiXQVJfF
         LIDJs6STEOYqroTS5Em6M19q8a14/iWoK3uUB+qllk/hT8nSGqwNxdFIZKjlgCOTbsdy
         +Ch+lhN+SebXB9vk6SB0nGQJQMqLPQcMEmj2C/H1RiDhZlI+JJdfuBkO6oVc59gkqEgl
         mENVgcr1PkqjEtSWiKFcp5PBI7EKWflYRu76q8X35wGNpLv9t8XtZg11Ryr2K5/u2l3p
         uX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686865382; x=1689457382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxYzCKywM85/pexXxE6MibhmpYWNDv00d6pDwLq53T8=;
        b=cBIj1tyPja5CFJ5nbOdhiq66nSb4sjUwf4EE+SNBbDgw+fDT7HY8wsP5ynwEPa4jby
         CUtU7xUTRXm6xyt8VQ4n8wCmdDitUno8iIGoY37MqaHOUL1UB7Bpl0Q57fc3BqyTIXju
         YLbN87qUQd+iWvJD9z4f8Bkoa/eR1i9WS2cwL3AyRbkVJleR/EPFKHgFWTJ8AjEFW5Ux
         AHobOKQCkrRmKnJobpWMX2kZMYPpUl19K69b7/DRpYzZxFyFyM+zPTc6eSxFSO1po6mj
         runNz89BdwdHYQBI3lljbctkFiscEM5g46S/icbHZlcSoVsEGBfqT9zI0RDfOhb4Wn2o
         YU+Q==
X-Gm-Message-State: AC+VfDy4xk95xhSVJcV4wGcin0OgKGG4c79QGWG14UBYSLED2orLwJYN
	YzcF6OijgGsgo71XuOkRA9o=
X-Google-Smtp-Source: ACHHUZ7fGLd/SZSes705nN9x06RltLxEhI5vyv5D4biE1WY+PqtARn8v5uraEEJNzrmA/Ok5KLiHgQ==
X-Received: by 2002:a05:622a:11d3:b0:3f6:9cb8:f3d2 with SMTP id n19-20020a05622a11d300b003f69cb8f3d2mr340748qtk.53.1686865382125;
        Thu, 15 Jun 2023 14:43:02 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id x13-20020a05622a000d00b003e3918f350dsm6619997qtw.25.2023.06.15.14.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 14:43:01 -0700 (PDT)
Date: Thu, 15 Jun 2023 17:42:59 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] libvmi: add dependency on
 autoconf-archive-native
Message-ID: <ZIuF47OMIhfF271Q@gmail.com>
References: <20230612161712.3586578-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612161712.3586578-1-Martin.Jansa@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 15 Jun 2023 21:43:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8098

merged.

Bruce

In message: [meta-virtualization] [PATCH] libvmi: add dependency on autoconf-archive-native
on 12/06/2023 Martin Jansa wrote:

> * since https://git.openembedded.org/openembedded-core/commit/?id=571132415ea7fe2d91c62948f2b6aa553eafa83d
>   this doesn't get autoconf-archive-native dependency and fails with:
>   http://errors.yoctoproject.org/Errors/Details/708195/
> 
>   ./configure: line 14424: syntax error near unexpected token `-fno-strict-overflow,'
>   ./configure: line 14424: `  AX_CHECK_COMPILE_FLAG(-fno-strict-overflow, HARDEN_CFLAGS="$HARDEN_CFLAGS -fno-strict-overflow", , -Werror )'
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-extended/libvmi/libvmi_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/libvmi/libvmi_git.bb b/recipes-extended/libvmi/libvmi_git.bb
> index 6338b80..25d7d40 100644
> --- a/recipes-extended/libvmi/libvmi_git.bb
> +++ b/recipes-extended/libvmi/libvmi_git.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
>  SECTION = "console/tools"
>  PV = "0.14.0+git${SRCPV}"
>  
> -DEPENDS = "libvirt libcheck bison fuse bison-native flex-native"
> +DEPENDS = "libvirt libcheck bison fuse bison-native flex-native autoconf-archive-native"
>  
>  SRC_URI = "git://github.com/libvmi/libvmi.git;branch=master;protocol=https \
>             file://0001-Build-vbd-only-when-xen-is-enabled.patch \
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8096): https://lists.yoctoproject.org/g/meta-virtualization/message/8096
> Mute This Topic: https://lists.yoctoproject.org/mt/99486831/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


