Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CFAC38142
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 02:00:48 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.8995.1674957642265968626
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 28 Jan 2023 18:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eCIOFPHg;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id j4so419419iog.8
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 28 Jan 2023 18:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5HUCnCAedEMH2au+TY12G/NMpfkIg9ayAE5I+XdBJ/U=;
        b=eCIOFPHgfJKvWjk+BBytdHy7pdPqcnUhSxjTjvkl+Y/wJwEK2orJNKh0rovQO8GxGy
         xVZqj0A4jyC/D0xscZXTeu1mzI6HW1LOicJj/7AGo1+jG6bfnlX4eTLqjyvB0TtyDkeH
         pj57gATuURIQ2fYlpibgDc4UmQpLZD7yJghOD4H1n3piNXIr1ZBOXLsYhXV1giRekuBV
         mSLBuf6FbEJGBtc+eKs0OpFDSxr15lQsh0YbC4yOLOzGKC35KGufbbpX+cDAOt/qaGzX
         IU7y3X1JnmTItw8roLoZkvriIf8AZHQA/NevpHpRE4Virc9ZLYkSuYY8tLnuvPwhu8A4
         92ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5HUCnCAedEMH2au+TY12G/NMpfkIg9ayAE5I+XdBJ/U=;
        b=nwalJ4IEZzGkl6w7q6wTHxI7ild0TH3cojsCCd2B7gTy/hxFiNWRxlxrJR2GfdTfI1
         2v1OKgLVNPNuqj50GS7Yi4mEi9PNggWj8K9+Vg589W6TrIXBMV5SI/FVCUgD84IJRyAE
         fKe0coFdPjWg1mvAvPCLHJ+G1vqEbSL1m5mGfBYyxHfnL31Dyog4AGIm2vsv9f4IkKvF
         xkaJpRr1uAZQU8zOoVHI8BWEzbXFIpMlco1WR0EEe9WqG/Z7l5mSgEnh0jLMD5WLE79t
         K4AHxDt0+hu5uF0vUm8uG2J5IHIda2EkaGIe1j9Ntrvx7bW2X04YTzH7wDQLHXb5eDXK
         Lc2g==
X-Gm-Message-State: AO0yUKUIG1KDHAcoIVZJEGQZ2PUoryeQuv8GqaokW8jIe9Sp92sozUhb
	mcw2GTIQcMbC531Ml4XMT/ljii0tAOAkaFBYQU1fNESx
X-Google-Smtp-Source: AK7set9wSeEbTGRshOFwRGViYd4FSDD1PtVV+wTpyOw+T3RwUVdIpUDqvITD+i5OfH1FiGdjo6U3dEmFp+40rWXaIDw=
X-Received: by 2002:a02:ad06:0:b0:3a9:5776:864 with SMTP id
 s6-20020a02ad06000000b003a957760864mr2210436jan.67.1674957641380; Sat, 28 Jan
 2023 18:00:41 -0800 (PST)
MIME-Version: 1.0
References: <Y9TpEWXqIvE7MVDF@mail.local>
In-Reply-To: <Y9TpEWXqIvE7MVDF@mail.local>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 28 Jan 2023 21:00:30 -0500
Message-ID: <CADkTA4M+G5u6hQFQO_55hpJyOHByvXryZYTnnvhneUVX1DeX2w@mail.gmail.com>
Subject: Re: busybox upgrade is going to break meta-virt
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 29 Jan 2023 02:00:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7837

Thanks for the heads up!

I'll stage the fix on master-next.

Bruce

On Sat, Jan 28, 2023 at 4:21 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi Bruce,
>
> Just a heads up that I have a busybox upgrade in master-next that is
> going to break meta-virt:
>
> ERROR: ParseError at /home/pokybuild/yocto-worker/meta-virt/build/meta-virtualization/recipes-core/busybox/busybox-initrd_1.35.0.bb:3: Could not include required file recipes-core/busybox/busybox_1.35.0.bb
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

