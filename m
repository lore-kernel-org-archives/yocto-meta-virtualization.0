Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3BD5C47DAF
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 14:42:27 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.23736.1705675344421583975
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 Jan 2024 06:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ljM87EQb;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-680496bc3aaso3541736d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Jan 2024 06:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705675343; x=1706280143; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kSd7Rj5MC03Rdzb9vx3jKrOpkkq4qQQLTKiIbOg7H+E=;
        b=ljM87EQb7dwEqXVDnMGUiBu3+7petCmjsBdPNiDzM2sL3JA5MzXUEcTp6EbuofHYyE
         xVbtgixC1tT6cXL8nO5UYLXfEK1BrGHMgAM1Y8M5ZC5ucUquQnYKia5k4/6cMqKRh0hc
         07iw22cuSsvuAPBPd+Jg2ul6T/5HV8gKDAUuECTOjVuU64gV5fbsV3dNE43Ak6Or9OB9
         CCSfwEaNek4dgeyL4RPIWZpY49PNFW4/fzIQU6iKlPQUNlnvucmDGlRGF34oDhSliuaa
         uRD8j++CwJ6U4laI2GNCQFxRm3t/DxkcemgA6GIIWk2lBVl6a8Y8n14xdwuTnU7R6Rne
         AiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705675343; x=1706280143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSd7Rj5MC03Rdzb9vx3jKrOpkkq4qQQLTKiIbOg7H+E=;
        b=XJrVCnhTHovpIfbXiDew8yGxlqgqA+tKlyO8BTlnu1P7M1+wkJG9mv1Jn3HXfN80Ax
         /a4T4RAicFb/WXj6XmzFgkE+lDy7/RDRzdBTkmkmxVFFLE/3D+VhFkkcZUhxH4GpX5PM
         qjeTRgFMmrz615kBQ+BsZOMvVf5ybTI0XK0zuKutR8gat7+jaofIOsdnOO3/3qQE8vLH
         VaJfe01V8w9gOPEEYeKJ/l7Ng9N+jXPtder8BqgcmG40YFHTUj26riL16Fu75eKMnZpl
         9TaI+kH5JkQmMXuqtfYl5QkzdBNMDXTQKnnuNH+oTTa2b5VeE/l8vBc1MsA8BpPv0Kkv
         y57Q==
X-Gm-Message-State: AOJu0Yw/oqzsN9K1Fh4EMpx7QMr2ZgB18U1xNhykqeW114eB3RIeLJM5
	ahL1FzoIABqj6crYFTaHuQpTkXbwPWM5tcUMJ9dfEoMFo87Ihtag
X-Google-Smtp-Source: AGHT+IGJdxceEhVf7/3T1kL5lmrZpiXsdLueGyEtLDB4+PKSgR0xcTm+j5BOt+8kL76FJ08E3yVzlw==
X-Received: by 2002:a05:6214:d0c:b0:681:8aba:7d52 with SMTP id 12-20020a0562140d0c00b006818aba7d52mr2558123qvh.55.1705675343313;
        Fri, 19 Jan 2024 06:42:23 -0800 (PST)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id l10-20020a0ce84a000000b0068174a6a87bsm2887903qvo.109.2024.01.19.06.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 06:42:22 -0800 (PST)
Date: Fri, 19 Jan 2024 14:42:21 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] buildah: fix branch name
Message-ID: <ZaqKTbejpqge4PCy@gmail.com>
References: <20240119070916.1243692-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119070916.1243692-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Jan 2024 14:42:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8547

projects that delete branches are one of the most annoying
things.

I've taken the commit and also pushed an update that I had
in progress.

Also, the author in the commit was invalid, but I manually
fixed it in this push. But you should check your enviroment
and see if anything changed.

https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#troubleshooting-email-issues

Bruce

In message: [meta-virtualization][PATCH] buildah: fix branch name
on 18/01/2024 Chen Qi via lists.yoctoproject.org wrote:

> The branch 1.33.2 is not there any more. The correct branch for now
> is 1.33.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/buildah/buildah_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
> index d3ccc920..f04adca9 100644
> --- a/recipes-containers/buildah/buildah_git.bb
> +++ b/recipes-containers/buildah/buildah_git.bb
> @@ -32,7 +32,7 @@ SRCREV_buildah = "8be6786d5ed1f07387acdd30d52fc07cd1b4bd0f"
>  SRCREV_storage = "246ba3062e8b551026aef2708eee747014ce5c52"
>  
>  SRC_URI = " \
> -    git://github.com/containers/buildah;branch=release-1.33.2;name=buildah;protocol=https \
> +    git://github.com/containers/buildah;branch=release-1.33;name=buildah;protocol=https \
>      "
>  
>  DEPENDS = "libdevmapper btrfs-tools gpgme"
> -- 
> 2.42.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8546): https://lists.yoctoproject.org/g/meta-virtualization/message/8546
> Mute This Topic: https://lists.yoctoproject.org/mt/103825803/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


