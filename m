Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3459C636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 20:11:32 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.3626.1676491889243831904
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 12:11:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CYPEC5DK;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id q13so23106883qtx.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Feb 2023 12:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l/idjMl3CBMgodaFFHqGyKpsMq0GoFEFS/08RoSUubI=;
        b=CYPEC5DKLoOXmL5ilwb1lqRjQ1COV9JHKG/1nSVOK4EItZUk71M4jU9RIEuuy390r3
         6Oojcdfn93X2ArRQSI/R8L2nxH0HnshbgaQ9iCeZGXHIkxnRw74losL6GsmK8Dv0HXDH
         gPL/sCTQtY/UNDkf6IpkPHFXe20tP9Zc3Dw6ACEA4KsFuyVzhguxhya+K/GoX6dqtkMs
         79tK4LmW8YL9GgxFCD4YlI+zsfrwhKd/GOfSgXfkb1gihayZ4HN/tgqWiCWXJWyyxInI
         FOb5j5FNhudkfUFx+hwRnD9xeJ8iuonJ76EISvssxiIzqzLJS9J9dxe3icYYjk3+/F2s
         3+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/idjMl3CBMgodaFFHqGyKpsMq0GoFEFS/08RoSUubI=;
        b=dFD3oH2FpOrap8WLfiwjbjJE6rtlZuiLrkCWCwCRAYSwfowPqz+lGtQ7wC7OmH9kVP
         FWSxib+zKqxJgtVvxzfSHhtrN8Uhhl4GEkFE8ksWXoObyvoTbIOCmNd2nKAT0UIKQ898
         2dTvvW58dbJfraV9SMr7g1gD+NY1/91weyo9UaVu36ZBibtEq+NlHl94qu2Br39oW4KG
         PAkANtgnCZPWAyTZvWOMBF97N/BCENd/y6JpJAbfprO4PCS9h/pcvcpfgVkf/gn1tPFI
         g96HctRV8NOrVLmloMmEscxcH2a5nEaNXhRE/RPacD8Gs/44ysh/La3Bp9pG1oMHui6N
         D3fA==
X-Gm-Message-State: AO0yUKVWGe7jXmRQ1BnN1HEucqlBeYD008pcXgtVLZ6hfosYfrDzHgLu
	rvhSvWrgD2SwrP5nshUbwCP+RxQsT3TZ2g==
X-Google-Smtp-Source: AK7set9K5OU3CxgRHrCjbS11nS95xPTcdj1Rh6iWdotO92oVYsmhhgrR6X8D9IbJKsrHj4IxLAhcWw==
X-Received: by 2002:a05:622a:14d2:b0:3b8:58d0:b4d5 with SMTP id u18-20020a05622a14d200b003b858d0b4d5mr4858208qtx.0.1676491888299;
        Wed, 15 Feb 2023 12:11:28 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id n68-20020a374047000000b0073b4a55a2d1sm5721428qka.124.2023.02.15.12.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 12:11:27 -0800 (PST)
Date: Wed, 15 Feb 2023 15:11:26 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH] containerd: update to
 1.6.12
Message-ID: <Y+08bkIcxC20ec3I@gmail.com>
References: <20230214090945.27228-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214090945.27228-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Feb 2023 20:11:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7857

merged

Bruce

In message: [meta-virtualization][kirkstone][PATCH] containerd: update to 1.6.12
on 14/02/2023 Chen Qi wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Bumping containerd to version v1.6.12-2-gccfc27e30, which comprises the following commits:
> 
>     3595dd04b fix: check for tmpfs when evaluating if userxattr should be used
>     1899ebcd8 Prepare release notes for v1.6.12
>     ec5acd4c1 CRI stream server: Fix goroutine leak in Exec
>     9743dbae8 [release/1.6] update to go1.18.9
>     3d24d97ba Prepare release notes for v1.6.11
>     bb96b21e5 fix: support simultaneous create diff for same parent snapshot
>     15b541238 Fix order of operations when setting lease labels
>     9fdf713e5 Added nullptr checks to pkg/cri/server and sbserver
>     56593cca5 cri: add pod uid annotation
>     8ec051a6b [release/1.6] go.mod: use golang_protobuf_extensions v1.0.4
>     e639ecd7c Prepare release notes for v1.6.10
>     5af8d89ce overlayutils: Add fastpath for userxattr check
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../containerd/containerd-opencontainers_git.bb             | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
> index e95ca175..5fe3e4fa 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> @@ -5,7 +5,7 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
>                 support as well as checkpoint and restore for cloning and live migration of containers."
>  
>  
> -SRCREV = "6c41694da9eb09c2f1f49a5a5fbec4e970cfb460"
> +SRCREV = "ccfc27e30d9f599efe6a7471ea1932dedf2beec8"
>  SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=https;destsuffix=git/src/github.com/containerd/containerd \
>             file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
>             file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
> @@ -15,8 +15,8 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=ht
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1269f40c0d099c21a871163984590d89"
>  
> -CONTAINERD_VERSION = "v1.6.9"
> -CVE_VERSION = "1.6.9"
> +CONTAINERD_VERSION = "v1.6.12"
> +CVE_VERSION = "1.6.12"
>  
>  # EXTRA_OEMAKE += "GODEBUG=1"
>  
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7853): https://lists.yoctoproject.org/g/meta-virtualization/message/7853
> Mute This Topic: https://lists.yoctoproject.org/mt/96956385/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


