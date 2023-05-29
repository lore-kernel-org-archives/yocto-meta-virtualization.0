Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57192C77B7A
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 13:49:04 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.49813.1685368141881170603
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 May 2023 06:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KRxMvgtm;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-3f767eec104so30262211cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 29 May 2023 06:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685368141; x=1687960141;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2eQXtJaTCoWYLDqvvX45OvUkosKpDFCmUKmzXDBQup4=;
        b=KRxMvgtmauKYevjH4o/La7VKrthHeCqs1tE1MoiLltcXNRogDA3z2P+O+jm5G5xlQW
         OR455b1l8eLW3I9DAYgv6SbYGVIZuNPwmWcPcn9Dda8NIV5CSYYnOPHKTBsMQgCZ5NSi
         rC65z0izuRtBv9+dUZHLW6MH8UAaHI6KgWKObW/5xu4oT/ba9wu5Bro30Swl3LZgXJVU
         hgCTA2HpJahJsi+I563mZ8Jy9AtqFPmgdv5nDFW5iymp53TfefDAqlU8/mOglNXoftkI
         o6aGXFfuM5uoYf3QGXHKtrQYD0fChNSdHBSs3+hOnquCIeLjdILLCQ9s7MzywD3G07/B
         BdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685368141; x=1687960141;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2eQXtJaTCoWYLDqvvX45OvUkosKpDFCmUKmzXDBQup4=;
        b=TxV0K6NKuLif8et81PIwZKplmf6tnfDvod6k6K9NPeiEu+HGJel/IWzIPx5P33bNkf
         DkbYtRHHKfTPRAOAFunShfC5u43SKRIT9QXy75nB1OhUuTu8uSTZeAfV/jFrvMqGTD/2
         A8EyLWDkQrGhUl9t01qUTl7iF2o4MdplTO87Qokje0CvGImOazVkynxurvQMMPaHeZ58
         k4UegGyn85SpALozAUEABvzrWmQ8Uv0XW2wpCxlcGSRv2uTegESXWKDonFah7V61F8do
         pyusLP27T12jNglzu4ACZ7BgyhiMazJf10lHr3em8GOkF4Wj5UDs/EFrqy+bjAH1ZFuG
         vMWw==
X-Gm-Message-State: AC+VfDwduEXroAoQWxHdJScqUu4ErnGoOtV65UqD8DjKhU0TI78qH6BD
	7OYRm4keW7QjEzcs1iK9WOiHurJlLCyo7g==
X-Google-Smtp-Source: ACHHUZ7gII46rWtgRVN1aukQtfI7u5pfxFrPmrrGeFTTMEe7GufGGd32jjafdTqhVCX54wxLcI2GBw==
X-Received: by 2002:a05:6214:e49:b0:5ef:5144:9d2f with SMTP id o9-20020a0562140e4900b005ef51449d2fmr10658744qvc.20.1685368140846;
        Mon, 29 May 2023 06:49:00 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id de4-20020ad45844000000b006260adb2e32sm2852769qvb.85.2023.05.29.06.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 06:49:00 -0700 (PDT)
Date: Mon, 29 May 2023 09:48:58 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, Bertrand.Marquis@arm.com
Subject: Re: [meta-virtualization][PATCH 2/3] xen, xen-tools: Update 4.17
 revision for gcc 13 compatibility
Message-ID: <ZHStSsMUeNi+SUVT@gmail.com>
References: <20230527204753.1385743-1-christopher.w.clark@gmail.com>
 <17631B1A1D77A842.14832@lists.yoctoproject.org>
 <CACMJ4GZSFDc9xrW9P1BuQ5JmeppFaKVh+Wkf_RD-7aFf22oWjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACMJ4GZSFDc9xrW9P1BuQ5JmeppFaKVh+Wkf_RD-7aFf22oWjg@mail.gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 29 May 2023 13:49:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8087

In message: Re: [meta-virtualization][PATCH 2/3] xen, xen-tools: Update 4.17 revision for gcc 13 compatibility
on 27/05/2023 Christopher Clark wrote:

> On Sat, May 27, 2023 at 1:48 PM Christopher Clark via lists.yoctoproject.org
> <christopher.w.clark=gmail.com@lists.yoctoproject.org> wrote:
> 
>     Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>     ---
>     Compile tested for qemux86-64 and raspberrypi4-64;
>     posted to fix the build with the new gcc.
> 
> 
> Hmm, might be something that will need looking at with this series as a first
> test with runqemu hasn't booted either the xen-image-minimal or xtf-image
> successfully for qemux86-64 target.

I'm ok with doing this in stages. Better to have it building with gcc-13

I've merged this to master, runtime issues can be fixed later.

Bruce

> 
> Christopher
>  
> 
> 
>      recipes-extended/xen/xen-tools_4.17.bb | 4 ++--
>      recipes-extended/xen/xen_4.17.bb       | 4 ++--
>      2 files changed, 4 insertions(+), 4 deletions(-)
> 
>     diff --git a/recipes-extended/xen/xen-tools_4.17.bb b/recipes-extended/xen/
>     xen-tools_4.17.bb
>     index 8d9effa..b58d759 100644
>     --- a/recipes-extended/xen/xen-tools_4.17.bb
>     +++ b/recipes-extended/xen/xen-tools_4.17.bb
>     @@ -1,5 +1,5 @@
>     -# xen 4.17.0 release sha
>     -SRCREV ?= "e4a5fb9227889bec99ab212b839680f4d5b51e60"
>     +# stable-4.17 status on 5/26/2023
>     +SRCREV ?= "47eb94123035a2987dd1e328e9adec6db36e7fb3"
> 
>      XEN_REL ?= "4.17"
>      XEN_BRANCH ?= "stable-${XEN_REL}"
>     diff --git a/recipes-extended/xen/xen_4.17.bb b/recipes-extended/xen/
>     xen_4.17.bb
>     index fca9979..9da1b19 100644
>     --- a/recipes-extended/xen/xen_4.17.bb
>     +++ b/recipes-extended/xen/xen_4.17.bb
>     @@ -1,5 +1,5 @@
>     -# xen 4.17.0 release sha
>     -SRCREV ?= "e4a5fb9227889bec99ab212b839680f4d5b51e60"
>     +# stable-4.17 status on 5/26/2023
>     +SRCREV ?= "47eb94123035a2987dd1e328e9adec6db36e7fb3"
> 
>      XEN_REL ?= "4.17"
>      XEN_BRANCH ?= "stable-${XEN_REL}"
>     --
>     2.25.1
> 
> 
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#8081): https://lists.yoctoproject.org/g/
>     meta-virtualization/message/8081
>     Mute This Topic: https://lists.yoctoproject.org/mt/99173447/3619037
>     Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>     Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
>     christopher.w.clark@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

