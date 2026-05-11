Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A530DCD484E
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 20:17:34 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60057.1778530647608381392
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 May 2026 13:17:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=f/FsRkI3;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8b4000e51fdso47970166d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 11 May 2026 13:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778530646; x=1779135446; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9vXb/FbZfrOW3xn0KReDJyupQjE5mtUqIROV4qq754g=;
        b=f/FsRkI3uou+pcyJs5aqdr1ei07SX83NOiP6JUupYXb5C5Ya4ZHAYNbvOtNDcNWrMd
         ga3HV4AbHDzmRd9g7rHFTT0uq3QRj+18uuGKe0QY2fWKv0XVIteyj4O5JaUq/2rFTvE+
         VWFdxkSgFGUfmukfCjK1zVnVGYBpkMGk3o8VSycbYNgkC/c6iWHXkoaaAyXLhJma6LxA
         DrM3Xxz1hN+TtkKg05dcZ3BX8LohSq5p18r9ClAuDZTvo58yafjv58wTnbhS3mE1gFfB
         iFdKIvVgqsPQzF3paDd51sYEPOoh4d4lGXurMD8aKDw+rqRiSy8n7o0keaOko4vzWa6T
         Gh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778530646; x=1779135446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vXb/FbZfrOW3xn0KReDJyupQjE5mtUqIROV4qq754g=;
        b=BXE9KLTT6/LPxbKLiKNWs7JgZ1suW6+XJOI/QzXhO4IhXAuVqq590PMDNr8hdAbCdW
         H4KKcx3fVs5TlgWpLVv8p4tTrtuMKMxzMlal7WwK5th8nFXdvaix2ziOvCbOsUzD0TYg
         YpyMcTkQmvvztxchnvmOG2XI3wii3RARqK03L6A5EhmSEDwSvrNC1wFFbhCi5R+2uiCm
         pxEXWnffkJnqFM2GzFUYEoe72mVoRxwsrccAAIIj/X4AgswaGeee8aOXE+6LDLuF9A4G
         h48NCsXtHgbgVRyxTIWaUhxctbLmL7hcOuyofv8sHYf6sWRAZ7dzLhUMHZXStMcKHMbC
         0MPw==
X-Gm-Message-State: AOJu0Yzb4+VyLPa2MvvmpIEPF8xW33DnKKyOVu7BxY+9mYIg/ZxJ/dqU
	BkJagyvJqSSqxuL2olaLU7P/TLuDXgvihjh8+5JwCZGOfoeguYbT4v1iubgQdL7EDu4RJw==
X-Gm-Gg: Acq92OGKseqgQsR60y+7MjELvTV/Tt0KdaygXBmlQ+xB/yVQI1bGsKFxAKCCYMRK2+y
	J+hEZk+HUsdkQfGZef9ixRVz2Pkih6YqXN+jA2hpTgoMif7l5obpA2U7Ik+fneCD8aodvX3VYRZ
	SrzF7bXgPOEk+iNUzPC3zpuNzL9CbUzeswpFrWV4rwXYGTDo423sP+UksGFbYArK2v/YlD+TXon
	zwyQvNFgHPQw2RTUlpxraVw/ZJTBAuGEDAdEOuXSKMjI0kBQMNuDBdNP+2SX5RVw/O2J6p4TSh1
	OJn3aklbITXv50sjFju4gBrrUI6WHF9mvuWBoCe+LQlHhAIpcq2S0LpfAAjVeoIDH47tkIWsxmR
	pG1Gl8Mls3IK8+bKrRxcG0fbe328e7XDEYN8LfZRIgcXgnwW64t3cjRUokuMgAS4P6wk8gm13PL
	DRZMLm3c4htsMGLeIc9UZ7/TgwFfl1iDLM2vpOXBbFhNiZA/Fanum3h3pnaNx+Jgfiq+vzxj/4K
	B2OowvotUsAJGYeGyon/Bt25yNrs2uSunnk
X-Received: by 2002:a05:6214:268c:b0:8b3:fb6a:d35d with SMTP id 6a1803df08f44-8c1b0570a36mr181940556d6.47.1778530646391;
        Mon, 11 May 2026 13:17:26 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3a438e3csm103924256d6.19.2026.05.11.13.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:17:25 -0700 (PDT)
Date: Mon, 11 May 2026 20:17:24 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: wangmy@fujitsu.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [meta-cloud-services] [PATCH] iproute2:
 upgrade bbappend to 7.%
Message-ID: <agI5VHPp1LCviESj@gmail.com>
References: <20260508055141.351-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508055141.351-1-wangmy@fujitsu.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 May 2026 20:17:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9793

merged.

Bruce

In message: [meta-virtualization] [meta-cloud-services] [PATCH] iproute2: upgrade bbappend to 7.%
on 08/05/2026 wangmy via lists.yoctoproject.org wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Compatibility with OE-core nanbield.
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../iproute2/{iproute2_6.%.bbappend => iproute2_7.%.bbappend}     | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-openstack/recipes-support/iproute2/{iproute2_6.%.bbappend => iproute2_7.%.bbappend} (100%)
> 
> diff --git a/meta-openstack/recipes-support/iproute2/iproute2_6.%.bbappend b/meta-openstack/recipes-support/iproute2/iproute2_7.%.bbappend
> similarity index 100%
> rename from meta-openstack/recipes-support/iproute2/iproute2_6.%.bbappend
> rename to meta-openstack/recipes-support/iproute2/iproute2_7.%.bbappend
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9789): https://lists.yoctoproject.org/g/meta-virtualization/message/9789
> Mute This Topic: https://lists.yoctoproject.org/mt/119210120/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


