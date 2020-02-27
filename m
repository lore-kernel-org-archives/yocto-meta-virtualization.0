Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web10.1250.1582840633887924120
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Feb 2020 13:57:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lwsJEK6c;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id ff2so410104qvb.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Feb 2020 13:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nKghVMkzjoNav50A5PM++EPlADQLvruf6dIAXB2A364=;
        b=lwsJEK6cO7/icoj0/QlFy2DiLtAasnRpyBelMorzIZChyl9IGsHNBvjQ+d6G+MNBeG
         FZS5bo5tEpbLLd0XQgSphqefAK6CcT7BqppulggQszd3rd8ygM6nB5IF5rSPQicEXfS/
         B2NkwvwlLWH6IAi1QG3qwzY4RP3CtGJ2I4Ho27lLqFXf2gnM2wmYT6C+d4WkANcU+Bry
         U27XGb3L+Hi6QwkQ85Ez8f4NKQdA2fALoQMknUes1oDk3GGX6yjrU21DoA+WUXdKiTlI
         uR2lOvYmJcqrhEQS85YiAHcBvniHXBiG0dfppuynmwJgJdgmHDpFjhqJ8OFoIwUp0XaY
         l3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nKghVMkzjoNav50A5PM++EPlADQLvruf6dIAXB2A364=;
        b=bGhQtNydaZgYNZMLAGRHCL19xzwLNXwDmEane/tVBDyt8jWDYv2XRzLr9qSYGGq3yJ
         2xQUx4hjmgyG+Ys1BHnrk9lTzVXW42M2CzsIjZI8egCQI9XlGXaiPNGIJcV1KUl7KgNs
         bsoD9WgjrQIKK0ltAnaZd6j8poVwD2qAdfjNZAI9uW1uo5gMZQL6sFANokTuKk4R+qLX
         z/KcqeaeFTGN/J4NXWsgwwf0cVCojDOttWuAsRTG7dIVhbSY9CIoez8eJKiXVYQRpr5J
         cBG39eBooLAewH1uBVe1Oz50WlcYjF6Hbiv9xFm58LMU3u8qf9fMVPL6sYtfgb9zDAhS
         eeHQ==
X-Gm-Message-State: APjAAAXcQDGvBrZmkJHFyv630zj2tGX6AdtWT97U4txhCWwIQH5m+Rjl
	i8rurlUPco89Wi5TEINOO8Q=
X-Google-Smtp-Source: APXvYqx0RrjLMTBcKgPM5GuiZp9aYhMvAC74ZwNCYZ3gzT7J9VYICJBaQEgNXtStYozBoagYDU+tsQ==
X-Received: by 2002:a0c:e0d4:: with SMTP id x20mr1176754qvk.50.1582840632852;
        Thu, 27 Feb 2020 13:57:12 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE98dac44fc29f-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.255.134])
        by smtp.gmail.com with ESMTPSA id p2sm3303955qkm.64.2020.02.27.13.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 13:57:12 -0800 (PST)
Date: Thu, 27 Feb 2020 16:57:10 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-virtualization] [PATCH] Xen: fix do_deploy dependencies
Message-ID: <20200227215710.GB36079@gmail.com>
References: <20200214101719.6674-1-bertrand.marquis@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200214101719.6674-1-bertrand.marquis@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


merged.

Bruce

In message: [meta-virtualization] [PATCH] Xen: fix do_deploy dependencies
on 14/02/2020 Bertrand Marquis wrote:

> do_deploy is using the files installed during do_install and it must be
> executed after it but before do_build. This is fixing SSTATE behaviour
> which had previously an empty scene in some cases.
> 
> Change-Id: I04b1f652c697ed0bc7e262571dd03e123ac096f6
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  recipes-extended/xen/xen.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 36ab78e..41b1983 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -1099,7 +1099,9 @@ do_deploy() {
>      fi
>  }
>  
> -addtask deploy after do_populate_sysroot
> +# do_deploy is using files created during do_install so force it to be called
> +# after do_install but before do_build
> +addtask deploy before do_build after do_install
>  
>  # Enable use of menuconfig directly from bitbake and also within the devshell
>  OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO"
> -- 
> 2.17.1
> 

> 

