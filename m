Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E35C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 17:50:30 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.1226.1714672227026865213
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 May 2024 10:50:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T0COrA+j;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-437c32af2efso50813231cf.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 02 May 2024 10:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714672226; x=1715277026; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=70ga+dVhaU2V/ZZVvmkH9qLZJ8Eyhi4XJ45P/4NXEog=;
        b=T0COrA+jyhyXrEeTlIXrs6exKty99EIOfb3WCMLWG33wlabpNlgEdxVW0USf8ABHfC
         aZpTgm80vF9V8IrpisShoD1C13fXxfmwEmHB3nMTloMQPsFefREflkbn9oSC/cUa9t1V
         s9QLYhoJtKZl47TCgWXetbk4psfCP6ri1IZlIRp2ovbtsEiYMNL0YRfzn14SbNQKz4KE
         p7cgvBuGLgKh0bewGe+2HarxFEmTccf80BfLf2cHpWZWzvh6ec/XM8Xt6D2K5ah/Srh7
         Tp/XfbD3X50sHguU0Z1KC0FUSv9hW7k3fSsbsmqW5CJ9G5uwKIYrmrYZx0VuGGJ7Ff54
         PErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714672226; x=1715277026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70ga+dVhaU2V/ZZVvmkH9qLZJ8Eyhi4XJ45P/4NXEog=;
        b=dRu8USjgOD2siiDuta30PiKwO7aFOhgRzKuPEQ6gJ6cB3xEG+4yFsvi94HqI0muLEz
         OpIgko0C2Qg7/K6aP/PtrcNei9ehmm17lDhpvSl13Ed+q/iGucduDOa8ARzaymqzpwtj
         8Fp7aSeS1LFUpxRUuHryESdZB02Jj4/KcT6xKrMJPeSO8KMdj29QupEGA+z1bVyy0Ndq
         XvNFlDEkeLaVbOWm0S2vgWEkiItM6rwsOVDKNDSUYjI56U5iYabT4/5BhSbwGZ3h+EeW
         QOCBF0gIFj0EGvlKKKxe7CgGpL2zX518qGuEqDyFHg6//ec6u+7mMZ+fCafYTqt8Z1HS
         i61w==
X-Gm-Message-State: AOJu0YwT3AEZdsv0AzQwwVZCwIIfa4PxFwlPXE4eH7sUStZPDk/8s6Jj
	g89NIUsmcsGexWMBkhWIJHS65vqDINpDCwmtWZye5dKHX1vOWl+krbhNng==
X-Google-Smtp-Source: AGHT+IFL9GCXHBqst837EUlTtMwJL75G22TQ8IZmL1Tn2Vf7cpEfpR5kUx2vRQi2n5d+xvXOP2lxLQ==
X-Received: by 2002:ac8:7dcd:0:b0:43a:bec1:37c with SMTP id c13-20020ac87dcd000000b0043abec1037cmr250584qte.66.1714672225841;
        Thu, 02 May 2024 10:50:25 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id ex8-20020a05622a518800b0043a51b452a3sm672226qtb.20.2024.05.02.10.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 10:50:25 -0700 (PDT)
Date: Thu, 2 May 2024 17:50:23 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: mingli.yu@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] ceph: Add the missing
 Upstream-Status Field
Message-ID: <ZjPSX7UPOKXs81em@gmail.com>
References: <20240429085657.1280729-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240429085657.1280729-1-mingli.yu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 02 May 2024 17:50:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8710

I'm not sure how that slipped through my tests, but I can also
see the issue now.

This is merged to master and scarthgap.

Bruce

In message: [meta-virtualization] [PATCH] ceph: Add the missing Upstream-Status Field
on 29/04/2024 Yu, Mingli via lists.yoctoproject.org wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Fixes:
>   INFO: Traceback (most recent call last):
>     File "/build/layers/oe-core/scripts/lib/checklayer/cases/common.py", line 87, in test_patches_upstream_status
>       self.assertEqual(len(patches), 0 , \
>   AssertionError: 1 != 0 : Found following patches with malformed or missing upstream status:
> /build/layers/meta-virtualization/recipes-extended/ceph/ceph/0001-delete-install-layout-deb.patch
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  recipes-extended/ceph/ceph/0001-delete-install-layout-deb.patch | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-extended/ceph/ceph/0001-delete-install-layout-deb.patch b/recipes-extended/ceph/ceph/0001-delete-install-layout-deb.patch
> index 91eacfa9..3cd8edba 100644
> --- a/recipes-extended/ceph/ceph/0001-delete-install-layout-deb.patch
> +++ b/recipes-extended/ceph/ceph/0001-delete-install-layout-deb.patch
> @@ -3,6 +3,8 @@ From: Chen Qi <Qi.Chen@windriver.com>
>  Date: Wed, 13 Mar 2024 03:41:47 -0700
>  Subject: [PATCH] delete install-layout=deb
>  
> +Upstream-Status: Pending
> +
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>  ---
>   cmake/modules/Distutils.cmake | 6 ------
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8703): https://lists.yoctoproject.org/g/meta-virtualization/message/8703
> Mute This Topic: https://lists.yoctoproject.org/mt/105797118/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


