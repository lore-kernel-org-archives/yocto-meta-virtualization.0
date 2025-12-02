Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF84CFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 05:02:27 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.939.1764651739143097733
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 21:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AB7nO6qo;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88244d1559eso58465726d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 01 Dec 2025 21:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764651738; x=1765256538; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x/IBFg6HfWMqA61obl17W80CEHeSgQuZH99w0/dU88s=;
        b=AB7nO6qo7chjKc1/1FDDPcEjZqYGB3p4SBp5VZoHaavJRwSRPD01x0FQuN1H2RgYLO
         HXO7qJw8E3TyT8vfcNx1a1f06dgvg7RjWt0aZV7kq3h8MvTH2Tdcsl41hjyq6u6AQZqB
         a42fR2BpsSLnmbsKFcFGkq8OT/gbzO2xAvYQ3LMndgKwLlAmbPw6GJ0KySRqOn/Eq6lz
         SykJ3iebQqaiRhtnbRawoRzJqgPC5pw8sjesywgJxDMjr6Y4oAnPMsEmn+MTg96EB79G
         uWlYO25XPUB5iCB8h0HNr9RS0pMk9rxwa9W228CrMsQs0elwwt/AfS0MoHcK8xSKrz7f
         JzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764651738; x=1765256538;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x/IBFg6HfWMqA61obl17W80CEHeSgQuZH99w0/dU88s=;
        b=ArSiPYRi10JKWeCV2zkgGgHcYL1qYGT/5ekDEd7j/xo2fGQ64MWnDlr498CqcImLzo
         G3NaeEwNe8IBw8p+8irW5BXoLWCvoV4FmXZKrPyDqVUiHsvkxp8LWgSVuY/5Cc2IDdYz
         MHnhKXIaGAPG4WdccV92QzGpwBFAzJn10Ho/JZ50TJWFpSlmWiVrzMbsraF94lL6uRTv
         zOdn1yBT5CLXl+AW9TjFaLwOxVKMiDuDGEo2d6hGoFRgiJJHgJQC/hhKa5vMpxJCu0+K
         Psw8xiPVSHcbmww3cSncgHlAJsseC8lzcUXuR7OXOeYerg38ZnivZgIZFbQIihx9h+vg
         PQ3Q==
X-Gm-Message-State: AOJu0YzNu4gwKPXvKLEHh9PJEMgdiIMPx8fhlhJkMjz3BZB/x8jYm53T
	ukQjxhVQvc9jAf0B+sb5Lb/M6yMmDDYumJNYpmXQhrdwsNdS49EFsrB6
X-Gm-Gg: ASbGncsMtfTImj2pNhQMYYOxIcS9Uxxs2Kh0BGiQJMvV7aSrmy/0WNdllecVBYvC3C1
	0NLsEcRzaVuoVl2rEuwswqdaQEzrU2SLu9Sa3cZbzLQmqj4lMjCW00shqcUoznPoQQjHVikhXVc
	lcU5sKNZbySk2a2Q35r7TrAZWWY7Dt29TGl7KdFTc1oEz841FWN5vra6qOwPD9G2nQkOJyPlD6V
	CfcpLvH6aFNtGY6NIxet5vtYL7ufhbdgIQDx/M6NSBZmmLej0RhUKLQyPq+1zT+c3ANmPN/Rrpd
	Vguc3pf1gdvemA3s5iphhUZl72YyLNIbYxR5rdVMMixJJrw64DQayFAoEeeqKVKhn6tC05sPldO
	5hy+a6K2XEtBRMvM7FQCy9Luv1fSg6xqGop17ORSm0Ovt5Mw1QO6jxLsiv/3ERIFJyUMpVGYcTG
	fa9i01UfUJn00QeNZuqOCo950g36ZM64DzIzMPrlHIZW2qwmRn44vCr6BsibapRJIK4/2E3DWu6
	Nw=
X-Google-Smtp-Source: AGHT+IE4tg2q8akVWUpKyLCX07OrWnArkWhZnEpkN4i0ef2LFpZQ/7aNd0y/LBJ2sfuJMD5TFAn4pQ==
X-Received: by 2002:a05:6214:404:b0:78e:f6cd:4704 with SMTP id 6a1803df08f44-8880db02051mr20956706d6.5.1764651738058;
        Mon, 01 Dec 2025 21:02:18 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88652b681c8sm96133396d6.40.2025.12.01.21.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 21:02:17 -0800 (PST)
Date: Tue, 2 Dec 2025 00:02:15 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: jaeyoon.jung@lge.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] kvmtool: Backport patch for musl
 compatibility
Message-ID: <aS5y19vS0WlE7JvS@gmail.com>
References: <20251126085038.3883249-1-jaeyoon.jung@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251126085038.3883249-1-jaeyoon.jung@lge.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Dec 2025 05:02:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9472

I see that you figured out the branch name needs to be in the
subject  in [] to make things mergeable.

I tweaked the commit message as well, since there's no sense
reference release names in the commit messages.

Same for the scarthgap patch.

Bruce

In message: [meta-virtualization] [PATCH] kvmtool: Backport patch for musl compatibility
on 26/11/2025 Jaeyoon Jung (LGE) via lists.yoctoproject.org wrote:

> From: Jaeyoon Jung <jaeyoon.jung@lge.com>
> 
> The fix is needed for SRCREV used in Styhead and older.
> 
> Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
> ---
>  ...e.h-inclusion-for-musl-compatibility.patch | 51 +++++++++++++++++++
>  recipes-extended/kvmtool/kvmtool_git.bb       |  1 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 recipes-extended/kvmtool/files/0004-remove-wordsize.h-inclusion-for-musl-compatibility.patch
> 
> diff --git a/recipes-extended/kvmtool/files/0004-remove-wordsize.h-inclusion-for-musl-compatibility.patch b/recipes-extended/kvmtool/files/0004-remove-wordsize.h-inclusion-for-musl-compatibility.patch
> new file mode 100644
> index 00000000..1fdbca72
> --- /dev/null
> +++ b/recipes-extended/kvmtool/files/0004-remove-wordsize.h-inclusion-for-musl-compatibility.patch
> @@ -0,0 +1,51 @@
> +From 0592f8f829c843ff5cb2d108c309e32f4f6f5379 Mon Sep 17 00:00:00 2001
> +From: Andre Przywara <andre.przywara@arm.com>
> +Date: Thu, 1 Aug 2024 12:10:54 +0100
> +Subject: [PATCH] remove wordsize.h inclusion (for musl compatibility)
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The wordsize.h header file and the __WORDSIZE definition do not seem
> +to be universal, the musl libc for instance has the definition in a
> +different header file. This breaks compilation of kvmtool against musl.
> +
> +The two leading underscores suggest a compiler-internal symbol anyway, so
> +let's just remove that particular macro usage entirely, and replace it
> +with the number we really want: the size of a "long" type.
> +
> +Reported-by: J. Neusch�fer <j.neuschaefer@gmx.net>
> +Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> +Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>
> +Link: https://lore.kernel.org/r/20240801111054.818765-1-andre.przywara@arm.com
> +Signed-off-by: Will Deacon <will@kernel.org>
> +Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/commit/?id=0592f8f829c843ff5cb2d108c309e32f4f6f5379]
> +---
> + include/linux/bitops.h | 6 ++----
> + 1 file changed, 2 insertions(+), 4 deletions(-)
> +
> +diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> +index ae33922..ee8fd56 100644
> +--- a/include/linux/bitops.h
> ++++ b/include/linux/bitops.h
> +@@ -1,15 +1,13 @@
> + #ifndef _KVM_LINUX_BITOPS_H_
> + #define _KVM_LINUX_BITOPS_H_
> + 
> +-#include <bits/wordsize.h>
> +-
> + #include <linux/kernel.h>
> + #include <linux/compiler.h>
> + #include <asm/hweight.h>
> + 
> +-#define BITS_PER_LONG __WORDSIZE
> + #define BITS_PER_BYTE           8
> +-#define BITS_TO_LONGS(nr)       DIV_ROUND_UP(nr, BITS_PER_BYTE * sizeof(long))
> ++#define BITS_PER_LONG           (BITS_PER_BYTE * sizeof(long))
> ++#define BITS_TO_LONGS(nr)       DIV_ROUND_UP(nr, BITS_PER_LONG)
> + 
> + #define BIT_WORD(nr)		((nr) / BITS_PER_LONG)
> + 
> +-- 
> +2.47.2
> +
> diff --git a/recipes-extended/kvmtool/kvmtool_git.bb b/recipes-extended/kvmtool/kvmtool_git.bb
> index 141fb02d..a171129f 100644
> --- a/recipes-extended/kvmtool/kvmtool_git.bb
> +++ b/recipes-extended/kvmtool/kvmtool_git.bb
> @@ -14,6 +14,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git;branch
>             file://0001-kvmtool-9p-fixed-compilation-error.patch \
>             file://0002-kvmtool-add-EXTRA_CFLAGS-variable.patch \
>             file://0003-kvmtool-Werror-disabled.patch \
> +           file://0004-remove-wordsize.h-inclusion-for-musl-compatibility.patch \
>             "
>  
>  SRCREV = "4d2c017f41533b0e51e00f689050c26190a15318"
> -- 
> 2.47.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9459): https://lists.yoctoproject.org/g/meta-virtualization/message/9459
> Mute This Topic: https://lists.yoctoproject.org/mt/116482849/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


