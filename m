Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D641CFD376
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 04:52:27 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.785.1764651143452833469
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 20:52:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TZq38HWm;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8b2f2c5ec36so512117785a.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 01 Dec 2025 20:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764651142; x=1765255942; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0WDFUoyF7YBTRjRokwGfW16ms4gwjOvleOZwSCKd2Eo=;
        b=TZq38HWmsEX1tb7E9eJ7nxlFCnN4W2D4k08VkevEhGqnUZpa7WWOsWPFw3bvLjQHsJ
         7ecvH8qCS5e8ugW6k5BAmR7E0rKSQZ7x9v1l5lv+1X87w6mozWZux9/5uDpIgpjZJ42K
         Zgn3M/lU4goBDp2aYs1Kjl5vlAAcdtv/35pDgsnKPRNSwlQa2etQkDSdHsEzr8X6zufC
         s4rPnkM4dpVBQ7uVNhQqBmPgdAetMWHYo/l7R31VGrzWpuf0v5ggukt8dQgwSDhXYhDw
         /bimr+p+5VlPe2I7HnEarc4yfz/eFz+qcKXF4iJIR9NHfd2gt2CTvYUDmDsuWaIKBcz+
         zwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764651142; x=1765255942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0WDFUoyF7YBTRjRokwGfW16ms4gwjOvleOZwSCKd2Eo=;
        b=YEtHGj0Qz/914gMopFOPFV39UX+1HLJcTpETue7h9t0OCDyryjmOAxOfqGrRILIiqq
         DhdstayAlDCnshUY7DdGujQbXS1f/zwRoqEJ1NGQvsTHqIWspn6u6rxFTMOBdRosCC6y
         41ZzvHuYoxNMl5xIZz84AD9oXUdeAHvy/7WcsfVA4kP9hMHf/FrWpqGquP1DiGOi2+5c
         Aie+VKdyOxrogCk4glb699WtegFgK1WA08tw24SMhMIrqhgSc1gHB3ouryVbBQXKfMYL
         90Qcl/3Q80ugqn7wvJiZBanFQpmkBbPHKTk9lJZHyHfHWstbQ6Idh0gzVqCp4hN1uK3A
         RPcA==
X-Gm-Message-State: AOJu0YwRt/KRpTrMNRZQ2jb8mr9rtSPKD6hn8kNPMQnPF104jAnyPVbz
	I4DrTfgZNy8SohUtG0hScEUy+7SVnhSQsg5yTU1HRwlEOdsj3aW8YBGqt63r5Po10Qc=
X-Gm-Gg: ASbGnctFi1ILXWO/LvA36os7BkS62h5Wivpjagetz+7iQ0jP+SuUa4GxHs0mpI5xX3B
	BSbk6PhyjyTQ+Bv+OwnkBjSUEmdYDEoAv7BYQX+oLbA+A0ZfztCLxxcHS1QxGsxlTpKcfbNOioo
	H+zGoA6pY8zabU94p3Iy3eiZb445FBHjBLlJcAxb5mgZZpFjEf6B8K11mBxRzGuBtf4lTtn5f82
	JuAjEw94BZ0MupFEfe5rTQyIZbHNOwbyKB3wyVHVqhi1hQxPJxufkzKpZsxZGhKH0mJYmzBwZ2h
	idb0KMVP2/InvWktAMeMTGgKgpyzInq7+ond3e0AJPYwfNlDbwiKKEnpMLvvmuxunCIhpyQFjqj
	PX4WyswwBWNV9T/giYK94wLsajVgiENEW44rrM4XZLV+G97RzO8jLP4HVboB+7wBMoNTxFQKsSd
	JCaAqawCfYzfRGYyarhqoUTg70EKySXG36dY/uEJ5n8xTvF6fL2+tpMS6lkooxRX4W
X-Google-Smtp-Source: AGHT+IHQXDOYohdvKe3A87GAQNpWkJLPw6UTuDmDIxDocD+NIIWm1xqaax0vErzU16vHFKWhJXT3yA==
X-Received: by 2002:a05:620a:172c:b0:89d:516c:7f7d with SMTP id af79cd13be357-8b33d4cfab7mr5446300785a.55.1764651142345;
        Mon, 01 Dec 2025 20:52:22 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b5299a5cc2sm988487685a.17.2025.12.01.20.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 20:52:21 -0800 (PST)
Date: Mon, 1 Dec 2025 23:52:20 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: jaeyoon.jung@lge.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH v2] lxc: Fix build with musl
Message-ID: <aS5whNHrxKazRxVa@gmail.com>
References: <20251130032438.1200801-1-jaeyoon.jung@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251130032438.1200801-1-jaeyoon.jung@lge.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Dec 2025 04:52:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9471

staged to master-next.

Bruce

In message: [meta-virtualization] [PATCH v2] lxc: Fix build with musl
on 30/11/2025 Jaeyoon Jung (LGE) via lists.yoctoproject.org wrote:

> From: Jaeyoon Jung <jaeyoon.jung@lge.com>
> 
> Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
> ---
>  ...01-build-Check-if-P_PIDFD-is-defined.patch | 56 +++++++++++++++++++
>  recipes-containers/lxc/lxc_git.bb             |  1 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/0001-build-Check-if-P_PIDFD-is-defined.patch
> 
> diff --git a/recipes-containers/lxc/files/0001-build-Check-if-P_PIDFD-is-defined.patch b/recipes-containers/lxc/files/0001-build-Check-if-P_PIDFD-is-defined.patch
> new file mode 100644
> index 00000000..b7a2bb05
> --- /dev/null
> +++ b/recipes-containers/lxc/files/0001-build-Check-if-P_PIDFD-is-defined.patch
> @@ -0,0 +1,56 @@
> +From 4d00d4f8046972907ef34ac5677d07ae39f3aded Mon Sep 17 00:00:00 2001
> +From: Jaeyoon Jung <jaeyoon.jung@lge.com>
> +Date: Sun, 30 Nov 2025 11:51:13 +0900
> +Subject: [PATCH] build: Check if P_PIDFD is defined
> +
> +It is defined in enum 'idtype_t' in some environment in which causes an
> +error like:
> +../git/src/lxc/process_utils.h:144:17: error: expected identifier before numeric constant
> +  144 | #define P_PIDFD 3
> +      |                 ^
> +
> +Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
> +Upstream-Status: Submitted [https://github.com/lxc/lxc/pull/4614]
> +---
> + meson.build             | 11 +++++++++++
> + src/lxc/process_utils.h |  2 +-
> + 2 files changed, 12 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index ec7524c2..4b3a8f07 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -521,6 +521,17 @@ foreach ccattr: [
> +     srcconf.set10('HAVE_COMPILER_ATTR_' + ccattr.underscorify().to_upper(), cc.has_function_attribute(ccattr))
> + endforeach
> + 
> ++## P_PIDFD
> ++test_code = '''
> ++#include <sys/wait.h>
> ++void func() { siginfo_t s; int r = waitid(P_PIDFD, 0, &s, 0); }
> ++'''
> ++if cc.compiles(test_code, name: 'waitid(P_PIDFD, ...)')
> ++    srcconf.set('HAVE_P_PIDFD', 1)
> ++  else
> ++    srcconf.set('HAVE_P_PIDFD', 0)
> ++endif
> ++
> + ## Headers.
> + foreach ident: [
> +     ['bpf',               '''#include <sys/syscall.h>
> +diff --git a/src/lxc/process_utils.h b/src/lxc/process_utils.h
> +index effff9bd..f4f53a23 100644
> +--- a/src/lxc/process_utils.h
> ++++ b/src/lxc/process_utils.h
> +@@ -139,7 +139,7 @@
> + #endif
> + 
> + /* waitid */
> +-#if !HAVE_SYS_PIDFD_H
> ++#if !HAVE_P_PIDFD
> + #ifndef P_PIDFD
> + #define P_PIDFD 3
> + #endif
> +-- 
> +2.47.2
> +
> diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
> index 2f0e8e74..5d4494a6 100644
> --- a/recipes-containers/lxc/lxc_git.bb
> +++ b/recipes-containers/lxc/lxc_git.bb
> @@ -45,6 +45,7 @@ SRC_URI = "git://github.com/lxc/lxc.git;branch=stable-6.0;protocol=https \
>  	file://0001-download-don-t-try-compatbility-index.patch \
>  	file://tests-our-init-is-not-busybox.patch \
>  	file://0001-template-if-busybox-contains-init-use-it-in-containe.patch \
> +	file://0001-build-Check-if-P_PIDFD-is-defined.patch \
>  	file://dnsmasq.conf \
>  	file://lxc-net \
>  	"
> -- 
> 2.47.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9464): https://lists.yoctoproject.org/g/meta-virtualization/message/9464
> Mute This Topic: https://lists.yoctoproject.org/mt/116535047/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


