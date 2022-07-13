Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43ABCC433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 19:29:24 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web10.1417.1657740560937455025
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Jul 2022 12:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qaGuhdvC;
 spf=pass (domain: gmail.com, ip: 209.85.217.43,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id q26so9246253vsp.11
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Jul 2022 12:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cARoYrio1Skp0Dkj2Yr6Jp67oRFhJQ4FWK7AKgjx71Q=;
        b=qaGuhdvC85T0lfe9J0uJIjBIv6lurNbWdykV0gKPtNMW5McNgf5JX2K0PTr0fLH6af
         H6nkGJasQ63cTwtllgwc5uRbCb0VJ4+UsvE9SXMeMU1xDpwxtClJGJcXJsMp6kW6ee/V
         uu/PNsxmSj6MyOgfau74hF2hVd/dIQzxAdvX8udEvOLYWfIVkOICzA5xX5ouiNz4BgNT
         NMiwLAUSTD6hZtofE3RkIgppXm0xGerU0fQlxTk7P5yxT/pYiBK0pp7UMKdrwhQKPeH9
         DUhArLgXVH9csP4DuOBuY/I4c/8szXnL/hBAt1R83R4M/g53FIjvqA8f+vsSLm1dzsMD
         Kd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cARoYrio1Skp0Dkj2Yr6Jp67oRFhJQ4FWK7AKgjx71Q=;
        b=1l64BEMNNbvbQeUiIBnLE09vAYqLU/zig37pl3AnTaYgf6i4EdVkmacbXTnjyoz+xM
         Zcuz75qaUQ41CfTxwbK8xYfSIY1e8+PTB8RQRynvXfG6N0bqKSFQcCHINv3BD50GbN8T
         adv/TwyvaS0zHz8DsKAeonps7ptLblwGOrjgT2UghLIMmgKXOSfZrQcBIXY+omjGX1xz
         rD7iMXdhKLs91o/FvEwWDP8szaG2YKs2oTb9SQ7nd29wZ1LGc/SckuZ4KwU1cXaJJd2q
         lnJpikawyAPW7YPzkI/VynbhsesWszu3qvz7+T0ymfWYSUWSvEtd73hjeTf7D3Yky2Ub
         bDkw==
X-Gm-Message-State: AJIora/AkjnZtBJhhfgCd8XxtlSiBRikeacNCBBJufP8lk4ElTex9uyE
	rXEbcps7UURlesoS8ssF26a7+xY6BdKvK90XPEQ=
X-Google-Smtp-Source: 
 AGRyM1tRgiscN34oVWMYBQPgpnqHwaX0sHyNMU+8izUA3ngePtynhpB8/q/34TOTkA0N60f8ORMjK9AOI2lLKVvwdkA=
X-Received: by 2002:a67:1a86:0:b0:356:ef19:c851 with SMTP id
 a128-20020a671a86000000b00356ef19c851mr2255863vsa.84.1657740560036; Wed, 13
 Jul 2022 12:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220713110240.1294624-1-ross.burton@arm.com>
In-Reply-To: <20220713110240.1294624-1-ross.burton@arm.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 13 Jul 2022 12:29:09 -0700
Message-ID: 
 <CACMJ4GaPEB3qvRTb+ys7bEMUTfCO_30hN7HeOa=rtzYx4MZQnQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] xen: remove obsolete sdl
 PACKAGECONFIG
To: Ross Burton <ross.burton@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
 Doug Goldstein <cardoe@cardoe.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Jul 2022 19:29:24 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7458

On Wed, Jul 13, 2022 at 4:02 AM Ross Burton <ross.burton@arm.com> wrote:
>
> Nothing in Xen respects --enable-sdl, and nothing in Xen links to libSDL,
> so this PACKAGECONFIG is obsolete.
>
> It looks like the last user of SDL in Xen was removed in "Remove
> internal tools/ioemu tree"[1] back in 2008.
>
> [1] xen 19dc3860dcfde9bc4ec4ef35bb1337e13276f630
>

I was surprised by this but think it is correct.
There are also no SDL header file inclusions in the Xen tools source,
and the xen and xen-tools recipes build successfully with this patch
applied.

> Signed-off-by: Ross Burton <ross.burton@arm.com>

Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>

Christopher


> ---
>  recipes-extended/xen/xen.inc | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 2bbf1e3..5937763 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -7,12 +7,10 @@ inherit autotools-brokensep pkgconfig
>  require xen-arch.inc
>
>  PACKAGECONFIG ??= " \
> -    sdl \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
>      "
>
>  PACKAGECONFIG[lzo] = ",,lzo"
> -PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
>  PACKAGECONFIG[xsm] = "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
>  PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd,"
>  PACKAGECONFIG[externalblktap] = ",,,"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7453): https://lists.yoctoproject.org/g/meta-virtualization/message/7453
> Mute This Topic: https://lists.yoctoproject.org/mt/92354872/3619036
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [christopher.w.clark+meta-virt@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

