Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8224C10DC1
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 22:19:44 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.83745.1701728381230379615
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 04 Dec 2023 14:19:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fu2UrfQf;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-67ab19339b4so18334666d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 04 Dec 2023 14:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701728380; x=1702333180; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xIcUEaB9NH6LygXr2+FQEHA4tvlo6Pk3x46fQHNLJgw=;
        b=fu2UrfQfeA31qZlJAavznGzZouwbZxugyM1dre5vZ1cnRLMV35/0FYE0AzFsyqpqEe
         tOJPBZyiORCpq4nkk98Igw6dV102mS6pr5G7gWrdKsmbRjFHp8fJpVCQreKsSca1syM/
         tX4N9Ofe+qq+urPb3YEjB/NXJcvs1FXfwpAFVDgJO8OKAx6nIf3NPdr1LeB8NPAy2P+J
         9CvoP+va7JBs5UtYwkJT5soCXMK0ip1qVBAeiBLBZ9HrZjAI9ve8LOydmfpsl6CxOeJ5
         7ASUGc8gQP608LVRCfrsIF8uR+Ida26elZzGwKPiByl6m1Ck47MSxDg5O6HDCWFZ5T8i
         WFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701728380; x=1702333180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIcUEaB9NH6LygXr2+FQEHA4tvlo6Pk3x46fQHNLJgw=;
        b=xMKLDulPeS42ZaHbeSz+vvc+7iHe40ySoXjwPQ5yrtKELw1xKdZPQgPvu1bTfaFCtj
         DBtzGnillM7n3vdgIN4TDbRPLrk2Co0/T7fVAsdVn5I9yHjRy1TGZ1YHnOYZnA1RYg8w
         lteHy3SXAbeYUlV7TBizx40LCI487WmL/oYzGVPbcP/rW8w8GaE7on7vw/gdAIkk13Pq
         RUBHRuWTY4biI2pp6tjvAgb6Xxf0ycGEo5LwgZB3PPWm3m8TBvDtgIq2k+pkQfaMYCpu
         P0wsLdDtqbEjH/PZ/iHm1GiejfZ3nY0bxzGP9wknbswWP4plNO70bONdovHcJwV64Srs
         J/Pg==
X-Gm-Message-State: AOJu0YwL4wrWgGYNd0BzT7qLuvDRQXlqx9PI3IOyumo8cfoSqjdn2dey
	e+ez+UJ8rla713M6JY5yFKg=
X-Google-Smtp-Source: AGHT+IERCS3xJetJRpS2wsAYjODaXEngvz7METnQBkH/iDBIryi6q8G4xiahADfUclEu2zUDYj7WJw==
X-Received: by 2002:ad4:5305:0:b0:67a:9eca:fea4 with SMTP id y5-20020ad45305000000b0067a9ecafea4mr360148qvr.33.1701728380066;
        Mon, 04 Dec 2023 14:19:40 -0800 (PST)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id r8-20020a0c8d08000000b0067a18167533sm4651331qvb.83.2023.12.04.14.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 14:19:39 -0800 (PST)
Date: Mon, 4 Dec 2023 22:19:37 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] libvirt: fix missing dmidecode on
 arm/aarch64 platform
Message-ID: <ZW5QeZUAvbVM7Gob@gmail.com>
References: <20231130085332.1352490-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130085332.1352490-1-xiangyu.chen@eng.windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 04 Dec 2023 22:19:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8487

merged.

Bruce

In message: [meta-virtualization][PATCH] libvirt: fix missing dmidecode on arm/aarch64 platform
on 30/11/2023 Xiangyu Chen wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> When using libvirtd on aarch64 platform, after system bootup, the log of libvirtd
> contains an error as below:
> 
> libvirtd[417]: internal error: Child process (/usr/sbin/dmidecode -q -t 0,1,2,3,4,11,17) 
> unexpected exit status 127: 
> libvirt:  error : cannot execute binary /usr/sbin/dmidecode: No such file or directory
> 
> After checking the libvirt source code, the arm/aarch64 also try to call dmidecode to get
> the system information[1], so add the dmidecode as depends under arm and aarch64 platform.
> 
> Ref:
> [1] https://github.com/libvirt/libvirt/blob/master/src/util/virsysinfo.c#L429
> 
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_9.6.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-extended/libvirt/libvirt_9.6.0.bb b/recipes-extended/libvirt/libvirt_9.6.0.bb
> index c5d0d2cd..b63087e8 100644
> --- a/recipes-extended/libvirt/libvirt_9.6.0.bb
> +++ b/recipes-extended/libvirt/libvirt_9.6.0.bb
> @@ -18,6 +18,8 @@ RDEPENDS:${PN} = "gettext-runtime"
>  RDEPENDS:libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq netcat-openbsd ebtables"
>  RDEPENDS:libvirt-libvirtd:append:x86-64 = " dmidecode"
>  RDEPENDS:libvirt-libvirtd:append:x86 = " dmidecode"
> +RDEPENDS:libvirt-libvirtd:append:arm = " dmidecode"
> +RDEPENDS:libvirt-libvirtd:append:aarch64 = " dmidecode"
>  
>  #connman blocks the 53 port and libvirtd can't start its DNS service
>  RCONFLICTS:${PN}_libvirtd = "connman"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8483): https://lists.yoctoproject.org/g/meta-virtualization/message/8483
> Mute This Topic: https://lists.yoctoproject.org/mt/102890540/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


