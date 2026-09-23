Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41606C98304
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 16:11:06 +0000 (UTC)
Received: from mail-vs2-f13.google.com (mail-vs2-f13.google.com [74.125.227.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1555.1790179856358139442
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 09:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qjenvM+o;
 spf=pass (domain: gmail.com, ip: 74.125.227.13, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs2-f13.google.com with SMTP id ada2fe7eead31-795a0ab5227so442170137.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Sep 2026 09:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790179855; x=1790784655; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=qjenvM+oN4FfRekgrFAIvFmFAiqjD364tTbuRn6DYScPTa3jPi24K8Ud8gX15jl0IY
         AYwW9qOomEIBVtcrEWrSWv+Sj6n0jpvxDIix5AQVBXw5PVYK82eqWrzrAP+zi4AXGH3T
         WG/31oNLCtvdZz6K7hhNyoLbtFeNdxwtEZbTAtN9TW04hehbQBvi4T6gEJ5a2sHC1dBF
         71QZlBzO55puodmtG1ucWBv4x2axyvdC7OkTY64B5N3DBZ1cMsRl5bT34W0VdVHFTJfn
         1B3T6mvFy/QQ7YPvBPnckUTHRsBmIHDWNJredE/OHyMP/6RacAfMaPc2/uXJGUSMLy/o
         jVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179855; x=1790784655;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=SF24i5t8i5AXfZ1MjRXzNiiEqQuLlUA94/kX3x8m2oCuMiUtTd54kTmMzBiHYVR+AT
         ZUHzZ96Nj1e071X/0afvGqPSW2DqVh35idh0Rdh3DomyanQJnw/o4pEmeKFFtNYv7kCV
         ebkIKZj2peFVtDMJ5TaE7X/LjWnGpYLLaRUVOgKlYkRzcXxT0dNSafX65wgiHF3wFm4A
         UxOkDhXbCfJiCsTVmtT8jBYPNIkvtNhESMSj5hi2zAgYg+R/1dDAFTada6cnepML7ZsA
         yaJP6dCE6GjvZBvy6lvuit9XNof6SSV/FTaGDDuIM7A6q0jt2qhQTKnaFgKsEcbb3hyx
         yQZA==
X-Gm-Message-State: AFuF++nM+demej44OU13JAI1YnHjAkwqZXCS9EAOm8ZNWVUxjSsY0TrE
	iWS+hNNt/HPwM7ON4nPnZ1ia+GLPrR2xBqYtR/p4UXGcFOvxbmT23UhaAHKgKEl3ErM=
X-Gm-Gg: AYBFou0uPxzHm9T8J3fFv/gIQLo0tEnzFaIqEpLaN+ZXTG2BwWHW3tOa/OPUM4T0Mf/
	sZVbccL4RIvRirVylOTTAqqO/5pSD6B45qz0Q9OdaIMfwq6FKLYGJ1EMYMI61SomZhblBNcu97j
	+XWWKJwxQbrgzqkolDc+HIRPGuccViHxbG7Rn41VEkdslB+lYRzeF1kTnrJunbblKTig7vC3etC
	MDWIUvrhBxMYldisUgBvHQv2P5HfpTI4Znck6u9rQSlZ6xP3RoAwWi6eaw3ccwDQBn9OkEliPUV
	9UZIxY/u5UrkA7W6dQnYBuFr/ZUvsT8D93wrb8X1cUYX8MtUftb6cn+O6saxJJ7CxzXBb/EFyNv
	r14C+2sPlo6AkCuSUPxMCL5/s4Q+vpQe16S1ZOk8WPzSTSmT8hlinDr3yvAzUAjt3bPGFWLNrjX
	i2J6zjIObCLn4jktgaJoInDshdhT+7OiBkRZJUxxTMUj8fLUOIXYMbAuYKVrfNJShLNna4R/sde
	SOesFVIHeGk0o9RIN71npx1ZgoBKQn/R/Hx7TBXgW0tg+ByjjcK37+etvASFyGi5cKht+G8/IiD
	2vs+Pzdfu/56GAYiEXpBdHTg4NBXUwVnHYeh/4Jc/lEqSWHPlbutcKgiH5I1M7svMbUU2bYrTFH
	bF62f4kc=
X-Received: by 2002:a05:6102:4b0a:b0:7a5:e455:1823 with SMTP id ada2fe7eead31-7ac1d4f39fdmr2899168137.27.1790179855046;
        Wed, 23 Sep 2026 09:10:55 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-985169f579bsm4239982241.3.2026.09.23.09.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:10:54 -0700 (PDT)
Message-ID: <6ab3fa0e.17f05609.3129b9.a281@mx.google.com>
Date: Wed, 23 Sep 2026 09:10:54 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: kaloyan.rusev@elektrobit.com
Subject: Re: [meta-virtualization][wrynose][PATCH] ankaios: add Eclipse
 Ankaios container orchestrator recipe
In-Reply-To: <20260917134911.95950-1-kaloyan.rusev@elektrobit.com>
References: <6aaaa2a3.98235939.208b75.d30f@mx.google.com>
 <20260917134911.95950-1-kaloyan.rusev@elektrobit.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Sep 2026 16:11:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10095

merged

Bruce

