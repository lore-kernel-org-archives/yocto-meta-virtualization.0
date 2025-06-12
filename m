Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F8D1C61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 14:43:05 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.14840.1749739376775325913
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Jun 2025 07:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hymu4Noc;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4a52d82adcaso14705991cf.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Jun 2025 07:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749739376; x=1750344176; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/jVL21L6tSeFu/5YYapsLl8bFNl8/hhPqDtlCAoyieI=;
        b=hymu4NocSdz1x+kY380cyxB06yz49JJHlQRQuBcQG1XPZVHQ8miCQCBdI3vh5+eGpo
         n108eO4oMKiy9cqOKuc5dXPpQ7T2AB4dG9C3y6+aIiRsHD7T3p4Tg08IffhMPeq2Xjog
         Em51LBFFDF16DYjRg+MeIZSG1eIP7gxSxfZgh8yvw2p9TGw+FVWgd2TWO9siTrAyWRWA
         SMmoY08WuLJQmmTZ3tOVKmZoT14VwD1qR+KFuOQjKO4T2u8L4JhaETRqCX7IXW39PTm9
         BUtLOED/oMAScinVB3jNo/e/xbYGfw7fPbPmpTj+Jwz8sFc+ArOthTiX+Hq63iixW8FI
         +kQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749739376; x=1750344176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jVL21L6tSeFu/5YYapsLl8bFNl8/hhPqDtlCAoyieI=;
        b=qzChi0GcWyXUn175V4ZCVefxXUyOLecDaw8WFwmtYUj5aDU7RfJxUsfcYDBHZXekGt
         ZC23knEgt72SiTS2KOKh7sSUUxyYoftAe4MczYJ2SBN1UvGHORVJDjkNCJ5hDHjFKdfi
         beUoKuWSXkKfA816CfkU+xxX9voctOAhCwW6B98C3H0gp4sbrQIMCiHsZr++ToMt33wV
         G3rX0+opVxKb0kPU80MG7o8y1d1ElSd/ejyyG/mDgsw3B7c6AMwPE4tfJJgDXN3dQINr
         o+GArxQeytnbyeK6TKC8AsVaNUjnHHM0fhQW6SyiNFLjeSk13mJoJm4P4pdD+XMkbGaU
         bGtw==
X-Gm-Message-State: AOJu0YyNFVeB8+TboG5BzDIXQxtrU+99y9K5ojbFioZI2Qq0vHGfiUIt
	aiol7wRZNM5KT+dXRRe4DnNfqKrbiHwwKuMiPZGwwGtwHYlOoXnEeYi/
X-Gm-Gg: ASbGncvG6DJbMqyX11ymG5kUVjfdWSO/lrH5Gg0d+fDdZPyN/QNFooJs9qYAKslzc51
	gzoXNq165ipWO++wRv0rjidrBpGV19Mu/MW7pnhUaT3J3lZurva6MaJyYbnQay5Ecf/hpmTaKTz
	frqM+81i4etpeYwk4TkkfkIaUBXs0f/uHP0OCfBu9G48lF0n0QYycSciYE9/P9VOZuDsIs2zqdE
	FQ70U052BFtg+1KnO7YD3QmlSDXOWWWsqvH6lMVJrvVRPe7vbrjuNusURyYQ4MFR9ODGqxkW1+O
	uQxX/kHSpe8r1c1H8AtadCcxu6/nN39XaO7YMtlhtAjhknac1sLMfX/wfRBR+E8ki4h5E+qTH/i
	SnDpE/zByP/zXRvZJmHKf8Ws7oFqBfV2xA13cSsBTyKzfwFE1dc8=
X-Google-Smtp-Source: AGHT+IHDCXOiWvNYiBtqZtvosp3gX5nh+ZhZ8rCr5mqX0q7woXQ+V4WJ51v6ZoxJxobGoR6lkjlC6g==
X-Received: by 2002:a05:622a:1e0d:b0:477:6c0e:d5b3 with SMTP id d75a77b69052e-4a724012c6dmr48820751cf.6.1749739375684;
        Thu, 12 Jun 2025 07:42:55 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a4b0cb9sm4735391cf.50.2025.06.12.07.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 07:42:55 -0700 (PDT)
Date: Thu, 12 Jun 2025 10:42:53 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: changqing.li@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [walnascar][master][PATCH] kubernetes:
 rename CNI_NETWORKING_FILES
Message-ID: <aErnbZ1trmc803TQ@gmail.com>
References: <20250612055903.1420319-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612055903.1420319-1-changqing.li@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Jun 2025 14:43:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9283

merged to both branches.

Bruce

In message: [meta-virtualization] [walnascar][master][PATCH] kubernetes: rename CNI_NETWORKING_FILES
on 12/06/2025 Changqing Li via lists.yoctoproject.org wrote:

> From: Changqing Li <changqing.li@windriver.com>
> 
> Rename CNI_NETWORKING_FILES to 00_cni-containerd-net.conflist.
> According to the following k8s doc, k8s networking file will be used
> when both containerd-cni and kubernetes-cni both installed.
> 
> "If there are multiple CNI configuration files in the directory, the
> kubelet uses the configuration file that comes first by name in
> lexicographic order."
> 
> This commit can fix following issue:
> PACKAGE_CLASSES = "package_deb"
> do_rootfs failed with error:
> dpkg: error processing archive /path/to/oe-rootfs-repo/corei7-64/./kubernetes-cni_v1.32.0+git0+5fe148234f_release-r0.deb (--unpack):
> trying to overwrite '/etc/cni/net.d/cni-containerd-net.conflist', which is also in package containerd-cni v2.0.5-r0
> 
> Refer [1], "--no-force-overwrite" is set for dpkg, so above error
> occurred.
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=cb95ba079960411775c57ab864d266e15a6292d1
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  ...containerd-net.conflist => 00_cni-containerd-net.conflist} | 0
>  recipes-containers/kubernetes/kubernetes_git.bb               | 4 ++--
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-containers/kubernetes/kubernetes/{cni-containerd-net.conflist => 00_cni-containerd-net.conflist} (100%)
> 
> diff --git a/recipes-containers/kubernetes/kubernetes/cni-containerd-net.conflist b/recipes-containers/kubernetes/kubernetes/00_cni-containerd-net.conflist
> similarity index 100%
> rename from recipes-containers/kubernetes/kubernetes/cni-containerd-net.conflist
> rename to recipes-containers/kubernetes/kubernetes/00_cni-containerd-net.conflist
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index fea48bca..b6eb4946 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -31,7 +31,7 @@ SRC_URI:append = " \
>             file://0001-cross-don-t-build-tests-by-default.patch \
>             file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch \
>             file://0001-build-hack-allow-go-1.20-building.patch \
> -           file://cni-containerd-net.conflist \
> +           file://00_cni-containerd-net.conflist \
>             file://k8s-init \
>             file://99-kubernetes.conf \
>            "
> @@ -119,7 +119,7 @@ do_install() {
>      fi
>  }
>  
> -CNI_NETWORKING_FILES ?= "${UNPACKDIR}/cni-containerd-net.conflist"
> +CNI_NETWORKING_FILES ?= "${UNPACKDIR}/00_cni-containerd-net.conflist"
>  
>  PACKAGES =+ "kubeadm kubectl kubelet kube-proxy ${PN}-misc ${PN}-host"
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9280): https://lists.yoctoproject.org/g/meta-virtualization/message/9280
> Mute This Topic: https://lists.yoctoproject.org/mt/113602138/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


