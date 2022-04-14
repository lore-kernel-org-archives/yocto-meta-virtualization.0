Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 012A9C54EC5
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:55 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web08.7572.1649906223782760691
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 20:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jL1ZPTdr;
 spf=pass (domain: gmail.com, ip: 209.85.217.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id j16so3361654vsv.2
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 20:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=z3bJXc+qBXyudlhuuEKy1RYaPR//bQQpcAJfE7G4hZM=;
        b=jL1ZPTdrvdvfZVzRqcAXaA8NDr5GNtEF57HMRrZHW9UutGtU7kS94IyGo51Vc4L0Dd
         0cp7LVXXPLyWnd3jDOKFU9d0H43KJdWrw4kFE385sXqgA2w2Qro9GfDdNLvZkGdmOmji
         JFnfnXJIYAvH9vjK5ogakhDA2RvSLpBRyWSInQ7OmoOu3jftyxaKjrKbJTd81ToY+QTi
         aaJQn3BdUT8zckRfxrFxcWQhqSQrmNJE+saUGHdWhcerqu96xw1245/S/JQzPzUabne4
         pvGFvbRe+Em9ds9bFEIMntEvab6nv2B/NjKOLbEl4ig67frQD2zFZysWAzED61HF9nBg
         eQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=z3bJXc+qBXyudlhuuEKy1RYaPR//bQQpcAJfE7G4hZM=;
        b=KYFfEjMzDkCUc+RE6ar1WD9/dKH6+18UZ16H4+0Gz+cSans8MWnettbD18m20pCn3Q
         iuOa/2ot3FwKjDbdEQP+BBw0YZonE+DPrtaRYNfCoFrEWKENvx0SJkFS/1g6Z2U2WPG6
         x8HsJgTibFh0sSbviUuCWhXbCb61RzKHUZIGWS7Z0S7yVgzpu0BqtzEqnFDOCL+oAol3
         22cdr8wQIpe7ezalP+0v1Jc0iZOLZ7u/4X3ePEkq33l1qyXbCyw3wlHQ2YpPH7BW1z2a
         vQTu9xAcjfvYbe+QRqwv3w0asFCmhK4dcNPBR0VvXFOQlppuG2hSECU4La1UW7a7I7Ta
         7KUg==
X-Gm-Message-State: AOAM5336fudFTIGTsaPZZCB8nXyT/GMWACTbhvXySKnEM7bPQw1+RnWg
	z0e+LuYuOPcaUeneuDVdeOQ6fmsfyGzcBQ==
X-Google-Smtp-Source: 
 ABdhPJyr54EIwwkfmJyZ5YrKtMnAoFrEuui3Loe3SjDfLcOYmghlKbFpv7TThTNOlrKua0aebV+WIw==
X-Received: by 2002:a05:6102:3107:b0:32a:e37:4544 with SMTP id
 e7-20020a056102310700b0032a0e374544mr612580vsh.14.1649906222858;
        Wed, 13 Apr 2022 20:17:02 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 y1-20020ab02ea1000000b0035d32c3b775sm125713uay.33.2022.04.13.20.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 20:17:02 -0700 (PDT)
Date: Wed, 13 Apr 2022 23:17:00 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] libvmi: Fix out of box build
 failure with xen disabled
Message-ID: <20220414031700.GB28550@gmail.com>
References: <20220413102055.9763-1-zhe.he@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413102055.9763-1-zhe.he@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7171

merged.

Bruce

In message: [meta-virtualization][PATCH] libvmi: Fix out of box build failure with xen disabled
on 13/04/2022 He Zhe wrote:

> vbd was added for xen based VMs since
> bdee00fac9b4 ("Disk reading interface for Xen based VMs and example")
> and should be built only when xen is enabled, otherwise there would not be
> necessary xen headers and cause the following failure.
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  ...1-Build-vbd-only-when-xen-is-enabled.patch | 76 +++++++++++++++++++
>  recipes-extended/libvmi/libvmi_git.bb         |  1 +
>  2 files changed, 77 insertions(+)
>  create mode 100644 recipes-extended/libvmi/files/0001-Build-vbd-only-when-xen-is-enabled.patch
> 
> diff --git a/recipes-extended/libvmi/files/0001-Build-vbd-only-when-xen-is-enabled.patch b/recipes-extended/libvmi/files/0001-Build-vbd-only-when-xen-is-enabled.patch
> new file mode 100644
> index 00000000..bf6e9f0e
> --- /dev/null
> +++ b/recipes-extended/libvmi/files/0001-Build-vbd-only-when-xen-is-enabled.patch
> @@ -0,0 +1,76 @@
> +From fb7a1493c7d4a30ae930d8cb7dcb84c83c0cacce Mon Sep 17 00:00:00 2001
> +From: He Zhe <zhe.he@windriver.com>
> +Date: Wed, 13 Apr 2022 09:26:01 +0000
> +Subject: [PATCH] Build vbd only when xen is enabled
> +
> +vbd was added for xen based VMs since
> +bdee00fac9b4 ("Disk reading interface for Xen based VMs and example")
> +and should be built only when xen is enabled, otherwise there would not be
> +necessary xen headers and cause the following failure.
> +
> +xen_private.h:38:10: fatal error: xenctrl.h: No such file or directory
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: He Zhe <zhe.he@windriver.com>
> +---
> + Makefile.am           | 8 ++++----
> + libvmi/CMakeLists.txt | 2 +-
> + 2 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 097c23c..c560a1d 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -17,8 +17,7 @@ h_private = \
> +     libvmi/os/os_interface.h \
> +     libvmi/driver/driver_interface.h \
> +     libvmi/driver/driver_wrapper.h \
> +-    libvmi/driver/memory_cache.h \
> +-    libvmi/disk/vbd_private.h
> ++    libvmi/driver/memory_cache.h
> + 
> + c_sources = \
> +     libvmi/accessors.c \
> +@@ -39,8 +38,7 @@ c_sources = \
> +     libvmi/arch/ept.c \
> +     libvmi/driver/driver_interface.c \
> +     libvmi/driver/memory_cache.c \
> +-    libvmi/os/os_interface.c \
> +-    libvmi/disk/vbd.c
> ++    libvmi/os/os_interface.c
> + 
> + if ENABLE_ADDRESS_CACHE
> +     c_sources   += libvmi/cache.c
> +@@ -104,6 +102,8 @@ if WITH_XEN
> +                    libvmi/driver/xen/libxc_wrapper.h \
> +                    libvmi/driver/xen/libxs_wrapper.c \
> +                    libvmi/driver/xen/libxs_wrapper.h
> ++    h_private   += libvmi/disk/vbd_private.h
> ++    c_sources   += libvmi/disk/vbd.c
> + endif
> + 
> + if WITH_BAREFLANK
> +diff --git a/libvmi/CMakeLists.txt b/libvmi/CMakeLists.txt
> +index ac57d79..7e87751 100644
> +--- a/libvmi/CMakeLists.txt
> ++++ b/libvmi/CMakeLists.txt
> +@@ -18,7 +18,6 @@ set(libvmi_src
> +     driver/driver_interface.c
> +     driver/memory_cache.c
> +     os/os_interface.c
> +-    disk/vbd.c
> + )
> + 
> + add_library(vmi OBJECT ${libvmi_src})
> +@@ -169,6 +168,7 @@ add_subdirectory(os)
> + 
> + 
> + if (ENABLE_XEN)
> ++    list(APPEND libvmi_src disk/vbd.c)
> +     find_package(Xen REQUIRED)
> +     list(APPEND VMI_PUBLIC_HEADERS events.h)
> +     # CMAKE_DL_LIBS -> dlopen* lib
> +-- 
> +2.32.0
> +
> diff --git a/recipes-extended/libvmi/libvmi_git.bb b/recipes-extended/libvmi/libvmi_git.bb
> index d856256a..72069c68 100644
> --- a/recipes-extended/libvmi/libvmi_git.bb
> +++ b/recipes-extended/libvmi/libvmi_git.bb
> @@ -9,6 +9,7 @@ PV = "0.14.0+git${SRCPV}"
>  DEPENDS = "libvirt libcheck bison fuse byacc-native"
>  
>  SRC_URI = "git://github.com/libvmi/libvmi.git;branch=master;protocol=https \
> +           file://0001-Build-vbd-only-when-xen-is-enabled.patch \
>  "
>  
>  SRCREV = "41600b602815a9c42620cd5a96c5b88739fc6d9b"
> -- 
> 2.32.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7167): https://lists.yoctoproject.org/g/meta-virtualization/message/7167
> Mute This Topic: https://lists.yoctoproject.org/mt/90437503/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


