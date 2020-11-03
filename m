Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.4020.1604438961043699766
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Nov 2020 13:29:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UCd4+Kzw;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id s14so16643539qkg.11
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Nov 2020 13:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=dSvnmOATYE/pARhiChy3fm1a9ccmqSZZ7XzLCvgbtbM=;
        b=UCd4+KzwFJugnIPV9MmENZzYK6eG5hn7jEmX+0SOIL50tqSV2X65Dmro7Zfy0gF2rh
         UM1Gw775cEtd9E1cjUGfMeByMvVpBsMQHY3vwgsKqsEwfHfmv6LvcS0Oo0RHKIwDvoMb
         u9xTykF5lY6wngQlsK78b+ilGNEETpFKOfuqnb+sGr1/MlfSEEuVn4/gUQNBp4e/piYh
         UWV4e9FGQo6pD/d5DnCTSn9At/M1i6Z9CFLzY095s4ZEMa32hGeckaSLNpWBAT0YoVhH
         EH4AfNtCD9hV7kUiJybXJKMQPtR4iwT8gLcFglujEq29f9cCTVsaIIj/22XM3mdpvry+
         j4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dSvnmOATYE/pARhiChy3fm1a9ccmqSZZ7XzLCvgbtbM=;
        b=iVAmLEchJk+HZ5vp0LAg0CJhn6uh1noSjtJOpu5Ghse/GFV3Ed9uhtXXWd27gQLd9G
         ZptJeNs1T1cOI458Oub08XtJeABOKPaeiK+yAkOj1baOl9g5Eqo1HHeK1eKDwZs89FSr
         pOZX85KaS570QHUBpW4qlImKGzqKgNPSME8XEAfsICXTAWJQHjV1dd5QNqQGIa48KCxL
         foZF2R1UIBV6in0S5toVgs4CdJp3P+kGoOIcum+WnQb5+GMqokFTtycIiGi5mN94FA8D
         SMF9Gb0NXuIWSqpN/guhEbG+pVCr5uuIuTyNDcHQk6381aUQfod16mmbTW9vLjRNA29X
         jPtQ==
X-Gm-Message-State: AOAM533dmAwEjYQ2GKmdKz4lTLbkUcUjx/FC/wDf8ok4w0opAO6dVCKG
	6Ck+D44fzqhcvRIXiawPmOY=
X-Google-Smtp-Source: ABdhPJxRtot1IK2sXF7JC7NJ2xk0oXmJU5iPAsIQL55RtOdNc1+lxkzeN24szc8eA5X1bCLYAtOmKg==
X-Received: by 2002:a37:aa8b:: with SMTP id t133mr21549189qke.487.1604438960155;
        Tue, 03 Nov 2020 13:29:20 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id 9sm12129281qkv.110.2020.11.03.13.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 13:29:19 -0800 (PST)
Date: Tue, 3 Nov 2020 16:29:17 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd@arm.com,
	christopher.w.clark@gmail.com, cardoe@gentoo.org
Subject: Re: [meta-virtualization] [PATCH v2 2/2] xen: extend SYSROOT_DIRS to include installed binaries
Message-ID: <20201103212914.GA40662@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201027155536.12513-1-diego.sueiro@arm.com>
 <20201102081357.4975-1-diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

v2 looks good to me as well (FWIW: I had to do the same thing
when implementing initramfs and qemu to ensure that extra parts
of the qemu build were availble to recipes).

This is now merged.

Bruce


In message: [meta-virtualization] [PATCH v2 2/2] xen: extend SYSROOT_DIRS to include installed binaries
on 02/11/2020 Diego Sueiro wrote:

> If a recipe DEPENDS on xen we should include its binaries in the sysroot.
> The do_install task also ships files to /boot and /usr/lib64. Hence, extend
> SYSROOT_DIRS to include these paths.
> 
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
> Changes in v2:
>    - Updated commit subject and message
> 
>  recipes-extended/xen/xen-hypervisor.inc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
> index 6a75d16..916bd3c 100644
> --- a/recipes-extended/xen/xen-hypervisor.inc
> +++ b/recipes-extended/xen/xen-hypervisor.inc
> @@ -55,6 +55,8 @@ do_compile() {
>  do_install() {
>      oe_runmake DESTDIR="${D}" install-xen
>  }
> +# The do_install also ships files in /boot and /usr/lib64
> +SYSROOT_DIRS += "/boot ${exec_prefix}/lib64"
>  
>  do_deploy() {
>      install -d ${DEPLOYDIR}
> -- 
> 2.17.1
> 

> 
> 
> 


