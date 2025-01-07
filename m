Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84CF3E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 22:09:26 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.4945.1736287765491910282
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jan 2025 14:09:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DIH0P3/u;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6dd43aa1558so118555806d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jan 2025 14:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736287764; x=1736892564; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U74WUuszTznbcq7jhbMhqWpSUnyZTHg7g81Aj3P7GEQ=;
        b=DIH0P3/u+Uw4DAz6ox4UP2mACwSJbl3i0YBNbKkkErpmq7ibmgATgs/OozvcLm1uNX
         4tcWH1wyeapWrkisDG1lqB1S+SO3h8Q2yTHcvBJFGXxMgMw+6Ob9I9/fRbBNPy/MvRkF
         xszjDGuuEgZ/pAvsqhDxfFyK7/pJetqnzB4a/IbV7qOgY/WjLkZvV/9Hvzqc8NyTIJdu
         sRCXk25vVXRWVUiBmgcG/3uA1FQDZwSdv+jXY0rd/CtAuMxC1R9GnNtZWLbCqcSQmyDU
         MX1v3wYSH9OgMBA34ayUj16aZmmNht+xrH2ovUcD23/jj/zvIi/GY8Qpx/PKCzcDQgwy
         jypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736287764; x=1736892564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U74WUuszTznbcq7jhbMhqWpSUnyZTHg7g81Aj3P7GEQ=;
        b=Mk8qr4nlgRGQw3ikV0T4Jk/ovr3tjn4J5Guaestv5yvDaR1GjowTPfdBInWmj7YsbB
         ec6AQw4q6ekF3BEZZsr1vpDRENXl/6EAiG20MtGGgkYo7F1SSWJQbuj/zgRH6yhPOekP
         4pp6UxZmNHNW9ozwyV2/i4M99x6AjRI5di/VE6cV+/fjrD9sW35UhJYqL+Eyjnliq2wk
         PrPYerJoy4oB13YGiV2RwO2inSFzDp08ahji34rioEqMHRCP+F/eUSNBvFsf6vJTuyYh
         y92M7QvcCEikuV/am3Yn5Tf0/53X9n8PgCF7Igkn0JrA3BwYPkw/SfqMMSdrW7gwH3ki
         hQEw==
X-Gm-Message-State: AOJu0YxoTckutVE7rQSxQr6wJpkqg9MtcXyx903dKTwcKF0vdcNsGlj2
	uoSXJfPgSBtHJhBmIY8TWRXUeQoIbzhwAxgsvxQoYCe1VR/pWLp0p1Bx4S3yzmTrlg==
X-Gm-Gg: ASbGnctOEyxEsnuRSW7W6jokHbEthupO8qLYP4cp4iEvbGEkExz9rretYMDt5FEaLS6
	MNhACd5uOzECYVFSXchGZBkhlJ5rTOLOLllFGuRv5dY3Rm2FAJutIXaAWDSTR+JT2b8gYPvuKRq
	9/IA5IoZNs8LwIQirqG9gCURwpHbU3fd/LCSBi3s3luPu2tqk44dfjVqZFbgtcBJKBZ24cl/2C2
	ViLQ4f64dacu8uqh8Tl0lS9frTWbGelwKF9Fz8Yg2Vzx9JdZSQmsXCksgGLxz//MdX+ukC6642e
	O8LFGzANpdIfCkArh9mBO8thO+ubFhOn53I=
X-Google-Smtp-Source: AGHT+IFFqE1qKkB1hEc1thDxiS2J5LwTLg5YTsuSO8HJUMNQprrhgnmYRpX0t2zVdIr7SE6LZRwO4g==
X-Received: by 2002:ad4:5ccd:0:b0:6d8:aa04:9a60 with SMTP id 6a1803df08f44-6df9b1d1f30mr14140816d6.7.1736287764429;
        Tue, 07 Jan 2025 14:09:24 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd181372easm185747496d6.63.2025.01.07.14.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 14:09:23 -0800 (PST)
Date: Tue, 7 Jan 2025 22:09:22 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: hsimeliere.opensource@witekio.com
Cc: meta-virtualization@lists.yoctoproject.org,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: Re: [meta-virtualization] [scarthgap][PATCH] runc-opencontainers:
 upgrade 1.1.12 -> 1.1.14
Message-ID: <Z32mEn16mwMHZym3@gmail.com>
References: <20241211090417.8979-1-hsimeliere.opensource@witekio.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211090417.8979-1-hsimeliere.opensource@witekio.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jan 2025 22:09:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9076

In message: [meta-virtualization] [scarthgap][PATCH] runc-opencontainers: upgrade 1.1.12 -> 1.1.14
on 11/12/2024 Hugo Simeliere via lists.yoctoproject.org wrote:

> From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
> 
> Alignment with runc-docker version
> Includes fix for CVE-2024-45310 and other bug fixes
> 
> Changelog:
> ==========
> https://github.com/opencontainers/runc/blob/v1.1.14/CHANGELOG.md

A shortlog summary is preferred, or copying the contents of
that file into the long log. When referenced like this, there's
no way to use git to easily see what changed.

But again, I took so long to merge these, that I've gone ahead
and merged it as-is.

Bruce

> 
> Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
> Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
> ---
>  recipes-containers/runc/runc-opencontainers_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
> index 188b8440..6eef2c8f 100644
> --- a/recipes-containers/runc/runc-opencontainers_git.bb
> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> @@ -1,11 +1,11 @@
>  include runc.inc
>  
> -SRCREV = "a9833ff391a71b30069a6c3f816db113379a4346"
> +SRCREV = "2c9f5602f0ba3d9da1c2596322dfc4e156844890"
>  SRC_URI = " \
>      git://github.com/opencontainers/runc;branch=release-1.1;protocol=https \
>      file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
>      "
> -RUNC_VERSION = "1.1.12"
> +RUNC_VERSION = "1.1.14"
>  
>  CVE_PRODUCT = "runc"
>  
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9058): https://lists.yoctoproject.org/g/meta-virtualization/message/9058
> Mute This Topic: https://lists.yoctoproject.org/mt/110058226/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


