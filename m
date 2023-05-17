Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94964C77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 15:52:00 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.54019.1684338714656143252
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 May 2023 08:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=QixRmR44;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-62384e391e3so3820006d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 17 May 2023 08:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684338713; x=1686930713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WLPwDmVOp/8jSDWN8WuxhOgCpjfTiOp0YkOxUMLlVr8=;
        b=QixRmR44W1iAyDC6Q6shRlSDQxJPl8PAz58nxUqRYrTe6vX9lTwyTUKVH6ZK1kiBMK
         IfuYPOs1v+WwWVcPGQ+WRTtxp4tPekpYvFdlPO7hhf2GFgCp13CtX8AzDYYf6LF+7RAm
         PAjOJHnkpbyi9M6tdostQFJ2eApfdEqcxJUXnItEzf5WBRUp7eCE1HioRhssds/ZTvFm
         XpiFjGqbbPNUOcMGnWf23CdhMx9qEI2AKAdep+o4fl/jcCnAY8rQNUvwlbIFAfkcMg5L
         7Pq7/5bNVlOA8NSOJvcWqcgh+pa20ygFYZ8XQiMkZKlxE7hgHM5u/nHwVkzXDVCfLNeK
         maPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684338713; x=1686930713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLPwDmVOp/8jSDWN8WuxhOgCpjfTiOp0YkOxUMLlVr8=;
        b=iAg5fr7yVZjBjzVmWgBPIDBTH2zf/alEizur5I+AN8gPwXAVbi9eHOJukG2sLpBQhZ
         JeeK2hVvIAPAjPwSKeq7a7korLdOLFyzh9kulx47nUu3o2Ox8/Mu/fmO/mg2R3NuhEVE
         YmX/iKSjlk4J5whl/P6dtu88jbBYBAxP0m8V2d++tiuRLa/VdRYUK0vVTPoD4nZ+8Cf1
         AzW1xk8G9TzkPX0NBMkOHOEAj9lNFgPBAuXxsQeFlZcrOiHVuc0I2TgNQI6BnXRgeN6R
         2xAfAg/POLQVthZpwUta7GcPYKBCAAIZq5UAsopHEnuFfY9NjwnSCM36eEuChaIkduOM
         Tjkg==
X-Gm-Message-State: AC+VfDyAHoFxqZjJ/3XXd1M5HqyAnGcReycmVt2SZlfsAKwfkB7zewYX
	yQew4K6aBgYHDuoGivRQoaU=
X-Google-Smtp-Source: ACHHUZ7U020jJQNGF9cZ0aCFQ12KatM76pwB3yB3e4z1nQd0yDAEKmuv3YCsa09ULB0c0BvGH+5flw==
X-Received: by 2002:a05:6214:2349:b0:5e8:3496:e641 with SMTP id hu9-20020a056214234900b005e83496e641mr174346qvb.13.1684338713469;
        Wed, 17 May 2023 08:51:53 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id h3-20020a05620a10a300b007579ded7a8asm699409qkk.54.2023.05.17.08.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 08:51:53 -0700 (PDT)
Date: Wed, 17 May 2023 11:51:51 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: Re: [meta-virtualization][PATCH 1/5] busybox-initrd: auto pv from
 busybox
Message-ID: <ZGT4F9wplbSlOV6g@gmail.com>
References: <20230515152624.138713-1-adrian.freihofer@siemens.com>
 <20230515152624.138713-2-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515152624.138713-2-adrian.freihofer@siemens.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 May 2023 15:52:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8062

In message: [meta-virtualization][PATCH 1/5] busybox-initrd: auto pv from busybox
on 15/05/2023 Adrian Freihofer wrote:

> Not hardcoding the version of busybox from the core layer in this layer
> is a small improvement for maintenance.
> 
> But the main motivation is to support the following layer combination
> without getting a parse error from bitbake:
> - poky LTS, branch = kirkstone
> - meta-lts-mixins, branch = kirkstone/go
> - meta-lts-mixins, branch = kirkstone/rust
> - meta-virtualization, branch = master

While there's no "official" support for combinations like that, the
patch passed my local testing, so I see no reason to break combinations
like you've listed at the parse step.

The old parse issue was sort of "on purpose" as it was a signal that
busybox had changed, and the rename triggered a re-validation of the
functionality. With the automatic PV update, that won't happen, so there
is a chance of runtime issues creeping it.

If runtime issues do start appearing, I can always enahance this to
take a list of supported / tested busybox versions and have the function
check against those known versions before continuing.

This is now merged to master.

I'm doing more runtime and framework testing on other package updates
now.

Bruce

> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  ...{busybox-initrd_1.36.0.bb => busybox-initrd.bb} | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  rename recipes-core/busybox/{busybox-initrd_1.36.0.bb => busybox-initrd.bb} (59%)
> 
> diff --git a/recipes-core/busybox/busybox-initrd_1.36.0.bb b/recipes-core/busybox/busybox-initrd.bb
> similarity index 59%
> rename from recipes-core/busybox/busybox-initrd_1.36.0.bb
> rename to recipes-core/busybox/busybox-initrd.bb
> index 6108e9a..513ed13 100644
> --- a/recipes-core/busybox/busybox-initrd_1.36.0.bb
> +++ b/recipes-core/busybox/busybox-initrd.bb
> @@ -1,5 +1,19 @@
>  FILESEXTRAPATHS:prepend := "${THISDIR}/busybox-initrd:${COREBASE}/meta/recipes-core/busybox/busybox:${COREBASE}/meta/recipes-core/busybox/files:"
>  
> +def get_busybox_pv(d):
> +    import re
> +    corebase = d.getVar('COREBASE')
> +    bb_dir = os.path.join(corebase, 'meta', 'recipes-core', 'busybox')
> +    if os.path.isdir(bb_dir):
> +        re_bb_name = re.compile(r"busybox_([0-9.]*)\.bb")
> +        for bb_file in os.listdir(bb_dir):
> +            result = re_bb_name.match(bb_file)
> +            if result:
> +                return result.group(1)
> +    bb.fatal("Cannot find busybox recipe in %s" % bb_dir)
> +
> +PV := "${@get_busybox_pv(d)}"
> +
>  require recipes-core/busybox/busybox_${PV}.bb
>  
>  SRC_URI += "file://init.cfg \
> -- 
> 2.40.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8052): https://lists.yoctoproject.org/g/meta-virtualization/message/8052
> Mute This Topic: https://lists.yoctoproject.org/mt/98905946/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


