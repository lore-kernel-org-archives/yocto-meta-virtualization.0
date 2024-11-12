Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C948FD597B9
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 23:15:20 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.101035.1731453310718248744
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Nov 2024 15:15:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mcdmb2tg;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6cbd00dd21cso41848786d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Nov 2024 15:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731453310; x=1732058110; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/0ZWweMrq+xRarHc2Dgw8OLm/1AC8OM+Y3jgF5PRB2g=;
        b=mcdmb2tg4hjIxj83LX251ha0op59C8+3dU9YwkIyOdNBwYz2QnrEnd+8DidEaqj29g
         vBwayyfwAqFiuHjn8CCsj5z6DT20BUTEf/FXiWwGhtt4VkAw4fc/nNz72ng6xqTbwSGu
         jW9vuoFmDrMWYgejHjlaoh48NAqljHokwRqvMkGuSv2yavEH7MwuERHPMa4WSjMENxA8
         t533Eyk69cqOMXPDIjndSVDcEeJ5/Rg/Wj9GzRK/1yyiUBn2LHMowuYYe/H2pxA37591
         zfQ2yGGqMwjFv9CEZSqr9c+JC8j2Hm4YrtIQs9pxU9DoCUKwqhoh/mhtyBvESv05QuA0
         1LEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731453310; x=1732058110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0ZWweMrq+xRarHc2Dgw8OLm/1AC8OM+Y3jgF5PRB2g=;
        b=aAgd1KWyrp47cfTYpq+6ui6Ynhix1+qAzzZV8UwiPJBzXNQ7VjE2KBHiozhOX+84W1
         +b5ReDb2Ar7b/OGLpjeUieVbl0c629MwNvfoViNfTCN2UKTBMNOCuj0rtOjqBTKs1HQX
         Ai/uiRDb/cDw2Ysx9uSTKxJFmEg2QEpl5gR1fCfo5RdBFJkZZv04re3jxIiPJr5Gdi+C
         5zkrHWwUGb7pTTC0Uc2+9RQVLnQZUPosPau0nWRgcUVAs96ipFIK3uir+z3MerocowoB
         eRx05yHkecacp9lFVeJotUCIB1kwT480PlDS12V3mpLphg6njVFegK0QOuTwPGCuktQh
         eaAA==
X-Gm-Message-State: AOJu0YwLY9J9dcoxHPe/wlJejlQ/nFOsL6bmY5iUUtzKGyRADS95NbP0
	AG4bIhAG6MAD6pcLZmG00Vx19mLClzxUlozN3RgTPcjSStYJL9XGcgjnmro4
X-Google-Smtp-Source: AGHT+IH27km2lDmuJ3whOsIuunmMhtZb0yVd17NzroKxUGgfUIfLZtUkRJJzR4o8o5ZiAiLQUdAQvA==
X-Received: by 2002:a05:6214:2f85:b0:6cb:e57b:c37f with SMTP id 6a1803df08f44-6d3d01fc4b0mr62870486d6.25.1731453309555;
        Tue, 12 Nov 2024 15:15:09 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b32ac2dbedsm636153685a.9.2024.11.12.15.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 15:15:09 -0800 (PST)
Date: Tue, 12 Nov 2024 23:15:07 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] criu: fix buildpaths QA issue for
 arm
Message-ID: <ZzPhe+/jQXlyTk4w@gmail.com>
References: <20241105073644.3692715-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105073644.3692715-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Nov 2024 23:15:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8964

merged.

Bruce

In message: [meta-virtualization][PATCH] criu: fix buildpaths QA issue for arm
on 04/11/2024 Chen Qi via lists.yoctoproject.org wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
> 
> The settings of CFLAGS:arm overrides the previous CFLAGS settings,
> causing buildpaths QA error for arm. Use CFLAGS:append:arm instead
> to fix this issue.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/criu/criu_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
> index 09503624..8ecc1725 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_git.bb
> @@ -46,7 +46,7 @@ EXTRA_OEMAKE:append = " LOGROTATEDIR=${sysconfdir} SYSTEMDUNITDIR=${systemd_unit
>  CFLAGS += "-D__USE_GNU -D_GNU_SOURCE "
>  
>  CFLAGS += " -I${STAGING_INCDIR} -I${STAGING_INCDIR}/libnl3"
> -CFLAGS:arm += "-D__WORDSIZE"
> +CFLAGS:append:arm = " -D__WORDSIZE"
>  
>  # overide LDFLAGS to allow criu to build without: "x86_64-poky-linux-ld: unrecognized option '-Wl,-O1'"
>  export LDFLAGS=""
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8957): https://lists.yoctoproject.org/g/meta-virtualization/message/8957
> Mute This Topic: https://lists.yoctoproject.org/mt/109402190/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


