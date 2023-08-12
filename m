Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5211DEB64DD
	for <webhook@archiver.kernel.org>; Sat, 12 Aug 2023 03:15:47 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.59416.1691810139948434144
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 11 Aug 2023 20:15:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GHIN/bUH;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-64189860374so11661556d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 11 Aug 2023 20:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691810139; x=1692414939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=76i23V7ILSllJNyyF6/2g0jrcMvA1I6bzbKB3bL0N/c=;
        b=GHIN/bUHltPAPFCG/mdw8NcYpPWtc5YNqIhLGAp9tkXTMmqHbf0WVneVfQwaHBfPoJ
         f/jWI7Ayb8O5SblI8fvq+GrJVjZkneryHcZg2138JSTDFXNtdLjugbmDx2lTloJ+qJCp
         WAU2UE967cj9KnbkC/4fTw2Rkokpnmg3IUMYQS0uuS7uvv5aDgAb1Qi62vH6Q27cVTan
         LI9Se8dFKXLSjhXhoDAz4prokC0UXxklvu3JfPnBKDu6tXVmOx/BzrbP62zLv7JnwiYA
         TRP8X/KKA1a722QXGi18NQpiLBEm/Y0UTolDPLVxkKr5RUqWBopfNLtwk9+VewO/Fw1T
         wTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691810139; x=1692414939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76i23V7ILSllJNyyF6/2g0jrcMvA1I6bzbKB3bL0N/c=;
        b=liCnX0rSU2Yk685z9F8DoOScHCTBT9IfZgC0557WdJb1+JjWewL9xKqztG2xWj//tQ
         F7iPDjIGSsTXwqpnzf4f9g/uPFvklnR5NND9lkKGLjovZQBnXZSl81MrPWMmYk+7+FoB
         6MTDphjZ/IjrU4N3z3KIY23GvLUO07PzHrvNPxXiNluMY7C+RQuGs7gELVQuaUnos/uo
         TkLgqcTBYAGe88A6+gU+Admuecztrk/iW8TId9C54caMliGvDcW2JBlstmsZOikDt4JX
         ICyG9MyiDYyaMh/1Miut5qhe3tv69gUr7MOxklI6tIQzx+ea0K0MFomdmqkzVP0w9Kla
         tfxw==
X-Gm-Message-State: AOJu0YyEHlsVzeN3APdMLMTCLRyL0n20l9LJ6WRQFIgHw9hJp+7Qlqe5
	DorWiulJVEKvCWzTxdTX1xY=
X-Google-Smtp-Source: AGHT+IFY+v3wMfBlUv2Pvl9USaqAK1BHfxDRNlczmzHv+dd0J3Lcm50Gxl/COfQezG/iUxhnSBCQzA==
X-Received: by 2002:a0c:f192:0:b0:646:d5ea:d69c with SMTP id m18-20020a0cf192000000b00646d5ead69cmr816562qvl.38.1691810138787;
        Fri, 11 Aug 2023 20:15:38 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id q9-20020a0cf5c9000000b006262de12a8csm1671179qvm.65.2023.08.11.20.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 20:15:38 -0700 (PDT)
Date: Sat, 12 Aug 2023 03:15:36 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] xen: Update arm assembly patch to
 upstream accepted one
Message-ID: <ZNb5WPv6Nw5fpkaD@gmail.com>
References: <20230808172553.3632648-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808172553.3632648-1-raj.khem@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 12 Aug 2023 03:15:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8174

merged.

Bruce

In message: [meta-virtualization] [PATCH] xen: Update arm assembly patch to upstream accepted one
on 08/08/2023 Khem Raj wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...g-solaris-syntax-for-.section-direct.patch | 48 +++++++++++--------
>  1 file changed, 28 insertions(+), 20 deletions(-)
> 
> diff --git a/recipes-extended/xen/files/0001-arm32-Avoid-using-solaris-syntax-for-.section-direct.patch b/recipes-extended/xen/files/0001-arm32-Avoid-using-solaris-syntax-for-.section-direct.patch
> index c73bb27..a4038dd 100644
> --- a/recipes-extended/xen/files/0001-arm32-Avoid-using-solaris-syntax-for-.section-direct.patch
> +++ b/recipes-extended/xen/files/0001-arm32-Avoid-using-solaris-syntax-for-.section-direct.patch
> @@ -1,33 +1,35 @@
> -From 9add6f9aced42a76f6a2c124754bef6fde56fa05 Mon Sep 17 00:00:00 2001
> +From dfc490a3740bb7d6889939934afadcb58891fbce Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
> -To: xen-devel@lists.xenproject.org
> -Cc: Stefano Stabellini <sstabellini@kernel.org>
> -Cc: Julien Grall <julien@xen.org>
> -Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> -Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> -Date: Mon, 31 Jul 2023 17:01:32 -0700
> -Subject: [PATCH] arm32: Avoid using solaris syntax for .section directive
> +Date: Tue, 1 Aug 2023 10:49:30 -0700
> +Subject: [PATCH] arm: Avoid using solaris syntax for .section directive
>  
> -Assembler from binutils 2.41 rejects this syntax
> +Assembler from binutils 2.41 will rejects ([1], [2]) the following
> +syntax
>  
> -.section "name"[, flags...]
> +.section "name", #alloc
>  
> -where flags could be #alloc, #write, #execstr
> -Switch to using ELF syntax
> +for any other any target other than ELF SPARC. This means we can't use
> +it in the Arm code.
>  
> -.section name[, "flags"[, @type]]
> +So switch to the GNU syntax
>  
> -[1] https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_7.html#SEC119
> +.section name [, "flags"[, @type]]
>  
> -Upstream-Status: Submitted [by email to xen-devel@lists.xenproject.org and maintainers]
> +[1] https://sourceware.org/bugzilla/show_bug.cgi?id=11601
> +[2] https://sourceware.org/binutils/docs-2.41/as.html#Section
>  
> +Upstream-Status: Backport [https://github.com/xen-project/xen/commit/dfc490a3740bb7d6889939934afadcb58891fbce]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> +[jgrall: Reword commit message]
> +Acked-by: Julien Grall <jgrall@amazon.com>
>  ---
>   xen/arch/arm/arm32/proc-v7.S | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> + xen/arch/arm/dtb.S           | 2 +-
> + 2 files changed, 4 insertions(+), 4 deletions(-)
>  
>  diff --git a/xen/arch/arm/arm32/proc-v7.S b/xen/arch/arm/arm32/proc-v7.S
> -index c90a31d80f..6d3d19b873 100644
> +index c90a31d80fc5..6d3d19b87354 100644
>  --- a/xen/arch/arm/arm32/proc-v7.S
>  +++ b/xen/arch/arm/arm32/proc-v7.S
>  @@ -29,7 +29,7 @@ brahma15mp_init:
> @@ -57,6 +59,12 @@ index c90a31d80f..6d3d19b873 100644
>           .type __v7_brahma15mp_proc_info, #object
>   __v7_brahma15mp_proc_info:
>           .long 0x420F00F0             /* Broadcom Brahma-B15 */
> --- 
> -2.41.0
> -
> +diff --git a/xen/arch/arm/dtb.S b/xen/arch/arm/dtb.S
> +index c39f3a095c58..386f83ba649e 100644
> +--- a/xen/arch/arm/dtb.S
> ++++ b/xen/arch/arm/dtb.S
> +@@ -1,3 +1,3 @@
> +-        .section .dtb,#alloc
> ++        .section .dtb, "a"
> +         GLOBAL(_sdtb)
> +         .incbin CONFIG_DTB_FILE
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8169): https://lists.yoctoproject.org/g/meta-virtualization/message/8169
> Mute This Topic: https://lists.yoctoproject.org/mt/100626730/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


