Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C51C54F54
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 17:09:27 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1306.1785258560709006923
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 10:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Vfg+YAF7;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7466771f1caso15553137.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 10:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785258560; x=1785863360; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=Vfg+YAF70/ChRUCf5G6bqLYqpoU64xba+TINndnV0mKdFl+m7Y4p9EESECiIg8rths
         N9O0maMwGHoUMOcEwyuEjQD69c163x/+PjqDON39JScjgecX35mPHlBbBE7aZkjGXzr0
         mKrPtXmV3085Be5FQgphXclOZDKNPiTxIk2WS/MrpIc6JsBxC4ywz0FLmCX7V4ItAKRx
         DCacmkA0O2QhBFGi6zBS+V7BZnabwM9bPVzBf0JRaBFZojMOkxHsOaLHl1Z2wvqEXppy
         ZOtcR+P02jhw3PsDhxswm86D4A/7PDhqBouu+c3t4apu6OIpFZQLAOFDRPPhFEbyBh8i
         MErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785258560; x=1785863360;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=filn/mXfUUUQzpOBYTcTFqUJgP7cQSel+9hLKVmPbTuJncPr+F6KxnetUA1zfiUDog
         MfT9Cg4DuwE2jISoVqM7XvQMb/fjKX1d6sswpMJ3f6lLwuEre/1OPiySi/YHRIdOOgZK
         I6bSK/wZsBY3kHikb+gT/iFZk0c7SOxhKC6BVLT50KYZwVuncZnujZpK27nrQvg0vgzv
         nDx4+j5OIY9Ix2EM2nSEcTyyYGlGJXLaF20TJtgeal4KD+8wOr9ZE9bD+MlIhM4j7ChI
         KnrGVBTmaDmWvoh0N9VvN8AQRilvZhxsbupKinVecYBr0px/4gJO05UPpQWb8wvwXhws
         O3KA==
X-Gm-Message-State: AOJu0Yw9C8K/a4bb6TU9RzqOEqNucnmlH2+tlURP4I5L9f3/rh0ov9d+
	zGJ4+6szvSEvpBnwikaJ1eZ89kP5/V1pD12EOORnQp9VHW32bKIkNHOt37AUt8M3
X-Gm-Gg: AR+sD1029ULKVyDgj7An83M61rTcFN9rTihoxtrSmHg9EBB5zNcAnJNJ11LSmzp736E
	R7OnDjx2nqwi/jE1O9T3KtkyM+irLUDew63gByAb03G08boPWR7LFWiFfSdRN6nGf90sLjA5pus
	uy/GSocJnHC19G1vfkg+eE4Yh/nlgQQc1/CUs2W0492o6/KJi33WkLA8o87KoLWVjzILm7zJH63
	3TDn8rIbbb04ee2cZTQrGyN2xu8pplj2W7Y/HqtNwMS0xi4CPMgWQTOzdJKMnXnbm/HylNBWD6D
	Fe0uQqE39qXD33Lr2KS6Dzg5dvTirSONaGe4R9Wse9ZujnpVee982bcbYpuGqtTswRFCcZ4uOIS
	31m0BwxPqm1oSmVaQGe7/04JYhNyOqm0QkWlmVn9rL6kygDiXaOotvhYaNp/pusG7qhnJ2iyINn
	fIVx5ShYxDX0K8wF7tYazaf9cQ+sGx/dDGzyfLO5ZUfz+eH3p9lghfkR/1UXjB+BPrFzORa+WqC
	+CrSHclDNF+fXrj2XVUlo4Nhngx1vFltCBjj933OxWvadrGWZ5mVoxxsbUvuKKJz5YMQ78Y+xVU
	4Pk=
X-Received: by 2002:a05:6102:8023:b0:737:783d:1916 with SMTP id ada2fe7eead31-7549fc60c1fmr1653373137.11.1785258559565;
        Tue, 28 Jul 2026 10:09:19 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-977b270884csm191151241.12.2026.07.28.10.09.18
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:09:18 -0700 (PDT)
Message-ID: <6a68e23e.7988b9f0.2bc973.b179@mx.google.com>
Date: Tue, 28 Jul 2026 10:09:18 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] python3-dotenv: set CVE_PRODUCT
In-Reply-To: <20260722061717.336055-1-mark.yang@lge.com>
References: <20260722061717.336055-1-mark.yang@lge.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 17:09:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9995

merged

Bruce

