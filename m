Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5D1C369A2
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 20:51:35 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.19481.1744231894579830006
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 09 Apr 2025 13:51:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cj4sFSO7;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c560c55bc1so13277485a.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 09 Apr 2025 13:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744231893; x=1744836693; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J2pI1Ge0GizOrXjNc4IDAi9p9Ro6RBAUwQonfMvZvv0=;
        b=cj4sFSO7Megt3H8EoZjMXCyNDliufxNnwSCqhHGaHFKiv+p1Kp87Xv+SAbpoHutIpr
         JB10oE56AoYKu64vkqstPsEQ78jadk20lcj+Mf6d04VzFTw3hNhi/ZwITq6bwAeT1TmZ
         RFdhhEVbYHhuFHJx1Dc32Fx01OA18WFSt8az2uyTkFlDyEo06fhls7oc0IeYWZYFncNc
         5KiLWhcI/ifWn037CRl0zF3jUXo+t0NRDrHRxpHiJAfbVUapG9mzKOO3ZmWZZN+Gg8rS
         7hnVfDRWoqQ+W8uvMINHaGhM+6w9WkhKmHCU9IJHNlgWK9DCweMlAjIMkvAJs262rwhO
         DGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231893; x=1744836693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2pI1Ge0GizOrXjNc4IDAi9p9Ro6RBAUwQonfMvZvv0=;
        b=Z73dvgJIGqKJ6cIYRNSH4gwNbZpBsnEpyKfwUa5aFvmI2+73lcP8O0ADcQRcHy8YC0
         CysnYcadFVcf5r/j+jjtslM5vA2Q7mQso0yBuDpIYcnl7hr3HYDlBd6LZBzIBfGGTZvY
         Nw5mmSGqyXgltai23nGHjJNnB+JCB30WcxOehNwpQqky++47UmfITrhw+PahDvJKpnS4
         vfVVOD7E3xMuVwIenFoYguAtUNQFq30J7RT9Hc7Tt1QhpMNx43oxOR9KGrnLMNQkBVhj
         OsdXZO6FGGlDurxtisoC4f9JvbpbyXNQaXkbtOwHeZnzz/4UFahyoY+cVaQU+Fi8YqXy
         W74A==
X-Gm-Message-State: AOJu0YxCCWpPpGcLJKBT+NybRKA2R5yOQ12QwW5tbv0LB8pTPJB34RwJ
	p5/1jwZstQoMgjJ038Ka2750ipu44VTWHcnjFWV/R8MTWfetMOap
X-Gm-Gg: ASbGncuMV/yF6wvOkWzmkzCv1pCeTXX78kIKViFAUAuvNxtEsdr603yhThjCb+bZ3Og
	U0sRAtecmOtqWPcJKAHMcwmOSlSwLUYCUvtvJflb45c9yKym1S+cw5ejAQLkGYFJwcfj3MO6+be
	qwsrqVTHr/LpP6dGABpRxIKkc+wKLx534lmGX/BDLglxKf94IYHpEzmUFaYXelwpnQZxW3y/kH8
	jnRrqyawId6XVh2VMLAWjJFezaqiTRaDOZ5Fv1gZuw5uZmomek8ON9FnNA41UwHNEpydxYcLI2j
	HuoQ/nnXtKyatjY9IJ7DGF04m37osGK9RjVX1zCLC1sy82HLh0Vb7pv9WqlXg3vdcGN7Hs/54ik
	LwinbFgCHZ7PlxJuCU0E=
X-Google-Smtp-Source: AGHT+IH+TobgO7UbSzK4NumHGUOfvDLO4K90X9fzuEU7CrWHsQnjjhZlDo1hkCmK4++Br8XU3osR6g==
X-Received: by 2002:a05:620a:2806:b0:7c0:c332:1cdb with SMTP id af79cd13be357-7c7a76bf891mr31699085a.38.1744231893597;
        Wed, 09 Apr 2025 13:51:33 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a11c9fb2sm115737385a.78.2025.04.09.13.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:51:33 -0700 (PDT)
Date: Wed, 9 Apr 2025 20:51:31 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: troth@openavr.org
Cc: meta-virtualization@lists.yoctoproject.org,
	"Theodore A . Roth" <theodore_roth@trimble.com>
Subject: Re: [meta-virtualization][PATCH] packagegroup-container: Fix docker
 typo
Message-ID: <Z_bd0yN3X0xv5Eoe@gmail.com>
References: <20250409151349.59874-1-troth@openavr.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409151349.59874-1-troth@openavr.org>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 09 Apr 2025 20:51:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9213

merged.

Bruce

In message: [meta-virtualization][PATCH] packagegroup-container: Fix docker typo
on 09/04/2025 Theodore A. Roth via lists.yoctoproject.org wrote:

> Signed-off-by: Theodore A. Roth <troth@openavr.org>
> Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
> ---
>  recipes-core/packagegroups/packagegroup-container.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
> index 21402d65..f5e20344 100644
> --- a/recipes-core/packagegroups/packagegroup-container.bb
> +++ b/recipes-core/packagegroups/packagegroup-container.bb
> @@ -56,7 +56,7 @@ RDEPENDS:packagegroup-container-tools = " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'conmon', '', d)} \
>      umoci \
>      ${@bb.utils.contains('VIRTUAL-RUNTIME_container_engine','podman','podman-tui nerdctl podman-compose','',d)}  \
> -    ${@bb.utils.contains_any('VIRTUAL-RUNTIME_container_engine','dcoker docker-moby','docker-compose','',d)}  \
> +    ${@bb.utils.contains_any('VIRTUAL-RUNTIME_container_engine','docker docker-moby','docker-compose','',d)}  \
>  "
>  
>  RDEPENDS:packagegroup-oci = " \
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9212): https://lists.yoctoproject.org/g/meta-virtualization/message/9212
> Mute This Topic: https://lists.yoctoproject.org/mt/112173916/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


