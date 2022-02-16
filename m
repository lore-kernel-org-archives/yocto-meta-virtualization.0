Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6BD5C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 02:37:13 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.7231.1644979033319919179
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 15 Feb 2022 18:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I10UDgdA;
 spf=pass (domain: gmail.com, ip: 209.85.166.43,
 mailfrom: alistair23@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id r8so719428ioc.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 15 Feb 2022 18:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wXVE/4taEnPBY+Qn9q+k2lMkiVtRgd/MbV+wefr08xA=;
        b=I10UDgdAspNux7v7NPcSYJF6mjmR8sA8xWFp5s2TqG6W6EegdazM9C5SrUvNFebQam
         4AhdJRII8cySKer588BLng3nj0f9Jla/r7kmJi6df3okOocbfRveLm95yw5IO9rmMihW
         Fx6AXAJEvjJjEfqoPQKg9XbIApAb2wOns4tSRLuDcNTIo2h/0Pn2Z9KlpyLFu48jXdLz
         nAZVMXRrQCtAWhCNJFxHdcG+0RM0DPv3q5d2591uToShvTjTx44PEAGJgVAI6FIo79xZ
         JnnrRvZ7qNMjhWbkLDUbCpmOBpdc5iVnzNgphKHZ4SAvyCXUpuAxZb4714NOSba0AnRG
         NyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wXVE/4taEnPBY+Qn9q+k2lMkiVtRgd/MbV+wefr08xA=;
        b=jlC4GpN+cT5kF874t0xrHo7ajelySXczGeMf7IilvTzuy9crcqf46rcj/dG1LD70DB
         DPU1Pn8YaKflG3Yw3ziJ7kjnCOSS9Z/omR7lUJk1yhOwgPpZP1Gmkf2++orDoPJrlDVu
         t5z5+6Eei4vy5wVc+HEK2AusfNPU7r2mdp0u2IEC8n1zKiwv7Qg864k1J25Cp1JYCX+L
         h6ofAWrZMph1M6lG3bB4oyQ7Kw1VmWDmXdcmcNVK0u3fgntxPqdrS/EftbcXgMB7Cwsn
         JksnrsDxC91lGW7rXPUvRY0An2Cb5R3Ym/ug3jPcKnIVItKnombqtFLlcUjbnKOfeSdR
         eTew==
X-Gm-Message-State: AOAM532YJUKWkOBjfEJEEFQl+ksATo9CvXk8ZkKKbTQRycJjgzhZ0Imm
	jL4j2DNW5h+jfeszasVMasBL2xV+TE7f/Wz/riYTkutuKN/MFA==
X-Google-Smtp-Source: 
 ABdhPJx0ID1u90L/7caFqp15me83cV1o+1Tw9Scy2R7Rjlt1AiktucATEbRSQ7ENuXd6jipCZiaVwwrAhLRX0PzLRBY=
X-Received: by 2002:a5d:9ad8:0:b0:609:2101:d516 with SMTP id
 x24-20020a5d9ad8000000b006092101d516mr491267ion.91.1644979032595; Tue, 15 Feb
 2022 18:37:12 -0800 (PST)
MIME-Version: 1.0
References: <20220215143123.56913-1-kasper@krinvent.dk>
In-Reply-To: <20220215143123.56913-1-kasper@krinvent.dk>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 16 Feb 2022 12:36:46 +1000
Message-ID: 
 <CAKmqyKOe3JLzg7CO5YX6P0+CtmuX5qdvMMS357xLHCV5x9cVrw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] xvisor: Remove bb.error when
 builing for non-supported arch
To: Kasper <kasper@krinvent.dk>
Cc: meta-virtualization@lists.yoctoproject.org, mail@krevsbech.dk,
	Kasper Revsbech <kasper.revsbech.ext@siemensgamesa.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Feb 2022 02:37:13 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7061

On Wed, Feb 16, 2022 at 12:31 AM Kasper <kasper@krinvent.dk> wrote:
>
> From: Kasper Revsbech <kasper.revsbech.ext@siemensgamesa.com>
>
> Change bb.error to bb.note when getting config and arch of target/host
> as it is not an error if arch is not supported that should flag when
> parsing the recipe.
> It is an error if trying to include in image and that is already handled
> in COMPATIBLE_HOST
>
> Signed-off-by: Kasper Revsbech <kasper.revsbech.ext@siemensgamesa.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  recipes-extended/xvisor/xvisor-configs.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-extended/xvisor/xvisor-configs.inc b/recipes-extended/xvisor/xvisor-configs.inc
> index f53bba2..cd873cb 100644
> --- a/recipes-extended/xvisor/xvisor-configs.inc
> +++ b/recipes-extended/xvisor/xvisor-configs.inc
> @@ -9,7 +9,7 @@ def get_oemake_config(a, d):
>      elif re.match('riscv32(eb|)$', a):        return 'generic-32b-defconfig'
>      elif re.match('riscv64(eb|)$', a):        return 'generic-64b-defconfig'
>      else:
> -        bb.error("cannot map '%s' to a Xvisor defconfig" % a)
> +        bb.note("cannot map '%s' to a Xvisor defconfig" % a)
>
>  def map_xvisor_arch(a, d):
>      import re
> @@ -22,4 +22,4 @@ def map_xvisor_arch(a, d):
>      elif re.match('aarch64_be_ilp32$', a):      return 'arm'
>      elif re.match('riscv(32|64|)(eb|)$', a):    return 'riscv'
>      else:
> -        bb.error("cannot map '%s' to a Xvisor architecture" % a)
> +        bb.note("cannot map '%s' to a Xvisor architecture" % a)
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7060): https://lists.yoctoproject.org/g/meta-virtualization/message/7060
> Mute This Topic: https://lists.yoctoproject.org/mt/89161541/3619028
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [alistair23@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

