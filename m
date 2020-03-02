Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.1416.1583179878666080744
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Mar 2020 12:11:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tHnw/OOi;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id r15so543753qve.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 02 Mar 2020 12:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xo0p9jNhE9JZd+ttR92V84DMXN6oBGZi5AjmUSKslkI=;
        b=tHnw/OOiksqFoTOGOL/tCNq9QoEMZqFHQgmquIW2uWR8b0AnQu8xEU5Th6Eurazhza
         PL595I5G/MWNQLJbDodEiRe5XmL7vKEMFgH3geZDW3HrZWl6+enEvpJ5baC3y6W+rMdm
         48UROZunkRTSQGLTkKj7qMSUG95CMNEjFQdQulX8u6D6uY/jaPOYzhjWjf0MvEGDSm+C
         4QboQvykTk7ZfkuSAuVRPMPCwm/NorLvTwACSGBHlJF8xr+yk+/nB+PizfyoC2R2Qdw6
         6++Ce9PaD4F74u7bsucHDk6RRZhjU0O5L7LjNEMD9oU3Z6RmUp1okdJ3+by8Bl9Au3zs
         fNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xo0p9jNhE9JZd+ttR92V84DMXN6oBGZi5AjmUSKslkI=;
        b=lfeiMQi3ipZtHrq1rHzJIfMeytLiw8Fo2McsswtuDrcilXEpEamwayxEB8lfX3MVsF
         5YHH9tffuuDf9GC2vuGMLgY4tg4tJGl/l6TfchSXjHYu7Z8r+hrSeSNHK0KiPhCKA7VE
         GBa4KqKiU9+KvJzpHVs15ZQfNoAgHhGHftkcIoRCeTzgDitcST+gWp93nzRkXJRsadFJ
         DTczFMm9S324nLZS2gz7ana4buXWGvOawhnI+MGahJoyMi4mOVsEMV0I6tJwvDehzmwi
         o2QmZOMooADb+d0IjonzGMBKAWbCA0XHMk7xB3CpwEUgsMZQW7OJ/QQYm1P2GZBNgW/0
         ZD/Q==
X-Gm-Message-State: ANhLgQ1I6oCrxHWt4K1G0LY3dmmlsBJYSEPSLsBzt4mt4IUpivs7QhKW
	NltIDsh7TlXAMpFKkMXWFIY=
X-Google-Smtp-Source: ADFU+vugW2ktIGYb8P1IrKZNZkIr0jT8k/e0rZUvluPIP1LTtQBnQehUfXO+iZ+ueT5tljvF3yxvdw==
X-Received: by 2002:a0c:fecb:: with SMTP id z11mr1048640qvs.85.1583179877651;
        Mon, 02 Mar 2020 12:11:17 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id a141sm10847793qkb.50.2020.03.02.12.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 12:11:16 -0800 (PST)
Date: Mon, 2 Mar 2020 15:11:15 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH] linux-yocto: make FILESEXTRAPATHS explicit
Message-ID: <20200302201111.GA906@gmail.com>
References: <20200227222050.9084-1-jpuhlman@mvista.com>
MIME-Version: 1.0
In-Reply-To: <20200227222050.9084-1-jpuhlman@mvista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][m-c-s][PATCH] linux-yocto: make FILESEXTRAPATHS explicit
on 27/02/2020 Jeremy Puhlman wrote:

> Something changed in the processing order for FILESEXTRAPATHS, that when
> := is used, defaultpkgname gets used instead of ${PN} and looks as
> follows:
> 
> /project/../layers/meta-cloud-services/meta-openstack/recipes-kernel/linux/defaultpkgname/
> 
> Alter ${PN} to explictly linux-yocto to resolve the issue.
> 
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>  meta-openstack/recipes-kernel/linux/linux-yocto_openstack.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto_openstack.inc b/meta-openstack/recipes-kernel/linux/linux-yocto_openstack.inc
> index 843546c..cc774fe 100644
> --- a/meta-openstack/recipes-kernel/linux/linux-yocto_openstack.inc
> +++ b/meta-openstack/recipes-kernel/linux/linux-yocto_openstack.inc
> @@ -1,4 +1,4 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +FILESEXTRAPATHS_prepend := "${THISDIR}/linux-yocto:"
>  
>  SRC_URI += "file://enable-veth.cfg \
>              file://enable-iscsi-tcp.cfg \
> -- 
> 2.20.1
> 

> 

