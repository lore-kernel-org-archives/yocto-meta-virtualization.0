Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD9B10706E5
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 15:19:25 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11684.1773501559105444067
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 14 Mar 2026 08:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=exKhNE1Z;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-506aa68065eso28058351cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Mar 2026 08:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773501558; x=1774106358; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1AOriKLKhY8Lu12ZBiAnfUVrbT29Vq8qbK1KJa8Bv4=;
        b=exKhNE1ZiIegfL3kxWafPbPVqfL8R+dVC2zbysTKeZzmyUWxcHCiwYAgfJl0ZxBl2c
         ezMzZyftZlsj7L5erqB1bOQIOYvHFQyPm2Ym2ShUvangieP/qBg3itYRInu44uZQ33pg
         gWxh2bZ1afx1A8OiPYO+5sdDAIRl1rS8c5TWq0y1mUm3tIltgESZpdbs/rT8OrI91tqw
         V7kTprydbOjS9Ahuf7+9xekimLu2PT9zN4/TUHHDcsCC84kdkVN7U3mFySYzr+PhEGNE
         EcyXdDOX+GK9t6UYH4oq9V9/2fb+/p1jcaNM9trUZKdcrljsg1dS6Vepa2rj4ImKyEk6
         1Y6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773501558; x=1774106358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1AOriKLKhY8Lu12ZBiAnfUVrbT29Vq8qbK1KJa8Bv4=;
        b=q5THrppN9gUOWt1FVDJ66rFk+N3nCOxrXAPN3vfZ1Bbgb1h2N/uKWs3s8mNnLgutAr
         Z9zpijO4NH7bBAz7i7bF7Zb9agQyMo2fzYtxf0Cm89AKCqaQmSNHwcwdGbO0OgznZtim
         ryrtwqpOgWOH9KHCFSPGd5Z/C99zwu1Zug0rNmPDDI0Lwcw8a+SMxY14IPMAbhUTxeNI
         fFdvT5dbgdFZct7PsbO/a595zRnFSyr1vopXfYgvoNttp0s2LKiV7Voko9uGIAKA3CcG
         as/zUtCqDXskPMJZNddCtBS3ggxl8MtC9c/O7QG0IoHu20+Nf3y+5FfrDGWLmfRN5GV9
         woKw==
X-Gm-Message-State: AOJu0YwZXBuDz+XzoVMUUhm0YXUHDUCOvUuPGMfXGYgfke62ccbVPKQb
	sTELTDYiVc52XfYogy4I6tPDR5eDe7RuxFEZHbQ/Mj26zqMgHNgJJM07HzjQD5hjJOo=
X-Gm-Gg: ATEYQzwUYA1/QLO6cMfaRAUONZdoWMNnEwljH/qECs1wyfv7I7FNNhfnK+eeY3APrL/
	rNhpYEqtzAOOEv65xAJbtQb5naP7shKeOdcBoyy8lrZf6DscOKg5qO25tUII9uK69LEkSz+E9nB
	RoYs17AmL2AwuL436hDNO/yQYKekb1GSzA/clfpe7K3DtgyaqSKcK7sBhwEzv3Pb7YViK2+gt2c
	1KrUiZUBSv7hxSHzO5zqZTe/IujOSRqA6z8bE/DZcTD4jYCcBV/NpzjsJivcS1Xb/VVj58QhvF3
	XFY5ARxQEtB/L611IMA3Z68fymRKj19ryMElBdqcRXyev38crBvmhVHEFfaZ+kwtA3DRSUQhHru
	upwi+m5Q2c1dbUBK1EQubbZAzvM2WOUA7FKCQOfCZZBRChpVOtR1oQed+DsegeL5UEX5ovOLnFs
	0Pr6N7LVdH2Jk/neLmxsDjnew16m67xgvn2fe3Yj0rZGq1jBA2F38Re/a1oQevqif46rulFovl1
	IE5c+9C7Sqk+nHHv54xO3U7iuHnhCkzH9pY
X-Received: by 2002:a05:622a:210:b0:509:aa4:4a02 with SMTP id d75a77b69052e-50957d21b89mr95040041cf.29.1773501557976;
        Sat, 14 Mar 2026 08:19:17 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5093a0e9658sm97572521cf.21.2026.03.14.08.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 08:19:16 -0700 (PDT)
Date: Sat, 14 Mar 2026 15:19:15 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: viswanath.kraleti@oss.qualcomm.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [meta-oe][PATCH] android-tools: add fix
 for strchr() conformance to C23
Message-ID: <abV8c0oULEEyuixH@gmail.com>
References: <20260314121459.2875362-1-viswanath.kraleti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314121459.2875362-1-viswanath.kraleti@oss.qualcomm.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Mar 2026 15:19:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9659

scripting mis-fire, wrong list! (which you clearly knew since
it is in the subject prefixes)

Bruce

In message: [meta-virtualization] [meta-oe][PATCH] android-tools: add fix for strchr() conformance to C23
on 14/03/2026 Viswanath Kraleti via lists.yoctoproject.org wrote:

> Building android-tools v29.0.6.r14 with glibc 2.43 fails due to ISO C23
> changes to strchr(). Add a patch to update the affected libunwind sources
> to use const pointer types to fix this build failure.
> 
> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> ---
>  ...nd-fix-strchr-conformance-to-ISO-C23.patch | 27 +++++++++++++++++++
>  .../android-tools/android-tools_29.0.6.r14.bb |  1 +
>  2 files changed, 28 insertions(+)
>  create mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch
> 
> diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch
> new file mode 100644
> index 0000000000..4da65ea285
> --- /dev/null
> +++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch
> @@ -0,0 +1,27 @@
> +From d91f5324f809c3a5b0343927716e4b99bc31db53 Mon Sep 17 00:00:00 2001
> +From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> +Date: Fri, 13 Mar 2026 18:57:36 +0530
> +Subject: [PATCH] libunwind: fix strchr() conformance to ISO C23
> +
> +Fix uses of strchr() to conform to ISO C23, supported since glibc-2.43
> +
> +Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> +Upstream-Status: Pending
> +---
> + external/libunwind/src/dwarf/Gfind_proc_info-lsb.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/external/libunwind/src/dwarf/Gfind_proc_info-lsb.c b/external/libunwind/src/dwarf/Gfind_proc_info-lsb.c
> +index 77ed3d09..37eadf52 100644
> +--- a/external/libunwind/src/dwarf/Gfind_proc_info-lsb.c
> ++++ b/external/libunwind/src/dwarf/Gfind_proc_info-lsb.c
> +@@ -248,7 +248,8 @@ load_debug_frame (const char *file, char **buf, size_t *bufsize,
> + 
> +   if (*buf == NULL && linkbuf != NULL && memchr (linkbuf, 0, linksize) != NULL)
> +     {
> +-      char *newname, *basedir, *p;
> ++      char *newname, *basedir;
> ++      const char *p;
> +       static const char *debugdir = "/usr/lib/debug";
> +       int ret;
> + 
> diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
> index 74928ed171..3d4e95b496 100644
> --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
> +++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
> @@ -22,6 +22,7 @@ SRC_URI += " \
>      file://debian/external/libunwind/legacy_built-in_sync_functions.patch \
>      file://debian/external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch \
>      file://debian/external/libunwind/libunwind-guard-unreachable-macro-to-avoid-redefinit.patch \
> +    file://debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch \
>      \
>      file://debian/system/core/move-log-file-to-proper-dir.patch \
>      file://debian/system/core/Added-missing-headers.patch \

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9656): https://lists.yoctoproject.org/g/meta-virtualization/message/9656
> Mute This Topic: https://lists.yoctoproject.org/mt/118312414/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


