Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A7F7C3ABBE
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 01:45:51 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.67297.1746495942215477647
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 05 May 2025 18:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EVq0iS7K;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e8ffa00555so50913056d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 05 May 2025 18:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746495941; x=1747100741; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ADOnGeddD4kudCFxJ9hmcqtYX55qAnln4SwuYKt1de0=;
        b=EVq0iS7Kd2NwHic8z6DVR74OHirVJOuYUlOtZPREWHMEHWFOqONxtUniXBXBhvfqj2
         K+AyOJvfkg5dM962H81AizVdpU3i1AVZUu2XxPdXu16uqejsezt/6qgJ1gVpDcvTkKuF
         hro5ASuFZQ0moAdtyb0bH2r/t7bENbqEyDxSBTdZdvxARqAWpYe29ZFmKpMoRwABg8Z2
         tqlHppsyyG3/ZmaAi7UCozhScJ0beub0TVQs6oxRzgMSn9TDVleRQudMWVTUQ7lLa+XR
         qKny0k5yeVynVI5jBh0J5eJcDV2RVXjxcZjy8gdZwaLZzsFeYrYWbNvko1VDVG0lgDh9
         HDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746495941; x=1747100741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADOnGeddD4kudCFxJ9hmcqtYX55qAnln4SwuYKt1de0=;
        b=teRl+cNUnFcoYYxYgONN3PK/PUjwVwDsoueXI0C5q+Z6xFYAybj5rp9wYogQm4sGz3
         QrZYyxQaDx0HJQIoDjNuY1HAiK0nx89JWZJQiHqX0rviGnWaCnYff4kD6RZ42Gp8PzL6
         aGw2e66ecIBMvYf2muGNIkh1Ws3828odqJWGq7WE+TQgWGSct9dBWdJh5ZSOIrv4gRdb
         cFor43AxOLekm4NSLVFecSrM56NBMEIQQvMvH1R3MWKe5s4OoAuSJfEkE5CqMr5fnJjY
         JP53BaeM7yWaXV2HIoWyhvwsMB572nWcZ2YNnBQrH9bFgA3mDwz5vP7iTIfAMfm2fQGJ
         1/NQ==
X-Gm-Message-State: AOJu0YwPsIDP7ACj23Tkn9wjZeWiCbqDeDlK/fBLce2r0v2y48utnaeD
	G8rpr959WDyNaChjatv64cpdi61FPaAMN9eDjNatUSwKvaPoFj3i
X-Gm-Gg: ASbGncsPc/uty+zUgZbCvrHO0MsjRNxg0rVZWx3LCvJ/W+6hSH+d37UBq39Wpcq/z7p
	KalHaoRIbvuDtYLbXIVwj7rR4p0JPy+5zqzsQtKr+x6C2kpdsgCVYXdoxH7ZZywydeskpCIdxDg
	BGFDaKMmWV1QCi5+g8Y0/kdyWtEQ1nJWwZGj/LPFmeULm/UfVyHlkC0yqREYCLN1zf/r/aRLuRN
	fGprJxLXmSmX6jhRBNg5+K+/S2vlZaYpDafh+9RkeMJ7V4yg4bwvYzuwVAc9dCJuONtkYTmtn5n
	c6SYhecpjOPHI1yCeE4KPDVf2BB/KUekCWZsKU2FH6UYED11906SXO+Er20/WwsZds+5lOvuZly
	xp/8IXCyUk3LWxqQT+tA=
X-Google-Smtp-Source: AGHT+IE7vtjtwjMXErlCsXqTvMghxLemMv4FddpSa+AGoDfC2ebfq4dE3PjWBiPdMvhPGI/rKAgtCA==
X-Received: by 2002:a05:6214:5016:b0:6e6:5e15:d94f with SMTP id 6a1803df08f44-6f5353ed6admr26570616d6.27.1746495941100;
        Mon, 05 May 2025 18:45:41 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3b03adsm63279526d6.8.2025.05.05.18.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 18:45:40 -0700 (PDT)
Date: Tue, 6 May 2025 01:45:38 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: martin.jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] dev86: use gnu17 and ignore
 incompatible-pointer-types to allow building with gcc-15
Message-ID: <aBlpwu7JTxmfTW5x@gmail.com>
References: <20250504203447.1113879-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250504203447.1113879-1-martin.jansa@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 06 May 2025 01:45:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9243

Thanks Martin,

All of the gcc-15 patches are now on master.

Bruce

In message: [meta-virtualization] [PATCH] dev86: use gnu17 and ignore incompatible-pointer-types to allow building with gcc-15
on 04/05/2025 Martin Jansa via lists.yoctoproject.org wrote:

> From: Martin Jansa <martin.jansa@gmail.com>
> 
> The repo from SRC_URI is no longer accessible add temporary
> work around to allow building with gcc-15.
> 
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  recipes-extended/dev86/dev86_git.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/recipes-extended/dev86/dev86_git.bb b/recipes-extended/dev86/dev86_git.bb
> index 6414ecfb..d43d1200 100644
> --- a/recipes-extended/dev86/dev86_git.bb
> +++ b/recipes-extended/dev86/dev86_git.bb
> @@ -57,4 +57,11 @@ FILES:${PN} += "${libdir}/bcc"
>  # unproto.c:188:51: error: implicit declaration of function 'strcmp' [-Wimplicit-function-declaration]
>  CFLAGS += "-Wno-error=implicit-int -Wno-error=implicit-function-declaration"
>  
> +# http://errors.yoctoproject.org/Errors/Details/853302/
> +CFLAGS += "-std=gnu17"
> +
> +# http://errors.yoctoproject.org/Errors/Details/853303/
> +# ar.c:615:23: error: passing argument 1 of 'ctime' from incompatible pointer type [-Wincompatible-pointer-types]
> +CFLAGS += "-Wno-error=incompatible-pointer-types"
> +
>  EXTRA_OEMAKE += "CFLAGS='${CFLAGS}'"

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9241): https://lists.yoctoproject.org/g/meta-virtualization/message/9241
> Mute This Topic: https://lists.yoctoproject.org/mt/112618426/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


