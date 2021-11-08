Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web08.45381.1636381179975699288
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 08 Nov 2021 06:19:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ntImimG9;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id gu12so4549958qvb.6
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 08 Nov 2021 06:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PD4Tvh+yN2iEwiry8oo4FaSOoJXjPALk0xYsxCwJx70=;
        b=ntImimG9bpmeSExVrnUXesBDC9qdm65G/oAacVV1A+rdW+xT5HAK+lM13t+mgV8dqa
         fBx0D5pACCHP4ZnWt3c2QgsW4OsQqeOMAltkrZKjEozwjIIJhuM3+ePAcbX54KplZNnT
         ccRTScQEkenThJQd4bsyRci/3O5ZX1C/Ps95e7KMmRts02jDumMK49RVIJYzuFpjWUan
         dxvKSGo6fncVskhVs6MNXa6SMfAFkRIeeFQ2E3aod/Qfp7BHGrRKvUFKYdGnQoQd8udY
         DE/tpbK3x6CUHGBV5YbpFpOIwPw5OcrdjbSrc0L5gjtvNhkrS6Y3JJYpg9NWNVwCJ6BF
         BWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PD4Tvh+yN2iEwiry8oo4FaSOoJXjPALk0xYsxCwJx70=;
        b=vSh1+Z/kZJe4snEtD13TMdeiOwxdMujXYsyVkcDHASXYVQN88nAvwgS7kPnZi8GGcm
         b8aGOzA5pWB91W5rfWpSLWYl9PzMgsMs0Dk7VQGZ0LUU30KxaPIglF+VCoMqc8otvwn4
         qIMpWved9YrVHoDKcmzU0G9rlDKxGfpXZ2oMYujSibcM1zf6IpbkbecdF/XC0q/Ktqmu
         cx6g2VotvebZXNJme0iccgjYVGlTHJj24aDJGNSUUGi/B53InVCEJPxilBNt5Vh9x9Aj
         AzbEyvoYxk/JrvbghT/Ou6a+l8H5nmcQbALA4Tc7nXFD1FdfeNJCfnHVmn0/b9UvpYct
         Xz8w==
X-Gm-Message-State: AOAM531BfKfqLXx0YCizBtwOTtXJvTnQkLshNeRW6j6gKU4fVKpiPj9m
	BsM6RXmvNn495BEMh4Lk78w=
X-Google-Smtp-Source: ABdhPJyu4kD5nvbR36janpXj7G8vBA7JoD2LRX/Ve8Ho5vcUIxBABgjvGI6AOLLoMp/Xz/UqPS+I4A==
X-Received: by 2002:ad4:5d63:: with SMTP id fn3mr19082082qvb.5.1636381179095;
        Mon, 08 Nov 2021 06:19:39 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id j13sm10338594qkp.111.2021.11.08.06.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 06:19:38 -0800 (PST)
Date: Mon, 8 Nov 2021 09:19:37 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 1/2] irqbalance: bump SRCREV to latest
Message-ID: <20211108141934.GA18783@gmail.com>
References: <20211107173723.700787-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20211107173723.700787-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][PATCH 1/2] irqbalance: bump SRCREV to latest
on 07/11/2021 Martin Jansa wrote:

> * remove the incorrect comment about SRCREV being 1.7.0
> * and add +git because the old SRCREV wasn't matching
>   with 1.8.0 tag as well
> 
> * add -Wno-error=format-security to work around build failures with newer ncurses-6.3 like:
>   | ../git/ui/ui.c:45:32: error: format not a string literal and no format arguments [-Werror=format-security]
>   |    45 |         mvprintw(LINES - 1, 0, footer);
>   |       |                                ^~~~~~

Thanks for the cleanup! This is now merged.

Bruce

> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-extended/irqbalance/irqbalance_git.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-extended/irqbalance/irqbalance_git.bb b/recipes-extended/irqbalance/irqbalance_git.bb
> index 0911201..5761185 100644
> --- a/recipes-extended/irqbalance/irqbalance_git.bb
> +++ b/recipes-extended/irqbalance/irqbalance_git.bb
> @@ -4,10 +4,8 @@
>  
>  require irqbalance.inc
>  
> -# commit tagged as version 1.7.0
> -#
> -SRCREV = "bd5aaf5a8613c8eadfbf9f0908fd8260125aae28"
> -PV = "1.8.0"
> +SRCREV = "a97266548398870c2dde034e48a8c9e3c1893acb"
> +PV = "1.8.0+git${SRCPV}"
>  
>  SRC_URI = "git://github.com/Irqbalance/irqbalance;branch=master;protocol=https \
>             file://add-initscript.patch \
> @@ -16,3 +14,5 @@ SRC_URI = "git://github.com/Irqbalance/irqbalance;branch=master;protocol=https \
>            "
>  
>  S = "${WORKDIR}/git"
> +
> +CFLAGS += "-Wno-error=format-security"
> -- 
> 2.32.0
> 

> 
> 
> 

