Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B3810706E0
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 15:18:06 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11671.1773501480959088836
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 14 Mar 2026 08:18:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hAp10ptq;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8cd7ecedf2cso327805985a.3
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Mar 2026 08:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773501480; x=1774106280; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TBXmTLcZ58n4+5m9m5vYq3wLzSrvcjC/MtTjg9LAPa0=;
        b=hAp10ptqJzdrNC7FGHl7VkbsJpQuZ4CbDwt7tT6TnH/A+8dP8ocS9zYvtwBUOKpjaR
         40FTo5INcSCnfZ6QMZ4TslstcOr9kNXYrNfU2f6+zQJoApTDI9fJo1gPrB06vERti0H1
         5lmP/zbLX9B4kFEQEOamCnMRmOjeRW7dcnHps60Ti1dCRTnI9WduzDDrli5EOBjQ3oDm
         ONPEdt3XDPHZBPEK8BxPGDpg7eTdqw38LAgCB+tkj48JIHx9K2QU7w5OmHQdQaOBw1KP
         3j+NyA1dsSk28fELozBU99CqTHr56h4X3OUnHto4nnAzdZFg6hzxqHjPRwlTWJZV1OFh
         0K4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773501480; x=1774106280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBXmTLcZ58n4+5m9m5vYq3wLzSrvcjC/MtTjg9LAPa0=;
        b=l9OEwJGcuFNkD0y61NVVkX5ipWRL3tOATsMn+qBliWziJRbok5v5CCeM18HFAIKFUj
         GDKTg7TRT+I9RIRlBeG8YiacSlKAcHzUc1EqzGGMzkI54fbT1pjNPmBR8fJcIxIz8xTu
         rRjU3YoL0OIId+QsvVI5yLpCf3LWy0jfz9heFHMba1mNoKAr2JJFDoC1CoAu9s95xhVA
         2uO1zgM42BtNEOV7jQwkmyvzOcBKS4DUUMwJJAgJ1ta4VVYKGFq/LObQhKQAhvGrqwvi
         Y84QpXLzR1Ri16wuxfxaoFQAMgjvpF8UC5Zy1HEuL8OnuMMXmFuY0hLAHA9pvR34B9Oj
         QYVg==
X-Gm-Message-State: AOJu0YxG//GuelCzxuReo3rYVuYG+iyi2FBCVlbKLyofQZkKgU1OG8uj
	LIElkjgLN/eEq/pG660CCWF9sThOExO0SAu6EJDfIK8Ettwm5wDzEokVM1MZ8xzGX8Y=
X-Gm-Gg: ATEYQzy2oPBQoJtep7moZKxvsySMy/mLjqW6dBKBxJMpmMPpT9FL/o6m/mlRWcjnfDg
	2M3R+r8SkjZj570qtoZ5oL7BePYRrgpgpEO4J8DAeJn5w2f0PnOhgiJqlAhUc7yeYC4KpV68Fri
	qqxz2DZxhTN0jQh1e1A0QnT1tv6ssX36AIdfeSDbVC9RUYpd4tmWeV08prwUAURauhpnSboe2hs
	x0mgLD2ZPLO3n/WvJlbVHRNMCeGoRmynCp3VqtcGhgJtKg4wv+PoO0lMd4y1H8JVkzslS80NBCr
	YZri63R1gK8IEVSFS44Nl7TPQN1/6zukn6blmgbBs99IvHCg5oHhGAgiPQcE3UdpX5SwjE0mZBs
	vpdF8km+XAAhLGE1xZk8KWIXudimUAyrcJpKQzVMBZhVoGs75j4CzSqSo2QkVaNVOOWqWlmdS+4
	4l6CrOHJGyC/RnNyLXoLG7YBW5zUk578zIYGiMOgNsbmR3VEXJKt+nBwmb161SrReJ0op5ADJsf
	dfxA5dh/hpazERcm/d3Odkd6GJNURSJZ26k
X-Received: by 2002:a05:620a:4713:b0:8cd:9aba:f5fb with SMTP id af79cd13be357-8cdb5aa56famr934367785a.30.1773501479817;
        Sat, 14 Mar 2026 08:17:59 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1fbcd23sm934882285a.1.2026.03.14.08.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 08:17:59 -0700 (PDT)
Date: Sat, 14 Mar 2026 15:17:57 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: viswanath.kraleti@oss.qualcomm.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] lxc: backport fixes to build with
 glibc 2.43
Message-ID: <abV8JaSa8u2qXxYj@gmail.com>
References: <20260314071447.2558206-1-viswanath.kraleti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314071447.2558206-1-viswanath.kraleti@oss.qualcomm.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Mar 2026 15:18:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9657

Thanks for the patch!

I had an lxc -stable bump in progress, and it has that
fix, so I just pushed it to the top of the queue and it
is in master now.

Bruce


In message: [meta-virtualization][PATCH] lxc: backport fixes to build with glibc 2.43
on 14/03/2026 Viswanath Kraleti via lists.yoctoproject.org wrote:

> Building lxc with glibc 2.43 fails due to stricter header checks and
> FORTIFY related validations.
> 
> Backport the following upstream fixes to resolve these build failures:
>   - meson.build: fix open_how include handling for glibc 2.43+
>   - meson.build: fix openat2 include typo exposed by glibc 2.43 + FORTIFY
> 
> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> ---
>  ...fix-open_how-include-with-glibc-2.43.patch | 40 +++++++++++++++++++
>  ...openat2-include-typo-fix-with-glibc-.patch | 29 ++++++++++++++
>  recipes-containers/lxc/lxc_git.bb             |  2 +
>  3 files changed, 71 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/0001-meson.build-fix-open_how-include-with-glibc-2.43.patch
>  create mode 100644 recipes-containers/lxc/files/0001-meson.build-fix-openat2-include-typo-fix-with-glibc-.patch
> 
> diff --git a/recipes-containers/lxc/files/0001-meson.build-fix-open_how-include-with-glibc-2.43.patch b/recipes-containers/lxc/files/0001-meson.build-fix-open_how-include-with-glibc-2.43.patch
> new file mode 100644
> index 00000000..1b3d4de6
> --- /dev/null
> +++ b/recipes-containers/lxc/files/0001-meson.build-fix-open_how-include-with-glibc-2.43.patch
> @@ -0,0 +1,40 @@
> +From 388a511a7070d1ea9c6b8d2d98e6fa9a3efb0e87 Mon Sep 17 00:00:00 2001
> +From: Li Lu <1487442471@qq.com>
> +Date: Wed, 18 Feb 2026 09:24:26 +0800
> +Subject: [PATCH] meson.build: fix open_how include with glibc-2.43+
> +
> +Signed-off-by: Li Lu <1487442471@qq.com>
> +Upstream-Status: Backport [https://github.com/lxc/lxc/commit/5e68a7a633659039d9b114d2b75fdba0df51e52c]
> +---
> + meson.build          | 1 +
> + src/lxc/open_utils.h | 2 ++
> + 2 files changed, 3 insertions(+)
> +
> +diff --git a/meson.build b/meson.build
> +index 31f5472c5..637ee9873 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -664,6 +664,7 @@ endforeach
> + 
> + ## Types.
> + decl_headers = '''
> ++#include <fcntl.h>
> + #include <uchar.h>
> + #include <sys/mount.h>
> + #include <sys/stat.h>
> +diff --git a/src/lxc/open_utils.h b/src/lxc/open_utils.h
> +index 7ff5945c7..c9b978dbf 100644
> +--- a/src/lxc/open_utils.h
> ++++ b/src/lxc/open_utils.h
> +@@ -25,6 +25,8 @@ struct open_how {
> + 	__u64 mode;
> + 	__u64 resolve;
> + };
> ++#else
> ++#include <fcntl.h>
> + #endif
> + 
> + /* how->resolve flags for openat2(2). */
> +-- 
> +2.34.1
> +
> diff --git a/recipes-containers/lxc/files/0001-meson.build-fix-openat2-include-typo-fix-with-glibc-.patch b/recipes-containers/lxc/files/0001-meson.build-fix-openat2-include-typo-fix-with-glibc-.patch
> new file mode 100644
> index 00000000..d84f17c7
> --- /dev/null
> +++ b/recipes-containers/lxc/files/0001-meson.build-fix-openat2-include-typo-fix-with-glibc-.patch
> @@ -0,0 +1,29 @@
> +From 66ca3b2dee22d2d256e74ec55de2e5b0c975037c Mon Sep 17 00:00:00 2001
> +From: Joonas Niilola <juippis@gentoo.org>
> +Date: Sun, 15 Feb 2026 17:42:39 +0200
> +Subject: [PATCH] meson.build: fix openat2 include typo, fix with glibc-2.43
> + +FORTIFY
> +
> +Closes: https://github.com/lxc/lxc/issues/4641
> +Signed-off-by: Joonas Niilola <juippis@gentoo.org>
> +Upstream-Status: Backport [https://github.com/lxc/lxc/commit/511e4db8f2a5b47cdd41eef482647492ce5b0f77]
> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 637ee9873..a6bb21a94 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -557,7 +557,7 @@ foreach ident: [
> +     ['move_mount',        '''#include <sys/mount.h>'''],
> +     ['openat2',           '''#include <sys/types.h>
> +                              #include <sys/stat.h>
> +-                             #include <fctnl.h>'''],
> ++                             #include <fcntl.h>'''],
> +     ['open_tree',         '''#include <sys/mount.h>'''],
> +     ['personality',       '''#include <sys/personality.h>'''],
> +     ['pidfd_open',        '''#include <stdlib.h>
> +-- 
> +2.34.1
> +
> diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
> index 04db2ac0..0b6cbb75 100644
> --- a/recipes-containers/lxc/lxc_git.bb
> +++ b/recipes-containers/lxc/lxc_git.bb
> @@ -46,6 +46,8 @@ SRC_URI = "git://github.com/lxc/lxc.git;branch=stable-6.0;protocol=https \
>  	file://tests-our-init-is-not-busybox.patch \
>  	file://0001-template-if-busybox-contains-init-use-it-in-containe.patch \
>  	file://0001-build-Check-if-P_PIDFD-is-defined.patch \
> +        file://0001-meson.build-fix-openat2-include-typo-fix-with-glibc-.patch \
> +        file://0001-meson.build-fix-open_how-include-with-glibc-2.43.patch \
>  	file://dnsmasq.conf \
>  	file://lxc-net \
>  	"

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9654): https://lists.yoctoproject.org/g/meta-virtualization/message/9654
> Mute This Topic: https://lists.yoctoproject.org/mt/118310834/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


