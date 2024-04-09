Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7AA7C67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 14:14:01 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.137957.1712672034180948868
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Apr 2024 07:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YSIZ5uqR;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4349bba0ba3so13777851cf.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Apr 2024 07:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712672033; x=1713276833; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QjSLhGy5LKZn71q+2NIDeoiYG9O7oFIosLpQajHvmuY=;
        b=YSIZ5uqRcSlRgQirTYp04jhL8da9RYdAAhn+fCb862dZ1lyf6kAdUHsP27BUdEcVqg
         TBioNl1l8RDLUW0A+TvnwtNMV9Do9DgNaRmBvGY9QFBsagzRQkEaiNAne2bDMsL3yZ+1
         R7MxM//A9httGUxJJgAkaj+r35hZYxRJ2zScKOa/CnKedsEPTRYeU8qLVkvqTjqB3q6K
         KI4qc6Gp8Sp0Bz7mcTQT0u0WidW3UZk5gebyG8kt0kzVTFxZA9VU1kDFIZ5EzGsJaaHC
         XnUH9sZmJMHb2rq3s/DDcm5IacM3p/OU2shNaxhWx6McuVFaV60UiFe83mupZ6Ng6DRx
         VMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712672033; x=1713276833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjSLhGy5LKZn71q+2NIDeoiYG9O7oFIosLpQajHvmuY=;
        b=m0yoEXt9Mwn9TUgTyp6j6Q80nKPbj6apxGUmcSs0Ua1EeEybnW5ianDQ+pwG2uDB0a
         E0iZe9XzIlrgniZu6R62zSbRXrBRSPVLuvRUbSRP3zs5+PmECwFd3YaikkDUkom6B7iS
         jCZwlisSpswe4WyI/0/msXyHBTFA463Rd+wzSc+uDYQrbQrt3GSexdbUMevCN//lHW8L
         ojJI77vkJYPg83icDsZy1hnFAGm1RNduGJPEQLL9N2kVa38Tl9U60u7rPhVhiiVTBgex
         2gFgOMzQJx3EGHOkhDXd4P9sLFBX0wabUBskhaNFm5Pv1+CR6btx2ueXFeBNG/DSgTib
         YdTA==
X-Gm-Message-State: AOJu0Yymbw4nZal1SZ56wPaq30ZL6fUDC32QceODKbl3z51wzsB450Lo
	aXEx5n/ct/89rqWtlih1GuKR/tvyN4ghDPxJuPvSuVeWOoQvAqH7
X-Google-Smtp-Source: AGHT+IGJDE9iUsteL/7AvXI0/DIMTsHzUu5nPUFbA7mJOjwo3d6+V0Aw1O1WonT9+gCDQumsoNBIkw==
X-Received: by 2002:a05:622a:111:b0:432:ffcc:d0b8 with SMTP id u17-20020a05622a011100b00432ffccd0b8mr16342403qtw.11.1712672033156;
        Tue, 09 Apr 2024 07:13:53 -0700 (PDT)
Received: from gmail.com ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id g22-20020ac870d6000000b00434b5e1e4efsm1422166qtp.90.2024.04.09.07.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 07:13:52 -0700 (PDT)
Date: Tue, 9 Apr 2024 14:13:51 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH] libvirt: Update bbappend to
 10.%
Message-ID: <ZhVNHxOpBDVDdSQE@gmail.com>
References: <20240328125706.3946145-1-chaitanya.vadrevu@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328125706.3946145-1-chaitanya.vadrevu@ni.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Apr 2024 14:14:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8670

merged.

Bruce

In message: [meta-virtualization][m-c-s][PATCH] libvirt: Update bbappend to 10.%
on 28/03/2024 Chaitanya Vadrevu wrote:

> meta-virtualization has upgraded libvirt to 10.0.0
> 
> Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
> ---
>  .../libvirt/{libvirt_9.%.bbappend => libvirt_10.%.bbappend}       | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-openstack/recipes-extended/libvirt/{libvirt_9.%.bbappend => libvirt_10.%.bbappend} (100%)
> 
> diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_9.%.bbappend b/meta-openstack/recipes-extended/libvirt/libvirt_10.%.bbappend
> similarity index 100%
> rename from meta-openstack/recipes-extended/libvirt/libvirt_9.%.bbappend
> rename to meta-openstack/recipes-extended/libvirt/libvirt_10.%.bbappend
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8659): https://lists.yoctoproject.org/g/meta-virtualization/message/8659
> Mute This Topic: https://lists.yoctoproject.org/mt/105195885/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


