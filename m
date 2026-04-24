Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCACFDEE5D
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 02:13:34 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12757.1776996804200666642
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 19:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RIgvamHH;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50d75bfb259so54746871cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Apr 2026 19:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776996803; x=1777601603; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s4qClE0CGqj0ssZVyBkwIiBcAAebdjaDouJJvf3KLjc=;
        b=RIgvamHHZpZvPPnaYr+CY6+8NzCjiMZEwMxozQborSFPrIGcAom5n7+mhEsta+GErx
         IGAWM3wsdDyHNaVIkB9TMkQgA3mqC7ZGqsjErHvezR8+s5Tcke67lcNLf0vXGyS9l0gD
         cr1l9H9y1At6W1dzLV6aCjwduRmeht0Fgw8JJMNjqoNTd4FVViA2meVuhHGMw7c6IySk
         43PjRxs9nEcUODoTFz55G+XH8dFaNWrK472646ZgoAHOj6CsTzl80DH5dvyT/lNp2o3n
         nXkg+rwpeyTG3NPZ39i6ViEJUFeCgnuxjy93h7AneeaVRcLcS8n4rH6IELweLmIgEDRk
         Un+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776996803; x=1777601603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4qClE0CGqj0ssZVyBkwIiBcAAebdjaDouJJvf3KLjc=;
        b=ClHaWw6+WL3yADyqlSDtVBXWuX0UTGx3KgA3vjRLVw50U2VowZr0dl+kkrqrq+Ai/+
         rMfG0OSlz4FNr32SGh+UUgNQhkTvkddvCBBmfeUaZXCqlxVHS4BKUYnzd3wONx2DFIqC
         P5+7kt8W4sM17wCozqds06Kod1hwPR/68tz6bCpyN0I0a9Lur2fIbMdoBskuqaPZmDOg
         z+ldxlkL+vseqFiUmui8ZfH0nwBsmsMZjIGDj2Sdv16XsVw3gm3PUdTQin4c3251JCoo
         u4npfE028/PlxC567W/SSsl7Walij9ozhGCVckTDtVei5fX5+WZCuGoaZRNaFeksi0Yu
         XcRg==
X-Gm-Message-State: AOJu0YwOj7wTBMsvga9GMdboEYQCj8EjVlLkrusioRavBTUwMdoon2nn
	3oV6sDCS+74OxGN8fTA1276FMn1+ZRAciRGMu5dOl8l85CRSocXnklCD
X-Gm-Gg: AeBDiev3QWE4LpZMFkYCIndBHJvzgrTOKHaqiGc3AcJgyzy3iiYU91SXEXM9XEHicsE
	933yslJDdEPqO2MHkOzhzXS4SseaMcRWfMdpECICEO48282PcYoPzCgszWgUHIFl851DSFjAaOW
	nwAGy+QF+Lc0Ce+NufJOZAiKuyBhB1a4dSGF7HHdhpsoO7wRLDCgaPMjCC8oNJY+XdFuqGH+zDM
	hC+x2F9H4L2fFxQKl3gS5OMw4V+x5jL+zddkxoqEpcGlqN+kBBdHcJ2ZatlXxL4lLQAIqdlP3Uj
	hXs3wOmp/T7JJ4uI+R/7BNkwhx0B64nFTQd7aDUxozKE2OwtfotvUyzf+NAexn91Vh2hLPTNLJi
	NvinQhKd7Z5m02xBrOx5dfh85Q8GrXEPUkmtkW4Gp+EnsE46Ws5VIYXI1r88YM/YJsyP6Uo79z0
	sr1LpVaPN+hac0KZ63y4L0aalhuCF6geKaV/smOPZysQEy2JyCYxogO3wxzH2kTjCYR3anvvNi5
	wdM4xprRLjCxReYHHRDFEqQy5W6hlpVpOPZz3YvmQvAHSR16TQA3DZQ2Q==
X-Received: by 2002:a05:622a:4c89:b0:50d:89bc:f450 with SMTP id d75a77b69052e-50e367fe17fmr426833231cf.11.1776996803039;
        Thu, 23 Apr 2026 19:13:23 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fb416b3f5sm87577801cf.28.2026.04.23.19.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 19:13:22 -0700 (PDT)
Date: Fri, 24 Apr 2026 02:13:20 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: patrick.vogelaar@belden.com
Cc: meta-virtualization@lists.yoctoproject.org,
	patrick.vogelaar.dev@mailbox.org
Subject: Re: [meta-virtualization] [PATCH meta-virtualization][PATCH 1/2]
 podman: fix PV to right version
Message-ID: <aerRwP_F-ENEBr_B@gmail.com>
References: <20260423-podman-fixes-v1-0-3ffa0badf612@belden.com>
 <20260423-podman-fixes-v1-1-3ffa0badf612@belden.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-podman-fixes-v1-1-3ffa0badf612@belden.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Apr 2026 02:13:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9733


That's the second time my update system has screwed up podman.

I was already testing 5.8.2, so I've gone ahead and bumped it
to fix the version issue.

Bruce


In message: [meta-virtualization] [PATCH meta-virtualization][PATCH 1/2] podman: fix PV to right version
on 23/04/2026 Patrick Vogelaar via B4 Relay via lists.yoctoproject.org wrote:

> From: Patrick Vogelaar <patrick.vogelaar@belden.com>
> 
> Commit 3b9ff919799daa5eccd56b481cefd61db652ab99 updated the SRCREV as well as
> the branch in the SRC_URI but left PV untouched. This now sets PV to v5.8.1
> which corresponds with the SRCREV.
> 
> Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
> ---
>  recipes-containers/podman/podman_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index df333dfc..fd0cd908 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -27,7 +27,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=3d9b931fa23ab1cacd0087f9e2ee12
>  
>  GO_IMPORT = "import"
>  
> -PV = "v5.7.1"
> +PV = "v5.8.1"
>  
>  CVE_STATUS[CVE-2022-2989] = "fixed-version: fixed since v4.3.0"
>  CVE_STATUS[CVE-2023-0778] = "fixed-version: fixed since v4.5.0"
> 
> -- 
> 2.43.0
> 
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9730): https://lists.yoctoproject.org/g/meta-virtualization/message/9730
> Mute This Topic: https://lists.yoctoproject.org/mt/118978969/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


