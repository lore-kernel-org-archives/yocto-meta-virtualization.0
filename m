Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5236C38150
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 03:56:46 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.6266.1720583803335074032
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 20:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eiVMDSuQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-651961563d6so49418907b3.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Jul 2024 20:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720583802; x=1721188602; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6pk5Ih8Cww+gERH3Iqk1MxGsu0i6HhxGLJ2IsGNRdPA=;
        b=eiVMDSuQDTec9v4kDYYeRPjdCF28uHpMjR2JMKvU109lpWs/tgwYCsZnHEv0Xgf2lj
         0EucUU+1EkYf76FIo3M8SCaHhy1oEe6UxJFhnNpPKqYmLFMWnQVaKMGiW8xWPPWYHrY1
         i7t7LJaiTTdAY/r9uimQ9QOHv5x2CWDLr62dN93bJXJrKZU5kas3c1owFK9nF3xdHHzM
         Qal2vn8hO2mjd+opYuUKtY70eJAbCse33RlS0gSjilgDImI8LFkMRIL6SqV4Usn//P3N
         72/ZRSg6l/BtucTDKOvCJ79qQnGx6VuzAN+QgjeCunc5yuKuenMOU1V6iYK1tnHuTCjP
         s3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720583802; x=1721188602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pk5Ih8Cww+gERH3Iqk1MxGsu0i6HhxGLJ2IsGNRdPA=;
        b=Ihb2vo7dWRVzWDIAPm2mUqCyFVaC4MFDMFEQtwuXAz/S05wdvjyFMpAvShJehJM0Mi
         qG5GNQnpUL2mc3gBV8kp9mUUzOET4L+Mco6pltvn15PSXaLvIoIYeVCoybR/lLO6Ty40
         yiwzprQz2RsUFwQmjrqxdlLdPgwph1PfFAFeporPd9/+or7NSC75KHiQP61tZpSSx1Iz
         G0/T5CTpagwkyzohSxgbney9FFxK0+kF4zM7/MAtF4Jgbj5e8SkLQnY9PSAQBA4Ln8O4
         EFKpKexIHLFoorOmch+OSAnwvAoJBMyifC2ngKrvargoCCIs8OE34L84PFsxDIIZ9UrY
         D9ag==
X-Gm-Message-State: AOJu0Yx0yqfle1oyg78KMCWLySelO7A6a88BNnmlf/zRWtPGbNm5+V4E
	yWSsGlwvd1NDVN/qbb5nhWEaxXTWzUeMfDPnMi2Gu6606ql2GIFYo0zTHmNK
X-Google-Smtp-Source: AGHT+IEW+BKZmjgnxYwN2WjW+f7uWrfsTHiRPvvYtCkUOl8g+gG2M2vxzzPWfQ/4qO+Z3b+93ajyFw==
X-Received: by 2002:a0d:ea84:0:b0:622:bf2d:7e4a with SMTP id 00721157ae682-658f0dc3250mr45117077b3.49.1720583802297;
        Tue, 09 Jul 2024 20:56:42 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f190be4c8sm157166085a.136.2024.07.09.20.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 20:56:41 -0700 (PDT)
Date: Wed, 10 Jul 2024 03:56:39 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: mingli.yu@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH 2/2] docker-distribution: Use dup3
 for riscv64
Message-ID: <Zo4Gd0vdkTVYgN5A@gmail.com>
References: <20240709101657.601908-1-mingli.yu@windriver.com>
 <20240709101657.601908-2-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709101657.601908-2-mingli.yu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jul 2024 03:56:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8826

I'm currently going through an update cycle for the meta-virtualization
packages, so once I've uprev'd past this commit, I'll add patch 1/2 and
test for riscv.

Bruce

In message: [meta-virtualization] [PATCH 2/2] docker-distribution: Use dup3 for riscv64
on 09/07/2024 Yu, Mingli via lists.yoctoproject.org wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Use dup3 instead for riscv64 as there is no dup2 on riscv64 linux
> to fix the below build failure:
>   vendor/github.com/bugsnag/panicwrap/dup2.go:10:9: undefined: syscall.Dup2
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../docker-distribution_git.bb                |  1 +
>  ...-panicwrap-Use-dup3-on-riscv64-linux.patch | 42 +++++++++++++++++++
>  2 files changed, 43 insertions(+)
>  create mode 100644 recipes-containers/docker-distribution/files/0001-panicwrap-Use-dup3-on-riscv64-linux.patch
> 
> diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
> index 4e64df4f..bb4a7cbf 100644
> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
> @@ -7,6 +7,7 @@ SRCREV_distribution= "d607c6ccb9372e05556624f973119a23d3a42987"
>  SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.8;name=distribution;destsuffix=git/src/github.com/docker/distribution;protocol=https \
>             file://docker-registry.service \
>             file://0001-build-use-to-use-cross-go-compiler.patch \
> +           file://0001-panicwrap-Use-dup3-on-riscv64-linux.patch \
>            "
>  
>  PACKAGES =+ "docker-registry"
> diff --git a/recipes-containers/docker-distribution/files/0001-panicwrap-Use-dup3-on-riscv64-linux.patch b/recipes-containers/docker-distribution/files/0001-panicwrap-Use-dup3-on-riscv64-linux.patch
> new file mode 100644
> index 00000000..753afef7
> --- /dev/null
> +++ b/recipes-containers/docker-distribution/files/0001-panicwrap-Use-dup3-on-riscv64-linux.patch
> @@ -0,0 +1,42 @@
> +From 21d54c68751760b1f8915807794a432cf01fb733 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Tue, 9 Jul 2024 16:28:14 +0800
> +Subject: [PATCH] panicwrap: Use dup3 on riscv64 linux
> +
> +Use dup3 instead for riscv64 as there is no dup2 on riscv64 linux
> +to fix the below failure:
> +  vendor/github.com/bugsnag/panicwrap/dup2.go:10:9: undefined: syscall.Dup2
> +
> +Upstream-Status: Inappropriate [The upstream has removed the panicwrap as [1]]
> +
> +[1] https://github.com/distribution/distribution/commit/3e4c4ead4c3aa07c27f95f2a5c92c6d5c2f9dcdb
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + vendor/github.com/bugsnag/panicwrap/dup2.go | 2 +-
> + vendor/github.com/bugsnag/panicwrap/dup3.go | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/vendor/github.com/bugsnag/panicwrap/dup2.go b/vendor/github.com/bugsnag/panicwrap/dup2.go
> +index de523c83..c68ce5ff 100644
> +--- a/vendor/github.com/bugsnag/panicwrap/dup2.go
> ++++ b/vendor/github.com/bugsnag/panicwrap/dup2.go
> +@@ -1,4 +1,4 @@
> +-// +build darwin dragonfly freebsd linux,!arm64 netbsd openbsd
> ++// +build darwin dragonfly freebsd linux,!arm64,!riscv64 netbsd openbsd
> + 
> + package panicwrap
> + 
> +diff --git a/vendor/github.com/bugsnag/panicwrap/dup3.go b/vendor/github.com/bugsnag/panicwrap/dup3.go
> +index 9721b36c..c664da85 100644
> +--- a/vendor/github.com/bugsnag/panicwrap/dup3.go
> ++++ b/vendor/github.com/bugsnag/panicwrap/dup3.go
> +@@ -1,4 +1,4 @@
> +-// +build linux,arm64
> ++// +build linux,arm64 linux,riscv64
> + 
> + package panicwrap
> + 
> +-- 
> +2.34.1
> +
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8821): https://lists.yoctoproject.org/g/meta-virtualization/message/8821
> Mute This Topic: https://lists.yoctoproject.org/mt/107119845/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


