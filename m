Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3378C54F54
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 17:47:19 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2141.1785260836400919759
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 10:47:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YApyRwdq;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6ab0223a3d3so79260eaf.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 10:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785260835; x=1785865635; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+BRYCMC3yGzJo+aqJRsAmxag9L2lglhO/LqPbF2nDHg=;
        b=YApyRwdqRlg8MR6qURMU8Rt94YT+WPlPUDhbry3gkYHxI6gKlToaiXAF7G5/wDWPPD
         WvvoKQ7oh17YmGsRSye3Fh0wa3r161ch+xR/zUZOBuajAoOSSSUB4B/ecE7ZuEV2lgBo
         4V4WTP2uRyA1vYRpa5m2bY4Jv6Er2gLXDKefe4Zo7xTpFS4vLWXFnaUuNHOorTZwcJix
         9XpTbobhuVmEYIPU3kpZ4wqbAf4g3mU0wmZZI1K7w3VLQy0J8veW/ZR8XzKhvfkFbIeF
         fM/zwITK39KxXi240v1Tn5BhErUtl1tBb3L7TZRPBWcZFz1mVy0KJXeyfGZapgSpQROV
         3q4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260835; x=1785865635;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+BRYCMC3yGzJo+aqJRsAmxag9L2lglhO/LqPbF2nDHg=;
        b=I7dPVdi60M8OzONPN+YvStklgrDKGfOrOmWwvjxsCdsJvs+C1/A2Pd02kCNsBZp8nn
         CZtH7M3d0bjFz7j//+OhPLY0H8iZpbWeHfenDgyit95Gsow5shsrF6dNcs9gbTdqQOuF
         beXY9+0i6F7XBdmo/1QkcBKhj7VXY8R1/KkI5eN1QfjnvfuRIqsaEGua8nErNYmcLxUC
         02X7w/TR/JnwqoDuL33ERf/vvm7mBKQeOBOvzsJKhf4hRFrmfLoM2xv3ftfI+p+vH/t6
         fsnMCmIbBPNIMczBlXy0Y74PT36Kj38LVJ9+a8JC1I3KMQPgZdUbCqgNzfEhoZrTlTSI
         FzbA==
X-Gm-Message-State: AOJu0Yz0mPEVVYC5N7xvUzp5R5l39jLy2lp241vtCkl/mIHM2QlxmdWb
	1VoUHOCGdaHxBDVYWhR/Cjh+xJCGFW5I5dzblktCoyO/c7Y06qQEeCJG3sSvs5KJ
X-Gm-Gg: AR+sD13/kVjJ/RZK1fBoHAA1+nSptJV14c7ZPGjZLCnKFIZsMgGFZvvB+Ts6/ye5VLj
	Tv8rgkOtPY0sywfJE7OrWrxpxkpy3CtkXGjlkXZlffK3mnoGlC/yfBMTWfehuD0xYg0IltXX+mK
	KJ3HQbj/CnIdDq5t6Sl7vjvH8eOG/m7RO0jHIzjU0lKdScYR4z8sPEVpp+1k1DwZaJK3N2oQn+q
	q7VkDy5pgrE6EZrdw3qI/BV+X8JFEdeTo445V7BLwSRbU91aQuLogPL+uNtiWUf/wc5I7YDNq6I
	7UyfYSlTrwVTGLM5wYpY+golTKnjOBoAs5r/bhXP7IcD5gLvGeaiy5I/+Bgqm/brkJnBpeFPNyI
	6SDpexLURdZM++G1a7Xccgx6TJNJEtukL1XxCjoAOPeRpfpzxgw2KWEJjdUCClNV16X9+xFgyNx
	EQH9CAMwU8+wqare3jYBeWPEctHq0HPkyE0WRDSLEhfkigFq4vqzI+PMP5sY41y/GKiSLTMqCwT
	ZvNHgtKXOL5WOtcsKXjJiySzN0TQDZWTwLFarTicR0fCSdg+Ez43DfuRabgdKShKkmf6lmra+Qm
	imJ7rnoGtg+7pw==
X-Received: by 2002:a05:6820:160a:b0:6aa:dde4:6465 with SMTP id 006d021491bc7-6ac96a7f1f8mr1754081eaf.7.1785260835436;
        Tue, 28 Jul 2026 10:47:15 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458868fb23dsm515099fac.16.2026.07.28.10.47.14
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:47:14 -0700 (PDT)
Message-ID: <6a68eb22.e28fa2c5.219bbc.346d@mx.google.com>
Date: Tue, 28 Jul 2026 10:47:14 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][RFC][PATCH 1/5] vcontainer-bbmask.inc: add
 python3-pexpect,-ptyprocess
In-Reply-To: <20260727000247.1623785-3-tim.orling@konsulko.com>
References: <20260727000247.1623785-3-tim.orling@konsulko.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 17:47:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10007

Thanks Tim. I'm taking 2/5 through 5/5 directly (verified 2/5 against
image-oci.bbclass — the auto-fold of OCI_LAYERS `packages:` entries
into IMAGE_INSTALL at line ~389 is exactly the duplication this drops,
so it's a clean removal). 3/5's added deps all trace to concrete
failures documented in 5/5, which is a great artifact.

One question before I take this one:

The commit says python3-pexpect is needed "during run-time testing
with the bitbake-setup workflow." What in the built container actually
imports/exec's pexpect at runtime? If it's the vcontainer test suite
driving the container from outside, pexpect belongs on the test host,
not baked into the image. If it's something inside the container —
bitbake-setup itself, a Yocto tool, or a test harness that runs
in-container — that's legitimate, but a one-line note in the commit
message naming the caller would help future readers understand why
we're carving a hole in the meta-python mask.

If it's just needed for our own vcontainer test runner and not by
anything the container itself invokes, I'd rather leave the meta-python
mask intact and put pexpect on the host that runs the tests.

Bruce

