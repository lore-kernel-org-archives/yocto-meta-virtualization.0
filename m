Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.1175.1587952132693209371
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 26 Apr 2020 18:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pJsSdZmJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id 71so13061835qtc.12
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 26 Apr 2020 18:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Y9rgOhjzL/LahEV7IAlRi9e155gcaAyQARQYZ+Tg2QI=;
        b=pJsSdZmJyTZxxaE7jp2GAZm4EoCT49BUMueHJuivsKk9zybl6HhSRxTVk3LWXvRlre
         2aqp/fPMH+rwGQA4jaW4lx7wC1WpkHoi51cjf2EzWtNMoK7jaxxc0xwIZotveefyuxfl
         RtColS5T+zy4CmEMv/OVybvSp6E+AOZDM8xp65sZ9pvalKlghh8hcyS20isVq3zsugJi
         N9qtPpQ5L8NL2NWjF1+VQA6mJ1SWoceZhIEhICFpOrln5aPFLZeSIYRRSf4Xjd1iptXT
         0AyjtDxm4Krs4Zb0+Aj0o6OS1UDUG3nJc782f9FKkQke+yTj9zk7qK54RgpLrqPFf+s/
         rsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y9rgOhjzL/LahEV7IAlRi9e155gcaAyQARQYZ+Tg2QI=;
        b=kSBFyukcJ+ZFyhjWw7ekqPzKzFqPAsWhmmWf7yhx4OAeAelPkXI3nxf2m3pbG8NOFA
         NE9uRZLOlw7t+CjeuHMK8yaQJL0kTqbi7Htmn3M0YNml7q9cvXAmgGHih1oNEy5rQvxT
         Tkj5prXnCSihmUOgCJ6+Uvdax7I8qReTB9/UC45C632mm9764Seex6pP33fOYFre1f29
         rENDUFHvxxHWiJFMtXUDTcZ53SLgY4AE0wLkO2uT3HH5rgzruWqJhF6Btcjs80Dk1IXC
         7VxANmTFqGl1DTu2ePqL+y8pXJG+wB7FNUbep1hHeisKTiIyXXIHIEOXI/3kAHeIioVc
         lxvg==
X-Gm-Message-State: AGi0PuaDU6y6yEyQ9Y8yZXipI9LWwmEo5Ao1FGy67nATmun1OsmDoFnp
	HBEeLhYJWx7FYxkqsCTQiN8=
X-Google-Smtp-Source: APiQypJgsC3wiblf57V/Kf1pVG3jLrllGkCWMGhqqdRtuRXh3S1SfrRHBELbumjS2pkKWLq3HRQg4g==
X-Received: by 2002:ac8:4c9d:: with SMTP id j29mr21902867qtv.297.1587952131821;
        Sun, 26 Apr 2020 18:48:51 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id 202sm8631829qko.135.2020.04.26.18.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2020 18:48:51 -0700 (PDT)
Date: Sun, 26 Apr 2020 21:48:49 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Corey Minyard <cminyard@mvista.com>
Subject: Re: [meta-virtualization][master,dunfell][PATCH] xen-hypervisor: Check for the right image in uncompressed deploy
Message-ID: <20200427014848.GB19175@gmail.com>
References: <20200420171739.12379-1-jpuhlman@mvista.com>
MIME-Version: 1.0
In-Reply-To: <20200420171739.12379-1-jpuhlman@mvista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce


In message: [meta-virtualization][master,dunfell][PATCH] xen-hypervisor: Check for the right image in uncompressed deploy
on 20/04/2020 Jeremy Puhlman wrote:

> From: Corey Minyard <cminyard@mvista.com>
> 
> The deploy for the uncompressed image was checking if a .gz file exists,
> it should instead check for a straight xen file.
> 
> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>  recipes-extended/xen/xen-hypervisor.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
> index 21d9c7f..c386917 100644
> --- a/recipes-extended/xen/xen-hypervisor.inc
> +++ b/recipes-extended/xen/xen-hypervisor.inc
> @@ -47,7 +47,7 @@ do_install() {
>  do_deploy() {
>      install -d ${DEPLOYDIR}
>  
> -    if [ -f ${B}/xen/xen.gz ]; then
> +    if [ -f ${B}/xen/xen ]; then
>          install -m 0644 ${B}/xen/xen ${DEPLOYDIR}/xen-${MACHINE}
>      fi
>  
> -- 
> 2.20.1
> 

> 

