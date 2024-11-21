Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E05ED75BB3
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 04:30:30 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.3756.1732163426406410415
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Nov 2024 20:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ITX3SO3a;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d405853c0fso3606906d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 20 Nov 2024 20:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732163425; x=1732768225; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8vYb145bsVLuHz0cXkvQKsjEe4nXr2DYmkJpTKC43IM=;
        b=ITX3SO3abTee98P/d2xnhoISW6jOOYos2ycGucLHgv+lXKzAbNiNSyJ2U8SLJoQGVK
         PCPvuKt7N4ldn/rJadEz9vgy280Yhm/LVHYoJmro3efNV62Ii84nvJ2eKPrWWRzRCeDm
         tO1b3ly5Uyp/VArh+msNyHae02LtQfcOzcQcKNue2S0RWC+Lzg9VGBf98B0qUEvxGSs8
         bOKBVyBy9ZIl032/DVkyRNQuR7PsAb9H5Q3XvaOdnozEDud3FORqRFRP8TSD/YbSnbS4
         4p3D2DCUKvE+V+CVZ3t3xcSk6eFVx/3Qjjcbd6QqNXy2vjKQupKX1KH9AcBFcgBn+/9v
         c3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732163425; x=1732768225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vYb145bsVLuHz0cXkvQKsjEe4nXr2DYmkJpTKC43IM=;
        b=iDmP4gAV4rcs6AqSDZhiDMy/f4UgkZKobLH75XxOYDDxpqBpn52UJqbaGgUEH0R1k3
         RylhO6Yl7ieBfPZGo1DbzcCUl9RhfbBkFttGp8j+3YgNRQDTqsI77dBy/LT9dMzWUl8z
         VRfts0WzlSo8rK3ta2V2lq3xR78n1le04HsSGvV5ywxNSqwQ7bVTOhdQrKUN3PMbVgIy
         DHCDZuoELEF5J2Z/7fWwNp24ah17lRex+RpBsPjnVDXHMYhJMmWef5EaLHVv3Wc5K37C
         fpRI/bYBmeRhSC4qf+sVMdDjXERYhvogEwqv1FAQuyLAW5bckJmmEKlXqhLk+3l9TqXY
         ukag==
X-Gm-Message-State: AOJu0YxaMXTm9OL9Y5GFZRhrXeMsnM1AOjkl1/vSSqzha7X67uUf6kl2
	PilX4q/Eqa+LHbLyxGLxHE7ffcmdEvq5rQxCCEbYmbEMJEKLcYmY
X-Gm-Gg: ASbGncuB0osG4vw1FjAOKUVMN+Keqg+JAJj8K1DU0HZiW04q8BmNaYDQfn6msNndxod
	BRssr1qOtzog0yvHN9sVwOr+Jopda/UGZdjDleZRNMQm6/xM6BvhBbWyfLCjPsXmwvlCGgYwFmz
	A8vLei3dbpYJ2frJi4BBH8owj1nSsCh1aMtjwXiILG5gnsJTUySjs/dODmoNv3247ESFPd9JI7M
	Iq+vZopMh8WR526Wlb5maU7DLw2K8rR/O8m0fP7eWH3sMj4r7d/hd/7l134FM9Uoz5BuLOiwFy5
	duXCD4CVFccw0HPCCyeG2nASDIK2
X-Google-Smtp-Source: AGHT+IFs7F/9yfV+e8I0nGGH9xB30al5NXFgJqW4uTloJCfTsLCik5c4gA6lrpvqpuMEBjAZmuuq9Q==
X-Received: by 2002:a05:6214:e48:b0:6d4:180e:e7a with SMTP id 6a1803df08f44-6d4377ab8edmr67002826d6.24.1732163425369;
        Wed, 20 Nov 2024 20:30:25 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d438136e21sm18332846d6.111.2024.11.20.20.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 20:30:24 -0800 (PST)
Date: Thu, 21 Nov 2024 04:30:22 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: martin.jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] packagegroup-container: respect
 seccomp in DISTRO_FEATURES
Message-ID: <Zz63Xqm67muzG4LN@gmail.com>
References: <20241120085033.3104538-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120085033.3104538-1-martin.jansa@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 04:30:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8987

Thanks for the fixup!

I appreciate the extra / extended builds that you do against
the layers and pickup these sorts of things that my functionality
based testing can miss.

merged.

Bruce

In message: [meta-virtualization] [PATCH] packagegroup-container: respect seccomp in DISTRO_FEATURES
on 20/11/2024 Martin Jansa via lists.yoctoproject.org wrote:

> * fix f53b101d455d7e7447fa83f2faecb5e05d595b3e
> 
> * you might want to skip whole packagegroup-netavark without
>   seccomp, but without this parsing world in DISTRO without
>   seccomp fails with:
> 
> ERROR: Nothing RPROVIDES 'netavark' (but meta-virtualization/recipes-core/packagegroups/packagegroup-container.bb RDEPENDS on or otherwise requires it)
> netavark was skipped: missing required distro feature 'seccomp' (not in DISTRO_FEATURES)
> NOTE: Runtime target 'netavark' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['netavark']
> ERROR: Nothing RPROVIDES 'packagegroup-docker' (but meta-virtualization/recipes-core/packagegroups/packagegroup-container.bb RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'packagegroup-docker'
> NOTE: Runtime target 'packagegroup-docker' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-docker']
> ERROR: Nothing RPROVIDES 'packagegroup-oci' (but meta-virtualization/recipes-core/packagegroups/packagegroup-container.bb RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'packagegroup-oci'
> NOTE: Runtime target 'packagegroup-oci' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-oci']
> ERROR: Nothing RPROVIDES 'packagegroup-container' (but meta-virtualization/recipes-core/packagegroups/packagegroup-container.bb RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'packagegroup-container'
> NOTE: Runtime target 'packagegroup-container' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-container']
> ERROR: Nothing RPROVIDES 'packagegroup-lxc' (but meta-virtualization/recipes-core/packagegroups/packagegroup-container.bb RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'packagegroup-lxc'
> NOTE: Runtime target 'packagegroup-lxc' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-lxc']
> ERROR: Nothing RPROVIDES 'packagegroup-cni' (but meta-virtualization/recipes-core/packagegroups/packagegroup-container.bb RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'packagegroup-cni'
> NOTE: Runtime target 'packagegroup-cni' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-cni']
> ERROR: Nothing RPROVIDES 'aardvark-dns' (but meta-virtualization/recipes-core/packagegroups/packagegroup-container.bb RDEPENDS on or otherwise requires it)
> aardvark-dns was skipped: missing required distro feature 'seccomp' (not in DISTRO_FEATURES)
> NOTE: Runtime target 'aardvark-dns' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['aardvark-dns']
> ERROR: Nothing RPROVIDES 'conmon' (but meta-virtualization/recipes-core/packagegroups/packagegroup-container.bb RDEPENDS on or otherwise requires it)
> conmon was skipped: missing required distro feature 'seccomp' (not in DISTRO_FEATURES)
> NOTE: Runtime target 'conmon' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['conmon']
> 
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  recipes-core/packagegroups/packagegroup-container.bb | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
> index aba1d3e1..21402d65 100644
> --- a/recipes-core/packagegroups/packagegroup-container.bb
> +++ b/recipes-core/packagegroups/packagegroup-container.bb
> @@ -48,13 +48,12 @@ RDEPENDS:packagegroup-cni = " \
>  "
>  
>  RDEPENDS:packagegroup-netavark = " \
> -    netavark \
> -    aardvark-dns \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'netavark aardvark-dns', '', d)} \
>  "
>  
>  RDEPENDS:packagegroup-container-tools = " \
>      skopeo \
> -    conmon \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'conmon', '', d)} \
>      umoci \
>      ${@bb.utils.contains('VIRTUAL-RUNTIME_container_engine','podman','podman-tui nerdctl podman-compose','',d)}  \
>      ${@bb.utils.contains_any('VIRTUAL-RUNTIME_container_engine','dcoker docker-moby','docker-compose','',d)}  \
> -- 
> 2.47.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8984): https://lists.yoctoproject.org/g/meta-virtualization/message/8984
> Mute This Topic: https://lists.yoctoproject.org/mt/109681277/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


