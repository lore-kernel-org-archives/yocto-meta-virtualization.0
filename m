Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F3E5C7619A
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 17:03:09 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.49618.1681318979505461185
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 12 Apr 2023 10:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=AVifK0WE;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id z3so3916897qvs.8
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 12 Apr 2023 10:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681318978; x=1683910978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NF6HYYxLhgI1iQ8u2EoBXq3dAc+r6ZsKQBm1lSa+aWo=;
        b=AVifK0WE4vyzw+cAH/uA6k0D9/As/YJ0aZpwu7g3209DHLTha6HRLXyaxKDSslo5p9
         eUAiOzKw+J5MtNOnyBPxSQLdVTLp1I4kPKFKLHLZA8IVRulg4t3DTdGfO98cdIm97v/z
         kOLO2RRH7H1VLQRHNUS9Xs0eBsdMQZeEDwB53vgAolXUdNjMZxR5uCg3hkA86XVe2gTM
         8D85XmpTZplow6IDOIrDEDeES5MM6kgxz2H8wCHXdJ9Pz7YOxR/EBB4MSYV6h03eDOlj
         1jT7yRpN5WLsBKe8Ph3G9WXDi5ZkiTxopTyz8R89GNz3FFmqd7jTSJv1xBpnNADZdSR4
         xyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681318978; x=1683910978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NF6HYYxLhgI1iQ8u2EoBXq3dAc+r6ZsKQBm1lSa+aWo=;
        b=N4pDNpB/RvVfsyDz/WHqa0puYp10wUS/h37m9+JJHO061Ti66A7fzV3G42eGZpiIvn
         lefsxrc3bt/IlCKNw5OEByP4XnapVlf0RNuTwE7QCiwWcXTPfLvm4xCrJ53l3DtS7wWF
         CuoRTF58UcM18W5V6d4pmAdMJ8e4Y+DTFJPjaoRR+a+05uoaqA4zBsU3o64FW4yWuMld
         bvOHzj44fj3+kNYAHi9ohkY6tgGBlH1pYgnyY3LeC8PLxu9FNI0gBIUva8CCVRx1gcYd
         NoSNM4UDPVaEU41xMi2Pdld8lCGSCKA1m67GTKZ+MDejbdrwVZSe0IKndPPtONwYKfLG
         UXfw==
X-Gm-Message-State: AAQBX9f2BlrtwRVGRrAijpS0cAghpp7/pQnw1HHoCE8XGe5OrTARLsl5
	1PKzKAMFZeGAg9EqusHIThcd9Wp5lJpj4A==
X-Google-Smtp-Source: AKy350aCDq8KqAU1YYlNlrvqqmACQYLqTfNXnrFlg5K4O1qsVahnbAsSiGr5DRPSUcHg2tYh8YSn1w==
X-Received: by 2002:ad4:4eec:0:b0:5ef:45a7:a3a5 with SMTP id dv12-20020ad44eec000000b005ef45a7a3a5mr2867876qvb.27.1681318978464;
        Wed, 12 Apr 2023 10:02:58 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id j11-20020a056214032b00b005e379d2ef98sm4932257qvu.105.2023.04.12.10.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 10:02:58 -0700 (PDT)
Date: Wed, 12 Apr 2023 13:02:56 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH] containerd: upgrade to
 1.6.19
Message-ID: <ZDbkQOKSfBwlRn0V@gmail.com>
References: <20230329093815.46676-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329093815.46676-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 12 Apr 2023 17:03:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7983

merged to kirkstone.

Bruce

In message: [meta-virtualization][kirkstone][PATCH] containerd: upgrade to 1.6.19
on 29/03/2023 Chen Qi wrote:

> 1.6.19 is the latest release for 1.6 branch.
> This upgrade fixes CVEs such as CVE-2023-25173 and CVE-2023-25153.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../containerd/containerd-opencontainers_git.bb             | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
> index 5fe3e4fa..6c0266ac 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> @@ -5,7 +5,7 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
>                 support as well as checkpoint and restore for cloning and live migration of containers."
>  
>  
> -SRCREV = "ccfc27e30d9f599efe6a7471ea1932dedf2beec8"
> +SRCREV = "1e1ea6e986c6c86565bc33d52e34b81b3e2bc71f"
>  SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=https;destsuffix=git/src/github.com/containerd/containerd \
>             file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
>             file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
> @@ -15,8 +15,8 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=ht
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1269f40c0d099c21a871163984590d89"
>  
> -CONTAINERD_VERSION = "v1.6.12"
> -CVE_VERSION = "1.6.12"
> +CONTAINERD_VERSION = "v1.6.19"
> +CVE_VERSION = "1.6.19"
>  
>  # EXTRA_OEMAKE += "GODEBUG=1"
>  
> -- 
> 2.37.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7962): https://lists.yoctoproject.org/g/meta-virtualization/message/7962
> Mute This Topic: https://lists.yoctoproject.org/mt/97924793/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


