Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E96DC4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 17:58:30 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.1428.1714672704381437034
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 May 2024 10:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gY36IUGG;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6a05f376effso62254936d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 02 May 2024 10:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714672702; x=1715277502; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=itGUsB4twXlqLHmnv10SunDKj5NPt5S9J7f/GA0lggY=;
        b=gY36IUGGx8UOgR1Fh263Y4JWjlHckFiB3Jform+YNcqPoJnnAB1SVu3Smq3cR+XuFw
         T1jb6LQ+gTUpffdC2bV1j04vL+odz/q4uNTVXKUy3nKqq+Cr9tLxW9vfduwNfOpA38SQ
         bHD6UJ3U8SleLr6+D3vuNfifVL+uCGZFJQ944DwnQcYetOtSnzxvz1FznxP+vuloO7iP
         AzhvPMaONo3NXnlffrhgsNvYcaYBA45XxxtWj3vpJ8ZbrGgGVxQ082dsIkWXZh5WZVL9
         2OfK6oI2d2cD2ExRJAO4dTdufnGnZf8i2QCNcgAKV76QCSnOWKe1pkXEv4OdRs3EuNFu
         yWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714672702; x=1715277502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itGUsB4twXlqLHmnv10SunDKj5NPt5S9J7f/GA0lggY=;
        b=u0U+Y6rNGyRajPNPuw4YUaWI/jh8skOQGFF2L8xlyQpX/FCKOT+Dm3Zb8evb8KbZS9
         XdbJqk7j5LK7Qm2XeP+rAfYpqQwljQeZd/WXcGsYO77KWcgQjDl5TiRT8Kfoji4k3PsM
         098vVvyHWbdNKl4Jp0QpxDnx6Wr67g4DCp1j5gtdj13IMBYCcGdBrKU/Ri000gE95XRv
         6hOqLH+WqwbBnT5T6kyQPtA43x89qThI4PREMbg8LeTyNxvrZFaSxSt5WnWbWPn/Zmoa
         8MSL3tvG82TXSNcKMjWjM+Rm+dEXI9iZnfGAo6r/GVd0DdOaPxw6YUbI/c7Se/UB3N4/
         CmcQ==
X-Gm-Message-State: AOJu0YxKJ74xq7uXDad3JW3ts6WKZ2Di3CjHt2QNafODGWE5xAww4fuK
	3S9iEWMVFyCak6bj2FAv9iuvpwht85UXsEmDj4CHVFsTl5Q+kGkO
X-Google-Smtp-Source: AGHT+IEqEKD3Gsd0UH2FOEWlhLzJQLXjBzai1gUkaldjIta4AZIuqPDkui8RPIKri9wCceAYEzLrkA==
X-Received: by 2002:a05:6214:1bcb:b0:6a0:ccab:6fd3 with SMTP id m11-20020a0562141bcb00b006a0ccab6fd3mr445523qvc.7.1714672702034;
        Thu, 02 May 2024 10:58:22 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id q20-20020ad44354000000b006a0e9d7ec60sm520225qvs.126.2024.05.02.10.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 10:58:21 -0700 (PDT)
Date: Thu, 2 May 2024 17:58:19 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: patrick.wicki@subset.ch
Cc: meta-virtualization@lists.yoctoproject.org,
	Patrick Wicki <patrick.wicki@siemens.com>
Subject: Re: [meta-virtualization][PATCH 2/2] podman: require catatonit
Message-ID: <ZjPUO/MGsicD6/+H@gmail.com>
References: <20240429172523.1635019-1-patrick.wicki@subset.ch>
 <20240429172523.1635019-2-patrick.wicki@subset.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240429172523.1635019-2-patrick.wicki@subset.ch>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 02 May 2024 17:58:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8712

In message: [meta-virtualization][PATCH 2/2] podman: require catatonit
on 29/04/2024 Patrick Wicki via lists.yoctoproject.org wrote:

> From: Patrick Wicki <patrick.wicki@siemens.com>
> 
> Alternatively, we could add it to RRECOMMENDS. But I would say, given
> its name, managing pods is part of podman's core functionality and that
> requires catatonit, which is currently only pulled in for the ptest:
> 
> root@qemux86-64:~# podman pod create
> Error: building local pause image: finding pause binary: exec: "catatonit": executable file not found in $PATH

We've never required this before since podman create isn't
a common use case for our target devices.

The change is fine with me, but I'll wait for it to be resent
along with v2 of patch 1/2 as the list dependency formatting
will be different.

Bruce

> 
> Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
> ---
>  recipes-containers/podman/podman_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index 41f090f0..7bdefba5 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -150,6 +150,7 @@ VIRTUAL-RUNTIME_base-utils-nsenter ?= "util-linux-nsenter"
>  COMPATIBLE_HOST = "^(?!mips).*"
>  
>  RDEPENDS:${PN} += " \
> +	catatonit \
>  	conmon \
>  	iptables \
>  	libdevmapper \
> @@ -172,7 +173,6 @@ RDEPENDS:${PN}-ptest += " \
>  	bash \
>  	bats \
>  	buildah \
> -	catatonit \
>  	coreutils \
>  	file \
>  	gnupg \
> -- 
> 2.44.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8705): https://lists.yoctoproject.org/g/meta-virtualization/message/8705
> Mute This Topic: https://lists.yoctoproject.org/mt/105805580/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


