Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5CDC54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 21:25:11 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22076.1785360311004306341
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Jul 2026 14:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mMVuSNUP;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cedda2ce6fso12697545ad.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Jul 2026 14:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785360310; x=1785965110; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TzOipfOhI++wiXlMXXAR/ESpraPHzI5utBCiTfdFvJ0=;
        b=mMVuSNUPH6V5ZkkIbwor1ZaZMeJpY7v2/akcZf9jRiMo/GTfDV0qSDOscA3jJUMO+m
         LFXfFHPDmGoKmy/f5oHkrzp3QLIPn0A9x8jQEz/RD8pnBp6gvXH8y4lJ67FNkdQFvemg
         Ku/zuZMHBs7JonzDaH6htZZASUa0GvT4cD+2Qawi9qpewhv+hZh0Z6PJzjfS1dRD6CS5
         Rk713IiFQu7G/SdIgqX7m9PNS0S9BHf8LDMEqIEm94ZakpzEGztX4ikueVZNwmqUn0Pz
         oiClzCJaIbMI4eq17tFbbnxowExH9jJ7thxUxL2J1dn/3xHwVO+0W8e64NyoWaAMZ9ze
         08rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785360310; x=1785965110;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TzOipfOhI++wiXlMXXAR/ESpraPHzI5utBCiTfdFvJ0=;
        b=HIhHP82ya9bWRjYBqRT1AQ/NtkfO3eEsOn7PeInwy2lEfGvUVdqsm0YxPfTL4qapPJ
         S3Bdl5b5zymQdWuy+TKs4gPs1OZejeDYNa9jMBA4VUXSvKqAUxhf64gXF0ziynK7REQT
         9JkoMgmllwjM0cSozmGEfTJgW0cN9Nj1DlfjnCu3t6Z9kfur91tedw7e9+JXl9FTD91Q
         svOYkp37K2dWM+NmesuaimaNskCNBIo7eZBe6fDRlvvlvt+Tz9LG4lrzXPDTMpoh69hr
         P9FwqJ2LrSwbfIQJXvS0RaLmOyW9lDeLsF/POGKbi/dFVqZwxExkyai81G8r1fJSk0Jz
         uGEQ==
X-Gm-Message-State: AOJu0YycA1hqxz6efu1AOuBI530XhNrk8gskLIGTL4j9jZiUFIoH/XgN
	N9x5PluUoVV28QaQnaFHXH6rcm2GO0PBDP7E/ZWdcENCu2lz19P6PqiS
X-Gm-Gg: AR+sD10FCAeA/yfq2broj7vPyOymvcAKcKi1Grri2WdFMnGe12LgEE0Hb+/XkN15KHm
	4vCfXeGOK4GvR6uNygaUdoNiUicL4Fo44gvbWLpmuiaisYmPO3Hcs23RsGG4+fIu2PKY5fIeYz5
	Z6f9xAOZtrz0oUu/Z0zXx7bLaCJoPFiE3DcKZXJxtGytK2FqG+zCu18B4p6OsOzC6+oinj1zUfO
	i9oEp792t9rBZ7JQRAGsvK/UZwEScZPprBSHcmXXvudMr3oFuT0ffKBflfZbhh8BR9QqlbbxPiI
	+Ewc7w+kPav3XK4biAyLObDvxZqdGb1HeZW5Yinjd1iBbfi5TE2F+U75FuLzc7jj83eGRC/gUzR
	3ygKBgEDadpGtlsKc9LYQHxfCSCiC6UanF0it+AwaZDsSRjQ2Sm8Qvx4m64OHgjxP5KA6KOgNOm
	dr+ZOGNdw86ck5E4AJP6zz9rxkQF3kMgqFd4GaOw/eRE9xZYJFHdHdpJZUoZbEg8bEIYwB1kzUD
	aVWW54UhsXJ5m+nBf+LY6tuMGTaAbNn
X-Received: by 2002:a17:903:22c5:b0:2cc:9179:32e with SMTP id d9443c01a7336-2d035b99b2bmr202275ad.10.1785360310302;
        Wed, 29 Jul 2026 14:25:10 -0700 (PDT)
Received: from chiron.local (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bfbe23sm16283795ad.63.2026.07.29.14.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 14:25:09 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
Date: Wed, 29 Jul 2026 14:25:07 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][RFC][PATCH 1/5] vcontainer-bbmask.inc: add
 python3-pexpect,-ptyprocess
Message-ID: <bhqgv5ksj7nqtzcyfyrh5flqyoqrihl6tp7hvqhzyk2c7hmdju@6gycblijngol>
References: <20260727000247.1623785-3-tim.orling@konsulko.com>
 <6a68eb22.e28fa2c5.219bbc.346d@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a68eb22.e28fa2c5.219bbc.346d@mx.google.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Jul 2026 21:25:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10017

On Tue, Jul 28, 2026 at 10:47:14AM -0700, Bruce Ashfield wrote:
> Thanks Tim. I'm taking 2/5 through 5/5 directly (verified 2/5 against
> image-oci.bbclass — the auto-fold of OCI_LAYERS `packages:` entries
> into IMAGE_INSTALL at line ~389 is exactly the duplication this drops,
> so it's a clean removal). 3/5's added deps all trace to concrete
> failures documented in 5/5, which is a great artifact.
> 
> One question before I take this one:
> 
> The commit says python3-pexpect is needed "during run-time testing
> with the bitbake-setup workflow." What in the built container actually

This was a mistake on my part, not capturing the original reason.

It was a build-time error satisfying the RDEPENDS for
packagegroup-yocto-build-extras which I am fairly certain you added
because you were trying to satisfy "Build Host Packages" [1] or
similar.

Ignoring the yocto-docs history, looking purely at openembedded-core
the only place I found an obvious import is in the SerialConnection
class in [2]. However, for a fully functional container-yocto-builder
built with mc:container-* multiconfig, we would still need this.

I have updated the commit message and added a comment in v2.

I have also updated docs/container-yocto-builder.md to better reflect
this reason and will also send a v2 for that patch.

> imports/exec's pexpect at runtime? If it's the vcontainer test suite
> driving the container from outside, pexpect belongs on the test host,
> not baked into the image. If it's something inside the container —
> bitbake-setup itself, a Yocto tool, or a test harness that runs
> in-container — that's legitimate, but a one-line note in the commit
> message naming the caller would help future readers understand why
> we're carving a hole in the meta-python mask.
> 
> If it's just needed for our own vcontainer test runner and not by
> anything the container itself invokes, I'd rather leave the meta-python
> mask intact and put pexpect on the host that runs the tests.
> 
> Bruce
> 

[1] https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#build-host-packages
[2] https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/core/target/serial.py#n258

