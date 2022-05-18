Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1859C433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 00:06:44 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web08.319.1652832404080940323
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 May 2022 17:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hj3ncjF9;
 spf=pass (domain: gmail.com, ip: 209.85.221.174,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id 125so372082vkw.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 May 2022 17:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+NSfPFAnqSsaEicRLQpyH9TGHPN8ktcOTrK2ASDHs8E=;
        b=Hj3ncjF9s2WQBmvAR7V42huRxv+lk6c9JzJcGHu1CeZqWVXyiouxb9O6Kr8U1nM0wP
         CLHxvjEzcKvzShCr72WC1ndJJrWJc5FSPPHuPjc1AJfjIcbqhV+e+nxnqmGToReMP+6y
         UIcGeizmOv74Rum5YkFXCD8yGkmVFukUJcyu7pccsNrGwSWkzO3x85phGamy9q+0h+RV
         xtiEtELEbltgKGANMGouZAv4hKurd3KYoihHaOwafpcX/D5U39gsf6D0wAvuKvgwtX45
         PIgtYtkuh7TOCfgsa18M5jCAoZugTqYuBLabCBwjip9KpGTIrqzn6MXir+pEq6UHi90B
         1QyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+NSfPFAnqSsaEicRLQpyH9TGHPN8ktcOTrK2ASDHs8E=;
        b=5juCqAtNBmvPO9S1yrOkwP5MdvXPXj1WRO5DbRhg3H7WJwtMXRMPr9VJy6nknz8Bv7
         DcaVBI48lpHiL3AdDFQRbdBQ0mVdk/ybz4tjdhAgFMfhvQJeTWHcb2MFqaZOOiYmwCjQ
         o9CqGFdH5Ae7lbfIov0+qq5tWKAnht+5oxvwJuouOfjgjl/tfkfFZxUFfdIcaSHk3BcJ
         b34cQW+PoNMZ3Fl+j7GaAzY6wt1tlJrGbxohbRLT79cI/cI1t4wvoNQzhOCxmTGhReD8
         M+5hKkSJtBRr8UKO/sKsMcuZCeQe4G3nz14LH+D+nl+XNSbRH4e+5U9yVscIEJWX3++3
         V+aw==
X-Gm-Message-State: AOAM531r1Tycyf/385De9rFpJVt9ZZoTY3uiZI98eqzwzJCFEPQ7T8qz
	Lq08SrECrxposkfsjB0Q685PSA1BKfjkRUYqpZc=
X-Google-Smtp-Source: 
 ABdhPJycxReA3MAxP7Klo+kEPe09p04tKVwIV/kYhJ0iFrP0LfWo8VxGAf4JuBsBxXR4yHiv/nJVRGZFsGKXcK+6yhU=
X-Received: by 2002:a05:6122:881:b0:34e:4e28:39ba with SMTP id
 1-20020a056122088100b0034e4e2839bamr2007268vkf.1.1652832403066; Tue, 17 May
 2022 17:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652196703.git.bertrand.marquis@arm.com>
 <cba614bcf3d974cb7e8c711f66e25d3c0b229776.1652196703.git.bertrand.marquis@arm.com>
In-Reply-To: 
 <cba614bcf3d974cb7e8c711f66e25d3c0b229776.1652196703.git.bertrand.marquis@arm.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 17 May 2022 17:06:32 -0700
Message-ID: 
 <CACMJ4GZikQQLNbdSv2Mw8HaMtO-4TPuR_ZL+GsL+2=WMOsHrzQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH v2 1/4] xen: Fix class inherit in
 xen-image
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 18 May 2022 00:06:44 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7283

On Tue, May 10, 2022 at 8:35 AM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Remove inherit of qemuboot classes when not build for qemu in
> xen-image-minimal.
> When reverted the handling for only adding inherited classes for qemu
> was kept but the line always inheriting them was kept to.
> This patch is fixing that so that qemuboot classes are now only added
> when the image is built for qemu.
>
> This fixes commit 27e5ade0abc2660226389b8b62ef07d85f4b8758
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>

thanks,

Christopher

> ---
>  recipes-extended/images/xen-image-minimal.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
> index 7f10b1d..9fd05d2 100644
> --- a/recipes-extended/images/xen-image-minimal.bb
> +++ b/recipes-extended/images/xen-image-minimal.bb
> @@ -36,7 +36,7 @@ LICENSE = "MIT"
>
>  QB_NETWORK_XEN_BRIDGE = "1"
>
> -inherit core-image qemuboot-xen-defaults qemuboot-xen-dtb qemuboot-testimage-network
> +inherit core-image
>  # Only inherit the qemuboot classes when building for a qemu machine
>  QB_QEMU_CLASSES = ""
>  QB_QEMU_CLASSES:qemuall = "qemuboot-xen-defaults qemuboot-xen-dtb qemuboot-testimage-network"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7271): https://lists.yoctoproject.org/g/meta-virtualization/message/7271
> Mute This Topic: https://lists.yoctoproject.org/mt/91015798/3619036
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [christopher.w.clark+meta-virt@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

