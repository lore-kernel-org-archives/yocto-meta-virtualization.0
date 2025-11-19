Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2082ACF648E
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 23:25:52 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20928.1763594744072852847
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 15:25:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WAlb5LzB;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8b2d7c38352so152095185a.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Nov 2025 15:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763594743; x=1764199543; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BiZ966hMEq7KZxiE5fk2TWpoNGEKrWuB01NS6h4e25w=;
        b=WAlb5LzBnkITAEyVk5Tckl1poZAGl7/h93sjzO+0Pt8gc2a8Qehvxwz8LrQIAuoCD0
         xpBy0q4nLZjZhVheeEyYWwsHegPyEHFAoDwC36vRizI7aYZguOrhhI7vJNfFWrogkplQ
         RlICLZOJXwRoIkFRlP8o93qOf1cQ93bpI2HhntoFmxb4vqaLgg7EnJOgUPtSjgRwOnN+
         H++wa+2ueWbBPOdYgLXOyh9JXu+IDTI45yC1/Qd9OvYXB5EcDI8QkTHrIdk4TYfsxKIh
         KQJI/wvLZYc+4AQXrY7LeomZ3vvkSxoW9UZzwy26vXKjhUHOS+H474v6DcXQkDBB4FJL
         Migw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763594743; x=1764199543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BiZ966hMEq7KZxiE5fk2TWpoNGEKrWuB01NS6h4e25w=;
        b=kG4P84yasTD0ijy1RofAwrPL2M0eMS4VBjjuxanTDiYjj6clKAzzWfL2bEtINT2yJl
         zoB99SbXFxz7WAzW3DZadqGwg3WQMRiZruPoCAuj4gX9D9M7uPstH3h+osgE7+v8ZfXa
         pFuo0e6imKuxtxFGg5X7RuiP95PVvv6KYuLnczHSZ4ePxo8ngouvzjDk/LkqhmN0cjoj
         Sg9+ZHQKPRwe5ugfqAi4NeQ2uldxb4r3tI2r8Hg0bqv0IBKPMGAOe1FGs2qcQBB0Sn2j
         wYMYuHOVTSEtzB+cNx/KPP2ogTAObjIJ61YbDtuiF0jUFdNYGRqfVEqpzLn7VtQUB/ms
         TNKg==
X-Gm-Message-State: AOJu0Ywjq5WjDG264PT32690hqskWHhRhsEQz60jgjFkAvna41P7f7nx
	N96MXQ7XMcNLpoHGPIeFBiNDw011qPbmhF8/b8TA4L3BXGUstlh7L0zOq02c4i8i
X-Gm-Gg: ASbGncsQYF+xoj1NQQ9mYbkF5MYoqZ7N3qDxszGIJtUzajBYBFU/7ouZAkU8bKYbYke
	wn0hacbDAX3A9/iWYdZbejI8TzMmDiMrNAX3JkUOY/H8sMUOkO6Ax/J5jq2eDN0Rurnh8IECJDK
	VgDFCCauGK8vck/+L4fLRdVGn4qnlx7uufw4CNCkilDtngE2vnF7O1+gQBTSDa5a/dgfa+XKKgT
	/z4yPg7f8lotzZNwIpeNmkzf/ZX6R/WpqtuXZUvGFcDtJZoD6JLP8v4f9Ibl9QEJAqfcRKqjCGl
	IDmPD+WduczVg/zaPv0dOY3L6XkIm2X1ORG/vnzyQEdy9QDbjw2Xg6PW5XBUDCUJBMu0iIjvOW4
	nXuO/LcMF+StauhgQG/08z7Kan4aJWALlumpkedYryUd7y3lDarVwCec8JGpVwmddMO/92eKDRh
	Lbi6hlgSVYshTCC8o39ssxQWuMAVleY2KX2JZpZ0o8NdzCVo1kUxoDn+vel97xTw8BVgZv11R7H
	sU=
X-Google-Smtp-Source: AGHT+IF6zYU5B3zgk2BnCnlYqOq0cW25Tqwzd92AOjI2L8Ys90Doss/Ez+3dk04te81WEXkwqG+PEQ==
X-Received: by 2002:a05:622a:1802:b0:4ee:4656:54e8 with SMTP id d75a77b69052e-4ee4b5993b5mr4761681cf.26.1763594742865;
        Wed, 19 Nov 2025 15:25:42 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48e8cdebsm5663051cf.31.2025.11.19.15.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 15:25:42 -0800 (PST)
Date: Wed, 19 Nov 2025 18:25:40 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: vanusuri@mvista.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [meta-vitualization][scarthgap][patch]
 containerd: upgrade 2.0.5 -> 2.0.7
Message-ID: <aR5R9K5KBYCiVxMe@gmail.com>
References: <20251110071513.1199491-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110071513.1199491-1-vanusuri@mvista.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Nov 2025 23:25:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9445

merged.

Bruce

In message: [meta-virtualization] [meta-vitualization][scarthgap][patch] containerd: upgrade 2.0.5 -> 2.0.7
on 10/11/2025 Vijay Anusuri via lists.yoctoproject.org wrote:

> Includes CVE fix for CVE-2024-25621 and CVE-2025-64329
> 
> Release Notes:
> https://github.com/containerd/containerd/releases/tag/v2.0.7
> 
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../containerd/containerd-opencontainers_git.bb             | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
> index d041b699..3144a5a6 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> @@ -5,7 +5,7 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
>                 support as well as checkpoint and restore for cloning and live migration of containers."
>  
>  
> -SRCREV = "fb4c30d4ede3531652d86197bf3fc9515e5276d9"
> +SRCREV = "4ac6c20c7bbf8177f29e46bbdc658fec02ffb8ad"
>  SRC_URI = "git://github.com/containerd/containerd;branch=release/2.0;protocol=https;destsuffix=git/src/github.com/containerd/containerd/v2 \
>             file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
>             file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
> @@ -15,8 +15,8 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/2.0;protocol=ht
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1269f40c0d099c21a871163984590d89"
>  
> -CONTAINERD_VERSION = "v2.0.5"
> -CVE_VERSION = "2.0.5"
> +CONTAINERD_VERSION = "v2.0.7"
> +CVE_VERSION = "2.0.7"
>  
>  # EXTRA_OEMAKE += "GODEBUG=1"
>  
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9435): https://lists.yoctoproject.org/g/meta-virtualization/message/9435
> Mute This Topic: https://lists.yoctoproject.org/mt/116215725/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


