Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3DBC5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 02:29:37 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.34573.1749090571730678206
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Jun 2025 19:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TWXojvxJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d20451c016so34155685a.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Jun 2025 19:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749090571; x=1749695371; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3jhuOTBuq44ssJ7xD2VrkzHbxUBKwXScl3CR50WfFnY=;
        b=TWXojvxJ+vNLajjSelToF6oOtsZMWtxaRJ2ArwpewUXRkRKQNA9XaBvVJNWz01hHfx
         ZZ/8QUFQBd9KVUvkaylLtY5HwuERZwGquk8TCw2jzC3qVAk3+pSEVIh40lluQn4c7cvX
         1DYjCev7eoBad5t1YBZ69XJFb99PIS2Jp9wN32erb7prcmk89V+7PksC5sHNtDZSPziX
         rUt1WgwrfYtWJLhk+XRf4m0ynfEkAt6RSVV9bdo3pwYlWqbWZQIP59oBmlw+IUfuwDB7
         hmbGNWwtNGDsv0fry0hbWqRRtARqMgrvOpQSY3TO0hwKh2ccZp5uGpvcRftyWbXCpxur
         zNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749090571; x=1749695371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jhuOTBuq44ssJ7xD2VrkzHbxUBKwXScl3CR50WfFnY=;
        b=RKGfYwS8TenpqmQNg5Y0MdmVoMHH83g+uJqsUiYh6iAQDgW7/1OQl5tBklRDrFQ67s
         9b4uDOmtZVzILTlJa6vrDdiAqxQsahdYY3YtFpxYDaourVZ0zH6tJuiADtkgM3pIYlep
         sIlHNOZRfZeE/99+kCxYYmlrsxTLS2MiGC5SiFl5qauGZbkTebuyqd3P8OuHSHagQVXo
         vdbD+xMm6r+2qVLRN+SmWpyUYhupnKuNvL33Yn4zZnskk3o4XIKpSSVpEE5/7V3Afh5U
         BwUmctc21cg9eAgbVtUT23EZGDl7qBJWZFWn5uu8Q2OOXtTEonEI4hPLt/ty5RdGD9yK
         gS7Q==
X-Gm-Message-State: AOJu0YyqJpn9oxtcMZi2sB4s9xGOQmvqKaAuUYLt1qrbZXCDcETEVFbJ
	Qkwcnxcdu1QRCa2liNXCm+y6qW06yh4A06GMCaKKyRwmQuoyws3qpNRe
X-Gm-Gg: ASbGnct59H5Ako2kDpqjvMLrlA0nJEyyOedK0mcwNjiGw0hEJuje0UzTEZzyme/TkHr
	sQLYc9jFwyLvjOV6wJkps0q/m2LP3ulhbQTOIlhFPoLWfj5MDBTxt7bZHpw4uHvXl5OpRarzOJ0
	cH5Fii8Ua2FVshUCoriavqlO8y7psSH91LZwXD/Kj73l5in7MxF+9RuGOXOq5KziCfvuqu27Tkp
	r3cH4fBvdQo66uVcWtLvwH2CgCFAQeUBsJwYPd323CA0JPrpFCsuIxb20OCQSsQM/ZpO81NzXqY
	GK+QN+/aTbE2/yUPPDxgTjp22sN0PK1cc72DCX7b16TqKCL6jTNK1PuZ9sc4NHLQf1YySe8KMu3
	R4JnXopYTKLc9Hkgpg9EixXrI0I3xfA==
X-Google-Smtp-Source: AGHT+IG9mIESq0RvDKgsXlxQ/PSNtJIEDfqWlux21Qlt/iEirbJAq9VHUOr7wUUkSQlrdE+5cqzSAQ==
X-Received: by 2002:a05:620a:4514:b0:7ca:f09d:1473 with SMTP id af79cd13be357-7d2198b6edbmr682422885a.28.1749090570524;
        Wed, 04 Jun 2025 19:29:30 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d218d56b59sm316739385a.83.2025.06.04.19.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 19:29:28 -0700 (PDT)
Date: Wed, 4 Jun 2025 22:29:27 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: changqing.li@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][walnascar][master][PATCH] containerd: make
 cni_networking conditional
Message-ID: <aEEBBxb7NxcvPnxo@gmail.com>
References: <20250528054841.2516534-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528054841.2516534-1-changqing.li@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Jun 2025 02:29:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9269

In message: [meta-virtualization][walnascar][master][PATCH] containerd: make cni_networking conditional
on 28/05/2025 Changqing Li via lists.yoctoproject.org wrote:

> From: Changqing Li <changqing.li@windriver.com>
> 
> make cni_networking conditional, when k3s, k8s is enabled, the
> networking configuration will be provided by the orchestration package,
> containerd-cni is not needed. This is for fix the following error:
> PACKAGE_CLASSES = "package_deb"
> do_rootfs failed with error:
> dpkg: error processing archive /path/to/oe-rootfs-repo/corei7-64/./kubernetes-cni_v1.32.0+git0+5fe148234f_release-r0.deb (--unpack):
> trying to overwrite '/etc/cni/net.d/cni-containerd-net.conflist', which is also in package containerd-cni v2.0.5-r0

We shouldn't need to do this to fix the package install. Whether we need
to do it to make sure networking configurations don't conflict is a separate
question (and one that we need more information to decide on).

The design of the cni_networking is to allow co-existence of packages
that need to configure cni networking. So we don't have to do what
you've tried to do in this patch.

Let's rename the files referenced in CNI_NETWORKING_FILES to something
more specific to the kubernetes packages and then they can both be
installed at the same time.

That's one patch.

If you can show me that the two networking configurations being installed
at the same time cause issues, we can then do the coordination betwen
the packages similarly to what you are doing here in a second, separate
patch.

Bruce

> 
> Refer [1], "--no-force-overwrite" is set for dpkg, so above error
> occurred.
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=cb95ba079960411775c57ab864d266e15a6292d1
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-containers/containerd/containerd_git.bb      | 2 +-
>  recipes-core/packagegroups/packagegroup-container.bb | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
> index c683fbeb..def7591a 100644
> --- a/recipes-containers/containerd/containerd_git.bb
> +++ b/recipes-containers/containerd/containerd_git.bb
> @@ -102,4 +102,4 @@ RDEPENDS:${PN} += " ${VIRTUAL-RUNTIME_container_runtime}"
>  ## This may need to be made conditional on K3S or similar being
>  ## configured in the distro, since we may have collisions.
>  CNI_NETWORKING_FILES ?= "${UNPACKDIR}/cni-containerd-net.conflist"
> -inherit cni_networking
> +inherit_defer ${@bb.utils.contains_any('DISTRO_FEATURES', 'k3s k8s', '', 'cni_networking', d)}
> diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
> index f5e20344..8cbcf28e 100644
> --- a/recipes-core/packagegroups/packagegroup-container.bb
> +++ b/recipes-core/packagegroups/packagegroup-container.bb
> @@ -69,7 +69,7 @@ RDEPENDS:packagegroup-oci = " \
>  RDEPENDS:packagegroup-containerd = " \
>      virtual-containerd \
>      packagegroup-cni \
> -    containerd-cni \
> +    ${@bb.utils.contains_any('DISTRO_FEATURES','k3s k8s','','containerd-cni',d)} \
>      nerdctl \
>      tini \
>  "
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9261): https://lists.yoctoproject.org/g/meta-virtualization/message/9261
> Mute This Topic: https://lists.yoctoproject.org/mt/113339575/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


