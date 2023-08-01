Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB55BC00528
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 18:43:24 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.21152.1690915399419541791
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Aug 2023 11:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=UeXB0MN8;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-40694b191cfso45378221cf.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Aug 2023 11:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690915398; x=1691520198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IcKY8jBG5+K2KPYrlK5UyMvVnRSbN+BPY46LvJtY9aE=;
        b=UeXB0MN8O5D3L28bfFoMXmoJ5zHp6yTbHj2wFzGoFizlBfbg6ewYGarlSdJJ//K5s7
         qJeWvzPq/Mvsz0B8AuRVW6PQPCAjvQaD3GVHwKoWf7ZTuN6TOlTIkZsS80KIdyoR7X/L
         +RH0BOJ73t2mvIBhBebbOCF/O0N7eI5wXeGq39/zAzDKBT1UahWMIb3ASJsrX6h1Qwvv
         ypBt8rhe7U7hPdrmjGRSohWZJpHMSVbfXBVc3esrjN3OeC/aHxi2QVU/LYXi40Wi2SGh
         HW4gEBNQVVJJWLBRkBrLAqZB/nEJRbPQ06fiYnCI4AIVGYIIEF+NJAdjGnvAbsTfUC02
         V+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690915398; x=1691520198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcKY8jBG5+K2KPYrlK5UyMvVnRSbN+BPY46LvJtY9aE=;
        b=UvC6/xlCDfpgcGB1b5H9wPXhuZDs5VkYrpodEqHjm/xQGSVhCE4vPFk1nSfMubwTpN
         SA7gL8zUal0rvOm+aPmNTufqdeWCQqbiiB+wiAlbIhYITQgasnuHPTvLmHTelplulfnj
         o30iN9PmjqES7d+NpjYN3EAUPjC4Zsd3E/CzUosURJqzZqvGIjXjDYZ9AYXzN9WmdDxe
         HDKkm5irqSBOThfs1CUv0UOJfmBZSbqFAXbnVdakwKtJz5g/iIlQsGowpR0VI7sH5is/
         2bvpdjvgTwDg0c1NY6Lg9HwoEgskFlNl7aKuMSzrdPvn4WkBMOyrmcbLu5LSSnPqBgjA
         tjDg==
X-Gm-Message-State: ABy/qLbYbM8YSbRknA42UkLM0vgS5n7xSIP8mSPy9jDrzimLm9Sbb69f
	vg1LgOUQdBo9TFgF+trdTFI=
X-Google-Smtp-Source: APBJJlFHKq8i+vusoWVe/bFgiafYcuSja12fSStVBWpu3NkuTs62wpE9cTDHRjIU5LhCUiTwAHx/oA==
X-Received: by 2002:a05:622a:100b:b0:3fd:de11:d8e4 with SMTP id d11-20020a05622a100b00b003fdde11d8e4mr22051500qte.23.1690915398220;
        Tue, 01 Aug 2023 11:43:18 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id 3-20020ac85743000000b00403b44bc230sm4575807qtx.95.2023.08.01.11.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 11:43:17 -0700 (PDT)
Date: Tue, 1 Aug 2023 14:43:15 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [meta-virtualization][PATCH] xen: Fix build with gas/2.41
Message-ID: <ZMlSQxGZrSb4PU0Q@gmail.com>
References: <20230801003406.605140-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801003406.605140-1-raj.khem@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Aug 2023 18:43:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8160

merged.

Bruce

In message: [meta-virtualization][PATCH] xen: Fix build with gas/2.41
on 31/07/2023 Khem Raj wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  ...g-solaris-syntax-for-.section-direct.patch | 62 +++++++++++++++++++
>  recipes-extended/xen/xen_4.17.bb              |  4 ++
>  2 files changed, 66 insertions(+)
>  create mode 100644 recipes-extended/xen/files/0001-arm32-Avoid-using-solaris-syntax-for-.section-direct.patch
> 
> diff --git a/recipes-extended/xen/files/0001-arm32-Avoid-using-solaris-syntax-for-.section-direct.patch b/recipes-extended/xen/files/0001-arm32-Avoid-using-solaris-syntax-for-.section-direct.patch
> new file mode 100644
> index 0000000..c73bb27
> --- /dev/null
> +++ b/recipes-extended/xen/files/0001-arm32-Avoid-using-solaris-syntax-for-.section-direct.patch
> @@ -0,0 +1,62 @@
> +From 9add6f9aced42a76f6a2c124754bef6fde56fa05 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +To: xen-devel@lists.xenproject.org
> +Cc: Stefano Stabellini <sstabellini@kernel.org>
> +Cc: Julien Grall <julien@xen.org>
> +Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> +Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> +Date: Mon, 31 Jul 2023 17:01:32 -0700
> +Subject: [PATCH] arm32: Avoid using solaris syntax for .section directive
> +
> +Assembler from binutils 2.41 rejects this syntax
> +
> +.section "name"[, flags...]
> +
> +where flags could be #alloc, #write, #execstr
> +Switch to using ELF syntax
> +
> +.section name[, "flags"[, @type]]
> +
> +[1] https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_7.html#SEC119
> +
> +Upstream-Status: Submitted [by email to xen-devel@lists.xenproject.org and maintainers]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + xen/arch/arm/arm32/proc-v7.S | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/xen/arch/arm/arm32/proc-v7.S b/xen/arch/arm/arm32/proc-v7.S
> +index c90a31d80f..6d3d19b873 100644
> +--- a/xen/arch/arm/arm32/proc-v7.S
> ++++ b/xen/arch/arm/arm32/proc-v7.S
> +@@ -29,7 +29,7 @@ brahma15mp_init:
> +         mcr   CP32(r0, ACTLR)
> +         mov   pc, lr
> + 
> +-        .section ".proc.info", #alloc
> ++        .section .proc.info, "a"
> +         .type __v7_ca15mp_proc_info, #object
> + __v7_ca15mp_proc_info:
> +         .long 0x410FC0F0             /* Cortex-A15 */
> +@@ -38,7 +38,7 @@ __v7_ca15mp_proc_info:
> +         .long caxx_processor
> +         .size __v7_ca15mp_proc_info, . - __v7_ca15mp_proc_info
> + 
> +-        .section ".proc.info", #alloc
> ++        .section .proc.info, "a"
> +         .type __v7_ca7mp_proc_info, #object
> + __v7_ca7mp_proc_info:
> +         .long 0x410FC070             /* Cortex-A7 */
> +@@ -47,7 +47,7 @@ __v7_ca7mp_proc_info:
> +         .long caxx_processor
> +         .size __v7_ca7mp_proc_info, . - __v7_ca7mp_proc_info
> + 
> +-        .section ".proc.info", #alloc
> ++        .section .proc.info, "a"
> +         .type __v7_brahma15mp_proc_info, #object
> + __v7_brahma15mp_proc_info:
> +         .long 0x420F00F0             /* Broadcom Brahma-B15 */
> +-- 
> +2.41.0
> +
> diff --git a/recipes-extended/xen/xen_4.17.bb b/recipes-extended/xen/xen_4.17.bb
> index 9da1b19..bd8f55b 100644
> --- a/recipes-extended/xen/xen_4.17.bb
> +++ b/recipes-extended/xen/xen_4.17.bb
> @@ -7,6 +7,7 @@ XEN_BRANCH ?= "stable-${XEN_REL}"
>  SRC_URI = " \
>      git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
>      file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
> +    file://0001-arm32-Avoid-using-solaris-syntax-for-.section-direct.patch \
>      "
>  
>  LIC_FILES_CHKSUM ?= "file://COPYING;md5=d1a1e216f80b6d8da95fec897d0dbec9"
> @@ -17,3 +18,6 @@ S = "${WORKDIR}/git"
>  
>  require xen.inc
>  require xen-hypervisor.inc
> +
> +TOOLCHAIN = "gcc"
> +LDFLAGS:remove = "-fuse-ld=lld"
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8154): https://lists.yoctoproject.org/g/meta-virtualization/message/8154
> Mute This Topic: https://lists.yoctoproject.org/mt/100474396/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


