Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D863C43219
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 15:36:37 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web12.8370.1653492996523079851
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 May 2022 08:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Kddj3Bg+;
 spf=pass (domain: gmail.com, ip: 209.85.219.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id i11so36898199ybq.9
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 May 2022 08:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bl0oN/vmGjwW+I/OcZKO50CWSi1+8UeN+O0f9k0kvXI=;
        b=Kddj3Bg+AdC/mvUWenFAC1M6Q8U1nt4eeF7x8RJ3WT4NK2M501l9TcKlkXU34q1RHa
         yihA3RfVV5k72xh4nWuSI4XGO5DiEX5t/YQHLGQnahTjU54EmlLid84BN1CHAE18bktO
         BoaHHW5IYkf30E7epdA33I6FHglG8/u9g7c8iZpzGGCXYwylFBkO6GJ3IY+sff+Cyg8y
         LXTCqLYIGiMQr2gwOYdzeZ9M5FHJKYoh3f2RYPQekC15UpNMStih3m2YWBO0ZnJlUdnO
         dDoGcWMdhbz3up72OLxjFi8FOA/bkQ6mp+phg6Vi19lqAK/dpCTT3WpoqtPxTBdby1uz
         2BeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bl0oN/vmGjwW+I/OcZKO50CWSi1+8UeN+O0f9k0kvXI=;
        b=pcYqQc4KsJ/WXsRm/LIJMsiqriH5PJ8TZJnDC0zRrkf+I63cOjQPAy9LkYu17RGpVs
         tDlI79ZxEUf7nACOvsyezCk3abh238jBWFBVirkSV98RMUBm7M2M8zpkmz696NkXMnKF
         VwfV9+oQWc2nxR0++CVWvKj25aLgI1F8aBTuAAxB2xoBFW936ISe8gniBoC5VLyVBr58
         CJRS7ik7+k6BID/l84geqww3bIrBlXtDNsQQkdnyAhrOKxlHjSgvOZs+1b/3JwHOYOy4
         3YVyJfX6EHvGHGrdkxiIYVItMt21cg2kblhVNgbplAFZ1wId/gQVdW4MGZQB2bAE5k+U
         2+6w==
X-Gm-Message-State: AOAM530li5vWhuIWnJkdLCyZWY1GBP9ZlBVWKQGAcVDmqzdmjGlZCOTB
	r3H7gN1z0z0CbHGcSF9ZknNjG3I8Rod4J5W+lAU=
X-Google-Smtp-Source: 
 ABdhPJyiasd0aBE+bot2buZcQrjolutET1UWDMOMrhBDzgzRpi3sasfrFIyXhz8DHw/Br1t/spt3lfgVsniV6L2MgK0=
X-Received: by 2002:a05:6902:114c:b0:641:87a7:da90 with SMTP id
 p12-20020a056902114c00b0064187a7da90mr33258591ybu.561.1653492995547; Wed, 25
 May 2022 08:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220521190447.135705-1-christopher.w.clark@gmail.com>
In-Reply-To: <20220521190447.135705-1-christopher.w.clark@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 25 May 2022 11:36:24 -0400
Message-ID: 
 <CADkTA4Pv6Qz7i6+AtHaGUuq6yPOkkgCM9Hb8eqXW_U6kh3nCFA@mail.gmail.com>
Subject: Re:
 [meta-virtualization][gatesgarth,hardknott,honister,kirkstone,master][PATCH
 0/11] Xen on Raspberry Pi 4 fixes
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Doug Goldstein <cardoe@gentoo.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 25 May 2022 15:36:37 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7319

On Sat, May 21, 2022 at 3:04 PM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> A series of fixes applied to master and across stable branches where
> needed to fix running Xen on the Raspberry Pi 4 board.
>
> This updates Linux kernel configuration for Xen to remove tracking from
> the linux-yocto-dev kernel, either by applying a fixed revision and
> specification of a stable branch or replacing it with the linux-yocto
> kernel. The Xen build configuration is updated to remove the hypervisor
> defconfig for the Raspberry Pi and drop the arm64 prelink patch as a
> license correction and since the build no longer needs it with the newer
> gcc toolchain.

I appreciate the patches for all the branches, it gives more
confidence in how thorough things look!

I will avoid the EOL branches, but if someone really wants them, they
are on the list and I wouldn't fight too hard about not applying them.

Just so I'm clear, there aren't actually 11 patches, just some of the
patches repeated across the various branches .. totalling 11. If that
is wrong, please do follow up to the branches with more patches, as I
definitely didn't get 11.

Bruce

>
> Tested on hardware.
>
> Christopher Clark
>
> gatesgarth:
>   01: linux-yocto-dev, raspberrypi: apply fixed revision to kernel
>   02: xen: drop patch to workaround prelink on aarch64
>   03: xen: fix boot on the Raspberry Pi 4
>
> hardknott:
>   04: linux-yocto-dev, raspberrypi: apply fixed revision to kernel
>   05: xen: drop patch to workaround prelink on aarch64
>   06: xen: fix boot on the Raspberry Pi 4
>
> honister:
>   07: linux-yocto-dev, xen, raspberrypi: remove tracking bbappend
>   08: xen: drop patch to workaround prelink on aarch64
>   09: xen: fix boot on the Raspberry Pi 4 with Xen 4.14
>
> kirkstone:
>   10: xen, raspberry pi: replace linux-yocto-dev with linux-yocto 5.15
>
> master:
>   11: xen, raspberry pi: replace linux-yocto-dev with linux-yocto 5.15



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

