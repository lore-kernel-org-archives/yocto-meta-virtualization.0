Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A785DC00140
	for <webhook@archiver.kernel.org>; Sun, 21 Aug 2022 03:22:45 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.3589.1661052163517530873
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 20 Aug 2022 20:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FkolcQJ0;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id j6so5800796qkl.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 20 Aug 2022 20:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=diEHWv6KgzSN51mSf8HRoDXQ8c53Y6F7eMvmg9rk76Y=;
        b=FkolcQJ0CxQHBkvqfJfQ7NYulyeuqusIWDtUJti+3HzEaSO6aP4IsEEj4vPFWQXMev
         3bKOAMjZdco7Bp56s/seuTA4pMeCROyo/k+ue9Rq9ev47rMGQ4udZqZG2cmZ35hvbGgn
         p8pzKBqZpYXQomFkGFSudcFJEjvgrhLzPXSndzt76453A+x8bE9tZTLxjVdyiGv5PI3+
         WhTa5jAbhnIqEziqDX1orAPmTdVmDoUWDkjQBMFDelm5PsYIwuPBzCylmc/PsF4RoV3Q
         o9/pHDeySpXVMDnH9gxWFZR6vUV6fcu7kNKZwHoXP5j4ecyM0NxIPgJKay8EyJ5RUIXN
         v4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=diEHWv6KgzSN51mSf8HRoDXQ8c53Y6F7eMvmg9rk76Y=;
        b=qpGsDEzXHTlA0ogiw+S6kc/kg6PSUJaEHzGUAwmyKEGbzQ17Om9EqvXM7JHHdab2Qr
         r2IrnUEUmFmiEv1S6BuU80O6nDbTX7qJxxa2x491yVz9kdhSSbVtD9VEHopi1iaAQFne
         +wcKh8767S1apnB+dwrCSVYDSP1vj3hv9Uq9voEWNL753RtqexgDTdnx4JnxVWbOcrD1
         JYP1J1A+2rL7V/mC2WzDxGUmm3AbQL0jurXPxbJYVPICgQCMCNITd8TS9e63MRQJU25B
         E3NEZfr3VgzNmM+cXKllIitHni7a+QecPAVr0pOtgygd/1CzXsL/lq4A+Fe6H0jyFjLf
         bdTw==
X-Gm-Message-State: ACgBeo3zjDnos9YAJ4/+08Yb5Seqry0FTwvwihAq3rwmEVwsUna9J1RZ
	3snf3U0eRYJIU+59UunzkPSsY6uZEDI=
X-Google-Smtp-Source: 
 AA6agR4pCaMlAkCaKrgyxKRRGMJF331SKKxCrw9T/U11hag9eSaF3CaZrLtMNIksZrLxT3CM9u6vVg==
X-Received: by 2002:a05:620a:f0f:b0:6b8:fe18:d4f8 with SMTP id
 v15-20020a05620a0f0f00b006b8fe18d4f8mr9372467qkl.231.1661052162445;
        Sat, 20 Aug 2022 20:22:42 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 r19-20020a05620a299300b006b555509398sm7780052qkp.136.2022.08.20.20.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 20:22:41 -0700 (PDT)
Date: Sat, 20 Aug 2022 23:22:39 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: sakib.sajal@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [kirkstone][meta-virtualization][PATCH] ceph: upgrade v15.2.15
 -> v15.2.17
Message-ID: <20220821032238.GC57389@gmail.com>
References: <20220815210243.25546-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220815210243.25546-1-sakib.sajal@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 21 Aug 2022 03:22:45 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7550

merged.

Bruce

In message: [kirkstone][meta-virtualization][PATCH] ceph: upgrade v15.2.15 -> v15.2.17
on 15/08/2022 sakib.sajal@windriver.com wrote:

> Upgrade ceph to latest v15.x.
> Minor upgrade containing fix for CVE-2022-0670.
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  recipes-extended/ceph/{ceph_15.2.15.bb => ceph_15.2.17.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename recipes-extended/ceph/{ceph_15.2.15.bb => ceph_15.2.17.bb} (98%)
> 
> diff --git a/recipes-extended/ceph/ceph_15.2.15.bb b/recipes-extended/ceph/ceph_15.2.17.bb
> similarity index 98%
> rename from recipes-extended/ceph/ceph_15.2.15.bb
> rename to recipes-extended/ceph/ceph_15.2.17.bb
> index 17dbcf3..9fb2e72 100644
> --- a/recipes-extended/ceph/ceph_15.2.15.bb
> +++ b/recipes-extended/ceph/ceph_15.2.17.bb
> @@ -16,7 +16,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>             file://0001-SnappyCompressor.h-fix-snappy-compiler-error.patch \
>  "
>  
> -SRC_URI[sha256sum] = "5dccdaff2ebe18d435b32bfc06f8b5f474bf6ac0432a6a07d144b7c56700d0bf"
> +SRC_URI[sha256sum] = "d8efe4996aeb01dd2f1cc939c5e434e5a7e2aeaf3f659c0510ffd550477a32e2"
>  
>  DEPENDS = "boost bzip2 curl expat gperf-native \
>             keyutils libaio libibverbs lz4 \
> -- 
> 2.33.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7523): https://lists.yoctoproject.org/g/meta-virtualization/message/7523
> Mute This Topic: https://lists.yoctoproject.org/mt/93046468/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


