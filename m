Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B6B4C25B48
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 03:20:25 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.218599.1698376818361402293
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 26 Oct 2023 20:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b4cJBJ6v;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7781b176131so113646585a.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Oct 2023 20:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698376817; x=1698981617; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7fzVV42joTRdnQ9zKWlHgCU8/+eb6wq5MQgagj33m6U=;
        b=b4cJBJ6vL9ELih2VfJG2vMUnChwBN6xW/0ZP6UQl8x0RHyN+b02fUuTrnQ5Ysnze+i
         14A3kFpllrImoylRTej7+WHQoXZpEevysLcrym/dLXW2vEMPhz/2XPuk4dWVlNfvfgKG
         bhxIOz4b+ZYzcsMVatgt3afnaexWvSeHWyzBcmip/KQwMvUXDPJeoj81xdWeacC5rqIV
         8lc/i/8aK73Y6+XT9bA46/QiJqr2G6XwVNOI5NOXGM/uzmNgrG3va59vV9lrMXvClYRR
         pT8EnQrMK21dT+7b1/wBuePCXSw61V/NoulEc3WcVkjRn8U2w/St8msVslmk69PfRDEb
         +Kdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698376817; x=1698981617;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fzVV42joTRdnQ9zKWlHgCU8/+eb6wq5MQgagj33m6U=;
        b=GIPt2Wk0Oyp7g60QH5c/DyVuXh8KqgFZHamx2vdkVWPKd3PJanRhNzRHNWqKWbA/OK
         fIu8hlbphuM+/su8bwYNVqsloc7FuORx/U8yFLmqtSlxnuXPKMpSq1zm7uWCcV5PPYF2
         k+Al66m/hUQRcWx/1J0EX8x6JsSCE9q/Sy9QTi1nsplt/DPVxvrCgJb/2gilI8RIIlKK
         +UogDT9bILht4a5LWJRIMqFqKlRj2E8ZXf7Ndvz8Kzy9A4tgzzavWKJDz9vvmUPTpLJa
         k/rugpZY+yLxuj4h1xO9rMVg2rEcrNtMx77Xqn5uPc2LNEFWQb4aeyA1Y9AMSy2hwj46
         TobA==
X-Gm-Message-State: AOJu0YzL5cYWr328SgPj1TNf972VlEsUTwqtdWfKFnJxMao0VT+cONgr
	2NaSUJcX7SxZ3ncYnFKrvLRdpL3LIhu32Jxi
X-Google-Smtp-Source: AGHT+IGaGCwrvjATC4Mv+RRuXxWUVWEhGprTqofS9NQfiAZLjlZ87Xi/4hU7ZXMCUQso2lJb44vGiw==
X-Received: by 2002:a05:620a:8d8b:b0:775:985e:f5c2 with SMTP id rc11-20020a05620a8d8b00b00775985ef5c2mr1057588qkn.17.1698376817057;
        Thu, 26 Oct 2023 20:20:17 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id cx13-20020a05620a51cd00b007671b599cf5sm235101qkb.40.2023.10.26.20.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 20:20:16 -0700 (PDT)
Date: Fri, 27 Oct 2023 03:20:14 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: kai.kang@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [PATCH v2 1/2] umoci & buildah & podman-tui: mark incompatible
 with mips
Message-ID: <ZTssbvObXT4QwnGF@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025022240.1341381-2-kai.kang@windriver.com>
 <20231025022240.1341381-1-kai.kang@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 27 Oct 2023 03:20:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8401

merged to master-next.

I expect to have master-next -> master tomorrow.

Bruce

In message: [PATCH v2 1/2] umoci & buildah & podman-tui: mark incompatible with mips
on 25/10/2023 kai.kang@windriver.com wrote:

> From: Kai Kang <kai.kang@windriver.com>
> 
> Since the runtime dependency skopeo has been marked incompatible with
> mips, mark for umoci accordingly.
> 
> buildah and podman-tui rdepends on podman which has been marked
> incompatible with mips, so mark for them too.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  recipes-containers/buildah/buildah_git.bb       | 2 ++
>  recipes-containers/podman-tui/podman-tui_git.bb | 2 ++
>  recipes-containers/umoci/umoci_git.bb           | 2 ++
>  3 files changed, 6 insertions(+)
> 
> diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
> index 5155cbb1..ef1feead 100644
> --- a/recipes-containers/buildah/buildah_git.bb
> +++ b/recipes-containers/buildah/buildah_git.bb
> @@ -20,6 +20,8 @@ inherit pkgconfig
>  inherit features_check
>  REQUIRED_DISTRO_FEATURES = "seccomp ipv6"
>  
> +COMPATIBLE_HOST = "^(?!mips).*"
> +
>  GO_IMPORT = "github.com/containers/buildah"
>  GO_INSTALL = "${GO_IMPORT}"
>  GO_WORKDIR = "${GO_INSTALL}"
> diff --git a/recipes-containers/podman-tui/podman-tui_git.bb b/recipes-containers/podman-tui/podman-tui_git.bb
> index 1a40d0ec..0b1924f9 100644
> --- a/recipes-containers/podman-tui/podman-tui_git.bb
> +++ b/recipes-containers/podman-tui/podman-tui_git.bb
> @@ -41,6 +41,8 @@ PODMAN_PKG = "github.com/containers/podman-tui"
>  inherit go goarch
>  inherit pkgconfig
>  
> +COMPATIBLE_HOST = "^(?!mips).*"
> +
>  do_configure[noexec] = "1"
>  
>  BUILD_TAGS ?= "exclude_graphdriver_btrfs exclude_graphdriver_devicemapper"
> diff --git a/recipes-containers/umoci/umoci_git.bb b/recipes-containers/umoci/umoci_git.bb
> index feaf6dff..62b42b8e 100644
> --- a/recipes-containers/umoci/umoci_git.bb
> +++ b/recipes-containers/umoci/umoci_git.bb
> @@ -17,6 +17,8 @@ GO_IMPORT = "github.com/opencontainers/umoci"
>  inherit goarch
>  inherit go
>  
> +COMPATIBLE_HOST = "^(?!mips).*"
> +
>  # This disables seccomp and apparmor, which are on by default in the
>  # go package. 
>  EXTRA_OEMAKE="BUILDTAGS=''"
> -- 
> 2.34.1
> 

In message: [PATCH v2 2/2] runv: set COMPATIBLE_HOST
on 25/10/2023 kai.kang@windriver.com wrote:

> From: Kai Kang <kai.kang@windriver.com>
> 
> runv rdepends on qemu, so update COMPATIBLE_HOST for runv to accord with qemu.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  recipes-core/runv/runv_git.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/recipes-core/runv/runv_git.bb b/recipes-core/runv/runv_git.bb
> index e5a5abd3..73cd81a6 100644
> --- a/recipes-core/runv/runv_git.bb
> +++ b/recipes-core/runv/runv_git.bb
> @@ -19,6 +19,12 @@ inherit goarch
>  inherit pkgconfig
>  inherit autotools-brokensep
>  
> +# accord with qemu
> +COMPATIBLE_HOST:mipsarchn32 = "null"
> +COMPATIBLE_HOST:mipsarchn64 = "null"
> +COMPATIBLE_HOST:riscv32 = "null"
> +COMPATIBLE_HOST:powerpc = "null"
> +
>  PACKAGECONFIG[xen] = "--with-xen,--without-xen,"
>  AUTOTOOLS_SCRIPT_PATH = "${S}/src/import/"
>  
> -- 
> 2.34.1
> 


