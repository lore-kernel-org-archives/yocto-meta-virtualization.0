Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C407CA1010
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 01:12:16 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.29077.1756948328999804941
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Sep 2025 18:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZjLTfiJJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-80cc99fe980so57801585a.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Sep 2025 18:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756948328; x=1757553128; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RIdYMkNgXenTSOZ2HW4NWxTAn/v+HIZIgjjDIWzYMNM=;
        b=ZjLTfiJJd58lEqSTgTPEYpXwRoJjTZLG5EhpRNSc09rlPgGux/iN5GWrfiefZEUTu7
         p44mHI/JoYKlWgwrH/lcxXpsZ7RR82xH58nIVBkesPWUE1J4CMeUkjAIuXCK0prPzKSm
         WOz3iWcbSxzaRpROqr/CBXN0cXY0obHn0DASJe7s7INowEWzvGMULzCmXC8BovLQ9uNl
         EgeMZeVSBD0ynGBljnRZByZc/+E7hcweQa0aKqR7vthq2jazR2dGyK3pnci2aOxOSjXG
         lHjD1LsDW879H1H6VZj/NuAhHOX3kp4fbcElBPSvr82DJgrE/WTo0vJVLyfZ2LT0jkNG
         AIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756948328; x=1757553128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIdYMkNgXenTSOZ2HW4NWxTAn/v+HIZIgjjDIWzYMNM=;
        b=ChHVrja3vyWDiE7sxoqbpGy0zMR3XPHfdSPBssLtprQP9BVbqXD+addezu7FjIaSgK
         4WZHDOp96QH5O7pIlBEHaIbBu+iKUqAD0LzfXBJKeyMXheAhqfh9zema23rFnSfCAUoC
         W1hO5svPi172tTlTXf7kDc9+ZK8zB/+x74pcADpM7nQdC2ZpzChwM/JKa52xDGHoVxfv
         AFsWAvq562g7XthfQETR8xT+Y5ii3BVVnVTeL6fykIkAt9l5O2nRapZnVW53CXNmC7YV
         pKT6npQDMzpfZX38loWmo/rdeP3Vzd0bXylRGxJWN8hGnbmYmFxJ2z5yN88LGTd0hJqy
         qUYg==
X-Gm-Message-State: AOJu0Yy5JYgBe87laPT7/7FttcwQG1UrZ9sKem1zQjHEeLPLhZ6Mj21A
	81X4vJZgmb/59nWNe6tygBMHuVJzVpIS8PT+HufOUtxA0nEFblcmFFKx
X-Gm-Gg: ASbGnctazFXif5ALOdd1CEHeMAmtpHeY2G/fYuEC+STkCs3e8ySWziV/MU8seathCuN
	tzyvZeVKXXyG3GvqfHd2Hj5gT4v+S9zYobfjngdCfTJbKTqeJft0LU06VyeZQ6PXFm41MVAi5xU
	XxlY55riX6kTiMkir7/x0SlInVY54tW/mHEK5TrJuc0/1cUPGtMu7uCpG5VgA1zj1r9Qtl04YG8
	JK1kMRmsNeCJPgcQylmy9oMqwkX3wS4fUqFhSNP2Q7C4lGPjIiL9/kTBwwlHI1dHKjmRuilJeqJ
	uLcCNK2l+Ey/8KXPN4y55efeO1ky+Xy3PolHMjntg1wJfLYGmajqwjzs8KdGh7hEZYzxecnq0OP
	DFg4z5NUq4xAkKWAJyXODJYs0uk8QvZyHZZ/7Si7YMG+MIKxM73TWpFZrq5cEB91wf39xorO5q9
	UbZ9E5a1fRZa1yZhF3SbEQ6IyW+WJHt7jI9KX56AXiQ2w=
X-Google-Smtp-Source: AGHT+IEBA48FMTVdwhKdrBhN3OrRFH1IOooh3f6gSB0ek5wU8TegjRUxxDmosa1zz7CLjaK7OYeD3w==
X-Received: by 2002:a05:620a:4512:b0:80b:981:a0e4 with SMTP id af79cd13be357-80b0981a32dmr486277485a.70.1756948327749;
        Wed, 03 Sep 2025 18:12:07 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aa62c8725sm199521985a.8.2025.09.03.18.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:12:06 -0700 (PDT)
Date: Wed, 3 Sep 2025 21:12:04 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
Cc: meta-virtualization@lists.yoctoproject.org, vchavda@cisco.com
Subject: Re: [meta-virtualization][scarthgap][PATCH] runc-opencontainer: Fix
 typo in Makefile for static-pie option
Message-ID: <aLjnZLPiHzMXsXCr@gmail.com>
References: <20250822175400.1677499-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822175400.1677499-1-deeratho@cisco.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Sep 2025 01:12:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9369

merged.

Bruce

In message: [meta-virtualization][scarthgap][PATCH] runc-opencontainer: Fix typo in Makefile for static-pie option
on 22/08/2025 Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) wrote:

> From: Deepak Rathore <deeratho@cisco.com>
> 
> runc-opencontainer build is failing with clang toolchain due to typo
> error for --static-pie option.
> 
> Build Error Logs:
> | running x86_64-oe-linux-clang failed: exit status 1
> | x86_64-oe-linux-clang: error: unknown argument '--static-pie'; did you mean '-static-pie'?
> |
> | make: *** [Makefile:69: static] Error 1
> | ERROR: oe_runmake failed
> 
> Fixed it by replacing --static-pie with -static-pie in LDFLAGS_STATIC.
> 
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
>  ...-Makefile-fix-typo-in-LDFLAGS_STATIC.patch | 30 +++++++++++++++++++
>  .../runc/runc-opencontainers_git.bb           |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 recipes-containers/runc/files/0001-Makefile-fix-typo-in-LDFLAGS_STATIC.patch
> 
> diff --git a/recipes-containers/runc/files/0001-Makefile-fix-typo-in-LDFLAGS_STATIC.patch b/recipes-containers/runc/files/0001-Makefile-fix-typo-in-LDFLAGS_STATIC.patch
> new file mode 100644
> index 00000000..bfcfd533
> --- /dev/null
> +++ b/recipes-containers/runc/files/0001-Makefile-fix-typo-in-LDFLAGS_STATIC.patch
> @@ -0,0 +1,30 @@
> +From 6f20df5de2c6eb2343202c55e4a8b3d9a4feff10 Mon Sep 17 00:00:00 2001
> +From: CrazyMax <crazy-max@users.noreply.github.com>
> +Date: Tue, 14 Feb 2023 21:27:26 +0100
> +Subject: [PATCH] Makefile: fix typo in LDFLAGS_STATIC
> +
> +Upstream-Status: Backport [https://github.com/opencontainers/runc/commit/2e44a2028077]
> +
> +Signed-off-by: CrazyMax <crazy-max@users.noreply.github.com>
> +(cherry picked from commit 2e44a2028077685cde67d7988f95ce66110be5ae)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +Index: git/src/import/Makefile
> +===================================================================
> +--- git.orig/src/import/Makefile
> ++++ git/src/import/Makefile
> +@@ -36,7 +36,7 @@ LDFLAGS_STATIC := -extldflags -static
> + ifneq (,$(filter $(GOARCH),arm64 amd64))
> + 	ifeq (,$(findstring -race,$(EXTRA_FLAGS)))
> + 		GO_BUILDMODE_STATIC := -buildmode=pie
> +-		LDFLAGS_STATIC := -linkmode external -extldflags --static-pie
> ++		LDFLAGS_STATIC := -linkmode external -extldflags -static-pie
> + 	endif
> + endif
> + # Enable static PIE binaries on supported platforms.
> +-- 
> +2.42.0
> +
> diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
> index 6eef2c8f..4c831502 100644
> --- a/recipes-containers/runc/runc-opencontainers_git.bb
> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> @@ -4,6 +4,7 @@ SRCREV = "2c9f5602f0ba3d9da1c2596322dfc4e156844890"
>  SRC_URI = " \
>      git://github.com/opencontainers/runc;branch=release-1.1;protocol=https \
>      file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
> +    file://0001-Makefile-fix-typo-in-LDFLAGS_STATIC.patch \
>      "
>  RUNC_VERSION = "1.1.14"
>  
> -- 
> 2.44.3
> 

