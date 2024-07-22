Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE6EC3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 22:26:27 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.31128.1721687182191116413
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Jul 2024 15:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cof8w6rq;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-79efbc9328bso282795785a.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Jul 2024 15:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721687181; x=1722291981; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5zoXMt+Cvd+bMbQMb/bdeSiSdQh67VTyugVA+ONdsXI=;
        b=Cof8w6rq7qytiardLNM0+7/XVqU+4EA+f1lhf8ZKu/82eE6vO8DD0BzE6/FsGZd08f
         wdydugbZ7lwGiLcXHp3Q4g2Al+sLkqhGy+TXNYJQi5uFZgtEvKuslT47Mr2Sy4WhdpUs
         2ILah7ZV+FMaXw98N2ptcvqgAYecCIKnat7yan86v9l/ZQFZf/YxsnmXS3YFKtLQjdA4
         8Y+KgX5F6ZDqnDl7K8Iinn9uDg9QibxCjRbOkdmlYlg1n0uZGI0O/tR4vMmW7//wKQOk
         dV3NJCyrEHbwDxKf7CzLqqM6l/fPKmdoogRT2gI2OJMOZjlQd2KeSQ/J2a0bD5kt9KYB
         Fe/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721687181; x=1722291981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zoXMt+Cvd+bMbQMb/bdeSiSdQh67VTyugVA+ONdsXI=;
        b=OlrkIFPwzs14RfxTU3OEPbTNogp0X22v5eh0H/xvn1vlUj4TXTaZjs+K+EgNFi6q5e
         KHmqu72rkSiVAf/wq9uc8SkEo4maTd52VdKCrI9D28rAqUleO4j42uosLEVR8SSQ3zJj
         39/al+CD36rfOyEUEHpoahf1oDX5Mo1meHHmtnJZV7bEJkVz1zRosaVpElntGEq2wNL5
         KR5YzSaWWNYT+kYcAbB3Yq2eazz63NSgwMI8RywBe5IayUBSRaE1HgVbaIecNgMbWKuW
         M5S3ejnQz9/H/Q/IGH0iPu4wfQ5TOt4tZYUEwiNu+il2dyIc5EiZ8vArtaWz2XSlj3p+
         i5mw==
X-Gm-Message-State: AOJu0YyMViYS0qZJYje8n7+JZ26VE+XNvayriq/07IKdPMetv3Z2qRkg
	wVvgoZXiJP9GkaCqq4jBi098FPC03wBntnuFyGBsoTbDXkElkne+/NhZSguY
X-Google-Smtp-Source: AGHT+IGuBIOcMRF/OafkhjY8NU7f1jvnhdz+g3Hj0ZlA8L2qU3uHMBjJ5WYEkKD8OdQYCQuEpVfZZQ==
X-Received: by 2002:a05:620a:c43:b0:79f:ce5:a8bc with SMTP id af79cd13be357-7a1c06ad209mr173626685a.14.1721687181048;
        Mon, 22 Jul 2024 15:26:21 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a199002e31sm405587985a.57.2024.07.22.15.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 15:26:20 -0700 (PDT)
Date: Mon, 22 Jul 2024 22:26:18 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: mingli.yu@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [kirkstone][PATCH] docker-distribution:
 Use dup3 for riscv64
Message-ID: <Zp7cirGfFyEeM9fV@gmail.com>
References: <20240710062047.3128305-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710062047.3128305-1-mingli.yu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Jul 2024 22:26:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8844

staged locally pending master-next being merged to master.

Bruce

In message: [meta-virtualization] [kirkstone][PATCH] docker-distribution: Use dup3 for riscv64
on 10/07/2024 Yu, Mingli via lists.yoctoproject.org wrote:

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
> index f8981a88..50b6b302 100644
> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
> @@ -8,6 +8,7 @@ SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.8;name=dist
>             file://docker-registry.service \
>             file://0001-build-use-to-use-cross-go-compiler.patch \
>             file://0001-Fix-runaway-allocation-on-v2-_catalog.patch \
> +           file://0001-panicwrap-Use-dup3-on-riscv64-linux.patch \
>            "
>  
>  PACKAGES =+ "docker-registry"
> diff --git a/recipes-containers/docker-distribution/files/0001-panicwrap-Use-dup3-on-riscv64-linux.patch b/recipes-containers/docker-distribution/files/0001-panicwrap-Use-dup3-on-riscv64-linux.patch
> new file mode 100644
> index 00000000..ad091f1c
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
> +Upstream-Status: Inappropriate[The upstream has removed the panicwrap as [1]]
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
> View/Reply Online (#8833): https://lists.yoctoproject.org/g/meta-virtualization/message/8833
> Mute This Topic: https://lists.yoctoproject.org/mt/107137969/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


