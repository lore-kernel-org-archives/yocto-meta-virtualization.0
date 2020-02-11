Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.16639.1581455361873253490
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Feb 2020 13:09:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c7b4j9xQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id v2so6726569qkj.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Feb 2020 13:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lz7P8GbWaNpsnE8vM5G2zu203VEkh5I8ZeXlK8Cn+Fc=;
        b=c7b4j9xQoA28bc8RC8tkxUiFT9TYj4jYkM7Y+G2kwUNA214olakH9Blj5Nkr+AwjEg
         Oq6256Nnhp8Wy91NgYPL5nJa+HsmWPMaJP42iGV4lb7sfh1XAY1kL7h0M0I0ulIX2z6u
         ckn3+dvSJolrnztTsq+0geV7hIRDeeglosUHmAkyhvyhM2iW5I6gZiEXVSgE0mYcDuX2
         Lc135XouKTSy5dgmZvBr6w0EICshlDx7M4VoUyMpU300J1gJMCDeAuLONi8pfrV+F1Vd
         2wkr3NdNdkcMd9vpJPWhzHmOdafTDqOZsO+CMyX1PHyjKj/WMArCF7Ie3xEsjsC1B0D0
         yj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lz7P8GbWaNpsnE8vM5G2zu203VEkh5I8ZeXlK8Cn+Fc=;
        b=X3jWTydk3Qy25Bs+XEgOTe5TVlNjmvwWS1ay8oCyahcIVGiryabqMcSoRyjPUJBVlO
         ir40K1IU+GsZWuOWQZ9TjTF5CfYz3ubRIFauRy3EPtuhTvZ1FzzMxB8vhTzTSLLNVQ3b
         GqBNL4AmntunOOzXuJcrfqkJaLok35cQ4u2FB06Kpqw5n/FXABToj/5cCLrL8G9IBlX4
         NsVa/EDUk2kzonx430ZJeD2b0K1HUY7ENrMJECQzUL2gSJSJVdpjCmE7RRaHJ22d6tOh
         pRtOJFVPVk/Tpykvztq2KCN/cwMN2L9Y8uDOWi0e+o73Oo4jVpk02T3t3gwtrx83ev+j
         YoSA==
X-Gm-Message-State: APjAAAXsstngCAiAcZDzgHnef+vWzOtH/OjqrhP/q8AnDkn/vW9u/SO6
	QHdWudoJLWaTW4Fq24s/ISOhF3HO6RY=
X-Google-Smtp-Source: APXvYqyd5MXM+cco3yhGSrPiC6hRs7hmvb8d+ITlbN6qCeDYYgUP4eaIR9EuU/w1WXXHBBRNa+523w==
X-Received: by 2002:a37:6741:: with SMTP id b62mr8073832qkc.305.1581455361020;
        Tue, 11 Feb 2020 13:09:21 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id a24sm2562170qkl.82.2020.02.11.13.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 13:09:20 -0800 (PST)
Date: Tue, 11 Feb 2020 16:09:18 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] libvirt: inherit perlnative for pod2man
Message-ID: <20200211210915.GA37000@gmail.com>
References: <20200205034621.126564-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200205034621.126564-1-Qi.Chen@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][PATCH] libvirt: inherit perlnative for pod2man
on 04/02/2020 Chen Qi wrote:

> pod2man is now provided by perlnative instead host.

merged.

Bruce

> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_5.5.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/libvirt/libvirt_5.5.0.bb b/recipes-extended/libvirt/libvirt_5.5.0.bb
> index 6a84f98..3f07619 100644
> --- a/recipes-extended/libvirt/libvirt_5.5.0.bb
> +++ b/recipes-extended/libvirt/libvirt_5.5.0.bb
> @@ -43,7 +43,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>  SRC_URI[libvirt.md5sum] = "27c5fb6c8d2d46eb9e8165aeb3b499b0"
>  SRC_URI[libvirt.sha256sum] = "2306ef0947a594f91ec9da4b8b0307bdb54b897f17de19f48e8ecdca08ff35e8"
>  
> -inherit autotools gettext update-rc.d pkgconfig ptest systemd useradd
> +inherit autotools gettext update-rc.d pkgconfig ptest systemd useradd perlnative
>  USERADD_PACKAGES = "${PN}"
>  GROUPADD_PARAM_${PN} = "-r qemu; -r kvm"
>  USERADD_PARAM_${PN} = "-r -g qemu -G kvm qemu"
> -- 
> 2.21.0
> 

> 

