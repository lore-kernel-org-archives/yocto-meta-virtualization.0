Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49B3FF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 11:48:53 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11498.1777376930113005691
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 04:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hPf7bXBQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8f231f3b130so359106885a.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 04:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376929; x=1777981729; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ue9y2V23ZemMf1y/sOYwIHzLeaz0eMabRkU4V60mYPY=;
        b=hPf7bXBQ35IBk+lDZ71hD57LhNc/ZO1dLi6fmu4wF2sSYtKUiloJeXIyQmCI3VAvp5
         UjQNZB/0QUYhPdT2HCAuWRA8DzqQMF80O9VCTkL3aJB2YMzJzG7wFnn2EUCRKjxFjN8s
         gE9CPjIbfmgxM3x7GQmGfl79D1XlxqbhLMRzfRgvf9qDoesdBvF/2yGd8Nxu8bv8gmuz
         dAURCgeXTR4gZxmwaiWzQfI6lqGeJefQv1ARTTdky2lJNmsqCpklIuwz/wHJz29WXbZi
         wJBn3WB2mDvDzshbZQ0nsV9ThJ5aISP6pDVCcg2kNi200eoSpW49Ow4wLyxyJeSW4Xzc
         oElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376929; x=1777981729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ue9y2V23ZemMf1y/sOYwIHzLeaz0eMabRkU4V60mYPY=;
        b=Wm3z/O7K6XH5O0I9VN1pUEYZvM/Auupo2pypnO5YiMZwDBsGJjslUVDEABG1EUGVIO
         OCH6KK7YDM0l8DrwmpEAFIlzMFX6l3h186LgWC/ZHulSOI73py/iLSWhhNyrz+S/8SnA
         iNoD2ov7Xkocv/g+TpdyqGYaBScdnIMCNZNXBLg2oEXBZ79ZGbWowkmkZ1DfaVnTu3rZ
         kE+6ZaVP5DyQmTEFwg7CIAQ9ZH61FOFkDdFO9P627y9GkbxQ4dsIEa8qCxkZTSrPfVbo
         7n/ZwD8vMNsU2GLtUA5On7mD4jkIewpsw2rmeUa99fd3hN4gF2F3Ls/ybfxt73ARye8f
         L7Rg==
X-Gm-Message-State: AOJu0YxEXXHTAwZG1FSTEfY7fTMgdcZ7B0s/sgkbku0kWfJt9Jo50x2Y
	qGEdmMZovhqe5ZGhRbYLRLmry9B4aCj5ab9IrB1gT8LtLdUhPZrXGGtk
X-Gm-Gg: AeBDieuLFOqILLjEAT/HbLNHRDVf9X12lnvgnWioJLYpV1j50VAZ7aOwI9W7iSte5WM
	RZY+9lkO8invwQLETSGE8y91CcJU2eBlcU6hVuYaDGfZ+0pUWxFcaI4igtqiYEyKdctS+wHI4Qz
	j/RcxOdrBBuBXOxyydmPaschomoaTMTAiGUz+2crWY7y1V3d2mQYNAuHASSAvO6UFloezQt1KDh
	iVdmWfDdSpXEZ+B9w6djzY+CjC7MSUytUpXRHzVfqYKksvlBxUwleMeeVtSKHqT9Fezd9z7UZHK
	x+GHj+o11elpPWvEKRBKw6Lmss6htuEAbP1fj1ppNRBpLQVZXNeYdQcm9qli5NQUqjbBaMaTVb4
	Ae9EA2jaWjgYQB+Xt5sqSOMeWz9gaSK+Mxr8A7xkbtx8sk3lSVlEx7my1JF49IM58Hw2VRJkEHf
	ywEsbDMXwJI50gZBYUgbx6NQKoxelM32nLIJfBaniL6EcgdYv0nwTZ3010Ou3Kmk7uvc4rpMOTW
	27cihkH0tParc3vMXfl34lU9KvjNoNxpmQbefa+2qUr/oQ=
X-Received: by 2002:a05:620a:4411:b0:8ef:ca26:dcf8 with SMTP id af79cd13be357-8f7d3df6789mr352521085a.0.1777376929040;
        Tue, 28 Apr 2026 04:48:49 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c84b1f71sm158837985a.39.2026.04.28.04.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:48:48 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:48:46 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: ticotimo@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org,
	Tim Orling <tim.orling@konsulko.com>
Subject: Re: [meta-virtualization][PATCH] distro/vruntime: drop obsolete
 DISTRO_FEATURES_DEFAULT
Message-ID: <afCenlz_xtcVbMr0@gmail.com>
References: <20260424144215.20428-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424144215.20428-1-tim.orling@konsulko.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 11:48:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9768

I changed the commit log slightly, but this is now merged.

Bruce

In message: [meta-virtualization][PATCH] distro/vruntime: drop obsolete DISTRO_FEATURES_DEFAULT
on 24/04/2026 Tim Orling via lists.yoctoproject.org wrote:

> DISTRO_FEATURES_DEFAULT has been obsoleted [1][2].
> 
> Follow the pattern in meta-yocto [3] and remove it.
> 
> Fixes:
> ERROR: Nothing PROVIDES 'nativesdk-libseccomp' ...
> 
> [1] https://git.openembedded.org/openembedded-core/commit/meta/conf?id=0548ea447445834647be7ef35ed0ae8d1d3387b3
> [2] https://git.openembedded.org/openembedded-core/commit/meta/conf?id=159148f4de2595556fef6e8678578df83383857b
> [3] https://git.yoctoproject.org/meta-yocto/commit/?id=96085aaec5bfb33c4e4322465eaf0af370db6fc0
> 
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  conf/distro/vruntime.conf | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/conf/distro/vruntime.conf b/conf/distro/vruntime.conf
> index 0ea43e62..ae9c0a38 100644
> --- a/conf/distro/vruntime.conf
> +++ b/conf/distro/vruntime.conf
> @@ -46,8 +46,8 @@ DISTRO_FEATURES = "acl ext2 ipv4 ipv6 seccomp vfat pci vcontainer vxn"
>  DISTRO_FEATURES_OPTED_OUT = "pulseaudio gobject-introspection-data opengl ptest multiarch wayland vulkan"
>  
>  # Native and nativesdk classes need full features for build tools
> -DISTRO_FEATURES:class-native = "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
> -DISTRO_FEATURES:class-nativesdk = "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
> +DISTRO_FEATURES:class-native = "${POKY_DEFAULT_DISTRO_FEATURES}"
> +DISTRO_FEATURES:class-nativesdk = "${POKY_DEFAULT_DISTRO_FEATURES}"
>  
>  # Default to ext4, but image recipes may override to squashfs
>  IMAGE_FSTYPES = "ext4"
> -- 
> 2.50.1 (Apple Git-155)
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9743): https://lists.yoctoproject.org/g/meta-virtualization/message/9743
> Mute This Topic: https://lists.yoctoproject.org/mt/118988617/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


