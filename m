Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1DBC4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 22:20:14 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.84576.1701728410156059744
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 04 Dec 2023 14:20:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XUwZgnAJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-67ad032559fso5468906d6.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 04 Dec 2023 14:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701728409; x=1702333209; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mKc+1oqgijmmzFGeaLjBsnw24KV0Nki8PNbWnLb9Ok4=;
        b=XUwZgnAJUSdjohXJL+MhCxBzHyAwCdCszGtcDx835/u6OrQo02uvc9aa2Y2bcLvyRY
         PNZ/tGFDknx8isK+tOJyJGnWa+jqMytvpt4yxR7n2gWhUCMPulTm4be8VgVhJCBoK5os
         sqt5yDPFEthV1K4ipKYoSwFfmhjm7gubfBHpBPxO+KLnqD5KpbygZdbLp6cF7WOGPh82
         sGv1fiVZ55hqh1wez+fXEt0scai8Bmge7OnYJpJh9FU7bI1EQNuGHHOVnxomtsNVpUdL
         XRj7GMfd1yX4gD9p3XA1dHAGGVMDvvbcqcm28Lsx9IGPnHMb3RzpETwCTOFn8s/izTbo
         F1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701728409; x=1702333209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKc+1oqgijmmzFGeaLjBsnw24KV0Nki8PNbWnLb9Ok4=;
        b=b8RzPYnW8bvZgOeJ92uX43gdhSyGPx6PShRYyBqbpFYZch9u5mvAemKcMLEbArh+r4
         U1iVaQNBC/TbgCGaiSbglSY6TJNSxsQNPlZ8sJFnicOW5jbYqHtnJ53QL10jApN2Jq71
         uwadfUXlLhIS46XDHPBuEPeLex7lvnChV97YMPexlAzp2zgIPhzxQMQl7drJ7oa8cj2k
         5Vv8J8try6jk3HYX2T8zeGFqGEZzCptgrJQe2IjAnorv8FjojU9t/jkaLibaENctD22H
         aGcBV3m2KsgBXpj91C/NuYdI5yKwlbvHsk67Ift9VnWXfUjJAy1iPe2dB9cy0nW/H4jn
         gJsA==
X-Gm-Message-State: AOJu0YzfniaOEHaPQwmS4x9vITf2BVAg1tiSVCjKyDT3casv+rM+C15k
	IKtT2Fw8yo1FmTzk3ridWrpw85zwxbY=
X-Google-Smtp-Source: AGHT+IE4y2JKrtZUuDEE/ccdrvl3x7HJpTKh+/owVkKr17Tnveiq7bDfrUYCzzlG6mdpn0F1SK3Arg==
X-Received: by 2002:ad4:5305:0:b0:67a:a721:d776 with SMTP id y5-20020ad45305000000b0067aa721d776mr308094qvr.92.1701728409173;
        Mon, 04 Dec 2023 14:20:09 -0800 (PST)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id z16-20020a0ce990000000b0067aa05449cesm3353417qvn.3.2023.12.04.14.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 14:20:08 -0800 (PST)
Date: Mon, 4 Dec 2023 22:20:07 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Alexander Kanavin <alex@linutronix.de>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] xen-tools: fix python 3.12 build
 errors
Message-ID: <ZW5Qlwe6CIaegBaS@gmail.com>
References: <20231128175003.3883327-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128175003.3883327-1-alex@linutronix.de>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 04 Dec 2023 22:20:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8489

Thanks for the fix!

this is now merged.

Bruce

In message: [meta-virtualization][PATCH] xen-tools: fix python 3.12 build errors
on 28/11/2023 Alexander Kanavin wrote:

> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...mk-drop-Wdeclaration-after-statement.patch | 42 +++++++++++++++++++
>  recipes-extended/xen/xen-tools_4.17.bb        | 10 ++---
>  2 files changed, 47 insertions(+), 5 deletions(-)
>  create mode 100644 recipes-extended/xen/files/0001-Config.mk-drop-Wdeclaration-after-statement.patch
> 
> diff --git a/recipes-extended/xen/files/0001-Config.mk-drop-Wdeclaration-after-statement.patch b/recipes-extended/xen/files/0001-Config.mk-drop-Wdeclaration-after-statement.patch
> new file mode 100644
> index 00000000..dcfffb06
> --- /dev/null
> +++ b/recipes-extended/xen/files/0001-Config.mk-drop-Wdeclaration-after-statement.patch
> @@ -0,0 +1,42 @@
> +From 70e8b986fe78f5fbd1dfdef4f02ea9b50c7158db Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Tue, 28 Nov 2023 18:34:17 +0100
> +Subject: [PATCH] Config.mk: drop -Wdeclaration-after-statement
> +
> +Such constructs are fully allowed by C99:
> +https://gcc.gnu.org/onlinedocs/gcc-12.2.0/gcc/Mixed-Labels-and-Declarations.html#Mixed-Labels-and-Declarations
> +
> +If the flag is present, then building against python 3.12 will fail thusly:
> +
> +| In file included from /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/Python.h:44,
> +|                  from xen/lowlevel/xc/xc.c:8:
> +| /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/object.h: In function 'Py_SIZE':
> +| /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/object.h:233:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
> +|   233 |     PyVarObject *var_ob = _PyVarObject_CAST(ob);
> +|       |     ^~~~~~~~~~~
> +| In file included from /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/Python.h:53:
> +| /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/cpython/longintrepr.h: In function '_PyLong_CompactValue':
> +| /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/cpython/longintrepr.h:121:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
> +|   121 |     Py_ssize_t sign = 1 - (op->long_value.lv_tag & _PyLong_SIGN_MASK);
> +|       |     ^~~~~~~~~~
> +| cc1: all warnings being treated as errors
> +
> +Upstream-Status: Submitted [by email to xen-devel@lists.xenproject.org and maintainers printed by get_maintainer.pl]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + Config.mk | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/Config.mk b/Config.mk
> +index 8bc2bcd5f6..09d5e8ebde 100644
> +--- a/Config.mk
> ++++ b/Config.mk
> +@@ -173,8 +173,6 @@ CFLAGS += -std=gnu99
> + 
> + CFLAGS += -Wall -Wstrict-prototypes
> + 
> +-$(call cc-option-add,HOSTCFLAGS,HOSTCC,-Wdeclaration-after-statement)
> +-$(call cc-option-add,CFLAGS,CC,-Wdeclaration-after-statement)
> + $(call cc-option-add,CFLAGS,CC,-Wno-unused-but-set-variable)
> + $(call cc-option-add,CFLAGS,CC,-Wno-unused-local-typedefs)
> + 
> diff --git a/recipes-extended/xen/xen-tools_4.17.bb b/recipes-extended/xen/xen-tools_4.17.bb
> index c6a3052c..e011b87c 100644
> --- a/recipes-extended/xen/xen-tools_4.17.bb
> +++ b/recipes-extended/xen/xen-tools_4.17.bb
> @@ -4,11 +4,11 @@ SRCREV ?= "322a20add00a4687cd46d9183616fa6fecbef81f"
>  XEN_REL ?= "4.17"
>  XEN_BRANCH ?= "stable-${XEN_REL}"
>  
> -SRC_URI = " \
> -    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
> -    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> -    file://0001-tools-xenstore-xenstored_control.c-correctly-print-t.patch \
> -    "
> +SRC_URI = "git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
> +           file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> +           file://0001-tools-xenstore-xenstored_control.c-correctly-print-t.patch \
> +           file://0001-Config.mk-drop-Wdeclaration-after-statement.patch \
> +           "
>  
>  LIC_FILES_CHKSUM ?= "file://COPYING;md5=d1a1e216f80b6d8da95fec897d0dbec9"
>  
> -- 
> 2.39.2
> 

