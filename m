Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC42FDEE5E
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 02:14:44 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12774.1776996878251508943
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 19:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nsqmJy6c;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8d7e7f48499so821564685a.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Apr 2026 19:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776996877; x=1777601677; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/P+Dv3QDeBpfkqMgZ9EtXLFK+OG4N1CLl79zMdfmc6U=;
        b=nsqmJy6cfk8AxaCJVuD2e9iWsfuzZsFN1ViXRaxiCx641KGUnzI+vJ8qzHtE5XVvNM
         dRIOYAl0AYXrvzDvWR8PpEgo4fkCb+Vw2duUz9uqPUpcV1mKL05pxkbLN38jb/novdSF
         BZrBEIDer6x0ZozcmJSZB/jb/qNHryo9nW3Ef2k1huNFkYNYncrf8cFud7FQP7P/CGx2
         zVJa6i41jhyj2Q+e6+EgzJ03dYuCfIrD3Ow1+qAfFXtMY816utpZti4yLEQZPr1EuFJl
         t1AsWrzdQ5HYHyOvVFbxZVGPa4jjmd0ICfXSypurD37ryG9aJ2pIOAmw8pGUYAWq9wBn
         ElZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776996877; x=1777601677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/P+Dv3QDeBpfkqMgZ9EtXLFK+OG4N1CLl79zMdfmc6U=;
        b=UlKaIi/xvU83wG3PfQ16LlotKTlr/DJYIOLCs4TgWPSzJI17SFTBR5ra8TNW635acn
         0hMMRdn/lI+TZzA4+6P8XLmR3WJpltclA3j+hTx/QtAWaHouRwJX11177Ak7m7bjMXEH
         RfcOn9KLe+EFb5PWU4m8mavatyqMD258EdqrbnA2uwUauxcD/Ruc+BiulzK+V7Nhys+B
         Cp0/l0saCMG8Ewh64PCSaCgeQvTzt6IfjDCBfoJM2lUgG1OX/TMPFLzY7Cj4b9EkISan
         qZzxk0uzjCc1wtvGwd3m0vRhm0iuisFPjKMZwBMV7+jbeHCCUjrSYgsqi2K88+NGxi25
         Y0tw==
X-Gm-Message-State: AOJu0Yz+mdlqnTDXoEHauFcSK5QmEYBXTgZJ79mUmqh2c90FNQOF6E16
	/lLtQgONvvSHuQeDEuQNLfMcJe53xz4Qdvc0cVEllXDH2fuPt8ATNXLW
X-Gm-Gg: AeBDiesby91cFYTNh8vip58w4UojdddQPXRZLAdZVJqDSoaWQpvsPTGsV8PrUzjvj34
	Xy6q+ev0izBAHCBJF7SdHcUygU9L485mmCocVNZ8fVUKY+4BBmTUl/cIgIOZXW7CrY+mok6IzH9
	lC16EKrxtrfvqTyNi0wOXD4/BTV5WoG/8o4R+qlJNGcEPMSk7r7VqcSO4kxbpCUvoSkSarEesx1
	N6HhKArzbyY5dXkLQUzwKqZdDM48Wz7UEk0ho2m+ZsPExqm8OHj1nxmVTp0DgVAFI1pFVtGy92h
	WdcDm7HRulZcTbWS9Q6SF+aysobmDAwbs7tEg/0O3Fu7EN/OUsst7QxLbpIZuBv4Lb8O9kSyrVM
	8XD/C8LR62irt6P+yJ9I3DQCfkUyIBJrg91N8zH/V/gnuQEmSdsXwZxRvc1b0JUY+Ke7B36L3co
	jqnj59zWOiiKEuCdpggl9yO8FU2KtI3pJXIXoQfStExVRdOJvVAP4YEI61f8hy0pl3c22ZKwKFA
	QrfUwXw6ep7AzDxPi5S0FBhFDSyXoNKnSVILehuaIncJZM=
X-Received: by 2002:a05:6214:5e06:b0:8ac:b4d5:50ec with SMTP id 6a1803df08f44-8b028100117mr377672696d6.38.1776996877159;
        Thu, 23 Apr 2026 19:14:37 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac6f670sm209329566d6.14.2026.04.23.19.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 19:14:36 -0700 (PDT)
Date: Fri, 24 Apr 2026 02:14:34 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: patrick.vogelaar@belden.com
Cc: meta-virtualization@lists.yoctoproject.org,
	patrick.vogelaar.dev@mailbox.org
Subject: Re: [meta-virtualization] [PATCH meta-virtualization][PATCH 2/2]
 podman: update SRC_URI
Message-ID: <aerSCs2qX9Buwxne@gmail.com>
References: <20260423-podman-fixes-v1-0-3ffa0badf612@belden.com>
 <20260423-podman-fixes-v1-2-3ffa0badf612@belden.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-podman-fixes-v1-2-3ffa0badf612@belden.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Apr 2026 02:14:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9734

I've always kept this on libpod by choice. I liked how it showed
the years that podman has been integrated and running in our
ecosystem.

That being said, I'm ok with finally letting go of it, so I've
applied the patch.

Bruce

In message: [meta-virtualization] [PATCH meta-virtualization][PATCH 2/2] podman: update SRC_URI
on 23/04/2026 Patrick Vogelaar via B4 Relay via lists.yoctoproject.org wrote:

> From: Patrick Vogelaar <patrick.vogelaar@belden.com>
> 
> Podman is hosted under github as podman and not libpod. Accessing
> github.com/containers/libpod automatically forwards to
> github.com/containers/podman.
> 
> This commit does not really fix a problem but reflects more the current
> repository name.
> 
> Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
> ---
>  recipes-containers/podman/podman_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index fd0cd908..8e108c4e 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -18,7 +18,7 @@ DEPENDS = " \
>  
>  SRCREV = "9d66b48e1c9bc1f4e757384f44c4ecb2838138d7"
>  SRC_URI = " \
> -    git://github.com/containers/libpod.git;branch=v5.8;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
> +    git://github.com/containers/podman.git;branch=v5.8;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
>      ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
>  "
>  
> @@ -34,7 +34,7 @@ CVE_STATUS[CVE-2023-0778] = "fixed-version: fixed since v4.5.0"
>  
>  PACKAGES =+ "${PN}-contrib"
>  
> -PODMAN_PKG = "github.com/containers/libpod"
> +PODMAN_PKG = "github.com/containers/podman"
>  
>  BUILDTAGS_EXTRA ?= "${@bb.utils.contains('VIRTUAL-RUNTIME_container_networking','cni','cni','',d)}"
>  BUILDTAGS ?= "seccomp varlink \
> 
> -- 
> 2.43.0
> 
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9731): https://lists.yoctoproject.org/g/meta-virtualization/message/9731
> Mute This Topic: https://lists.yoctoproject.org/mt/118978970/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


