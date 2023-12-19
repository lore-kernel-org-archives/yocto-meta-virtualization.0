Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3E9C35274
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 03:03:24 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.4244.1702954995105844262
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 19:03:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hBVJktHd;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4275b7eaa11so11295841cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Dec 2023 19:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702954994; x=1703559794; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wDdFQKeDYl1PsURTSNtjs3Z8EwSdhrMwLxRn1OOY3jw=;
        b=hBVJktHdAT0pTMwCbjoybduIYMPgSHSztJB5+8Pr7O0YipHUoKwZWhSswGbF/nwzxj
         QKFOmuTy3MzRRoYcdODIBF9hur8sEMS3J431mp39iAY6RwJA0HnXN8z3ErnSn+AB9jNu
         aaJfxp16S5Xaw6Hxr8biVWioMDWu5y/V4r2XxX3tzlvjwsxWcu56Z+VeQltQ+doiL8Hd
         vxE19k17BVN7+qjOEPuauTFWpW439O02QXCHb48cFrinBor2KPKuYevocELLCm8L9tni
         JCsip7zkzJX3HGLbfqoWvAgom4I/AsDAbue5OHRkFmVy1ZwAuVazFtrod12Woh3d39NF
         OKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702954994; x=1703559794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDdFQKeDYl1PsURTSNtjs3Z8EwSdhrMwLxRn1OOY3jw=;
        b=h7mEPvGB17m5KYppYgv+Ld+jpB0XBgLxIqe93KujEYmb3FZOEaC7kl2TT/qvagcFKe
         LJ5142benRftCsLIjr+PAgRjDpVniM52dJC7Bl+daX8E+Whx9rrs7CLXSr7pQ5r6fuUL
         ojFTpb77W4k0rlQrFyqN0X+2oHcg7Rh+Bub1WWXnQguSlxwhuDQlreGAeLCoAQrS4y3A
         z/7iq1qUDOY5qNWo9tjvUlmGgp6sU3x7kt9syJ/St12BCLNCXoGp/ql5y4oufGxoCgWa
         hzcu+MI1S0BABYtNuOqZsViBtvD93c+COTkBlkPejDQ6kidXI+KD1hYBmu1ejIePegLX
         Q6lw==
X-Gm-Message-State: AOJu0Yzqhc6GX+HJahUxS9vcquSlOVao/K5Dl4I0cuEBq4ikXqnbaIoC
	TyzgL2AlgF+C3oUaabgYx2U=
X-Google-Smtp-Source: AGHT+IEJGm7bn93OJCuvF9924AP4Xuh1SV5bEzf411IB7PgRtfzha6G1l5ERo/tVALzH/QJ3tifApA==
X-Received: by 2002:a05:622a:19a3:b0:425:4043:8d3f with SMTP id u35-20020a05622a19a300b0042540438d3fmr16776465qtc.90.1702954994055;
        Mon, 18 Dec 2023 19:03:14 -0800 (PST)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id v4-20020ac87484000000b00423e9316931sm9860036qtq.83.2023.12.18.19.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 19:03:13 -0800 (PST)
Date: Tue, 19 Dec 2023 03:03:12 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] docker-compose: introduce pkgconfig
 docker-plugin
Message-ID: <ZYEH8GQs9IbnUptj@gmail.com>
References: <20231216102601.54277-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231216102601.54277-1-liu.ming50@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Dec 2023 03:03:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8513

In message: [meta-virtualization][PATCH] docker-compose: introduce pkgconfig docker-plugin
on 16/12/2023 Ming Liu wrote:

> From: Ming Liu <liu.ming50@gmail.com>
> 
> This allows docker-compose choose to be built as a docker plugin or a
> standalone binary, in the later case, docker-compose does not have to
> rdepends on docker, so nother container tools like podman can also use
> it.

That's how it used to be installed, but upstream broke it for a bit.

Did you test both modes ? If so, it would be nice to get a follow up
patch in the form of a README in the recipe directory that indicates
the test steps. That'll allow me to automate it in the future.

For now, I've staged this on master next, while we wait for those
test instructions.

Bruce

> 
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  .../docker-compose/docker-compose_git.bb       | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/recipes-containers/docker-compose/docker-compose_git.bb
> index 092ce3d2..b7745f2b 100644
> --- a/recipes-containers/docker-compose/docker-compose_git.bb
> +++ b/recipes-containers/docker-compose/docker-compose_git.bb
> @@ -34,7 +34,8 @@ COMPATIBLE_HOST = "^(?!mips).*"
>  
>  do_configure[noexec] = "1"
>  
> -PACKAGECONFIG ?= ""
> +PACKAGECONFIG ?= "docker-plugin"
> +PACKAGECONFIG[docker-plugin] = ",,,docker"
>  
>  include relocation.inc
>  
> @@ -63,16 +64,15 @@ do_compile() {
>  }
>  
>  do_install() {
> -        #install -d "${D}${BIN_PREFIX}/bin"
> -        #install -m 755 "${S}/src/import/bin/docker-compose" "${D}${BIN_PREFIX}/bin"
> -
> -	# commonly installed to: /usr/lib/docker/cli-plugins/
> -	install -d "${D}${nonarch_libdir}/docker/cli-plugins/"
> -	install -m 755 "${S}/src/import/bin/docker-compose" "${D}${nonarch_libdir}/docker/cli-plugins/"
> -
> +	if ${@bb.utils.contains('PACKAGECONFIG', 'docker-plugin', 'true', 'false', d)}; then
> +		install -d ${D}${nonarch_libdir}/docker/cli-plugins
> +		install -m 755 ${S}/src/import/bin/docker-compose ${D}${nonarch_libdir}/docker/cli-plugins
> +	else
> +		install -d ${D}${bindir}
> +		install -m 755 ${S}/src/import/bin/docker-compose ${D}${bindir}
> +	fi
>  }
>  
> -RDEPENDS:${PN} += " docker"
>  
>  FILES:${PN} += " ${nonarch_libdir}/docker/cli-plugins/"
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8510): https://lists.yoctoproject.org/g/meta-virtualization/message/8510
> Mute This Topic: https://lists.yoctoproject.org/mt/103206987/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


