Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EABDC36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 04:05:10 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.829.1744171508176896003
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 08 Apr 2025 21:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZT1N3GMd;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ecfc7ed0c1so53923066d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Apr 2025 21:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744171507; x=1744776307; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RJ4nm1f2gfF/L+c+IXgX0HbHH9luA8EuVn/32w617wA=;
        b=ZT1N3GMd/Ni4XZWdSW2eONrMT66U7OZRdjMm/ogUhgdC3pdKjVGg0PuC9lACA9IodV
         oS70w/stj95p6gFp7qm+mwTcsjesH1UW8pIgQJ8+qAV6KBjCv9E5nRqmKPjK1tDcpLXW
         nkatl0N17L6/pX/6mSfpSAsj5rUXn2liwY9qOSEDK/isuWXsDA/+Nm1RVu1xAb0+X6FD
         C+yR35dEWK4u+ZSBX21od4N1eL0k28Y+EM04/gzI34co9hYQCIwm/sjLY+7zD1AP3fnH
         A+T2GTnGaO+Wfe6knocBre66CVar4C8JjkQsp052npxtNFnFI503bZ2Xx5da8RTRsbCU
         bwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744171507; x=1744776307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJ4nm1f2gfF/L+c+IXgX0HbHH9luA8EuVn/32w617wA=;
        b=xM5+VMXbM4raE46hQsLKbuFxsW8FbYl67AfeIYxue4gtI1JzUb9vxpakkZzWbxmaND
         2SqZ/cMTOG2XH5R6tRvhVpgR84RpnrcySlnaDKbly/7Tf82RKJEwqFtkip8wePVN4o+p
         mor+wtBTXGOVvwX0bWwf1vRjG6wEYs3u2JW8u1/UrkSEbJ+dXPefRN+QIZ1Fe29+7dCK
         4YcwfYnsK4Gir+3pFvQw/iJq+0FE2xRs7X/zJC27XEGlHPA9sYGBsGSUewGUXfcbQmvS
         vd35Dyfp6JcmzLodSJJFXcUkFNMfKtLHQxtpmzTyNKGDoNk9hkiIR1smo6a+ZxxroBqB
         M8og==
X-Gm-Message-State: AOJu0YzqH5rtdq+NC4GPaCtpQwEeuZFTeEJcjsQStqJiX5n+eUU6zsAI
	IuL3abpPE6KFNZv/JjfMineEVFUyeMqQDtsuQCqidx1RWd8Yktpx
X-Gm-Gg: ASbGncvMeovrvAoixbFDIp0iOP8eiYSyBw+wjv0BJwIaUCBOCC02oYttjMBqNCHwlL6
	5U8xgxA8sW7ysP/+P13/omQpjENY1aZ8X26O4jLXRxGp0fEMBZH5f/Ql1H7PbKQtEPNOsXsLH83
	jT8F8qAUz2K02gPeX3vLx5fYX9qwTdb2FsQZBIirElU5K2ByWLVrGh7+IR3pmOx5746JYrz/VPc
	iwMq0FDRbH58jT2X//k1ZExFma8W4kbiNq5sDKn3tgXzew93t66KgAfNr3ZK5ZWzj4MjcY6ZOwL
	uJJci633zhZLsxr1gW7ewAcUGUZqEju4NQimWcOA5EURpAVgmEc71uONM57vq7boVTgN1YCK+4i
	rGtRTjwFfYREYWlYeQD1Iv/k=
X-Google-Smtp-Source: AGHT+IGO7RFgVwYWxrvWqV0CCgJas7EkGNG6ozob4B5CVfkIEAY8WmnSKlCb3gJan1MKfb1DtJG0rQ==
X-Received: by 2002:a05:6214:c43:b0:6e6:6506:af59 with SMTP id 6a1803df08f44-6f0dbbb7b23mr22893276d6.15.1744171507080;
        Tue, 08 Apr 2025 21:05:07 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0de982641sm2503766d6.68.2025.04.08.21.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 21:05:06 -0700 (PDT)
Date: Wed, 9 Apr 2025 04:05:04 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: martin.jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [scarthgap][PATCH] docker: fix
 Upstream-Status format
Message-ID: <Z_Xx8CmYqZPCb0cn@gmail.com>
References: <20250402135830.3393656-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402135830.3393656-1-martin.jansa@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 09 Apr 2025 04:05:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9210


Thanks for the fixup!

This is now merged.

Bruce


In message: [meta-virtualization] [scarthgap][PATCH] docker: fix Upstream-Status format
on 02/04/2025 Martin Jansa via lists.yoctoproject.org wrote:

> From: Martin Jansa <martin.jansa@gmail.com>
> 
> * fixes:
> DEBUG: Executing python function do_qa_patch
> ERROR: QA Issue: Malformed Upstream-Status in patch
> TOPDIR/meta-virtualization/recipes-containers/docker/files/CVE-2024-36620.patch
> Please correct according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
> Upstream-Status: [patch-status]
> ERROR: QA Issue: Malformed Upstream-Status in patch
> TOPDIR/meta-virtualization/recipes-containers/docker/files/CVE-2024-36621.patch
> Please correct according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
> Upstream-Status: [patch-status]
> ERROR: Fatal QA errors were found, failing task.
> 
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  recipes-containers/docker/files/CVE-2024-36620.patch | 3 +--
>  recipes-containers/docker/files/CVE-2024-36621.patch | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-containers/docker/files/CVE-2024-36620.patch b/recipes-containers/docker/files/CVE-2024-36620.patch
> index 7bce4137..03628fb3 100644
> --- a/recipes-containers/docker/files/CVE-2024-36620.patch
> +++ b/recipes-containers/docker/files/CVE-2024-36620.patch
> @@ -8,8 +8,7 @@ First released in v25.0.0-beta.1
>  
>  CVE: CVE-2024-36620
>  
> -Upstream-Status:
> -Backport [https://github.com/moby/moby/commit/ab570ab3d62038b3d26f96a9bb585d0b6095b9b4]
> +Upstream-Status: Backport [https://github.com/moby/moby/commit/ab570ab3d62038b3d26f96a9bb585d0b6095b9b4]
>  
>  Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
>  ---
> diff --git a/recipes-containers/docker/files/CVE-2024-36621.patch b/recipes-containers/docker/files/CVE-2024-36621.patch
> index a6c06ef2..6560f46a 100644
> --- a/recipes-containers/docker/files/CVE-2024-36621.patch
> +++ b/recipes-containers/docker/files/CVE-2024-36621.patch
> @@ -12,8 +12,7 @@ release only one of these layers was actually released.
>  
>  CVE: CVE-2024-36621
>  
> -Upstream-Status:
> -Backport [https://github.com/moby/moby/commit/37545cc644344dcb576cba67eb7b6f51a463d31e]
> +Upstream-Status: Backport [https://github.com/moby/moby/commit/37545cc644344dcb576cba67eb7b6f51a463d31e]
>  
>  Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
>  ---

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9191): https://lists.yoctoproject.org/g/meta-virtualization/message/9191
> Mute This Topic: https://lists.yoctoproject.org/mt/112046797/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


