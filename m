Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE27CC001B2
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 15:33:41 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.48031.1671723220573937377
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Dec 2022 07:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hRsZdnEE;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id a16so1576530qtw.10
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Dec 2022 07:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wov3T9wsinLg+dLRY5Q/FC23foEmFxFQYcW8Eg3mWc4=;
        b=hRsZdnEE+KKbRh413CkZ2nIyVFssaD/ObaNf3/trj93IfN3wf7TlmNYnDmYb1WMbHa
         lIY3DKDL6Yh8yGUN9GKAKdJFefXukTgpKYus3owWOB4g8LJ78EsnKutE19jPuEvAPnMX
         hxz2VXMi1N3Su6v5lHv47Pb8QyTorXLqSja1cwKKli7HnuS3j/VuKbQe6r6EWMRgNy7I
         YB+O0p5VBmY1qrWC74zGpEg/6EuqMmlaoojQqmzOW7Rnyl2qvKCXOBjzv2otqQwBC1Aj
         QWxftSg9+AK86ahZxuQbcxDmu7GKilyWZcZmdPQevbqnTn+pG4mRVvP90A9KZZSXjXvE
         GBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wov3T9wsinLg+dLRY5Q/FC23foEmFxFQYcW8Eg3mWc4=;
        b=bas92RG8/I4tQG8y1UQGlPuoz0RbgXyEHVuEHjQoWDIROls/IYeOmTG7DVc9mfigCa
         MRhHT+87A0zMdA6zXOKXLBmr49kso465yiR6HH01CLgJPhlutsMJ0BDZHFgKF2ASMZ0C
         0stC9ucwZdRRxsaR+rtcSNNVrjow2H3MAVAVMzHTVntCepKMObI0LIx5MjdDHwzktCVH
         1sveGRzrseDZX2KuLBxiwxp64VEnPg3bEBpYSBB0H3wiOprs6YXhX7Rhxo7cVqjvVsni
         qLNVreEU9Y8Dh4hvLo4OJbp64H3xeM2SzTOdcMmCXEatBJ8Kp3L/LrsPT5VcJiKu7rtH
         ZrCA==
X-Gm-Message-State: AFqh2ko+/3GhU4otS6yd8hZiVMCia+lVtSGHsyRNIm7aJtlgG35jPOd5
	ECNHBvUnOd5Qsf1a7eWXqHt52gcdezM=
X-Google-Smtp-Source: AMrXdXviKeKAnEoeakss9lEA+WUIKAw+YJUh+t6fPrO1RQWzzIH4ussq0gMC3013CFYNURTeONs2OQ==
X-Received: by 2002:ac8:760b:0:b0:39c:da20:683 with SMTP id t11-20020ac8760b000000b0039cda200683mr6579738qtq.38.1671723219564;
        Thu, 22 Dec 2022 07:33:39 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id g25-20020ac84b79000000b003a70a675066sm481859qts.79.2022.12.22.07.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 07:33:39 -0800 (PST)
Date: Thu, 22 Dec 2022 10:33:37 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: mingli.yu@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [PATCH] virt-viewer: add opengl to REQUIRED_DISTRO_FEATURES
Message-ID: <20221222153337.GB42362@gmail.com>
References: <20221220131529.3468877-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221220131529.3468877-1-mingli.yu@eng.windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Dec 2022 15:33:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7779

merged.

Bruce

In message: [PATCH] virt-viewer: add opengl to REQUIRED_DISTRO_FEATURES
on 20/12/2022 mingli.yu@eng.windriver.com wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Fixes:
>   ERROR: Nothing PROVIDES 'spice-gtk' (but /build/layers/meta-virtualization/recipes-extended/virt-viewer/virt-viewer_11.0.bb DEPENDS on or otherwise requires it)
> spice-gtk was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
>   ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
>   Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'virt-viewer', 'spice-gtk']
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  recipes-extended/virt-viewer/virt-viewer_11.0.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/virt-viewer/virt-viewer_11.0.bb b/recipes-extended/virt-viewer/virt-viewer_11.0.bb
> index 55ca57aa..5799f48f 100644
> --- a/recipes-extended/virt-viewer/virt-viewer_11.0.bb
> +++ b/recipes-extended/virt-viewer/virt-viewer_11.0.bb
> @@ -16,6 +16,8 @@ SRCREV = "1e99e5e4f409da91638eb79067ec738994c28ef5"
>  PV = "11.0+git${SRCPV}"
>  S = "${WORKDIR}/git"
>  
> +REQUIRED_DISTRO_FEATURES = "opengl"
> +
>  PACKAGECONFIG ?= "libvirt spice vte"
>  
>  PACKAGECONFIG[libvirt] = "-Dlibvirt=enabled,-Dlibvirt=disabled,libvirt libvirt-glib"
> @@ -23,7 +25,7 @@ PACKAGECONFIG[spice] = "-Dspice=enabled,-Dspice=disabled,spice-gtk spice-protoco
>  PACKAGECONFIG[vnc] = "-Dvnc=enabled,-Dvnc=disabled,gtk-vnc"
>  PACKAGECONFIG[vte] = "-Dvte=enabled,-Dvte=disabled,vte"
>  
> -inherit meson pkgconfig gtk-icon-cache mime mime-xdg gobject-introspection
> +inherit meson pkgconfig gtk-icon-cache mime mime-xdg gobject-introspection features_check
>  
>  FILES:${PN} += "${datadir}"
>  GIR_MESON_OPTION = ''
> -- 
> 2.25.1
> 

