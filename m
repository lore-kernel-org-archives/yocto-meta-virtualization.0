Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.3029.1583283832760972419
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Mar 2020 17:03:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CFQzGa+n;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id u10so76353qvi.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Mar 2020 17:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zIkfXP31wXq1gdzjPJEqYtsXInaKkEamdIOOTy11wdE=;
        b=CFQzGa+nrw6GaAPbx0n3PhHZ1mUdVGmu05yJooaMzV8KPIQk2ATqpUo6mNXUp0bTE0
         ilctQ6PXX7WVK14UQGkq9o/889tx38Jdex/G9UVcUQ6C2qMDCR3XSp2hW6tk5xvhztHY
         agU0JlqUZ66b0V9P4hOTo4pe5A3VSuAsG/2clypnQKgxLu9JH8TgmK9FfktiCehb2YvA
         3+U8NNw8p9YPPT9xFvHZ4t3spc2P404dTqWipayyaI7Rtf4rlW3jVbU2gt+p8oLnvogM
         KA6V8g+7eT/4tswKbFz0pX7qAnBWQqhw0lz7FRLQGHuCrGywwDUO90yMEVNVDAUiX940
         8StQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zIkfXP31wXq1gdzjPJEqYtsXInaKkEamdIOOTy11wdE=;
        b=b0hHCxDuYnrZeay2Tnr+y8o0/pu3W0XdN7t0LMSD4o32w6jKSmZQkwOY0ZFTdjBirh
         0AQw4QEyaBUWDgEiAkVrz9w3JhEW/JcE5CBydFaIUUkhEbpc3fpbNl0krceLHqouSfAx
         mEY5eYxsZFt5s84Ex7caah5qPrtQQ7EH+JAotDPhm0ZSHy6cmiQbYfTwcs3lZEaWnqFI
         kCK27Spazb9v0JRYS2jPd6YDioeVNxsP9OIIKZ1fG6UL8tFiUMkfZmHKr+0bzvYP9LVg
         q20vvV0fEzkc2BSkhynqr73YGTXLdJaVLcfzoyoTeNiQ9p0ua9wKr7UmFjjrjpxGSrZ+
         UsDw==
X-Gm-Message-State: ANhLgQ1rYWSfl/9FR6UF35VpVOY0s0Va8ef3Cr7DsJ98yMAEO+w4djpw
	P/7eAs1o7i97z4iOmBby1sI=
X-Google-Smtp-Source: ADFU+vsFTrTzdbx4S6HxSSUBv/LfCIxocLRMHRjP3Z+aMY+Fie/+HkanaSRRlHEhQDRwHyC3V/36Hg==
X-Received: by 2002:a0c:fc46:: with SMTP id w6mr1937qvp.46.1583283831917;
        Tue, 03 Mar 2020 17:03:51 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id w10sm2828977qtt.5.2020.03.03.17.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 17:03:51 -0800 (PST)
Date: Tue, 3 Mar 2020 20:03:49 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 1/2] xen-tools: fix COMPATIBLE_HOST restriction for i686
Message-ID: <20200304010348.GB39743@gmail.com>
References: <20200303141036.5833-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200303141036.5833-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


merged.

Bruce

In message: [meta-virtualization][PATCH 1/2] xen-tools: fix COMPATIBLE_HOST restriction for i686
on 03/03/2020 Martin Jansa wrote:

> * let TARGET_VENDOR to be set to something else than the default:
>   meta/conf/bitbake.conf:TARGET_VENDOR = "-oe"
>   like other architectures use
> ---
>  recipes-extended/xen/xen-tools.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
> index 8bdbfec..8b86f7b 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -1,7 +1,7 @@
>  SUMMARY = "Xen hypervisor tools"
>  DESCRIPTION = "Tools and utility software for the Xen hypervisor"
>  
> -COMPATIBLE_HOST = 'i686-oe-linux|(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
> +COMPATIBLE_HOST = 'i686-.*-linux|(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
>  
>  inherit setuptools3 update-rc.d systemd deploy
>  require xen-blktap.inc
> -- 
> 2.20.1
> 

> 

