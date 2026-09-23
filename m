Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427E4C98304
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 16:10:56 +0000 (UTC)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1550.1790179850313649000
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 09:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=h0t8nfMC;
 spf=pass (domain: gmail.com, ip: 74.125.227.12, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-7856441f7dcso487677137.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Sep 2026 09:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790179849; x=1790784649; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=h0t8nfMCIgpOcEgRHTgtGwopu1XaH4/W93WW5H5BDOKhmmiiG4dXbbR/evgFCHfs0f
         2kUHhu0jDw7mfDFIfh3Qt2N5VpG1N2+ua4Cpdd7tarnEFg85TFwgk/VTNfVcd75y3XjH
         UwB9yWb0nWEmPAEH4p1sjvrKKTmMUoHJK4moasxtir0kNLuL5xjF336qGR3kwVSC3DpW
         VXfp5WJid/tTkWaFjce78tnbgV82vJUCidHOSK9dOo9mhdp6EcStduNDZF+PUuFEz47K
         TvGSuv5XO63Zv3BZJXzMdhBhBUDJjrKVCoOfTdCg5gCvPTY+iec75mWchr0PTxbKgGMp
         kJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179849; x=1790784649;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=BxUmrHydMQf42171QyiObxlVm5+iIlkmL+Lo5TxMU35vzkKpAgZNqLrwbYrgkAmIsk
         9gUNB5HvCj7lESWxaTCWCd0L6tVG2ArIIqc5jwGrnJi2qEZaTd+NJbC2ZFLJdMAw5nGr
         WOCn4hULxNQRwBPPIYVqkL/m7XCyKlm2EUdoOPDR8Synr8NQ68b2RdJP3G6K378So6as
         V8N/y8VoaMHkkV6TwDJvdiRtxuvVQ+6GLqITHScsCUJOCXSuui8kCepEZa9FzWQ0zGXY
         BoUsntTloQXP9xxOV//ExWo1mkf79xX6uQKCldfYEiPU7F5XUutm8p52WBd3/hvFyiaM
         xiUA==
X-Gm-Message-State: AFuF++nTn2ck2sUmRtnkucGOdxQlCpZcm7U9RKW5Ng6+cOQ2zZ0PESsd
	67MbXRGhNjLg924cLy2wVDgQIIa9L6eHAzHAyv+xm3K1QrPwxmIJ0GpIjUw9SJTah8A=
X-Gm-Gg: AYBFou1d91jYw8f2Q8r9IaFT5GztCADS71qw5JwY6MJimssbJS0eqDcu+cW5v0w02vN
	vJ6QSzIjddo3B0QoNYm/2Fvb8OU/Aknn0ihjFNTEtJ+qSyGXOxJ5YFlWbQ3ng6Qn50ovGeEFHvh
	WE6YHJvn4lB48SrQwcCMSBmGSaGXyDvlM5MnZi/9z0jyOm1VnnSV4u2MV48bItktIk+7vW+Np7k
	kIF7crIlElQz2BX437fLRY+/tavmMHJWE33WUvXyRF+B9q0+yRwT4rilFL9tBDI3BSZLkJQck+7
	F29BTFY2NBvOU4uwe3s7GPo4fumydCwYNQhb1zpxgGZ/t6RQi4Nes8h1+ak5l0kGNVNsxIVl8aY
	XED82LoYin1+8/nzcLtfSTMcvpHlQyGY8Ex0xQq8JiVtBzj/diPIoq3A2UGlIR/KcrsVbQOknfU
	GmriN1PV3ib9a1O6lg3xteZ9U7Rk85id5DHplR5W8LjDwj5sUKREtpcmom5aCQlJe7QQo+vJdeG
	xnja7DLjCmk4ROOcQoA9Tx7EgVtLTf8CRzc0skyoxCOo4HQsYGcQ5+4qCbgbPpTfGVElGM6cPJh
	T2ENXfzzG+/CJdK5t2euspFgVRqZ0v0Pmnpfoyjv0nt8MNYRjPdYl/ohdMPp5TSdZXtCYG0=
X-Received: by 2002:a05:6102:a158:b0:7ae:c2ca:906 with SMTP id ada2fe7eead31-7aec2ca1672mr539734137.13.1790179849061;
        Wed, 23 Sep 2026 09:10:49 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ca0c1e9afbsm2233708e0c.10.2026.09.23.09.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:10:47 -0700 (PDT)
Message-ID: <6ab3fa07.3cdf688e.1f27f5.f6d8@mx.google.com>
Date: Wed, 23 Sep 2026 09:10:47 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: royzah@gmail.com
Subject: Re: [meta-virtualization][PATCH v2] crun: honour CRUN_AS_RUNC
In-Reply-To: <20260919183956.1795771-1-royzah@gmail.com>
References: <20260919173559.1598000-1-royzah@gmail.com>
 <20260919183956.1795771-1-royzah@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Sep 2026 16:10:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10092

merged

Bruce

