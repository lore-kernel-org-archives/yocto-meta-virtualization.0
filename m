Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D02C83F2D
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 03:05:30 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.41122.1693796727992700507
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 03 Sep 2023 20:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=doWzNo4l;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-76f036041b4so34968685a.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 03 Sep 2023 20:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693796727; x=1694401527; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Exgz0svmbc5ZjohqDz2wFT0/jvDyNVlD4GtGdNvzPB8=;
        b=doWzNo4lqb9w+ulx9+0YH+L7kSYvcDVa5ATgrnJ12xa7L8s2c9SasV+Kw04LpianCm
         GwYKMJPbEU8/rP0ys8h05GP2o6/XvGfIfj5JKdJOc5w/ajI5mvVtr+6LrTGvNxMFoqZC
         7yImyTGkvFckXs6QfmZFe5AV9XLq/a+OjF8VSvhjnBAqh4LFrusZyExH/xFa5lnQAlb2
         sT6ft6HSV4fp+FhpInS+JschbM7o5BVcQeDj8EzGBoI4dAMewpfPpR6AXQqOjnm2lGSK
         OEwdROwgC8q5aJPofjzCil0mr1YD3NvCU2bhxWA4PLWm86ch9tAhHmsDVUnoVqAJiCdx
         Nd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693796727; x=1694401527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Exgz0svmbc5ZjohqDz2wFT0/jvDyNVlD4GtGdNvzPB8=;
        b=fBNTbnu+3/3IpCOGe5XtRtIW53k9HhAjslI1uAG7npbDHX2FfLNtxzwxCQV8GgeZ1T
         DxYr+4clmV23T4SBG+zOkXXSfMayiH/1fzVZFllRGFWKUC41fRiC2qTPNrjsbGI33s9O
         024pHgWR1pOTwZz4EBxYb41DtZKwEvyfuOQtNXCIIlq3d1N5jnBD+H3JbRnlNNILWWXj
         Y+8BYSM4bS0ldX2A/5tTlNxKVYDJJzezENCfuvyDp45NCWMiiSyFDjhxFOw+tsVkTG98
         QgYemhWT4QVqC/Xgd9XyrvB5DqQ4d9A+wLeOJ1dWkJ7yN7rerMCahmhY7rd2DAdwa8wV
         02pw==
X-Gm-Message-State: AOJu0Yx+ttVE5I919Sth3qbksGmYj1NwvebKuZ/w02nxHJJzmSQQnZNQ
	htuFfrVgi0/0zUChDYxs6Y+dR8MLVIs=
X-Google-Smtp-Source: AGHT+IHdXItdj9V6VvsKTwDiV7zjkpXB4zgTjr8Dqlg/0va7eEuLKmk7BcHkzt42I3CgcdEMHEyC+w==
X-Received: by 2002:a05:620a:4412:b0:767:ca49:bacd with SMTP id v18-20020a05620a441200b00767ca49bacdmr14670139qkp.30.1693796726933;
        Sun, 03 Sep 2023 20:05:26 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id d3-20020a37c403000000b0076dba7c70ecsm3095075qki.123.2023.09.03.20.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 20:05:26 -0700 (PDT)
Date: Mon, 4 Sep 2023 03:05:24 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] oci-image-tools: don't build for
 riscv64
Message-ID: <ZPVJdC6MVeoKurB+@gmail.com>
References: <20230901090308.3242531-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901090308.3242531-1-changqing.li@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 04 Sep 2023 03:05:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8267

Since riscv isn't tested with meta-virt at all, this isn't
the only recipe that has either build or runtime issues.

This is staged to master-next.

Bruce

In message: [meta-virtualization] [PATCH] oci-image-tools: don't build for riscv64
on 01/09/2023 Changqing Li wrote:

> From: Changqing Li <changqing.li@windriver.com>
> 
> Currently oci-image-tools has a do_compile error for riscv64. The
> problem could be reproduced by:
>     MACHINE=qemuriscv64 bitbake oci-image-tools
> 
> So explicitly set COMPATIBLE_HOST here to avoid it building for riscv64.
> When someone interested in using this recipe for riscv64 fixes the
> compile issue, this setting could be removed.
> 
> Also don't build packagegroup-container/packagegroup-kubernetes since
> they depends on oci-image-tools
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-containers/oci-image-tools/oci-image-tools_git.bb | 2 ++
>  recipes-core/packagegroups/packagegroup-container.bb      | 2 ++
>  recipes-core/packagegroups/packagegroup-kubernetes.bb     | 2 ++
>  3 files changed, 6 insertions(+)
> 
> diff --git a/recipes-containers/oci-image-tools/oci-image-tools_git.bb b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
> index 4beb3a63..8c5020b3 100644
> --- a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
> +++ b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
> @@ -29,6 +29,8 @@ EXTRA_OEMAKE="BUILDTAGS=''"
>  
>  S = "${WORKDIR}/git/src/github.com/opencontainers/image-tools"
>  
> +COMPATIBLE_HOST:riscv64 = "null"
> +
>  do_compile() {
>  	export GOARCH="${TARGET_GOARCH}"
>  	export GOROOT="${STAGING_LIBDIR}/go"
> diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
> index 8d418e95..c41576a3 100644
> --- a/recipes-core/packagegroups/packagegroup-container.bb
> +++ b/recipes-core/packagegroups/packagegroup-container.bb
> @@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
>  
>  inherit packagegroup
>  
> +COMPATIBLE_HOST:riscv64 = "null"
> +
>  PACKAGES = "\
>      packagegroup-container \
>      packagegroup-lxc \
> diff --git a/recipes-core/packagegroups/packagegroup-kubernetes.bb b/recipes-core/packagegroups/packagegroup-kubernetes.bb
> index 70dc9713..7e6937b1 100644
> --- a/recipes-core/packagegroups/packagegroup-kubernetes.bb
> +++ b/recipes-core/packagegroups/packagegroup-kubernetes.bb
> @@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
>  
>  inherit packagegroup
>  
> +COMPATIBLE_HOST:riscv64 = "null"
> +
>  # k3s has this restriction
>  inherit features_check
>  REQUIRED_DISTRO_FEATURES ?= "seccomp"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8263): https://lists.yoctoproject.org/g/meta-virtualization/message/8263
> Mute This Topic: https://lists.yoctoproject.org/mt/101090972/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


