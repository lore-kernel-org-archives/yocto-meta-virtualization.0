Return-Path: <pauloasherring@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E92C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 10:33:34 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.8270.1647945213173543161
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 03:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZvGwwR5X;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: pauloasherring@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id u3so23422928ljd.0
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 03:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=YyhuUq6I1u0GAGCZNKknLOKjtsxAImDcLFVz+w9mag0=;
        b=ZvGwwR5XRGqoNxtE1a452bjSdPkQz1SQgtkSGSyxGhtmsMQagyIdRogSE3JjY/anvp
         /FJYX1irD1C6fo09U/hsnH8F8Qr21ojep4/FPpdl66W0Dhhe3sn2eO06jE02/Yij4md4
         iWPJS+IBxNL7NyiLBMVDA/B3ulqg/2Nf9c6fiEl8s6NFXuG9MLCrVYBKJOG+LgZwXrb3
         X8Ts1FCqxXB0RJ8dhyE2u4urihbk5BtdRqkN7e6bDXA8bODkZEP7ez1YT4tlNf41WY1c
         J4yr9NROBEscPjbmZDsdOO8jV7KmlJ+9ddTBsyqsjQZUa9B3PYdEDK6g3BWhEG537XAu
         w9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=YyhuUq6I1u0GAGCZNKknLOKjtsxAImDcLFVz+w9mag0=;
        b=cZOn1qsKb2k61Hv/6NT02S3vc0ofm1VhT7ysqhVIfHgXSM5GrioQrptJLvSDMEblIH
         8F6dct9kAaCiPlgsSd30S4d+xTo0RYHhemMur8v4N+DJlWRbx4bTFrLb3fmx4AZTfFuA
         5sOBwjsp0DjNcLlf1ypjSg0i2KOr46NsCo8HD9G5zfGA7OilHGu54uieBKB27pKYdnsM
         0THcIu27f4NV13VFQ6aKzcnBQE7QxF9e+4wz7wfVJwWyPYSWfsKWaGq7jPfCUZY7/ctT
         4SqLpYwlkf2HhkABn0b4tcZv56u5hLrJai5QUUDJSuBmzErHm0S4KxrfgLSGQNtshJVT
         +6iw==
X-Gm-Message-State: AOAM530eiW10uHNtNfYKWhIzkmharXfKUprH3vgmVKYd6ixy5wb2u1kW
	vbambLH5nkMih4YmF3rbkbY1k+uGtMCc3W2LY+H858dgiZk=
X-Google-Smtp-Source: 
 ABdhPJx5WCcX0Q/OnhoJ7PpcKzIaRC37Oq2xmHTTWmtnAmkPNdBe+NtVdFdYvseJKp0QW9baB3ZStdYAUGZ6qbn6kCg=
X-Received: by 2002:a2e:900a:0:b0:246:17bb:a771 with SMTP id
 h10-20020a2e900a000000b0024617bba771mr18734486ljg.363.1647945210151; Tue, 22
 Mar 2022 03:33:30 -0700 (PDT)
MIME-Version: 1.0
From: Paulo Sherring <pauloasherring@gmail.com>
Date: Tue, 22 Mar 2022 10:33:19 +0000
Message-ID: 
 <CAG9RwPKYyH0QQGoN3E+x_J66C1jsNdNm3CbfBAJHO=U24QXC3Q@mail.gmail.com>
Subject: Loading the module xen-gntdev on boot
To: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Mar 2022 10:33:34 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7095

Hello all,
I am a bit new to meta-virtualization and to the Xen project And to
virtualizations, so please bear with me :)
I've been trying to make use of the xen project, currently targeting
qemu (and later on, rpi4). After messing around, I was able to boot
dom0 and a domU.
But, I had to add the xen-gntdev to the `modules-load.d,` because
`xenstored` was failing to start, due to some missing connection,
probably brought up by xen-gntdev module.

As I am new to all this, I was just wondering if this is by design, or
this is an issue (and therefore, I should/could submit a patch).

Kind regards, Paulo

