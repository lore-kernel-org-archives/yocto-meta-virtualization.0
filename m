Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web09.20073.1612705749242016482
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 07 Feb 2021 05:49:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B/KH6OPj;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id s77so11865985qke.4
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 07 Feb 2021 05:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dICUWO/XEsDgA+gYICFcV64gvDEkVZen1P6ogRHIF+U=;
        b=B/KH6OPjRC51IbPYHTFCfKLL/G5f1/3hnDxQ0GOWd3DRALXkt33h3ivsirwYKYSDBm
         BlZXchp3TsHhKOpdSQOxr9D3nKVc7Hmj19gzGOSON+apyQy7lt1C3Q2Px689W2Zlbt6z
         fpRXmkFQJH7u2skpyV8p2gwHpmqJyqggThqoHFPAMNXyytRKiOJMvIcnXh9cBauNYrSn
         dy6+SQmb2XwZOhGSVY6A/KwwbGsvVh0xWjhuB6BJ3dHXmj3Dzznc44+3v90goDUVc0O8
         +YENzjVh0ZhLH1OL/7mfW+Ems2i5nvvMRGgrYXO0ClH+maE+xOWU860Mttdiw7YDoWBj
         jCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dICUWO/XEsDgA+gYICFcV64gvDEkVZen1P6ogRHIF+U=;
        b=M3tOMBG68Dz7+A12pEP94Bsi05Q18R4+47VzWih3avPjnxKP5Zkk6UdscmBrx1k4C+
         viBGX5MBIDu3uiLEOd93ooULVbdyaFo5iLEL2T9mjUtGLlEIYOYfB0JIOvaeDwXdKC9t
         Ml3u5U85B68RYTyFGVW3JZXr+fmmiaqfRFmGTlnGYPLgxqkdM9dnWHiAKDtYPyYzqmNl
         yhoSxYxh522wzNGauYQrli+Q/0ByEJzFkkF/gS1xvyazaqlhWatDDRFJU/n4GclGxyQu
         ouRMhOlCyNlTZAWej3UuqeYu38F/FtMwKZ5HeGslSctGfIO0ByFrz5blojht2lQxd0VG
         5UnA==
X-Gm-Message-State: AOAM532WmUjT692EYLLOOGmWEfVg0HY9cGISJ1WOtYg8bftI7oalv1iB
	y9HOhyziiMu2v5V9Gvitl8Y=
X-Google-Smtp-Source: ABdhPJxDSFhIgouQi2VDl6DmAMKHaExpltr3bDPjO83mwvVQsSU+gqjTcGtKZtGs+k8FGhE2tV74aQ==
X-Received: by 2002:ae9:e110:: with SMTP id g16mr13395369qkm.19.1612705748393;
        Sun, 07 Feb 2021 05:49:08 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id t14sm14109256qkt.50.2021.02.07.05.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 05:49:07 -0800 (PST)
Date: Sun, 7 Feb 2021 08:49:06 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Yi Fan Yu <yifan.yu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] nagios-nsca: blacklist recipe due to unsupported libmcrypt
Message-ID: <20210207134905.GC48372@gmail.com>
References: <20210205215310.17125-1-yifan.yu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210205215310.17125-1-yifan.yu@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged (now we see if anyone notices the blacklist and asks!)

Bruce

In message: [meta-virtualization][PATCH] nagios-nsca: blacklist recipe due to unsupported libmcrypt
on 05/02/2021 Yi Fan Yu wrote:

> nagios-nsca depends on libmcrypt...
> However, libmcrypt is considered as abandonware
> The last release was in 2007.
> 
> libmcrypt might not be building properly with
> the upgrade of autoconf to 2.71.
> 
> Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> ---
>  recipes-extended/nagios/nagios-nsca_2.9.2.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-extended/nagios/nagios-nsca_2.9.2.bb b/recipes-extended/nagios/nagios-nsca_2.9.2.bb
> index d342810..66f8da5 100644
> --- a/recipes-extended/nagios/nagios-nsca_2.9.2.bb
> +++ b/recipes-extended/nagios/nagios-nsca_2.9.2.bb
> @@ -82,3 +82,5 @@ SYSTEMD_AUTO_ENABLE_${PN}-daemon = "enable"
>  INITSCRIPT_PACKAGES = "${PN}-daemon"
>  INITSCRIPT_NAME_${PN}-daemon = "nsca"
>  INITSCRIPT_PARAMS_${PN}-daemon = "defaults"
> +
> +PNBLACKLIST[nagios-nsca] ?= "Depends on libmcrypt, which is considered abandonware"
> -- 
> 2.29.2
> 

> 
> 
> 

