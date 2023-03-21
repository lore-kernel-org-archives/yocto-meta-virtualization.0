Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04B7C761AF
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 12:38:06 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.11712.1679402279320226827
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 05:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aXzuE5sM;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id s7so8027218ilv.12
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Mar 2023 05:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679402278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QUChWM6964TGx5uAo4GLezcc1rOC5Y+uMGLuj8lEWU=;
        b=aXzuE5sMciJakU6kmm2y2FRL3HtskgOI1hvYt8i52wdEGqRLWKi3oqDVS0hYargGls
         Rfjgv2HV9AWuly45tTqAW9OGNayHy9CxhGlG7lDkPIZc5eyNtBA97sIV2sffQ9G1D0ih
         6+8aJ9Z7v1x8ylUERLkpE6C2FKj3Ljcdvv9nDXUGFHuX+8d342vcNAsJIDavtNH4x2UB
         G6e29M1S2r4Bqw0D6avRZgkA/yK0Irs1n6TW6Jcz1iyK50gPI67ML43AxBwyXaxid4zj
         7uRIOzQxyHjYc2LvQfbEyM5lbWVAGcJUSHCb3gXFjWjGedsNVptkiuxxA5ePCNFBYWGn
         548w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679402278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5QUChWM6964TGx5uAo4GLezcc1rOC5Y+uMGLuj8lEWU=;
        b=xgws0Us3ud6Qa7+GJ/Zb+15Co7wG7pkXhv9Z5Q4vYOtJ8E6AjUw/B0+w6v3FQWCu+J
         WP84ia/fmeElomCNVUI+D94L3i6wy+U8vrH5z/GbPnxgNi/t+hoxK7E7YvXVi6dAKC9l
         HLM2xYdsqkKVzcB5Q4ysJhO21AQ3hCe49bdocjHDhldofI2QRNBOVtEIYwoXDNC9IF1F
         qmslu85vB4VPBcokaZ97ZxlE9kVfj4NXBB7eWmm67Ne1DUvNyhV4Wui7DI7oe1ItYDI3
         dKE7NgyDKQS24osCSEJru0DEn8s0sH33NmLsJQr/UJoJGXl2o9vM3kbZnwd7tcKmIeQC
         CSSw==
X-Gm-Message-State: AO0yUKUeuI5IGPCYDFLLQSMBlCpxQnXhnSZQkEPD67P2aLRRSOZhSrYD
	SNcYZzBeObaelpy4e5hZPijsTfLyrzsEVnqBmBc=
X-Google-Smtp-Source: AK7set+mlGYC78Gcv2hklQQDL4TltQrj0NvDNaFz8Yc1ZXhS4/491K9WPW4Cgrv9qni6PdNv/SKcofFBCylr1tipNNE=
X-Received: by 2002:a05:6e02:1041:b0:325:a860:84ce with SMTP id
 p1-20020a056e02104100b00325a86084cemr834196ilj.5.1679402278490; Tue, 21 Mar
 2023 05:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAEJU13K2p0aVdy5OY1pASDxC5_HLx1VAZE3m+eGxx5A5tRLNMA@mail.gmail.com>
In-Reply-To: <CAEJU13K2p0aVdy5OY1pASDxC5_HLx1VAZE3m+eGxx5A5tRLNMA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 21 Mar 2023 08:37:50 -0400
Message-ID: <CADkTA4OPjdFj4uxwvF5faxEr908DtvDWboBHFMPZO5GQbhYUpA@mail.gmail.com>
Subject: Re: busybox_1.36.0.bb doesn't exist
To: Ze Zhang <zhangze.linux@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Mar 2023 12:38:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7951

This is a bump that I do everytime OE core updates their busybox, I'm
just completing some runtime tests and should have it pushed today.

Bruce

On Mon, Mar 20, 2023 at 10:29=E2=80=AFPM Ze Zhang <zhangze.linux@gmail.com>=
 wrote:
>
>
> HI,
>
> in this file meta-virtualization/tree/master/recipes-core/busybox)/busybo=
x-initrd_1.36.0.bb
>
> busybox-initrd_1.36.0.bb should not include busybox_${PV}.bb, because bus=
ybox_1.36.0.bb doesn't exist.
>
> require recipes-core/busybox/busybox_${PV}.bb
>
>
>
> https://github.com/lgirdk/meta-virtualization/issues/6



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

